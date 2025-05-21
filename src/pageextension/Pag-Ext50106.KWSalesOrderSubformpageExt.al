pageextension 50106 KWSalesOrderSubformpageExt extends "Sales Order Subform"
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
        modify("Unit Price")
        {
            ApplicationArea = All;
            Caption = 'Commission';
        }
    }
}
