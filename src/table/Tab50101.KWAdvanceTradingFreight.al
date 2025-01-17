table 50101 "KWAdvanceTrading_Freight"
{
    Caption = 'KWAdvanceTrading_Freight';
    DataClassification = CustomerContent;
    LookupPageId = KWAT_Freights;

    fields
    {
        field(1; "Code"; Code[20])
        {
            Caption = 'Code';
            DataClassification = CustomerContent;
        }
        field(2; Description; Text[100])
        {
            Caption = 'Description';
            DataClassification = CustomerContent;
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
