database studio_oltp; 

create table 'informix'.contest_results_mock (
    submitter_id DECIMAL(10,0),
    amount DECIMAL(10,2),
    reg_date DATETIME YEAR TO FRACTION,
    submit_date DATETIME YEAR TO FRACTION,
    submission_id DECIMAL(10,0),
    is_image BOOLEAN,
    height INT,
    width INT,
    placed INT,
    final_score FLOAT,
    prize_type_id DECIMAL(3,0),
    show_submissions LVARCHAR(10),
    require_preview_image LVARCHAR(10),
    require_preview_file LVARCHAR(10),
    contest_channel_id DECIMAL(3,0),
    gallery_image_count INT,
    contest_id DECIMAL(10,0)
)
extent size 64 next size 64
lock mode row;

create table 'informix'.submissions_mock (
    user_id DECIMAL(10,0),
    submission_id DECIMAL(10,0),
    handle_lower NVARCHAR(30),
    is_image BOOLEAN,
    create_date DATETIME YEAR TO FRACTION,
    width INT,
    height INT,
    final_score FLOAT,
    review_status_id DECIMAL(3,0),
    require_preview_image LVARCHAR(10),
    require_preview_file LVARCHAR(10),
    contest_channel_id DECIMAL(3,0),
    gallery_image_count INT,
    contest_id DECIMAL(10,0)
)
extent size 64 next size 64
lock mode row;

