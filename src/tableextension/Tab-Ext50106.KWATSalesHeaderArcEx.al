tableextension 50106 "KWAT_SalesHeaderArcEx" extends "Sales Header Archive"
{
    fields
    {
        field(50100; "KWAT_Trader Code"; Code[20])
        {
            Caption = 'Trader Code';
            DataClassification = CustomerContent;
            TableRelation = KWAdvanceTrading_Trader;

        }
        field(50101; "KWAT_Tolerance Code"; Code[20])
        {
            Caption = 'Tolerance Code';
            DataClassification = CustomerContent;
            TableRelation = KW_AdvanceTrading_Tolerance;
        }
        field(50102; "KWAT_Other Code"; Code[20])
        {
            Caption = 'Other Code';
            DataClassification = CustomerContent;
            TableRelation = KWAdvanceTrading_Other;
        }
        field(50103; "KWAT_Freight Code"; Code[20])
        {
            Caption = 'Freight Code';
            DataClassification = CustomerContent;
            TableRelation = KWAdvanceTrading_Freight;
        }
        field(50104; "KWAT_Weight Code"; Code[20])
        {
            Caption = 'Weight Code';
            DataClassification = CustomerContent;
            TableRelation = KWAdvanceTrading_Weight;
        }
        field(50105; "KWAT_Analysis Code"; Code[20])
        {
            Caption = 'AT Analysis Code';
            DataClassification = CustomerContent;
            TableRelation = KWAdvanceTrading_Analysis;
        }
        field(50106; "KWAT_DeliveryPoint Code"; Code[20])
        {
            Caption = 'Delivery Point Code';
            DataClassification = CustomerContent;
            TableRelation = KWAdvanceTrading_DeliveryPoint;
        }
        field(50107; "KWAT_Delivery Start"; Date)
        {
            Caption = 'Delivery Start';
            DataClassification = ToBeClassified;
        }
        field(50108; "KWAT_Delivery End"; Date)
        {
            Caption = 'Delivery End';
            DataClassification = ToBeClassified;
        }
        field(50109; KWAT_Transporter; Text[100])
        {
            Caption = 'Transporter';
            DataClassification = CustomerContent;
        }
        field(50110; "KWAT_Agent Note"; Boolean)
        {
            Caption = 'Agent Note';
            DataClassification = ToBeClassified;
        }
        field(50111; "KWAT_Broker Note"; Boolean)
        {
            Caption = 'Broker Note';
            DataClassification = ToBeClassified;
        }
        field(50112; KWAT_Buyer; Code[20])
        {
            Caption = 'Buyer';
            DataClassification = CustomerContent;
            TableRelation = Customer."No." where(Blocked = filter(" "));

        }
        field(50113; "KWAT_Buyer Reference"; Text[20])
        {
            Caption = 'Buyer Reference';
            DataClassification = CustomerContent;
        }
        field(50114; KWAT_Seller; Code[20])
        {
            Caption = 'Seller';
            DataClassification = CustomerContent;
            TableRelation = Customer."No." where(Blocked = filter(" "));
        }
        field(50115; "KWAT_Seller Reference"; Text[20])
        {
            Caption = 'Seller Reference';
            DataClassification = CustomerContent;
        }
        field(50116; "KWAT_Trader Price"; Decimal)
        {
            Caption = 'Trader Price';
            DataClassification = ToBeClassified;
        }
        field(50117; "KWAT Work Description"; Text[500])
        {
            Caption = 'KW Work Description';
            DataClassification = CustomerContent;
        }
        field(50118; "KWAT_Ready to Invoice"; boolean)
        {
            Caption = 'Ready to Invoice';
            DataClassification = CustomerContent;
        }
        field(50119; "KWAT_Buyer_Desc"; text[100])
        {
            Caption = 'Buyer Description';
            DataClassification = CustomerContent;
        }
    }
}
