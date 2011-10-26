--
-- This script contains the SQL statements to alter the existing databases to reflect the changes caused by
-- TopCoder Member Profile Enhancement assembly
--

--
-- Grant a permission for viewing new tracks in member profiles to all desired roles.
--
insert into common_oltp:security_perms(role_id, permission, security_status_id)
                    VALUES(2002, 'DataDump:dd_track_rating_history dsid: 27', 1);

--
-- Run this under topcoder_dw schema
--
INSERT INTO topcoder_dw:coder( coder_id, handle, member_since,status )
                       VALUES( 132457, "super", "2004-05-18 14:58:58", "A");
INSERT INTO topcoder_dw:coder( coder_id, handle, member_since, status )
                      VALUES ( 132456, "heffan", "2006-10-18 14:58:58", "A");
INSERT INTO topcoder_dw:coder( coder_id, handle, member_since, status )
                      VALUES ( 124764, "Hung", "2008-10-18 14:58:58", "A");
INSERT INTO topcoder_dw:coder( coder_id, handle, member_since, status )
                      VALUES ( 124772, "Partha", "2007-11-14 14:58:58", "A");

------------------------------------------------------------------------------------------------------
-- Run this under tcs_dw schema
------------------------------------------------------------------------------------------------------
-- Insert records for Conceptualization Projects
INSERT INTO tcs_dw:project(project_id, component_name, category_desc, posting_date, submitby_date, rating_date, phase_id, status_id, project_category_id)
                    VALUES(30005504, "Aether OCS Conceptualization", "Application", "2008-11-04 09:00:00", "2008-11-11 09:00:00", "2008-11-23 09:00:00.000", 134, 4, 23);
INSERT INTO tcs_dw:project(project_id, component_name, category_desc, posting_date, submitby_date, rating_date, phase_id, status_id, project_category_id)
                    VALUES(30005570, "Hypnos Carrier Call Detail Conceptualization", "Application", "2008-11-22 09:00:00", "2008-11-28 05:37:00", "2008-12-02 09:00:00.000", 134, 4, 23);
INSERT INTO tcs_dw:project(project_id, component_name, category_desc, posting_date, submitby_date, rating_date, phase_id, status_id, project_category_id)
                    VALUES(30005639, "Agent Directory Application", "Application", "2008-12-11 09:00:00", "2008-12-15 05:23:00", "2008-12-24 09:00:00.000", 134, 4, 23);
INSERT INTO tcs_dw:project(project_id, component_name, category_desc, posting_date, submitby_date, rating_date, phase_id, status_id, project_category_id, num_valid_submissions)
                    VALUES(30006040, "Vendor Experience Conceptualization", "Application", "2009-01-01 09:00:00", "2009-01-07 05:23:00", "2009-01-17 09:00:00.000", 1, 4, 23, 2);
INSERT INTO tcs_dw:project(project_id, component_name, category_desc, posting_date, submitby_date, rating_date, phase_id, status_id, project_category_id, num_valid_submissions)
                    VALUES(30006063, "Agnostic Exchange Services Conceptualization", "Application", "2009-01-09 09:00:00", "2009-01-15 05:23:00", "2009-01-28 09:00:00.000", 134, 1, 23, 3);

-- Insert records for Specification Projects
INSERT INTO tcs_dw:project(project_id, component_name, category_desc, posting_date, submitby_date, rating_date, phase_id, status_id, project_category_id)
                    VALUES(30005567, "Status Portal Specification", "Application", "2008-11-04 09:00:00", "2008-11-11 09:00:00", "2008-11-23 09:00:00.000", 117, 4, 6);
INSERT INTO tcs_dw:project(project_id, component_name, category_desc, posting_date, submitby_date, rating_date, phase_id, status_id, project_category_id)
                    VALUES(30005626, "Broker Site Application", "Application", "2008-11-22 09:00:00", "2008-11-28 05:37:00", "2008-12-02 09:00:00.000", 117, 4, 6);
INSERT INTO tcs_dw:project(project_id, component_name, category_desc, posting_date, submitby_date, rating_date, phase_id, status_id, project_category_id)
                    VALUES(30006081, "Insurance Agent Directory Specification", "Application", "2008-12-11 09:00:00", "2008-12-15 05:23:00", "2008-12-24 09:00:00.000", 117, 4, 6);
INSERT INTO tcs_dw:project(project_id, component_name, category_desc, posting_date, submitby_date, rating_date, phase_id, status_id, project_category_id, num_valid_submissions)
                    VALUES(30006122, "Budget Stacker Consumer Specification", "Application", "2009-01-01 09:00:00", "2009-01-07 05:23:00", "2009-01-17 09:00:00.000", 117, 1, 6, 3);
INSERT INTO tcs_dw:project(project_id, component_name, category_desc, posting_date, submitby_date, rating_date, phase_id, status_id, project_category_id, num_valid_submissions)
                    VALUES(30006157, "Lender Automation Admin Pages Specification", "Application", "2009-01-09 09:00:00", "2009-01-15 05:23:00", "2009-01-28 09:00:00.000", 117, 1, 6, 2);

-- Insert records for Architecture Projects
INSERT INTO tcs_dw:project(project_id, component_name, category_desc, posting_date, submitby_date, rating_date, phase_id, status_id, project_category_id)
                    VALUES(30005785, "Hestia B2B Data Conversion", "Application", "2008-11-04 09:00:00", "2008-11-11 09:00:00", "2008-11-23 09:00:00.000", 118, 4, 7);
INSERT INTO tcs_dw:project(project_id, component_name, category_desc, posting_date, submitby_date, rating_date, phase_id, status_id, project_category_id)
                    VALUES(30005860, "Loan Coach Admin Tool Architecture", "Application", "2008-11-22 09:00:00", "2008-11-28 05:37:00", "2008-12-02 09:00:00.000", 118, 4, 7);
INSERT INTO tcs_dw:project(project_id, component_name, category_desc, posting_date, submitby_date, rating_date, phase_id, status_id, project_category_id)
                    VALUES(30005913, "FEPS Explorer Back End Module Architecture", "Application", "2008-12-11 09:00:00", "2008-12-15 05:23:00", "2008-12-24 09:00:00.000", 118, 4, 7);
INSERT INTO tcs_dw:project(project_id, component_name, category_desc, posting_date, submitby_date, rating_date, phase_id, status_id, project_category_id, num_valid_submissions)
                    VALUES(30006147, "Neptune Austin Times System Architecture", "Application", "2009-01-01 09:00:00", "2009-01-07 05:23:00", "2009-01-17 09:00:00.000", 118, 1, 7, 3);
INSERT INTO tcs_dw:project(project_id, component_name, category_desc, posting_date, submitby_date, rating_date, phase_id, status_id, project_category_id, num_valid_submissions)
                    VALUES(30006155, "Auto Application System Architecture", "Application", "2009-01-09 09:00:00", "2009-01-15 05:23:00", "2009-01-28 09:00:00.000", 118, 1, 7, 1);

-- Insert records for Design Projects
INSERT INTO tcs_dw:project(project_id, component_name, category_desc, posting_date, submitby_date, rating_date, phase_id, status_id, project_category_id)
                    VALUES(30006022, "Thunderbird Custom Dynamic Content Client", "Java",  "2008-11-04 09:00:00", "2008-11-11 09:00:00", "2008-11-23 09:00:00.000", 112, 4, 1);
INSERT INTO tcs_dw:project(project_id, component_name, category_desc, posting_date, submitby_date, rating_date, phase_id, status_id, project_category_id)
                    VALUES(30006083, "Javascript Code Editor", "Java", "2008-11-22 09:00:00", "2008-11-28 05:37:00", "2008-12-02 09:00:00.000", 112, 4, 1);
INSERT INTO tcs_dw:project(project_id, component_name, category_desc, posting_date, submitby_date, rating_date, phase_id, status_id, project_category_id)
                    VALUES(30006313, "Preference Center Consumer Services", ".NET", "2008-12-11 09:00:00", "2008-12-15 05:23:00", "2008-12-24 09:00:00.000", 112, 4, 1);
INSERT INTO tcs_dw:project(project_id, component_name, category_desc, posting_date, submitby_date, rating_date, phase_id, status_id, project_category_id, num_valid_submissions)
                    VALUES(30006425, "Morello CMS Wrapper", ".NET", "2009-01-01 09:00:00", "2009-01-07 05:23:00", "2009-01-17 09:00:00.000", 112, 1, 1, 2);
INSERT INTO tcs_dw:project(project_id, component_name, category_desc, posting_date, submitby_date, rating_date, phase_id, status_id, project_category_id, num_valid_submissions)
                    VALUES(30006383, "Provisioning Tool", "Java", "2009-01-09 09:00:00", "2009-01-15 05:23:00", "2009-01-28 09:00:00.000", 112, 1, 1, 2);

-- Inserting records for Development Projects
INSERT INTO tcs_dw:project(project_id, component_name, category_desc, posting_date, submitby_date, rating_date, phase_id, status_id, project_category_id)
                    VALUES(15251316, "Question Manager", "Java", "2008-06-29 09:00:00", "2008-07-06 09:00:00", "2008-07-06 09:00:00.000", 113, 4, 2);
