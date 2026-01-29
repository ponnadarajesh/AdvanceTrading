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
        LogoBlob: Codeunit "Temp Blob";
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
        CompanyInfo: Record "Company Information";
        UserSetup: Record "User Setup";
        CompanyLogoBase64: Text;
    begin
        PurchHeader := Rec;
        PurchHeader.SetRecFilter();

        LayoutName := GetLayoutName(LayoutNo);
        Subject := GetEmailSubject(PurchHeader, LayoutNo);
        AttachmentName := GetAttachmentName(PurchHeader, LayoutNo);
        Vendor.GET(PurchHeader."Buy-from Vendor No.");
        vendorEmail := Vendor."E-Mail";
        CompanyInfo.GET();
        CompanyInfo.CalcFields(Picture);

        // Get Company Logo if it exists - use separate LogoBlob
        if CompanyInfo.Picture.HasValue() then begin
            CompanyInfo.Picture.CreateInStream(InStr);
            LogoBlob.CreateOutStream(OutStr);
            CopyStream(OutStr, InStr);
            LogoBlob.CreateInStream(InStr);
            CompanyLogoBase64 := Base64Convert.ToBase64(InStr);
        end;

        // Now call GetEmailBody after logo is extracted
        Body := GetEmailBody(PurchHeader, LayoutNo, CompanyLogoBase64);

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
        EmailMessage.Create(vendorEmail + ';' + PurchHeader."STR Driver Email", Subject, Body, true);
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

    local procedure GetEmailBody(PurchHeader: Record "Purchase Header"; LayoutNo: Integer; CompanyLogoBase64: Text): Text
    var
        BodyText: Text;
        CompanyInfo: Record "Company Information";
        Vendor: Record Vendor;
        UserSetup: Record "User Setup";
        SalesPurchPerson: Record "Salesperson/Purchaser";
    begin
        CompanyInfo.GET();
        Vendor.GET(PurchHeader."Buy-from Vendor No.");
        PurchHeader.CalcFields("Amount Including VAT");
        if PurchHeader."Purchaser Code" <> '' then
            if SalesPurchPerson.GET(PurchHeader."Purchaser Code") then;

        case LayoutNo of
            1:
                begin
                    BodyText := '<html><body style="font-family: Arial, sans-serif; font-size: 11pt;">';
                    BodyText += '<p>Dear ' + PurchHeader."Buy-from Vendor Name" + ',</p>';
                    BodyText += '<p>Please find attached Purchase Order No. <b>' + PurchHeader."No." + '</b> for your reference.</p>';
                    BodyText += '<p>Kindly review the details and confirm receipt.</p>';
                    BodyText += '<p>If you require any further information, please call or email.</p>';

                    BodyText += '<p><b>Order No.:</b> ' + PurchHeader."No." + '<br>';
                    BodyText += '<b>Order Date:</b> ' + Format(PurchHeader."Order Date") + '<br>';
                    BodyText += '<b>Total (incl. GST):</b> ' + Format(PurchHeader."Amount Including VAT") + '</p>';

                    BodyText += '<hr style="border: none; border-top: 1px solid #ddd; margin: 20px 0;">';

                    BodyText += '<p>Kind regards,<br><br>';
                    if SalesPurchPerson.Name <> '' then
                        BodyText += SalesPurchPerson.Name + '<br>';
                    BodyText += CompanyInfo.Name + '<br>';
                    BodyText += CompanyInfo."Address" + '<br>';
                    if CompanyInfo."Address 2" <> '' then
                        BodyText += CompanyInfo."Address 2" + '<br>';
                    BodyText += CompanyInfo.City + ' ' + CompanyInfo."Post Code" + '<br>';
                    if CompanyInfo."Phone No." <> '' then
                        BodyText += 'Phone: ' + CompanyInfo."Phone No." + '<br>';
                    if CompanyInfo."Home Page" <> '' then
                        BodyText += CompanyInfo."Home Page" + '<br>';
                    BodyText += '</p>';
                    if CompanyLogoBase64 <> '' then
                        BodyText += '<img src="data:image/jpeg;base64,' + CompanyLogoBase64 + '" style="max-width: 200px; max-height: 100px; margin-top: 10px;" />';
                    BodyText += '</body></html>';
                end;
            2:
                BodyText += 'Please find attached Purchase Order <b>' + PurchHeader."No." + '</b> (No Ship-To Address version).';
            3:
                // Buildpro Standard Layout with comprehensive template
                begin
                    BodyText := '<html><body style="font-family: Arial, sans-serif; font-size: 11pt;">';
                    BodyText += '<p>Dear ' + PurchHeader."Buy-from Vendor Name" + ',</p>';
                    BodyText += '<p>Please find attached Delivery Docket relating to Consignment No. <b>' + PurchHeader."No." + '</b>.</p>';
                    BodyText += '<p>Kindly use this document for delivery reference and confirmation. Please advise once delivery has been completed.</p>';
                    BodyText += '<p>If you require any further information, please call or email.</p>';

                    BodyText += '<p><b>Order Details:</b><br>';
                    BodyText += 'Order No.: ' + PurchHeader."No." + '<br>';
                    BodyText += 'Order Date: ' + Format(PurchHeader."Order Date") + '<br>';
                    BodyText += 'Total (incl. GST): ' + Format(PurchHeader."Amount Including VAT") + '</p>';

                    BodyText += '<p><b>Consignment Information:</b><br>';
                    BodyText += 'Consignment No.: ' + PurchHeader."No." + '</p>';

                    BodyText += '<hr style="border: none; border-top: 1px solid #ddd; margin: 20px 0;">';

                    BodyText += '<p>Kind regards,<br><br>';
                    if SalesPurchPerson.Name <> '' then
                        BodyText += SalesPurchPerson.Name + '<br>';
                    BodyText += CompanyInfo.Name + '<br>';
                    BodyText += CompanyInfo."Address" + '<br>';
                    if CompanyInfo."Address 2" <> '' then
                        BodyText += CompanyInfo."Address 2" + '<br>';
                    BodyText += CompanyInfo.City + ' ' + CompanyInfo."Post Code" + '<br>';
                    if CompanyInfo."Phone No." <> '' then
                        BodyText += 'Phone: ' + CompanyInfo."Phone No." + '<br>';
                    if CompanyInfo."Home Page" <> '' then
                        BodyText += CompanyInfo."Home Page" + '<br>';
                    BodyText += '</p>';
                    if CompanyLogoBase64 <> '' then
                        BodyText += '<img src="data:image/jpeg;base64,' + CompanyLogoBase64 + '" style="max-width: 200px; max-height: 100px; margin-top: 10px;" />';
                    BodyText += '</body></html>';
                end;
            4:
                BodyText += 'Please find attached Pick Up Request for PO <b>' + PurchHeader."No." + '</b> including pallet quantities.';
        end;

        if Not (LayoutNo In [1, 3]) then
            BodyText := BodyText + '<br><br>Thank you.<br>Regards';

        exit(BodyText);
    end;
}
