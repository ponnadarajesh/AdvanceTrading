// TableExtension 70103: Sales Shipment Header Ext
tableextension 70103 "STR Sales Shpt. Header Ext" extends "Sales Shipment Header"
{
    fields
    {
        field(70100; "STR Delivery Document No."; Code[20])
        {
            Caption = 'Delivery Document No.';
        }
        field(70102; "STR Driver Email"; Text[100])
        {
            Caption = 'Driver Email';
        }

    }
}
