// // PageExtension 70101: Purchase Order Ext
// pageextension 70101 "Purchase Order Ext" extends "Purchase Order"
// {
//     layout
//     {
//         addafter("Vendor Invoice No.")
//         {
//             field("Pickup Request No."; Rec."STR Pickup Request No.")
//             {
//                 ApplicationArea = All;
//                 Editable = false;
//             }
//             field("Delivery Document No."; Rec."STR Delivery Document No.")
//             {
//                 ApplicationArea = All;
//                 Editable = false;
//             }
//             field("STR Driver Email"; Rec."STR Driver Email")
//             {
//                 ApplicationArea = All;
//                 ToolTip = 'Specifies the value of the Driver Email field.', Comment = '%';
//             }
//         }
//     }

//     actions
//     {
//         addlast(Print)
//         {
//             action("Email PO With Ship-To")
//             {
//                 ApplicationArea = All;
//                 Caption = 'Email PO With Ship-To-Address';
//                 Image = SendEmailPDF;
//                 Promoted = true;

//                 trigger OnAction()
//                 begin
//                     SendCustomReport(Report::KBIZ_Purch_Order_Conf_AU, 'Buildpro Purchase Order', false);
//                 end;
//             }

//             action("Email PO Without Ship-To")
//             {
//                 ApplicationArea = All;
//                 Caption = 'Email PO Without Ship-To-Address';
//                 Image = SendEmailPDF;
//                 Promoted = true;

//                 trigger OnAction()
//                 begin
//                     SendCustomReport(Report::KBIZ_Purch_Order_Conf_AU, 'Buildpro Purchase Order - no Ship Address', false);
//                 end;
//             }

//             action("Email Delivery Docket With Pallet")
//             {
//                 ApplicationArea = All;
//                 Caption = 'Email Delivery Docket With Pallet';
//                 Image = SendEmailPDF;
//                 Promoted = true;

//                 trigger OnAction()
//                 begin
//                     SendCustomReport(Report::KBIZ_Purch_Order_Conf_AU, 'Buildpro Delivery Docket With Pallet Qty', false);
//                 end;
//             }

//             action("BuildPro Pickup Request")
//             {
//                 ApplicationArea = All;
//                 Caption = 'BuildPro Pickup Request';
//                 Image = SendEmailPDF;
//                 Promoted = true;

//                 trigger OnAction()
//                 begin
//                     SendCustomReport(Report::KBIZ_Purch_Order_Conf_AU, 'Buildpro Pick Up Request With Pallet Qty', false);
//                 end;
//             }
//         }
//     }
//     local procedure SendCustomReport(ReportID: Integer; LayoutName: Text; AutoSend: Boolean)
//     var
//         PurchHeader: Record "Purchase Header";
//         EmailItem: Record "Email Item" temporary;
//         EmailScenario: Enum "Email Scenario";
//     begin
//         PurchHeader := Rec;
//         // Pre-fill recipient and subject, then open the compose dialog (do not auto-send)
//         EmailItem."Send to" := GetDriverEmail();
//         EmailItem.Subject := LayoutName + ' ' + PurchHeader."No.";
//         // Open compose window by calling Send with 'false' (do not auto-send)
//         EmailItem.Send(false, EmailScenario::Default);
//         // Keep running the report to preserve original behavior if needed
//         //Report.Run(ReportID, true, false, PurchHeader);
//     end;

//     local procedure GetDriverEmail(): Text
//     begin
//         exit(Rec."STR Driver Email");
//     end;
// }
