

--common oltp
create table registration_type_lu (
    registration_type_id DECIMAL(3,0),
    registration_type_name VARCHAR(200),
    registration_type_desc LVARCHAR(5000),
    active_ind decimal(1,0) default 1,
    security_group_id decimal(12,0)
)
extent size 16 next size 16
lock mode row;

alter table registration_type_lu add constraint primary key 
	(registration_type_id)
	constraint registrationtypelu_pkey;

alter table registration_type_lu add constraint foreign key 
	(security_group_id)
	references security_groups
	(group_id) 
	constraint regtype_securitygroup_fkey;

insert into registration_type_lu values (1, 'Competition Registration', 'Some long test', 1, 10); 
insert into registration_type_lu values (2, 'Corporate Registration', 'Some long test', 1, 2000116); 
insert into registration_type_lu values (3, 'High School Competition Registration', 'Some long test', 1, 12); 
insert into registration_type_lu values (4, 'Minimal Registration', 'Some long test', 1, 11);
insert into registration_type_lu values (5, 'TopCoder Software Customer Registration', 'Some long test', 1, 2); 


insert into security_groups values (10, 'Competition User', 132456);
insert into security_groups values (11, 'Minimal User', 132456);
insert into security_groups values (12, 'HS Competition User', 132456);

alter table registration_type_lu add sort decimal(3,0); 

update registration_type_lu set sort = 10 where registration_type_id = 1;
update registration_type_lu set sort = 20 where registration_type_id = 3;
update registration_type_lu set sort = 40 where registration_type_id = 2;
update registration_type_lu set sort = 30 where registration_type_id = 5;
update registration_type_lu set sort = 50 where registration_type_id = 4;


update registration_type_lu set registration_type_desc = '<span class="bodySubtitle">TopCoder Competitions</span><br>How do you stand up among your peers?<ul><li><strong>Algorithm Competitions:</strong> The competitions are timed events where all participants compete online to solve the same problems under the same time constraints. The competitions are available in four programming languages - Java, C++, C#, and VB.Net.</li><li><strong>Component Design Competitions:</strong> In the competitions, participants convert a set of requirements into a set of diagrams and a component specification document that is the basis for Component Development Competitions.</li><li><strong>Component Development Competitions:</strong> Participants are tasked with converting a component design, prepared by the winner of the Component Design Competition and reviewed by the Design Review Board, into a functional component.</li><li><strong>Marathon Matches:</strong> The competitions take place over an extended timeline and provide a more flexible competition format that offers different types of problems than what can be offered in the Algorithm Competitions.</li></ul>'
where registration_type_id = 1;

update registration_type_lu set registration_type_desc = '<span class="bodySubtitle">TopCoder High School Competitions</span><br>The competitions are timed events where worldwide secondary school participants compete online to solve the same problems under the same time constraints. The competitions are available in four programming languages - Java, C++, C#, and VB.Net.  Participants can compete either as an individual or as part of a team representing their school.'
where registration_type_id = 3;

update registration_type_lu set registration_type_desc = '<span class="bodySubtitle">TopCoder Software</span><br>Developers from all over the world are competing to build your next application. TopCoder delivers <strong>high-quality software faster</strong> than our competitors.'
where registration_type_id = 5;

update registration_type_lu set registration_type_desc = '<span class="bodySubtitle">Corporate Services</span><br><ul><li><strong>Event Sponsorship:</strong> Our onsite events are large gatherings of proven and recognizable software developers. Whether you want to hire developers at the professional or college level, sponsoring TopCoder tournaments is the most effective way to reach the development community.</li><li><strong>Powered by TopCoder Events:</strong> Whether your company seeks to identify and recruit the best talent or reward and recognize employees, TopCoder can provide a platform to execute online and onsite events.</li><li><strong>Technical Assessment:</strong> TopCoder''s Technical Assessment Tool allows companies to test candidates'' technical abilities during the interview process, thereby reducing the recruiting time incurred by in-house engineers.</li><li><strong>Placement:</strong> TopCoder works with companies to fill both full-time and contract positions. Clients provide us with a description of the position they need filled and we locate the most qualified members.</li></ul>'
where registration_type_id = 2;

update registration_type_lu set registration_type_desc = '<span class="bodySubtitle">Minimal Registration</span><br>Access to only the basic functionality of the TopCoder website, including viewing and posting to the forums, and access to detailed competition statistics.'
where registration_type_id = 4;

--deactivate corp, tcs and minimal
update registration_type_lu set active_ind = 0 where registration_type_id in (2,4,5)