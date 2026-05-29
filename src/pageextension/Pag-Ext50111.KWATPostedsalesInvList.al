pageextension 50111 NXOPostedSalesInvList extends "Posted Sales Invoices"
{
    layout
    {
        addlast(Control1)
        {
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
            field(LineAmount; LineAmount)
            {
                ApplicationArea = All;
                Caption = 'Line Amount';
                Editable = false;
            }
        }
        addafter("Document Date")
        {
            field(TraderCode; Rec."KWAT_Trader Code")
            {
                ApplicationArea = All;
                Caption = 'Trader Code';
                Editable = false;
            }
        }
    }

    trigger OnAfterGetRecord()
    var
        SalesInvLine: Record "Sales Invoice Line";
    begin
        Clear(Qty);
        Clear(UnitPrice);
        Clear(LineAmount);
        SalesInvLine.SetRange("Document No.", Rec."No.");
        if SalesInvLine.FindFirst() then begin
            Qty := SalesInvLine.Quantity;
            UnitPrice := SalesInvLine."Unit Price";
            LineAmount := SalesInvLine."Line Amount";
        end;
    end;

    var
        Qty: Decimal;
        UnitPrice: Decimal;
        LineAmount: Decimal;
        TraderCode: Code[20];
}
