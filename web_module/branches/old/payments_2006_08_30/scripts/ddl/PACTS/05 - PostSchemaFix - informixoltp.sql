--- update payment type for Algorithm Tournament Prize Payments that are currently under Algorithm Contest Payment

update payment_detail set payment_type_id = 22 where payment_type_id = 1 and
payment_desc not like "%Single Round Match%" 
and payment_desc not like "%SRM%";

