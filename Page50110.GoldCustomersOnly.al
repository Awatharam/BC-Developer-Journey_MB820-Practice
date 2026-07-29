page 50110 "Gold Customers Only"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    Caption = 'Gold Customers';
    SourceTable = Customer;
    SourceTableView = sorting("No.") where("Customer Priority" = const(High));
    Editable = false;

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("No."; Rec."No.") { ApplicationArea = All; }
                field(Name; Rec.Name) { ApplicationArea = All; }
                field("Customer Priority"; Rec."Customer Priority") { ApplicationArea = All; }
                field("Balance (LCY)"; Rec."Balance (LCY)") { ApplicationArea = All; }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(ShowVersionInfo)
            {
                ApplicationArea = All;
                Caption = 'Show Version Info';
                Image = Info;
                ToolTip = 'Displays the current AppVersion and DataVersion for this extension.';

                trigger OnAction()
                var
                    UpgradeCodeunit: Codeunit "MK Upgrade Data Migration";
                begin
                    UpgradeCodeunit.ShowVersionInfo();
                end;
            }
        }
    }
}