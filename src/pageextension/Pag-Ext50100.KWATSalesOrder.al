pageextension 50100 "KWAT_SalesOrder" extends "Sales Order"
{
    layout
    {
        addafter(SalesLines)
        {
            group(AdvanceTrading)
            {
                Caption = 'Advance Trading';
                field("KWAT_Agent Note"; Rec."KWAT_Agent Note")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Agent Note field.', Comment = '%';
                }
                field("KWAT_Broker Note"; Rec."KWAT_Broker Note")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Broker Note field.', Comment = '%';
                }

                field(KWAT_Buyer; Rec.KWAT_Buyer)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Buyer field.', Comment = '%';
                    Editable = rec."KWAT_Broker Note";
                }
                field(KTWABuyerDesc1; KTWABuyerDesc)
                {
                    caption = 'Buyer Name';
                    ApplicationArea = All;
                }
                field("KWAT_Buyer Reference"; Rec."KWAT_Buyer Reference")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Buyer Reference field.', Comment = '%';
                }

                field(KWAT_Seller; Rec.KWAT_Seller)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Seller field.', Comment = '%';
                    Editable = rec."KWAT_Agent Note";
                }
                field(KTWASellerDesc1; KTWASellerDesc)
                {
                    ApplicationArea = All;
                    caption = 'Seller Name';
                }
                field("KWAT_Seller Reference"; Rec."KWAT_Seller Reference")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Seller Reference field.', Comment = '%';
                }
                field("KWAT_Trader Code"; Rec."KWAT_Trader Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Trader Code field.', Comment = '%';
                    trigger OnValidate()
                    begin
                        getTraderDesc();
                    end;
                }
                field(KWAT_TraderDesc; KWAT_TraderDesc)
                {
                    Caption = 'Trader Description';
                    ApplicationArea = All;
                }

                field("KWAT_Tolerance Code"; Rec."KWAT_Tolerance Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Tolerance Code field.', Comment = '%';
                    trigger OnValidate()
                    begin
                        getToleranceDesc();
                    end;
                }
                field(KWAT_ToleranceDesc; KWAT_ToleranceDesc)
                {
                    Caption = 'Tolerance Description';
                    ApplicationArea = All;
                }
                field("KWAT_Weight Code"; Rec."KWAT_Weight Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Weight Code field.', Comment = '%';
                    trigger OnValidate()
                    begin
                        getweightDesc();
                    end;
                }
                field(KWAT_WeightDesc; KWAT_WeightDesc)
                {
                    Caption = 'Weight Description';
                    ApplicationArea = All;
                }
                field("KWAT_Freight Code"; Rec."KWAT_Freight Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Freight Code field.', Comment = '%';
                    trigger OnValidate()
                    begin
                        getfreightDesc();
                    end;
                }
                field(KWAT_FreightDesc; KWAT_FreightCodeDesc)
                {
                    Caption = 'Freight Description';
                    ApplicationArea = All;
                }

                field("KWAT_Analysis Code"; Rec."KWAT_Analysis Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the AT Analysis Code field.', Comment = '%';
                    trigger OnValidate()
                    begin
                        getAnalysisDesc();
                    end;
                }
                field(KWAT_AnalysisDesc; KWAT_AnalysisDesc)
                {
                    Caption = 'Analysis Description';
                    ApplicationArea = All;
                }
                field("KWAT_Other Code"; Rec."KWAT_Other Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Other Code field.', Comment = '%';
                    trigger OnValidate()
                    begin
                        getOtherDesc();
                    end;
                }
                field(KWAT_OtherDesc; KWAT_OtherCodeDesc)
                {
                    Caption = 'Other Description';
                    ApplicationArea = All;
                }
                field(KWAT_Transporter; Rec.KWAT_Transporter)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Transporter field.', Comment = '%';
                }
                field("KWAT_Trader Price"; Rec."KWAT_Trader Price")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Trader Price field.', Comment = '%';
                }
                field("KWAT_DeliveryPoint Code"; Rec."KWAT_DeliveryPoint Code")
                {
                    ApplicationArea = All;
                    caption = 'Delivery Point';
                    ToolTip = 'Specifies the value of the Delivery Point Code field.', Comment = '%';
                }
                field(KWAT_DPDesc; KWAT_DPDesc)
                {
                    ApplicationArea = All;
                    Caption = 'Delivery Point Name';
                }
                field("KWAT_Delivery Start"; Rec."KWAT_Delivery Start")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Delivery Start field.', Comment = '%';
                }
                field("KWAT_Delivery End"; Rec."KWAT_Delivery End")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Delivery End field.', Comment = '%';
                }
            }
        }
    }
    actions
    {
        addafter("Send IC Sales Order")
        {
            action(printAgentNoteSeller)
            {
                ApplicationArea = All;
                Image = Print;
                Caption = 'Print Agent Note(Seller)';
                Promoted = true;
                PromotedCategory = Process;
                ToolTip = 'It will print Agent Note(Seller)';
                trigger OnAction()
                var
                    KTAgentNote: Report "KT Agent Note Seller";
                    SalesHdr: Record "Sales Header";
                begin
                    Rec.testfield("KWAT_Agent Note", true);
                    //Message('In Progress');
                    Clear(KTAgentNote);
                    SalesHdr.Reset();
                    SalesHdr.SetRange("Document Type", rec."Document Type");
                    SalesHdr.SetRange("No.", Rec."No.");
                    KTAgentNote.SetTableView(SalesHdr);
                    KTAgentNote.RunModal();

                end;
            }
            action(EmailAgentNoteSeller)
            {
                ApplicationArea = All;
                Image = Email;
                Caption = 'Email Agent Note(Seller)';
                Promoted = true;
                PromotedCategory = Process;
                ToolTip = 'It will Email Agent Note(Seller)';
                trigger OnAction()
                var
                    AdvanceTradingMgt: Codeunit AdvanceTradingMgt;
                begin
                    Rec.testfield("KWAT_Agent Note", true);
                    AdvanceTradingMgt.SendEmailWithReportAttachmentFromSO(Rec."No.", 50100, 'Agent Note (Seller)');
                end;
            }
            action(printAgentNoteBuyer)
            {
                ApplicationArea = All;
                Image = Print;
                Caption = 'Print Agent Note(Buyer)';
                Promoted = true;
                PromotedCategory = Process;
                ToolTip = 'It will print Agent Note(Buyer)';
                trigger OnAction()
                var
                    KTBuyerAgentNote: Report "KT Agent Note Buyer";
                    SalesHdr: Record "Sales Header";
                begin
                    Rec.testfield("KWAT_Agent Note", true);
                    //Message('In Progress');
                    Clear(KTBuyerAgentNote);
                    SalesHdr.Reset();
                    SalesHdr.SetRange("Document Type", rec."Document Type");
                    SalesHdr.SetRange("No.", Rec."No.");
                    KTBuyerAgentNote.SetTableView(SalesHdr);
                    KTBuyerAgentNote.RunModal();

                end;
            }
            action(EmailAgentNoteBuyer)
            {
                ApplicationArea = All;
                Image = Email;
                Caption = 'Email Agent Note(Buyer)';
                Promoted = true;
                PromotedCategory = Process;
                ToolTip = 'It will Email Agent Note(Buyer)';
                trigger OnAction()
                var
                    AdvanceTradingMgt: Codeunit AdvanceTradingMgt;
                begin
                    Rec.testfield("KWAT_Agent Note", true);
                    AdvanceTradingMgt.SendEmailWithReportAttachmentFromSO(Rec."No.", 50103, 'Agent Note (Buyer)');
                end;
            }
            action(printBrokerNoteSeller)
            {
                ApplicationArea = All;
                Image = Print;
                Caption = 'Print Broker Note(Seller)';
                Promoted = true;
                PromotedCategory = Process;
                ToolTip = 'It will print Broker Note(Seller)';
                trigger OnAction()
                var
                    KTSellerBrokerNote: Report "KT Broker Note Seller";
                    SalesHdr: Record "Sales Header";
                begin
                    Rec.testfield("KWAT_Agent Note", true);
                    //Message('In Progress');
                    Clear(KTSellerBrokerNote);
                    SalesHdr.Reset();
                    SalesHdr.SetRange("Document Type", rec."Document Type");
                    SalesHdr.SetRange("No.", Rec."No.");
                    KTSellerBrokerNote.SetTableView(SalesHdr);
                    KTSellerBrokerNote.RunModal();
                end;
            }
            action(EmailBrokerNoteSeller)
            {
                ApplicationArea = All;
                Image = Email;
                Caption = 'Email Broker Note(Seller)';
                Promoted = true;
                PromotedCategory = Process;
                ToolTip = 'It will Email Broker Note(Seller)';
                trigger OnAction()
                var
                    AdvanceTradingMgt: Codeunit AdvanceTradingMgt;
                begin
                    Rec.testfield("KWAT_Broker Note", true);
                    AdvanceTradingMgt.SendEmailWithReportAttachmentFromSO(Rec."No.", 50101, 'Broker Note (Seller)');
                end;
            }
            action(printBrokerNoteBuyer)
            {
                ApplicationArea = All;
                Image = Print;
                Caption = 'Print Broker Note(Buyer)';
                Promoted = true;
                PromotedCategory = Process;
                ToolTip = 'It will print Broker Note(Buyer)';
                trigger OnAction()
                var
                    KTBuyerBrokerNote: Report "KT Broker Note Buyer";
                    SalesHdr: Record "Sales Header";
                begin
                    Rec.testfield("KWAT_Agent Note", true);
                    //Message('In Progress');
                    Clear(KTBuyerBrokerNote);
                    SalesHdr.Reset();
                    SalesHdr.SetRange("Document Type", rec."Document Type");
                    SalesHdr.SetRange("No.", Rec."No.");
                    KTBuyerBrokerNote.SetTableView(SalesHdr);
                    KTBuyerBrokerNote.RunModal();
                end;
            }
            action(EmailBrokerNoteBuyer)
            {
                ApplicationArea = All;
                Image = Email;
                Caption = 'Email Broker Note(Buyer)';
                Promoted = true;
                PromotedCategory = Process;
                ToolTip = 'It will Email Broker Note(Buyer)';
                trigger OnAction()
                var
                    AdvanceTradingMgt: Codeunit AdvanceTradingMgt;
                begin
                    Rec.testfield("KWAT_Broker Note", true);
                    AdvanceTradingMgt.SendEmailWithReportAttachmentFromSO(Rec."No.", 50102, 'Broker Note (Buyer)');
                end;
            }

        }
    }
    trigger OnAfterGetRecord()
    begin
        getAnalysisDesc();
        getfreightDesc();
        getOtherDesc();
        getToleranceDesc();
        getTraderDesc();
        getweightDesc();
        getDPDesc();
        KTWABuyerDesc := GetCustName(Rec.KWAT_Buyer);
        KTWASellerDesc := GetCustName(Rec.KWAT_Seller);
    end;

    procedure GetCustName(pCustNo: code[20]): Text[100];
    var
        CustDesc: text[100];
    begin
        if BuyerCustomer.GET(Rec.KWAT_Buyer) then begin
            CustDesc := BuyerCustomer.Name;
        end else
            CustDesc := '';
        exit(CustDesc)
    end;

    procedure getTraderDesc()
    var
        KWAdvanceTrading_Trader: Record KWAdvanceTrading_Trader;
    begin
        IF KWAdvanceTrading_Trader.GET(Rec."KWAT_Trader Code") then
            KWAT_TraderDesc := KWAdvanceTrading_Trader.Description
        else
            KWAT_TraderDesc := '';
    end;


    procedure getAnalysisDesc()
    var
        KWAdvanceTradingAnalysis: Record KWAdvanceTrading_Analysis;
    begin
        IF KWAdvanceTradingAnalysis.GET(Rec."KWAT_Analysis Code") then
            KWAT_AnalysisDesc := KWAdvanceTradingAnalysis.Description
        else
            KWAT_AnalysisDesc := '';
    end;


    procedure getOtherDesc()
    var
        KWAdvanceTradingOther: Record KWAdvanceTrading_Other;
    begin
        IF KWAdvanceTradingOther.GET(Rec."KWAT_Other Code") then
            KWAT_OtherCodeDesc := KWAdvanceTradingOther.Description
        else
            KWAT_OtherCodeDesc := '';
    end;

    procedure getweightDesc()
    var
        KWATweight: Record KWAdvanceTrading_Weight;
    begin
        IF KWATweight.GET(Rec."KWAT_Weight Code") then
            KWAT_WeightDesc := KWATweight.Description
        else
            KWAT_WeightDesc := '';
    end;

    procedure getfreightDesc()
    var
        KWAdvanceTradingFreight: Record KWAdvanceTrading_Freight;
    begin
        IF KWAdvanceTradingFreight.GET(Rec."KWAT_Freight Code") then
            KWAT_FreightCodeDesc := KWAdvanceTradingFreight.Description
        else
            KWAT_FreightCodeDesc := '';
    end;

    procedure getToleranceDesc()
    var
        KWATTol: Record KW_AdvanceTrading_Tolerance;
    begin
        IF KWATTol.GET(Rec."KWAT_Tolerance Code") then
            KWAT_ToleranceDesc := KWATTol.Description
        else
            KWAT_ToleranceDesc := '';
    end;

    procedure getDPDesc()
    var
        KWDPoint: Record KWAdvanceTrading_DeliveryPoint;
    begin
        IF KWDPoint.GET(Rec."KWAT_DeliveryPoint Code") then
            KWAT_DPDesc := KWDPoint.Description
        else
            KWAT_DPDesc := '';
    end;

    var
        KTWABuyerDesc: Text[100];
        KTWASellerDesc: Text[100];
        KWAT_TraderDesc: Text[100];
        KWAT_ToleranceDesc: Text[100];
        KWAT_WeightDesc: Text[100];
        KWAT_FreightDesc: Action;
        KWAT_FreightCodeDesc: Text[100];
        KWAT_AnalysisDesc: Text[100];
        KWAT_OtherCodeDesc: Text[100];
        KWAT_DPDesc: Text[100];
        BuyerCustomer: Record Customer;
        SellerCustomer: Record Customer;
}
