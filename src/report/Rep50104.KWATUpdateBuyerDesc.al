report 50105 "KWAT Update Buyer Description"
{
    Caption = 'Update Buyer Description';
    ProcessingOnly = true;
    ApplicationArea = All;
    UsageCategory = ReportsAndAnalysis;

    dataset
    {
        dataitem("Sales Header"; "Sales Header")
        {
            DataItemTableView = where("KWAT_Buyer" = filter(<> ''));

            trigger OnAfterGetRecord()
            var
                Customer: Record Customer;
            begin
                if "KWAT_Buyer_Desc" = '' then begin
                    if Customer.Get("KWAT_Buyer") then begin
                        "KWAT_Buyer_Desc" := Customer.Name;
                        Modify();
                        UpdatedCount += 1;
                    end;
                end;
            end;

            trigger OnPostDataItem()
            begin
                Message('Updated %1 sales headers with buyer descriptions.', UpdatedCount);
            end;
        }
    }

    requestpage
    {
        layout
        {
            area(content)
            {
                group(Options)
                {
                    Caption = 'Options';
                    field(DocumentTypeFilter; DocumentTypeFilter)
                    {
                        ApplicationArea = All;
                        Caption = 'Document Type Filter';
                        ToolTip = 'Specifies the document types to update. Leave blank for all.';
                    }
                }
            }
        }
    }

    var
        UpdatedCount: Integer;
        DocumentTypeFilter: Text;

    trigger OnPreReport()
    begin
        if DocumentTypeFilter <> '' then
            "Sales Header".SetFilter("Document Type", DocumentTypeFilter);
        UpdatedCount := 0;
    end;
}