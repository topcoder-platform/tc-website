java com.topcoder.utilities.QueryLoader 1 "Round_Statistics_Data" 0 0 "
SELECT c.handle,
c.coder_id,
con.name,
r.name,
rr.room_id,
room.name,
rr.room_placed,
rr.submission_points,
(rr.challenge_points + rr.defense_points) AS challenge_points,
rr.system_test_points,
rr.final_points,
CASE WHEN r.round_type_id = 1 THEN 'N/A' ELSE rr.advanced END,
rr.old_rating,
(rr.new_rating - rr.old_rating) AS rating_change,
rr.new_rating,
room.division_desc,
r.round_id AS round_id
FROM contest con, round r, coder c, room_result rr, room
WHERE rr.round_id = @rd@
AND rr.division_id = @dn@
AND r.round_id = @rd@
AND rr.room_id >= @br@ + @sm@ - 1
AND rr.room_id < @br@ + @em@
AND c.coder_id = rr.coder_id
AND con.contest_id = r.contest_id
AND room.room_id = rr.room_id
AND r.round_type_id IN (1,2)
ORDER BY rr.room_id, rr.final_points DESC, rr.new_rating DESC, c.handle
"
java com.topcoder.utilities.QueryLoader 2 "Rounds_By_Date" 0 0 "
SELECT r.round_id,
r.name,
c.contest_id,
c.name,
cal.date,
(SELECT MIN(room_id) FROM room
 WHERE round_id = r.round_id) AS first_room_id
FROM contest c, round r, calendar cal
WHERE cal.calendar_id = r.calendar_id
AND c.contest_id = r.contest_id
AND r.round_type_id IN (1,2)
ORDER BY cal.date DESC
"
java com.topcoder.utilities.QueryLoader 3 "Rooms_For_Round" 0 0 "
SELECT room_id,
name,
division_desc
FROM room
WHERE room.round_id = @rd@
ORDER BY room_id ASC
"
java com.topcoder.utilities.QueryLoader 4 "Room_Summary_Data" 0 0 "
SELECT c.handle,
c.coder_id,
con.name,
r.name,
round.name,
rr.room_placed,
rr.problems_submitted,
rr.submission_points,
rr.challenge_attempts_received,
rr.defense_points,
rr.challenge_attempts_made,
rr.challenge_points,
rr.system_test_points,
rr.final_points,
CASE WHEN round.round_type_id = 1 THEN 'N/A' ELSE rr.advanced END,
rr.old_rating,
(rr.new_rating - rr.old_rating) AS rating_change,
rr.new_rating,
rr.round_id,
rr.room_id
FROM contest con, round, room r, coder c, room_result rr
WHERE rr.round_id = @rd@
AND rr.room_id = @rm@
AND r.room_id = @rm@
AND c.coder_id = rr.coder_id
AND round.round_id = @rd@
AND con.contest_id = round.contest_id
AND round.round_type_id IN (1,2)
ORDER BY rr.final_points DESC, rr.new_rating DESC, c.handle
"
java com.topcoder.utilities.QueryLoader 5 "Coder_Ratings" 1 3 "
SELECT c.coder_id,
c.handle,
r.rating
FROM coder c, rating r
WHERE c.coder_id = r.coder_id
AND c.status = 'A'
AND r.rating > 0
ORDER BY r.rating DESC
"
java com.topcoder.utilities.QueryLoader 6 "Coder_Problems" 0 0 "
SELECT p.class_name,
p.method_name,
p.problem_id,
p.level_desc,
p.level_id,
cp.time_elapsed,
cp.end_status_text,
cp.submission_points
FROM problem p, coder_problem cp
WHERE cp.coder_id = @cr@
AND cp.round_id = @rd@
AND p.problem_id = cp.problem_id
AND p.round_id = cp.round_id
AND p.division_id = cp.division_id
ORDER BY p.level_id ASC
"
java com.topcoder.utilities.QueryLoader 7 "Coder_Challenges" 0 0 "
SELECT 
(SELECT coder.handle FROM coder
 WHERE coder.coder_id = c.challenger_id) AS challenger_name,
(SELECT room_result.new_rating FROM room_result
 WHERE room_result.round_id = @rd@
 AND room_result.coder_id = c.challenger_id) AS challenger_rating,
c.challenger_id,
(SELECT coder.handle FROM coder
 WHERE coder.coder_id = c.defendant_id) AS defendant_name,
(SELECT room_result.new_rating FROM room_result
 WHERE room_result.round_id = @rd@
 AND room_result.coder_id = c.defendant_id) AS defendant_rating,
c.defendant_id,
p.class_name,
p.problem_id,
(CASE c.succeeded
 WHEN 1 THEN 'Y'
 ELSE 'N'
 END) AS succeeded,
c.challenger_points,
c.submit_time
FROM problem p, challenge c
WHERE c.challenger_id = @cr@
AND c.round_id = @rd@
AND p.problem_id = c.problem_id
AND p.round_id = c.round_id
AND p.division_id =
   (SELECT division_id FROM room_result
    WHERE coder_id = @cr@ AND round_id = @rd@)
ORDER BY c.submit_time ASC
"
java com.topcoder.utilities.QueryLoader 8 "Coder_Defenses" 0 0 "
SELECT 
(SELECT coder.handle FROM coder
 WHERE coder.coder_id = c.challenger_id) AS challenger_name,
(SELECT room_result.new_rating FROM room_result
 WHERE room_result.round_id = @rd@
 AND room_result.coder_id = c.challenger_id) AS challenger_rating,
 c.challenger_id,
(SELECT coder.handle FROM coder
 WHERE coder.coder_id = c.defendant_id) AS defendant_name,
(SELECT room_result.new_rating FROM room_result
 WHERE room_result.round_id = @rd@
 AND room_result.coder_id = c.defendant_id) AS defendant_rating,
c.defendant_id,
p.class_name,
p.problem_id,
(CASE c.succeeded
 WHEN 1 THEN 'N'
 ELSE 'Y'
 END) AS succeeded,
c.defendant_points,
c.submit_time
FROM problem p, challenge c
WHERE c.defendant_id = @cr@
AND c.round_id = @rd@
AND p.problem_id = c.problem_id
AND p.round_id = c.round_id
AND p.division_id =
   (SELECT division_id FROM room_result
    WHERE coder_id = @cr@ AND round_id = @rd@)
ORDER BY c.submit_time ASC
"
java com.topcoder.utilities.QueryLoader 9 "Problem_Data" 0 0 "
SELECT p.class_name,
p.method_name,
p.level_desc,
cp.end_status_text,
cp.submission_points
FROM problem p, coder_problem cp
WHERE cp.coder_id = @cr@
AND cp.problem_id = @pm@
AND cp.round_id = @rd@
AND p.problem_id = cp.problem_id
AND p.round_id = cp.round_id
AND p.division_id = cp.division_id
"
java com.topcoder.utilities.QueryLoader 10 "Problem_Defenses" 0 0 "
SELECT 
(SELECT coder.handle FROM coder
 WHERE coder.coder_id = challenger_id) AS challenger_name,
(SELECT room_result.new_rating FROM room_result
 WHERE room_result.coder_id = challenger_id
 AND room_result.round_id = @rd@) AS challenger_rating,
challenger_id,
expected,
received,
submit_time,
(CASE succeeded
 WHEN 1 THEN 'N'
 ELSE 'Y'
 END) AS succeeded,
args
FROM challenge
WHERE defendant_id = @cr@
AND round_id = @rd@
AND problem_id = @pm@
ORDER BY submit_time ASC
"
java com.topcoder.utilities.QueryLoader 11 "System_Tests" 0 0 "
SELECT stc.args,
stc.expected_result,
str.received,
str.test_case_id
FROM system_test_case stc, system_test_result str
WHERE str.round_id = @rd@
AND str.coder_id = @cr@
AND str.problem_id = @pm@
AND stc.test_case_id = str.test_case_id
ORDER BY str.test_case_id ASC
"
java com.topcoder.utilities.QueryLoader 12 "Problem_Statement" 0 0 "
SELECT problem_text,
method_name,
class_name
FROM problem
WHERE problem_id = @pm@
AND round_id = @rd@
AND viewable = 1
AND division_id =
 (SELECT MIN(division_id) FROM problem
  WHERE problem_id = @pm@ AND round_id = @rd@)
"
java com.topcoder.utilities.QueryLoader 13 "Problem_Submission" 0 0 "
SELECT ps.submission_text
FROM problem_submission ps, problem p
WHERE ps.round_id = @rd@
AND ps.problem_id = p.problem_id
AND ps.round_id = p.round_id
AND p.division_id =
 (SELECT MIN(division_id) FROM problem
  WHERE problem_id = @pm@ AND round_id = @rd@)
AND p.viewable = 1
AND ps.coder_id = @cr@
AND ps.problem_id = @pm@
AND ps.submission_number= (SELECT MAX(submission_number)
                             FROM problem_submission ps1
                            WHERE ps.coder_id = ps1.coder_id
                              AND ps.problem_id = ps1.problem_id
                              AND ps.round_id = ps1.round_id)
