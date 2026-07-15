// Read-only list view of Table 50100 "Gold Customer Log". Shows both per-order
// log entries (Week 2 subscriber) and API sync summary rows (Week 4 — see
// PageExtension 50102's "Sync from API" action, which triggers new entries here).
page 50101 "Gold Customer Log List"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Gold Customer Log";
    Caption = 'Gold Customer Log';
    Editable = false;

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field("Entry No."; Rec."Entry No.")
                {
                    ApplicationArea = All;
                }
                field("Customer No."; Rec."Customer No.")
                {
                    ApplicationArea = All;
                }
                field("Customer Name"; Rec."Customer Name")
                {
                    ApplicationArea = All;
                }
                field("Posting Date"; Rec."Posting Date")
                {
                    ApplicationArea = All;
                }
                field("Sales Order No."; Rec."Sales Order No.")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}