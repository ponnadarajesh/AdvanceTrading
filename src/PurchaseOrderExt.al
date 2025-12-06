// PageExtension 70101: Purchase Order Ext
pageextension 70101 "Purchase Order Ext" extends "Purchase Order"
{
    layout
    {
        addafter("No.")
        {
            field("Pickup Request No."; Rec."Pickup Request No.")
            {
                ApplicationArea = All;
                Editable = false;
            }
            field("Delivery Document No."; Rec."Delivery Document No.")
            {
                ApplicationArea = All;
                Editable = false;
            }
        }
    }

    actions
    {
        addlast("Print/Send")
        {
            action("Email PO With Ship-To")
            {
                ApplicationArea = All;
                Caption = 'Email PO With Ship-To-Address';
                Image = SendEmail;
                Promoted = true;

                trigger OnAction()
                var
                    PurchHeader: Record "Purchase Header";
                begin
                    PurchHeader := Rec;
                    CurrPage.SetSelectionFilter(PurchHeader);
                    PurchHeader.PrintRecordsWithShipTo(true);
                end;
            }

            action("Email PO Without Ship-To")
            {
                ApplicationArea = All;
                Caption = 'Email PO Without Ship-To-Address';
                Image = SendEmail;
                Promoted = true;

                trigger OnAction()
                var
                    PurchHeader: Record "Purchase Header";
                begin
                    PurchHeader := Rec;
                    CurrPage.SetSelectionFilter(PurchHeader);
                    PurchHeader.PrintRecordsWithShipTo(false);
                end;
            }

            action("Email Delivery Docket With Pallet")
            {
                ApplicationArea = All;
                Caption = 'Email Delivery Docket With Pallet';
                Image = SendEmail;
                Promoted = true;

                trigger OnAction()
                begin
                    SendCustomReport(Report::"Custom Delivery Docket", 'Delivery Docket');
                end;
            }

            action("BuildPro Pickup Request")
            {
                ApplicationArea = All;
                Caption = 'BuildPro Pickup Request';
                Image = SendEmail;
                Promoted = true;

                trigger OnAction()
                begin
                    SendCustomReport(Report::"BuildPro Pickup Request", 'BuildPro Pickup Request');
                end;
            }
        }
    }

    local procedure SendCustomReport(ReportID: Integer; ReportCaption: Text)
    var
        PurchHeader: Record "Purchase Header";
        EmailItem: Record "Email Item" temporary;
        EmailScenario: Enum "Email Scenario";
    begin
        PurchHeader := Rec;
        EmailItem.AddSourceDocument(Database::"Purchase Header", PurchHeader."Document Type", PurchHeader."No.");
        EmailItem."Send to" := GetDriverEmail(); // You must implement this logic
        EmailItem.Subject := ReportCaption + ' ' + PurchHeader."No.";
        EmailItem.Send(true, EmailScenario::Default);
        Report.Run(ReportID, true, false, PurchHeader);
    end;

    local procedure GetDriverEmail(): Text // Placeholder – implement your logic
    begin
        exit('driver@company.com'); // Replace with actual driver email logic
    end;
}
