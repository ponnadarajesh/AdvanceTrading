pageextension 50113 BankAccountLedgerExt extends "Bank Account Ledger Entries"
{
    layout
    {
        addlast(Control1)
        {
            field(TraderCode; TraderCode)
            {
                ApplicationArea = All;
                Caption = 'ATA Trader Code';
                Editable = false;
            }
            field(Qty; Qty)
            {
                ApplicationArea = All;
                Caption = 'Qty';
                Editable = false;
            }
            field(UnitPrice; UnitPrice)
            {
                ApplicationArea = All;
                Caption = 'Unit Price';
                Editable = false;
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        Clear(TraderCode);
        Clear(Qty);
        Clear(UnitPrice);
        if Rec."Document No." <> '' then
            GetDocumentValues();
    end;

    procedure GetDocumentValues()
    var
        SalesInvHeader: Record "Sales Invoice Header";
        SalesInvLine: Record "Sales Invoice Line";
        SalesCrMemoHeader: Record "Sales Cr.Memo Header";
        SalesCrMemoLine: Record "Sales Cr.Memo Line";
    begin
        if Rec."Document Type" in [Rec."Document Type"::Invoice] then begin
            if SalesInvHeader.Get(Rec."Document No.") then begin
                TraderCode := SalesInvHeader."KWAT_Trader Code";
                SalesInvLine.SetRange("Document No.", Rec."Document No.");
                if SalesInvLine.FindFirst() then begin
                    Qty := SalesInvLine.Quantity;
                    UnitPrice := SalesInvLine."Unit Price";
                end;
            end;
        end else
            if Rec."Document Type" in [Rec."Document Type"::"Credit Memo"] then begin
                if SalesCrMemoHeader.Get(Rec."Document No.") then begin
                    TraderCode := SalesCrMemoHeader."KWAT_Trader Code";
                    SalesCrMemoLine.SetRange("Document No.", Rec."Document No.");
                    if SalesCrMemoLine.FindFirst() then begin
                        Qty := SalesCrMemoLine.Quantity;
                        UnitPrice := SalesCrMemoLine."Unit Price";
                    end;
                end;
            end;
    end;

    var
        TraderCode: Code[20];
        Qty: Decimal;
        UnitPrice: Decimal;
}