INSERT INTO tcs_dw:project(project_id, component_name, category_desc, posting_date, submitby_date, rating_date, phase_id, status_id, project_category_id)
                    VALUES(15312837, "Answer Manager", "Java", "2008-07-06 09:00:00", "2008-07-13 09:00:00", "2008-07-13 09:00:00.000", 113, 4, 2);
INSERT INTO tcs_dw:project(project_id, component_name, category_desc, posting_date, submitby_date, rating_date, phase_id, status_id, project_category_id)
                    VALUES(15377883, "Base Question", "Java", "2008-07-13 09:00:00", "2008-07-20 09:00:00", "2008-07-20 09:00:00.000", 113, 4, 2);
INSERT INTO tcs_dw:project(project_id, component_name, category_desc, posting_date, submitby_date, rating_date, phase_id, status_id, project_category_id)
                    VALUES(15959651, "SVG 2 PDF", "Java", "2008-09-14 09:00:00", "2008-09-21 09:00:00", "2008-09-21 09:00:00.000", 113, 4, 2);
INSERT INTO tcs_dw:project(project_id, component_name, category_desc, posting_date, submitby_date, rating_date, phase_id, status_id, project_category_id)
                    VALUES(16189849, "Syntax Highlighter", "Java", "2008-10-05 09:00:00", "2008-10-12 09:00:00", "2008-10-12 09:00:00.000", 113, 4, 2);
INSERT INTO tcs_dw:project(project_id, component_name, category_desc, posting_date, submitby_date, rating_date, phase_id, status_id, project_category_id)
                    VALUES(20353510, "Combined Result Set", "Java", "2008-12-28 09:00:00", "2009-01-04 09:00:00", "2009-01-04 09:00:00.000", 113, 4, 2);
INSERT INTO tcs_dw:project(project_id, component_name, category_desc, posting_date, submitby_date, rating_date, phase_id, status_id, project_category_id)
                    VALUES(30001735, "Conversation Manager Error Handler", ".NET", "2009-01-21 15:00:00", "2009-01-28 15:00:00", "2009-02-07 15:00:00.000", 113, 4, 2);
INSERT INTO tcs_dw:project(project_id, component_name, category_desc, posting_date, submitby_date, rating_date, phase_id, status_id, project_category_id, num_valid_submissions)
                    VALUES(30001750, "Persist Message Command", ".NET", "2009-02-02 15:00:00", "2009-02-09 15:00:00", "2009-02-15 15:00:00.000", 113, 1, 2, 2);
INSERT INTO tcs_dw:project(project_id, component_name, category_desc, posting_date, submitby_date, rating_date, phase_id, status_id, project_category_id, num_valid_submissions)
                    VALUES(30001803, "Send Message Command", ".NET", "2009-03-01 15:00:00", "2009-03-09 15:00:00", "2009-03-15 15:00:00.000", 113, 1, 2, 4);

-- Insert records for Assembly Projects
INSERT INTO tcs_dw:project(project_id, component_name, category_desc, posting_date, submitby_date, rating_date, phase_id, status_id, project_category_id)
                    VALUES(30006076, "Hestia B2B Find Company Page", "Application", "2008-11-04 09:00:00", "2008-11-11 09:00:00", "2008-11-23 09:00:00.000", 125, 4, 14);
INSERT INTO tcs_dw:project(project_id, component_name, category_desc, posting_date, submitby_date, rating_date, phase_id, status_id, project_category_id)
                    VALUES(30006171, "Hestia B2B Trilogie Adapter", "Application", "2008-11-22 09:00:00", "2008-11-28 05:37:00", "2008-12-02 09:00:00.000", 125, 4, 14);
INSERT INTO tcs_dw:project(project_id, component_name, category_desc, posting_date, submitby_date, rating_date, phase_id, status_id, project_category_id)
                    VALUES(30006270, "Xanthus Integration Release Assembly 2", "Application", "2008-12-11 09:00:00", "2008-12-15 05:23:00", "2008-12-24 09:00:00.000", 125, 4, 14);
INSERT INTO tcs_dw:project(project_id, component_name, category_desc, posting_date, submitby_date, rating_date, phase_id, status_id, project_category_id, num_valid_submissions)
                    VALUES(30006301, "Cockpit Share Submissions Integration", "Application", "2009-01-01 09:00:00", "2009-01-07 05:23:00", "2009-01-17 09:00:00.000", 125, 1, 14, 3);
INSERT INTO tcs_dw:project(project_id, component_name, category_desc, posting_date, submitby_date, rating_date, phase_id, status_id, project_category_id, num_valid_submissions)
                    VALUES(30006426, "EHR Visit Note Round 4", "Application", "2009-01-09 09:00:00", "2009-01-15 05:23:00", "2009-01-28 09:00:00.000", 125, 1, 14, 3);

-- Insert records for Application Testing Projects
INSERT INTO tcs_dw:project(project_id, component_name, category_desc, posting_date, submitby_date, rating_date, phase_id, status_id, project_category_id)
                    VALUES(30005533, "Diana EHR QA-1", "Application", "2008-11-04 09:00:00", "2008-11-11 09:00:00", "2008-11-23 09:00:00.000", 124, 4, 13);
INSERT INTO tcs_dw:project(project_id, component_name, category_desc, posting_date, submitby_date, rating_date, phase_id, status_id, project_category_id)
                    VALUES(30005745, "Status Portal Test Scenarios", "Application", "2008-11-22 09:00:00", "2008-11-28 05:37:00", "2008-12-02 09:00:00.000", 124, 4, 13);
INSERT INTO tcs_dw:project(project_id, component_name, category_desc, posting_date, submitby_date, rating_date, phase_id, status_id, project_category_id)
                    VALUES(30006075, "FEPS Explorer Test Scenarios 2", "Application", "2008-12-11 09:00:00", "2008-12-15 05:23:00", "2008-12-24 09:00:00.000", 124, 4, 13);
INSERT INTO tcs_dw:project(project_id, component_name, category_desc, posting_date, submitby_date, rating_date, phase_id, status_id, project_category_id, num_valid_submissions)
                    VALUES(30006193, "Diana Mira 2.0 QA Plan Contest", "Application", "2009-01-01 09:00:00", "2009-01-07 05:23:00", "2009-01-17 09:00:00.000", 124, 1, 13, 3);
INSERT INTO tcs_dw:project(project_id, component_name, category_desc, posting_date, submitby_date, rating_date, phase_id, status_id, project_category_id, num_valid_submissions)
                    VALUES(30006428, "SDC - AWD Test Scenario", "Application", "2009-01-09 09:00:00", "2009-01-15 05:23:00", "2009-01-28 09:00:00.000", 124, 1, 13, 2);

--------------------------------------------------------------------------------------------------------------
-- Run this under tcs_dw schema
--
-- The following inserts records for 4 users:
-- super  (id:132457) : has algorithm, HS, marathon, development, and assembly participations
-- heffan (id:132456) : has conceptualization, specification, and design participations
-- Hung   (id:124764) : has architecture, and design participations
-- Partha (id:124772) : has design, and application testing participations
--------------------------------------------------------------------------------------------------------------
-- super 
-- Question Manager Java Development Project
INSERT INTO tcs_dw:project_result(project_id, user_id, final_score, submit_timestamp, payment, placed, old_rating, new_rating, rating_order, rating_ind, current_reliability_ind, old_reliability, new_reliability, reliable_submission_ind, num_ratings)
                           VALUES(15251316, 132457, 55.7, "2008-07-01 22:14", 0.0, 3, 1057, 677, 6, 1, 1, 0, 1, 1, 1);
-- Combined Result Set Java Development Project
INSERT INTO tcs_dw:project_result(project_id, user_id, final_score, submit_timestamp, payment, placed, old_rating, new_rating, rating_order, rating_ind, current_reliability_ind, old_reliability, new_reliability, reliable_submission_ind, num_ratings)
                           VALUES(20353510, 132457, 85.61, "2009-01-03 22:16", 0.0, 5, 677, 808, 8, 1, 1, 1, 1, 1, 2);
-- Conversation Manager Error Handler .NET Development Project
INSERT INTO tcs_dw:project_result(project_id, user_id, final_score, submit_timestamp, payment, placed, old_rating, new_rating, rating_order, rating_ind, current_reliability_ind, old_reliability, new_reliability, reliable_submission_ind, num_ratings)
                           VALUES(30001735, 132457, 94.33, "2006-11-02 22:35", 0.0, 18, 808, 1089, 13, 1, 1, 1, 1, 1, 3);
-- Hestia B2B Find Company Page Assembly (1st place)
INSERT INTO tcs_dw:project_result(project_id, user_id, final_score, submit_timestamp, payment, placed, old_rating, new_rating, rating_order, rating_ind, current_reliability_ind, old_reliability, new_reliability, reliable_submission_ind, num_ratings)
                           VALUES(30006076, 132457, 99.7, "2008-11-10 22:14", 1000.0, 1, 1057, 1200, 1, 1, 1, 1, 1, 1, 1);
-- Xanthus Integration Release Assembly 2 (2nd place)
INSERT INTO tcs_dw:project_result(project_id, user_id, final_score, submit_timestamp, payment, placed, old_rating, new_rating, rating_order, rating_ind, current_reliability_ind, old_reliability, new_reliability, reliable_submission_ind, num_ratings)
                           VALUES(30006270, 132457, 97.2, "2008-12-13 22:14", 500.0, 2, 1200, 1423, 2, 1, 1, 1, 1, 1, 2);
