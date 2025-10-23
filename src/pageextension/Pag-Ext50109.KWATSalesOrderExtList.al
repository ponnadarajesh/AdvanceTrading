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
        }
    }

}
