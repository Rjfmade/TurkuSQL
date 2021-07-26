
-- ------ MySQL Assignment (50 points) ------

-- Please write here your name: Jose Faustino Martinez-Delgado Rubio

--   Question 1 (5 points) --

-- Please fetch the following columns from the "invoices" table:
--
--  - Invoice Number        (The "invoice_number" column)
--  - Invoice Total         (The "invoice_total" column)
--  - Payment Credit Total  ("payment_total" + "credit_total")
--  - Balance Due           ("invoice_total" - "payment_total" - "credit_total")
--
-- Please only return invoices that have a balance due that is greater than $50.
-- Please also sort the result set by balance due in descending order and return only the rows with the 5 largest balance due.

SELECT 
	invoice_number,
	invoice_total,
	(payment_total+credit_total),
	(invoice_total-payment_total-credit_total) as Balance
FROM 
	SQL_assigment_Jose_Faustino.invoices
WHERE 
	(invoice_total-payment_total-credit_total)>50
ORDER BY 
	(invoice_total-payment_total-credit_total) DESC 
LIMIT 5;

-- ---- Question 2 (5 points) ----

-- Please return the identities of the contact person from the "vendors" table.
-- Please return only the contacts whose last name begins with the letter A, B, C or E.
-- Please sort the result set by last name and then first name in ascending order.

SELECT 
	vendor_contact_last_name,
	vendor_contact_first_name
FROM 
	SQL_assigment_Jose_Faustino.vendors
WHERE
	vendor_contact_last_name regexp '^[A,B,C,E,a,b,c,e].*$'
ORDER BY
-- ASC order is the default. Plus, there is no coincidence among the "vendor_contact_last_name"
-- Therefore, we could not apreciate the efect of ordering by "vendor_contact_first_name" 
	vendor_contact_last_name,
    vendor_contact_first_name;


-- ---- Question 3 (5 points) ----

-- Please identify, for each vendor, the invoices with a non-zero balance due.
--
-- Please return the following columns in the result set:
--
--  - Vendor Name     (The "vendor_name" column from the "vendors" table)
--  - Invoice Number  (The "invoice_number" column from the "invoices" table)
--  - Invoice Date    (The "invoice_date" column from the "invoices" table)
--  - Balance Due     ("invoice_total" - "payment_total" - "credit_total")
--
-- The result set should also be sorted by "vendor_name" in ascending order.

SELECT 
	vendor_name,
    invoice_number,
    invoice_date,
    (invoice_total-payment_total-credit_total) as Balance
FROM 
	vendors
INNER JOIN 
    invoices ON vendors.vendor_id = invoices.vendor_id
WHERE
	(invoice_total-payment_total-credit_total)>0
ORDER BY
	vendor_name;
    
    
-- ---- Question 4 (5 points) ----

-- Please return one row for each vendor, which contains the following values:
--
--  - Vendor Name  (The "vendor_name" column from the "vendors" table)
--  - The number of invoices (from the "invoices" table) for the vendor
--  - The sum of "invoice_total" (from the "invoices" table) for the vendor
--
-- Please sort the result set such that the vendor with the most invoices appears first.

SELECT 
	V.vendor_name,
    COUNT(I.invoice_id) `Number Invoices`,
    SUM(I.invoice_total) 'Total Invoice Value'
FROM 
	vendors as V
JOIN 
    invoices as I 
ON V.vendor_id = I.vendor_id
GROUP BY
	V.vendor_name
ORDER BY
	`Number Invoices` DESC;
    
-- #### Question 5 (5 points) ####

-- Please return one row for each general ledger account, which contains the following values:
--
--  - Account Number (The "account_number" column from the "general_ledger_accounts" table)
--  - Account Description  (The "account_description" column from the "general_ledger_accounts" table)
--  - The number of items in the "invoice_line_items" table that are related to the account
--  - The sum of "line_item_amount" of the account
--
-- Please return only those accounts, whose sum of line item amount is great than $5,000.
-- The result set should also be sorted by the sum of line item amount in descending order.

