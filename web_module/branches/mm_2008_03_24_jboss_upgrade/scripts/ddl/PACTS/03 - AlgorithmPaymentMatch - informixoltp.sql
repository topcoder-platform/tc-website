-- Backup just in case

create table 'informix'.payment_detail_old (
    payment_detail_id DECIMAL(10,0),
    net_amount DECIMAL(12,2),
    date_paid DATETIME YEAR TO FRACTION,
    date_printed DATETIME YEAR TO FRACTION,
    gross_amount DECIMAL(12,2),
    status_id DECIMAL(3,0),
    payment_address_id DECIMAL(10,0),
    modification_rationale_id DECIMAL(3,0),
    payment_desc VARCHAR(100),
    payment_type_id DECIMAL(3,0),
    date_modified DATETIME YEAR TO FRACTION,
    date_due DATETIME YEAR TO FRACTION,
    payment_method_id DECIMAL(3,0),
    project_id DECIMAL(10,0),
    client VARCHAR(100)
)
extent size 3000 next size 1000
lock mode row;

insert into payment_detail_old
select payment_detail_id, net_amount, date_paid, date_printed ,
    gross_amount, status_id, payment_address_id, modification_rationale_id,
    payment_desc, payment_type_id, date_modified, date_due, payment_method_id, project_id, client
from payment_detail;

-----

update payment_detail set algorithm_round_id = 4345 
where payment_detail_id in (select payment_detail_id from payment_detail_xref where payment_id = 11862);

update payment_detail set payment_desc = "TCO 06 Championship Round winnings"
where payment_desc = "TCO Algorithm Onsite";

update payment_detail set payment_desc = "TCO 06 Championship Round winnings" 
where payment_detail_id in (select payment_detail_id from payment_detail_xref where payment_id = 76870);


update payment_detail set payment_type_id = 16
where payment_desc = "CCIP";

update payment_detail set payment_desc = "Single Round Match 277 Round 1 winnings" 
where payment_detail_id in (select payment_detail_id from payment_detail_xref where payment_id = 74768);

update payment_detail set payment_desc = "TCO 06 Semifinal Room 1 winnings" 
where payment_detail_id in (65407, 65732, 65403, 65723, 65405, 65730, 65412, 65900, 65415, 65744, 65404, 65724, 65409, 
65734, 65413, 65715, 65414, 65613, 65739, 65408, 65733, 65402, 65716, 65410, 65735, 65411, 65738, 65406, 65731);

update payment_detail set payment_desc = "TCO 06 Semifinal Room 2 winnings" 
where payment_detail_id in (65427, 65780, 65425, 65776, 65418, 65763, 65421, 65767, 65420, 65766, 65422, 65770, 65423,
65775, 65416, 65759, 66512, 65419, 65764, 65417, 65762, 65424, 65609, 65426, 65779);

update payment_detail set payment_desc = "TCO 06 Semifinal Room 3 winnings" 
where payment_detail_id in (65435, 65807, 65808, 65430, 65797, 65432, 65802, 65433, 65804, 65436, 65809, 65441, 65824, 
65438, 65812, 65431, 65798, 65428, 65782, 65429, 65786, 65792, 65796, 65434, 65805, 65439, 65813, 65440, 65814, 65437, 65810);

   
update payment_detail set payment_type_id = 19, component_contest_id = 
(select contest_id from tcs_catalog:contest where contest_name = payment_detail.payment_desc)
where payment_desc in
("TCO06 Design Highest Debut Score", "TCO06 Design Most Passing Submissions",
 "TCO06 Development Highest Debut Score", "TCO06 Development Most Passing Submissions");

update payment_detail set payment_type_id = 19 where payment_desc = "TCO Component Finalist";

update payment_detail set component_contest_id =
	(select contest_id from user_contest_prize_dw, payment_detail_xref pdx, payment p
	where payment_detail.payment_detail_id = pdx.payment_detail_id and
	p.payment_id = pdx.payment_id and 
	user_contest_prize_dw.user_id = p.user_id and prize_payment = payment_detail.gross_amount)
where
payment_type_id = 19 and payment_desc = "TCO Component Finalist";

update payment_detail set payment_desc =
	(select contest_name from tcs_catalog:contest c
	where c.contest_id = payment_detail.component_contest_id) || " contest winnings"
where
payment_type_id = 19 and payment_desc = "TCO Component Finalist";

