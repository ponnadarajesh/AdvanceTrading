codeunit 50100 AdvanceTradingMgt
{
    // [EventSubscriber(ObjectType::Table, Database::"Sales Line", '', '', false, false)]
    // local procedure MyProcedure()
    // begin

    // end;
    procedure CompareSalesHeaders(var SalesHeader: Record "Sales Header"; var SalesHeaderArchive: Record "Sales Header Archive"; FieldNo: Integer): Boolean
    var
        RecRef1, RecRef2 : RecordRef;
        FieldRef1, FieldRef2 : FieldRef;
    begin
        RecRef1.GetTable(SalesHeader);
        RecRef2.GetTable(SalesHeaderArchive);

        FieldRef1 := RecRef1.Field(FieldNo);
        FieldRef2 := RecRef2.Field(FieldNo);

        // Compare values of the specified field
        if FieldRef1.Value <> FieldRef2.Value then
            exit(true);

        exit(false);
    end;

    procedure SendEmailWithReportAttachmentFromSI(SalesInvoiceNo: Code[20]; ReportID: Integer; ReportName: Text)
    var
        SalesInvoiceHeader: Record "Sales Invoice Header";
        TempBlob: Codeunit "Temp Blob";
        Email: Codeunit "Email";
        EmailMessage: Codeunit "Email Message";
        InStr: InStream;
        OutStr: OutStream;
        ReportParameters: Text;
        recref: RecordRef;
    begin
        // Fetch the Sales Invoice Header record
        SalesInvoiceHeader.Get(SalesInvoiceNo);
        recref.GetTable(SalesInvoiceHeader);
        recref.SetTable(SalesInvoiceHeader);

        // Run the report request page to allow user to set filters (optional)
        //ReportParameters := Report.RunRequestPage(ReportID, SalesInvoiceHeader."No.");

        // Save the report as PDF into a TempBlob
        TempBlob.CreateOutStream(OutStr);
        Report.SaveAs(ReportID, ReportParameters, ReportFormat::Pdf, OutStr, recref);

        // Prepare the email message
        TempBlob.CreateInStream(InStr);
        EmailMessage.Create('', 'Draft: ' + ReportName + SalesInvoiceNo, 'Please review the attached' + ReportName + '.');

        // Add the report as an attachment
        EmailMessage.AddAttachment(ReportName + ' ' + SalesInvoiceNo + '.pdf', 'application/pdf', InStr);

        // Open the email in the editor (draft mode) for user input
        Email.OpenInEditor(EmailMessage, Enum::"Email Scenario"::Default);
    end;

    procedure SendEmailWithReportAttachmentFromSO(SalesOrderNo: Code[20]; ReportID: Integer; ReportName: Text)
    var
        SalesHeader: Record "Sales Header";
        TempBlob: Codeunit "Temp Blob";
        Email: Codeunit "Email";
        EmailMessage: Codeunit "Email Message";
        InStr: InStream;
        OutStr: OutStream;
        ReportParameters: Dictionary of [Text, Text];
        recref: RecordRef;
    begin
        // Fetch the Sales Header record
        SalesHeader.Get(SalesHeader."Document Type"::Order, SalesOrderNo);
        RecRef.Open(Database::"Sales Header");
        RecRef.Field(SalesHeader.FieldNo("Document Type")).SetRange(SalesHeader."Document Type");
        RecRef.Field(SalesHeader.FieldNo("No.")).SetRange(SalesHeader."No.");

        //recref.GetTable(SalesHeader);
        //recref.SetTable(SalesHeader);
        //Run the report request page to allow user to set filters (optional)
        //ReportParameters := Report.RunRequestPage(ReportID, SalesHeader."No.");
        //ReportParameters.Add('DocumentType', Format(SalesHeader."Document Type"::Order));
        //ReportParameters.Add('SalesOrderNo', SalesOrderNo);
        // Save the report as PDF into a TempBlob   
        TempBlob.CreateOutStream(OutStr);
        Report.SaveAs(ReportID, '', ReportFormat::Pdf, OutStr, recref);

        // Prepare the email message
        // Prepare the email message
        TempBlob.CreateInStream(InStr);
        EmailMessage.Create('', 'Draft: ' + ReportName + SalesOrderNo, 'Please review the attached' + ReportName + '.');

        // Add the report as an attachment
        EmailMessage.AddAttachment(ReportName + ' ' + SalesOrderNo + '.pdf', 'application/pdf', InStr);

        // Open the email in the editor (draft mode) for user input
        Email.OpenInEditor(EmailMessage, Enum::"Email Scenario"::Default);
    end;

    local procedure GetReportParametersAsXml(Parameters: Dictionary of [Text, Text]): Text
    var
        XmlDoc: XmlDocument;
        XmlElem: XmlElement;
        XmlAttr: XmlAttribute;
        KeyValue: Text;
    begin
        // Create a simple XML structure for report parameters
        XmlDoc := XmlDocument.Create();
        XmlElem := XmlElement.Create('ReportParameters');
        XmlDoc.Add(XmlElem);

        foreach KeyValue in Parameters.Keys() do begin
            XmlAttr := XmlAttribute.Create(KeyValue, KeyValue);
            XmlAttr.Value(Parameters.Get(KeyValue));
            XmlElem.Add(XmlAttr);
        end;

        exit(XmlDocToText(XmlDoc));
    end;

    local procedure XmlDocToText(XmlDoc: XmlDocument): Text
    var
        XmlText: Text;
    begin
        XmlDoc.WriteTo(XmlText);
        exit(XmlText);
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Release Sales Document", 'OnAfterManualReleaseSalesDoc', '', false, false)]
    local procedure SOReleaseArchived(var SalesHeader: Record "Sales Header"; PreviewMode: Boolean)
    var
        ArchiveMgt: Codeunit ArchiveManagement;
    begin
        IF not PreviewMode then begin
            ArchiveMgt.ArchiveSalesDocument(SalesHeader);
        end;
    end;
}
