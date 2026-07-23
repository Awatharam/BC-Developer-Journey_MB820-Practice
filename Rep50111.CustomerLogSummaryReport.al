report 50111 "Customer Log Summary Report"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    Caption = 'Customer Log Summary Report';

    dataset
    {
        dataitem(Integer; Integer)
        {
            column(No_; CustomerLogSummaryQ.No_) { }
            column(Name; CustomerLogSummaryQ.Name) { }
            column(LogCount; CustomerLogSummaryQ.LogCount) { }

            trigger OnPreDataItem()
            begin
                CustomerLogSummaryQ.Open();
            end;

            trigger OnAfterGetRecord()
            begin
                if not CustomerLogSummaryQ.Read() then
                    CurrReport.Break();
            end;
        }
    }

    var
        CustomerLogSummaryQ: Query "Customer Log Summary";
}