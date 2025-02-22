report 50100 "KT Agent Note Seller"
{
    Caption = 'Agent Note(Seller)';
    DefaultLayout = RDLC;
    //RDLCLayout = './AgentNote.rdl';
    RDLCLayout = './SellerAgentNote.rdl';
    //DefaultRenderingLayout = "StandardSalesOrderConf.docx";
    //PreviewMode = PrintLayout;
    //WordMergeDataItem = Header;

    dataset
    {
        dataitem(Header; "Sales Header")
        {
            DataItemTableView = sorting("Document Type", "No.") where("Document Type" = const(Order));
            RequestFilterFields = "No.", "Sell-to Customer No.", "No. Printed";
            RequestFilterHeading = 'Sales Order';
            column(CompanyAddress1; CompanyAddr[1])
            {
            }
            column(CompanyAddress2; CompanyAddr[2])
            {
            }
            column(CompanyAddress3; CompanyAddr[3])
            {
            }
            column(CompanyAddress4; CompanyAddr[4])
            {
            }
            column(CompanyAddress5; CompanyAddr[5])
            {
            }
            column(CompanyAddress6; CompanyAddr[6])
            {
            }
            column(CompanyAddress7; CompanyAddr[7])
            {
            }
            column(CompanyAddress8; CompanyAddr[8])
            {
            }
            // column(CompanyHomePage; CompanyInfo."Home Page")
            // {
            // }
            column(CompanyEMail; CompanyInfo."E-Mail")
            {
            }
            column(CompanyPicture; DummyCompanyInfo.Picture)
            {
            }
            column(CompanyPhoneNo; CompanyInfo."Phone No.")
            {
            }
            column(CompanyPhoneNo_Lbl; CompanyInfoPhoneNoLbl)
            {
            }
            column(CompanyGiroNo; CompanyInfo."Giro No.")
            {
            }
            column(CompanyGiroNo_Lbl; CompanyInfoGiroNoLbl)
            {
            }
            column(CompanyBankName; CompanyBankAccount.Name)
            {
            }
            column(CompanyBankName_Lbl; CompanyInfoBankNameLbl)
            {
            }
            column(CompanyBankBranchNo; CompanyBankAccount."Bank Branch No.")
            {
            }
            column(CompanyBankBranchNo_Lbl; CompanyBankAccount.FieldCaption("Bank Branch No."))
            {
            }
            column(CompanyBankAccountNo; CompanyBankAccount."Bank Account No.")
            {
            }
            column(CompanyBankAccountNo_Lbl; CompanyInfoBankAccNoLbl)
            {
            }
            column(CompanyIBAN; CompanyBankAccount.IBAN)
            {
            }
            column(CompanyIBAN_Lbl; CompanyBankAccount.FieldCaption(IBAN))
            {
            }
            column(CompanySWIFT; CompanyBankAccount."SWIFT Code")
            {
            }
            column(CompanySWIFT_Lbl; CompanyBankAccount.FieldCaption("SWIFT Code"))
            {
            }
            column(CompanyLogoPosition; CompanyLogoPosition)
            {
            }
            column(CompanyRegistrationNumber; CompanyInfo.GetRegistrationNumber())
            {
            }
            column(CompanyRegistrationNumber_Lbl; CompanyInfo.GetRegistrationNumberLbl())
            {
            }
            column(CompanyVATRegNo; CompanyInfo.GetVATRegistrationNumber())
            {
            }
            column(CompanyVATRegNo_Lbl; CompanyInfo.GetVATRegistrationNumberLbl())
            {
            }
            column(CompanyVATRegistrationNo; CompanyInfo.GetVATRegistrationNumber())
            {
            }
            column(CompanyVATRegistrationNo_Lbl; CompanyInfo.GetVATRegistrationNumberLbl())
            {
            }
            column(CompanyLegalOffice; LegalOfficeTxt)
            {
            }
            column(CompanyLegalOffice_Lbl; LegalOfficeLbl)
            {
            }
            column(CompanyCustomGiro; CustomGiroTxt)
            {
            }
            column(CompanyCustomGiro_Lbl; CustomGiroLbl)
            {
            }
            column(CompanyLegalStatement; LegalStatementLbl)
            {
            }
            column(CustomerAddress1; CustAddr[1])
            {
            }
            column(CustomerAddress2; CustAddr[2])
            {
            }
            column(CustomerAddress3; CustAddr[3])
            {
            }
            column(CustomerAddress4; CustAddr[4])
            {
            }
            column(CustomerAddress5; CustAddr[5])
            {
            }
            column(CustomerAddress6; CustAddr[6])
            {
            }
            column(CustomerAddress7; CustAddr[7])
            {
            }
            column(CustomerAddress8; CustAddr[8])
            {
            }
            column(SellToContactPhoneNoLbl; SellToContactPhoneNoLbl)
            {
            }
            column(SellToContactMobilePhoneNoLbl; SellToContactMobilePhoneNoLbl)
            {
            }
            column(SellToContactEmailLbl; SellToContactEmailLbl)
            {
            }
            column(BillToContactPhoneNoLbl; BillToContactPhoneNoLbl)
            {
            }
            column(BillToContactMobilePhoneNoLbl; BillToContactMobilePhoneNoLbl)
            {
            }
            column(BillToContactEmailLbl; BillToContactEmailLbl)
            {
            }
            column(SellToContactPhoneNo; SellToContact."Phone No.")
            {
            }
            column(SellToContactMobilePhoneNo; SellToContact."Mobile Phone No.")
            {
            }
            column(SellToContactEmail; SellToContact."E-Mail")
            {
            }
            column(BillToContactPhoneNo; BillToContact."Phone No.")
            {
            }
            column(BillToContactMobilePhoneNo; BillToContact."Mobile Phone No.")
            {
            }
            column(BillToContactEmail; BillToContact."E-Mail")
            {
            }
            column(CustomerPostalBarCode; FormatAddr.PostalBarCode(1))
            {
            }
            column(YourReference; "Your Reference")
            {
            }
            column(YourReference_Lbl; FieldCaption("Your Reference"))
            {
            }
            column(ShipmentMethodDescription; ShipmentMethod.Description)
            {
            }
            column(ShipmentMethodDescription_Lbl; ShptMethodDescLbl)
            {
            }
            column(Shipment_Lbl; ShipmentLbl)
            {
            }
            column(ShipmentDate; Format("Shipment Date", 0, 4))
            {
            }
            column(ShipmentDate_Lbl; FieldCaption("Shipment Date"))
            {
            }
            column(ShowShippingAddress; ShowShippingAddr)
            {
            }
            column(ShipToAddress_Lbl; ShiptoAddrLbl)
            {
            }
            column(ShipToAddress1; ShipToAddr[1])
            {
            }
            column(ShipToAddress2; ShipToAddr[2])
            {
            }
            column(ShipToAddress3; ShipToAddr[3])
            {
            }
            column(ShipToAddress4; ShipToAddr[4])
            {
            }
            column(ShipToAddress5; ShipToAddr[5])
            {
            }
            column(ShipToAddress6; ShipToAddr[6])
            {
            }
            column(ShipToAddress7; ShipToAddr[7])
            {
            }
            column(ShipToAddress8; ShipToAddr[8])
            {
            }
            column(ShipToPhoneNo; Header."Ship-to Phone No.")
            {
            }
            column(PaymentTermsDescription; PaymentTerms.Description)
            {
            }
            column(PaymentTermsDescription_Lbl; PaymentTermsDescLbl)
            {
            }
            column(PaymentMethodDescription; PaymentMethod.Description)
            {
            }
            column(PaymentMethodDescription_Lbl; PaymentMethodDescLbl)
            {
            }
            column(DocumentCopyText; StrSubstNo(DocumentCaption(), CopyText))
            {
            }
            column(BilltoCustumerNo; "Bill-to Customer No.")
            {
            }
            column(BilltoCustomerNo_Lbl; FieldCaption("Bill-to Customer No."))
            {
            }
            column(DocumentDate; Format("Document Date", 0, 4))
            {
            }
            column(DocumentDate_Lbl; FieldCaption("Document Date"))
            {
            }
            column(DueDate; Format("Due Date", 0, 4))
            {
            }
            column(DueDate_Lbl; FieldCaption("Due Date"))
            {
            }
            column(DocumentNo; "No.")
            {
            }
            column(DocumentNo_Lbl; InvNoLbl)
            {
            }
            column(QuoteNo; "Quote No.")
            {
            }
            column(QuoteNo_Lbl; FieldCaption("Quote No."))
            {
            }
            column(PricesIncludingVAT; "Prices Including VAT")
            {
            }
            column(PricesIncludingVAT_Lbl; FieldCaption("Prices Including VAT"))
            {
            }
            column(PricesIncludingVATYesNo; Format("Prices Including VAT"))
            {
            }
            column(SalesPerson_Lbl; SalespersonLbl)
            {
            }
            column(SalesPersonText_Lbl; SalesPersonText)
            {
            }
            column(SalesPersonName; SalespersonPurchaser.Name)
            {
            }
            column(SelltoCustomerNo; "Sell-to Customer No.")
            {
            }
            column(SelltoCustomerNo_Lbl; FieldCaption("Sell-to Customer No."))
            {
            }
            column(VATRegistrationNo; GetCustomerVATRegistrationNumber())
            {
            }
            column(VATRegistrationNo_Lbl; GetCustomerVATRegistrationNumberLbl())
            {
            }
#if not CLEAN25
            column(GlobalLocationNumber; '')
            {
                ObsoleteState = Pending;
                ObsoleteReason = 'Not in use anymore.';
                ObsoleteTag = '25.0';
            }
            column(GlobalLocationNumber_Lbl; '')
            {
                ObsoleteState = Pending;
                ObsoleteReason = 'Not in use anymore.';
                ObsoleteTag = '25.0';
            }
#endif
            Column(KWAT_TraderDesc; KWAT_TraderDesc)
            {
            }
            Column(KWAT_ToleranceDesc; KWAT_ToleranceDesc)
            {
            }
            Column(KWAT_WeightDesc; KWAT_WeightDesc)
            {
            }
            Column(KWAT_FreightDesc; KWAT_FreightCodeDesc)
            {
            }

            Column(KWAT_AnalysisDesc; KWAT_AnalysisDesc)
            {
            }
            Column(KWAT_OtherDesc; KWAT_OtherCodeDesc)
            {
            }
            column(BoldAnalysisDesc; BoldAnalysisDesc)
            {
            }
            column(BoldToleranceDesc; BoldToleranceDesc)
            {
            }
            column(BoldfreightDesc; BoldfreightDesc)
            {
            }
            column(BoldOtherCodeDesc; BoldOtherCodeDesc)
            {
            }
            column(BoldweightDesc; BoldweightDesc)
            {
            }
            column(SellToFaxNo; GetSellToCustomerFaxNo())
            {
            }
            column(KWAT_Transporter_Header; KWAT_Transporter)
            {
            }
            column(KWAT_DeliveryEnd_Header; "KWAT_Delivery End")
            {
            }
            column(KWAT_DeliveryStart_Header; "KWAT_Delivery Start")
            {
            }
            column(KWAT_DeliveryPointCode_Header; "KWAT_DeliveryPoint Code")
            {
            }
            column(KWAT_TraderPrice_Header; "KWAT_Trader Price")
            {
            }
            Column(BuyerAdd1; BuyerAdd)
            {
            }
            Column(BuyerMob1; BuyerMob)
            {
            }
            Column(BuyerEmail1; BuyerEmail)
            {
            }

            Column(BuyerABN1; BuyerABN)
            {
            }
            Column(BuyerNGR1; BuyerNGR)
            {
            }
            Column(SellerAdd1; Selleradd)
            {
            }
            Column(SellerMob1; SellerMob)
            {
            }
            Column(SellerEmail1; SellerEmail)
            {
            }

            Column(SellerABN1; SellerABN)
            {
            }
            Column(SellerNGR1; SellerNGR)
            {
            }
            column(KWAT_Seller_Reference; "KWAT_Seller Reference")
            {

            }
            column(KWAT_Buyer_Reference; "KWAT_Buyer Reference")
            {

            }
            column(sellerDescription; sellerDescription)
            {

            }
            column(BuyerDescription; BuyerDescription)
            {

            }
            column(SellerContact; SellerContact)
            {

            }
            column(BuyerContact; BuyerContact)
            {

            }
            column(KWATWorkDesc1; KWATWorkDesc)
            {

            }
            column(SellToPhoneNo; "Sell-to Phone No.")
            {
            }
            column(KWDeliveryPeriod; DeliveryPeriod)
            {

            }
            column(KWSeasonCode; "Shortcut Dimension 1 Code")
            {
            }

            column(LegalEntityType; Cust.GetLegalEntityType())
            {
            }
            column(LegalEntityType_Lbl; Cust.GetLegalEntityTypeLbl())
            {
            }
            column(Copy_Lbl; CopyLbl)
            {
            }
            column(EMail_Lbl; EMailLbl)
            {
            }
            column(HomePage_Lbl; HomePageLbl)
            {
            }
            column(InvoiceDiscountBaseAmount_Lbl; InvDiscBaseAmtLbl)
            {
            }
            column(InvoiceDiscountAmount_Lbl; InvDiscountAmtLbl)
            {
            }
            column(LineAmountAfterInvoiceDiscount_Lbl; LineAmtAfterInvDiscLbl)
            {
            }
            column(LocalCurrency_Lbl; LocalCurrencyLbl)
            {
            }
            column(ExchangeRateAsText; ExchangeRateText)
            {
            }
            column(Page_Lbl; PageLbl)
            {
            }
            column(SalesInvoiceLineDiscount_Lbl; SalesInvLineDiscLbl)
            {
            }
            column(Invoice_Lbl; SalesConfirmationLbl)
            {
            }
            column(Subtotal_Lbl; SubtotalLbl)
            {
            }
            column(Total_Lbl; TotalLbl)
            {
            }
            column(VATAmount_Lbl; VATAmtLbl)
            {
            }
            column(VATBase_Lbl; VATBaseLbl)
            {
            }
            column(VATAmountSpecification_Lbl; VATAmtSpecificationLbl)
            {
            }
            column(VATClauses_Lbl; VATClausesLbl)
            {
            }
            column(VATIdentifier_Lbl; VATIdentifierLbl)
            {
            }
            column(VATPercentage_Lbl; VATPercentageLbl)
            {
            }
            column(VATClause_Lbl; VATClause.TableCaption())
            {
            }
            column(ExtDocNo_SalesHeader; "External Document No.")
            {
            }
            column(ExtDocNo_SalesHeader_Lbl; FieldCaption("External Document No."))
            {
            }
            column(ShowWorkDescription; ShowWorkDescription)
            {
            }
            dataitem(Line; "Sales Line")
            {
                DataItemLink = "Document No." = field("No.");
                DataItemLinkReference = Header;
                DataItemTableView = sorting("Document No.", "Line No.");
                UseTemporary = true;
                column(LineNo_Line; "Line No.")
                {
                }
                column(AmountExcludingVAT_Line; Amount)
                {
                    AutoFormatExpression = "Currency Code";
                    AutoFormatType = 1;
                }
                column(AmountExcludingVAT_Line_Lbl; FieldCaption(Amount))
                {
                }
                column(AmountIncludingVAT_Line; "Amount Including VAT")
                {
                    AutoFormatExpression = "Currency Code";
                    AutoFormatType = 1;
                }
                column(AmountIncludingVAT_Line_Lbl; FieldCaption("Amount Including VAT"))
                {
                    AutoFormatExpression = "Currency Code";
                    AutoFormatType = 1;
                }
                column(Description_Line; Description)
                {
                }
                column(Description_Line_Lbl; FieldCaption(Description))
                {
                }
                column(LineDiscountPercent_Line; "Line Discount %")
                {
                }
                column(LineDiscountPercentText_Line; LineDiscountPctText)
                {
                }
                column(LineAmount_Line; FormattedLineAmount)
                {
                    AutoFormatExpression = "Currency Code";
                    AutoFormatType = 1;
                }
                column(LineAmount_Line_Lbl; FieldCaption("Line Amount"))
                {
                }
                column(ItemNo_Line; "No.")
                {
                }
                column(ItemNo_Line_Lbl; FieldCaption("No."))
                {
                }
                column(ShipmentDate_Line; Format("Shipment Date"))
                {
                }
                column(ShipmentDate_Line_Lbl; PostedShipmentDateLbl)
                {
                }
                column(PlannedShipmentDate_Line; Format("Planned Shipment Date"))
                {
                }
                column(PlannedShipmentDate_Line_Lbl; FieldCaption("Planned Shipment Date"))
                {
                }
                column(Quantity_Line; FormattedQuantity)
                {
                }
                column(Quantity_Line_Lbl; FieldCaption(Quantity))
                {
                }
                column(Type_Line; Format(Type))
                {
                }
                column(UnitPrice; FormattedUnitPrice)
                {
                    AutoFormatExpression = "Currency Code";
                    AutoFormatType = 2;
                }
                column(KWATUnitPrice; line."Unit Price")
                {

                }
                column(UnitPrice_Lbl; FieldCaption("Unit Price"))
                {
                }
                column(UnitOfMeasure; "Unit of Measure")
                {
                }
                column(UnitOfMeasure_Lbl; FieldCaption("Unit of Measure"))
                {
                }
                column(KWVariantCode; line."Variant Code")
                {

                }
                column(VATIdentifier_Line; "VAT Identifier")
                {
                }
                column(VATIdentifier_Line_Lbl; FieldCaption("VAT Identifier"))
                {
                }
                column(VATPct_Line; FormattedVATPct)
                {
                }
                column(VATPct_Line_Lbl; FieldCaption("VAT %"))
                {
                }
                column(TransHeaderAmount; TransHeaderAmount)
                {
                    AutoFormatExpression = "Currency Code";
                    AutoFormatType = 1;
                }
                column(ItemReferenceNo; "Item Reference No.")
                {
                }
                column(ItemReferenceNo_Lbl; FieldCaption("Item Reference No."))
                {
                }
                column(KWATVariantDesc1; KWATVariantDesc)
                {

                }
                column(SeasonDesc1; SeasonDesc)
                {

                }
                dataitem(AssemblyLine; "Assembly Line")
                {
                    DataItemTableView = sorting("Document No.", "Line No.");
                    column(LineNo_AssemblyLine; "No.")
                    {
                    }
                    column(Description_AssemblyLine; Description)
                    {
                    }
                    column(Quantity_AssemblyLine; Quantity)
                    {
                        DecimalPlaces = 0 : 5;
                    }
                    column(UnitOfMeasure_AssemblyLine; GetUOMText("Unit of Measure Code"))
                    {
                    }
                    column(VariantCode_AssemblyLine; "Variant Code")
                    {
                    }

                    trigger OnPreDataItem()
                    begin
                        if not DisplayAssemblyInformation then
                            CurrReport.Break();
                        if not AsmInfoExistsForLine then
                            CurrReport.Break();
                        SetRange("Document Type", AsmHeader."Document Type");
                        SetRange("Document No.", AsmHeader."No.");
                    end;
                }

                trigger OnAfterGetRecord()
                var
                    lvsalesHdr: Record "Sales Header";
                    lvsalesHdrArchive: record "Sales Header Archive";
                begin
                    if Type = Type::"G/L Account" then
                        "No." := '';

                    if "Line Discount %" = 0 then
                        LineDiscountPctText := ''
                    else
                        LineDiscountPctText := StrSubstNo('%1%', -Round("Line Discount %", 0.1));

                    if DisplayAssemblyInformation then
                        AsmInfoExistsForLine := AsmToOrderExists(AsmHeader);

                    TransHeaderAmount += PrevLineAmount;
                    PrevLineAmount := "Line Amount";
                    TotalSubTotal += "Line Amount";
                    TotalInvDiscAmount -= "Inv. Discount Amount";
                    TotalAmount += Amount;
                    TotalAmountVAT += "Amount Including VAT" - Amount;
                    TotalAmountInclVAT += "Amount Including VAT";
                    TotalPaymentDiscOnVAT += -("Line Amount" - "Inv. Discount Amount" - "Amount Including VAT");
                    OnLineOnAfterGetRecordOnAfterCalcTotals(Header, Line, TotalAmount, TotalAmountVAT, TotalAmountInclVAT);

                    FormatDocument.SetSalesLine(Line, FormattedQuantity, FormattedUnitPrice, FormattedVATPct, FormattedLineAmount);

                    if FirstLineHasBeenOutput then
                        Clear(DummyCompanyInfo.Picture);
                    FirstLineHasBeenOutput := true;
                    //Variant code description

                    If Itemvariant.GET(Line."No.", Line."Variant Code") then begin
                        KWATVariantDesc := Itemvariant.Description
                    end else begin
                        KWATVariantDesc := '';
                    end;
                    //Dimension value code description
                    IF DimensionValue.GET(GLSetup."Global Dimension 1 Code", Line."Shortcut Dimension 1 Code") then begin
                        SeasonDesc := DimensionValue.Name;
                    end else begin
                        SeasonDesc := '';
                    end;
                    ;

                end;

                trigger OnPreDataItem()
                begin
                    MoreLines := Find('+');
                    while MoreLines and (Description = '') and ("No." = '') and (Quantity = 0) and (Amount = 0) do
                        MoreLines := Next(-1) <> 0;
                    if not MoreLines then
                        CurrReport.Break();
                    SetRange("Line No.", 0, "Line No.");
                    TransHeaderAmount := 0;
                    PrevLineAmount := 0;
                    FirstLineHasBeenOutput := false;
                    DummyCompanyInfo.Picture := CompanyInfo.Picture;

                end;
            }

            trigger OnAfterGetRecord()
            var
                CurrencyExchangeRate: Record "Currency Exchange Rate";
                Currency: Record Currency;
                GeneralLedgerSetup: Record "General Ledger Setup";
                ArchiveManagement: Codeunit ArchiveManagement;
                SalesPost: Codeunit "Sales-Post";
            begin
                FirstLineHasBeenOutput := false;
                Clear(Line);
                Clear(SalesPost);
                Header.CalcFields("No. of Archived Versions");
                //VATAmountLine.DeleteAll();
                Line.DeleteAll();
                SalesPost.GetSalesLines(Header, Line, 0, false);
                OnLineOnAfterGetRecordOnBeforeCalcVATAmountLines(Header, Line);
                //Line.CalcVATAmountLines(0, Header, Line, VATAmountLine);
                //Line.UpdateVATOnLines(0, Header, Line, VATAmountLine);
                //OnHeaderOnAfterGetRecordOnAfterUpdateVATOnLines(Header, Line, VATAmountLine);

                if not IsReportInPreviewMode() then
                    CODEUNIT.Run(CODEUNIT::"Sales-Printed", Header);

                OnHeaderOnAfterGetRecordOnAfterUpdateNoPrinted(IsReportInPreviewMode(), Header);

                CurrReport.Language := LanguageMgt.GetLanguageIdOrDefault("Language Code");
                CurrReport.FormatRegion := LanguageMgt.GetFormatRegionOrDefault("Format Region");
                FormatAddr.SetLanguageCode("Language Code");

                CalcFields("Work Description");
                ShowWorkDescription := "Work Description".HasValue;

                FormatAddr.GetCompanyAddr("Responsibility Center", RespCenter, CompanyInfo, CompanyAddr);
                FormatAddr.SalesHeaderBillTo(CustAddr, Header);
                ShowShippingAddr := FormatAddr.SalesHeaderShipTo(ShipToAddr, CustAddr, Header);

                if not CompanyBankAccount.Get(Header."Company Bank Account Code") then
                    CompanyBankAccount.CopyBankFieldsFromCompanyInfo(CompanyInfo);

                if not Cust.Get("Bill-to Customer No.") then
                    Clear(Cust);

                if "Currency Code" <> '' then begin
                    CurrencyExchangeRate.FindCurrency("Posting Date", "Currency Code", 1);
                    CalculatedExchRate :=
                      Round(1 / "Currency Factor" * CurrencyExchangeRate."Exchange Rate Amount", 0.000001);
                    ExchangeRateText := StrSubstNo(ExchangeRateTxt, CalculatedExchRate, CurrencyExchangeRate."Exchange Rate Amount");
                    CurrCode := "Currency Code";
                    if Currency.Get("Currency Code") then
                        CurrSymbol := Currency.GetCurrencySymbol();
                end else
                    if GeneralLedgerSetup.Get() then begin
                        CurrCode := GeneralLedgerSetup."LCY Code";
                        CurrSymbol := GeneralLedgerSetup.GetCurrencySymbol();
                    end;

                FormatDocumentFields(Header);
                if SellToContact.Get("Sell-to Contact No.") then;
                if BillToContact.Get("Bill-to Contact No.") then;

                if not IsReportInPreviewMode() and
                   (CurrReport.UseRequestPage and ArchiveDocument or
                    not CurrReport.UseRequestPage and SalesSetup."Archive Orders")
                then
                    ArchiveManagement.StoreSalesDocument(Header, LogInteraction);

                TotalSubTotal := 0;
                TotalInvDiscAmount := 0;
                TotalAmount := 0;
                TotalAmountVAT := 0;
                TotalAmountInclVAT := 0;
                TotalPaymentDiscOnVAT := 0;
                getAnalysisDesc();
                getfreightDesc();
                getOtherDesc();
                getToleranceDesc();
                getTraderDesc();
                getweightDesc();
                //seller Details
                IF Sellercustomer.get(Header.KWAT_Seller) then begin
                    getSellerDetails(Sellercustomer."No.");
                end;
                //Buyer details
                IF Buyercustomer.get(Header.KWAT_Buyer) then begin
                    getBuyerDetails(Buyercustomer."No.");
                end;
                DeliveryPeriod := format("KWAT_Delivery Start") + ' TO ' + Format("KWAT_Delivery End");
                Header.CalcFields("Work Description");
                KWATWorkDesc := GetWorkDescription();
            end;
        }
    }

    requestpage
    {
        SaveValues = true;

        layout
        {
            area(content)
            {
                group(Options)
                {
                    Caption = 'Options';
                    field(LogInteraction; LogInteraction)
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Log Interaction';
                        Enabled = LogInteractionEnable;
                        ToolTip = 'Specifies that interactions with the contact are logged.';
                    }
                    field(DisplayAsmInformation; DisplayAssemblyInformation)
                    {
                        ApplicationArea = Assembly;
                        Caption = 'Show Assembly Components';
                        ToolTip = 'Specifies if you want the report to include information about components that were used in linked assembly orders that supplied the item(s) being sold. (Only possible for RDLC report layout.)';
                    }
                    field(ArchiveDocument; ArchiveDocument)
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Archive Document';
                        ToolTip = 'Specifies if the document is archived after you print it.';

                        trigger OnValidate()
                        begin
                            if not ArchiveDocument then
                                LogInteraction := false;
                        end;
                    }
                }
            }
        }

        actions
        {
        }

        trigger OnInit()
        begin
            LogInteractionEnable := true;
            ArchiveDocument := SalesSetup."Archive Orders";

            OnAfterOnInit(Header);
        end;

        trigger OnOpenPage()
        begin
            InitLogInteraction();
            LogInteractionEnable := LogInteraction;
        end;
    }


    labels
    {
    }

    trigger OnInitReport()
    var
        SalesHeader: Record "Sales Header";
        IsHandled: Boolean;
    begin
        GLSetup.Get();
        CompanyInfo.SetAutoCalcFields(Picture);
        CompanyInfo.Get();
        SalesSetup.Get();
        CompanyInfo.VerifyAndSetPaymentInfo();

        if SalesHeader.GetLegalStatement() <> '' then
            LegalStatementLbl := SalesHeader.GetLegalStatement();

        IsHandled := false;
        OnInitReportForGlobalVariable(IsHandled, LegalOfficeTxt, LegalOfficeLbl, CustomGiroTxt, CustomGiroLbl, LegalStatementLbl);
