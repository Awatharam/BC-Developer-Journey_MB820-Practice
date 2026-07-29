pageextension 50107 "Customer Card Gold Log Ext" extends "Customer Card"
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