SELECT 
	LA.account_number as `Account Number`,
    LA.account_description as `Account Description`,
    COUNT(IL.invoice_id) as `Number of Invoices`,
    SUM(IL.line_item_amount) as `Sum of Line Item Amount`
FROM 
	general_ledger_accounts as LA
JOIN 
	invoice_line_items as IL
ON  LA.account_number = IL.account_number
GROUP BY `Account Number`
HAVING `Sum of Line Item Amount`>5000
ORDER BY `Sum of Line Item Amount` DESC;
    
-- #### Question 6 (5 points) ####

-- Please identify the invoices, whose payment total is greater than the average payment total
-- of all the invoices with a non-zero payment total.
--
-- Please return the "invoice_number" and "invoice_total" for each invoice.
-- Please also sort the result set by "invoice_total" in descending order.

--First I check if there is no repeated invoice numbers, just in case
SELECT
	COUNT(INV.invoice_id) as `Id Invoice`,
	COUNT(DISTINCT INV.invoice_number) as `Invoice Number`
FROM
	invoices as INV;

--Then I do the exercise 6

SELECT
	INV.invoice_number as `Invoice Number`,
    INV.payment_total as `Payment Total`
FROM 
	invoices as INV
WHERE
	INV.payment_total <> 0
    AND
    INV.payment_total > (SELECT AVG((NULLIF(INV.payment_total,0))) FROM invoices as INV)
ORDER BY
	`Payment Total`DESC;
    
-- #### Question 7 (15 points) ####

-- Please identify the accounts (from the "general_ledger_accounts" table),
-- which do not match any invoice line items in the "invoice_line_items" table.
--
-- Please return the following two columns in the result set:
--
--  - "account_number" (from the "general_ledger_accounts" table)
--  - "account_description" (from the "general_ledger_accounts" table)
--
-- Please also sort the result set by account number in ascending order.

-- NOTE: You must present THREE different methods in your answer. Please write one query for each method used.

--First Method - Rows sent to client 54
SELECT 
	LA.account_number as `Account Number`, 
	LA.account_description as `Account Description`
FROM 
	general_ledger_accounts as LA
	WHERE LA.account_number NOT IN (
		SELECT 
        IL.account_number 
		FROM 
        invoice_line_items as IL)
ORDER BY LA.account_number;

--Second Method - Rows sent to client 54
SELECT 
	LA.account_number as `Account Number`, 
	LA.account_description as `Account Description`
FROM 
	general_ledger_accounts as LA
WHERE NOT EXISTS (
		SELECT 
        IL.account_number 
		FROM invoice_line_items as IL
        WHERE LA.account_number = IL.account_number)
ORDER BY LA.account_number;

-- Thrid Method - Rows sent to client: 54
SELECT 
	LA.account_number as `Account Number`, 
	LA.account_description as `Account Description`
FROM 
	general_ledger_accounts as LA
LEFT JOIN 
	invoice_line_items as IL
ON  LA.account_number = IL.account_number
	WHERE IL.account_number IS NULL
ORDER BY LA.account_number ;


-- #### Question 8 (5 points) ####

-- Please return one row per vendor, which represents the vendor's oldest invoice (the one with the earliest date).
-- Note that each vendor's oldest invoice is unique.
--
-- Each row returned should include the following values:
--
--  - "vendor_name"
--  - "invoice_number"
--  - "invoice_date"
--  - "invoice_total"
--
-- Please sort the result set by "vendor_name" in ascending order.

-- Hint: 34 rows should be returned in the result grid.

SELECT 
	VE.vendor_name as `Vendor Name`,
    INV.invoice_number as `Invoice Number`,
    INV.invoice_date as `Invoice Date`,
    INV.invoice_total as `Invoice Total`
FROM 
	vendors as VE
JOIN 
    invoices as INV
ON VE.vendor_id = INV.vendor_id
WHERE invoice_date = (SELECT
						MIN(INV.invoice_date) 
						FROM invoices as INV
                        JOIN (SELECT DISTINCT VE.vendor_name FROM vendors as VE) as VE2
                        WHERE VE.vendor_id = INV.vendor_id)
ORDER BY `Vendor Name`;





