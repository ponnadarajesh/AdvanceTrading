pageextension 70102 STRSalesSetupExt extends "Sales & Receivables Setup"
{
    layout
    {
        addafter("Default Cancel Reason Code")
        {
            field("STR Delivery Document Nos."; Rec."STR Delivery Document Nos.")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Delivery Document Nos. field.', Comment = '%';
            }
        }
    }
}
