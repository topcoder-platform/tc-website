

-- Catalog Technology types (initial list)

insert into technology_types (technology_type_id,technology_name,description,status_id) values (1,'J2EE','Java 2 Enterprise Edition',1);
insert into technology_types (technology_type_id,technology_name,description,status_id) values (2,'Java','Java programming language',1);
insert into technology_types (technology_type_id,technology_name,description,status_id) values (3,'JavaBean','JavaBean',1);
insert into technology_types (technology_type_id,technology_name,description,status_id) values (4,'EJB','Enterprise Java Beans',1);
insert into technology_types (technology_type_id,technology_name,description,status_id) values (5,'JSP','Java ServerPages',1);
insert into technology_types (technology_type_id,technology_name,description,status_id) values (6,'Servlet','Java Servlet technology',1);
insert into technology_types (technology_type_id,technology_name,description,status_id) values (7,'Applet','Java Applets',1);
insert into technology_types (technology_type_id,technology_name,description,status_id) values (8,'Java Application','Java Applications',1);
insert into technology_types (technology_type_id,technology_name,description,status_id) values (9,'JMS','Java Messaging Service',1);
insert into technology_types (technology_type_id,technology_name,description,status_id) values (10,'Web Services','Web Services',1);
insert into technology_types (technology_type_id,technology_name,description,status_id) values (11,'.NET','Microsoft .NET Framework',1);
insert into technology_types (technology_type_id,technology_name,description,status_id) values (12,'VB','Microsoft Visual Basic programming language',1);
insert into technology_types (technology_type_id,technology_name,description,status_id) values (13,'C++','C++ programming language',1);
insert into technology_types (technology_type_id,technology_name,description,status_id) values (14,'COM','Microsoft Component Object Model',1);


-- Catalog Categories (initial list)

insert into categories (category_id,parent_category_id,category_name,description,status_id) values (1,null,'Infrastructure','Infrastructure category description.  Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua',1);
insert into categories (category_id,parent_category_id,category_name,description,status_id) values (2,null,'Consumer Products','Consumer Products category description.  Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua',1);
insert into categories (category_id,parent_category_id,category_name,description,status_id) values (3,null,'Financial Services','Financial Services category description.  Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua',1);
insert into categories (category_id,parent_category_id,category_name,description,status_id) values (4,null,'Life Sciences','Life Sciences category description.  Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua',1);
insert into categories (category_id,parent_category_id,category_name,description,status_id) values (5,null,'Retail','Retail category description.  Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua',1);
insert into categories (category_id,parent_category_id,category_name,description,status_id) values (10,1,'Application Management','Application Management category description.  Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua',1);
insert into categories (category_id,parent_category_id,category_name,description,status_id) values (11,1,'Communication','Communication category description.  Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua',1);
insert into categories (category_id,parent_category_id,category_name,description,status_id) values (12,1,'Data Management','Data Management category description.  Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua',1);
insert into categories (category_id,parent_category_id,category_name,description,status_id) values (13,1,'Date/Time Management','Date/Time Management category description.  Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua',1);
insert into categories (category_id,parent_category_id,category_name,description,status_id) values (14,1,'Developer Tools','Developer Tools category description.  Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua',1);
insert into categories (category_id,parent_category_id,category_name,description,status_id) values (15,1,'Document Management','Document Management category description.  Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua',1);
insert into categories (category_id,parent_category_id,category_name,description,status_id) values (16,1,'Work Flow Management','Work Flow Management category description.  Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua',1);


-- Components

insert into comp_catalog (component_id, current_version, component_name, short_desc, description, function_desc, create_time, status_id) values (
        1, 
        1, 
        'Configuration Manager', 
        'Configuration Manager component', 
        'Software applications typically manage application level configuration details in "properties" or "ini" files. In the case of large applications or applications composed of distinct software components, there may be numerous configuration files each bound to a particular functional component. The purpose of the Configuration Manager is to centralize the management of, and access to, these files.',
        '- Automates the reading and loading of configuration files - Implements a system wide caching strategy of configuration details that limits performance bottlenecks - Provides a common interface for accessing and updating application properties',
        '2002-08-25 20:51:03.0',
        1);
insert into comp_versions (comp_vers_id, component_id, version, version_text, create_time, phase_id, phase_time, price, comments) values (
        1, 1, 1, '1.0', '2002-08-25 20:51:03.0', 114, '2002-08-25 20:51:03.0', 0, '');
insert into comp_versions (comp_vers_id, component_id, version, version_text, create_time, phase_id, phase_time, price, comments) values (
        2, 1, 2, '2.0', '2002-08-25 20:51:03.0', 111, '2002-08-25 20:51:03.0', 0, '');
