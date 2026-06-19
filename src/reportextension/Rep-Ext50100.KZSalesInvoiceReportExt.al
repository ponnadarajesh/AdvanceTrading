reportextension 50100 KZSalesInvoiceReportExt extends "Standard Sales - Invoice"
{
    dataset
    {
        add(Header)
        {
            column(KWAT_Buyer; KWAT_Buyer)
            {
            }
            column(KWAT_BuyerReference; "KWAT_Buyer Reference")
            {
            }
            column(KWAT_BuyerName; KWAT_BuyerName)
            {
            }
            column(KWAT_SellToCustAddress; KWAT_SellToCustAddress)
            {
            }

        }
        modify(Header)
        {
            trigger OnAfterAfterGetRecord()
            begin
                Clear(KWAT_BuyerName);
                Clear(KWAT_SellToCustAddress);
                if KWCust.Get(KWAT_Buyer) then
                    KWAT_BuyerName := KWCust.Name;
                if SellToCust.Get("Sell-to Customer No.") then
                    KWAT_SellToCustAddress := SellToCust.Address;

            end;
        }


    }

    var
        KWAT_Buyer: Text[100];
        KWCust: Record Customer;
        KWAT_BuyerReference: Text[100];
        KWAT_BuyerName: Text[100];
        SellToCust: Record Customer;
        KWAT_SellToCustAddress: Text[100];
}
