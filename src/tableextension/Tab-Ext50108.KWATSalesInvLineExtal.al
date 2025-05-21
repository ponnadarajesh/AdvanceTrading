tableextension 50108 "KWATSalesInvLineExt.al" extends "Sales Invoice Line"
{
    fields
    {
        modify("Variant Code")
        {
            caption = 'Grade';
        }
        modify(Description)
        {
            Caption = 'Commodity';
        }
        modify("Unit Price")
        {
            Caption = 'Commission';
        }
    }
}
