reportextension 70101 STRPickRequestExt extends KBIZ_Purch_Order_Conf_AU
{
    dataset
    {
        add("Purchase Header")
        {
            column(STRDeliveryDocumentNo; "STR Delivery Document No.")
            {
            }
            column(STRPickupRequestNo; "STR Pickup Request No.")
            {
            }
        }
    }
}