insert into comp_categories (comp_categories_id,component_id,category_id) values (1,1,10);
insert into comp_technology (comp_tech_id, comp_vers_id, technology_type_id) values (1,1,1);

      
insert into comp_catalog (component_id, current_version, component_name, short_desc, description, function_desc, create_time, status_id) values (
        2, 
        1,
        'Security Manager', 
        'Security Manager component', 
        'Most applications require authentication and user security to restrict access to data or use of functionality. There are many commonalities in the functionality required by these various applications. The purpose of the Security Manager is to provide a reusable set of functionality that encompasses these needs.', 
        '- Implements user security - Implements group security - Restricts data access based on user or group constraints - Restricts application functionality based on user or group constraints - Implements roles which assign functionality to a user on an application specific level',
        '2002-08-25 20:51:03.0',
        1);
insert into comp_versions (comp_vers_id, component_id, version, version_text, create_time, phase_id, phase_time, price, comments) values (
        3, 2, 1, '1.0', '2002-08-25 20:51:03.0', 114, '2002-08-25 20:51:03.0', 0, '');
insert into comp_versions (comp_vers_id, component_id, version, version_text, create_time, phase_id, phase_time, price, comments) values (
        4, 2, 2, '2.0', '2002-08-25 20:51:03.0', 111, '2002-08-25 20:51:03.0', 0, '');
insert into comp_categories (comp_categories_id,component_id,category_id) values (2,2,10);
insert into comp_technology (comp_tech_id, comp_vers_id, technology_type_id) values (2,2,1);

      
insert into comp_catalog (component_id, current_version, component_name, short_desc, description, function_desc, create_time, status_id) values (
        3, 
        1,
        'Calendar', 
        'Calendar component', 
        'The calendar component provides applications a single point of control for calendar management. Its functionality extends from displaying a simple "pop-up" calendar that simplifies date selection on web-based forms, to displaying a complex calendar complete with customized content, "look and feel" and hyperlinks.', 
        '- Provides a single source of control for holiday management and calendar display - Provides an interface to easily populate dates on web-based forms - Allows configuration of date content on a past, present and future basis - Enables configuration of a specific date''s "look and feel" - Enables one-time setup of recurring dates, such as holidays - Provides the ability to configure the default "look and feel" for calendar dates and empty or blank cells - Supports both relational databases and XML files to store calendar data - Provides an HTML-based administration tool',
        '2002-08-25 20:51:03.0',
        1);
insert into comp_versions (comp_vers_id, component_id, version, version_text, create_time, phase_id, phase_time, price, comments) values (
        5, 3, 1, '1.0', '2002-08-25 20:51:03.0', 114, '2002-08-25 20:51:03.0', 0, '');
insert into comp_versions (comp_vers_id, component_id, version, version_text, create_time, phase_id, phase_time, price, comments) values (
        6, 3, 2, '2.0', '2002-08-25 20:51:03.0', 111, '2002-08-25 20:51:03.0', 0, '');
insert into comp_categories (comp_categories_id,component_id,category_id) values (3,3,13);
insert into comp_technology (comp_tech_id, comp_vers_id, technology_type_id) values (3,3,1);
        
        
insert into comp_catalog (component_id, current_version, component_name, short_desc, description, function_desc, create_time, status_id) values (
        4, 
        1,
        'Event Engine', 
        'Event Engine component', 
        'The Event Engine component is an event driven service that manages the triggering of events based on the receiving of alerts. The Event Engine works with three plugable services: the registry handler, the alert handler and the event handler. The registry handler is used by the Event Engine to map alert handlers to event handlers. When a specific alert is received a specific event will be triggered. An alert handler is responsible for notifying the Event Engine when a specific event takes place. An event handler performs a specific function when its corresponding alert is received. The event engine manages the entire process.', 
        '- Alert Handlers can set polling times for the Event Engine - Alert and Event handlers are created by implementing a Java Interface - The Event Engine dynamically deploys classes so that alerts and events can be implemented on the fly',
        '2002-08-25 20:51:03.0',
        1);
insert into comp_versions (comp_vers_id, component_id, version, version_text, create_time, phase_id, phase_time, price, comments) values (
        7, 4, 1, '1.0', '2002-08-25 20:51:03.0', 114, '2002-08-25 20:51:03.0', 0, '');
insert into comp_versions (comp_vers_id, component_id, version, version_text, create_time, phase_id, phase_time, price, comments) values (
        8, 4, 2, '2.0', '2002-08-25 20:51:03.0', 111, '2002-08-25 20:51:03.0', 0, '');
