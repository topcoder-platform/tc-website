<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:import href="../../top.xsl"/>
  <xsl:import href="../../script.xsl"/>
  <xsl:import href="../../includes/body_top.xsl"/>  
  <xsl:import href="../../foot.xsl"/>
  <xsl:import href="../../includes/modules/practice_room.xsl"/>
  <xsl:import href="../../includes/modules/module_login.xsl"/>  
  <xsl:import href="../../includes/modules/calendar.xsl"/>
  <xsl:import href="../../includes/tces/public_tces_left.xsl"/> 
  <xsl:import href="../../includes/public_right_col.xsl"/>     
  <xsl:output indent="no" method="html" doctype-public="-//W3C//DTD HTML 4.0 Transitional//EN"/>
  <xsl:template match="/">
    <HTML>
      <HEAD>
        <xsl:call-template name="Preload"/>      
        <TITLE>TopCoder :: Employment Services</TITLE>
        <xsl:call-template name="CSS"/>      
        <!--<LINK REL="stylesheet" TYPE="text/css" HREF="/css/style.css"/>
        <LINK REL="stylesheet" TYPE="text/css" HREF="/css/coders.css"/>-->
        <META NAME="description" CONTENT="TopCoder is a programming tournament site. All members who compete attain a rating that provides a metric for coding competence and potential. These ratings, coupled with tournament performance, can lead to monetary rewards and employment opportunities."/>
        <META NAME="keywords" CONTENT="Computer Jobs, Programming, Programming Jobs, Programming Contest, Programming Competition, Online Games, Coding, Information Technology Jobs, Java, C++"/>
      </HEAD>
      <BODY BGCOLOR="#FFFFFF" TOPMARGIN="0" MARGINHEIGHT="0" LEFTMARGIN="0" MARGINWIDTH="0">
        <xsl:call-template name="Top"/>
<!-- Body Begins -->
<TABLE WIDTH="100%" HEIGHT="69%" BORDER="0" CELLPADDING="0" CELLSPACING="0" BGCOLOR="#CCCCCC">
  <TR>
    <!-- Left Column Begins -->
    <TD WIDTH="170" BGCOLOR="#CCCCCC" VALIGN="top">
  <!-- Global Seconday Nav Begins -->    
<!-- Left Column Include Begins -->  
    <!-- Global Seconday Nav Begins -->  
        <xsl:call-template name="public_tces_left"/>
  <!-- Global Seconday Nav Ends -->  
<!-- Left Column Include Ends -->
      </TD>
  <!-- Left Column Ends -->
  <!-- Gutter Begins -->
    <TD WIDTH="4" BGCOLOR="#CCCCCC" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="4" HEIGHT="8" BORDER="0"/></TD>
    <!-- Gutter Ends -->

<!-- Body Area -->
  <!-- Center Column Begins -->  
    <TD CLASS="bodyText" WIDTH="100%" BGCOLOR="#CCCCCC" VALIGN="top"><img src="/i/clear.gif" width="240" height="1" VSPACE="5" BORDER="0"/><BR/>
<xsl:call-template name="BodyTop">
  <xsl:with-param name="image1">white</xsl:with-param>
  <xsl:with-param name="image">jobs</xsl:with-param>
  <xsl:with-param name="title">&#160;TopCoder Employment Services</xsl:with-param>
</xsl:call-template>
<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#FFFFFF" WIDTH="100%">
        <TR>
          <TD VALIGN="top" WIDTH="11"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="1" BORDER="0"/></TD>
          <TD CLASS="bodyText" COLSPAN="2" VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="240" HEIGHT="1" BORDER="0"/><BR/><BR/>

<TABLE WIDTH="100%" CELLPADDING="0" CELLSPACING="0" BORDER="0">
   <TR>
      <TD VALIGN="middle" HEIGHT="18" BGCOLOR="#43515E" CLASS="statText"><B>&#160;NVIDIA Jobs</B></TD>
  </TR>
  <TR>
      <TD VALIGN="middle" HEIGHT="18" CLASS="bodyText"><A HREF="/?&amp;t=tces&amp;c=nvidia_openings&amp;a=secure">Jobs</A> | <A HREF="http://www.nvidia.com/view.asp?PAGE=products" TARGET="_blank">Products</A> | <A HREF="http://www.nvidia.com/view.asp?PAGE=benefits" TARGET="_blank">Benefits</A> | <A HREF="/?&amp;t=tces&amp;c=nvidia">NVIDIA</A>
      </TD>
  </TR>
</TABLE>
<IMG SRC="/i/es/nvidia/nvidia_logo.gif" WIDTH="120" HEIGHT="83" ALT="" BORDER="0"/><BR/>       
<FORM METHOD="" ACTION="/jobposting">
<INPUT TYPE="HIDDEN" NAME="t" VALUE="JobHitTask"/>

