CREATE TABLE member_contact_black_list (
    user_id DECIMAL(10,0) NOT NULL,
    blocked_user_id DECIMAL(10,0) NOT NULL,
    blocked_ind DECIMAL(1,0) NOT NULL,
    create_date DATETIME YEAR TO FRACTION DEFAULT CURRENT,
    modify_date DATETIME YEAR TO FRACTION DEFAULT CURRENT
) extent size 512 next size 512
lock mode page;

ALTER TABLE member_contact_black_list ADD CONSTRAINT PRIMARY KEY (user_id, blocked_user_id)
    CONSTRAINT member_contact_black_list_pk;

ALTER TABLE member_contact_black_list ADD CONSTRAINT FOREIGN KEY (user_id)
    REFERENCES coder(coder_id)
    CONSTRAINT member_contact_black_list_user_id_fk;

ALTER TABLE member_contact_black_list ADD CONSTRAINT FOREIGN KEY (blocked_user_id)
    REFERENCES coder(coder_id)
    CONSTRAINT member_contact_black_list_blocked_user_id_fk;