table 50105 "KWAdvanceTrading_Analysis"
{
    Caption = 'KWAdvanceTrading_Analysis';
    DataClassification = CustomerContent;
    LookupPageId = KWAT_Analysis;

    fields
    {
        field(1; "Code"; Code[20])
        {
            Caption = 'Code';
        }
        field(2; Description; Text[100])
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
