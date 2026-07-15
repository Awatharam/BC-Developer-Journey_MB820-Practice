permissionset 50100 "MB820 Practice"
{
    Assignable = true;
    Caption = 'MB820 Practice Permissions';

    Permissions =
        tabledata "Gold Customer Log" = RIMD,
        page "Gold Customer Log List" = X,
        codeunit "Gold Customer Subscriber" = X,
        report "Gold Customer Report" = X;
}