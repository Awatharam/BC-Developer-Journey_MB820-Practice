pageextension 50104 "Xmlport Test Trigger" extends "Customer List"
{
    actions
    {
        addlast(Processing)
        {
            action(RunCustomerExport)
            {
                ApplicationArea = All;
                Caption = 'Run Customer Export (Test)';
                Image = Export;

                trigger OnAction()
                begin
                    Xmlport.Run(Xmlport::"Customer Export");
                end;
            }
        }
    }
}