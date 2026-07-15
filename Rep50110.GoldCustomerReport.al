// Prints a Word-layout report of customers (No., Name, Balance, Posting Group,
// Credit Limit) with a running row number and an optional Minimum Balance filter.
// XML field names below (RowNo, No, Name, BalanceLCY, etc.) must match exactly
// what's bound in GoldCustomerReport.docx via the Word XML Mapping Pane.
report 50110 "Gold Customer Report"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    Caption = 'Gold Customer Report';
    DefaultRenderingLayout = WordLayout;

    dataset
    {
        dataitem(Customer; Customer)
        {
            RequestFilterFields = "No.", "Customer Posting Group";

            column(RowNo; RowNumber) { }

            column(No; "No.") { }
            column(Name; Name) { }
            column(BalanceLCY; "Balance (LCY)") { }
            column(CustomerPostingGroup; "Customer Posting Group") { }
            column(CreditLimitLCY; "Credit Limit (LCY)") { }

            trigger OnAfterGetRecord()
            begin
                // Increments per printed record, so numbering is always correct
                // against whatever filtered subset is active (not the full table).
                RowNumber += 1;
            end;

            trigger OnPreDataItem()
            begin
                // Reset for each report run — without this the counter would
                // keep climbing across separate runs in the same session.
                RowNumber := 0;

                // MinBalanceFilter is only applied if a non-zero value was entered
                // on the request page; 0 (default) means no filter — show everyone.
                if MinBalanceFilter <> 0 then
                    Customer.SetFilter("Balance (LCY)", '>=%1', MinBalanceFilter);
            end;
        }
    }

    requestpage
    {
        layout
        {
            area(Content)
            {
                group(Filters)
                {
                    Caption = 'Filters';
                    field(MinBalance; MinBalanceFilter)
                    {
                        ApplicationArea = All;
                        Caption = 'Minimum Balance (LCY)';
                        ToolTip = 'Filter customers with balance above this amount.';
                    }
                }
            }
        }

        actions
        {
        }
    }

    rendering
    {
        layout(WordLayout)
        {
            Type = Word;
            LayoutFile = 'GoldCustomerReport.docx';
            Caption = 'Gold Customer Report (Word)';
        }
    }

    var
        MinBalanceFilter: Decimal;
        RowNumber: Integer;
}