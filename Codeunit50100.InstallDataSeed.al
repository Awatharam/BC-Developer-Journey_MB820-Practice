codeunit 50100 "MK Install Data Seed"
{
    Subtype = Install;

    trigger OnInstallAppPerCompany()
    begin
        SeedGoldCustomerLog();
    end;

    local procedure SeedGoldCustomerLog()
    var
        GoldCustomerLog: Record "Gold Customer Log";
    begin
        if GoldCustomerLog.IsEmpty() then begin
            GoldCustomerLog.Init();
            GoldCustomerLog."Customer No." := 'SEED-001';
            GoldCustomerLog."Customer Name" := 'Default Seed Customer';
            GoldCustomerLog."Posting Date" := Today;
            GoldCustomerLog.Insert(true);
        end;
    end;
}