// TableExtension 70108: Purch. Cr. Memo Header Ext
tableextension 70108 "STRPurch. Cr. Memo Header Ext" extends "Purch. Cr. Memo Hdr."
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
