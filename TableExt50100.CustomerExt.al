// Adds a Customer Priority classification field to the standard Customer table.
// Used to flag "Gold" customers, which drives event subscriber logic (Codeunit 50101),
// the Gold Customer Log (Table 50100), and the Gold Customer Report (Report 50110).
tableextension 50100 CustomerExt extends Customer
{
    fields
    {
        field(50100; "Customer Priority"; Enum "Customer Priority")
        {
            Caption = 'Customer Priority';
            DataClassification = CustomerContent;
        }
    }
}