tableextension 50107 "KWAT_SalesLineExt" extends "Sales Line"
{
    fields
    {
        modify("Variant Code")
        {
            caption = 'Grade';
            trigger onaftervalidate()
            var
                Item: record Item;
            begin
                If rec."Variant Code" <> '' then begin
                    IF rec.Type = rec.Type::Item then begin
                        IF Item.GET(rec."No.") then begin
                            rec.Description := Item.Description;
                            rec."Description 2" := item."Description 2";
                        end;
                    end;
                end;
            end;
        }
        modify(Description)
        {
            Caption = 'Commodity';
        }
        modify("Unit Price")
        {
            Caption = 'Commission';
        }
    }
}

