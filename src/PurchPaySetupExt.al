// TableExtension 70101: Purchases & Payables Setup Ext
tableextension 70101 "Purch. & Pay. Setup Ext" extends "Purchases & Payables Setup"
{
    fields
    {
        field(70100; "Pickup Request Nos."; Code[20])
        {
            Caption = 'Pickup Request Nos.';
            TableRelation = "No. Series";
        }
        field(70101; "Delivery Document Nos."; Code[20])
        {
            Caption = 'Delivery Document Nos.';
            TableRelation = "No. Series";
        }
    }
}