insert into comp_categories (comp_categories_id,component_id,category_id) values (4,4,16);
insert into comp_technology (comp_tech_id, comp_vers_id, technology_type_id) values (4,4,1);


insert into comp_catalog (component_id, current_version, component_name, short_desc, description, function_desc, create_time, status_id) values (
        5, 
        1,
        'Rules Engine', 
        'Rules Engine component', 
        'The Rules Engine satisfies the need of a business to centralize business logic in a core system and provide a certain amount of flexibility when it comes to changing that logic. Staff has the ability to alter the business logic at runtime without having a negative impact on the system. The Rules Engine takes input in the form of Rules, Conditions and Expressions.', 
        '- Ability to set variables/conditions that will affect the values of other variables/conditions and perhaps trigger the execution of a rule - Ability to retrieve the values of certain variables/conditions based on other variables/conditions unknown to the caller - Ability to evaluate rules in real-time and run code if the conditions are appropriate - Ability to re-evaluate those rules based on changing conditions - Ability to re-evaluate those rules at dynamic or static intervals - Provides a User Interface with the ability to manipulate the Rules and Conditions',
        '2002-08-25 20:51:03.0',
        1);
insert into comp_versions (comp_vers_id, component_id, version, version_text, create_time, phase_id, phase_time, price, comments) values (
        9, 5, 1, '1.0', '2002-08-25 20:51:03.0', 114, '2002-08-25 20:51:03.0', 0, '');
insert into comp_versions (comp_vers_id, component_id, version, version_text, create_time, phase_id, phase_time, price, comments) values (
        10, 5, 2, '2.0', '2002-08-25 20:51:03.0', 111, '2002-08-25 20:51:03.0', 0, '');
insert into comp_categories (comp_categories_id,component_id,category_id) values (5,5,16);
insert into comp_technology (comp_tech_id, comp_vers_id, technology_type_id) values (5,5,1);


insert into comp_catalog (component_id, current_version, component_name, short_desc, description, function_desc, create_time, status_id) values (
        6, 
        1,
        'Email Engine', 
        'Email Engine component', 
        'The Email Engine component provides basic and advanced email functionality through Java API''s. It is not a GUI-based component such as Outlook Express or Yahoo Mail that manages user email accounts. Rather, the Email Engine is a set of Java API''s that enables a developer to send emails directly from application code.', 
        '- Supports one or more primary (TO), carbon copy (CC) and blind carbon copy (BCC) recipients - Supports regarding (RE) and subject lines - Supports file attachment capabilities',
        '2002-08-25 20:51:03.0',
        1);
insert into comp_versions (comp_vers_id, component_id, version, version_text, create_time, phase_id, phase_time, price, comments) values (
        11, 6, 1, '1.0', '2002-08-25 20:51:03.0', 114, '2002-08-25 20:51:03.0', 0, '');
insert into comp_versions (comp_vers_id, component_id, version, version_text, create_time, phase_id, phase_time, price, comments) values (
        12, 6, 2, '2.0', '2002-08-25 20:51:03.0', 111, '2002-08-25 20:51:03.0', 0, '');
insert into comp_categories (comp_categories_id,component_id,category_id) values (6,6,11);
insert into comp_technology (comp_tech_id, comp_vers_id, technology_type_id) values (6,6,1);



insert into comp_catalog (component_id, current_version, component_name, short_desc, description, function_desc, create_time, status_id) values (
        7, 
        1,
        'File Upload', 
        'File Upload component', 
        'The File Upload component supports web-based file uploads. Files are received via HTTP requests. Applications implementing the component have the ability to store uploaded files on the file system or are given access to the file to enable storage in a database.', 
        '- Accepts HTTP request objects - Parses Multipart data and persists files to the file system - Maximum file size and file storage location is configurable per request - All configurable parameters for the File Upload component are managed in an XML file - Provides client access to uploaded documents and html form elements',
        '2002-08-25 20:51:03.0',
        1);
insert into comp_versions (comp_vers_id, component_id, version, version_text, create_time, phase_id, phase_time, price, comments) values (
        13, 7, 1, '1.0', '2002-08-25 20:51:03.0', 114, '2002-08-25 20:51:03.0', 0, '');
insert into comp_versions (comp_vers_id, component_id, version, version_text, create_time, phase_id, phase_time, price, comments) values (
        14, 7, 2, '2.0', '2002-08-25 20:51:03.0', 111, '2002-08-25 20:51:03.0', 0, '');
