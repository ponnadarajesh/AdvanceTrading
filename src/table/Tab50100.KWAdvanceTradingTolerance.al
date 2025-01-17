table 50100 "KW_AdvanceTrading_Tolerance"
{
    Caption = 'Advance Trading Tolerance';
    DataClassification = CustomerContent;
    LookupPageId = KWAT_Tolerances;

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