-- super Outstanding projects
-- Persist Message Command development
INSERT INTO tcs_dw:project_result(project_id, user_id, valid_submission_ind, potential_points)
                           VALUES(30001750, 132457, 1, 200);
-- Send Message Command development
INSERT INTO tcs_dw:project_result(project_id, user_id, valid_submission_ind, potential_points)
                           VALUES(30001803, 132457, 1, 200);
-- Cockpit Share Submissions Integration assembly
INSERT INTO tcs_dw:project_result(project_id, user_id, valid_submission_ind, potential_points)
                           VALUES(30006301, 132457, 1, 210);
-- EHR Visit Note Round 4 assembly
INSERT INTO tcs_dw:project_result(project_id, user_id, valid_submission_ind, potential_points)
                           VALUES(30006426, 132457, 1, 123);

-- heffan
-- Aether OCS Conceptualization
INSERT INTO tcs_dw:project_result(project_id, user_id, final_score, submit_timestamp, payment, placed, old_rating, new_rating, rating_order, rating_ind, current_reliability_ind, old_reliability, new_reliability, reliable_submission_ind, num_ratings)
                           VALUES(30005504, 132456, 100, "2008-11-09 22:14", 1000.0, 1, 1057, 1323, 1, 1, 1, 1, 1, 1, 1);
-- Hypnos Carrier Call Detail Conceptualization
INSERT INTO tcs_dw:project_result(project_id, user_id, final_score, submit_timestamp, payment, placed, old_rating, new_rating, rating_order, rating_ind, current_reliability_ind, old_reliability, new_reliability, reliable_submission_ind, num_ratings)
                           VALUES(30005570, 132456, 99.39, "2008-11-27 22:14", 1500.0, 1, 1323, 1505, 2, 1, 1, 1, 1, 1, 2);
-- Agent Directory Application Conceptualization
INSERT INTO tcs_dw:project_result(project_id, user_id, final_score, submit_timestamp, payment, placed, old_rating, new_rating, rating_order, rating_ind, current_reliability_ind, old_reliability, new_reliability, reliable_submission_ind, num_ratings)
                           VALUES(30005639, 132456, 100, "2008-12-14 22:14", 1500.0, 1, 1505, 1720, 3, 1, 1, 1, 1, 1, 3);

-- Status Portal Specification (2nd place)
INSERT INTO tcs_dw:project_result(project_id, user_id, final_score, submit_timestamp, payment, placed, old_rating, new_rating, rating_order, rating_ind, current_reliability_ind, old_reliability, new_reliability, reliable_submission_ind, num_ratings)
                           VALUES(30005567, 132456, 92, "2008-11-09 22:14", 500.0, 2, 1000, 1000, 1, 1, 1, 1, 1, 1, 1);
-- Broker Site Application Specification
INSERT INTO tcs_dw:project_result(project_id, user_id, final_score, submit_timestamp, payment, placed, old_rating, new_rating, rating_order, rating_ind, current_reliability_ind, old_reliability, new_reliability, reliable_submission_ind, num_ratings)
                           VALUES(30005626, 132456, 98.31, "2008-11-27 22:14", 1000.0, 1, 1000, 1300, 2, 1, 1, 1, 1, 1, 2);

-- Thunderbird Custom Dynamic Content Client Design Project (2nd place)
INSERT INTO tcs_dw:project_result(project_id, user_id, final_score, submit_timestamp, payment, placed, old_rating, new_rating, rating_order, rating_ind, current_reliability_ind, old_reliability, new_reliability, reliable_submission_ind, num_ratings)
                           VALUES(30006022, 132456, 96, "2008-11-09 22:14", 500.0, 2, 1000, 1200, 1, 1, 1, 1, 1, 1, 1);
-- Preference Center Consumer Services Design Project
INSERT INTO tcs_dw:project_result(project_id, user_id, final_score, submit_timestamp, payment, placed, old_rating, new_rating, rating_order, rating_ind, current_reliability_ind, old_reliability, new_reliability, reliable_submission_ind, num_ratings)
                           VALUES(30006313, 132456, 88, "2008-12-12 22:14", 0.0, 3, 1200, 1123, 2, 1, 1, 1, 1, 1, 2);

-- heffan Outstanding projects
-- Vendor Experience Conceptualization
INSERT INTO tcs_dw:project_result(project_id, user_id, valid_submission_ind, potential_points)
                           VALUES(30006040, 132456, 1, 122);
-- Agnostic Exchange Services Conceptualization
INSERT INTO tcs_dw:project_result(project_id, user_id, valid_submission_ind, potential_points)
                           VALUES(30006063, 132456, 1, 123);
-- Budget Stacker Consumer Specification
INSERT INTO tcs_dw:project_result(project_id, user_id, valid_submission_ind, potential_points)
                           VALUES(30006122, 132456, 1, 123);
-- Lender Automation Admin Pages Specification
INSERT INTO tcs_dw:project_result(project_id, user_id, valid_submission_ind, potential_points)
                           VALUES(30006157, 132456, 1, 123);
-- Morello CMS Wrapper Design
INSERT INTO tcs_dw:project_result(project_id, user_id, valid_submission_ind, potential_points)
                           VALUES(30006425, 132456, 1, 342);
-- Provisioning Tool Design
INSERT INTO tcs_dw:project_result(project_id, user_id, valid_submission_ind, potential_points)
                           VALUES(30006383, 132456, 1, 122);

-- Hung
-- Hestia B2B Data Conversion Architecture (2nd place)
INSERT INTO tcs_dw:project_result(project_id, user_id, final_score, submit_timestamp, payment, placed, old_rating, new_rating, rating_order, rating_ind, current_reliability_ind, old_reliability, new_reliability, reliable_submission_ind, num_ratings)
                           VALUES(30005785, 124764, 90, "2008-11-09 22:14", 500.0, 2, 588, 800, 1, 1, 1, 1, 1, 1, 1);
-- Loan Coach Admin Tool Architecture (1st place)
INSERT INTO tcs_dw:project_result(project_id, user_id, final_score, submit_timestamp, payment, placed, old_rating, new_rating, rating_order, rating_ind, current_reliability_ind, old_reliability, new_reliability, reliable_submission_ind, num_ratings)
                           VALUES(30005860, 124764, 97, "2008-11-21 22:14", 1500.0, 1, 800, 1100, 2, 1, 1, 1, 1, 1, 2);

-- Thunderbird Custom Dynamic Content Client Design Project (1st place)
INSERT INTO tcs_dw:project_result(project_id, user_id, final_score, submit_timestamp, payment, placed, old_rating, new_rating, rating_order, rating_ind, current_reliability_ind, old_reliability, new_reliability, reliable_submission_ind, num_ratings)
                           VALUES(30006022, 124764, 97, "2008-11-09 22:14", 1000.0, 1, 1000, 1300, 1, 1, 1, 1, 1, 1, 1);
-- Preference Center Consumer Services Design Project (2nd place)
INSERT INTO tcs_dw:project_result(project_id, user_id, final_score, submit_timestamp, payment, placed, old_rating, new_rating, rating_order, rating_ind, current_reliability_ind, old_reliability, new_reliability, reliable_submission_ind, num_ratings)
                           VALUES(30006313, 124764, 91, "2008-12-11 22:14", 250.0, 2, 1300, 1290, 2, 1, 1, 1, 1, 1, 2);

-- Hung Outstanding projects
-- Neptune Austin Times System Architecture
INSERT INTO tcs_dw:project_result(project_id, user_id, valid_submission_ind, potential_points)
                           VALUES(30006147, 124764, 1, 200);
-- Auto Application System Architecture
INSERT INTO tcs_dw:project_result(project_id, user_id, valid_submission_ind, potential_points)
                           VALUES(30006155, 124764, 1, 200);
-- Morello CMS Wrapper Design
INSERT INTO tcs_dw:project_result(project_id, user_id, valid_submission_ind, potential_points)
                           VALUES(30006425, 124764, 1, 170);
-- Provisioning Tool Design
INSERT INTO tcs_dw:project_result(project_id, user_id, valid_submission_ind, potential_points)
                           VALUES(30006383, 124764, 1, 170);
-- Partha
-- Diana EHR QA-1 application testing (1st place)
INSERT INTO tcs_dw:project_result(project_id, user_id, final_score, submit_timestamp, payment, placed, old_rating, new_rating, rating_order, rating_ind, current_reliability_ind, old_reliability, new_reliability, reliable_submission_ind, num_ratings)
                           VALUES(30005533, 124772, 97, "2008-11-09 22:14", 100.0, 1, 700, 1110, 1, 1, 1, 1, 1, 1, 1);
-- Status Portal Test Scenarios application testing (1st place)
INSERT INTO tcs_dw:project_result(project_id, user_id, final_score, submit_timestamp, payment, placed, old_rating, new_rating, rating_order, rating_ind, current_reliability_ind, old_reliability, new_reliability, reliable_submission_ind, num_ratings)
                           VALUES(30005745, 124772, 100, "2008-11-21 22:14", 100.0, 1, 1110, 1333, 2, 1, 1, 1, 1, 1, 2);
