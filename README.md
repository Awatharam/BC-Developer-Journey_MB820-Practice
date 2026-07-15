BC Developer Journey
My AL development learning journey — 21-day plan building from table extensions to API integration.
Progress
Week 1 — Table & Page Extensions ✅

Day 1: AL project setup, sandbox connection
Day 2: Customer Priority Enum (High / Medium / Low)
Day 3: Customer table extension (Customer Priority field)
Day 4: Customer Card page extension + OnValidate trigger
Day 5: Full end-to-end test and review

Week 2 — Codeunit & Event Architecture ✅

Day 1: Codeunit structure, event publishers and subscribers theory
Day 2: Custom Table 50100 "Gold Customer Log" (Entry No., Customer No., Customer Name, Posting Date, Sales Order No.)
Day 3: Codeunit 50101 "Gold Customer Subscriber" — subscribes to OnAfterPostSalesDoc on Codeunit 80 "Sales-Post", logs High priority customer orders
Day 4: Page 50101 "Gold Customer Log List" — searchable List page inside BC; negative + positive flow tests passed
Day 5: Full regression test, code review, README update

Week 3 — AL Reports with Word Layouts ✅

Day 1: Report 50110 "Gold Customer Report" — dataset structure (No., Name, Balance (LCY), Posting Group, Credit Limit)
Day 2: Word layout (.docx) wired up via rendering block
Day 3: XML Mapping Pane used to bind all 5 columns to the Word layout — report prints all 70 customers with data
Day 4: Word layout styling — title, dark header row, column widths, table borders
Day 5: Added running row number column, fixed dormant Minimum Balance filter (SetFilter in OnPreDataItem), full report testing, PDF export, project cleanup

Week 4 — API Integration ✅

Day 1: API project planning — decided to build a custom Gold Customer API instead of restcountries.com, for a more cohesive portfolio story tied back into Week 2
Day 2: Page 50102 "Gold Customer API" — custom OData endpoint exposing Gold (High priority) customers (No., Name, Balance, Posting Group, Credit Limit)
Day 3: Stood up a dedicated BC270API server instance (NavUserPassword auth) to safely test Basic Auth without touching BC270's main Windows-auth setup; validated all endpoints via Postman
Day 4: Codeunit 50102 "Gold Customer API Caller" — AL HttpClient calls BC270API's own API from BC270, dynamically resolves the company GUID, retrieves and counts Gold Customers, logs the result into the existing Gold Customer Log table; triggered via a new "Sync from API" action
Day 5: Full code review and commenting across all 4 weeks, two real bug fixes — Page 50102 was missing its Gold-customer filter (returned all customers, not just High priority), and the API password was moved from a hardcoded string to Isolated Storage — final regression test, README update, project complete

---

🏆 21-Day BC Developer Journey — Complete

Four weeks, from a single table extension to a full custom API integration calling back into BC's own event and logging architecture. Built toward MB-820 certification prep.

---

Bonus — Role Center Navigation

PageExt50103 "Order Processor RoleCenter Ext" — adds a "BC Developer Journey" group to the Order Processor Role Center nav bar, linking directly to the Gold Customer Log List, Gold Customer Report, and Customer List (Gold Priority customers)