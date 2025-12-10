pageextension 70105 STRPurchRcptHdrExt extends "Posted Purchase Receipt"
{
    layout
    {
        addafter("Vendor Shipment No.")
        {
            field("STR Pickup Request No."; Rec."STR Pickup Request No.")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Pickup Request No. field.', Comment = '%';
            }
            field("Delivery Document No."; Rec."STR Delivery Document No.")
            {
                ApplicationArea = All;
                Editable = false;
                ToolTip = 'Specifies the value of the Delivery Doc No. field.', Comment = '%';
            }
        }
    }
}