#if not CLEAN23
        if not IsHandled then begin
            //LegalOfficeTxt := CompanyInfo.GetLegalOffice();
            //LegalOfficeLbl := CompanyInfo.GetLegalOfficeLbl();
            //CustomGiroTxt := CompanyInfo.GetCustomGiro();
            //CustomGiroLbl := CompanyInfo.GetCustomGiroLbl();
        end;
#endif
    end;

    trigger OnPostReport()
    begin
        if LogInteraction and not IsReportInPreviewMode() then
            if Header.FindSet() then
                repeat
                    Header.CalcFields("No. of Archived Versions");
                    if Header."Bill-to Contact No." <> '' then
                        SegManagement.LogDocument(
                          3, Header."No.", Header."Doc. No. Occurrence",
                          Header."No. of Archived Versions", DATABASE::Contact, Header."Bill-to Contact No."
                          , Header."Salesperson Code", Header."Campaign No.", Header."Posting Description", Header."Opportunity No.")
                    else
                        SegManagement.LogDocument(
                          3, Header."No.", Header."Doc. No. Occurrence",
                          Header."No. of Archived Versions", DATABASE::Customer, Header."Bill-to Customer No.",
                          Header."Salesperson Code", Header."Campaign No.", Header."Posting Description", Header."Opportunity No.");

                until Header.Next() = 0;
    end;

    trigger OnPreReport()
    begin
        //if Header.GetFilters = '' then
        //Error(NoFilterSetErr);

        if not CurrReport.UseRequestPage then
            InitLogInteraction();

        CompanyLogoPosition := SalesSetup."Logo Position on Documents";
    end;

    procedure getTraderDesc()
    var
        KWAdvanceTrading_Trader: Record KWAdvanceTrading_Trader;
    begin
        BoldTraderDesc := false;
        IF KWAdvanceTrading_Trader.GET(Header."KWAT_Trader Code") then
            KWAT_TraderDesc := KWAdvanceTrading_Trader.Description
        else
            KWAT_TraderDesc := '';
        if Header."No. of Archived Versions" > 0 then
            GetSalesHeaderArchive(Header);
        GetSalesHeaderArchive(Header);
        BoldTraderDesc := AdvanceTradingMgt.CompareSalesHeaders(Header, SalesHdrArchive, Header.FieldNo("KWAT_Tolerance Code"));
    end;


    procedure getAnalysisDesc()
    var
        KWAdvanceTradingAnalysis: Record KWAdvanceTrading_Analysis;
    begin
        BoldAnalysisDesc := false;
        IF KWAdvanceTradingAnalysis.GET(Header."KWAT_Analysis Code") then
            KWAT_AnalysisDesc := KWAdvanceTradingAnalysis.Description
        else
            KWAT_AnalysisDesc := '';
        GetSalesHeaderArchive(Header);
        BoldAnalysisDesc := AdvanceTradingMgt.CompareSalesHeaders(Header, SalesHdrArchive, Header.FieldNo("KWAT_Tolerance Code"));
    end;


    procedure getOtherDesc()
    var
        KWAdvanceTradingOther: Record KWAdvanceTrading_Other;
    begin
        BoldOtherCodeDesc := false;
        IF KWAdvanceTradingOther.GET(Header."KWAT_Other Code") then
            KWAT_OtherCodeDesc := KWAdvanceTradingOther.Description
        else
            KWAT_OtherCodeDesc := '';
        GetSalesHeaderArchive(Header);
        BoldOtherCodeDesc := AdvanceTradingMgt.CompareSalesHeaders(Header, SalesHdrArchive, Header.FieldNo("KWAT_Tolerance Code"));
    end;

    procedure getweightDesc()
    var
        KWATweight: Record KWAdvanceTrading_Weight;
    begin
        BoldweightDesc := false;
        IF KWATweight.GET(Header."KWAT_Weight Code") then
            KWAT_WeightDesc := KWATweight.Description
        else
            KWAT_WeightDesc := '';
        GetSalesHeaderArchive(Header);
        BoldweightDesc := AdvanceTradingMgt.CompareSalesHeaders(Header, SalesHdrArchive, Header.FieldNo("KWAT_Tolerance Code"));
    end;

    procedure getfreightDesc()
    var
        KWAdvanceTradingFreight: Record KWAdvanceTrading_Freight;
    begin
        BoldfreightDesc := false;
        IF KWAdvanceTradingFreight.GET(Header."KWAT_Freight Code") then
            KWAT_FreightCodeDesc := KWAdvanceTradingFreight.Description
        else
            KWAT_FreightCodeDesc := '';
        GetSalesHeaderArchive(Header);
        BoldfreightDesc := AdvanceTradingMgt.CompareSalesHeaders(Header, SalesHdrArchive, Header.FieldNo("KWAT_Tolerance Code"));
    end;

    procedure getToleranceDesc()
    var
        KWATTol: Record KW_AdvanceTrading_Tolerance;
    begin
        BoldToleranceDesc := false;
        IF KWATTol.GET(Header."KWAT_Tolerance Code") then
            KWAT_ToleranceDesc := KWATTol.Description
        else
            KWAT_ToleranceDesc := '';
        GetSalesHeaderArchive(Header);
        BoldToleranceDesc := AdvanceTradingMgt.CompareSalesHeaders(Header, SalesHdrArchive, Header.FieldNo("KWAT_Tolerance Code"));
    end;

    local procedure GetSalesHeaderArchive(Header: Record "Sales Header")
    begin
        SalesHdrArchive.Reset();
        SalesHdrArchive.SetRange("Document Type", Header."Document Type");
        SalesHdrArchive.SetRange("No.", Header."No.");
        IF SalesHdrArchive.FindLast() then;
    end;

    procedure getSellerDetails(CustNo: code[20])
    var
        lvCustomer: Record Customer;
    begin
        IF lvCustomer.get(CustNo) then begin
            SellerDescription := lvCustomer.Name;
            SellerContact := lvCustomer.Contact;
            SellerAdd := lvCustomer.Address;
            SellerMob := lvCustomer."Mobile Phone No.";
            SellerEmail := lvCustomer."E-Mail";
            SellerABN := lvCustomer.ABN;
            SellerNGR := lvCustomer.KWAT_NGR;
        end else begin
            SellerDescription := '';
            SellerContact := '';
            SellerAdd := '';
            SellerMob := '';
            SellerEmail := '';
            SellerABN := '';
            SellerNGR := '';
        end;
        ;
    end;

    procedure getBuyerDetails(CustNo: code[20])
    var
        lvCustomer: Record Customer;
    begin
        IF lvCustomer.get(CustNo) then begin
            BuyerDescription := lvCustomer.Name;
            BuyerContact := lvCustomer.Contact;
            BuyerAdd := lvCustomer.Address;
            BuyerMob := lvCustomer."Mobile Phone No.";
            BuyerEmail := lvCustomer."E-Mail";
            BuyerABN := lvCustomer.ABN;
            BuyerNGR := lvCustomer.KWAT_NGR;
        end else begin
            BuyerAdd := '';
            BuyerMob := '';
            BuyerEmail := '';
            BuyerABN := '';
            BuyerNGR := '';

        end;
        ;
    end;

    var
        GLSetup: Record "General Ledger Setup";
        CompanyBankAccount: Record "Bank Account";
        DummyCompanyInfo: Record "Company Information";
        SalesSetup: Record "Sales & Receivables Setup";
        Cust: Record Customer;
        RespCenter: Record "Responsibility Center";
        AsmHeader: Record "Assembly Header";
        SellToContact: Record Contact;
        BillToContact: Record Contact;
        LanguageMgt: Codeunit Language;
        FormatAddr: Codeunit "Format Address";
        FormatDocument: Codeunit "Format Document";
        SegManagement: Codeunit SegManagement;
        AutoFormat: Codeunit "Auto Format";
        WorkDescriptionInstream: InStream;
        MoreLines: Boolean;
        CopyText: Text[30];
        TransHeaderAmount: Decimal;
        LogInteractionEnable: Boolean;
        AsmInfoExistsForLine: Boolean;
        CompanyLogoPosition: Integer;
        CalculatedExchRate: Decimal;
        ExchangeRateText: Text;
        VATClauseText: Text;
        PrevLineAmount: Decimal;
        PmtDiscText: Text;
        ShowWorkDescription: Boolean;
        WorkDescriptionLine: Text;
        CompanyInfoBankAccNoLbl: Label 'Account No.';
        CompanyInfoBankNameLbl: Label 'Bank';
        CompanyInfoGiroNoLbl: Label 'Giro No.';
        CompanyInfoPhoneNoLbl: Label 'Phone No.';
        CopyLbl: Label 'Copy';
        EMailLbl: Label 'Email';
        HomePageLbl: Label 'Home Page';
        InvDiscBaseAmtLbl: Label 'Invoice Discount Base Amount';
        InvDiscountAmtLbl: Label 'Invoice Discount';
        InvNoLbl: Label 'Order No.';
        LineAmtAfterInvDiscLbl: Label 'Payment Discount on VAT';
        LocalCurrencyLbl: Label 'Local Currency';
        PageLbl: Label 'Page';
        PostedShipmentDateLbl: Label 'Shipment Date';
        ShipmentLbl: Label 'Shipment';
        ShiptoAddrLbl: Label 'Ship-to Address';
        SubtotalLbl: Label 'Subtotal';
        TotalLbl: Label 'Total';
        VATAmtSpecificationLbl: Label 'VAT Amount Specification';
        VATAmtLbl: Label 'VAT Amount';
        VATAmountLCYLbl: Label 'VAT Amount (LCY)';
        VATBaseLbl: Label 'VAT Base';
        VATBaseLCYLbl: Label 'VAT Base (LCY)';
        VATClausesLbl: Label 'VAT Clause';
        VATIdentifierLbl: Label 'VAT Identifier';
        VATPercentageLbl: Label 'VAT %';
        ExchangeRateTxt: Label 'Exchange rate: %1/%2', Comment = '%1 and %2 are both amounts.';
        NoFilterSetErr: Label 'You must specify one or more filters to avoid accidently printing all documents.';
        GreetingLbl: Label 'Hello';
        ClosingLbl: Label 'Sincerely';
        PmtDiscTxt: Label 'If we receive the payment before %1, you are eligible for a %2% payment discount.', Comment = '%1 Discount Due Date %2 = value of Payment Discount % ';
        BodyLbl: Label 'Thank you for your business. Your order confirmation is attached to this message.';
        SellToContactPhoneNoLbl: Label 'Sell-to Contact Phone No.';
        SellToContactMobilePhoneNoLbl: Label 'Sell-to Contact Mobile Phone No.';
        SellToContactEmailLbl: Label 'Sell-to Contact E-Mail';
        BillToContactPhoneNoLbl: Label 'Bill-to Contact Phone No.';
        BillToContactMobilePhoneNoLbl: Label 'Bill-to Contact Mobile Phone No.';
        BillToContactEmailLbl: Label 'Bill-to Contact E-Mail';
        LCYTxt: label ' (LCY)';
        LegalOfficeTxt, LegalOfficeLbl, CustomGiroTxt, CustomGiroLbl, LegalStatementLbl : Text;

    protected var
        CompanyInfo: Record "Company Information";
        PaymentTerms: Record "Payment Terms";
        PaymentMethod: Record "Payment Method";
        SalespersonPurchaser: Record "Salesperson/Purchaser";
        ShipmentMethod: Record "Shipment Method";
        VATClause: Record "VAT Clause";
        CustAddr: array[8] of Text[100];
        ShipToAddr: array[8] of Text[100];
        CompanyAddr: array[8] of Text[100];
        ArchiveDocument: Boolean;
        DisplayAssemblyInformation: Boolean;
        LogInteraction: Boolean;
        TotalSubTotal: Decimal;
        TotalAmount: Decimal;
        TotalAmountInclVAT: Decimal;
        TotalAmountVAT: Decimal;
        TotalInvDiscAmount: Decimal;
        TotalPaymentDiscOnVAT: Decimal;
        FirstLineHasBeenOutput: Boolean;
        TotalExclVATText: Text[50];
        TotalInclVATText: Text[50];
        TotalText: Text[50];
        CurrCode: Text[10];
        CurrSymbol: Text[10];
        FormattedLineAmount: Text;
        FormattedQuantity: Text;
        FormattedUnitPrice: Text;
        FormattedVATPct: Text;
        LineDiscountPctText: Text;
        SalesPersonText: Text[50];
        ShowShippingAddr: Boolean;
        VATBaseLCY: Decimal;
        VATAmountLCY: Decimal;
        TotalVATBaseLCY: Decimal;
        TotalVATAmountLCY: Decimal;
        PaymentTermsDescLbl: Label 'Payment Terms';
        PaymentMethodDescLbl: Label 'Payment Method';
        SalesConfirmationLbl: Label 'Order Confirmation';
        SalesInvLineDiscLbl: Label 'Discount %';
        SalespersonLbl: Label 'Sales person';
        ShptMethodDescLbl: Label 'Shipment Method';
        KTWABuyerDesc: Text[100];
        KWAT_TraderDesc: Text[100];
        KWAT_ToleranceDesc: Text[100];
        KWAT_WeightDesc: Text[100];
        KWAT_FreightDesc: Action;
        KWAT_FreightCodeDesc: Text[100];
        KWAT_AnalysisDesc: Text[100];
        Sellercustomer: Record Customer;
        Buyercustomer: Record Customer;
        KWAT_OtherCodeDesc: Text[100];
        SellerAdd: text[200];
        SellerMob: code[20];
        SellerEmail: text[100];
        SellerABN: code[12];
        SellerNGR: Code[20];
        BuyerAdd: text[200];
        BuyerMob: code[20];
        BuyerEmail: text[100];
        BuyerABN: code[12];
        BuyerNGR: Code[20];
        sellerDescription: Text[100];
        SellerContact: Text[50];
        BuyerDescription: Text[100];
        BuyerContact: Text[50];
        DeliveryPeriod: Text[100];
        Itemvariant: Record "Item Variant";
        KWATVariantDesc: Text[100];
        DimensionValue: Record "Dimension Value";
        SeasonDesc: Text[100];
        KWATWorkDesc: Text[1024];
        BoldAnalysisDesc: Boolean;
        BoldfreightDesc: boolean;
        BoldOtherDesc: boolean;
        BoldToleranceDesc: boolean;
        BoldTraderDesc: boolean;
        BoldweightDesc: boolean;
        SalesHdrArchive: Record "Sales Header Archive";
        AdvanceTradingMgt: Codeunit "AdvanceTradingMgt";

        BoldOtherCodeDesc: Boolean;


    local procedure InitLogInteraction()
    begin
        LogInteraction := SegManagement.FindInteractionTemplateCode(Enum::"Interaction Log Entry Document Type"::"Sales Ord. Cnfrmn.") <> '';
    end;

    local procedure DocumentCaption() DocCaption: Text[250]
    begin
        DocCaption := SalesConfirmationLbl;

        OnAfterDocumentCaption(Header, DocCaption);
    end;

    procedure InitializeRequest(NewLogInteraction: Boolean; DisplayAsmInfo: Boolean)
    begin
        LogInteraction := NewLogInteraction;
        DisplayAssemblyInformation := DisplayAsmInfo;
    end;

    protected procedure IsReportInPreviewMode(): Boolean
    var
        MailManagement: Codeunit "Mail Management";
    begin
        exit(CurrReport.Preview() or MailManagement.IsHandlingGetEmailBody());
    end;

    local procedure FormatDocumentFields(SalesHeader: Record "Sales Header")
    begin
        FormatDocument.SetTotalLabels(SalesHeader."Currency Code", TotalText, TotalInclVATText, TotalExclVATText);
        FormatDocument.SetSalesPerson(SalespersonPurchaser, SalesHeader."Salesperson Code", SalesPersonText);
        FormatDocument.SetPaymentTerms(PaymentTerms, SalesHeader."Payment Terms Code", SalesHeader."Language Code");
        FormatDocument.SetPaymentMethod(PaymentMethod, SalesHeader."Payment Method Code", SalesHeader."Language Code");
        FormatDocument.SetShipmentMethod(ShipmentMethod, SalesHeader."Shipment Method Code", SalesHeader."Language Code");

        OnAfterFormatDocumentFields(SalesHeader);
    end;

    local procedure GetUOMText(UOMCode: Code[10]): Text[50]
    var
        UnitOfMeasure: Record "Unit of Measure";
    begin
        if not UnitOfMeasure.Get(UOMCode) then
            exit(UOMCode);
        exit(UnitOfMeasure.Description);
    end;

    // local procedure CreateReportTotalLines()
    // begin
    //     ReportTotalsLine.DeleteAll();
    //     if (TotalInvDiscAmount <> 0) or (TotalAmountVAT <> 0) then
    //         ReportTotalsLine.Add(SubtotalLbl, TotalSubTotal, true, false, false, Header."Currency Code");
    //     if TotalInvDiscAmount <> 0 then begin
    //         ReportTotalsLine.Add(InvDiscountAmtLbl, TotalInvDiscAmount, false, false, false, Header."Currency Code");
    //         if TotalAmountVAT <> 0 then
    //             ReportTotalsLine.Add(TotalExclVATText, TotalAmount, true, false, false, Header."Currency Code");
    //     end;
    //     if TotalAmountVAT <> 0 then begin
    //         ReportTotalsLine.Add(VATAmountLine.VATAmountText(), TotalAmountVAT, false, true, false, Header."Currency Code");
    //         if TotalVATAmountLCY <> TotalAmountVAT then
    //             ReportTotalsLine.Add(VATAmountLine.VATAmountText() + LCYTxt, TotalVATAmountLCY, false, true, false);
    //     end;
    // end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterOnInit(var SalesHeader: Record "Sales Header")
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterDocumentCaption(SalesHeader: Record "Sales Header"; var DocCaption: Text[250])
    begin
    end;

    // [IntegrationEvent(false, false)]
    // local procedure OnHeaderOnAfterGetRecordOnAfterUpdateVATOnLines(var SalesHeader: Record "Sales Header"; var SalesLine: Record "Sales Line"; var VATAmountLine: Record "VAT Amount Line")
    // begin
    // end;

    [IntegrationEvent(false, false)]
    local procedure OnLineOnAfterGetRecordOnBeforeCalcVATAmountLines(SalesHeader: Record "Sales Header"; var SalesLine: Record "Sales Line")
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnLineOnAfterGetRecordOnAfterCalcTotals(var SalesHeader: Record "Sales Header"; var SalesLine: Record "Sales Line"; var VATBaseAmount: Decimal; var VATAmount: Decimal; var TotalAmountInclVAT: Decimal)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterFormatDocumentFields(var SalesHeader: Record "Sales Header")
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnInitReportForGlobalVariable(var IsHandled: Boolean; var LegalOfficeTxt: Text; var LegalOfficeLbl: Text; var CustomGiroTxt: Text; var CustomGiroLbl: Text; var LegalStatementLbl: Text)
    begin
    end;

    [IntegrationEvent(true, false)]
    local procedure OnHeaderOnAfterGetRecordOnAfterUpdateNoPrinted(ReportInPreviewMode: Boolean; var SalesHeader: Record "Sales Header")
    begin
    end;
}

