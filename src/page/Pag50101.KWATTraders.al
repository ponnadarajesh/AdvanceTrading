page 50101 "KWAT_Traders"
{
    ApplicationArea = All;
    Caption = 'KWAT_Traders';
    PageType = List;
    SourceTable = KWAdvanceTrading_Trader;
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
