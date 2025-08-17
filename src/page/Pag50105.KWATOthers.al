page 50105 "KWAT_Others"
{
    ApplicationArea = All;
    Caption = 'KWAT_Others';
    PageType = List;
    SourceTable = KWAdvanceTrading_Other;
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
                field(Default; Rec.Default)
                {
                    ToolTip = 'Specifies the value of the Default field.', Comment = '%';
                }
            }
        }
    }
}
