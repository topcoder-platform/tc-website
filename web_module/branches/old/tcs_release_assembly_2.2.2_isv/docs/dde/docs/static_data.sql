-----------------------------------------------------------
-- Forum
-----------------------------------------------------------
insert into forum_status (status_id, description) values (0, 'Deleted');
insert into forum_status (status_id, description) values (1, 'Active');
insert into forum_status (status_id, description) values (2, 'Closed');

-----------------------------------------------------------
-- Security
-----------------------------------------------------------

-- Default users

insert into security_user (login_id, user_id, password) values (1, 'System', '');
insert into security_user (login_id, user_id, password) values (2, 'Administrator', '');
insert into security_user (login_id, user_id, password) values (3, 'Guest', '');

-- Default groups

insert into security_groups (group_id, description) values (1, 'Administrators');
insert into security_groups (group_id, description) values (2, 'Users');


-- Default roles 

insert into security_roles (role_id, description) values (1, 'Administrator');
insert into security_roles (role_id, description) values (2, 'User');


-- Administrator user and group

insert into user_role_xref (user_role_id, login_id, role_id) values (1,2,1);

insert into user_group_xref (user_group_id, login_id, group_id) values (1,2,1);
insert into user_group_xref (user_group_id, login_id, group_id) values (2,2,2);

insert into group_role_xref (group_role_id, group_id, role_id) values (1,1,1);
insert into group_role_xref (group_role_id, group_id, role_id) values (2,2,2);


-----------------------------------------------------------
-- DDE
-----------------------------------------------------------

-- Global status

insert into status (status_id, description) values (0, 'Deleted');
insert into status (status_id, description) values (1, 'Active');


-- Catalog status

insert into status (status_id, description) values (101, 'Requested');
insert into status (status_id, description) values (102, 'Approved');
insert into status (status_id, description) values (103, 'Duplicate');
insert into status (status_id, description) values (104, 'Declined');

-- User status

insert into status (status_id, description) values (201, 'Pending activation');

--Company Size
insert into company_size (company_size_id, description) values (1, '1-20');

-- Country Code
-- the list of country codes was obtained from FTP://ftp.ripe.net:21/iso3166-countrycodes.txt


