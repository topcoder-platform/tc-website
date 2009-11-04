database tcs_catalog;

-- create synonym for contest eligibility table
create synonym 'informix'.contest_eligibility
for common_oltp:'informix'.contest_eligibility;
