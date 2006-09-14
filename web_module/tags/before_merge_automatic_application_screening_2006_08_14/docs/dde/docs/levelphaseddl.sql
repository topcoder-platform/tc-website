create table COMP_LEVEL_PHASE  (
  LEVEL_ID          DEC(18)                         not null,
  PHASE_ID   DEC(18) NOT NULL,
  PRICE_INCREASE DEC(18,2),
  primary key (LEVEL_ID, PHASE_ID)
      constraint PK_COMP_LEVEL_PHASE
  )
  
insert into comp_level_phase(level_id, phase_id, price_increase)
values(100,112,21);
insert into comp_level_phase(level_id, phase_id, price_increase)
values(200,112,42);
insert into comp_level_phase(level_id, phase_id, price_increase)
values(100,113,19);
insert into comp_level_phase(level_id, phase_id, price_increase)
values(200,113,29);