insert into comp_categories (comp_categories_id,component_id,category_id) values (7,7,11);
insert into comp_technology (comp_tech_id, comp_vers_id, technology_type_id) values (7,7,1);


insert into comp_catalog (component_id, current_version, component_name, short_desc, description, function_desc, create_time, status_id) values (
        8, 
        1,
        'Forum', 
        'Forum component', 
        'Forums provide collaborative functionality similar to Internet newsgroups. Users post messages to the forum. Posts are viewable by anyone who has access to that specific forum. Authenticated users can then read the messages and reply to ones where they might have input or questions.', 
        '- Handles three levels of hierarchy for Forum threads: Topic, Sub-Topic and Message - Provides keyword search functionality - Provides ability to attach files to messages - Provides ability to edit and delete existing messages - Provides ability to schedule the creation and termination forum sessions',
        '2002-08-25 20:51:03.0',
        1);
insert into comp_versions (comp_vers_id, component_id, version, version_text, create_time, phase_id, phase_time, price, comments) values (
        15, 8, 1, '1.0', '2002-08-25 20:51:03.0', 114, '2002-08-25 20:51:03.0', 0, '');
insert into comp_versions (comp_vers_id, component_id, version, version_text, create_time, phase_id, phase_time, price, comments) values (
        16, 8, 2, '2.0', '2002-08-25 20:51:03.0', 111, '2002-08-25 20:51:03.0', 0, '');
insert into comp_categories (comp_categories_id,component_id,category_id) values (8,8,11);
insert into comp_technology (comp_tech_id, comp_vers_id, technology_type_id) values (8,8,1);


insert into comp_catalog (component_id, current_version, component_name, short_desc, description, function_desc, create_time, status_id) values (
        9, 
        1,
        'Notification', 
        'Notification component', 
        'The Notification Component Assembly is an implementation of an event driven service that manages user and system messages. It is responsible for scheduling, sending and tracking email messages. The Notification component implements an Alert Handler and an Event Handler for the TopCoder Software Event Engine. The Alert Handler polls a database searching for messages that trigger the event. The Event Handler implements the TopCoder Software Email engine to send the appropriate email.', 
        '- Interfaces with an existing TCSEmail component to send emails when alerted - Provides an interface for clients to access messages - Provides the ability to trigger events other than TCSEmail - Implements and integrates four existing TopCoder Software components',
        '2002-08-25 20:51:03.0',
        1);
insert into comp_versions (comp_vers_id, component_id, version, version_text, create_time, phase_id, phase_time, price, comments) values (
        17, 9, 1, '1.0', '2002-08-25 20:51:03.0', 114, '2002-08-25 20:51:03.0', 0, '');
insert into comp_versions (comp_vers_id, component_id, version, version_text, create_time, phase_id, phase_time, price, comments) values (
        18, 9, 2, '2.0', '2002-08-25 20:51:03.0', 111, '2002-08-25 20:51:03.0', 0, '');
insert into comp_categories (comp_categories_id,component_id,category_id) values (9,9,11);
insert into comp_technology (comp_tech_id, comp_vers_id, technology_type_id) values (9,9,1);


insert into comp_catalog (component_id, current_version, component_name, short_desc, description, function_desc, create_time, status_id) values (
        10, 
        1,
        'Dependency Map', 
        'Dependency Map component', 
        'The Dependency Map is a component that applications will use to track event dependencies and execute functionality based on changes in those dependencies. There are two types of items that can be put in the dependency map: Dependencies and Executables. A dependency is the state of an object that can change causing executables higher up in the dependency tree to be employed.', 
        '- Ability to add new dependencies and executables - Ability to modify existing dependencies and executables. - Traverses the dependency graph and executes all applicable executables when a dependency is triggered',
        '2002-08-25 20:51:03.0',
        1);
insert into comp_versions (comp_vers_id, component_id, version, version_text, create_time, phase_id, phase_time, price, comments) values (
        19, 10, 1, '1.0', '2002-08-25 20:51:03.0', 114, '2002-08-25 20:51:03.0', 0, '');
insert into comp_versions (comp_vers_id, component_id, version, version_text, create_time, phase_id, phase_time, price, comments) values (
        20, 10, 2, '2.0', '2002-08-25 20:51:03.0', 111, '2002-08-25 20:51:03.0', 0, '');
insert into comp_categories (comp_categories_id,component_id,category_id) values (10,10,14);
insert into comp_technology (comp_tech_id, comp_vers_id, technology_type_id) values (10,10,1);