"
java com.topcoder.utilities.QueryLoader 14 "Coder_Data" 0 0 "
SELECT c.handle,
c.coder_id,
c.quote,
c.image,
r.rating,
r.vol,
c.member_since,
(SELECT SUM(paid) FROM room_result
 WHERE coder_id = @cr@) AS total_earnings,
r.num_competitions,
TRUNC((CASE r.num_competitions
  WHEN 0 THEN 0.0
  ELSE cps.final_points / r.num_competitions
  END),2) AS avg_final_points,
r.highest_rating,
(SELECT AVG(room_seed) FROM room_result
 WHERE coder_id = @cr@) AS average_room_seed,
(SELECT AVG(room_placed) FROM room_result
 WHERE coder_id = @cr@) AS average_room_placed,
cps.problems_submitted,
cps.problems_failed_by_challenge,
cps.problems_failed_by_system_test,
cps.problems_correct,
(CASE cps.problems_submitted
  WHEN 0 THEN 0.0
  ELSE cps.problems_correct / cps.problems_submitted
  END) AS submission_success_percentage,
cps.challenge_attempts_made,
cps.challenges_made_failed,
cps.challenges_made_successful,
(CASE cps.challenge_attempts_made
  WHEN 0 THEN 0.0
  ELSE cps.challenges_made_successful / cps.challenge_attempts_made
  END) AS challenge_success_percentage,
p.path || i.file_name as image_path,
(SELECT count(*)
  FROM coder_image_xref cix
       ,image i
 WHERE cix.image_id = i.image_id
   AND cix.coder_id = @cr@
   AND cix.display_flag = 1
   AND i.image_type_id = 1) as has_image,
TO_CHAR(c.member_since, '%iY-%m-%d') as member_since_date,
(SELECT SUM(CASE WHEN payment_type_id = 5 THEN 1 ELSE 0 END)
 FROM room_result
 WHERE coder_id = @cr@) AS charity_payments
FROM coder_problem_summary cps JOIN coder c ON cps.coder_id = c.coder_id
                                AND cps.coder_id = @cr@
                               JOIN rating r ON c.coder_id = r.coder_id
     LEFT OUTER JOIN coder_image_xref cix ON c.coder_id = cix.coder_id
                 AND cix.display_flag = 1
     LEFT OUTER JOIN image i ON i.image_id = cix.image_id
      AND i.image_type_id = 1
     LEFT OUTER JOIN path p ON p.path_id = i.path_id
"
java com.topcoder.utilities.QueryLoader 15 "Coder_Submission_Summary" 0 0 "
SELECT l.level_desc,
l.level_id,
SUM(cl.problems_submitted) AS problems_submitted,
SUM(cl.problems_failed_by_challenge) AS problems_failed_by_challenge,
SUM(cl.problems_failed_by_system_test) AS problems_failed_by_system_test,
SUM(cl.problems_correct) AS problems_correct,
(CASE SUM(cl.problems_submitted)
  WHEN 0 THEN 0.0
  ELSE SUM(cl.problems_correct) / SUM(cl.problems_submitted)
  END) AS success_percentage
FROM level_lu l, coder_level cl
WHERE cl.coder_id = @cr@
AND l.level_id = cl.level_id
GROUP by l.level_desc, l.level_id
ORDER by l.level_id
"
java com.topcoder.utilities.QueryLoader 16 "Winning_Debuts" 0 0 "
SELECT c.handle, 
c.coder_id,
con.name,
r.name, 
r.round_id,
cal.date,
rr.final_points, 
rr.new_rating
FROM contest con, round r, calendar cal, coder c, room_result rr, rating rat
WHERE rat.coder_id = c.coder_id
AND c.status = 'A'
AND r.round_id = rat.first_rated_round_id
AND r.round_type_id = 1
AND rr.coder_id = c.coder_id
AND rr.round_id = r.round_id
AND rr.room_placed = 1
AND con.contest_id = r.contest_id
AND cal.calendar_id = r.calendar_id
ORDER BY cal.date DESC, rr.final_points DESC, rr.new_rating DESC, c.handle
"
java com.topcoder.utilities.QueryLoader 17 "All_Time_Wins" 1 6 "
SELECT c.handle,
c.coder_id,
r.rating,
SUM(CASE 
    WHEN (rr.room_placed = 1 and rr.division_id = 1) THEN 1 
    ELSE 0 
    END) AS division_one_wins,
SUM(CASE 
    WHEN (rr.room_placed = 1 and rr.division_id = 2) THEN 1 
    ELSE 0 
    END) AS division_two_wins,
SUM(CASE 
    WHEN rr.room_placed = 1 THEN 1 
    ELSE 0 
    END) AS total_wins
FROM rating r, coder c, room_result rr, round
WHERE r.coder_id = c.coder_id 
AND c.status = 'A'
AND c.coder_id = rr.coder_id 
AND rr.room_placed = 1
AND rr.round_id = round.round_id
AND round.round_type_id = 1
GROUP BY c.handle, c.coder_id, r.rating 
ORDER BY total_wins DESC, r.rating DESC, c.handle
"
java com.topcoder.utilities.QueryLoader 18 "Highest_Totals" 1 3 "
SELECT c.handle,
c.coder_id,
rr.final_points,
rr.new_rating,
r.name,
r.round_id,
cal.date,
con.name
FROM contest con, round r, calendar cal, coder c, room_result rr
WHERE c.coder_id = rr.coder_id
AND c.status = 'A'
AND r.round_id = rr.round_id
AND r.round_type_id = 1
AND con.contest_id = r.contest_id
AND cal.calendar_id = r.calendar_id
AND rr.division_id = @dn@
AND rr.final_points >= 500.0
ORDER BY rr.final_points DESC, rr.new_rating DESC, c.handle
"
java com.topcoder.utilities.QueryLoader 19 "Highest_Rating_Gains" 1 3 "
SELECT c.handle, 
c.coder_id,
(rr.new_rating - rr.old_rating) AS rating_gain,
rr.new_rating,
r.name,
r.round_id,
con.name
FROM contest con, round r, coder c, room_result rr
WHERE c.coder_id = rr.coder_id
AND c.status = 'A'
AND rr.division_id = @dn@
AND rr.old_rating > 0
AND rr.new_rating >= rr.old_rating + 50.0
AND rr.round_id = r.round_id
AND r.round_type_id = 1
AND con.contest_id = r.contest_id
ORDER BY rating_gain DESC, rr.new_rating DESC, c.handle
"
java com.topcoder.utilities.QueryLoader 20 "Highest_Submission_Accuracy" 1 7 "
SELECT c.handle,
c.coder_id,
count(*),
r.rating, 
SUM(rr.problems_submitted) AS problems_submitted,
SUM(rr.problems_correct) AS problems_correct,
(CASE SUM(rr.problems_submitted)
      WHEN 0 THEN 0.0
 ELSE SUM(rr.problems_correct)/SUM(rr.problems_submitted)
 END) AS success_percent
FROM coder c, room_result rr, rating r, round
WHERE c.coder_id = rr.coder_id
AND c.status = 'A'
AND r.coder_id = c.coder_id
AND rr.round_id = round.round_id
AND round.round_type_id = 1
GROUP BY c.handle, c.coder_id, r.rating
HAVING SUM(rr.problems_submitted) >= 50
ORDER BY success_percent DESC, r.rating DESC, c.handle
"
java com.topcoder.utilities.QueryLoader 21 "Impressive_Debuts" 1 3 "
SELECT c.handle, 
c.coder_id,
rr.final_points, 
rr.new_rating,
r.name, 
r.round_id,
cal.date,
con.name
FROM contest con, round r, calendar cal, coder c, room_result rr, rating rat
WHERE rat.coder_id = c.coder_id
AND c.status = 'A'
AND r.round_id = rat.first_rated_round_id
AND r.round_type_id = 1
AND rr.coder_id = c.coder_id
AND rr.round_id = r.round_id
AND con.contest_id = r.contest_id
AND cal.calendar_id = r.calendar_id
ORDER BY rr.new_rating DESC, c.handle
"
java com.topcoder.utilities.QueryLoader 22 "Most_Consecutive_Wins" 1 3 "
SELECT c.handle,
c.coder_id,
ws.length,
r.rating,
(SELECT calendar.date FROM calendar, round
 WHERE calendar.calendar_id = round.calendar_id
 AND round.round_id = ws.start_round_id) AS start_date,
(SELECT contest.name FROM contest, round
 WHERE round.round_id = ws.start_round_id
 AND contest.contest_id = round.contest_id) AS start_contest_name,
(SELECT round.name FROM round
 WHERE round.round_id = ws.start_round_id) AS start_round_name,
(SELECT calendar.date FROM calendar, round
 WHERE calendar.calendar_id = round.calendar_id
 AND round.round_id = ws.end_round_id) AS end_date,
(SELECT contest.name FROM contest, round
 WHERE round.round_id = ws.end_round_id
 AND contest.contest_id = round.contest_id) AS end_contest_name,