-- FEPS Explorer Test Scenarios 2 application testing (1st place)
INSERT INTO tcs_dw:project_result(project_id, user_id, final_score, submit_timestamp, payment, placed, old_rating, new_rating, rating_order, rating_ind, current_reliability_ind, old_reliability, new_reliability, reliable_submission_ind, num_ratings)
                           VALUES(30006075, 124772, 100, "2008-12-14 22:14", 150.0, 1, 1333, 1553, 3, 1, 1, 1, 1, 1, 3);

-- Preference Center Consumer Services Design Project (1nd place)
INSERT INTO tcs_dw:project_result(project_id, user_id, final_score, submit_timestamp, payment, placed, old_rating, new_rating, rating_order, rating_ind, current_reliability_ind, old_reliability, new_reliability, reliable_submission_ind, num_ratings)
                           VALUES(30006313, 124772, 99, "2008-12-11 22:14", 500.0, 1, 1300, 1400, 1, 1, 1, 1, 1, 1, 1);
-- Javascript Code Editor Design Project (1nd place)
INSERT INTO tcs_dw:project_result(project_id, user_id, final_score, submit_timestamp, payment, placed, old_rating, new_rating, rating_order, rating_ind, current_reliability_ind, old_reliability, new_reliability, reliable_submission_ind, num_ratings)
                           VALUES(30006083, 124772, 99, "2008-12-27 22:14", 500.0, 1, 1400, 1500, 2, 1, 1, 1, 1, 1, 2);

-- Partha Outstanding projects
-- Diana Mira 2.0 QA Plan Contest Application Testing
INSERT INTO tcs_dw:project_result(project_id, user_id, valid_submission_ind, potential_points)
                           VALUES(30006193, 124772, 1, 30);
-- SDC - AWD Test Scenario Application Testing
INSERT INTO tcs_dw:project_result(project_id, user_id, valid_submission_ind, potential_points)
                           VALUES(30006428, 124772, 1, 30);
-- Morello CMS Wrapper Design
INSERT INTO tcs_dw:project_result(project_id, user_id, valid_submission_ind, potential_points)
                           VALUES(30006425, 124772, 1, 20);
-- Provisioning Tool Design
INSERT INTO tcs_dw:project_result(project_id, user_id, valid_submission_ind, potential_points)
                           VALUES(30006383, 124772, 1, 30);

--------------------------------------------------------------------------------------------------------------
-- This to be run under tcs_dw
--------------------------------------------------------------------------------------------------------------
INSERT INTO tcs_dw:user_rank_type_lu (user_rank_type_id, user_rank_type_desc)
                               VALUES(2, "Description");
-- super development rating
INSERT INTO tcs_dw:user_rating( user_id, phase_id, rating, num_ratings, vol)
                        VALUES( 132457, 113, 1089, 3, 222 );
-- super development reliability
INSERT INTO tcs_dw:user_reliability( user_id, rating, phase_id)
                             VALUES( 132457, 1.00, 113);
-- super development raking
INSERT INTO tcs_dw:user_rank(user_id, phase_id, rank, percentile, user_rank_type_id)
                      VALUES(132457, 113, 1, 99.99, 2);
-- super assembly rating
INSERT INTO tcs_dw:user_rating( user_id, phase_id, rating, num_ratings, vol)
                        VALUES( 132457, 125, 1423, 2 , 399);
-- super assembly raking
INSERT INTO tcs_dw:user_rank(user_id, phase_id, rank, percentile, user_rank_type_id)
                      VALUES(132457, 125, 1, 99.99, 2);
-- super assembly reliability
INSERT INTO tcs_dw:user_reliability( user_id, rating, phase_id)
                             VALUES( 132457, 1.00, 125);
-- heffan conceptualization rating
INSERT INTO tcs_dw:user_rating( user_id, phase_id, rating, num_ratings, vol)
                        VALUES( 132456, 134, 1720, 3 , 392);
-- heffan conceptualization reliability
INSERT INTO tcs_dw:user_reliability( user_id, rating, phase_id)
                             VALUES( 132456, 1.00, 134);
-- heffan conceptualization raking
INSERT INTO tcs_dw:user_rank(user_id, phase_id, rank, percentile, user_rank_type_id)
                      VALUES(132456, 134, 1, 99.99, 2);
-- heffan specification rating
INSERT INTO tcs_dw:user_rating( user_id, phase_id, rating , num_ratings, vol)
                        VALUES( 132456, 117, 1300, 2, 291 );
-- heffan specification reliability
INSERT INTO tcs_dw:user_reliability( user_id, rating, phase_id)
                             VALUES( 132456, 1.00, 117);
-- heffan conceptualization raking
INSERT INTO tcs_dw:user_rank(user_id, phase_id, rank, percentile, user_rank_type_id)
                      VALUES(132456, 117, 1, 99.99, 2);
-- heffan design rating
INSERT INTO tcs_dw:user_rating( user_id, phase_id, rating, num_ratings, vol)
                        VALUES( 132456, 112, 1123, 2 , 211);
-- heffan design reliability
INSERT INTO tcs_dw:user_reliability( user_id, rating, phase_id)
                             VALUES( 132456, 1.00, 112);
-- heffan design raking
INSERT INTO tcs_dw:user_rank(user_id, phase_id, rank, percentile, user_rank_type_id)
                      VALUES(132456, 112, 1, 98.99, 2);
-- Hung architecture rating
INSERT INTO tcs_dw:user_rating( user_id, phase_id, rating, num_ratings, vol)
                        VALUES( 124764, 118, 1100, 2, 111 );
-- Hung architecture reliability
INSERT INTO tcs_dw:user_reliability( user_id, rating, phase_id)
                             VALUES( 124764, 1.00, 118);
-- Hung architecture raking
INSERT INTO tcs_dw:user_rank(user_id, phase_id, rank, percentile, user_rank_type_id)
                      VALUES(124764, 118, 1, 99.99, 2);
-- Hung design rating
INSERT INTO tcs_dw:user_rating( user_id, phase_id, rating, num_ratings, vol)
                        VALUES( 124764, 112, 1290, 2, 221 );
-- Hung design reliability
INSERT INTO tcs_dw:user_reliability( user_id, rating, phase_id)
                             VALUES( 124764, 1.00, 112);
-- Hung design raking
INSERT INTO tcs_dw:user_rank(user_id, phase_id, rank, percentile, user_rank_type_id)
                      VALUES(124764, 112, 2, 99.99, 2);
-- Partha application testin rating
INSERT INTO tcs_dw:user_rating( user_id, phase_id, rating, num_ratings, vol)
                        VALUES( 124772, 124, 1553, 3, 399 );
-- Partha application testing reliability
INSERT INTO tcs_dw:user_reliability( user_id, rating, phase_id)
                             VALUES( 124772, 1.00, 124);
-- Partha application testing raking
INSERT INTO tcs_dw:user_rank(user_id, phase_id, rank, percentile, user_rank_type_id)
                      VALUES(124772, 124, 1, 99.99, 2);
-- Partha design rating
INSERT INTO tcs_dw:user_rating( user_id, phase_id, rating, num_ratings, vol)
                        VALUES( 124772, 112, 1500, 2, 221 );
-- Partha design reliability
INSERT INTO tcs_dw:user_reliability( user_id, rating, phase_id)
                             VALUES( 124772, 1.00, 112);
-- Partha application testing raking
INSERT INTO tcs_dw:user_rank(user_id, phase_id, rank, percentile, user_rank_type_id)
                      VALUES(124772, 112, 1, 99.99, 2);

--------------------------------------------------------------------------------------------------------------
-- Run this under tcs_catalog schema
--
-- The following inserts records for 4 users:
-- super  (id:132457) : has algorithm, HS, marathon, development, and assembly participations
-- heffan (id:132456) : has conceptualization, specification, and design participations
-- Hung   (id:124764) : has architecture, and design participations
-- Partha (id:124772) : has design, and application testing participations
--------------------------------------------------------------------------------------------------------------
-- super 
-- Question Manager Java Development Project
INSERT INTO tcs_catalog:project_result(project_id, user_id, final_score, payment, placed, old_rating, new_rating, rating_order, rating_ind, current_reliability_ind, old_reliability, new_reliability, reliable_submission_ind)
                           VALUES(15251316, 132457, 55.7, 0.0, 3, 1057, 677, 6, 1, 1, 0, 1, 1);
-- Combined Result Set Java Development Project
INSERT INTO tcs_catalog:project_result(project_id, user_id, final_score, payment, placed, old_rating, new_rating, rating_order, rating_ind, current_reliability_ind, old_reliability, new_reliability, reliable_submission_ind)
                           VALUES(20353510, 132457, 85.61, 0.0, 5, 677, 808, 8, 1, 1, 1, 1, 1);
-- Conversation Manager Error Handler .NET Development Project
INSERT INTO tcs_catalog:project_result(project_id, user_id, final_score, payment, placed, old_rating, new_rating, rating_order, rating_ind, current_reliability_ind, old_reliability, new_reliability, reliable_submission_ind)
                           VALUES(30001735, 132457, 94.33, 0.0, 18, 808, 1089, 13, 1, 1, 1, 1, 1);