update payment_detail set algorithm_round_id = 9881 where payment_desc = "Intel Multi-Threading Competition 1" or
payment_desc = "Intel Multi-Threading Competition 1 First Place";
update payment_detail set algorithm_round_id = 9958 where payment_desc = "Intel Multi-Threading Competition 3 Payment";
update payment_detail set algorithm_round_id = 9974 where payment_desc = "Intel Multi-Threading Competition 4";
update payment_detail set algorithm_round_id = 10019 where payment_desc = "Intel Multi-Threading Competition 5";
update payment_detail set algorithm_round_id = 10083 where payment_desc = "Intel Multi-Threading Competition 6";

delete from payment_detail_xref where payment_id = 75433;
delete from payment where payment_id = 75433;
delete from payment_detail where payment_detail_id = 63875;
delete from payment_detail where payment_detail_id = 65915;
delete from payment_detail where payment_detail_id = 65916;

update payment_detail set payment_desc = "2006 TCO Algorithm Winnings" 
where payment_detail_id in (select payment_detail_id from payment_detail_xref where payment_id = 76870);

delete from payment_detail_xref where payment_id between 9475 and 9506;
delete from payment where payment_id between 9475 and 9506;
delete from payment_detail 
where payment_detail_id in (20619, 20620, 20621, 20622, 20623, 20624, 20625, 20626, 20627, 20628, 20713, 20714, 
20715, 20718, 20719, 20721, 20722, 20723, 20724, 20744, 20745, 20746, 20747, 20826, 20831, 20832, 20833, 20834, 20835, 
20836, 20837, 20838, 24014, 24015, 24016, 24017, 24018, 24019, 24020, 24021, 24022, 24023, 24024, 24025, 24026, 24027, 
24028, 24029, 24030, 24031, 24032, 24033, 24034, 24035, 24036, 24037, 24038, 24039, 24040, 24041, 24042, 24043, 24044, 
24045, 50389, 50390, 50391, 50392, 50393, 50394, 50395, 50396, 50397, 50398, 50399, 50400, 50401, 50402, 50403, 50404, 
50405, 50406, 50407, 50408, 50409, 50410, 50411, 50412, 50413, 50414, 50415, 50416, 50417, 50418, 50419, 50420);


update payment_detail set payment_desc = "Single Round Match 312 Round 1 winnings" 
where payment_desc = "Single Round Match 312 winnings";


--- Update almost all rows (long query)
update payment_detail set algorithm_round_id =
( select round_id 
  from contest c, round r 
  where r.round_id not in (4006, 4320, 4496, 4019, 8091, 2003, 2004, 4445, 4374)
  and c.contest_id = r.contest_id and (c.name || " " || r.name || " winnings") like "%" || payment_detail.payment_desc 
)
where payment_type_id = 1 and algorithm_round_id is null;


---- change the view of the referral from referencing the derived payment from the main to referencing the parent payment from the referral.
update payment_detail set parent_payment_id = 
(select p2.payment_id from payment_detail_xref pdx, payment p, payment p2
where payment_detail.payment_detail_id = pdx.payment_detail_id and
p.payment_id = pdx.payment_id and p.payment_id = p2.referral_payment_id
)
where payment_type_id = 4 and parent_payment_id is null


-- change payment_type for intel multi-threading competitions to marathon.
update payment_detail set payment_type_id = 21 where payment_desc like "%Multi-Threading%" and payment_type_id = 1;


-- Charity is incomplete, mark it as deleted so it get regenerated.
update payment_detail set status_id = 69 
where payment_type_id = 5;

-- 2003 TCCC has bad data, mark it as deleted so it get regenerated.
update payment_detail set status_id = 69 
where payment_desc like "%2003 TCCC%" and payment_type_id = 1;

-- 2003 TCCC has bad data, mark it as deleted so it get regenerated.
update payment_detail set status_id = 69 
where payment_desc like "%2003 TCO %" and payment_type_id = 1;


-- 2005 TCCC orphan payment
update payment_detail set status_id = 69 where payment_detail_id in (45949, 45553, 51052);

--  mark all placeholder payments to "deleted"
update payment_detail set status_id = 69 where payment_detail_id in (37492, 45934, 50960);
update payment_detail set status_id = 69 where payment_desc = "Place Holder To Indicate they have a notarized affidavit on file";

update payment_detail set status_id = 69 where payment_type_id = 1 and gross_amount <= 1;
update payment set most_recent_detail_id = null where exists
(select payment_detail_id from payment_detail where payment_detail_id = payment.most_recent_detail_id
and status_id = 69);


--- This is just for the schema fix DB Utility, will be updated back to 22 in the post utility script.
update payment_detail set payment_type_id = 1 where payment_type_id = 22 and status_id <> 69

