CREATE TABLE studio_oltp:electronic_affirmation (
	submission_id decimal(10) NOT NULL,
	create_time datetime DEFAULT current NOT NULL,
	PRIMARY KEY (submission_id)
);

ALTER TABLE studio_oltp:electronic_affirmation
	ADD CONSTRAINT FOREIGN KEY (submission_id) 
	REFERENCES studio_oltp:informix.submission (submission_id);
	
ALTER TABLE informixoltp:payment ADD has_global_ad boolean;