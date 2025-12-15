codeunit 70100 "STR Delivery & Pickup Mgt."
{

    // [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", 'OnBeforeSalesShptHeaderInsert', '', false, false)]
    // local procedure PostSalesshipDoc(var SalesShptHeader: Record "Sales Shipment Header"; SalesHeader: Record "Sales Header")
    // begin
    //     //if SalesShptHdr."No." = '' then exit;v
    //     Salesetup.GET;
    //     IF Salesetup."STR Delivery Document Nos." = '' THEN
    //         exit;

    //     if SalesHeader."STR Delivery Document No." = '' then begin
    //         SalesHeader."STR Delivery Document No." := GetNextDeliveryDocumentNo();
    //         SalesHeader.Modify();
    //     end;

    //     SalesShptHeader."STR Delivery Document No." := SalesHeader."STR Delivery Document No.";
    //     //SalesShptHeader.Modify();
    // end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", OnBeforeSalesShptHeaderInsert, '', false, false)]
    local procedure CheckDelDocInsalesShipDoc(var SalesShptHeader: Record "Sales Shipment Header"; SalesHeader: Record "Sales Header")
    var
        lvSalesShptHeader: Record "Sales Shipment Header";
    begin
        Salesetup.GET;
        IF Salesetup."STR Delivery Document Nos." = '' THEN
            exit;
        lvSalesShptHeader.Reset();
        lvSalesShptHeader.SetRange("STR Delivery Document No.", SalesHeader."STR Delivery Document No.");
        IF lvSalesShptHeader.FindFirst() THEN
            ERROR('A Sales Shipment with the same Delivery Document No. %1 already exists.Please generate the new number', SalesHeader."STR Delivery Document No.");
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Purch.-Post", OnBeforePurchRcptHeaderInsert, '', false, false)]
    local procedure CheckReq_DelDocNoinPostedRec(var PurchRcptHeader: Record "Purch. Rcpt. Header"; PurchaseHeader: Record "Purchase Header")
    var
        lvPurchRcptHeader: Record "Purch. Rcpt. Header";
    begin
        //if PurchRcptHdr."No." = '' then exit;
        Purchsetup.GET;

        IF (Purchsetup."STR Delivery Document Nos." = '') AND (Purchsetup."STR Pickup Request Nos." = '') THEN
            exit;
        lvPurchRcptHeader.Reset();
        lvPurchRcptHeader.SetRange("STR Delivery Document No.", PurchaseHeader."STR Delivery Document No.");
        lvPurchRcptHeader.SetRange("STR Pickup Request No.", PurchaseHeader."STR Pickup Request No.");
        IF lvPurchRcptHeader.FindFirst() THEN
            ERROR('A Purchase Receipt with the same Pickup Request No. %1 and Delivery Document No. %2 already exists.Please generate the new numbers', PurchaseHeader."STR Pickup Request No.", PurchaseHeader."STR Delivery Document No.");
    end;


    procedure GeneratePickReqNo_DelDocNo(var PurchaseHeader: Record "Purchase Header")
    begin
        Purchsetup.GET;
        IF (Purchsetup."STR Delivery Document Nos." = '') AND (Purchsetup."STR Pickup Request Nos." = '') THEN
            exit;
        PurchaseHeader."STR Pickup Request No." := GetNextPickupRequestNo();
        PurchaseHeader."STR Delivery Document No." := GetNextDeliveryDocumentNoPurch();
        PurchaseHeader.Modify();
    end;

    procedure GetNextDeliveryDocumentNo(): Code[20]
    var
        NoSeriesMgt: Codeunit "No. Series";
    begin
        SaleSetup.Get();
        SaleSetup.TestField("STR Delivery Document Nos.");
        exit(NoSeriesMgt.GetNextNo(SaleSetup."STR Delivery Document Nos.", Today, true));
    end;

    procedure GetNextDeliveryDocumentNoPurch(): Code[20]
    var
        NoSeriesMgt: Codeunit "No. Series";
    begin
        PurchSetup.Get();
        PurchSetup.TestField("STR Delivery Document Nos.");
        exit(NoSeriesMgt.GetNextNo(PurchSetup."STR Delivery Document Nos.", Today, true));
    end;

    local procedure GetNextPickupRequestNo(): Code[20]
    var
        NoSeriesMgt: Codeunit "No. Series";
    begin
        PurchSetup.Get();
        PurchSetup.TestField("STR Pickup Request Nos.");
        exit(NoSeriesMgt.GetNextNo(PurchSetup."STR Pickup Request Nos.", Today, true));
    end;

    var
        Salesetup: Record "Sales & Receivables Setup";
        Purchsetup: Record "Purchases & Payables Setup";
}
