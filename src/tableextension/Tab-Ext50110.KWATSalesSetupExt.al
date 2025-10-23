tableextension 50110 "KWAT_SalesSetupExt" extends "Sales & Receivables Setup"
{
    fields
    {
        field(50100; "KWAT_Ready to Invoice Mandatory"; Boolean)
        {
            Caption = 'KWAT_Ready to Invoice Mandatory';
            DataClassification = CustomerContent;
        }
    }
}
