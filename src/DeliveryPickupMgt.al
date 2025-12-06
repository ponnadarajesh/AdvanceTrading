codeunit 70100 "Delivery & Pickup Mgt."
{
    SingleInstance = true;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", 'OnAfterPostSalesDoc', '', false, false)]
    local procedure OnAfterPostSalesDoc(var SalesHeader: Record "Sales Header"; var GenJnlPostLine: Codeunit "Gen. Jnl.-Post Line"; SalesShptHdr: Record "Sales Shipment Header")
    begin
        if SalesShptHdr."No." = '' then exit;

        if SalesHeader."Delivery Document No." = '' then begin
            SalesHeader."Delivery Document No." := GetNextDeliveryDocumentNo();
            SalesHeader.Modify();
        end;

        SalesShptHdr."Delivery Document No." := SalesHeader."Delivery Document No.";
        SalesShptHdr.Modify();
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Purch.-Post", 'OnAfterPostPurchaseDoc', '', false, false)]
    local procedure OnAfterPostPurchaseDoc(var PurchaseHeader: Record "Purchase Header"; var PurchRcptHdr: Record "Purch. Rcpt. Header")
    begin
        if PurchRcptHdr."No." = '' then exit;

        if PurchaseHeader."Pickup Request No." = '' then begin
            PurchaseHeader."Pickup Request No." := GetNextPickupRequestNo();
            PurchaseHeader.Modify();
        end;

        if PurchaseHeader."Delivery Document No." = '' then begin
            PurchaseHeader."Delivery Document No." := GetNextDeliveryDocumentNoPurch();
            PurchaseHeader.Modify();
        end;

        PurchRcptHdr."Pickup Request No." := PurchaseHeader."Pickup Request No.";
        PurchRcptHdr."Delivery Document No." := PurchaseHeader."Delivery Document No.";
        PurchRcptHdr.Modify();
    end;

    local procedure GetNextDeliveryDocumentNo(): Code[20]
    var
        SalesSetup: Record "Sales & Receivables Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
    begin
        SalesSetup.Get();
        SalesSetup.TestField("Delivery Document Nos.");
        exit(NoSeriesMgt.GetNextNo(SalesSetup."Delivery Document Nos.", Today, true));
    end;

    local procedure GetNextDeliveryDocumentNoPurch(): Code[20]
    var
        PurchSetup: Record "Purchases & Payables Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
    begin
        PurchSetup.Get();
        PurchSetup.TestField("Delivery Document Nos.");
        exit(NoSeriesMgt.GetNextNo(PurchSetup."Delivery Document Nos.", Today, true));
    end;

    local procedure GetNextPickupRequestNo(): Code[20]
    var
        PurchSetup: Record "Purchases & Payables Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
    begin
        PurchSetup.Get();
        PurchSetup.TestField("Pickup Request Nos.");
        exit(NoSeriesMgt.GetNextNo(PurchSetup."Pickup Request Nos.", Today, true));
    end;
}
