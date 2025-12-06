// TableExtension 70106: Purchase Invoice Header Ext
tableextension 70106 "STR PurchInv Header Ext" extends "Purch. Inv. Header"
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