(SELECT round.name FROM round
 WHERE round.round_id = ws.end_round_id) AS end_round_name
FROM streak ws, rating r, coder c
WHERE ws.coder_id = c.coder_id
AND c.status = 'A'
AND ws.streak_type_id = @dn@
AND r.coder_id = c.coder_id
ORDER BY ws.length DESC, start_date DESC, r.rating DESC, c.handle
"
java com.topcoder.utilities.QueryLoader 23 "Highest_Challenge_Success" 1 7 "
SELECT c.handle,
c.coder_id,
r.rating, 
count(*),
SUM(rr.challenge_attempts_made) AS challenge_attempts_made,
SUM(rr.challenges_made_successful) AS challenges_made_successful,
(CASE SUM(rr.challenge_attempts_made)
      WHEN 0 THEN 0.0
 ELSE SUM(rr.challenges_made_successful)/SUM(rr.challenge_attempts_made)
 END) AS success_percent
FROM coder c, room_result rr, rating r, round
WHERE c.coder_id = rr.coder_id
AND c.status = 'A'
AND r.coder_id = c.coder_id
AND rr.round_id = round.round_id
AND round.round_type_id = 1
GROUP BY c.handle, c.coder_id, r.rating
HAVING SUM(rr.challenge_attempts_made) >= 20
ORDER BY success_percent DESC, r.rating DESC, c.handle
"
java com.topcoder.utilities.QueryLoader 24 "Earnings_History" 0 0 "
SELECT rr.round_id, 
r.name,
r.contest_id,
cal.date,
c.name,
rr.room_placed, 
rr.paid,
rr.room_id,
rr.payment_type_desc
FROM contest c, round r, calendar cal, room_result rr
WHERE rr.coder_id = @cr@
AND rr.paid > 0.0
AND r.round_id = rr.round_id
AND c.contest_id = r.contest_id
AND cal.calendar_id = r.calendar_id
AND r.round_type_id IN (1,2)
ORDER BY @sc@ @sd@
"
java com.topcoder.utilities.QueryLoader 25 "Ratings_History" 0 0 "
SELECT rr.round_id,
r.name,
r.contest_id,
cal.date,
c.name,
rr.new_rating,
rr.room_id
FROM contest c, round r, calendar cal, room_result rr
WHERE rr.coder_id = @cr@
AND r.round_id = rr.round_id
AND c.contest_id = r.contest_id
AND cal.calendar_id = r.calendar_id
AND r.round_type_id IN (1,2)
ORDER BY @sc@ @sd@
"
java com.topcoder.utilities.QueryLoader 26 "Most_Recent_Round" 0 0 "
SELECT MAX(round_id) AS round_id
FROM round
WHERE calendar_id =
(SELECT MAX(calendar_id)
 FROM round
WHERE round_type_id IN (1,2))
"
java com.topcoder.utilities.QueryLoader 27 "First_Room_For_Round" 0 0 "
SELECT MIN(room_id)
FROM room
WHERE room.round_id = @rd@
"
java com.topcoder.utilities.QueryLoader 28 "Rooms_For_Round" 0 0 "
SELECT room_id,
name,
division_desc
FROM room
WHERE room.round_id = @rd@
ORDER BY room_id ASC
"
java com.topcoder.utilities.QueryLoader 29 "Room_Summary_Data" 0 0 "
SELECT c.handle,
c.coder_id,
con.name,
r.name,
round.name,
rr.room_placed,
rr.problems_submitted,
rr.submission_points,
rr.challenge_attempts_received,
rr.defense_points,
rr.challenge_attempts_made,
rr.challenge_points,
rr.system_test_points,
rr.final_points,
CASE WHEN round.round_type_id = 1 THEN 'N/A' ELSE rr.advanced END,
rr.old_rating,
(rr.new_rating - rr.old_rating) AS rating_change,
rr.new_rating,
rr.round_id,
rr.room_id
FROM contest con, round, room r, coder c, room_result rr
WHERE rr.round_id = @rd@
AND rr.room_id = @rm@
AND r.room_id = @rm@
AND c.coder_id = rr.coder_id
AND round.round_id = @rd@
AND con.contest_id = round.contest_id
ORDER BY rr.final_points DESC, rr.new_rating DESC, c.handle
"
java com.topcoder.utilities.QueryLoader 30 "Basic_Coder_Information" 0 0 "
SELECT c.handle,
r.rating
FROM coder c, rating r
WHERE c.coder_id = @cr@
AND r.coder_id = @cr@
"
java com.topcoder.utilities.QueryLoader 31 "Coder_Challenge_Summary" 0 0 "
SELECT l.level_desc,
l.level_id,
SUM(cl.challenge_attempts_made) AS challenge_attempts_made,
SUM(cl.challenges_made_failed) AS challenges_made_failed,
SUM(cl.challenges_made_successful) AS challenges_made_successful,
(CASE SUM(cl.challenge_attempts_made)
  WHEN 0 THEN 0.0
  ELSE SUM(cl.challenges_made_successful) / SUM(cl.challenge_attempts_made)
  END) AS success_percentage
FROM level_lu l, coder_level cl
WHERE cl.coder_id = @cr@
AND l.level_id = cl.level_id
GROUP by l.level_desc, l.level_id
ORDER by l.level_id
"
java com.topcoder.utilities.QueryLoader 32 "All_Time_Wins_By_Division" 1 4 "
SELECT c.handle,
c.coder_id,
r.rating,
SUM(CASE 
    WHEN (rr.room_placed = 1 and rr.division_id = @dn@) THEN 1 
    ELSE 0 
    END) AS division_wins
FROM rating r, coder c, room_result rr, round
WHERE r.coder_id = c.coder_id 
AND c.status = 'A'
AND c.coder_id = rr.coder_id 
AND rr.room_placed = 1
AND rr.round_id = round.round_id
AND round.round_type_id = 1
GROUP BY c.handle, c.coder_id, r.rating 
ORDER BY division_wins DESC, r.rating DESC, c.handle
"
java com.topcoder.utilities.QueryLoader 33 "Room_Header_Information" 0 0 "
SELECT con.name,
round.name,
r.name,
c.handle
FROM contest con, round, room r, coder c
WHERE r.room_id = @rm@
AND c.coder_id = @cr@
AND round.round_id = @rd@
AND con.contest_id = round.contest_id
"
java com.topcoder.utilities.QueryLoader 34 "Base_Room_ID" 0 0 "
SELECT NVL(MIN(room_id), 0)
    FROM room
    WHERE round_id = @rd@
    AND division_id = @dn@
"
java com.topcoder.utilities.QueryLoader 35 "Round_Statistics_Data" 0 0 "
SELECT c.handle,
c.coder_id,
con.name,
r.name,
rr.room_id,
room.name,
rr.room_placed,
rr.submission_points,
(rr.challenge_points + rr.defense_points) AS challenge_points,
rr.system_test_points,
rr.final_points,
CASE WHEN r.round_type_id = 1 THEN 'N/A' ELSE rr.advanced END,
rr.old_rating,
(rr.new_rating - rr.old_rating) AS rating_change,
rr.new_rating,
r.round_id AS round_id
FROM contest con, round r, coder c, room_result rr, room
WHERE rr.round_id = @rd@
AND rr.division_id = @dn@
AND r.round_id = @rd@
AND c.coder_id = rr.coder_id
AND con.contest_id = r.contest_id
AND room.room_id = rr.room_id
ORDER BY @sc@ @sd@
"
java com.topcoder.utilities.QueryLoader 36 "Round_Statistics_Data" 0 0 "
SELECT c.handle,
c.coder_id,
con.name,
r.name,
rr.room_id,
room.name,
rr.room_placed,
rr.submission_points,
(rr.challenge_points + rr.defense_points) AS challenge_points,
rr.system_test_points,
rr.final_points,
CASE WHEN r.round_type_id = 1 THEN 'N/A' ELSE rr.advanced END,
rr.old_rating,
(rr.new_rating - rr.old_rating) AS rating_change,
rr.new_rating,
room.division_desc,
r.round_id AS round_id
FROM contest con, round r, coder c, room_result rr, room
WHERE rr.round_id =
   (SELECT MAX(round_id) AS round_id
    FROM round
    WHERE calendar_id =
    (SELECT MAX(calendar_id)
     FROM round
     WHERE round_type_id IN (1,2)))
AND rr.division_id = @dn@
AND r.round_id = rr.round_id
AND rr.room_id >= @br@ + @sm@ - 1
AND rr.room_id < @br@ + @em@
AND c.coder_id = rr.coder_id
AND con.contest_id = r.contest_id
AND room.room_id = rr.room_id
ORDER BY rr.room_id, rr.final_points DESC, rr.new_rating DESC, c.handle
"
java com.topcoder.utilities.QueryLoader 37 "Round_Statistics_Data" 0 0 "
SELECT c.handle,
c.coder_id,
con.name,
r.name,
rr.room_id,
room.name,
rr.room_placed,
rr.submission_points,
(rr.challenge_points + rr.defense_points) AS challenge_points,
rr.system_test_points,
rr.final_points,
CASE WHEN r.round_type_id = 1 THEN 'N/A' ELSE rr.advanced END,
rr.old_rating,
(rr.new_rating - rr.old_rating) AS rating_change,
rr.new_rating,
r.round_id AS round_id
FROM contest con, round r, coder c, room_result rr, room
WHERE rr.round_id = 
   (SELECT MAX(round_id) AS round_id
    FROM round
    WHERE calendar_id =
    (SELECT MAX(calendar_id)
     FROM round
     WHERE round_type_id IN (1,2)))
