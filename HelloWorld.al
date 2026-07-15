// Original project-init scaffold object (auto-generated when the AL project was created).
// Kept intentionally as a quick "did the app actually publish?" smoke test — opening the
// Customer List after a fresh deploy/publish shows this message, confirming the app
// loaded successfully on the BC instance. Not part of the Gold Customer feature set.

pageextension 50100 CustomerListExt extends "Customer List"
{
    trigger OnOpenPage();
    begin
        Message('App published: Hello world');
    end;
}