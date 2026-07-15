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
        }
    }
}