AND rr.division_id = @dn@
AND r.round_id = rr.round_id
AND c.coder_id = rr.coder_id
AND con.contest_id = r.contest_id
AND room.room_id = rr.room_id
ORDER BY @sc@ @sd@
"
java com.topcoder.utilities.QueryLoader 38 "Base_Room_ID" 0 0 "
SELECT NVL(MIN(room_id), 0)
    FROM room
    WHERE round_id =
      (SELECT MAX(round_id) AS round_id
       FROM round
       WHERE calendar_id =
       (SELECT MAX(calendar_id)
        FROM round
       WHERE round_type_id IN (1,2)))
    AND division_id = @dn@
"
java com.topcoder.utilities.QueryLoader 39 "Division_Room_Count" 0 0 "
SELECT NVL(RANGE(room_id) + 1, 0)
    FROM room
    WHERE round_id = @rd@
    AND division_id = @dn@
"
java com.topcoder.utilities.QueryLoader 40 "Division_Room_Count" 0 0 "
SELECT NVL(RANGE(room_id) + 1, 0)
    FROM room
    WHERE round_id = 
    (SELECT MAX(round_id) AS round_id
     FROM round
     WHERE calendar_id =
     (SELECT MAX(calendar_id)
      FROM round
       WHERE round_type_id IN (1,2)))
    AND division_id = @dn@
"
java com.topcoder.utilities.QueryLoader 41 "Current_User_Info" 0 0 "
SELECT (SELECT count(*)
          FROM coder_image_xref cix
               ,image i
         WHERE cix.image_id = i.image_id
           AND cix.coder_id = c.coder_id
           AND i.image_type_id = 1) as has_image
       ,c.activation_code
       ,c.handle
       ,c.coder_id
  FROM coder c
 WHERE c.coder_id = @cu@
"
java com.topcoder.utilities.QueryLoader 42 "Most_Recent_Round_For_Coder" 0 0 "
SELECT NVL(MAX(rr.round_id), 0)
FROM room_result rr, round r
WHERE rr.coder_id = @cr@
AND rr.round_id = r.round_id
AND r.calendar_id =
 (SELECT MAX(calendar_id)
  FROM room_result, round
  WHERE coder_id = @cr@
  AND room_result.round_id = round.round_id)
"
java com.topcoder.utilities.QueryLoader 43 "Room_For_Coder_Round" 0 0 "
SELECT NVL(MAX(room_id), 0)
FROM room_result
WHERE round_id = @rd@
AND coder_id = @cr@
"
java com.topcoder.utilities.QueryLoader 44 "Coder_Problems" 0 0 "
SELECT p.class_name,
p.method_name,
p.problem_id,
p.level_desc,
p.level_id,
cp.time_elapsed,
cp.end_status_text,
cp.submission_points
FROM problem p, coder_problem cp
WHERE cp.coder_id = @cr@
AND cp.round_id = @rd@
AND p.problem_id = cp.problem_id
AND p.round_id = cp.round_id
AND p.division_id = cp.division_id
ORDER BY p.level_id ASC
"
java com.topcoder.utilities.QueryLoader 45 "Round_Sponsor_Image" 0 0 "
SELECT p.path || i.file_name, link, width, height
  FROM round_image_xref rix
       ,image i
       ,path p
 WHERE rix.image_id = i.image_id
   AND i.path_id = p.path_id
   AND i.image_type_id = 6
   AND rix.display_flag = 1
   AND rix.round_id = @rd@
"
java com.topcoder.utilities.QueryLoader 46 "Top_Room_Winners" 1 7 "
SELECT ro.name as round_name
       ,ro.round_id as round_id
       ,r.name as room_name
       ,r.room_id as room_id
       ,c.handle as handle
       ,c.coder_id as coder_id
       ,rr.final_points as final_points
       ,rr.new_rating as rating
       ,co.name as contest_name
  FROM room_result rr
       ,room r
       ,coder c
       ,round ro
       ,contest co
 WHERE rr.room_id = r.room_id
   AND ro.contest_id = co.contest_id
   AND rr.round_id = r.round_id
   AND ro.round_id = rr.round_id
   AND r.round_id = ro.round_id
   AND rr.division_id = r.division_id 
   AND rr.coder_id = c.coder_id
   AND r.division_id = @dn@
   AND rr.room_placed = 1
   AND ro.calendar_id = (SELECT max(calendar_id) 
                           FROM round r
                          WHERE r.round_type_id = 1)
 ORDER BY final_points desc
"
java com.topcoder.utilities.QueryLoader 47 "Top_Ranked_Div_1" 1 3 "
SELECT c.coder_id
       ,c.handle
       ,r.rating
  FROM coder c, rating r
 WHERE c.coder_id = r.coder_id
   AND c.status = 'A'
   AND r.rating > 1199
 ORDER BY r.rating DESC
"
java com.topcoder.utilities.QueryLoader 48 "Top_Ranked_Div_2" 1 3 "
SELECT c.coder_id
       ,c.handle
       ,r.rating
  FROM coder c, rating r
 WHERE c.coder_id = r.coder_id
   AND c.status = 'A'
   AND r.rating > 0
   AND r.rating < 1200
 ORDER BY r.rating DESC
"

java com.topcoder.utilities.QueryLoader 49 "Div2_Problem_Level_Stats" 0 0 "
SELECT p.class_name as class_name
       ,cp.level_desc as level
       ,SUM(CASE WHEN cp.end_status_id = 150 THEN 1 ELSE 0 END) as passed_sys_test
       ,SUM(CASE WHEN cp.end_status_id = 140 THEN 1 ELSE 0 END) as failed_by_challenge
       ,SUM(CASE WHEN cp.end_status_id = 160 THEN 1 ELSE 0 END) as failed_by_sys_test
       ,SUM(CASE WHEN cp.end_status_id in (140, 160, 150) THEN 1 ELSE 0 END) as number_submitted
       ,SUM(CASE WHEN cp.end_status_id = 150 AND rr.old_rating = 0 THEN 1 ELSE 0 END) as newbie_passed_sys_test
       ,SUM(CASE WHEN cp.end_status_id = 140 AND rr.old_rating = 0 THEN 1 ELSE 0 END) as newbie_failed_by_challenge
       ,SUM(CASE WHEN cp.end_status_id = 160 AND rr.old_rating = 0 THEN 1 ELSE 0 END) as newbie_failed_by_sys_test
       ,SUM(CASE WHEN cp.end_status_id in (140, 160, 150) AND rr.old_rating = 0 THEN 1 ELSE 0 END) as newbie_number_submitted
       ,SUM(CASE WHEN cp.end_status_id = 150 AND rr.old_rating between 1 AND 899 THEN 1 ELSE 0 END) as gray_passed_sys_test
       ,SUM(CASE WHEN cp.end_status_id = 140 AND rr.old_rating between 1 AND 899 THEN 1 ELSE 0 END) as gray_failed_by_challenge
       ,SUM(CASE WHEN cp.end_status_id = 160 AND rr.old_rating between 1 AND 899 THEN 1 ELSE 0 END) as gray_failed_by_sys_test
       ,SUM(CASE WHEN cp.end_status_id in (140, 160, 150) AND rr.old_rating between 1 AND 899 THEN 1 ELSE 0 END) as gray_number_submitted
       ,SUM(CASE WHEN cp.end_status_id = 150 AND rr.old_rating between 900 AND 1199 THEN 1 ELSE 0 END) as green_passed_sys_test
       ,SUM(CASE WHEN cp.end_status_id = 140 AND rr.old_rating between 900 AND 1199 THEN 1 ELSE 0 END) as green_failed_by_challenge
       ,SUM(CASE WHEN cp.end_status_id = 160 AND rr.old_rating between 900 AND 1199 THEN 1 ELSE 0 END) as green_failed_by_sys_test
       ,SUM(CASE WHEN cp.end_status_id in (140, 160, 150) AND rr.old_rating between 900 AND 1199 THEN 1 ELSE 0 END) as green_number_submitted
  FROM coder_problem cp
       ,problem p
       ,room_result rr
 WHERE cp.problem_id = p.problem_id
   AND cp.division_id = p.division_id
   AND cp.round_id = @rd@
   AND cp.division_id = 2 
   AND cp.coder_id = rr.coder_id
   AND cp.round_id = rr.round_id
   AND cp.division_id = rr.division_id
 GROUP BY cp.level_id, p.class_name, cp.level_desc
"


