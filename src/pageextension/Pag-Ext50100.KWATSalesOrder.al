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
                field("KWAT_Seller Reference"; Rec."KWAT_Seller Reference")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Seller Reference field.', Comment = '%';
                }
                field("KWAT_Trader Code"; Rec."KWAT_Trader Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Trader Code field.', Comment = '%';
                }
                field("KWAT_Tolerance Code"; Rec."KWAT_Tolerance Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Tolerance Code field.', Comment = '%';
                }
                field("KWAT_Weight Code"; Rec."KWAT_Weight Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Weight Code field.', Comment = '%';
                }
                field("KWAT_Freight Code"; Rec."KWAT_Freight Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Freight Code field.', Comment = '%';
                }
                field("KWAT_Analysis Code"; Rec."KWAT_Analysis Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the AT Analysis Code field.', Comment = '%';
                }
                field("KWAT_Other Code"; Rec."KWAT_Other Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Other Code field.', Comment = '%';
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
                    ToolTip = 'Specifies the value of the Delivery Point Code field.', Comment = '%';
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
                begin
                    Rec.testfield("KWAT_Agent Note", true);
                    Message('In Progress');
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
                begin
                    Rec.testfield("KWAT_Agent Note", true);
                    Message('In Progress');
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
                begin
                    Rec.testfield("KWAT_Broker Note", true);
                    Message('In Progress');
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
                begin
                    Rec.testfield("KWAT_Broker Note", true);
                    Message('In Progress');
                end;
            }

        }
    }
}
