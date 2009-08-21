database studio_oltp;

-- create synonyms
create synonym 'informix'.project_role_terms_of_use_xref
for common_oltp:'informix'.project_role_terms_of_use_xref;

create synonym 'informix'.user_terms_of_use_xref
for common_oltp:'informix'.user_terms_of_use_xref;

create synonym 'informix'.phase_type_lu
for tcs_catalog:'informix'.phase_type_lu;

create synonym 'informix'.resource_role_lu
for tcs_catalog:'informix'.resource_role_lu;

-- Create project_role_terms_of_use_xref association for current active contests.
insert into project_role_terms_of_use_xref
select contest_id, 1, 20543, current, current from contest
where current between start_time and end_time
and contest_status_id = 2;