insert into comp_catalog (component_id, current_version, component_name, short_desc, description, function_desc, create_time, status_id) values (
        11, 
        1,
        'Standard Editor', 
        'Standard Editor component', 
        'The standard editor component provides basic file editing functionality. Encapsulating this functionality in a component allows other software components and applications to seamlessly utilize text-editing functionality.', 
        '- Can be used inside of a Java Applet or Application - Contains standard edit, cut, copy, and paste functionality - Functionality is customizable within the editor',
        '2002-08-25 20:51:03.0',
        1);
insert into comp_versions (comp_vers_id, component_id, version, version_text, create_time, phase_id, phase_time, price, comments) values (
        21, 11, 1, '1.0', '2002-08-25 20:51:03.0', 114, '2002-08-25 20:51:03.0', 0, '');
insert into comp_versions (comp_vers_id, component_id, version, version_text, create_time, phase_id, phase_time, price, comments) values (
        22, 11, 2, '2.0', '2002-08-25 20:51:03.0', 111, '2002-08-25 20:51:03.0', 0, '');
insert into comp_categories (comp_categories_id,component_id,category_id) values (11,11,12);
insert into comp_technology (comp_tech_id, comp_vers_id, technology_type_id) values (11,11,1);


insert into comp_catalog (component_id, current_version, component_name, short_desc, description, function_desc, create_time, status_id) values (
        12, 
        1,
        'Document Generator', 
        'Document Generator component', 
        'The Document Generation component provides the functionality to enable the dynamic creation of customized documents. This component works much like a standard mail merge whereby a document template and a data source are merged together to create custom documents tailored to all parties listed in the data source. A simple example of a customized document is a form letter that has been modified to contain the recipient''s name so that it can be titled "Dear John" instead of "To whom it may concern."', 
        '- Uses templates and an XML data source to create customized documents - Replaces placeholder tags with customized data - Utilizes an XML data source to map tag names with their corresponding values - Each individual implementation includes the flexibility to define its own tags and use its own naming scheme - Provides support for text, xml and html template types ',
        '2002-08-25 20:51:03.0',
        1);
insert into comp_versions (comp_vers_id, component_id, version, version_text, create_time, phase_id, phase_time, price, comments) values (
        23, 12, 1, '1.0', '2002-08-25 20:51:03.0', 114, '2002-08-25 20:51:03.0', 0, '');
insert into comp_versions (comp_vers_id, component_id, version, version_text, create_time, phase_id, phase_time, price, comments) values (
        24, 12, 2, '2.0', '2002-08-25 20:51:03.0', 111, '2002-08-25 20:51:03.0', 0, '');
insert into comp_categories (comp_categories_id,component_id,category_id) values (12,12,15);
insert into comp_technology (comp_tech_id, comp_vers_id, technology_type_id) values (12,12,1);


insert into comp_catalog (component_id, current_version, component_name, short_desc, description, function_desc, create_time, status_id) values (
        13, 
        1,
        'File Conversion', 
        'File Conversion component', 
        'The File Conversion component transforms standard files (i.e. Microsoft Word, Microsoft Excel, GIF, JPG) into Portable Document Format (PDF) files. The value the component provides is consistency in a document format that can be read on all major platforms (i.e. Microsoft, Macintosh, Solaris, HPUX, IBM AIX). PDF files are non-platform specific and are typically read through freeware software, published by Adobe, Inc, called Acrobat Reader. Companies that communicate with electronic documents are faced with the challenge of supporting multiple file formats and software versions, either when distributing files to multiple recipients or receiving files from multiple sources. The File Conversion component will allow standard file types to be converted into PDF to avoid issues such as: Windows users sharing documents with Macintosh users or having the wrong version of Microsoft Office.', 
        '- Provides a local API and a Web Services interface - Accesses conversion routines that accept specific document formats and output a corresponding PDF version of the document - Provides facilities to perform asynchronous or synchronous access to the conversion routines - Can act as a server that polls for files located on the local file system, - Supports Microsoft Office documents, GIF and JPEG',
        '2002-08-25 20:51:03.0',
        1);
insert into comp_versions (comp_vers_id, component_id, version, version_text, create_time, phase_id, phase_time, price, comments) values (
        25, 13, 1, '1.0', '2002-08-25 20:51:03.0', 114, '2002-08-25 20:51:03.0', 0, '');
insert into comp_versions (comp_vers_id, component_id, version, version_text, create_time, phase_id, phase_time, price, comments) values (
        26, 13, 2, '2.0', '2002-08-25 20:51:03.0', 111, '2002-08-25 20:51:03.0', 0, '');
insert into comp_categories (comp_categories_id,component_id,category_id) values (13,13,15);
insert into comp_technology (comp_tech_id, comp_vers_id, technology_type_id) values (13,13,1);


