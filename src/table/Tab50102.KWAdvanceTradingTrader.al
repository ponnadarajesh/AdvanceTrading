table 50102 "KWAdvanceTrading_Trader"
{
    Caption = 'KWAdvanceTrading_Trader';
    DataClassification = CustomerContent;
    LookupPageId = KWAT_Traders;

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
        field(3; "Gen.Bus.Posting Grp"; Code[20])
        {
            Caption = 'Gen. Bus. Posting Grp.';
            TableRelation = "Gen. Business Posting Group".Code;
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
