// Logs Gold ("High" priority) customer activity from two sources:
// 1) Codeunit 50101 — one row per sales order posted for a Gold customer (Week 2)
// 2) Codeunit 50102 — one summary row per API sync, using "Customer Name" as a
//    free-text result message rather than an actual customer name (Week 4)
// Entry No. is AutoIncrement, so Insert(true) is enough — no manual numbering needed.
table 50100 "Gold Customer Log"
{
    Caption = 'Gold Customer Log';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Entry No."; Integer)
        {
            Caption = 'Entry No.';
            AutoIncrement = true;
        }
        field(2; "Customer No."; Code[20])
        {
            CaptionML = ENU = 'Customer No.', ESP = 'Nº de Cliente';
        }
        field(3; "Customer Name"; Text[100])
        {
            CaptionML = ENU = 'Customer Name', ESP = 'Nombre del Cliente';
        }
        field(4; "Posting Date"; Date)
        {
            Caption = 'Posting Date';
        }
        field(5; "Sales Order No."; Code[20])
        {
            Caption = 'Sales Order No.';
            ObsoleteState = Removed;
            ObsoleteReason = 'Not in use, being retired for MB-820 practice';
            ObsoleteTag = '1.0.0.0';
        }
    }

    keys
    {
        key(PK; "Entry No.")
        {
            Clustered = true;
        }
    }
}