pageextension 50108 "Customer List Gold Log Ext" extends "Customer List"
{
    actions
    {
        addlast(processing)
        {
            action(ShowGoldCustomerLog)
            {
                ApplicationArea = All;
                Caption = 'Gold Customer Log Entries';
                Image = Log;
                RunObject = page "Gold Customer Log List";
                RunPageLink = "Customer No." = field("No.");
                ToolTip = 'View Gold Customer Log entries for this customer.';
            }
        }
    }
}