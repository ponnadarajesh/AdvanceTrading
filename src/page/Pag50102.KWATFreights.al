page 50102 "KWAT_Freights"
{
    ApplicationArea = All;
    Caption = 'KWAT_Freights';
    PageType = List;
    SourceTable = KWAdvanceTrading_Freight;
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
