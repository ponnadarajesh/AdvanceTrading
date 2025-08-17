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
        field(3; "Default"; Boolean)
        {
            Caption = 'Default';
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