-- Hestia B2B Find Company Page Assembly (1st place)
INSERT INTO tcs_catalog:project_result(project_id, user_id, final_score, payment, placed, old_rating, new_rating, rating_order, rating_ind, current_reliability_ind, old_reliability, new_reliability, reliable_submission_ind)
                           VALUES(30006076, 132457, 99.7, 1000.0, 1, 1057, 1200, 1, 1, 1, 1, 1, 1);
-- Xanthus Integration Release Assembly 2 (2nd place)
INSERT INTO tcs_catalog:project_result(project_id, user_id, final_score, payment, placed, old_rating, new_rating, rating_order, rating_ind, current_reliability_ind, old_reliability, new_reliability, reliable_submission_ind)
                           VALUES(30006270, 132457, 97.2, 500.0, 2, 1200, 1423, 2, 1, 1, 1, 1, 1);
-- heffan
-- Aether OCS Conceptualization
INSERT INTO tcs_catalog:project_result(project_id, user_id, final_score, payment, placed, old_rating, new_rating, rating_order, rating_ind, current_reliability_ind, old_reliability, new_reliability, reliable_submission_ind)
                           VALUES(30005504, 132456, 100, 1000.0, 1, 1057, 1323, 1, 1, 1, 1, 1, 1);
-- Hypnos Carrier Call Detail Conceptualization
INSERT INTO tcs_catalog:project_result(project_id, user_id, final_score, payment, placed, old_rating, new_rating, rating_order, rating_ind, current_reliability_ind, old_reliability, new_reliability, reliable_submission_ind)
                           VALUES(30005570, 132456, 99.39, 1500.0, 1, 1323, 1505, 2, 1, 1, 1, 1, 1);
-- Agent Directory Application Conceptualization
INSERT INTO tcs_catalog:project_result(project_id, user_id, final_score, payment, placed, old_rating, new_rating, rating_order, rating_ind, current_reliability_ind, old_reliability, new_reliability, reliable_submission_ind)
                           VALUES(30005639, 132456, 100, 1500.0, 1, 1505, 1720, 3, 1, 1, 1, 1, 1);

-- Status Portal Specification (2nd place)
INSERT INTO tcs_catalog:project_result(project_id, user_id, final_score, payment, placed, old_rating, new_rating, rating_order, rating_ind, current_reliability_ind, old_reliability, new_reliability, reliable_submission_ind)
                           VALUES(30005567, 132456, 92, 500.0, 2, 1000, 1000, 1, 1, 1, 1, 1, 1);
-- Broker Site Application Specification
INSERT INTO tcs_catalog:project_result(project_id, user_id, final_score, payment, placed, old_rating, new_rating, rating_order, rating_ind, current_reliability_ind, old_reliability, new_reliability, reliable_submission_ind)
                           VALUES(30005626, 132456, 98.31, 1000.0, 1, 1000, 1300, 2, 1, 1, 1, 1, 1);

-- Thunderbird Custom Dynamic Content Client Design Project (2nd place)
INSERT INTO tcs_catalog:project_result(project_id, user_id, final_score, payment, placed, old_rating, new_rating, rating_order, rating_ind, current_reliability_ind, old_reliability, new_reliability, reliable_submission_ind)
                           VALUES(30006022, 132456, 96, 500.0, 2, 1000, 1200, 1, 1, 1, 1, 1, 1);
-- Preference Center Consumer Services Design Project
INSERT INTO tcs_catalog:project_result(project_id, user_id, final_score, payment, placed, old_rating, new_rating, rating_order, rating_ind, current_reliability_ind, old_reliability, new_reliability, reliable_submission_ind)
                           VALUES(30006313, 132456, 88, 0.0, 3, 1200, 1123, 2, 1, 1, 1, 1, 1);

-- Hung
-- Hestia B2B Data Conversion Architecture (2nd place)
INSERT INTO tcs_catalog:project_result(project_id, user_id, final_score, payment, placed, old_rating, new_rating, rating_order, rating_ind, current_reliability_ind, old_reliability, new_reliability, reliable_submission_ind)
                           VALUES(30005785, 124764, 90, 500.0, 2, 588, 800, 1, 1, 1, 1, 1, 1);
-- Loan Coach Admin Tool Architecture (1st place)
INSERT INTO tcs_catalog:project_result(project_id, user_id, final_score, payment, placed, old_rating, new_rating, rating_order, rating_ind, current_reliability_ind, old_reliability, new_reliability, reliable_submission_ind)
                           VALUES(30005860, 124764, 97, 1500.0, 1, 800, 1100, 2, 1, 1, 1, 1, 1);

-- Thunderbird Custom Dynamic Content Client Design Project (1st place)
INSERT INTO tcs_catalog:project_result(project_id, user_id, final_score, payment, placed, old_rating, new_rating, rating_order, rating_ind, current_reliability_ind, old_reliability, new_reliability, reliable_submission_ind)
                           VALUES(30006022, 124764, 97, 1000.0, 1, 1000, 1300, 1, 1, 1, 1, 1, 1);
-- Preference Center Consumer Services Design Project (2nd place)
INSERT INTO tcs_catalog:project_result(project_id, user_id, final_score, payment, placed, old_rating, new_rating, rating_order, rating_ind, current_reliability_ind, old_reliability, new_reliability, reliable_submission_ind)
                           VALUES(30006313, 124764, 91, 250.0, 2, 1300, 1290, 2, 1, 1, 1, 1, 1);

-- Partha
-- Diana EHR QA-1 application testing (1st place)
INSERT INTO tcs_catalog:project_result(project_id, user_id, final_score, payment, placed, old_rating, new_rating, rating_order, rating_ind, current_reliability_ind, old_reliability, new_reliability, reliable_submission_ind)
                           VALUES(30005533, 124772, 97, 100.0, 1, 700, 1110, 1, 1, 1, 1, 1, 1);
-- Status Portal Test Scenarios application testing (1st place)
INSERT INTO tcs_catalog:project_result(project_id, user_id, final_score, payment, placed, old_rating, new_rating, rating_order, rating_ind, current_reliability_ind, old_reliability, new_reliability, reliable_submission_ind)
                           VALUES(30005745, 124772, 100, 100.0, 1, 1110, 1333, 2, 1, 1, 1, 1, 1);
-- FEPS Explorer Test Scenarios 2 application testing (1st place)
INSERT INTO tcs_catalog:project_result(project_id, user_id, final_score, payment, placed, old_rating, new_rating, rating_order, rating_ind, current_reliability_ind, old_reliability, new_reliability, reliable_submission_ind)
                           VALUES(30006075, 124772, 100, 150.0, 1, 1333, 1553, 3, 1, 1, 1, 1, 1);

-- Preference Center Consumer Services Design Project (1nd place)
INSERT INTO tcs_catalog:project_result(project_id, user_id, final_score, payment, placed, old_rating, new_rating, rating_order, rating_ind, current_reliability_ind, old_reliability, new_reliability, reliable_submission_ind)
                           VALUES(30006313, 124772, 99, 500.0, 1, 1300, 1400, 1, 1, 1, 1, 1, 1);
-- Javascript Code Editor Design Project (1nd place)
INSERT INTO tcs_catalog:project_result(project_id, user_id, final_score, payment, placed, old_rating, new_rating, rating_order, rating_ind, current_reliability_ind, old_reliability, new_reliability, reliable_submission_ind)
                           VALUES(30006083, 124772, 99, 500.0, 1, 1400, 1500, 2, 1, 1, 1, 1, 1);

------------------------------------------------------------------------------------------------------
-- Run this under tcs_catalog schema
------------------------------------------------------------------------------------------------------
-- Insert records for Conceptualization Projects
INSERT INTO tcs_catalog:project(project_id, project_category_id, project_status_id, create_user, create_date, modify_user, modify_date)
                    VALUES(30005504, 23, 1, "ivern", "2009-1-1 9:00:00.000", "ivern", "2009-1-1 9:00:00.000");
INSERT INTO tcs_catalog:project(project_id, project_category_id, project_status_id, create_user, create_date, modify_user, modify_date)
                    VALUES(30005570, 23, 1, "ivern", "2009-1-1 9:00:00.000", "ivern", "2009-1-1 9:00:00.000");
INSERT INTO tcs_catalog:project(project_id, project_category_id, project_status_id, create_user, create_date, modify_user, modify_date)
                    VALUES(30005639, 23, 1, "ivern", "2009-1-1 9:00:00.000", "ivern", "2009-1-1 9:00:00.000");

-- Insert records for Specification Projects
INSERT INTO tcs_catalog:project(project_id, project_category_id, project_status_id, create_user, create_date, modify_user, modify_date)
                    VALUES(30005567,6, 1, "ivern", "2009-1-1 9:00:00.000", "ivern", "2009-1-1 9:00:00.000");
INSERT INTO tcs_catalog:project(project_id, project_category_id, project_status_id, create_user, create_date, modify_user, modify_date)
                    VALUES(30005626,6, 1, "ivern", "2009-1-1 9:00:00.000", "ivern", "2009-1-1 9:00:00.000");
INSERT INTO tcs_catalog:project(project_id, project_category_id, project_status_id, create_user, create_date, modify_user, modify_date)
                    VALUES(30006081, 6, 1, "ivern", "2009-1-1 9:00:00.000", "ivern", "2009-1-1 9:00:00.000");

