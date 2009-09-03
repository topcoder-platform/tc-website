database studio_oltp;

-- new provided schema for this assembly

CREATE TABLE contest_milestone_prize (
  contest_milestone_prize_id DECIMAL(10,0) NOT NULL,
  prize_type_id DECIMAL(3,0) NOT NULL,
  amount DECIMAL(10,2),
  number_of_submissions SMALLINT,
  create_date DATETIME YEAR to FRACTION(3) NOT Null,
  primary key (contest_milestone_prize_id)  constraint milestone_prize_pk
);

CREATE TABLE contest_multi_round_information (
  contest_multi_round_information_id DECIMAL(10,0) NOT NULL,
  milestone_date DATETIME YEAR to FRACTION(3),
  submitters_locked_between_rounds boolean(1),
  round_one_introduction LVARCHAR(2000),
  round_two_introduction LVARCHAR(2000),
  primary key (contest_multi_round_information_id)  constraint multi_round_information_pk
);


alter table contest add (contest_milestone_prize_id DECIMAL(10,0)  );
alter table contest add (is_multi_round boolean(1));
alter table contest add (contest_multi_round_information_id DECIMAL(10,0)  );

ALTER TABLE contest
        ADD CONSTRAINT ( FOREIGN KEY(contest_milestone_prize_id)
        REFERENCES contest_milestone_prize(contest_milestone_prize_id) CONSTRAINT contest_milestone_prize_fk )
;

ALTER TABLE contest
        ADD CONSTRAINT ( FOREIGN KEY(contest_multi_round_information_id)
        REFERENCES contest_multi_round_information(contest_multi_round_information_id) CONSTRAINT contest_multi_round_fk )
;

ALTER TABLE contest_milestone_prize
        ADD CONSTRAINT ( FOREIGN KEY(prize_type_id)
        REFERENCES prize_type_lu(prize_type_id) CONSTRAINT contest_milstone_prize_prize_type_lu_fk )
;

-- add new prize type for milestone prizes
insert into prize_type_lu values (3, "Milestone");