<P><B>3D GRAPHIC ARCHITECT:</B><BR/>
This is an opportunity to work with the hottest team in 3D graphics! The current team members possess over 100 patents and average over 15 years of 3D graphics experience apiece. The graphics architect will be expected to work at NVIDIA in the area of 3D architecture, algorithms, and software development, building on NVIDIA's current architecture and products. In this capacity, the architect will be expected to become familiar with NVIDIA current architecture, algorithms, products, and development methodologies, and perform research supporting the development of new algorithms and ideas. The architect will also be expected to analyze performance of proposed and current NVIDIA products, and develop algorithms and architectural features to support NVIDIA's product plans. The focus of these developments will include 3D geometry and rendering, antialiasing, animation, and video. In pursuit of this development, the architect will be expected to document the mathematical equations involved in the algorithms, generate test programs to validate the ideas, and generate C-model code to assist in hardware design and verification.</P>

<P><B>Requirements:</B>
<UL>
<LI>The ideal candidate will possess an advanced degree in Computer Science, Electrical Engineering, Mathematics or related discipline, and relevant industry or research experience helpful.</LI>
<LI>Relevant industries include PC or workstation graphics hardware or software development, digital video or image processing hardware or software development, video game software development, rendering software or tools development.</LI>
<LI>The candidate should have strong familiarity with graphics research literature, including SIGGRAPH proceedings, and should be familiar with a wide range of graphics and rendering.</LI>
</UL>
</P>

EOE

<P><B>SOFTWARE QA ENGINEER INTERN/CO-OP:</B></P>
<P>Role/Responsibilities:<BR/>                                                                                            
NVWHQL serves NVIDIA as the resident authority on Microsoft's Windows Logo Program (WLP).  The Windows Logo Program revolves around 
Windows Hardware Quality Labs (WHQL).  Examine Microsoft's WHQL site <A HREF="http://www.microsoft.com/hwtest" TARGET="_blank">www.microsoft.com/hwtest</A> for more information.  NVWHQL has three main objectives.  Our first objective is to ensure that NVIDIA products comply with current WLP requirements and industry specifications.  Which in turn makes them available for shipment in systems designed by major OEMs.  The second objective of NVWHQL is to field our customer's questions surrounding the application of requirements to their specific configurations.  Our third objective is to monitor industry trends and understand how they will influence pending specifications and impact NVIDIA, our customers, and the Windows Logo Program.</P>
                                                                                                               
<P>GPA 3.0</P>
 <UL>                                                                                                                          
<LI>Expert trouble-shooting ability where a problem can be isolated down to the root cause software or hardware component.</LI>
<LI>Ability to maintain multiple systems in lab environment.  Keeping them continually in operation, updated with current software, and problem free.</LI>
<LI>Power-User level experience with the Windows Family of Operating Systems.  Including Windows XP, Windows Me, Windows 2000, Windows 98 SE, and Windows NT4.  Including how they interact with Applications and hardware.</LI>
<LI>Understanding of QA theory, bug tracking to resolution, and software development support.</LI>
<LI>The ability to research and comprehend technically complex specifications concerning the development of PC architecture and sub-systems.</LI>
<LI>Knowledgeable of current industry standards such as DirectX, OpenGL, EDID &#38; DDC, DVD, ACPI, and PC Design Guides.</LI>
</UL>
EOE

<P><B>PLATFORM VERIFICATION ARCHITECT:</B><BR/>
In this key role, you will be instrumental in the development of infrastructure for validation of architectures and verification of hardware. Responsibilities include: development of directed diagnostics for specific hardware functionality, and application of those diagnostics to debug C simulation models, RTL simulations, hardware emulation, and real hardware.</P>

<P><B>Required Skills and experience:</B>
<UL>
<LI>Requires strong programming in C/C++, scripting languages.</LI>
<LI>Hardware and system debugging skills</LI>
<LI>BS in CS, EE, (related technical field) or equivalent experience</LI>
</UL>
</P>

<P><B>Desirable experience/ knowledge (should include, however not limited to):</B>
<UL>
<LI>Software infrastructure for validation of architecture correctness.</LI>
<LI>Software infrastructure for verification of reference models vs. hardware.</LI>
<LI>Diagnostics for validation and verification.</LI>
<LI>Experience with BIOS, device drivers or other low-level software.</LI>
<LI>Experience with HW/OS interactions.</LI>
<LI>Experience with HW design, simulation, verification, and HW bring-up. </LI>
<LI>User-level and programmer-level experience with Microsoft operating systems</LI>
</UL>
</P>
EOE

<P><B>DIAGNOSTIC ENGINEER:</B><BR/>
Job Description:
Develop diagnostics software that helps diagnosis and troubleshoot of chip and motherboard problems.  The diagnostics software should be capable of:
<OL>
<LI>Debugging software and hardware problems.</LI>
<LI>Creating the stress condition of the bus interface and producing the worst case noise for characterization.</LI>
<LI>Perform the complete protocol check of bus interface.</LI>
<LI>Expediting the generation of system error/bug condition</LI>
</OL>
</P>

<P><B>Requirements:</B>
<UL>
<LI>BS/MS EE/CS with 2+ years of experience.</LI>
<LI>Strong C, C++ programming skills.</LI>
<LI>Familiar with X86 assembly language a plus.</LI>
<LI>Knowledge of PC hardware and architecture.</LI>
</UL>
</P>
EOE

