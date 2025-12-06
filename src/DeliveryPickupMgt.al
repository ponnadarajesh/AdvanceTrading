codeunit 70100 "STR Delivery & Pickup Mgt."
{
    SingleInstance = true;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", 'OnAfterPostSalesDoc', '', false, false)]
    local procedure OnAfterPostSalesDoc(var SalesHeader: Record "Sales Header"; var GenJnlPostLine: Codeunit "Gen. Jnl.-Post Line")
    begin
        //if SalesShptHdr."No." = '' then exit;

        if SalesHeader."STR Delivery Document No." = '' then begin
            SalesHeader."STR Delivery Document No." := GetNextDeliveryDocumentNo();
            SalesHeader.Modify();
        end;

        //SalesShptHdr."Delivery Document No." := SalesHeader."Delivery Document No.";
        //SalesShptHdr.Modify();
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Purch.-Post", 'OnAfterPostPurchaseDoc', '', false, false)]
    local procedure OnAfterPostPurchaseDoc(var PurchaseHeader: Record "Purchase Header")
    begin
        //if PurchRcptHdr."No." = '' then exit;

        if PurchaseHeader."STR Pickup Request No." = '' then begin
            PurchaseHeader."STR Pickup Request No." := GetNextPickupRequestNo();
            PurchaseHeader.Modify();
        end;

        if PurchaseHeader."STR Delivery Document No." = '' then begin
            PurchaseHeader."STR Delivery Document No." := GetNextDeliveryDocumentNoPurch();
            PurchaseHeader.Modify();
        end;

        // PurchRcptHdr."Pickup Request No." := PurchaseHeader."Pickup Request No.";
        // PurchRcptHdr."Delivery Document No." := PurchaseHeader."Delivery Document No.";
        // PurchRcptHdr.Modify();
    end;

    local procedure GetNextDeliveryDocumentNo(): Code[20]
    var
        SalesSetup: Record "Sales & Receivables Setup";
        NoSeriesMgt: Codeunit "No. Series";
    begin
        SalesSetup.Get();
        SalesSetup.TestField("STR Delivery Document Nos.");
        exit(NoSeriesMgt.GetNextNo(SalesSetup."STR Delivery Document Nos.", Today, true));
    end;

    local procedure GetNextDeliveryDocumentNoPurch(): Code[20]
    var
        PurchSetup: Record "Purchases & Payables Setup";
        NoSeriesMgt: Codeunit "No. Series";
    begin
        PurchSetup.Get();
        PurchSetup.TestField("STR Delivery Document Nos.");
        exit(NoSeriesMgt.GetNextNo(PurchSetup."STR Delivery Document Nos.", Today, true));
    end;

    local procedure GetNextPickupRequestNo(): Code[20]
    var
        PurchSetup: Record "Purchases & Payables Setup";
        NoSeriesMgt: Codeunit "No. Series";
    begin
        PurchSetup.Get();
        PurchSetup.TestField("STR Pickup Request Nos.");
        exit(NoSeriesMgt.GetNextNo(PurchSetup."STR Pickup Request Nos.", Today, true));
    end;
}
