table 50106 "KWAdvanceTrading_DeliveryPoint"
{
    Caption = 'KWAdvanceTrading_DeliveryPoint';
    DataClassification = CustomerContent;
    LookupPageId = KWAT_DeliveryPoint;

    fields
    {
        field(1; "Code"; Code[20])
        {
            Caption = 'Code';
        }
        field(2; Description; TableFilter)
        {
            Caption = 'Description';
        }
    }
    keys
    {
        key(PK; "Code")
        {
            Clustered = true;
        }
    }
}
