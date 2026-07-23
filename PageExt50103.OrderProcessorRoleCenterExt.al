pageextension 50103 "Order Processor RoleCenter Ext" extends "Order Processor Role Center"
{
    actions
    {
        addlast(Sections)
        {
            group(GoldCustomerJourney)
            {
                Caption = 'BC Developer Journey';

                action(GoldCustomerLogList)
                {
                    ApplicationArea = All;
                    Caption = 'Gold Customer Log';
                    RunObject = page "Gold Customer Log List";
                }
                action(GoldCustomerReport)
                {
                    ApplicationArea = All;
                    Caption = 'Gold Customer Report';
                    RunObject = report "Gold Customer Report";
                }
                action(CustomerListGold)
                {
                    ApplicationArea = All;
                    Caption = 'Customers (Gold Priority)';
                    RunObject = page "Customer List";
                }
                action(CustomerLogSummary)
                {
                    ApplicationArea = All;
                    Caption = 'Customer Log Summary';
                    RunObject = query "Customer Log Summary";
                }
                action(CustomerLogSummaryReport)
                {
                    ApplicationArea = All;
                    Caption = 'Customer Log Summary Report';
                    RunObject = report "Customer Log Summary Report";
                }
            }
        }
    }
}