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

        }
        modify(Header)
        {
            trigger OnAfterAfterGetRecord()
            begin
                Clear(KWAT_BuyerName);
                if KWCust.Get(KWAT_Buyer) then
                    KWAT_BuyerName := KWCust.Name;
            end;
        }


    }

    var
        KWAT_Buyer: Text[100];
        KWCust: Record Customer;
        KWAT_BuyerReference: Text[100];
        KWAT_BuyerName: Text[100];
}
