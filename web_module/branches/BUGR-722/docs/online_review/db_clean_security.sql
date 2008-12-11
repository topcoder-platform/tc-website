-- Delete all security manager entries related to online review projects
DELETE FROM security_perms
WHERE permission LIKE 'com.topcoder.apps.review.security.%';

insert into security_perms values (1,'com.topcoder.apps.review.security.AdminPermission',296466);

DELETE FROM user_role_xref
WHERE role_id IN
	(SELECT role_id
	 FROM security_roles
	 WHERE description LIKE '% Design %');
DELETE FROM user_role_xref
WHERE role_id IN
	(SELECT role_id
	 FROM security_roles
	 WHERE description LIKE '% Development %');

DELETE FROM security_roles
WHERE description LIKE '% Design %';

DELETE FROM security_roles
WHERE description LIKE '% Development %';
