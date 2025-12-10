pageextension 70103 STRPurchSetupExt extends "Purchases & Payables Setup"
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
            field("STR Pickup Request Nos."; Rec."STR Pickup Request Nos.")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Pickup Request Nos. field.', Comment = '%';
            }
            field("STR Driver Email"; Rec."STR Driver Email")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Driver Email field.', Comment = '%';
            }
        }

    }
}