java com.topcoder.utilities.QueryLoader "DW" 50 "Rating_History_Graph" 0 0 "
 SELECT c.name as contest_name
 ,c.contest_id as contest_id
 ,r.name as round_name
 ,r.round_id as round_id
 ,rr.new_rating as rating
 ,cal.date as date
 FROM room_result rr
 ,contest c
 ,round r
 ,calendar cal
 WHERE rr.coder_id = @cr@
 AND rr.round_id = r.round_id
 AND c.contest_id = r.contest_id
 AND r.calendar_id = cal.calendar_id
 AND r.round_type_id IN (1,2)
 ORDER BY cal.date
"

java com.topcoder.utilities.QueryLoader "DW" 51 "Rating_Distribution_Graph" 0 0 "
SELECT sum(case when rating between 0000 and 0099 then 1 else 0 end) as group01
 ,sum(case when rating between 0100 and 0199 then 1 else 0 end) as group02
 ,sum(case when rating between 0200 and 0299 then 1 else 0 end) as group03
 ,sum(case when rating between 0300 and 0399 then 1 else 0 end) as group04
 ,sum(case when rating between 0400 and 0499 then 1 else 0 end) as group05
 ,sum(case when rating between 0500 and 0599 then 1 else 0 end) as group06
 ,sum(case when rating between 0600 and 0699 then 1 else 0 end) as group07
 ,sum(case when rating between 0700 and 0799 then 1 else 0 end) as group08
 ,sum(case when rating between 0800 and 0899 then 1 else 0 end) as group09
 ,sum(case when rating between 0900 and 0999 then 1 else 0 end) as group10
 ,sum(case when rating between 1000 and 1099 then 1 else 0 end) as group11
 ,sum(case when rating between 1100 and 1199 then 1 else 0 end) as group12
 ,sum(case when rating between 1200 and 1299 then 1 else 0 end) as group13
 ,sum(case when rating between 1300 and 1399 then 1 else 0 end) as group14
 ,sum(case when rating between 1400 and 1499 then 1 else 0 end) as group15
 ,sum(case when rating between 1500 and 1599 then 1 else 0 end) as group16
 ,sum(case when rating between 1600 and 1699 then 1 else 0 end) as group17
 ,sum(case when rating between 1700 and 1799 then 1 else 0 end) as group18
 ,sum(case when rating between 1800 and 1899 then 1 else 0 end) as group19
 ,sum(case when rating between 1900 and 1999 then 1 else 0 end) as group20
 ,sum(case when rating between 2000 and 2099 then 1 else 0 end) as group21
 ,sum(case when rating between 2100 and 2199 then 1 else 0 end) as group22
 ,sum(case when rating between 2200 and 2299 then 1 else 0 end) as group23
 ,sum(case when rating between 2300 and 2399 then 1 else 0 end) as group24
 ,sum(case when rating between 2400 and 2499 then 1 else 0 end) as group25
 ,sum(case when rating between 2500 and 2599 then 1 else 0 end) as group26
 ,sum(case when rating between 2600 and 2699 then 1 else 0 end) as group27
 ,sum(case when rating between 2700 and 2799 then 1 else 0 end) as group28
 ,sum(case when rating between 2800 and 2899 then 1 else 0 end) as group29
 ,sum(case when rating >2899 then 1 else 0 end) as group30
 FROM coder c
 ,rating r
 WHERE c.coder_id = r.coder_id
 AND status = 'A'
 AND num_ratings > @ra@
"

java com.topcoder.utilities.QueryLoader "DW" 52 "Submission_Information" 0 0 "
SELECT c.handle, p.class_name, p.method_name, ps.status_desc, ps.submission_text
  FROM problem_submission ps
       ,coder c
       ,room_result rr
       ,problem p
 WHERE c.coder_id = rr.coder_id
   AND ps.coder_id = c.coder_id
   AND ps.coder_id = rr.coder_id
   AND ps.round_id = rr.round_id
   AND ps.problem_id = p.problem_id
   AND p.round_id = rr.round_id
   AND p.round_id = ps.round_id
   AND p.division_id = rr.division_id
   AND ps.last_submission = 1
   AND p.division_id = @dn@
   AND ps.status_id in (@pss@)
   AND rr.round_id = @rd@
   AND rr.round_id > 4100
 ORDER BY p.class_name
"

java com.topcoder.utilities.QueryLoader "DW" 53 "High_Scorers" 0 0 "
SELECT
  c.coder_id as coder_id,
  c.handle as handle,
  r.name as room_name,
  rr.final_points as final_points,
  cn.name as contest_name,
  rr.division_id as division_id,
  rr.new_rating as new_rating,
  rd.round_id as round_id
FROM
  coder c,
  room r,
  room_result rr,
  round rd,
  contest cn
WHERE
  cn.contest_id = rd.contest_id and
  rr.round_id = rd.round_id and
  c.coder_id = rr.coder_id and
  c.status = 'A' and
  r.room_id = rr.room_id and
  rd.round_id = @rd@
ORDER by division_id, final_points desc
"

java com.topcoder.utilities.QueryLoader "DW" 54 "Round_Percentages" 0 0 "
select
  d.division_desc as division_desc,
  p.level_id,
  min(l.level_desc) as problem_level,
  p.class_name as problem_name,
  p.problem_id as problem_id,
  sum(case when submission_points > 0 then 1 else 0 end) as submissions,
  sum(case when final_points > 0 then 1 else 0 end) as successful_submissions,
  sum(final_points) as total_points,
  min(d.division_id) as division_id
from
  division_lu d,
  level_lu l,
  problem p,
  coder_problem cp,
  round rd
where
  cp.round_id = rd.round_id and
  cp.problem_id = p.problem_id and
  p.level_id = l.level_id and
  cp.division_id = d.division_id and
  cp.division_id = p.division_id and
  rd.round_id = @rd@
group by 1,2,4,5
order by 9, 2
"

java com.topcoder.utilities.QueryLoader "DW" 55 "Problem_Distribution_Graph" 0 0 "
SELECT
  sum(case when cp.final_points >= p.points*0.300 and cp.final_points < p.points*0.323 then 1 else 0 end) as group00
  ,sum(case when cp.final_points >= p.points*0.323 and cp.final_points < p.points*0.347 then 1 else 0 end) as group01
  ,sum(case when cp.final_points >= p.points*0.347 and cp.final_points < p.points*0.370 then 1 else 0 end) as group02
  ,sum(case when cp.final_points >= p.points*0.370 and cp.final_points < p.points*0.393 then 1 else 0 end) as group03
  ,sum(case when cp.final_points >= p.points*0.393 and cp.final_points < p.points*0.417 then 1 else 0 end) as group04
  ,sum(case when cp.final_points >= p.points*0.417 and cp.final_points < p.points*0.440 then 1 else 0 end) as group05
  ,sum(case when cp.final_points >= p.points*0.440 and cp.final_points < p.points*0.463 then 1 else 0 end) as group06
  ,sum(case when cp.final_points >= p.points*0.463 and cp.final_points < p.points*0.487 then 1 else 0 end) as group07
  ,sum(case when cp.final_points >= p.points*0.487 and cp.final_points < p.points*0.510 then 1 else 0 end) as group08
  ,sum(case when cp.final_points >= p.points*0.510 and cp.final_points < p.points*0.533 then 1 else 0 end) as group09
  ,sum(case when cp.final_points >= p.points*0.533 and cp.final_points < p.points*0.557 then 1 else 0 end) as group10
  ,sum(case when cp.final_points >= p.points*0.557 and cp.final_points < p.points*0.580 then 1 else 0 end) as group11
  ,sum(case when cp.final_points >= p.points*0.580 and cp.final_points < p.points*0.603 then 1 else 0 end) as group12
  ,sum(case when cp.final_points >= p.points*0.603 and cp.final_points < p.points*0.627 then 1 else 0 end) as group13
  ,sum(case when cp.final_points >= p.points*0.627 and cp.final_points < p.points*0.650 then 1 else 0 end) as group14
  ,sum(case when cp.final_points >= p.points*0.650 and cp.final_points < p.points*0.673 then 1 else 0 end) as group15
  ,sum(case when cp.final_points >= p.points*0.673 and cp.final_points < p.points*0.697 then 1 else 0 end) as group16
  ,sum(case when cp.final_points >= p.points*0.697 and cp.final_points < p.points*0.720 then 1 else 0 end) as group17
  ,sum(case when cp.final_points >= p.points*0.720 and cp.final_points < p.points*0.743 then 1 else 0 end) as group18
  ,sum(case when cp.final_points >= p.points*0.743 and cp.final_points < p.points*0.767 then 1 else 0 end) as group19
  ,sum(case when cp.final_points >= p.points*0.767 and cp.final_points < p.points*0.790 then 1 else 0 end) as group20
  ,sum(case when cp.final_points >= p.points*0.790 and cp.final_points < p.points*0.813 then 1 else 0 end) as group21
  ,sum(case when cp.final_points >= p.points*0.813 and cp.final_points < p.points*0.837 then 1 else 0 end) as group22
  ,sum(case when cp.final_points >= p.points*0.837 and cp.final_points < p.points*0.860 then 1 else 0 end) as group23
  ,sum(case when cp.final_points >= p.points*0.860 and cp.final_points < p.points*0.883 then 1 else 0 end) as group24
  ,sum(case when cp.final_points >= p.points*0.883 and cp.final_points < p.points*0.907 then 1 else 0 end) as group25
  ,sum(case when cp.final_points >= p.points*0.907 and cp.final_points < p.points*0.930 then 1 else 0 end) as group26
  ,sum(case when cp.final_points >= p.points*0.930 and cp.final_points < p.points*0.953 then 1 else 0 end) as group27
  ,sum(case when cp.final_points >= p.points*0.953 and cp.final_points < p.points*0.977 then 1 else 0 end) as group28
  ,sum(case when cp.final_points >= p.points*0.977 and cp.final_points < p.points*1.000 then 1 else 0 end) as group29
  ,p.class_name as name
  ,p.points as points
