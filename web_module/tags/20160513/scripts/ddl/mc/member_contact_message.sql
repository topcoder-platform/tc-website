CREATE TABLE member_contact_message (
    member_contact_message_id DECIMAL(10,0) NOT NULL,
    sender_id DECIMAL(10,0) NOT NULL,
    recipient_id DECIMAL(10,0) NOT NULL,
    message_text TEXT NOT NULL,
    copy_ind DECIMAL(1,0) NOT NULL,
    sent_date DATETIME YEAR TO FRACTION DEFAULT CURRENT NOT NULL
) extent size 50000 next size 50000
lock mode page;

ALTER TABLE member_contact_message ADD CONSTRAINT PRIMARY KEY (member_contact_message_id)
    CONSTRAINT member_contact_message_pk;

ALTER TABLE member_contact_message ADD CONSTRAINT FOREIGN KEY (sender_id)
    REFERENCES coder(coder_id)
    CONSTRAINT member_contact_message_sender_id_fk;

ALTER TABLE member_contact_message ADD CONSTRAINT FOREIGN KEY (recipient_id)
    REFERENCES coder(coder_id)
    CONSTRAINT member_contact_message_recipient_id_fk;