<P><B>PERFORMANCE ANALYSIS ENGINEER INTERN/CO-OP:</B>
Performance Analysis Software Engineers are responsible for performance analysis and improvement of 3D graphics applications.  Applications include industry standard benchmarks and third party software products.  Ideal candidates will have an understanding of PC hardware architectures and their impact on application performance.  Experience with 3D graphics programming interfaces (Direct 3D and OpenGL) is desired.</P>

<P>GPA 3.5</P>
<UL>
<LI>BS in Computer Science or equivalent</LI>
<LI>Graphics application development and performance analysis experience</LI>
<LI>Familiarity with PC development environment</LI>
</UL>
EOE

<P>VIDEO BIOS ENGINEER:
Design and implement video BIOS software to support next-generation graphics hardware.</P>
<UL>                                   
<LI>BSEE/CS or equivalent (MS Preferred).</LI>
<LI>3-5 years experience in developing device drivers or other low-level software used to control graphics hardware.</LI>
<LI>Must have extensive experience in 80x86 assembly and detailed knowledge of the PC architecture.</LI>
<LI>Experience with I2C, VESA, and power management are invaluable.</LI> 
<LI>Must be able to work closely with both hardware designers as well as other driver engineers to design, develop, and debug functional and performance aspects of a graphics-based subsystem.</LI>
</UL>                                                                  
EOE

<P><B>SQA ENGINEER - MOBILE:</B><BR/>
Responsibilities:
<UL>
<LI>Software testing of display drivers focusing on variety of mobile platforms. </LI>
<LI>Main responsibility will be to ensure SW functionality and compatibility based on specific guidelines.</LI>
<LI>Additional responsibilities will include OEM Qualification testing, BIOS qualification, test plan development and bug verification.</LI>
<LI>Work closely and support OEMs with bug verification and regression testing.</LI>
</UL>
Requirements:
<UL>
<LI>Experience in testing mobile platforms.</LI>
<LI>Experienced user of WinNT, Win2K and WinXP.</LI> 
<LI>Good communications skills.</LI>
<LI>2+ years software test experience desirable.</LI>
<LI>Knowledge of or interest in 3D, OpenGL, Power Management, Multiple Displays, and DirectX technologies a plus.</LI>
</UL>
</P>
EOE

<P><B>KERNEL SOFTWARE ENGINEER:</B><BR/>
Design and implement kernel level drivers and software. Use your experience in operating systems and hardware 
fundamentals  to support next-generation multimedia and systems hardware within our Unified Driver Architecture.
</P>
<P>
BSEE/CS or equivalent (MS Preferred). 5+ years of experience in developing low-level device drivers on Windows9x/NT/XP, Apple, VxWorks, or Unix/Linux operating systems.  Must have detailed knowledge of operating system internals, C/C++ language, as well as various assembly languages.  Must be able to work closely with both hardware designers as well as other driver engineers to design, develop, and debug functional and performance aspects of complex subsystems.  Requires low-level operating system knowledge, specifically memory/resource management, scheduling and process control, and hardware virtualization.  Must be able to be self-productive across multiple technologies and disciplines in a very dynamic work environment.  Ideal candidate has experience and exposure to a wide variety of platforms and technologies.
</P>
EOE

<P>MOBILE BIOS ENGINEER:
Design and implement mobile video BIOS software to support next-generation graphics hardware in laptops and portable devices.
</P>

<P>Requirements:
<UL>
<LI>BSEE/CS or equivalent (MS Preferred).</LI>
<LI>3-5 years experience in developing device drivers or other low-level software used to control graphics hardware.</LI>
<LI>Must have extensive experience in 80x86 assembly and detailed knowledge of the PC architecture.</LI>
<LI>Experience with I2C, VESA, and power management are invaluable.</LI>
<LI>Must be able to work closely with both hardware designers as well as other driver engineers to design, develop, and debug functional and performance aspects of a graphics-based subsystem.</LI>
</UL>
</P>
EOE

<P><B>SOFTWARE QA ENGINEER:</B><BR/>
Software testing of all system devices including:
<UL>                                                                         
<LI>Network drivers to ensure compatibility with Microsoft WHQL certification requirements and industry standard network protocol stacks.</LI>
<LI>Audio driverss to ensure compatibility and compliance with industry standards including input/output, SPDIF, DOLBY.</LI>
<LI>Graphics drivers to ensure full compliance with WHQL standards, product specifc features, digital flat panel testing, TV-OUT testing.</LI>
<LI>Modem drivers to ensure a basic level of functionality and compliance with WHQL standards.</LI>
<LI>General PC testing and usage including testing USB devices, IDE/ATAPI devices,</LI>
<LI>PS/2 devices, paralell port, and a wide range of PCI add-in cards, power supplies, etc.</LI>
</UL>
Requirements:                                                                                          
<UL>
<LI>Experienced user of Win9x, WinNT4, and Win2K. Good communications skills. </LI>
<LI>Must have experience setting up and configuring Windows networking (all windows versions). </LI>
<LI>Must have experience configuring and troubleshooting PC's. 2+ years software test experience desirable.</LI>
<LI>Experience with NIC diagnostic tools or Microsoft WHQL requirements a plus.</LI>
<LI>Knowledge of or interest in 3D, OpenGL, and DirectX technologies required.</LI>
</UL>
</P>                                                                                                           
EOE