FROM
  problem p,
  coder_problem cp,
  coder c
WHERE
  cp.problem_id=@pm@ and
  p.problem_id = cp.problem_id and
  cp.division_id = @dn@ and
  p.division_id = @dn@ and
  cp.coder_id = c.coder_id and
  p.division_id = cp.division_id and
  p.round_id = cp.round_id and 
  c.status = 'A'
GROUP BY
  p.class_name,
  p.points
"

java com.topcoder.utilities.QueryLoader "DW" 56 "Problem_Distribution_Info" 0 0 "
SELECT
  problems_presented as total
  ,problems_opened-problems_submitted as opened
  ,problems_correct as passed
  ,problems_failed_by_challenge as challenged
  ,problems_failed_by_system_test as failed
FROM
  round_problem
WHERE
  problem_id=@pm@ and
  division_id = @dn@
"

java com.topcoder.utilities.QueryLoader "DW" 57 "School_Avg_Rating" 1 2 "
 SELECT name
        ,TRUNC(CASE WHEN rated_count=0 THEN 0 ELSE sum_rating/rated_count END, 2) AS avg_rating 
        ,rated_count
   FROM TABLE(MULTISET(
          SELECT NVL(short_name, name) AS name
                 ,sc.school_id
                 ,SUM(CASE WHEN cr.rating > 0 THEN 1 ELSE 0 END) AS rated_count
                 ,SUM(CASE WHEN cr.rating > 0 THEN cr.rating ELSE 0 END) as sum_rating
            FROM coder c
                 ,current_school cs
                 ,rating cr
                 ,school sc
           WHERE cr.coder_id = c.coder_id
           AND cs.coder_id = c.coder_id
           AND cs.school_id = sc.school_id
           AND c.status = 'A'
         GROUP BY sc.school_id, 1))
  WHERE rated_count >= @nrn@
  ORDER BY 2 DESC
"

java com.topcoder.utilities.QueryLoader "DW" 58 "Top_Scorers" 1 4 "
 SELECT r.name AS room_name
        ,c.handle
        ,c.coder_id
        ,TRUNC(rr.final_points, 2) as final_points
        ,co.name AS contest_name
        ,ro.name AS round_name
        ,ra.rating
        ,r.room_id
        ,ro.round_id
   FROM room_result rr
        ,room r
        ,coder c
        ,contest co
        ,round ro
        ,rating ra
  WHERE rr.round_id = r.round_id
    AND rr.room_id = r.room_id
    AND rr.coder_id = c.coder_id
    AND rr.division_id = @dn@ 
    AND rr.round_id = ro.round_id
    AND ro.contest_id = co.contest_id
    AND c.coder_id = ra.coder_id
    AND rr.round_id = @rd@
  ORDER BY final_points DESC
"

java com.topcoder.utilities.QueryLoader "DW" 1000 "TCES_Coder_Stats" 0 0 "
SELECT (CASE WHEN r.num_ratings = 0 THEN 'Not Rated' ELSE ''||r.rating END) AS rating
     , r.highest_rating
     , r.lowest_rating
     , cr.percentile
     , cr.rank
     , r.num_ratings
     , TO_CHAR(cal.date, '%m/%d/%iY') as last_rated_event
  FROM calendar cal
     , round rd
     , rating r
     , coder_rank cr
 WHERE cal.calendar_id = rd.calendar_id
   AND rd.round_id = r.last_rated_round_id
   AND r.coder_id = cr.coder_id
   AND (r.coder_id = @mid@)
   AND (cr.coder_rank_type_id = 1)
"

java com.topcoder.utilities.QueryLoader "DW" 1001 "TCES_Coder_Stats_D1" 0 0 "
SELECT (SELECT AVG(rr.final_points)
          FROM room_result rr
         WHERE rr.coder_id = cd.coder_id
           AND rr.division_id = cd.division_id) AS avg_contest_points
     , cd.problems_presented AS total_presented
     , cd.problems_submitted AS total_submitted
     , (CASE WHEN cd.problems_presented = 0 THEN 0.0
             ELSE cd.problems_submitted / cd.problems_presented * 100
             END) AS total_submit_percent
     , cd.problems_correct AS correct
     , (CASE WHEN cd.problems_submitted = 0 THEN 0.0
             ELSE cd.problems_correct / cd.problems_submitted * 100
             END) AS total_submission_accuracy
     , (CASE WHEN cd.problems_presented = 0 THEN 0.0
             ELSE cd.problems_correct / cd.problems_presented * 100
             END) AS total_overall_accuracy
     , (CASE WHEN cd.problems_submitted = 0 THEN 0.0
             ELSE (cd.submission_points + cd.defense_points + cd.system_test_points) / cd.problems_submitted
             END) AS avg_submission_points
     , (CASE WHEN cd.problems_submitted = 0 THEN 0.0
             ELSE (cd.submission_points + cd.defense_points + cd.system_test_points) / cd.problems_presented
             END) AS avg_overall_points
     , (SELECT AVG(cp.time_elapsed)
          FROM coder_problem cp
         WHERE cp.coder_id = cd.coder_id
           AND cp.division_id = cd.division_id
           AND cp.end_status_id IN (140,150,160)) AS avg_time_elapsed
  FROM coder_division cd
 WHERE (cd.coder_id = @mid@)
   AND (cd.division_id = 1)
"

java com.topcoder.utilities.QueryLoader "DW" 1002 "TCES_Coder_Stats_D2" 0 0 "
SELECT (SELECT AVG(rr.final_points)
          FROM room_result rr
         WHERE rr.coder_id = cd.coder_id
           AND rr.division_id = cd.division_id) AS avg_contest_points
     , cd.problems_presented AS total_presented
     , cd.problems_submitted AS total_submitted
     , (CASE WHEN cd.problems_presented = 0 THEN 0.0
             ELSE cd.problems_submitted / cd.problems_presented * 100
             END) AS total_submit_percent
     , cd.problems_correct AS correct
     , (CASE WHEN cd.problems_submitted = 0 THEN 0.0
             ELSE cd.problems_correct / cd.problems_submitted * 100
             END) AS total_submission_accuracy
     , (CASE WHEN cd.problems_presented = 0 THEN 0.0
             ELSE cd.problems_correct / cd.problems_presented * 100
             END) AS total_overall_accuracy
     , (CASE WHEN cd.problems_submitted = 0 THEN 0.0
             ELSE (cd.submission_points + cd.defense_points + cd.system_test_points) / cd.problems_submitted
             END) AS avg_submission_points
     , (CASE WHEN cd.problems_submitted = 0 THEN 0.0
             ELSE (cd.submission_points + cd.defense_points + cd.system_test_points) / cd.problems_presented
             END) AS avg_overall_points
     , (SELECT AVG(cp.time_elapsed)
          FROM coder_problem cp
         WHERE cp.coder_id = cd.coder_id
           AND cp.division_id = cd.division_id
           AND cp.end_status_id IN (140,150,160)) AS avg_time_elapsed
  FROM coder_division cd
 WHERE (cd.coder_id = @mid@)
   AND (cd.division_id = 2)
"

java com.topcoder.utilities.QueryLoader "DW" 1003 "TCES_Problem_Submissions" 0 0 "
SELECT cal.date
     , (CASE WHEN r.round_type_id = 2
             THEN c.name || ' ' || r.name
             ELSE c.name END) AS name
     , cp.level_desc
     , dlu.division_desc
     , cp.final_points
     , langlu.language_name
     , cp.end_status_text
     , cp.round_id
     , cp.problem_id
  FROM coder_problem cp
     , round r
     , contest c
     , division_lu dlu
     , language_lu langlu
     , calendar cal
 WHERE cp.round_id = r.round_id
   AND r.contest_id = c.contest_id
   AND cp.division_id = dlu.division_id
   AND cp.language_id = langlu.language_id
   AND r.calendar_id = cal.calendar_id
   AND (cp.coder_id = @mid@)
   AND (cp.submission_points > 0.0)
 ORDER BY cal.date
"

