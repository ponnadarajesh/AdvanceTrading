pageextension 50104 KXWSalesInvLineExt extends "Posted Sales Invoice Lines"
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