-- Collaboration Forums (Version 1)

insert into forum_master (forum_id, status_id, create_time, closed_time) values ( 1, 2, '2002-08-25 20:51:03.0', '2002-08-25 20:51:03.0');
insert into forum_master (forum_id, status_id, create_time, closed_time) values ( 2, 2, '2002-08-25 20:51:03.0', '2002-08-25 20:51:03.0');
insert into forum_master (forum_id, status_id, create_time, closed_time) values ( 3, 2, '2002-08-25 20:51:03.0', '2002-08-25 20:51:03.0');
insert into forum_master (forum_id, status_id, create_time, closed_time) values ( 4, 2, '2002-08-25 20:51:03.0', '2002-08-25 20:51:03.0');
insert into forum_master (forum_id, status_id, create_time, closed_time) values ( 5, 2, '2002-08-25 20:51:03.0', '2002-08-25 20:51:03.0');
insert into forum_master (forum_id, status_id, create_time, closed_time) values ( 6, 2, '2002-08-25 20:51:03.0', '2002-08-25 20:51:03.0');
insert into forum_master (forum_id, status_id, create_time, closed_time) values ( 7, 2, '2002-08-25 20:51:03.0', '2002-08-25 20:51:03.0');
insert into forum_master (forum_id, status_id, create_time, closed_time) values ( 8, 2, '2002-08-25 20:51:03.0', '2002-08-25 20:51:03.0');
insert into forum_master (forum_id, status_id, create_time, closed_time) values ( 9, 2, '2002-08-25 20:51:03.0', '2002-08-25 20:51:03.0');
insert into forum_master (forum_id, status_id, create_time, closed_time) values (10, 2, '2002-08-25 20:51:03.0', '2002-08-25 20:51:03.0');
insert into forum_master (forum_id, status_id, create_time, closed_time) values (11, 2, '2002-08-25 20:51:03.0', '2002-08-25 20:51:03.0');
insert into forum_master (forum_id, status_id, create_time, closed_time) values (12, 2, '2002-08-25 20:51:03.0', '2002-08-25 20:51:03.0');
insert into forum_master (forum_id, status_id, create_time, closed_time) values (13, 2, '2002-08-25 20:51:03.0', '2002-08-25 20:51:03.0');

insert into comp_forum_xref (comp_forum_id, comp_vers_id, forum_id, forum_type) values ( 1,  1,  1, 1);
insert into comp_forum_xref (comp_forum_id, comp_vers_id, forum_id, forum_type) values ( 2,  3,  2, 1);
insert into comp_forum_xref (comp_forum_id, comp_vers_id, forum_id, forum_type) values ( 3,  5,  3, 1);
insert into comp_forum_xref (comp_forum_id, comp_vers_id, forum_id, forum_type) values ( 4,  7,  4, 1);
insert into comp_forum_xref (comp_forum_id, comp_vers_id, forum_id, forum_type) values ( 5,  9,  5, 1);
insert into comp_forum_xref (comp_forum_id, comp_vers_id, forum_id, forum_type) values ( 6, 11,  6, 1);
insert into comp_forum_xref (comp_forum_id, comp_vers_id, forum_id, forum_type) values ( 7, 13,  7, 1);
insert into comp_forum_xref (comp_forum_id, comp_vers_id, forum_id, forum_type) values ( 8, 15,  8, 1);
insert into comp_forum_xref (comp_forum_id, comp_vers_id, forum_id, forum_type) values ( 9, 17,  9, 1);
insert into comp_forum_xref (comp_forum_id, comp_vers_id, forum_id, forum_type) values (10, 19, 10, 1);
insert into comp_forum_xref (comp_forum_id, comp_vers_id, forum_id, forum_type) values (11, 21, 11, 1);
insert into comp_forum_xref (comp_forum_id, comp_vers_id, forum_id, forum_type) values (12, 23, 12, 1);
insert into comp_forum_xref (comp_forum_id, comp_vers_id, forum_id, forum_type) values (13, 25, 13, 1);


-- Specification Forums (Version 1)

