pageextension 50109 KWATSalesOrderExtList extends "Sales Order List"
{
    layout
    {
        addafter("Sell-to Customer Name")
        {
            field("KWAT_Ready to Invoice"; Rec."KWAT_Ready to Invoice")
            {
                ApplicationArea = All;
                Caption = 'Ready to Invoice';
                Editable = false;
            }
            field(TraderCode; Rec."KWAT_Trader Code")
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
        Clear(Qty);
        Clear(UnitPrice);
        SalesLine.SetRange("Document Type", Rec."Document Type");
        SalesLine.SetRange("Document No.", Rec."No.");
        if SalesLine.FindFirst() then begin
            Qty := SalesLine.Quantity;
            UnitPrice := SalesLine."Unit Price";
        end;
    end;

    var
        Qty: Decimal;
        UnitPrice: Decimal;
        SalesLine: Record "Sales Line";
}
