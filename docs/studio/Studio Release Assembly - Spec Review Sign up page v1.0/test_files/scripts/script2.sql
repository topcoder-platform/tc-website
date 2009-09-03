database studio_oltp;

-- create sample review board
insert into rboard_user values (124764, 3, 100, 0);  -- Hung / Logo / Active
insert into rboard_user values (124772, 3, 90, 1);   -- Partha / Logo / Immune
insert into rboard_user values (124772, 14, 100, 0); -- Partha / Icon / Active

-- create sample specification reviews
insert into spec_review values (1, 2041, 1, 4, current, "user", current, "user", current, null);
insert into spec_review values (2, 2042, 1, 4, current, "user", current, "user", current, null);
insert into spec_review values (3, 2713, 1, 4, current, "user", current, "user", current, null);