insert into forum_master (forum_id, status_id, create_time, closed_time) values (21, 2, '2002-08-25 20:51:03.0', '2002-08-25 20:51:03.0');
insert into forum_master (forum_id, status_id, create_time, closed_time) values (22, 2, '2002-08-25 20:51:03.0', '2002-08-25 20:51:03.0');
insert into forum_master (forum_id, status_id, create_time, closed_time) values (23, 2, '2002-08-25 20:51:03.0', '2002-08-25 20:51:03.0');
insert into forum_master (forum_id, status_id, create_time, closed_time) values (24, 2, '2002-08-25 20:51:03.0', '2002-08-25 20:51:03.0');
insert into forum_master (forum_id, status_id, create_time, closed_time) values (25, 2, '2002-08-25 20:51:03.0', '2002-08-25 20:51:03.0');
insert into forum_master (forum_id, status_id, create_time, closed_time) values (26, 2, '2002-08-25 20:51:03.0', '2002-08-25 20:51:03.0');
insert into forum_master (forum_id, status_id, create_time, closed_time) values (27, 2, '2002-08-25 20:51:03.0', '2002-08-25 20:51:03.0');
insert into forum_master (forum_id, status_id, create_time, closed_time) values (28, 2, '2002-08-25 20:51:03.0', '2002-08-25 20:51:03.0');
insert into forum_master (forum_id, status_id, create_time, closed_time) values (29, 2, '2002-08-25 20:51:03.0', '2002-08-25 20:51:03.0');
insert into forum_master (forum_id, status_id, create_time, closed_time) values (30, 2, '2002-08-25 20:51:03.0', '2002-08-25 20:51:03.0');
insert into forum_master (forum_id, status_id, create_time, closed_time) values (31, 2, '2002-08-25 20:51:03.0', '2002-08-25 20:51:03.0');
insert into forum_master (forum_id, status_id, create_time, closed_time) values (32, 2, '2002-08-25 20:51:03.0', '2002-08-25 20:51:03.0');
insert into forum_master (forum_id, status_id, create_time, closed_time) values (33, 2, '2002-08-25 20:51:03.0', '2002-08-25 20:51:03.0');

insert into comp_forum_xref (comp_forum_id, comp_vers_id, forum_id, forum_type) values (21,  1, 21, 2);
insert into comp_forum_xref (comp_forum_id, comp_vers_id, forum_id, forum_type) values (22,  3, 22, 2);
insert into comp_forum_xref (comp_forum_id, comp_vers_id, forum_id, forum_type) values (23,  5, 23, 2);
insert into comp_forum_xref (comp_forum_id, comp_vers_id, forum_id, forum_type) values (24,  7, 24, 2);
insert into comp_forum_xref (comp_forum_id, comp_vers_id, forum_id, forum_type) values (25,  9, 25, 2);
insert into comp_forum_xref (comp_forum_id, comp_vers_id, forum_id, forum_type) values (26, 11, 26, 2);
insert into comp_forum_xref (comp_forum_id, comp_vers_id, forum_id, forum_type) values (27, 13, 27, 2);
insert into comp_forum_xref (comp_forum_id, comp_vers_id, forum_id, forum_type) values (28, 15, 28, 2);
insert into comp_forum_xref (comp_forum_id, comp_vers_id, forum_id, forum_type) values (29, 17, 29, 2);
insert into comp_forum_xref (comp_forum_id, comp_vers_id, forum_id, forum_type) values (30, 19, 30, 2);
insert into comp_forum_xref (comp_forum_id, comp_vers_id, forum_id, forum_type) values (31, 21, 31, 2);
insert into comp_forum_xref (comp_forum_id, comp_vers_id, forum_id, forum_type) values (32, 23, 32, 2);
insert into comp_forum_xref (comp_forum_id, comp_vers_id, forum_id, forum_type) values (33, 25, 33, 2);


-- Collaboration Forums (Version 2)

insert into forum_master (forum_id, status_id, create_time, closed_time) values (41, 1, '2002-08-25 20:51:03.0', '2002-08-25 20:51:03.0');
insert into forum_master (forum_id, status_id, create_time, closed_time) values (42, 1, '2002-08-25 20:51:03.0', '2002-08-25 20:51:03.0');
insert into forum_master (forum_id, status_id, create_time, closed_time) values (43, 1, '2002-08-25 20:51:03.0', '2002-08-25 20:51:03.0');
insert into forum_master (forum_id, status_id, create_time, closed_time) values (44, 1, '2002-08-25 20:51:03.0', '2002-08-25 20:51:03.0');
insert into forum_master (forum_id, status_id, create_time, closed_time) values (45, 1, '2002-08-25 20:51:03.0', '2002-08-25 20:51:03.0');
insert into forum_master (forum_id, status_id, create_time, closed_time) values (46, 1, '2002-08-25 20:51:03.0', '2002-08-25 20:51:03.0');
insert into forum_master (forum_id, status_id, create_time, closed_time) values (47, 1, '2002-08-25 20:51:03.0', '2002-08-25 20:51:03.0');
insert into forum_master (forum_id, status_id, create_time, closed_time) values (48, 1, '2002-08-25 20:51:03.0', '2002-08-25 20:51:03.0');
insert into forum_master (forum_id, status_id, create_time, closed_time) values (49, 1, '2002-08-25 20:51:03.0', '2002-08-25 20:51:03.0');
insert into forum_master (forum_id, status_id, create_time, closed_time) values (50, 1, '2002-08-25 20:51:03.0', '2002-08-25 20:51:03.0');
insert into forum_master (forum_id, status_id, create_time, closed_time) values (51, 1, '2002-08-25 20:51:03.0', '2002-08-25 20:51:03.0');
insert into forum_master (forum_id, status_id, create_time, closed_time) values (52, 1, '2002-08-25 20:51:03.0', '2002-08-25 20:51:03.0');
insert into forum_master (forum_id, status_id, create_time, closed_time) values (53, 1, '2002-08-25 20:51:03.0', '2002-08-25 20:51:03.0');

