codeunit 50103 "MK Upgrade Data Migration"
{
    Subtype = Upgrade;

    trigger OnUpgradePerCompany()
    begin
        MigrateGoldCustomerLogToArchive();
        ShowVersionInfo();
    end;

    local procedure MigrateGoldCustomerLogToArchive()
    var
        GoldCustomerLogArchive: Record "Gold Customer Log Archive";
        DataTransfer: DataTransfer;
    begin
        if not GoldCustomerLogArchive.IsEmpty() then
            exit; // already migrated in a prior upgrade run

        DataTransfer.SetTables(Database::"Gold Customer Log", Database::"Gold Customer Log Archive");
        DataTransfer.AddFieldValue(1, 1); // Entry No.
        DataTransfer.AddFieldValue(2, 2); // Customer No.
        DataTransfer.AddFieldValue(3, 3); // Customer Name
        DataTransfer.AddFieldValue(4, 4); // Posting Date
        DataTransfer.CopyRows();
    end;

    procedure ShowVersionInfo()
    var
        ModuleInfo: ModuleInfo;
    begin
        NavApp.GetCurrentModuleInfo(ModuleInfo);
        Message('AppVersion: %1\DataVersion: %2', ModuleInfo.AppVersion, ModuleInfo.DataVersion);
    end;
}