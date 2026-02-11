// TableExtension 70104: Purchase Header Ext
tableextension 70104 "STR Purchase Header Ext" extends "Purchase Header"
{
    fields
    {
        field(70100; "STR Pickup Request No."; Code[20])
        {
            Caption = 'Pickup Request No.';
            //Editable = false;
        }
        field(70101; "STR Delivery Document No."; Code[20])
        {
            Caption = 'Delivery Document No.';
            //Editable = false;
        }
        field(70102; "STR Driver Email"; Text[100])
        {
            Caption = 'Driver Email';
        }

    }

    trigger OnInsert()
    var
        STRDeliveryPickupMgt: Codeunit "STR Delivery & Pickup Mgt.";
    begin
        if Rec."Document Type" = Rec."Document Type"::Order then begin
            if Rec."STR Pickup Request No." = '' then
                Rec."STR Pickup Request No." := STRDeliveryPickupMgt.GetNextDeliveryDocumentNo();
            if Rec."STR Delivery Document No." = '' then
                Rec."STR Delivery Document No." := STRDeliveryPickupMgt.GetNextDeliveryDocumentNo();
        end;
    end;
}
