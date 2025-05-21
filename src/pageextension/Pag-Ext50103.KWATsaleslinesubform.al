pageextension 50103 KWATsaleslinesubform extends "Sales Lines"
{
    layout
    {
        modify(Description)
        {
            ApplicationArea = All;
            Caption = 'Commodity';
        }
        modify("Variant Code")
        {
            ApplicationArea = All;
            Caption = 'Grade';
        }
    }

}
