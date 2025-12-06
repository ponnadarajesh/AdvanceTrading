// TableExtension 70105: Purch. Rcpt. Header Ext
tableextension 70105 "Purch. Rcpt. Header Ext" extends "Purch. Rcpt. Header"
{
    fields
    {
        field(70100; "Pickup Request No."; Code[20])
        {
            Caption = 'Pickup Request No.';
        }
        field(70101; "Delivery Document No."; Code[20])
        {
            Caption = 'Delivery Document No.';
        }
    }
}
