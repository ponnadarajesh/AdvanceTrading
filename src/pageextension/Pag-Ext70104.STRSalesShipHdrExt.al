pageextension 70104 STRSalesShipHdrExt extends "Posted Sales Shipment"
{
    layout
    {
        addafter("External Document No.")
        {
            field("Delivery Document No."; Rec."STR Delivery Document No.")
            {
                ApplicationArea = All;
                Editable = false;
            }
        }
    }
}
