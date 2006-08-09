CREATE TABLE password_recovery (
    password_recovery_id DECIMAL(10,0) NOT NULL,
    user_id DECIMAL(10,0) NOT NULL,
    recovery_address VARCHAR(100),
    expire_date DATETIME YEAR TO FRACTION NOT NULL,
    used_ind DECIMAL(1,0)
);

ALTER TABLE password_recovery add constraint primary key
    (password_recovery_id)
    constraint password_recovery_pkey;

ALTER TABLE password_recovery add constraint foreign key 
    (user_id)
    references coder
    (coder_id) 
    constraint password_recovery_coder_fk;

INSERT INTO id_sequences VALUES('PASSWORD_RECOVERY_SEQ', 1,10,0);

CREATE TABLE secret_question (
    user_id DECIMAL(10,0) NOT NULL,
    question VARCHAR(254) NOT NULL,
    response VARCHAR(254) NOT NULL
);
    

ALTER TABLE secret_question add constraint primary key
    (user_id)
    constraint secret_question_pkey;

ALTER TABLE  secret_question add constraint foreign key 
    (user_id)
    references coder
    (coder_id) 
    constraint secret_question_coder_fk;
