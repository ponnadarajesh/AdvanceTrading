pageextension 50110 KWATSalesSetupExt extends "Sales & Receivables Setup"
{
    layout
    {
        addafter("Invoice Rounding")
        {
            field("KWAT_Ready to Invoice Mandatory"; Rec."KWAT_Ready to Invoice Mandatory")
            {
                ApplicationArea = All;
                Caption = 'KWAT_Ready to Invoice Mandatory';
            }
        }
    }
}
