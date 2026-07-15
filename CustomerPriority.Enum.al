// Customer Priority classification. "High" priority is treated as "Gold" customer
// status throughout this project (Gold Customer Log, Report, API) — naming kept
// as "Gold" for business-friendly terminology, enum value remains "High".
enum 50100 "Customer Priority"
{
    Extensible = true;

    value(0; " ") { Caption = ' '; }
    value(1; "High") { Caption = 'High'; }
    value(2; "Medium") { Caption = 'Medium'; }
    value(3; "Low") { Caption = 'Low'; }
}