<P><B>SOFTWARE ENGINEER:</B><BR/>
Software Engineers at NVIDIA design, implement and optimize all the graphics drivers for NVIDIA's processors. 
Specific areas include:
<UL>
<LI>Kernel drivers</LI>
<LI>2D graphics</LI>
<LI>Video</LI>
<LI>OpenGL</LI>
<LI>Direct 3D</LI>
<LI>Control panel/GUI on Windows, Macintosh and Linux</LI>
</UL>
Our code is cross-platform and highly efficient.
<BR/>
Requirements:
<UL>                                                            
<LI>GPA 3.5</LI>
<LI>Candidates should have solid engineering background and abilities in C; for some positions C++ and/or assembly language is required.</LI>
</UL>
</P>                                                                                                                                  
EOE

<P><B>SR. SYSTEM ENGINEER:</B><BR/>
Job Description:
<UL>
<LI>Debug and bring up motherboard.</LI>
<LI>Find chip related bus protocol problems and work with hardware and software groups to find resolution.</LI>
<LI>Validate the functionality of all bus interfaces.</LI>
<LI>High speed bus debug/characterization and motherboard stability improvement.</LI>
<LI>Work with FAE and resolve customers' issues.</LI>
</UL>
Requirements:
<UL>
<LI>BS/MS EE/CS - 3-7 of years.</LI>
<LI>PC motherboard, chipset, graphics cards bringup/debug/validation experience.</LI>
<LI>Familiar with PCB layout tools and high speed board design</LI>
<LI>Fluent with lab equipments, PC architecture and different PC bus protocols like AGP and PCI, Intel and AMD processors.</LI>
</UL>
</P>
EOE

<P><B>SYSTEM BIOS ENGINEER:</B><BR/>
Support emulation and hardware bringup. Help improve design and methodology of system BIOS architecture, anticipate and plan for future hardware and software initiatives. Support the team in debugging, design, and development efforts.
<BR/>
Requirements:
<UL>
<LI>Requires an very senior system BIOS engineer, with extensive experience in development.</LI>
<LI>Show breadth and depth in understanding modern hardware design issues.</LI>
<LI>Must have significant chipset and hardware bringup experience.</LI>
<LI>Extensive experience with Award or Phoenix SBIOS required, Award experience a plus</LI>
<LI>Extensive experience with modern x86 Architectures required, recent CPUs PIII and newer a plus, AMD experience a plus</LI>
<LI>Experience with recent standards, such as 1394, USB, USB2.0, ACPI2.0 a plus.</LI>
<LI>C programming and device driver experience a plus.</LI>
<LI>Candidate should show leadership and have a teamwork orientation</LI>
</UL>
</P>
EOE

<P><B>OEM TECHNICAL PROGRAM MANAGER:</B><BR/>
Responsibilities:
<UL>
<LI>Determine strategy and tactics for executing graphics product solutions from award to production.</LI>
<LI>Develop program schedules, milestones and deliverables. </LI>
<LI>Translate customer requirements into specific tasks for all functional areas and proactively capture, track and drive all issues to closure. </LI>
<LI>Communicate the issue status to the customer and the engineering teams. </LI>
<LI>Correctly represent the urgency of issues and escalate issues appropriately.</LI>  
<LI>Work closely with the hardware and software engineering teams, the FAEs and the Sales team to resolve technical and logistic issues. </LI>
<LI>Regularly communicate the program status and key issues to management.</LI>
<LI>Develop a close working relationship with the PC OEM's development team and use creativity to find solutions to customer issues.</LI>
</UL>
Requirements:
<UL>
<LI>5+ years in PC or related industry </LI>
<LI>Proven history of Project/Program Management</LI>
<LI>Strong technical background and experience managing contract manufacturers</LI>
<LI>BS/MS Engineering or Computer Science preferred </LI>
</UL>
</P>
EOE

<P>FIELD APPLICATION ENGINEER (Seoul, Korea):
Pre/post technical support of major Mobile and desktop graphic chipset in major OEMs in Korea. Provide technical presentations/support towards design wins and design/debug support and issue closure to drive production. Act as technical liaison between OEM and Nvidia hardware and software engineers for design assistance and problem solving. Visit customers as necessary to understand and resolve all issues.</P>
<P>
Position is based in Seoul Korea.
</P>
<P>
Requirements:
<UL>
<LI>BCEE, MSEE preferred along with 5-7 years hands-on board level design and debug experience. </LI>
<LI>Field applications engineering experience a plus.</LI>
<LI>Knowledge of Windows operating system and device drivers.</LI>
<LI>Must have strong communication skills.</LI>
<LI>Graphics and PC knowledge is very desirable.</LI>
<LI>Must thrive in a fast paced, results-oriented company.</LI>
</UL>
</P>
EOE

<P><B>3D PERFORMANCE TOOLS ENGINEER:</B><BR/>
The 3D PERFORMANCE TOOLS SOFTWARE ENGINEER will have the primary responsibility to design and implement profiling and debugging applications for the 3D real-time graphics community. He/She will provide applications that will assist developers in identifying bottlenecks and inconsistencies in their 3D graphics application. By listening to the needs coming from 3D graphics community, the engineer will provide professional solutions to level out the difficulties arising from the development of high end 3D graphics application.</P>

