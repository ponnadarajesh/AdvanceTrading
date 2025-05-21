pageextension 50105 KWSalesLineArchExt extends "Posted Sales Invoice Subform"
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
