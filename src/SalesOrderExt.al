// PageExtension 70100: Sales Order Ext
pageextension 70100 "Sales Order Ext" extends "Sales Order"
{
    layout
    {
        addafter("No.")
        {
            field("Delivery Document No."; Rec."Delivery Document No.")
            {
                ApplicationArea = All;
                Editable = false;
            }
        }
    }

    actions
    {
        addlast("P&osting")
        {
            action("Email Delivery Document")
            {
                ApplicationArea = All;
                Caption = 'Email Delivery Document';
                Image = SendEmail;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                var
                    SalesShptHdr: Record "Sales Shipment Header";
                    ReportSelections: Record "Report Selections";
                    EmailScenario: Enum "Email Scenario";
                begin
                    SalesShptHdr.SetRange("Order No.", Rec."No.");
                    if SalesShptHdr.FindLast() then
                        ReportSelections.SendEmailToCust(
                            ReportSelections.Usage::"S.Shipment",
                            SalesShptHdr,
                            SalesShptHdr."No.",
                            EmailScenario::Default,
                            true);
                end;
            }
        }
    }
}
