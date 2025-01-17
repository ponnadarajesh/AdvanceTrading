table 50104 "KWAdvanceTrading_Weight"
{
    Caption = 'KWAdvanceTrading_Weight';
    DataClassification = CustomerContent;
    LookupPageId = KWAT_Weights;

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
