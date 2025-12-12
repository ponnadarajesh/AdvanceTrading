reportextension 70100 STRDeliveryDocket extends KBIZ_Sales_Order_Conf_AU
{
    dataset
    {
        add(Header)
        {
            // dataitem("Sales Header"; "Sales Header")
            // {
            column("STRDELDocNo"; "STR Delivery Document No.")
            {
            }
            // }
        }
    }
}
