--
-- Removes existing active reviewers from Conceptualization, Specification and Testing Compititions Review Board.
--

--
--  Following user is removed from Conceptualization Review Board by setting their status to "Kicked Out": super
--
UPDATE tcs_catalog:rboard_user SET status_id = 80 WHERE user_id = 132457 AND project_type_id = 23;

--
--  Following user is removed from Specification Review Board by setting their status to "Resigned": user
--
UPDATE tcs_catalog:rboard_user SET status_id = 70 WHERE user_id = 132458 AND project_type_id = 6;


--
--  Following user is removed from Testing Review Board by setting their status to "Resigned": Suspended
--
UPDATE tcs_catalog:rboard_user SET status_id = 60 WHERE user_id = 124764 AND project_type_id = 13;