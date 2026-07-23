// Adds a "Sync from API" action to the Gold Customer Log List page, letting users
// manually trigger Codeunit 50102's SyncFromApi on demand. Refreshes the page
// afterward so the new log entry appears immediately.
pageextension 50102 "Gold Customer Log List Ext" extends "Gold Customer Log List"
{
    actions
    {
        addlast(Processing)
        {
            action(SyncFromApi)
            {
                ApplicationArea = All;
                Caption = 'Sync from API';
                ToolTip = 'Calls the BC270API Gold Customer API endpoint and logs the result.';
                Image = Refresh;

                trigger OnAction()
                var
                    ApiCaller: Codeunit "Gold Customer API Caller";
                    Count: Integer;
                begin
                    Count := ApiCaller.SyncFromApi();
                    Message('API sync complete — %1 Gold Customers retrieved.', Count);
                    CurrPage.Update(false);
                end;
            }

            action(SeedGoldCustomerLog)
            {
                ApplicationArea = All;
                Caption = 'Seed Dummy Records (Test)';
                ToolTip = 'Inserts sample Gold Customer Log rows for MB-820 Query testing.';
                Image = CreateForm;

                trigger OnAction()
                var
                    GoldCustomerLog: Record "Gold Customer Log";
                    NextEntryNo: Integer;
                begin
                    if GoldCustomerLog.FindLast() then
                        NextEntryNo := GoldCustomerLog."Entry No." + 1
                    else
                        NextEntryNo := 1;

                    GoldCustomerLog.Init();
                    GoldCustomerLog."Entry No." := NextEntryNo;
                    GoldCustomerLog."Customer No." := '01121212';
                    GoldCustomerLog."Customer Name" := 'Spotsmeyer''s Furnishings';
                    GoldCustomerLog."Posting Date" := Today;
                    GoldCustomerLog.Insert(false);
                    NextEntryNo += 1;

                    GoldCustomerLog.Init();
                    GoldCustomerLog."Entry No." := NextEntryNo;
                    GoldCustomerLog."Customer No." := '01121212';
                    GoldCustomerLog."Customer Name" := 'Spotsmeyer''s Furnishings';
                    GoldCustomerLog."Posting Date" := Today - 7;
                    GoldCustomerLog.Insert(false);
                    NextEntryNo += 1;

                    GoldCustomerLog.Init();
                    GoldCustomerLog."Entry No." := NextEntryNo;
                    GoldCustomerLog."Customer No." := '01445544';
                    GoldCustomerLog."Customer Name" := 'Progressive Home Furnishings';
                    GoldCustomerLog."Posting Date" := Today;
                    GoldCustomerLog.Insert(false);

                    Message('3 dummy Gold Customer Log entries created, starting at Entry No. %1.', NextEntryNo - 2);
                    CurrPage.Update(false);
                end;
            }

            action(ClearGoldCustomerLog)
            {
                ApplicationArea = All;
                Caption = 'Clear All Records (Test)';
                Image = Delete;

                trigger OnAction()
                var
                    GoldCustomerLog: Record "Gold Customer Log";
                begin
                    GoldCustomerLog.DeleteAll();
                    Message('All Gold Customer Log records deleted.');
                    CurrPage.Update(false);
                end;
            }
        }
    }
}