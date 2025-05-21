pageextension 50107 KWSalesLineArchisubformpageExt extends "Sales Order Archive Subform"
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
        Modify("Unit Price")
        {
            ApplicationArea = All;
            Caption = 'Commission';
        }

    }
}
