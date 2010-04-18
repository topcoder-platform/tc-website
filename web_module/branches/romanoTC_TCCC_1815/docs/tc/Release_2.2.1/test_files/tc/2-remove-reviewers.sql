--
-- Removes existing active reviewers from Architecture Review Board. Following users are removed from Architecture Review Board
-- by setting their status to "Kicked Out" and "Resigned" respectively: super, user
--
UPDATE tcs_catalog:rboard_user SET status_id = 80 WHERE user_id = 132457 AND project_type_id = 7;
UPDATE tcs_catalog:rboard_user SET status_id = 70 WHERE user_id = 132458 AND project_type_id = 7;
