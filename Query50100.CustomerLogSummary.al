query 50100 "Customer Log Summary"
{
    Caption = 'Customer Log Summary';
    QueryType = Normal;
    UsageCategory = ReportsAndAnalysis;
    OrderBy = Descending(LogCount);

    elements
    {
        dataitem(Customer; Customer)
        {
            column(No_; "No.") { }
            column(Name; Name) { }

            dataitem(GoldCustomerLog; "Gold Customer Log")
            {
                SqlJoinType = LeftOuterJoin;
                //SqlJoinType = InnerJoin;
                DataItemLink = "Customer No." = Customer."No.";

                column(LogCount)
                {
                    Method = Count;
                }
            }
        }
    }
}