tableextension 50103 "KWAT_CustomerExt" extends Customer
{
    fields
    {
        field(50100; KWAT_NGR; Code[20])
        {
            Caption = 'National Growers Registration';
            DataClassification = Customercontent;
        }
    }
}