<P>The successful candidate will require:
<UL>
<LI>Strong object oriented programming and methodologies.</LI>
<LI>In depth knowledge of at least on 3D graphics API: OpenGL or Direct3D.</LI>
<LI>Strong mathematic skills.</LI>
<LI>C/C++</LI>
<LI>MFC/STL</LI>
<LI>Scripting languages, Embedded scripting languages, Python, Scheme, etc...</LI>
<LI>MAYA or MAX Plug-in experience is a plus.</LI>
</UL>
</P>

EOE

<P><B>3D APPLICATION SW ENGINEER:</B><BR/>
The 3D APPLICATION SOFTWARE ENGINEER  will have the primary responsibility to technically support 3D applications vendors. He/She will provide technical assistance to developers in solving application or driver issues and optimizing the 3D rendering. The engineer will also drive the adoption of advanced technologies into those 3D applications by educating the development community through technical articles, source code examples, presentations at conferences and onsite interventions. </P>

<P><B>The successful candidate will require:</B>
<UL>
<LI>5+ years of experience in programming.</LI>
<LI>In depth knowledge of at least one 3D graphics API: OpenGL or Direct3D.</LI>
<LI>Excellent presentation and communication skills.</LI>
<LI>Strong mathematic skills.</LI>
<LI>C/C++.</LI>
<LI>MFC/STL.</LI>
<LI>MAYA and/or MAX Plug-in experience is a plus.</LI>
<LI>3D Middleware experience is a plus.</LI>
</UL>
</P>
EOE

<P><B>CUSTOMER QUALITY ENGINEER</B> (Taipei, Taiwan):<BR/>
Position located in either Taipei or Hsinchu:
<UL>
<LI>Provide direct interface with Taiwan customers on NVIDIA BGA quality issues.  Assist customers in first level failure analysis (isolate cause to manufacturing problem, chip problem, driver/BIOS or test problem) to determine likely cause of quality issues.  Conduct board level FA as needed, isolate preliminary root cause and drive solutions within NVIDIA as needed.</LI>
<LI>Collect and analyze failure rate data from customers.</LI>
<LI>Manage customer FA requests and responses (status tracking/reporting/documentation)</LI>
<LI>Assure that customer quality requirements are reviewed and converted into in-house requirements.</LI>
<LI>Assist in Quality Audits and customer visits to NVIDIA or suppliers.</LI>
<LI>Write quality procedures as needed to document current practices.</LI>
</UL></P>

<P><B>Requirements</B>
<UL>
<LI>Strong knowldge of 3D graphics technology and functional and in-circuit testing is REQUIRED.  Must have a minimum of 2 years working directly in 3D graphics.</LI>
<LI>Minimum of 2 years interfacing with customers.</LI>
<LI>Working knowledge of the cause, corrective, and preventive action process.</LI>
<LI>Ability to work within and to lead cross-functional teams (including customers).</LI>
<LI>BSEE or equivalent.</LI>
<LI>Must be able to read and write good English to be able to communicate with multinational sites.</LI>
<LI>Computer literate and able to use practical software applications.</LI>
</UL>
</P>
EOE

<P><B>SIGNAL INTEGRITY ENGINEER:</B><BR/>
As a key member of the Signal Integrity Group, you will support the hardware development groups to aggressively design and develop high performance 3D graphics accelerators and PC mother boards.  You will also work with 3rd party vendors to maintain a high level of model accuracy. The members that will be a part of this new group are outstanding individuals that will need to handle challenging high speed designs, model generation, verification and pre/post layout simulation and constraint management of high speed digital busses.  Work as part of a team with logic, module designers, PCB and component engineers to characterize packages and define termination strategies.</P>
                                                                                                          
<P><B>Requirements:</B>
<UL>
<LI>MSEE (PhD preferred) with 4-7 years related experience.</LI>
<LI>Must be proficient with most signal integrity simulation tools using SpecctraQuest, APSIM, HSPICE.</LI>
<LI>Must have good interpersonal skills and the ability to explain results and methods to other engineers.</LI>
</UL>
</P>
                                                                                                                                
<P><B>Preferred Experience:</B>
<UL>
<LI>Model validation software such as IConnect</LI>
<LI>Knowledge of transmission line analysis, Full-wave 3D analysis techniques such as FDTD and Method of moments.</LI>
<LI>Experience correlating simulation results with lab measurements using oscilloscopes, TDRs, VNAs, and spectrum analyzers is a plus.</LI>
</UL>
</P>
EOE

<P><B>PACKAGE DESIGNER:</B>
<UL>
<LI>Develop and design NVIDIA's BGA/MPM/MCM packages based products using Cadence's Advance Package Designer software, within design guidelines provided by packaging vendors.</LI>
<LI>Drive and track design technology issues for new system in a package solutions</LI>
<LI>Develop substrate design methodology, libraries and release procedures</LI>
<LI>Drive pinout/fanout routing feasibility studies within target platform to optimize BGA package routability and electrical performance.</LI>
<LI>Develop tools and workflow to implement die pad to pinout mapping, with forward and backward annotation to Cadence Concept symbols</LI>
</UL>
</P>

