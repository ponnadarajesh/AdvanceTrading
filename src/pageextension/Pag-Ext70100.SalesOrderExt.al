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
            field("STR Driver Email"; Rec."STR Driver Email")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Driver Email field.', Comment = '%';
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
                    SendWithLayout(1); // Layout 1: Buildpro Delivery Docket
                    // SalesShptHdr.SetRange("Order No.", Rec."No.");
                    // if SalesShptHdr.FindLast() then
                    //     ReportSelections.SendEmailToCust(
                    //         ReportSelections.Usage::"S.Shipment".AsInteger(),
                    //         SalesShptHdr,
                    //         SalesShptHdr."No.", 'Delivery Document', true, SalesShptHdr."Sell-to Customer No.");
                end;
            }
        }
    }
    local procedure SendWithLayout(LayoutNo: Integer)
    var
        SalesHeader: Record "Sales Header";
        RecRef: RecordRef;
        TempBlob: Codeunit "Temp Blob";
        Base64Convert: Codeunit "Base64 Convert";
        DesigntimeReportSelection: Codeunit "Design-time Report Selection";
        EmailMessage: Codeunit "Email Message";
        Email: Codeunit Email;
        OutStr: OutStream;
        InStr: InStream;
        EmailScenario: Enum "Email Scenario";
        LayoutName: Text[250];
        AttachmentName: Text;
        Subject: Text;
        Body: Text;
        Base64: Text;
        CustEmail: Text;
        Cust: Record Customer;
    begin
        SalesHeader := Rec;
        SalesHeader.SetRecFilter();

        LayoutName := GetLayoutName(LayoutNo);
        Subject := GetEmailSubject(SalesHeader, LayoutNo);
        Body := GetEmailBody(SalesHeader, LayoutNo);
        AttachmentName := GetAttachmentName(SalesHeader, LayoutNo);
        Cust.GET(SalesHeader."Sell-to Customer No.");
        CustEmail := Cust."E-Mail";
        // Temporarily set the custom layout
        DesigntimeReportSelection.SetSelectedLayout(LayoutName);

        // Generate PDF into TempBlob using the selected layout
        RecRef.GetTable(salesHeader);
        TempBlob.CreateOutStream(OutStr);
        if not Report.SaveAs(Report::KBIZ_Sales_Order_Conf_AU, '', ReportFormat::Pdf, OutStr, RecRef) then
            Error('Failed to generate report PDF.');

        // Reset layout selection
        DesigntimeReportSelection.SetSelectedLayout('');

        TempBlob.CreateInStream(InStr);
        Base64 := Base64Convert.ToBase64(InStr);

        // Create email message
        EmailMessage.Create(CustEmail + ';' + SalesHeader."STR Driver Email", Subject, Body, true);  // Use "Buy-from Contact No." or "Buy-from Email" based on your field
        EmailMessage.AddAttachment(AttachmentName, 'application/pdf', Base64);

        // Open email editor
        EmailScenario := EmailScenario::Default;
        Email.OpenInEditor(EmailMessage, EmailScenario);
    end;

    local procedure GetLayoutName(LayoutNo: Integer): Text[250]
    begin
        case LayoutNo of
            1:
                exit('Buildpro Delivery Docket');               // Layout 1 (fix typo from image)
            2:
                exit('Buidpro Sales Order- no Ship Address'); // Layout 2
            3:
                exit('Buildpro Delivery Docket With Pallet Qty');  // Layout 3
            4:
                exit('Buildpro Pick Up Request With Pallet Qty');  // Layout 4
        end;
    end;

    local procedure GetAttachmentName(SalesHeader: Record "Sales Header"; LayoutNo: Integer): Text
    begin
        case LayoutNo of
            1:
                exit('Purchase Order ' + SalesHeader."No." + '.pdf');
            2:
                exit('Purchase Order ' + SalesHeader."No." + ' No Ship.pdf');
            3:
                exit('Delivery Docket PO' + SalesHeader."No." + '.pdf');
            4:
                exit('Pick Up Request PO' + SalesHeader."No." + '.pdf');
            else
                exit('Purchase Order ' + SalesHeader."No." + '.pdf');
        end;
    end;

    local procedure GetEmailSubject(SalesHeader: Record "Sales Header"; LayoutNo: Integer): Text
    begin
        case LayoutNo of
            1:
                exit('Purchase Order ' + SalesHeader."No.");
            2:
                exit('Purchase Order ' + SalesHeader."No." + ' - No Ship-To Address');
            3:
                exit('Delivery Docket - PO ' + SalesHeader."No." + ' (With Pallet Qty)');
            4:
                exit('Pick Up Request - PO ' + SalesHeader."No." + ' (With Pallet Qty)');
            else
                exit('Purchase Order ' + SalesHeader."No.");
        end;
    end;

    local procedure GetEmailBody(SalesHeader: Record "Sales Header"; LayoutNo: Integer): Text
    var
        BodyText: Text;
    begin
        BodyText := 'Dear Supplier,<br><br>';
        case LayoutNo of
            1:
                BodyText += 'Please find attached Sales Order <b>' + SalesHeader."No." + '</b>.';
            2:
                BodyText += 'Please find attached Sales Order <b>' + SalesHeader."No." + '</b> (No Ship-To Address version).';
            3:
                BodyText += 'Please find attached Delivery Docket for PO <b>' + SalesHeader."No." + '</b> including pallet quantities.';
            4:
                BodyText += 'Please find attached Pick Up Request for PO <b>' + SalesHeader."No." + '</b> including pallet quantities.';
        end;
        BodyText += '<br><br>Thank you.<br>Regards';
        exit(BodyText);
    end;

}
