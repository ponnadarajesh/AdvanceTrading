table 50103 "KWAdvanceTrading_Other"
{
    Caption = 'KWAdvanceTrading_Other';
    DataClassification = CustomerContent;
    LookupPageId = KWAT_Others;

    fields
    {
        field(1; "Code"; Code[20])
        {
            Caption = 'Code';
        }
        field(2; Description; Text[200])
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
