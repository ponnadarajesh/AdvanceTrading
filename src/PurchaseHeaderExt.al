// TableExtension 70104: Purchase Header Ext
tableextension 70104 "STR Purchase Header Ext" extends "Purchase Header"
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
    }
}
