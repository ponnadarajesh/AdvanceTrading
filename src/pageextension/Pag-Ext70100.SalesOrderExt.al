// PageExtension 70100: Sales Order Ext
pageextension 70100 "Sales Order Ext" extends "Sales Order"
{
    layout
    {
        addafter("External Document No.")
        {
            field("Delivery Document No."; Rec."STR Delivery Document No.")
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
                Image = SendEmailPDF;
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
                            ReportSelections.Usage::"S.Shipment".AsInteger(),
                            SalesShptHdr,
                            SalesShptHdr."No.", 'Delivery Document', true, SalesShptHdr."Sell-to Customer No.");
                end;
            }
        }
    }
}
