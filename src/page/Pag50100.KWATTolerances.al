page 50100 "KWAT_Tolerances"
{
    ApplicationArea = All;
    Caption = 'KWAT_Tolerances';
    PageType = List;
    SourceTable = KW_AdvanceTrading_Tolerance;
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