<P><B>Requirements: </B> 
<UL>                                                                                                          
<LI>5 years of direct experience with package layout using Cadence's APD or Avant!'s Encore products.</LI>
<LI>B.S. Electrical Engineering or equivalent industry experience.</LI>                                              
<LI>Familiarity with high speed package techniques and constraints</LI>
</UL>
</P>                                                                                                                                    
EOE

<P><B>SENIOR DESIGN ENGINEER:</B>
<UL>
<LI>Debug and bring up motherboard.</LI>
<LI>Find chip related bus protocol problems and work with hardware and software groups to find resolution.</LI>
<LI>Validate the functionality of all bus interfaces.</LI>
<LI>High speed bus debug/characterization and motherboard stability improvement.</LI>
<LI>Work with FAE and resolve customers' issues.</LI>
</UL>
</P>
<P><B>Requirements</B>
<UL>
<LI>BS/MS EE - 3-5 years of experience in board bringup/debug.</LI>
<LI>Extensive experience with digital logic design, analog design a plus.</LI>
<LI>Experience with customers interaction and support.</LI>
<LI>Team manager/leader with good communication and problem-solving skills.</LI>
</UL></P>
EOE

<P><B>PRODUCT/TEST ENGINEER:</B><BR/>
Work on leading-edge product development driving 3D Graphics technology within our Product/Test group. You will:
<UL>
<LI>Generate test plans and methodology</LI>
<LI>Develop test programs and tools on Agilent platforms</LI>
<LI>Drive debug and validation activities and data collection</LI>
<LI>Push issue resolution and publish updates</LI>
<LI>Work closely with internal and external teams to support pattern validation, characterization, silicon debug, and manufacturing release - Work closely with foundries and assy/test sites to insure smooth high volume production</LI>
</UL>
</P>
<P><B>Qualifications</B><BR/>
This position requires a BS or MS in electrical engineering with 2-7 years of semiconductor experience. You must also possess:
<UL>
<LI>Experience with  (83k or 93k) testers.</LI>
<LI>Strong leadership, teamwork, communication, result orientation, and problem solving skills</LI>
<LI>Good software skills in C/C++ or Verilog, Unix and Perl </LI>
<LI>Solid background in ATE testing, test methodology, DFM/DFT, product development, and Si process.</LI>
</UL></P>
EOE

<P><B>WHQL ENGINEER:</B><BR/>
NVWHQL serves NVIDIA as the resident authority on Microsoft's Windows Logo Program (WLP). The Windows Logo Program revolves around Windows Hardware Quality Labs (WHQL). Examine Microsoft's WHQL site <A HREF="http://www.microsoft.com/hwtest" TARGET="_blank">WWW.MICROSOFT.COM/HWTEST</A> for more information. NVWHQL has three main objectives. Our first objective is to ensure that NVIDIA products comply to current WLP requirements and industry specifications, which in turn makes them available for shipment in systems designed by major OEMs. The second objective of NVWHQL is to field our customer's questions surrounding the application of requirements to their specific configurations. Our third objective is to monitor industry trends and understand how they will influence pending specifications and impact NVIDIA, our customers, and the Windows Logo Program.</P>

<P><B>Requirements:</B>
<UL>
<LI> AA Degree Computer Science or Electronic Engineering required, pursuit or achievement of BS degree preferred.  Intimate knowledge of Mobile &#38; Desktop PC hardware, Windows operating systems, and device sub-system classes.</LI>
<LI>Journeyman level knowledge of CPU &#38; Memory architecture.</LI>
<LI>Data transfer &#38; I/O interfaces, including USB 2.0, 1394, Ethernet 10/100/1000, 802.11b,g, Audio Processing/MIDI/Dolby Digital 5.1+/DTS/THX certifications.</LI>
<LI>Display/Graphics experience (Inclusive of - Open GL, Direct X, Direct Draw, 2D, 3D, and commercial software applications) extremely beneficial.</LI>
<LI>Ability to work in a fast paced environment and consistently remain detail oriented.</LI>
<LI>Ability to communicate effectively with peers and management.</LI>
<LI>Expert level daily reporting, data analysis, and deductive reasoning a must.</LI>
</UL>
</P>
 EOE

<P><B>SYSTEM DESIGN ENGINEER:</B>
<UL>
<LI>Debug and bring up motherboard.</LI>
<LI>Find chip related bus protocol problems and work with hardware and software groups to find resolution.</LI>
<LI>Validate the functionality of all bus interfaces.</LI>
<LI>High speed bus debug/characterization and motherboard stability improvement.</LI>
<LI>Work with FAE and resolve customers' issues.</LI>
</UL>
</P>   
                                                                                 
<P><B>Requirements:</B>
<UL>
<LI>BS/MS EE/CS - 1-2 years of experience in board bringup/debug. ( will consider new college graduate with good GPA )</LI>
<LI>Experience with digital logic design, analog design a plus.</LI>
<LI>Team player with good communication and problem-solving skills.</LI>
</UL>
</P>

EOE

<P><B>PLATFORM NETWORKING ARCHITECT:</B><BR/>
In this key role you will be involved in research and development of architectures for networking integrated into core logic. Responsibilities include: performance analysis, measurement, and improvement and tuning of existing and proposed hardware. Additional duties include development of reference models, C simulation models, architectural validation, and infrastructure for hardware verification.</P>

