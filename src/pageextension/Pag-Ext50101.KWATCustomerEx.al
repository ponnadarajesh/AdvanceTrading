pageextension 50101 "KWAT_CustomerEx" extends "Customer Card"
{
    layout
    {
        addafter(General)
        {
            group(AdvanceTrading)
            {
                Caption = 'Advance Trading';
                field(KWAT_NGR; Rec.KWAT_NGR)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the National Growers Registration field.', Comment = '%';
                }
            }
        }
    }
}