java com.topcoder.utilities.QueryLoader "DW" 1004 "TCES_Competition_History" 0 0 "
SELECT cal.date
     , (CASE WHEN r.round_type_id = 2
             THEN contest.name || ' ' || r.name
             ELSE contest.name END) AS name
     , dlu.division_desc
     , rr.final_points
     , rd.average_points
     , rr.old_rating
     , rr.new_rating
     , rr.round_id
  FROM room_result rr
     , round r
     , calendar cal
     , division_lu dlu
     , round_division rd
     , contest
 WHERE rr.round_id = r.round_id
   AND r.calendar_id = cal.calendar_id
   AND rr.division_id = dlu.division_id
   AND rr.round_id = rd.round_id
   AND rr.division_id = rd.division_id
   AND r.contest_id = contest.contest_id
   AND (rr.coder_id = @mid@)
 ORDER BY cal.date
"

java com.topcoder.utilities.QueryLoader "DW" 1005 "TCES_Coder_Comp_Stats" 0 0 "
SELECT (CASE WHEN round.round_type_id = 2
             THEN contest.name || ' ' || round.name
             ELSE contest.name END) AS contest_name
     , dlu.division_desc
     , (SELECT COUNT(*)
          FROM room_result rr2
         WHERE rr2.round_id = rr.round_id
           AND rr2.division_id = rr.division_id
           AND attended = 'Y') AS num_competitors
     , rd.average_points AS overall_avg_points
     , rd.point_standard_deviation AS overall_std_dev
     , rd.problems_submitted AS overall_problems_submitted
     , (CASE WHEN rd.problems_submitted = 0 THEN 0.0
             ELSE rd.problems_correct / rd.problems_submitted * 100
             END) AS overall_submission_accuracy
     , rr.final_points
     , rr.point_standard_deviation
     , rr.problems_submitted
     , rr.problems_correct
     , rd.problems_presented AS overall_problems_presented
     , rd.problems_correct AS overall_problems_correct
     , (CASE WHEN rd.problems_presented = 0 THEN 0.0
             ELSE rd.problems_submitted / rd.problems_presented * 100
             END) AS overall_submit_percent
     , (CASE WHEN rd.problems_presented = 0 THEN 0.0
             ELSE rd.problems_correct / rd.problems_presented * 100
             END) AS overall_accuracy
     , (SELECT AVG(final_points)
          FROM coder_problem cp
         WHERE cp.round_id = rr.round_id
           AND cp.division_id = rr.division_id
           AND cp.end_status_id IN (140,150,160)) AS overall_points_per_submission
     , (SELECT AVG(final_points)
          FROM coder_problem cp
         WHERE cp.round_id = rr.round_id
           AND cp.division_id = rr.division_id) AS overall_points_per_problem
     , (SELECT AVG(cp.time_elapsed)
          FROM coder_problem cp
         WHERE cp.round_id = rr.round_id
           AND cp.division_id = rr.division_id
           AND cp.end_status_id IN (140,150,160)) AS overall_time_per_problem
  FROM room_result rr
     , division_lu dlu
     , round_division rd
     , round
     , contest
 WHERE rr.division_id = dlu.division_id
   AND rr.round_id = rd.round_id
   AND rr.division_id = rd.division_id
   AND rd.round_id = round.round_id
   AND round.contest_id = contest.contest_id
   AND (rr.coder_id = @mid@)
   AND (rr.round_id = @rd@)
"

java com.topcoder.utilities.QueryLoader "DW" 1006 "TCES_Coder_Comp_Stats_by_Level" 0 0 "
SELECT cp.problem_id
     , cp.level_id
     , cp.level_desc
     , cp.end_status_id
     , cp.end_status_text
     , cp.final_points
     , cp.time_elapsed
     , langlu.language_name
  FROM coder_problem cp
     , language_lu langlu
 WHERE cp.language_id = langlu.language_id
   AND (cp.coder_id = @mid@)
   AND (cp.round_id = @rd@)
 ORDER BY cp.level_id
"

java com.topcoder.utilities.QueryLoader "DW" 1007 "TCES_Overall_Comp_Stats_by_Level" 0 0 "
SELECT rp.level_id
     , rp.level_desc
     , rp.problems_presented
     , rp.problems_submitted
     , (CASE WHEN rp.problems_presented = 0 THEN 0.0
             ELSE rp.problems_submitted / rp.problems_presented * 100
             END) AS submit_percent
     , rp.problems_correct
     , (CASE WHEN rp.problems_submitted = 0 THEN 0.0
             ELSE rp.problems_correct / rp.problems_submitted * 100
             END) AS submission_accuracy
     , (CASE WHEN rp.problems_presented = 0 THEN 0.0
             ELSE rp.problems_correct / rp.problems_presented * 100
             END) AS overall_accuracy
     , (CASE WHEN rp.problems_submitted = 0 THEN 0.0
             ELSE rp.final_points / rp.problems_submitted
             END) AS avg_submission_points
     , rp.average_points
     , (SELECT AVG(cp.time_elapsed)
          FROM coder_problem cp
         WHERE cp.round_id = rp.round_id
           AND cp.division_id = rp.division_id
           AND cp.problem_id = rp.problem_id
           AND cp.end_status_id IN (140,150,160)) AS avg_time_elapsed
  FROM round_problem rp
     , room_result rr
 WHERE rp.round_id = rr.round_id
   AND rp.division_id = rr.division_id
   AND (rp.round_id = @rd@)
   AND (rr.coder_id = @mid@)
 ORDER BY rp.level_id
"

java com.topcoder.utilities.QueryLoader "DW" 1008 "TCES_Coder_Problem_Stats" 0 0 "
SELECT p.class_name
     , dlu.division_desc
     , p.level_desc
     , rp.problems_presented
     , rp.problems_submitted
     , (CASE WHEN rp.problems_presented = 0 THEN 0.0
             ELSE rp.problems_submitted / rp.problems_presented * 100
             END) AS submit_percent
     , rp.problems_correct
     , (CASE WHEN rp.problems_submitted = 0 THEN 0.0
             ELSE rp.problems_correct / rp.problems_submitted * 100
             END) AS submission_accuracy
     , (CASE WHEN rp.problems_presented = 0 THEN 0.0
             ELSE rp.problems_correct / rp.problems_presented * 100
             END) AS overall_accuracy
     , (CASE WHEN rp.problems_submitted = 0 THEN 0.0
             ELSE rp.final_points / rp.problems_submitted
             END) AS avg_submission_points
     , rp.average_points
     , (SELECT AVG(cp2.time_elapsed)
          FROM coder_problem cp2
         WHERE cp2.round_id = rp.round_id
           AND cp2.division_id = rp.division_id
           AND cp2.problem_id = rp.problem_id
           AND cp2.end_status_id IN (140,150,160)) AS avg_time_elapsed
     , cp.end_status_text
     , cp.time_elapsed
     , cp.final_points
     , ps.submission_text
  FROM coder_problem cp
     , division_lu dlu
     , problem p
     , round_problem rp
     , OUTER problem_submission ps
 WHERE ps.coder_id = cp.coder_id
   AND ps.problem_id = cp.problem_id
   AND ps.round_id = cp.round_id
   AND cp.division_id = dlu.division_id
   AND cp.problem_id = p.problem_id
   AND cp.round_id = p.round_id
   AND cp.division_id = p.division_id
   AND cp.round_id = rp.round_id
   AND cp.problem_id = rp.problem_id
   AND cp.division_id = rp.division_id
   AND (cp.coder_id = @mid@)
   AND (cp.problem_id = @pm@)
   AND ps.submission_number= (SELECT MAX(submission_number)
                                FROM problem_submission ps1
                               WHERE ps.coder_id = ps1.coder_id
                                 AND ps.problem_id = ps1.problem_id
                                 AND ps.round_id = ps1.round_id)
"

java com.topcoder.utilities.QueryLoader "DW" 1009 "TCES_Problem_Stats_by_Language" 0 0 "
SELECT llu.language_id
     , llu.language_name
     , rp.problems_presented
     , COUNT(cp.coder_id) AS submitted
     , (CASE WHEN rp.problems_presented = 0 THEN 0.0
             ELSE COUNT(cp.coder_id) / rp.problems_presented * 100
             END) AS submit_percent
     , SUM(CASE WHEN cp.end_status_id = 150 THEN 1 ELSE 0 END) AS correct
     , (CASE WHEN COUNT(cp.coder_id) = 0 THEN 0.0
             ELSE SUM(CASE WHEN cp.end_status_id = 150 THEN 1 ELSE 0 END) / COUNT(cp.coder_id) * 100
             END) AS submission_accuracy
     , (CASE WHEN rp.problems_presented = 0 THEN 0.0
             ELSE SUM(CASE WHEN cp.end_status_id = 150 THEN 1 ELSE 0 END) / rp.problems_presented * 100
             END) AS overall_accuracy
     , AVG(cp.final_points) AS avg_submission_points
     , (CASE WHEN rp.problems_presented = 0 THEN 0.0
             ELSE SUM(cp.final_points) / rp.problems_presented
             END) AS avg_final_points
     , AVG(cp.time_elapsed) AS avg_time_elapsed
  FROM coder_problem maincp
     , coder_problem cp
     , language_lu llu
     , round_problem rp
 WHERE maincp.round_id = cp.round_id
   AND maincp.division_id = cp.division_id
   AND maincp.problem_id = cp.problem_id
   AND cp.language_id = llu.language_id
   AND maincp.round_id = rp.round_id
   AND maincp.problem_id = rp.problem_id
   AND maincp.division_id = rp.division_id
   AND (maincp.coder_id = @mid@)
   AND (maincp.problem_id = @pm@)
   AND (cp.end_status_id in (140,150,160))
 GROUP BY llu.language_id, rp.problems_presented, llu.language_name
 ORDER BY llu.language_id
