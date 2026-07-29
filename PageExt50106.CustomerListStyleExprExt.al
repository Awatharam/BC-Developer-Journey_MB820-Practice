pageextension 50106 "Customer List StyleExpr Ext" extends "Customer List"
{
    layout
    {
        modify(Name)
        {
            StyleExpr = IsBlockedStyle;
            Style = Strong;
        }
        modify("Balance (LCY)")
        {
            StyleExpr = IsBlockedStyle;
            Style = Strong;
        }
    }

    trigger OnAfterGetRecord()
    begin
        IsBlockedStyle := (Rec.Blocked <> Rec.Blocked::" ");
    end;

    var
        IsBlockedStyle: Boolean;
}