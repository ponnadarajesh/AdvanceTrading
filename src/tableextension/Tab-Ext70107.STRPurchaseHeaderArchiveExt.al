// TableExtension 70107: Purchase Header Archive Ext
tableextension 70107 "STRPurchase Header Archive Ext" extends "Purchase Header Archive"
{
    fields
    {
        field(70100; "STR Pickup Request No."; Code[20])
        {
            Caption = 'Pickup Request No.';
            Editable = false;
        }
        field(70101; "STR Delivery Document No."; Code[20])
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
