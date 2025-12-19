// TableExtension 70102: Sales Header Ext
tableextension 70111 "STR Sales Header Arch Ext" extends "Sales Header Archive"
{
    fields
    {
        field(70100; "STR Delivery Document No."; Code[20])
        {
            Caption = 'Delivery Document No.';
            Editable = false;
        }
        field(70102; "STR Driver Email"; Text[100])
        {
            Caption = 'Driver Email';
        }

    }
}