insert into comp_forum_xref (comp_forum_id, comp_vers_id, forum_id, forum_type) values (41,  2, 41, 1);
insert into comp_forum_xref (comp_forum_id, comp_vers_id, forum_id, forum_type) values (42,  4, 42, 1);
insert into comp_forum_xref (comp_forum_id, comp_vers_id, forum_id, forum_type) values (43,  6, 43, 1);
insert into comp_forum_xref (comp_forum_id, comp_vers_id, forum_id, forum_type) values (44,  8, 44, 1);
insert into comp_forum_xref (comp_forum_id, comp_vers_id, forum_id, forum_type) values (45, 10, 45, 1);
insert into comp_forum_xref (comp_forum_id, comp_vers_id, forum_id, forum_type) values (46, 12, 46, 1);
insert into comp_forum_xref (comp_forum_id, comp_vers_id, forum_id, forum_type) values (47, 14, 47, 1);
insert into comp_forum_xref (comp_forum_id, comp_vers_id, forum_id, forum_type) values (48, 16, 48, 1);
insert into comp_forum_xref (comp_forum_id, comp_vers_id, forum_id, forum_type) values (49, 18, 49, 1);
insert into comp_forum_xref (comp_forum_id, comp_vers_id, forum_id, forum_type) values (50, 20, 50, 1);
insert into comp_forum_xref (comp_forum_id, comp_vers_id, forum_id, forum_type) values (51, 22, 51, 1);
insert into comp_forum_xref (comp_forum_id, comp_vers_id, forum_id, forum_type) values (52, 24, 52, 1);
insert into comp_forum_xref (comp_forum_id, comp_vers_id, forum_id, forum_type) values (53, 26, 53, 1);

-- Add topics to Forums

insert into forum_topics (topic_id,forum_id,status_id,topic_name,topic_text)
  select forum_id, forum_id, 1, 'Topic 1', 'Topic 1 description'
    from forum_master
   where forum_id < 60;

insert into forum_topics (topic_id,forum_id,status_id,topic_name,topic_text)
  select forum_id + 60, forum_id, 1, 'Topic 2', 'Topic 2 description'
    from forum_master
   where forum_id < 60;

insert into forum_topics (topic_id,forum_id,parent_topic_id,status_id,topic_name,topic_text)
  select forum_id + 120, forum_id, forum_id, 1, 'SubTopic 1', 'SubTopic 1 description'
    from forum_master
   where forum_id < 60;

insert into forum_topics (topic_id,forum_id,parent_topic_id,status_id,topic_name,topic_text)
  select forum_id + 180, forum_id, forum_id, 1, 'SubTopic 2', 'SubTopic 2 description'
    from forum_master
   where forum_id < 60;


-- Add threads to Topics

insert into forum_threads (thread_id, topic_id, status_id, subject)
  select topic_id, topic_id, 1, 'Thread 1'
    from forum_topics
   where topic_id between 120 and 180;

insert into forum_threads (thread_id, topic_id, status_id, subject)
  select topic_id + 60, topic_id, 1, 'Thread 2'
    from forum_topics
   where topic_id between 120 and 180;


-- Add posts to threads

insert into forum_posts (post_id, thread_id, status_id, login_id, post_time, post_text)
  select thread_id, thread_id, 1, 6800000, '2002-08-25 20:51:03.0', 'This is the first post'
    from forum_threads
   where thread_id between 120 and 180;

insert into forum_posts (post_id, thread_id, status_id, login_id, post_time, post_text)
  select thread_id + 60, thread_id, 1, 6800000, '2002-08-25 20:51:03.0', 'This is the second post'
    from forum_threads
   where thread_id between 120 and 180;
   