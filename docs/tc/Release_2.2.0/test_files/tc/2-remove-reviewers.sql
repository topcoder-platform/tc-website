--
-- Removes existing active reviewers from Assembly Review Board. Following users are removed from Assembly Review Board
-- by setting their status to "Kicked Out" and "Resigned" respectively: super, user
--
UPDATE tcs_catalog:rboard_user SET status_id = 80 WHERE user_id = 132457;
UPDATE tcs_catalog:rboard_user SET status_id = 70 WHERE user_id = 132458;