insert into country_codes (country_code, description) values (004, 'Afghanistan');
insert into country_codes (country_code, description) values (008, 'Albania');
insert into country_codes (country_code, description) values (012, 'Algeria');
insert into country_codes (country_code, description) values (016, 'American Samoa');
insert into country_codes (country_code, description) values (020, 'Andorra');
insert into country_codes (country_code, description) values (024, 'Angola');
insert into country_codes (country_code, description) values (660, 'Anguilla');
insert into country_codes (country_code, description) values (010, 'Antarctica');
insert into country_codes (country_code, description) values (028, 'Antigua And Barbuda');
insert into country_codes (country_code, description) values (032, 'Argentina');
insert into country_codes (country_code, description) values (051, 'Armenia');
insert into country_codes (country_code, description) values (533, 'Aruba');
insert into country_codes (country_code, description) values (036, 'Australia');
insert into country_codes (country_code, description) values (040, 'Austria');
insert into country_codes (country_code, description) values (031, 'Azerbaijan');
insert into country_codes (country_code, description) values (044, 'Bahamas');
insert into country_codes (country_code, description) values (048, 'Bahrain');
insert into country_codes (country_code, description) values (050, 'Bangladesh');
insert into country_codes (country_code, description) values (052, 'Barbados');
insert into country_codes (country_code, description) values (112, 'Belarus');
insert into country_codes (country_code, description) values (056, 'Belgium');
insert into country_codes (country_code, description) values (084, 'Belize');
insert into country_codes (country_code, description) values (204, 'Benin');
insert into country_codes (country_code, description) values (060, 'Bermuda');
insert into country_codes (country_code, description) values (064, 'Bhutan');
insert into country_codes (country_code, description) values (068, 'Bolivia');
insert into country_codes (country_code, description) values (070, 'Bosnia And Herzegowina');
insert into country_codes (country_code, description) values (072, 'Botswana');
insert into country_codes (country_code, description) values (074, 'Bouvet Island');
insert into country_codes (country_code, description) values (076, 'Brazil');
insert into country_codes (country_code, description) values (086, 'British Indian Ocean Territory');
insert into country_codes (country_code, description) values (096, 'Brunei Darussalam');
insert into country_codes (country_code, description) values (100, 'Bulgaria');
insert into country_codes (country_code, description) values (854, 'Burkina Faso');
insert into country_codes (country_code, description) values (108, 'Burundi');
insert into country_codes (country_code, description) values (116, 'Cambodia');
insert into country_codes (country_code, description) values (120, 'Cameroon');
insert into country_codes (country_code, description) values (124, 'Canada');
insert into country_codes (country_code, description) values (132, 'Cape Verde');
insert into country_codes (country_code, description) values (136, 'Cayman Islands');
insert into country_codes (country_code, description) values (140, 'Central African Republic');
insert into country_codes (country_code, description) values (148, 'Chad');
insert into country_codes (country_code, description) values (152, 'Chile');
insert into country_codes (country_code, description) values (156, 'China');
insert into country_codes (country_code, description) values (162, 'Christmas Island');
insert into country_codes (country_code, description) values (166, 'Cocos (Keeling) Islands');
insert into country_codes (country_code, description) values (170, 'Colombia');
insert into country_codes (country_code, description) values (174, 'Comoros');
insert into country_codes (country_code, description) values (178, 'Congo');
insert into country_codes (country_code, description) values (184, 'Cook Islands');
insert into country_codes (country_code, description) values (188, 'Costa Rica');
insert into country_codes (country_code, description) values (384, 'Cote D''Ivoire');
insert into country_codes (country_code, description) values (191, 'Croatia (Local Name: Hrvatska)');
insert into country_codes (country_code, description) values (192, 'Cuba');
insert into country_codes (country_code, description) values (196, 'Cyprus');
insert into country_codes (country_code, description) values (203, 'Czech Republic');
insert into country_codes (country_code, description) values (208, 'Denmark');
insert into country_codes (country_code, description) values (262, 'Djibouti');
insert into country_codes (country_code, description) values (212, 'Dominica');
insert into country_codes (country_code, description) values (214, 'Dominican Republic');
insert into country_codes (country_code, description) values (626, 'East Timor');
insert into country_codes (country_code, description) values (218, 'Ecuador');
insert into country_codes (country_code, description) values (818, 'Egypt');
insert into country_codes (country_code, description) values (222, 'El Salvador');
insert into country_codes (country_code, description) values (226, 'Equatorial Guinea');
insert into country_codes (country_code, description) values (232, 'Eritrea');
insert into country_codes (country_code, description) values (233, 'Estonia');
insert into country_codes (country_code, description) values (231, 'Ethiopia');
insert into country_codes (country_code, description) values (238, 'Falkland Islands (Malvinas)');
insert into country_codes (country_code, description) values (234, 'Faroe Islands');
insert into country_codes (country_code, description) values (242, 'Fiji');
insert into country_codes (country_code, description) values (246, 'Finland');
insert into country_codes (country_code, description) values (250, 'France');
insert into country_codes (country_code, description) values (249, 'France, Metropolitan');
insert into country_codes (country_code, description) values (254, 'French Guiana');
insert into country_codes (country_code, description) values (258, 'French Polynesia');
insert into country_codes (country_code, description) values (260, 'French Southern Territories');
insert into country_codes (country_code, description) values (266, 'Gabon');
insert into country_codes (country_code, description) values (270, 'Gambia');
insert into country_codes (country_code, description) values (268, 'Georgia');
insert into country_codes (country_code, description) values (276, 'Germany');
insert into country_codes (country_code, description) values (288, 'Ghana');
insert into country_codes (country_code, description) values (292, 'Gibraltar');
insert into country_codes (country_code, description) values (300, 'Greece');
insert into country_codes (country_code, description) values (304, 'Greenland');
insert into country_codes (country_code, description) values (308, 'Grenada');
insert into country_codes (country_code, description) values (312, 'Guadeloupe');
insert into country_codes (country_code, description) values (316, 'Guam');
insert into country_codes (country_code, description) values (320, 'Guatemala');
insert into country_codes (country_code, description) values (324, 'Guinea');
insert into country_codes (country_code, description) values (624, 'Guinea-Bissau');
insert into country_codes (country_code, description) values (328, 'Guyana');
insert into country_codes (country_code, description) values (332, 'Haiti');
insert into country_codes (country_code, description) values (334, 'Heard And Mc Donald Islands');
insert into country_codes (country_code, description) values (340, 'Honduras');
insert into country_codes (country_code, description) values (344, 'Hong Kong');
insert into country_codes (country_code, description) values (348, 'Hungary');
insert into country_codes (country_code, description) values (352, 'Iceland');
insert into country_codes (country_code, description) values (356, 'India');
insert into country_codes (country_code, description) values (360, 'Indonesia');
insert into country_codes (country_code, description) values (364, 'Iran (Islamic Republic Of)');
insert into country_codes (country_code, description) values (368, 'Iraq');
insert into country_codes (country_code, description) values (372, 'Ireland');
insert into country_codes (country_code, description) values (376, 'Israel');
insert into country_codes (country_code, description) values (380, 'Italy');
insert into country_codes (country_code, description) values (388, 'Jamaica');
insert into country_codes (country_code, description) values (392, 'Japan');
insert into country_codes (country_code, description) values (400, 'Jordan');
insert into country_codes (country_code, description) values (398, 'Kazakhstan');
insert into country_codes (country_code, description) values (404, 'Kenya');
insert into country_codes (country_code, description) values (296, 'Kiribati');
insert into country_codes (country_code, description) values (408, 'Korea, Democratic People''s Republic Of');
insert into country_codes (country_code, description) values (410, 'Korea, Republic Of');
insert into country_codes (country_code, description) values (414, 'Kuwait');
insert into country_codes (country_code, description) values (417, 'Kyrgyzstan');
insert into country_codes (country_code, description) values (418, 'Lao People''s Democratic Republic');
insert into country_codes (country_code, description) values (428, 'Latvia');
insert into country_codes (country_code, description) values (422, 'Lebanon');
insert into country_codes (country_code, description) values (426, 'Lesotho');
insert into country_codes (country_code, description) values (430, 'Liberia');
insert into country_codes (country_code, description) values (434, 'Libyan Arab Jamahiriya');
insert into country_codes (country_code, description) values (438, 'Liechtenstein');
insert into country_codes (country_code, description) values (440, 'Lithuania');
insert into country_codes (country_code, description) values (442, 'Luxembourg');
insert into country_codes (country_code, description) values (446, 'Macau');
insert into country_codes (country_code, description) values (807, 'Macedonia, The Former Yugoslav Republic Of');
insert into country_codes (country_code, description) values (450, 'Madagascar');
insert into country_codes (country_code, description) values (454, 'Malawi');
insert into country_codes (country_code, description) values (458, 'Malaysia');
insert into country_codes (country_code, description) values (462, 'Maldives');
insert into country_codes (country_code, description) values (466, 'Mali');
insert into country_codes (country_code, description) values (470, 'Malta');
insert into country_codes (country_code, description) values (584, 'Marshall Islands');
insert into country_codes (country_code, description) values (474, 'Martinique');
insert into country_codes (country_code, description) values (478, 'Mauritania');
insert into country_codes (country_code, description) values (480, 'Mauritius');
insert into country_codes (country_code, description) values (175, 'Mayotte');
insert into country_codes (country_code, description) values (484, 'Mexico');
insert into country_codes (country_code, description) values (583, 'Micronesia, Federated States Of');
insert into country_codes (country_code, description) values (498, 'Moldova, Republic Of');
insert into country_codes (country_code, description) values (492, 'Monaco');
insert into country_codes (country_code, description) values (496, 'Mongolia');
insert into country_codes (country_code, description) values (500, 'Montserrat');
insert into country_codes (country_code, description) values (504, 'Morocco');
insert into country_codes (country_code, description) values (508, 'Mozambique');
insert into country_codes (country_code, description) values (104, 'Myanmar');
insert into country_codes (country_code, description) values (516, 'Namibia');
insert into country_codes (country_code, description) values (520, 'Nauru');
insert into country_codes (country_code, description) values (524, 'Nepal');
insert into country_codes (country_code, description) values (528, 'Netherlands');
insert into country_codes (country_code, description) values (530, 'Netherlands Antilles');
insert into country_codes (country_code, description) values (540, 'New Caledonia');
insert into country_codes (country_code, description) values (554, 'New Zealand');
insert into country_codes (country_code, description) values (558, 'Nicaragua');
insert into country_codes (country_code, description) values (562, 'Niger');
insert into country_codes (country_code, description) values (566, 'Nigeria');
insert into country_codes (country_code, description) values (570, 'Niue');
insert into country_codes (country_code, description) values (574, 'Norfolk Island');
insert into country_codes (country_code, description) values (580, 'Northern Mariana Islands');
insert into country_codes (country_code, description) values (578, 'Norway');
insert into country_codes (country_code, description) values (512, 'Oman');
insert into country_codes (country_code, description) values (586, 'Pakistan');
insert into country_codes (country_code, description) values (585, 'Palau');
insert into country_codes (country_code, description) values (591, 'Panama');
insert into country_codes (country_code, description) values (598, 'Papua New Guinea');
insert into country_codes (country_code, description) values (600, 'Paraguay');
insert into country_codes (country_code, description) values (604, 'Peru');
insert into country_codes (country_code, description) values (608, 'Philippines');
insert into country_codes (country_code, description) values (612, 'Pitcairn');
insert into country_codes (country_code, description) values (616, 'Poland');
insert into country_codes (country_code, description) values (620, 'Portugal');
insert into country_codes (country_code, description) values (630, 'Puerto Rico');
insert into country_codes (country_code, description) values (634, 'Qatar');
insert into country_codes (country_code, description) values (638, 'Reunion');
insert into country_codes (country_code, description) values (642, 'Romania');
insert into country_codes (country_code, description) values (643, 'Russian Federation');
insert into country_codes (country_code, description) values (646, 'Rwanda');
insert into country_codes (country_code, description) values (659, 'Saint Kitts And Nevis');
insert into country_codes (country_code, description) values (662, 'Saint Lucia');
insert into country_codes (country_code, description) values (670, 'Saint Vincent And The Grenadines');
insert into country_codes (country_code, description) values (882, 'Samoa');
insert into country_codes (country_code, description) values (674, 'San Marino');
insert into country_codes (country_code, description) values (678, 'Sao Tome And Principe');
insert into country_codes (country_code, description) values (682, 'Saudi Arabia');
insert into country_codes (country_code, description) values (686, 'Senegal');
insert into country_codes (country_code, description) values (690, 'Seychelles');
insert into country_codes (country_code, description) values (694, 'Sierra Leone');
insert into country_codes (country_code, description) values (702, 'Singapore');
insert into country_codes (country_code, description) values (703, 'Slovakia (Slovak Republic)');
insert into country_codes (country_code, description) values (705, 'Slovenia');
insert into country_codes (country_code, description) values (090, 'Solomon Islands');
insert into country_codes (country_code, description) values (706, 'Somalia');
insert into country_codes (country_code, description) values (710, 'South Africa');
insert into country_codes (country_code, description) values (239, 'South Georgia And The South Sandwich Islands');
insert into country_codes (country_code, description) values (724, 'Spain');
insert into country_codes (country_code, description) values (144, 'Sri Lanka');
insert into country_codes (country_code, description) values (654, 'St. Helena');
insert into country_codes (country_code, description) values (666, 'St. Pierre And Miquelon');
insert into country_codes (country_code, description) values (736, 'Sudan');
insert into country_codes (country_code, description) values (740, 'Suriname');
insert into country_codes (country_code, description) values (744, 'Svalbard And Jan Mayen Islands');
insert into country_codes (country_code, description) values (748, 'Swaziland');
insert into country_codes (country_code, description) values (752, 'Sweden');
insert into country_codes (country_code, description) values (756, 'Switzerland');
insert into country_codes (country_code, description) values (760, 'Syrian Arab Republic');
insert into country_codes (country_code, description) values (158, 'Taiwan, Province Of China');
insert into country_codes (country_code, description) values (762, 'Tajikistan');
insert into country_codes (country_code, description) values (834, 'Tanzania, United Republic Of');
insert into country_codes (country_code, description) values (764, 'Thailand');
insert into country_codes (country_code, description) values (768, 'Togo');
insert into country_codes (country_code, description) values (772, 'Tokelau');
insert into country_codes (country_code, description) values (776, 'Tonga');
insert into country_codes (country_code, description) values (780, 'Trinidad And Tobago');
insert into country_codes (country_code, description) values (788, 'Tunisia');
insert into country_codes (country_code, description) values (792, 'Turkey');
insert into country_codes (country_code, description) values (795, 'Turkmenistan');
insert into country_codes (country_code, description) values (796, 'Turks And Caicos Islands');
insert into country_codes (country_code, description) values (798, 'Tuvalu');
insert into country_codes (country_code, description) values (800, 'Uganda');
insert into country_codes (country_code, description) values (804, 'Ukraine');
insert into country_codes (country_code, description) values (784, 'United Arab Emirates');
insert into country_codes (country_code, description) values (826, 'United Kingdom');
insert into country_codes (country_code, description) values (840, 'United States');
insert into country_codes (country_code, description) values (581, 'United States Minor Outlying Islands');
insert into country_codes (country_code, description) values (858, 'Uruguay');
insert into country_codes (country_code, description) values (860, 'Uzbekistan');
insert into country_codes (country_code, description) values (548, 'Vanuatu');
insert into country_codes (country_code, description) values (336, 'Vatican City State (Holy See)');
insert into country_codes (country_code, description) values (862, 'Venezuela');
insert into country_codes (country_code, description) values (704, 'Viet Nam');
insert into country_codes (country_code, description) values (092, 'Virgin Islands (British)');
insert into country_codes (country_code, description) values (850, 'Virgin Islands (U.S.)');
insert into country_codes (country_code, description) values (876, 'Wallis And Futuna Islands');
insert into country_codes (country_code, description) values (732, 'Western Sahara');
insert into country_codes (country_code, description) values (887, 'Yemen');
insert into country_codes (country_code, description) values (891, 'Yugoslavia');
insert into country_codes (country_code, description) values (180, 'Zaire');
insert into country_codes (country_code, description) values (894, 'Zambia');
insert into country_codes (country_code, description) values (716, 'Zimbabwe');


