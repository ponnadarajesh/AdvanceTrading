tableextension 50109 KWATSalesArchLineExt extends "Sales Line Archive"
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