-- Insert records for Architecture Projects
INSERT INTO tcs_catalog:project(project_id, project_category_id, project_status_id, create_user, create_date, modify_user, modify_date)
                    VALUES(30005785, 7, 1, "ivern", "2009-1-1 9:00:00.000", "ivern", "2009-1-1 9:00:00.000");
INSERT INTO tcs_catalog:project(project_id, project_category_id, project_status_id, create_user, create_date, modify_user, modify_date)
                    VALUES(30005860, 7, 1, "ivern", "2009-1-1 9:00:00.000", "ivern", "2009-1-1 9:00:00.000");
INSERT INTO tcs_catalog:project(project_id, project_category_id, project_status_id, create_user, create_date, modify_user, modify_date)
                    VALUES(30005913, 7, 1, "ivern", "2009-1-1 9:00:00.000", "ivern", "2009-1-1 9:00:00.000");

-- Insert records for Design Projects
INSERT INTO tcs_catalog:project(project_id, project_category_id, project_status_id, create_user, create_date, modify_user, modify_date)
                    VALUES(30006022, 1, 1,"ivern", "2009-1-1 9:00:00.000", "ivern", "2009-1-1 9:00:00.000");
INSERT INTO tcs_catalog:project(project_id, project_category_id, project_status_id,create_user, create_date, modify_user, modify_date)
                    VALUES(30006083, 1, 1, "ivern", "2009-1-1 9:00:00.000", "ivern", "2009-1-1 9:00:00.000");
INSERT INTO tcs_catalog:project(project_id, project_category_id, project_status_id, create_user, create_date, modify_user, modify_date)
                    VALUES(30006313, 1, 1, "ivern", "2009-1-1 9:00:00.000", "ivern", "2009-1-1 9:00:00.000");

-- Inserting records for Development Projects
INSERT INTO tcs_catalog:project(project_id, project_category_id, project_status_id, create_user, create_date, modify_user, modify_date)
                    VALUES(15251316, 2, 1, "ivern", "2009-1-1 9:00:00.000", "ivern", "2009-1-1 9:00:00.000");
INSERT INTO tcs_catalog:project(project_id, project_category_id, project_status_id, create_user, create_date, modify_user, modify_date)
                    VALUES(15312837, 2, 1, "ivern", "2009-1-1 9:00:00.000", "ivern", "2009-1-1 9:00:00.000");
INSERT INTO tcs_catalog:project(project_id, project_category_id, project_status_id, create_user, create_date, modify_user, modify_date)
                    VALUES(15377883, 2, 1, "ivern", "2009-1-1 9:00:00.000", "ivern", "2009-1-1 9:00:00.000");
INSERT INTO tcs_catalog:project(project_id, project_category_id, project_status_id, create_user, create_date, modify_user, modify_date)
                    VALUES(15959651, 2, 1, "ivern", "2009-1-1 9:00:00.000", "ivern", "2009-1-1 9:00:00.000");
INSERT INTO tcs_catalog:project(project_id, project_category_id, project_status_id, create_user, create_date, modify_user, modify_date)
                    VALUES(16189849, 2, 1, "ivern", "2009-1-1 9:00:00.000", "ivern", "2009-1-1 9:00:00.000");
INSERT INTO tcs_catalog:project(project_id, project_category_id, project_status_id, create_user, create_date, modify_user, modify_date)
                    VALUES(20353510, 2, 1, "ivern", "2009-1-1 9:00:00.000", "ivern", "2009-1-1 9:00:00.000");
INSERT INTO tcs_catalog:project(project_id, project_category_id, project_status_id, create_user, create_date, modify_user, modify_date)
                    VALUES(30001735, 2, 1, "ivern", "2009-1-1 9:00:00.000", "ivern", "2009-1-1 9:00:00.000");

-- Insert records for Assembly Projects
INSERT INTO tcs_catalog:project(project_id, project_category_id, project_status_id, create_user, create_date, modify_user, modify_date)
                    VALUES(30006076, 14, 1, "ivern", "2009-1-1 9:00:00.000", "ivern", "2009-1-1 9:00:00.000");
INSERT INTO tcs_catalog:project(project_id, project_category_id, project_status_id, create_user, create_date, modify_user, modify_date)
                    VALUES(30006171, 14, 1, "ivern", "2009-1-1 9:00:00.000", "ivern", "2009-1-1 9:00:00.000");
INSERT INTO tcs_catalog:project(project_id, project_category_id, project_status_id, create_user, create_date, modify_user, modify_date)
                    VALUES(30006270, 14, 1, "ivern", "2009-1-1 9:00:00.000", "ivern", "2009-1-1 9:00:00.000");

-- Insert records for Application Testing Projects
INSERT INTO tcs_catalog:project(project_id, project_category_id, project_status_id, create_user, create_date, modify_user, modify_date)
                    VALUES(30005533, 13, 1, "ivern", "2009-1-1 9:00:00.000", "ivern", "2009-1-1 9:00:00.000");
INSERT INTO tcs_catalog:project(project_id, project_category_id, project_status_id, create_user, create_date, modify_user, modify_date)
                    VALUES(30005745, 13, 1, "ivern", "2009-1-1 9:00:00.000", "ivern", "2009-1-1 9:00:00.000");
INSERT INTO tcs_catalog:project(project_id, project_category_id, project_status_id, create_user, create_date, modify_user, modify_date)
                    VALUES(30006075, 13, 1, "ivern", "2009-1-1 9:00:00.000", "ivern", "2009-1-1 9:00:00.000");

-- comp_catalog
INSERT INTO tcs_catalog:comp_catalog(component_id,  current_version ,  component_name, create_time , status_id)
                  VALUES(30005504, 1,  "Aether OCS Conceptualization", "2009-1-1 9:00:00.000", 1);
INSERT INTO tcs_catalog:comp_catalog(component_id,  current_version ,  component_name, create_time , status_id)
                  VALUES(30005570, 1,  "Hypnos Carrier Call Detail Conceptualization", "2009-1-1 9:00:00.000", 1);
INSERT INTO tcs_catalog:comp_catalog(component_id,  current_version ,  component_name, create_time , status_id)
                  VALUES(30005639, 1,  "Agent Directory Application", "2009-1-1 9:00:00.000", 1);
INSERT INTO tcs_catalog:comp_catalog(component_id,  current_version ,  component_name, create_time , status_id)
                  VALUES(30006040, 1,  "Vendor Experience Conceptualization", "2009-1-1 9:00:00.000", 1);
INSERT INTO tcs_catalog:comp_catalog(component_id,  current_version ,  component_name, create_time , status_id)
                  VALUES(30006063, 1,  "Agnostic Exchange Services Conceptualization", "2009-1-1 9:00:00.000", 1);
INSERT INTO tcs_catalog:comp_catalog(component_id,  current_version ,  component_name, create_time , status_id)
                  VALUES(30005567, 1,  "Status Portal Specification", "2009-1-1 9:00:00.000", 1);
INSERT INTO tcs_catalog:comp_catalog(component_id,  current_version ,  component_name, create_time , status_id)
                  VALUES(30005626, 1,  "Broker Site Application", "2009-1-1 9:00:00.000", 1);
INSERT INTO tcs_catalog:comp_catalog(component_id,  current_version ,  component_name, create_time , status_id)
                  VALUES(30006081, 1,  "Insurance Agent Directory Specification", "2009-1-1 9:00:00.000", 1);
INSERT INTO tcs_catalog:comp_catalog(component_id,  current_version ,  component_name, create_time , status_id)
                  VALUES(30006122, 1,  "Budget Stacker Consumer Specification", "2009-1-1 9:00:00.000", 1);
INSERT INTO tcs_catalog:comp_catalog(component_id,  current_version ,  component_name, create_time , status_id)
                  VALUES(30006157, 1,  "Lender Automation Admin Pages Specification", "2009-1-1 9:00:00.000", 1);
INSERT INTO tcs_catalog:comp_catalog(component_id,  current_version ,  component_name, create_time , status_id)
                  VALUES(30005785, 1,  "Hestia B2B Data Conversion", "2009-1-1 9:00:00.000", 1);
INSERT INTO tcs_catalog:comp_catalog(component_id,  current_version ,  component_name, create_time , status_id)
                  VALUES(30005860, 1,  "Loan Coach Admin Tool Architecture", "2009-1-1 9:00:00.000", 1);
INSERT INTO tcs_catalog:comp_catalog(component_id,  current_version ,  component_name, create_time , status_id)
                  VALUES(30005913, 1,  "FEPS Explorer Back End Module Architecture", "2009-1-1 9:00:00.000", 1);
INSERT INTO tcs_catalog:comp_catalog(component_id,  current_version ,  component_name, create_time , status_id)
                  VALUES(30006147, 1,  "Neptune Austin Times System Architecture", "2009-1-1 9:00:00.000", 1);
INSERT INTO tcs_catalog:comp_catalog(component_id,  current_version ,  component_name, create_time , status_id)
                  VALUES(30006155, 1,  "Auto Application System Architecture", "2009-1-1 9:00:00.000", 1);
INSERT INTO tcs_catalog:comp_catalog(component_id,  current_version ,  component_name, create_time , status_id)
                  VALUES(30006022, 1,  "Thunderbird Custom Dynamic Content Client", "2009-1-1 9:00:00.000", 1);
