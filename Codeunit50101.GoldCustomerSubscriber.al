// Subscribes to BC's standard Sales-Post event and logs an entry into
// Table 50100 "Gold Customer Log" whenever a Gold (High priority) customer's
// sales order is posted. Runs automatically — no manual trigger needed.
codeunit 50101 "Gold Customer Subscriber"
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", 'OnAfterPostSalesDoc', '', false, false)]
    local procedure OnAfterPostSalesDoc_CreateLog(var SalesHeader: Record "Sales Header")
    var
        GoldCustomerLog: Record "Gold Customer Log";
        Customer: Record Customer;
    begin
        // Only log Orders — skip Invoices, Credit Memos, etc.
        if SalesHeader."Document Type" <> SalesHeader."Document Type"::Order then
            exit;

        // Skip if the customer can't be found (defensive — shouldn't normally happen).
        if not Customer.Get(SalesHeader."Sell-to Customer No.") then
            exit;

        // Only Gold (High priority) customers are logged.
        if Customer."Customer Priority" <> Customer."Customer Priority"::High then
            exit;

        GoldCustomerLog.Init();
        GoldCustomerLog."Customer No." := SalesHeader."Sell-to Customer No.";
        GoldCustomerLog."Customer Name" := SalesHeader."Sell-to Customer Name";
        GoldCustomerLog."Posting Date" := SalesHeader."Posting Date";
        GoldCustomerLog.Insert(true);
    end;


}