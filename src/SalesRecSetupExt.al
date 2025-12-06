// TableExtension 70100: Sales & Receivables Setup Ext
tableextension 70100 "STR Sales & Rec. Setup Ext" extends "Sales & Receivables Setup"
{
    fields
    {
        field(70100; "STR Delivery Document Nos."; Code[20])
        {
            Caption = 'Delivery Document Nos.';
            TableRelation = "No. Series";
        }
    }
}
