--- update payment type for Algorithm Tournament Prize Payments that are currently under Algorithm Contest Payment

update payment_detail set payment_type_id = 22 where payment_type_id = 1 and
payment_desc not like "%Single Round Match%" 
and payment_desc not like "%SRM%";


-- update some digital run descriptions
update payment_detail set payment_desc = '2006 Stage 1 Digital Run Development Winnings'
where payment_desc = '2006 Leg 1 Digital Run Development Winnings';

update payment_detail set payment_desc = '2006 Stage 1 Digital Run Winnings'
where payment_desc = '2006 Leg 1 Digital Run Winnings';

update payment_detail set payment_desc = 'Digital Run 2006 Stage 1'
where payment_desc = 'Digital Run 2006 Leg 1';


