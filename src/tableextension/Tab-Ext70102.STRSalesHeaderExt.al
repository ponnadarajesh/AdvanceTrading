// TableExtension 70102: Sales Header Ext
tableextension 70102 "STR Sales Header Ext" extends "Sales Header"
{
    fields
    {
        field(70100; "STR Delivery Document No."; Code[20])
        {
            Caption = 'Delivery Document No.';
            //Editable = false;
        }
        field(70102; "STR Driver Email"; Text[100])
        {
            Caption = 'Driver Email';
        }

    }
}
