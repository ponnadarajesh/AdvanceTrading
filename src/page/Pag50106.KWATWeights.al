page 50106 "KWAT_Weights"
{
    ApplicationArea = All;
    Caption = 'KWAT_Weights';
    PageType = List;
    SourceTable = KWAdvanceTrading_Weight;
    UsageCategory = Administration;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Code"; Rec."Code")
                {
                    ToolTip = 'Specifies the value of the Code field.', Comment = '%';
                }
                field(Description; Rec.Description)
                {
                    ToolTip = 'Specifies the value of the Description field.', Comment = '%';
                }
            }
        }
    }
}
