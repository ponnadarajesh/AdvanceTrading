reportextension 70100 STRSalesShipmentReportExt extends KBIZ_Sales_Shipment_AU
{
    dataset
    {
        addlast(Header)
        {
            dataitem(SalesShptHeader; "Sales Shipment Header")
            {
                column("STRDELDocNo"; "STR Delivery Document No.")
                {
                }
            }
        }
    }
}