<P><B>Required Skills and experience:</B>
<UL>
<LI>Must have strong knowledge and familiarity with network protocols, data structures and algorithms.</LI>
<LI>Requires solid programming and debugging skills, C/C++ and scripting.</LI>
<LI>BS, MS, or Ph.D. in CS, EE  (related technical field) or equivalent.</LI>
</UL>
</P>

<P><B>Desirable experience/ knowledge</B> (should include, however not limited to):
<UL>
<LI>PC architecture (memory spaces and types, devices, plug and play, etc).</LI>
<LI>Memory controllers, caches, virtual memory, hardware/operating-system interactions, bus and data link protocols (including PCI Express, PCI, HyperTransport).</LI>
<LI>TCP/IP, 802.11, 802.3, routing protocols, QOS, PHYs, security protocols, real-time streaming media protocols, firewall technology and NAT. </LI>
<LI>Software simulation of hardware.</LI>
<LI>Performance analysis, performance modeling, network simulation.</LI>
<LI>Statistics, queuing theory.</LI>
<LI>Experience in algorithmic and performance investigations.</LI>
</UL></P>
EOE

<P><B>DFT ENGINEER:</B><BR/>
Design and implement test methodologies for large, complex, high-volume Digital IC's.  Work with logic designers to review and analyze IC designs and apply test techniques as necessary.  Develop software to automate test logic insertion, timing analysis, vector generation and validation.  Continual optimization of production test cost and quality.</P>

<P><B>Requirements</B>
<UL>
<LI>BSEE Required, MS preferred.</LI>
<LI>In-depth knowledge of techniques for the automated testing of complex semiconductors, including JTAG, BIST, and ATPG.</LI>
<LI>Good programming skills in C++ and Perl5</LI>
</UL>
</P>

EOE

<P><B>SYSTEMS DESIGN LEAD:</B>
<UL>
<LI>Design, Debug and bring up motherboard.</LI>
<LI>Find chip related bus protocol problems and work with hardware and software groups to find resolution.</LI>
<LI>Validate the functionality of all bus interfaces.</LI>
<LI>High speed bus debug/characterization and motherboard stability improvement.</LI>
<LI>Work with FAE and resolve customers' issues.</LI>
<LI>BS/MS EE.</LI>
<LI>Team leader with good communication and problem-solving skills. </LI>
<LI>Minimum 5+ years of experience in board bringup/debug. </LI>
<LI>Extensive experience with digital logic design, analog design a plus. </LI>
<LI>Prior experience with customers interaction and support a plus</LI>
</UL></P>
EOE

<P><B>SR. SIGNAL INTEGRITY ENGINEER:</B><BR/>
This engineer will work in the Graphics Processor Unit (GPU) hardware engineering group.  He/she will report to the Director of System Design and be responsible for the design of graphics subsystems utilizing NVidia's chip sets. The members that will be a part of this new group are outstanding individuals that will need to handle challenging high speed designs, model generation, verification and pre/post layout simulation and constraint management of high speed digital busses.  Work as part of a team with logic, module designers, PCB and component engineers to characterize packages and define termination strategies.</P>

<P><B>Primary area of responsibility:</B><BR/>
This engineer will be responsible for the design of digital interfaces connected to the , including the Advanced Graphics Processor (AGP) bus, Double Data Rate (DDR) memories, TV encoders, and 1394 phy chips. The design process will include development of ASIC I/O cells, package substrates, net topologies, termination schemes, board stackups, power distribution, bypass decoupling, system timing spreadsheets, and routing documents.</P>

<P><B>Secondary area of responsibility:</B><BR/>
This engineer will work with a Board Design Engineer to power on, bring up, debug, and validate the new product reference design, taking responsibility for the design robustness over temperature, voltage, and frequency.</P>

<P><B>Experience:</B><BR/>
This engineer should be competent in the field of signal integrity and high speed digital design where transmission line environments are common.   Previous design experience in a field which may include networking, graphics or computer systems is necessary. Must be proficient with most signal integrity simulation tools using SpecctraQuest, APSIM, HSPICE, and Model validation software such as IConnect is preferred. A good knowledge of transmission line analysis, Full-wave 3D analysis techniques such as FDTD and Method of moments is beneficial.  Experience correlating simulation results with lab measurements using oscilloscopes, TDRs, VNAs, and spectrum analyzers is a plus.</P>

<P>Education:  BSEE, BSCE and 5 years of experience.</P>

EOE

<P><B>APPLICATIONS ENGINEER INTERN/CO-OP:</B><BR/>
This is an opportunity to work on the hottest GPUs (Graphics Processing Units) before they've been shown to the world!  The Applications Engineer is involved in all aspects of New Product Introduction such as PCB (printed circuit board) design, silicon and PCB characterization, stress testing, hardware failure analysis, tuning high performance memory subsystems, solving complex system problems, and consulting on customer designs.  Issues such as noise, power, thermals, AC timing, EMI, display output quality, and transmission line effects, are explored.</P>
                                                                                                   