INSERT INTO tcs_catalog:comp_catalog(component_id,  current_version ,  component_name, create_time , status_id)
                  VALUES(30006083, 1,  "Javascript Code Editor", "2009-1-1 9:00:00.000", 1);
INSERT INTO tcs_catalog:comp_catalog(component_id,  current_version ,  component_name, create_time , status_id)
                  VALUES(30006313, 1,  "Preference Center Consumer Services", "2009-1-1 9:00:00.000", 1);
INSERT INTO tcs_catalog:comp_catalog(component_id,  current_version ,  component_name, create_time , status_id)
                  VALUES(30006425, 1,  "Morello CMS Wrapper", "2009-1-1 9:00:00.000", 1);
INSERT INTO tcs_catalog:comp_catalog(component_id,  current_version ,  component_name, create_time , status_id)
                  VALUES(30006383, 1,  "Provisioning Tool", "2009-1-1 9:00:00.000", 1);
INSERT INTO tcs_catalog:comp_catalog(component_id,  current_version ,  component_name, create_time , status_id)
                  VALUES(15251316, 1,  "Question Manager", "2009-1-1 9:00:00.000", 1);
INSERT INTO tcs_catalog:comp_catalog(component_id,  current_version ,  component_name, create_time , status_id)
                  VALUES(15312837, 1,  "Answer Manager", "2009-1-1 9:00:00.000", 1);
INSERT INTO tcs_catalog:comp_catalog(component_id,  current_version ,  component_name, create_time , status_id)
                  VALUES(15377883, 1,  "Base Question", "2009-1-1 9:00:00.000", 1);
INSERT INTO tcs_catalog:comp_catalog(component_id,  current_version ,  component_name, create_time , status_id)
                  VALUES(15959651, 1,  "SVG 2 PDF", "2009-1-1 9:00:00.000", 1);
INSERT INTO tcs_catalog:comp_catalog(component_id,  current_version ,  component_name, create_time , status_id)
                  VALUES(16189849, 1,  "Syntax Highlighter", "2009-1-1 9:00:00.000", 1);
INSERT INTO tcs_catalog:comp_catalog(component_id,  current_version ,  component_name, create_time , status_id)
                  VALUES(20353510, 1,  "Combined Result Set", "2009-1-1 9:00:00.000", 1);
INSERT INTO tcs_catalog:comp_catalog(component_id,  current_version ,  component_name, create_time , status_id)
                  VALUES(30001735, 1,  "Conversation Manager Error Handler", "2009-1-1 9:00:00.000", 1);
INSERT INTO tcs_catalog:comp_catalog(component_id,  current_version ,  component_name, create_time , status_id)
                  VALUES(30001750, 1,  "Persist Message Command", "2009-1-1 9:00:00.000", 1);
INSERT INTO tcs_catalog:comp_catalog(component_id,  current_version ,  component_name, create_time , status_id)
                  VALUES(30001803, 1,  "Send Message Command", "2009-1-1 9:00:00.000", 1);
INSERT INTO tcs_catalog:comp_catalog(component_id,  current_version ,  component_name, create_time , status_id)
                  VALUES(30006076, 1,  "Hestia B2B Find Company Page", "2009-1-1 9:00:00.000", 1);
INSERT INTO tcs_catalog:comp_catalog(component_id,  current_version ,  component_name, create_time , status_id)
                  VALUES(30006171, 1,  "Hestia B2B Trilogie Adapter", "2009-1-1 9:00:00.000", 1);
INSERT INTO tcs_catalog:comp_catalog(component_id,  current_version ,  component_name, create_time , status_id)
                  VALUES(30006270, 1,  "Xanthus Integration Release Assembly 2", "2009-1-1 9:00:00.000", 1);
INSERT INTO tcs_catalog:comp_catalog(component_id,  current_version ,  component_name, create_time , status_id)
                  VALUES(30006301, 1,  "Cockpit Share Submissions Integration", "2009-1-1 9:00:00.000", 1);
INSERT INTO tcs_catalog:comp_catalog(component_id,  current_version ,  component_name, create_time , status_id)
                  VALUES(30006426, 1,  "EHR Visit Note Round 4", "2009-1-1 9:00:00.000", 1);
INSERT INTO tcs_catalog:comp_catalog(component_id,  current_version ,  component_name, create_time , status_id)
                  VALUES(30005533, 1,  "Diana EHR QA-1", "2009-1-1 9:00:00.000", 1);
INSERT INTO tcs_catalog:comp_catalog(component_id,  current_version ,  component_name, create_time , status_id)
                  VALUES(30005745, 1,  "Status Portal Test Scenarios", "2009-1-1 9:00:00.000", 1);
INSERT INTO tcs_catalog:comp_catalog(component_id,  current_version ,  component_name, create_time , status_id)
                  VALUES(30006075, 1,  "FEPS Explorer Test Scenarios 2", "2009-1-1 9:00:00.000", 1);
INSERT INTO tcs_catalog:comp_catalog(component_id,  current_version ,  component_name, create_time , status_id)
                  VALUES(30006193, 1,  "Diana Mira 2.0 QA Plan Contest", "2009-1-1 9:00:00.000", 1);
INSERT INTO tcs_catalog:comp_catalog(component_id,  current_version ,  component_name, create_time , status_id)
                  VALUES(30006428, 1,  "SDC - AWD Test Scenario", "2009-1-1 9:00:00.000", 1);

INSERT INTO tcs_catalog:comp_versions(component_id, comp_vers_id, version, version_text, create_time, phase_id, phase_time,  price)
                   VALUES(30005504, 1, 1, "1.0", "2009-1-1 9:00:00.000", 134, "2009-1-1 9:00:00.000", 200);
INSERT INTO tcs_catalog:comp_versions(component_id, comp_vers_id, version, version_text, create_time, phase_id, phase_time,  price)
                   VALUES(30005570, 2, 1, "1.0", "2009-1-1 9:00:00.000", 134, "2009-1-1 9:00:00.000", 200);
INSERT INTO tcs_catalog:comp_versions(component_id, comp_vers_id, version, version_text, create_time, phase_id, phase_time,  price)
                   VALUES(30005639, 3, 1, "1.0", "2009-1-1 9:00:00.000", 134, "2009-1-1 9:00:00.000", 200);
INSERT INTO tcs_catalog:comp_versions(component_id, comp_vers_id, version, version_text, create_time, phase_id, phase_time,  price)
                   VALUES(30006040, 4, 1, "1.0", "2009-1-1 9:00:00.000", 134, "2009-1-1 9:00:00.000", 200);
INSERT INTO tcs_catalog:comp_versions(component_id, comp_vers_id, version, version_text, create_time, phase_id, phase_time,  price)
                   VALUES(30006063, 5, 1, "1.0", "2009-1-1 9:00:00.000", 134, "2009-1-1 9:00:00.000", 200);
INSERT INTO tcs_catalog:comp_versions(component_id, comp_vers_id, version, version_text, create_time, phase_id, phase_time,  price)
                   VALUES(30005567, 6, 1, "1.0", "2009-1-1 9:00:00.000", 117, "2009-1-1 9:00:00.000", 200);
INSERT INTO tcs_catalog:comp_versions(component_id, comp_vers_id, version, version_text, create_time, phase_id, phase_time,  price)
                   VALUES(30005626, 7, 1, "1.0", "2009-1-1 9:00:00.000", 117, "2009-1-1 9:00:00.000", 200);
INSERT INTO tcs_catalog:comp_versions(component_id, comp_vers_id, version, version_text, create_time, phase_id, phase_time,  price)
                   VALUES(30006081, 8, 1, "1.0", "2009-1-1 9:00:00.000", 117, "2009-1-1 9:00:00.000", 200);
INSERT INTO tcs_catalog:comp_versions(component_id, comp_vers_id, version, version_text, create_time, phase_id, phase_time,  price)
                   VALUES(30006122, 9, 1, "1.0", "2009-1-1 9:00:00.000", 117, "2009-1-1 9:00:00.000", 200);
INSERT INTO tcs_catalog:comp_versions(component_id, comp_vers_id, version, version_text, create_time, phase_id, phase_time,  price)
                   VALUES(30006157, 10, 1, "1.0", "2009-1-1 9:00:00.000", 117, "2009-1-1 9:00:00.000", 200);
INSERT INTO tcs_catalog:comp_versions(component_id, comp_vers_id, version, version_text, create_time, phase_id, phase_time,  price)
                   VALUES(30005785, 11, 1, "1.0", "2009-1-1 9:00:00.000", 118, "2009-1-1 9:00:00.000", 200);
INSERT INTO tcs_catalog:comp_versions(component_id, comp_vers_id, version, version_text, create_time, phase_id, phase_time,  price)
                   VALUES(30005860, 12, 1, "1.0", "2009-1-1 9:00:00.000", 118, "2009-1-1 9:00:00.000", 200);
INSERT INTO tcs_catalog:comp_versions(component_id, comp_vers_id, version, version_text, create_time, phase_id, phase_time,  price)
                   VALUES(30005913, 13, 1, "1.0", "2009-1-1 9:00:00.000", 118, "2009-1-1 9:00:00.000", 200);
