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
        addlast(processing)
        {
            action("Generate Delivery Doc Nos")
            {
                ApplicationArea = All;
                Caption = 'Generate Delivery Doc No.';
                Image = GetEntries;
                //Promoted = true;
                //PromotedCategory = Process;
                //PromotedIsBig = true;
                ToolTip = 'This is for Generate Delivery Doc No';

                trigger OnAction()
                var
                    STRDeliveryPickupMgt: Codeunit "STR Delivery & Pickup Mgt.";
                begin
                    Rec."STR Delivery Document No." := STRDeliveryPickupMgt.GetNextDeliveryDocumentNo();
                    Rec.Modify();
                end;
            }
        }

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