<P>As an Applications Engineer, you will be interfacing with hardware designers, software engineers, sales, and the operations team to ensure the timely rollout of new products.  At your disposal are the highest bandwidth DSO (digital storage oscilloscopes) and logic analyzers available.  Powerful in-house tools empower Applications Engineers with the ability to develop custom routines, which are
compiled on the fly during run-time, to fully exercise any and all functions of the GPU.  You will be learning and helping to develop the best systems engineering practices in the industry.</P>
                                                                                                                                 
<P>GPA 3.5</P>
                                                                                                                           
<P>Senior and junior level positions available.  </P>
                                                                                    
<P>The ideal candidate will be working towards a degree in EE, CE, CS, Systems Engineering or Engineering Science/Physics, with an emphasis in computer architecture, digital design, circuit analysis, and device physics.
<UL>
<LI>Knowledge of PC architecture and high-speed digital design concepts a must.</LI>
<LI>Knowledge of graphics system preferred.</LI>
<LI>Experience in hardware development or testing is highly desirable.</LI>
<LI>Programming skills and strong written/verbal ability are required.</LI>
<LI>Recently graduated candidates should have a 3.5+ GPA in relevant coursework and project work.</LI>
</UL></P>
EOE

<P><B>MEMORY ARCHITECT:</B><BR/>
Architect groundbreaking memory subsystems for the hottest chips in 3D graphics and chipsets!  In this capacity, the architect will be expected to become familiar with NVIDIA current architecture, algorithms, products, and development methodologies, and understand current and developing PC architectures and to analyze performance and features of proposed products and to develop algorithms and architectures to support nVidia's product plans.</P>

<P><B>Requirements:</B>
<UL>
<LI>Experience in memory subsystem design issues such as: DRAM operation (RAS, CAS, Banks, DRAM pages, RW turn-around), FIFO sizing, system memory types and configuration (cacheable, write-combined), arbitration amoung multiple clients and latency and bandwidth tradeoffs with all of the above.</LI>
<LI>Experience with C simulation for hardware design and system modeling.</LI> 
<LI>Experience with system unit and performance analysis through mathematical models, spreadsheet modeling, and simulation a strong plus.</LI>
<LI>Experience with trace-driven analysis and simulation a strong plus.</LI>
<LI>Experience with hardware/software interface design a strong plus.</LI>
<LI>Advanced degree in Computer Science, Engineering, Mathematics, or related discipline and 5+ years industry experience expected.</LI>
</UL></P>
EOE


<DIV ALIGN="center" CLASS="dropdown"><INPUT TYPE="SUBMIT" VALUE=" Submit "/>&#160;<INPUT TYPE="RESET" VALUE=" Clear "/></DIV>

</FORM>
<!--end contextual links-->
          
          <P><BR/></P>
          </TD>
          <TD VALIGN="top" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
        </TR>
        <TR>
          <TD COLSPAN="4" VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="10" BORDER="0"/></TD>
        </TR>     
        <TR>
          <TD VALIGN="top" BGCOLOR="#CCCCCC" WIDTH="11" ALIGN="right"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="8" BORDER="0"/></TD>
          <TD VALIGN="top" WIDTH="75"><IMG SRC="/i/table_mid_left2.gif" ALT="" WIDTH="14" HEIGHT="8" BORDER="0"/></TD>
          <TD VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
          <TD VALIGN="top" BGCOLOR="#CCCCCC" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
        </TR>  
        <TR>
          <TD VALIGN="top" WIDTH="11" ALIGN="right" BGCOLOR="#CCCCCC"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="8" BORDER="0"/></TD>
          <TD VALIGN="top" BGCOLOR="#CCCCCC" WIDTH="14"><IMG SRC="/i/table_btm_left2.gif" ALT="" WIDTH="14" HEIGHT="8" BORDER="0"/></TD>
          <TD VALIGN="top" BGCOLOR="#CCCCCC" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
          <TD VALIGN="top" BGCOLOR="#CCCCCC" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
        </TR>
      </TABLE>
    </TD>
  <!-- Center Column Ends -->
<!-- Body Area Ends -->

  <!-- Gutter -->
    <TD WIDTH="4" BGCOLOR="#CCCCCC"><IMG SRC="/i/clear.gif" WIDTH="4" HEIGHT="1" BORDER="0"/></TD>
    <!-- Gutter Ends -->
  <!-- Right Column Begins -->
    <TD WIDTH="170" BGCOLOR="#CCCCCC" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="170" HEIGHT="1" BORDER="0"/><br/>
<!-- <xsl:if test="not(/TC/LoggedIn='true')">
<xsl:call-template name="module_login"/>
</xsl:if> -->
<!-- Right Column Include Begins --> 
        <xsl:call-template name="public_right_col"/>      
<!-- Right Column Include Ends -->        
        </TD>
  <!-- Right Column Ends -->
  <!-- Gutter -->
    <TD WIDTH="25" BGCOLOR="#CCCCCC"><IMG SRC="/i/clear.gif" WIDTH="25" HEIGHT="1" BORDER="0"/></TD>
    <!-- Gutter Ends -->
  </TR>
</TABLE>
<!-- Body Ends -->
        <xsl:call-template name="Foot"/>
      </BODY>
    </HTML>
  </xsl:template>
</xsl:stylesheet>