INSERT INTO tcs_catalog:comp_versions(component_id, comp_vers_id, version, version_text, create_time, phase_id, phase_time,  price)
                   VALUES(30006147, 14, 1, "1.0", "2009-1-1 9:00:00.000", 118, "2009-1-1 9:00:00.000", 200);
INSERT INTO tcs_catalog:comp_versions(component_id, comp_vers_id, version, version_text, create_time, phase_id, phase_time,  price)
                   VALUES(30006155, 15, 1, "1.0", "2009-1-1 9:00:00.000", 118, "2009-1-1 9:00:00.000", 200);
INSERT INTO tcs_catalog:comp_versions(component_id, comp_vers_id, version, version_text, create_time, phase_id, phase_time,  price)
                   VALUES(30006022, 16, 1, "1.0", "2009-1-1 9:00:00.000", 112, "2009-1-1 9:00:00.000", 200);
INSERT INTO tcs_catalog:comp_versions(component_id, comp_vers_id, version, version_text, create_time, phase_id, phase_time,  price)
                   VALUES(30006083, 17, 1, "1.0", "2009-1-1 9:00:00.000", 112, "2009-1-1 9:00:00.000", 200);
INSERT INTO tcs_catalog:comp_versions(component_id, comp_vers_id, version, version_text, create_time, phase_id, phase_time,  price)
                   VALUES(30006313, 18, 1, "1.0", "2009-1-1 9:00:00.000", 112, "2009-1-1 9:00:00.000", 200);
INSERT INTO tcs_catalog:comp_versions(component_id, comp_vers_id, version, version_text, create_time, phase_id, phase_time,  price)
                   VALUES(30006425, 19, 1, "1.0", "2009-1-1 9:00:00.000", 112, "2009-1-1 9:00:00.000", 200);
INSERT INTO tcs_catalog:comp_versions(component_id, comp_vers_id, version, version_text, create_time, phase_id, phase_time,  price)
                   VALUES(30006383, 20, 1, "1.0", "2009-1-1 9:00:00.000", 112, "2009-1-1 9:00:00.000", 200);
INSERT INTO tcs_catalog:comp_versions(component_id, comp_vers_id, version, version_text, create_time, phase_id, phase_time,  price)
                   VALUES(15251316, 21, 1, "1.0", "2009-1-1 9:00:00.000", 113, "2009-1-1 9:00:00.000", 200);
INSERT INTO tcs_catalog:comp_versions(component_id, comp_vers_id, version, version_text, create_time, phase_id, phase_time,  price)
                   VALUES(15312837, 22, 1, "1.0", "2009-1-1 9:00:00.000", 113, "2009-1-1 9:00:00.000", 200);
INSERT INTO tcs_catalog:comp_versions(component_id, comp_vers_id, version, version_text, create_time, phase_id, phase_time,  price)
                   VALUES(15377883, 23, 1, "1.0", "2009-1-1 9:00:00.000", 113, "2009-1-1 9:00:00.000", 200);
INSERT INTO tcs_catalog:comp_versions(component_id, comp_vers_id, version, version_text, create_time, phase_id, phase_time,  price)
                   VALUES(15959651, 24, 1, "1.0", "2009-1-1 9:00:00.000", 113, "2009-1-1 9:00:00.000", 200);
INSERT INTO tcs_catalog:comp_versions(component_id, comp_vers_id, version, version_text, create_time, phase_id, phase_time,  price)
                   VALUES(16189849, 25, 1, "1.0", "2009-1-1 9:00:00.000", 113, "2009-1-1 9:00:00.000", 200);
INSERT INTO tcs_catalog:comp_versions(component_id, comp_vers_id, version, version_text, create_time, phase_id, phase_time,  price)
                   VALUES(20353510, 26, 1, "1.0", "2009-1-1 9:00:00.000", 113, "2009-1-1 9:00:00.000", 200);
INSERT INTO tcs_catalog:comp_versions(component_id, comp_vers_id, version, version_text, create_time, phase_id, phase_time,  price)
                   VALUES(30001735, 27, 1, "1.0", "2009-1-1 9:00:00.000", 113, "2009-1-1 9:00:00.000", 200);
INSERT INTO tcs_catalog:comp_versions(component_id, comp_vers_id, version, version_text, create_time, phase_id, phase_time,  price)
                   VALUES(30001750, 28, 1, "1.0", "2009-1-1 9:00:00.000", 113, "2009-1-1 9:00:00.000", 200);
INSERT INTO tcs_catalog:comp_versions(component_id, comp_vers_id, version, version_text, create_time, phase_id, phase_time,  price)
                   VALUES(30001803, 29, 1, "1.0", "2009-1-1 9:00:00.000", 113, "2009-1-1 9:00:00.000", 200);
INSERT INTO tcs_catalog:comp_versions(component_id, comp_vers_id, version, version_text, create_time, phase_id, phase_time,  price)
                   VALUES(30006076, 30, 1, "1.0", "2009-1-1 9:00:00.000", 125, "2009-1-1 9:00:00.000", 200);
INSERT INTO tcs_catalog:comp_versions(component_id, comp_vers_id, version, version_text, create_time, phase_id, phase_time,  price)
                   VALUES(30006171, 31, 1, "1.0", "2009-1-1 9:00:00.000", 125, "2009-1-1 9:00:00.000", 200);
INSERT INTO tcs_catalog:comp_versions(component_id, comp_vers_id, version, version_text, create_time, phase_id, phase_time,  price)
                   VALUES(30006270, 32, 1, "1.0", "2009-1-1 9:00:00.000", 125, "2009-1-1 9:00:00.000", 200);
INSERT INTO tcs_catalog:comp_versions(component_id, comp_vers_id, version, version_text, create_time, phase_id, phase_time,  price)
                   VALUES(30006301, 33, 1, "1.0", "2009-1-1 9:00:00.000", 125, "2009-1-1 9:00:00.000", 200);
INSERT INTO tcs_catalog:comp_versions(component_id, comp_vers_id, version, version_text, create_time, phase_id, phase_time,  price)
                   VALUES(30006426, 34, 1, "1.0", "2009-1-1 9:00:00.000", 125, "2009-1-1 9:00:00.000", 200);
INSERT INTO tcs_catalog:comp_versions(component_id, comp_vers_id, version, version_text, create_time, phase_id, phase_time,  price)
                   VALUES(30005533, 35, 1, "1.0", "2009-1-1 9:00:00.000", 124, "2009-1-1 9:00:00.000", 200);
INSERT INTO tcs_catalog:comp_versions(component_id, comp_vers_id, version, version_text, create_time, phase_id, phase_time,  price)
                   VALUES(30005745, 36, 1, "1.0", "2009-1-1 9:00:00.000", 124, "2009-1-1 9:00:00.000", 200);
INSERT INTO tcs_catalog:comp_versions(component_id, comp_vers_id, version, version_text, create_time, phase_id, phase_time,  price)
                   VALUES(30006075, 37, 1, "1.0", "2009-1-1 9:00:00.000", 124, "2009-1-1 9:00:00.000", 200);
INSERT INTO tcs_catalog:comp_versions(component_id, comp_vers_id, version, version_text, create_time, phase_id, phase_time,  price)
                   VALUES(30006193, 38, 1, "1.0", "2009-1-1 9:00:00.000", 124, "2009-1-1 9:00:00.000", 200);
INSERT INTO tcs_catalog:comp_versions(component_id, comp_vers_id, version, version_text, create_time, phase_id, phase_time,  price)
                   VALUES(30006428, 39, 1, "1.0", "2009-1-1 9:00:00.000", 124, "2009-1-1 9:00:00.000", 200);

--
-- Run this under tcs_catalog
--
-- super development rating
INSERT INTO tcs_catalog:user_rating( user_id, phase_id, rating, num_ratings, vol)
                        VALUES( 132457, 113, 1089, 3, 222 );
-- super assembly rating
INSERT INTO tcs_catalog:user_rating( user_id, phase_id, rating, num_ratings, vol)
                        VALUES( 132457, 125, 1423, 2 , 399);
-- heffan conceptualization rating
INSERT INTO tcs_catalog:user_rating( user_id, phase_id, rating, num_ratings, vol)
                        VALUES( 132456, 134, 1720, 3 , 392);
-- heffan specification rating
INSERT INTO tcs_catalog:user_rating( user_id, phase_id, rating , num_ratings, vol)
                        VALUES( 132456, 117, 1300, 2, 291 );
-- heffan design rating
INSERT INTO tcs_catalog:user_rating( user_id, phase_id, rating, num_ratings, vol)
                        VALUES( 132456, 112, 1123, 2 , 211);
-- Hung architecture rating
INSERT INTO tcs_catalog:user_rating( user_id, phase_id, rating, num_ratings, vol)
                        VALUES( 124764, 118, 1100, 2, 111 );
-- Hung design rating
INSERT INTO tcs_catalog:user_rating( user_id, phase_id, rating, num_ratings, vol)
                        VALUES( 124764, 112, 1290, 2, 221 );
-- Partha application testin rating
INSERT INTO tcs_catalog:user_rating( user_id, phase_id, rating, num_ratings, vol)
                        VALUES( 124772, 124, 1553, 3, 399 );
-- Partha design rating
INSERT INTO tcs_catalog:user_rating( user_id, phase_id, rating, num_ratings, vol)
                        VALUES( 124772, 112, 1500, 2, 221 );