"

java com.topcoder.utilities.QueryLoader "DW" 1010 "TCES_Problem_Statement" 0 0 "
SELECT (CASE WHEN r.round_type_id = 2
             THEN c.name || ' ' || r.name
             ELSE c.name END) AS contest_name
     , dlu.division_desc
     , p.class_name
     , p.problem_text
     , cp.language_id
  FROM problem p
     , round r
     , contest c
     , division_lu dlu
     , coder_problem cp
 WHERE p.round_id = r.round_id
   AND r.contest_id = c.contest_id
   AND p.division_id = dlu.division_id
   AND cp.round_id = p.round_id
   AND cp.division_id = p.division_id
   AND cp.problem_id = p.problem_id
   AND (cp.problem_id = @pm@)
   AND (cp.coder_id = @mid@)
"

java com.topcoder.utilities.QueryLoader "DW" 1011 "TCES_Coder_Stats_by_Level_D1" 0 0 "
SELECT cl.level_id
     , llu.level_desc
     , cl.problems_presented AS presented
     , cl.problems_submitted AS submitted
     , (CASE WHEN cl.problems_presented = 0 THEN 0.0
             ELSE cl.problems_submitted / cl.problems_presented * 100
             END) AS submit_percent
     , cl.problems_correct AS correct
     , (CASE WHEN cl.problems_submitted = 0 THEN 0.0
             ELSE cl.problems_correct / cl.problems_submitted * 100
             END) AS submission_accuracy
     , (CASE WHEN cl.problems_presented = 0 THEN 0.0
             ELSE cl.problems_correct / cl.problems_presented * 100
             END) AS overall_accuracy
     , (CASE WHEN cl.problems_submitted = 0 THEN 0.0
             ELSE cl.final_points / cl.problems_submitted
             END) AS avg_submission_points
     , (CASE WHEN cl.problems_presented = 0 THEN 0.0
             ELSE cl.final_points / cl.problems_presented
             END) AS avg_final_points
     , (SELECT AVG(cp.time_elapsed)
          FROM coder_problem cp
         WHERE cp.coder_id = cl.coder_id
           AND cp.division_id = cl.division_id
           AND cp.level_id = cl.level_id
           AND cp.end_status_id IN (140,150,160)) AS avg_time_elapsed
  FROM coder_level cl
     , level_lu llu
 WHERE cl.level_id = llu.level_id
   AND (cl.division_id = 1)
   AND (cl.coder_id = @mid@)
 ORDER BY cl.level_id
"

java com.topcoder.utilities.QueryLoader "DW" 1012 "TCES_Coder_Stats_by_Language_D1" 0 0 "
SELECT cp.language_id
     , llu.language_name
     , COUNT(cp.problem_id) AS submitted
     , (CASE WHEN cd.problems_presented = 0 THEN 0.0
             ELSE COUNT(cp.problem_id) / cd.problems_presented * 100
             END) AS submit_percent
     , SUM(CASE WHEN cp.end_status_id = 150 THEN 1 ELSE 0 END) AS num_correct
     , AVG(CASE WHEN cp.end_status_id = 150 THEN 1 ELSE 0 END) * 100 AS submission_accuracy
     , AVG(cp.final_points) AS avg_submission_points
     , AVG(cp.time_elapsed) AS avg_submit_time
  FROM coder_problem cp
     , language_lu llu
     , coder_division cd
 WHERE cp.language_id = llu.language_id
   AND cp.coder_id = cd.coder_id
   AND cp.division_id = cd.division_id
   AND (cp.coder_id = @mid@)
   AND (cp.end_status_id IN (140,150,160))
   AND (cp.division_id = 1)
 GROUP BY cp.language_id
     , llu.language_name
     , cd.problems_presented
 ORDER BY cp.language_id
"

java com.topcoder.utilities.QueryLoader "DW" 1013 "TCES_Coder_Stats_by_Level_D2" 0 0 "
SELECT cl.level_id
     , llu.level_desc
     , cl.problems_presented AS presented
     , cl.problems_submitted AS submitted
     , (CASE WHEN cl.problems_presented = 0 THEN 0.0
             ELSE cl.problems_submitted / cl.problems_presented * 100
             END) AS submit_percent
     , cl.problems_correct AS correct
     , (CASE WHEN cl.problems_submitted = 0 THEN 0.0
             ELSE cl.problems_correct / cl.problems_submitted * 100
             END) AS submission_accuracy
     , (CASE WHEN cl.problems_presented = 0 THEN 0.0
             ELSE cl.problems_correct / cl.problems_presented * 100
             END) AS overall_accuracy
     , (CASE WHEN cl.problems_submitted = 0 THEN 0.0
             ELSE cl.final_points / cl.problems_submitted
             END) AS avg_submission_points
     , (CASE WHEN cl.problems_presented = 0 THEN 0.0
             ELSE cl.final_points / cl.problems_presented
             END) AS avg_final_points
     , (SELECT AVG(cp.time_elapsed)
          FROM coder_problem cp
         WHERE cp.coder_id = cl.coder_id
           AND cp.division_id = cl.division_id
           AND cp.level_id = cl.level_id
           AND cp.end_status_id IN (140,150,160)) AS avg_time_elapsed
  FROM coder_level cl
     , level_lu llu
 WHERE cl.level_id = llu.level_id
   AND (cl.division_id = 2)
   AND (cl.coder_id = @mid@)
 ORDER BY cl.level_id
"

java com.topcoder.utilities.QueryLoader "DW" 1014 "TCES_Coder_Stats_by_Language_D2" 0 0 "
SELECT cp.language_id
     , llu.language_name
     , COUNT(cp.problem_id) AS submitted
     , (CASE WHEN cd.problems_presented = 0 THEN 0.0
             ELSE COUNT(cp.problem_id) / cd.problems_presented * 100
             END) AS submit_percent
     , SUM(CASE WHEN cp.end_status_id = 150 THEN 1 ELSE 0 END) AS num_correct
     , AVG(CASE WHEN cp.end_status_id = 150 THEN 1 ELSE 0 END) * 100 AS submission_accuracy
     , AVG(cp.final_points) AS avg_submission_points
     , AVG(cp.time_elapsed) AS avg_submit_time
  FROM coder_problem cp
     , language_lu llu
     , coder_division cd
 WHERE cp.language_id = llu.language_id
   AND cp.coder_id = cd.coder_id
   AND cp.division_id = cd.division_id
   AND (cp.coder_id = @mid@)
   AND (cp.end_status_id IN (140,150,160))
   AND (cp.division_id = 2)
 GROUP BY cp.language_id
     , llu.language_name
     , cd.problems_presented
 ORDER BY cp.language_id
"

java com.topcoder.utilities.QueryLoader "DW" 1015 "Top_Rating_Gainers_And_Losers" 0 0 "
SELECT 'Best' AS change_type
     , c.handle
     , best.change
     , r.name AS room_name
     , r.division_desc AS division
     , c.coder_id
     , ra.rating
  FROM room_result rr
     , room r
     , coder c
     , rating ra
     , TABLE(MULTISET(
           SELECT MAX(rr.new_rating-rr.old_rating) AS change
                , rr.division_id
             FROM room_result rr
            WHERE rr.round_id = @rd@
              AND rr.old_rating <> 0
            GROUP BY rr.division_id)) AS best
 WHERE rr.coder_id = c.coder_id
   AND rr.round_id = r.round_id
   AND rr.room_id = r.room_id
   AND rr.division_id = r.division_id
   AND (rr.new_rating-rr.old_rating) = best.change
   AND ra.coder_id = c.coder_id
   AND rr.round_id = @rd@
UNION
SELECT 'Worst' AS change_type
     , c.handle
     , inner.change
     , r.name AS room_name
     , r.division_desc AS division
     , c.coder_id
     , ra.rating
  FROM room_result rr
     , room r
     , coder c
     , rating ra
     , TABLE(MULTISET(
           SELECT MIN(rr.new_rating-rr.old_rating) AS change
                , rr.division_id
             FROM room_result rr
            WHERE rr.round_id = @rd@
              AND rr.old_rating <> 0
            GROUP BY rr.division_id)) AS inner
 WHERE rr.coder_id = c.coder_id
   AND rr.round_id = r.round_id
   AND rr.room_id = r.room_id
   AND rr.division_id = r.division_id
   AND (rr.new_rating-rr.old_rating) = inner.change
   AND rr.round_id = @rd@
   AND ra.coder_id = c.coder_id
 ORDER BY 5
"