-- Catalog Phase

insert into phase (phase_id, description) values (111, 'Collaboration');
insert into phase (phase_id, description) values (112, 'Specification');
insert into phase (phase_id, description) values (113, 'Development');
insert into phase (phase_id, description) values (114, 'Completed');


-- Catalog Doc types

insert into doc_types (document_type_id, description, status_id) values (1, 'Component Specification', 1);
insert into doc_types (document_type_id, description, status_id) values (2, 'Use Case Diagrams', 1);
insert into doc_types (document_type_id, description, status_id) values (3, 'Class Diagrams', 1);
insert into doc_types (document_type_id, description, status_id) values (4, 'QA Test Plans', 1);
insert into doc_types (document_type_id, description, status_id) values (5, 'Deployment Plans', 1);
insert into doc_types (document_type_id, description, status_id) values (6, 'Other (misc. documents)', 1);
insert into doc_types (document_type_id, description, status_id) values (7, 'Specification Forum Documents', 1);
insert into doc_types (document_type_id, description, status_id) values (8, 'Screen Shots', 1);
insert into doc_types (document_type_id, description, status_id) values (9, 'Screen Shots Thumbnail', 1);


-- Price Tiers

insert into price_tiers (tier_id, discount_percent) values (1,5);
insert into price_tiers (tier_id, discount_percent) values (2,10);
insert into price_tiers (tier_id, discount_percent) values (3,15);
insert into price_tiers (tier_id, discount_percent) values (4,20);
insert into price_tiers (tier_id, discount_percent) values (5,25);
insert into price_tiers (tier_id, discount_percent) values (6,30);
insert into price_tiers (tier_id, discount_percent) values (7,35);
insert into price_tiers (tier_id, discount_percent) values (8,40);
insert into price_tiers (tier_id, discount_percent) values (9,45);
insert into price_tiers (tier_id, discount_percent) values (10,50);

-- Component Requestor

insert into roles (role_id, role_name, description, status_id) values (1,'REQUESTOR', 'User that requested a components creation', 1);
insert into roles (role_id, role_name, description, status_id) values (2,'ARCHITECT', 'Project Architect', 1);
insert into roles (role_id, role_name, description, status_id) values (3,'DEVELOPER', 'Project Developer', 1);
insert into roles (role_id, role_name, description, status_id) values (4,'QA DEVELOPER', 'Porject Quality Assurance Developer', 1);


-- License Levels

insert into license_level (license_level_id, price_multiplier, description, status_id) values (1, 1.0, '1-6 CPUs', 1);
insert into license_level (license_level_id, price_multiplier, description, status_id) values (2, 1.4, '7-24 CPUs', 1);
insert into license_level (license_level_id, price_multiplier, description, status_id) values (3, 1.9, 'over 24 CPUs', 1);
