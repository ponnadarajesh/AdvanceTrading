// PageExtension 70101: Purchase Order Ext
pageextension 70106 "Purchase Order Ext" extends "Purchase Order"
{
    layout
    {
        addafter("Vendor Invoice No.")
        {
            field("Pickup Request No."; Rec."STR Pickup Request No.")
            {
                ApplicationArea = All;
                Editable = false;
            }
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
            action("Generate Pickup Req_Delivery Doc Nos")
            {
                ApplicationArea = All;
                Caption = 'Generate Pickup Req No. & Delivery Doc Nos';
                Image = GetEntries;
                //Promoted = true;
                //PromotedCategory = Process;
                //PromotedIsBig = true;
                ToolTip = 'Generate Pickup Req No. & Delivery Doc Nos';

                trigger OnAction()
                var
                    STRDeliveryPickupMgt: Codeunit "STR Delivery & Pickup Mgt.";
                begin
                    STRDeliveryPickupMgt.GeneratePickReqNo_DelDocNo(Rec);
                end;
            }
        }
        addafter(Email)
        {
            group("Logistics Emails")
            {
                Caption = 'Logistics Emails';
                Image = Email;
                action("Email PO - Buildpro Standard")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Email PO (Buildpro Standard)';
                    Image = SendEmailPDF;
                    //Promoted = true;
                    //PromotedCategory = Process;
                    //PromotedIsBig = true;
                    ToolTip = 'Send purchase order by email using Buildpro Purchase Order layout.';

                    trigger OnAction()
                    begin
                        SendWithLayout(1);
                    end;
                }

                action("Email PO - No Ship Address")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Email PO (No Ship-To Address)';
                    Image = SendEmailPDF;
                    //Promoted = true;
                    //PromotedCategory = Process;
                    ToolTip = 'Send purchase order without ship-to address using specific layout.';

                    trigger OnAction()
                    begin
                        SendWithLayout(2);
                    end;
                }

                action("Email Delivery Docket With Pallet")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Email Delivery Docket (With Pallet Qty)';
                    Image = SendEmailPDF;
                    //Promoted = true;
                    //PromotedCategory = Process;

                    trigger OnAction()
                    begin
                        SendWithLayout(3);
                    end;
                }

                action("Email Pick Up Request With Pallet")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Email Pick Up Request (With Pallet Qty)';
                    Image = SendEmailPDF;
                    //Promoted = true;
                    //PromotedCategory = Process;

                    trigger OnAction()
                    begin
                        SendWithLayout(4);
                    end;
                }
            }
        }
    }

    local procedure SendWithLayout(LayoutNo: Integer)
    var
        PurchHeader: Record "Purchase Header";
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
        vendorEmail: Text;
        Vendor: Record Vendor;
    begin
        PurchHeader := Rec;
        PurchHeader.SetRecFilter();

        LayoutName := GetLayoutName(LayoutNo);
        Subject := GetEmailSubject(PurchHeader, LayoutNo);
        Body := GetEmailBody(PurchHeader, LayoutNo);
        AttachmentName := GetAttachmentName(PurchHeader, LayoutNo);
        Vendor.GET(PurchHeader."Buy-from Vendor No.");
        vendorEmail := Vendor."E-Mail";
        // Temporarily set the custom layout
        DesigntimeReportSelection.SetSelectedLayout(LayoutName);

        // Generate PDF into TempBlob using the selected layout
        RecRef.GetTable(PurchHeader);
        TempBlob.CreateOutStream(OutStr);
        if not Report.SaveAs(Report::KBIZ_Purch_Order_Conf_AU, '', ReportFormat::Pdf, OutStr, RecRef) then
            Error('Failed to generate report PDF.');

        // Reset layout selection
        DesigntimeReportSelection.SetSelectedLayout('');

        TempBlob.CreateInStream(InStr);
        Base64 := Base64Convert.ToBase64(InStr);

        // Create email message
        EmailMessage.Create(vendorEmail + ';' + PurchHeader."STR Driver Email", Subject, Body, true);  // Use "Buy-from Contact No." or "Buy-from Email" based on your field
        EmailMessage.AddAttachment(AttachmentName, 'application/pdf', Base64);

        // Open email editor
        EmailScenario := EmailScenario::Default;
        Email.OpenInEditor(EmailMessage, EmailScenario);
    end;

    local procedure GetLayoutName(LayoutNo: Integer): Text[250]
    begin
        case LayoutNo of
            1:
                exit('Buidpro Purchase Order');               // Layout 1 (fix typo from image)
            2:
                exit('Buidpro Purchase Order- no Ship Address'); // Layout 2
            3:
                exit('Buildpro Delivery Docket With Pallet Qty');  // Layout 3
            4:
                exit('Buildpro Pick Up Request With Pallet Qty');  // Layout 4
        end;
    end;

    local procedure GetAttachmentName(PurchHeader: Record "Purchase Header"; LayoutNo: Integer): Text
    begin
        case LayoutNo of
            1:
                exit('Purchase Order ' + PurchHeader."No." + '.pdf');
            2:
                exit('Purchase Order ' + PurchHeader."No." + ' No Ship.pdf');
            3:
                exit('Delivery Docket PO' + PurchHeader."No." + '.pdf');
            4:
                exit('Pick Up Request PO' + PurchHeader."No." + '.pdf');
            else
                exit('Purchase Order ' + PurchHeader."No." + '.pdf');
        end;
    end;

    local procedure GetEmailSubject(PurchHeader: Record "Purchase Header"; LayoutNo: Integer): Text
    begin
        case LayoutNo of
            1:
                exit('Purchase Order ' + PurchHeader."No.");
            2:
                exit('Purchase Order ' + PurchHeader."No." + ' - No Ship-To Address');
            3:
                exit('Delivery Docket - PO ' + PurchHeader."No." + ' (With Pallet Qty)');
            4:
                exit('Pick Up Request - PO ' + PurchHeader."No." + ' (With Pallet Qty)');
            else
                exit('Purchase Order ' + PurchHeader."No.");
        end;
    end;

    local procedure GetEmailBody(PurchHeader: Record "Purchase Header"; LayoutNo: Integer): Text
    var
        BodyText: Text;
    begin
        BodyText := 'Dear Supplier,<br><br>';
        case LayoutNo of
            1:
                BodyText += 'Please find attached Purchase Order <b>' + PurchHeader."No." + '</b>.';
            2:
                BodyText += 'Please find attached Purchase Order <b>' + PurchHeader."No." + '</b> (No Ship-To Address version).';
            3:
                BodyText += 'Please find attached Delivery Docket for PO <b>' + PurchHeader."No." + '</b> including pallet quantities.';
            4:
                BodyText += 'Please find attached Pick Up Request for PO <b>' + PurchHeader."No." + '</b> including pallet quantities.';
        end;
        BodyText += '<br><br>Thank you.<br>Regards';
        exit(BodyText);
    end;
}
