<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:import href="../top.xsl"/>
  <xsl:import href="../script.xsl"/>
  <xsl:import href="../includes/body_top.xsl"/>  
  <xsl:import href="../foot.xsl"/>
  <xsl:import href="../includes/modules/practice_room.xsl"/>
  <xsl:import href="../includes/modules/module_login.xsl"/>  
  <xsl:import href="../includes/modules/calendar.xsl"/>
  <xsl:import href="../includes/jobs/public_jobs_left.xsl"/> 
  <xsl:import href="../includes/public_right_col.xsl"/>     
  <xsl:output indent="no" method="html" doctype-public="-//W3C//DTD HTML 4.0 Transitional//EN"/>
  <xsl:template match="/">
    <HTML>
      <HEAD>
        <xsl:call-template name="Preload"/>      
        <TITLE>TopCoder :: Jobs</TITLE>
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
        <xsl:call-template name="public_jobs_left"/>
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
<!--body contextual links-->
<!-- <TABLE BORDER="0" CELLSPACING="0" CELLPADDING="1" VALIGN="top" WIDTH="150">
   <TR>
        <TD ROWSPAN="5" VALIGN="top" BGCOLOR="#FFFFFF" CLASS="smallText"><IMG SRC="/i/clear.gif" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
        <TD COLSPAN="2" BGCOLOR="#FFFFFF" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="5" BORDER="0"/></TD>
    </TR> 
                <TR> 
                <TD COLSPAN="2" BGCOLOR="#999999" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="150" HEIGHT="1" BORDER="0"/></TD>
                </TR>
              <TR>
                    <TD VALIGN="top" BGCOLOR="#999999" CLASS="moduleTitle">&#160; &#160;</TD>
                <TD BGCOLOR="#999999" VALIGN="top" CLASS="moduleTitle">EMPLOYMENT LINKS:</TD>
              </TR>                    
              <TR>
                    <TD COLSPAN="2" VALIGN="top" BGCOLOR="#999999">
          <TABLE BORDER="0" WIDTH="100%" CELLSPACING="0" CELLPADDING="2" BGCOLOR="#CCCCCC">
            <TR>
              <TD VALIGN="top" CLASS="smallText">&#160;&#160;</TD>
              <TD COLSPAN="2" VALIGN="top" CLASS="bodyText"><A HREF="mailto:tces@topcoder.com" CLASS="bodyText">Contact employment services</A></TD>
            </TR>
            <TR><TD VALIGN="top" COLSPAN="3" CLASS="smallText"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="5" BORDER="0"/></TD></TR>        
          </TABLE>
                </TD>
            </TR>
   <TR><TD COLSPAN="2" VALIGN="top" BGCOLOR="#FFFFFF" CLASS="smallText"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="10" BORDER="0"/></TD></TR>                
</TABLE> -->
<IMG SRC="/i/es/google_sm.gif" WIDTH="143" HEIGHT="59" BORDER="0"/><BR/>       

<P>
<B>Positions currently available</B>
</P>

&#149;&#160;<a href="#sw_qem" class="bodyText">Software Quality Engineering Manager</a><BR/>
&#149;&#160;<a href="#systems" class="bodyText">Software Engineers</a><BR/>
&#149;&#160;<a href="#senior_sw" class="bodyText">Senior-level Software Engineers</a><BR/>
&#149;&#160;<a href="#test_eng" class="bodyText">Senior Software Test Engineer</a><BR/>
&#149;&#160;<a href="#java" class="bodyText">Software Engineers (Java)</a><BR/>
&#149;&#160;<a href="#jk_search" class="bodyText">Software&#160;Engineer&#160;(Japanese/Korean&#160;Search)</a><BR/>
&#149;&#160;<a href="#windows" class="bodyText">Software Engineer (Windows)</a><BR/>
&#149;&#160;<a href="#cluster" class="bodyText">Software Engineer (Cluster Management)</a><BR/>
&#149;&#160;<a href="#frontend" class="bodyText">Software Engineer (Frontend Production)</a><BR/>
&#149;&#160;<a href="#int_web" class="bodyText">Internal Web Systems Engineer/Lead</a><BR/>
&#149;&#160;<a href="#eng_enterprise" class="bodyText">Enterprise Systems Engineer</a><BR/>
&#149;&#160;<a href="#usability" class="bodyText">Usability Analyst</a><BR/>
&#149;&#160;<a href="#hardware_ee" class="bodyText">Computer Hardware Evaluation Engineer</a><BR/>
&#149;&#160;<a href="#hardware_eng" class="bodyText">System Hardware Engineer</a><BR/>
&#149;&#160;<a href="#deployment" class="bodyText">Deployment Support Engineer</a><BR/><BR/>

<A HREF="mailto:tces@topcoder.com" CLASS="bodyText">Contact employment services</A><BR/><BR/>

 <h4><a name="sw_qem"><font color="093158">Software Quality Engineering Manager</font></a></h4>
<p>Google is looking for a special individual to drive software quality
improvement throughout our engineering groups. You will participate in
and lead a team responsible for establishing methodology, evangelism 
and developing software tools to find software
defects, establish or improve process and software as necessary, and
help track down problems and define test cases. You will also work closely
with our engineering groups to ensure the adoption and realization of
quality improvements. Here's an excellent opportunity for you to improve
the quality of the web experience of tens of millions of people.
<BR/>
</p>
<p><i>Qualities we are looking for:</i></p>
<ul>
<li>MS CS, PhD or equivalent.</li>
<li>7+ years developing software in C++ on UNIX/Linux.</li>
<li>A minimum of 5+ years experience driving software quality.</li>
<li>Strong leadership skills and proven success leading teams.</li>
<li>Inner drive to improve quality and the talent to make things break.</li>
<li>Experience with design for testability, regression testing and run-timemonitoring.</li> 
<li>Successful track record establishing and driving test processes and plans within a high technology software company.</li>
<li>Extensive familiarity with test automation tools and techniques.</li> 
</ul>
<p><a href="#top" class="bodyText">Back to List</a>&#160;&#160;|&#160;&#160;<A HREF="mailto:tces@topcoder.com?subject=Software Quality Engineering Manager" CLASS="bodyText">Inquire about this position</A></p><BR/>

<h4><a name="systems"><font color="093158">Software Engineers</font></a> </h4>
<p> Google is growing! We need world-class engineers to develop 
                         the next generation search engine. Our engineering team 
                         is working on problems in a number of areas, including 
                         cutting-edge information retrieval algorithms, scalability 
                         issues related to dealing with huge amounts of data and 
                         a rapidly increasing user population, and a variety of 
                         novel search features. If you have a need to bring order 
                         to a chaotic web, contact us. </p>
<p><i>Requirements:</i></p>
<ul>
<li>BS or MS in Computer Science or equivalent (Ph.D. a plus).</li> 
                         <li>Several years of software development experience. </li>
                         <li>Extensive experience programming in C++. </li>
                         <li>Extensive knowledge of Unix/Linux or Windows environments.</li>
                         <li>Knowledge of TCP/IP and network programming.</li> 
                         <li>Experience developing/designing large software systems.</li> 
                         <li>Experience programming in Python a plus.</li>
                    </ul>
<p><a href="#top" class="bodyText">Back to List</a>&#160;&#160;|&#160;&#160;<A HREF="mailto:tces@topcoder.com?subject=Software Engineers" CLASS="bodyText">Inquire about this position</A></p><BR/>

<h4><a name="senior_sw"><font color="093158">Senior-level Software Engineers</font></a> </h4>
<p>Help architect and extend one of the world's largest repositories 
                         of information. We're especially looking for experienced 
                         software engineers with superb design and implementation 
                         skills and considerable depth and breadth in the areas 
                         of high-performance distributed systems, operating systems, 
                         data mining, information retrieval, machine learning, 
                         and/or related areas. If you have a proven track record 
                         in cutting-edge research and/or large-scale systems development 
                         in these areas, we have plenty of challenging projects 
                         for you. </p> 
                    <p><i>Requirements:</i></p>
<ul>
<li>Ph.D. in Computer Science (or equivalent) preferred.</li> 
                         <li>Several years of software development experience.</li> 
                         <li>Proven track record doing cutting-edge research and/or 
                              systems development in operating systems, distributed 
                              systems, data mining, information retrieval, machine 
                              learning, or related areas.</li> 
                         <li>Extensive experience programming in C++.</li>
                         <li>Extensive knowledge of Unix systems programming (especially Linux).</li>
                         <li>Experience developing/designing large software systems.</li> 
                    </ul>
<p><a href="#top" class="bodyText">Back to List</a>&#160;&#160;|&#160;&#160;<A HREF="mailto:tces@topcoder.com?subject=Senior-level Software Engineers" CLASS="bodyText">Inquire about this position</A></p><BR/>

<h4><a name="test_eng"><font color="093158">Senior Software Test Engineer</font></a> </h4>
<p> Google is looking for a senior software test engineer 
                         to help ensure the quality of our software. You will 
                         work closely with the engineering team to support developer 
                         testing, expand our test suite and isolate new problems. 
                         Here's an excellent opportunity for you to use your talent 
                         while leading the SQA aspects of products that will change 
                         the web experience of millions of users.</p>
<p><i>Requirements:</i></p>
<ul>
<li>5+ years of testing experience.</li> 
                         <li>Strong Unix/Linux and shell scripting skills.</li>
                         <li>Strong Python/Perl programing skills.</li> 
                         <li>Good knowledge of C++.</li>
                         <li>Interested in being a very strong individual contributor.</li>
                         <li>Excellent communication skills. </li>
                         <li>BSCS or MSCS.</li> 
                    </ul>
<p><a href="#top" class="bodyText">Back to List</a>&#160;&#160;|&#160;&#160;<A HREF="mailto:tces@topcoder.com?subject=Senior Software Test Engineer" CLASS="bodyText">Inquire about this position</A></p><BR/>

<h4><a name="java"><font color="093158">Software Engineers (Java)</font></a></h4>
<p>We are hiring Java software engineers to write server-side 
                         code for web-based applications, for both internal and 
                         external use. We are looking for well-rounded developers 
                         who know how to create robust production applications, 
                         and can also develop prototypes quickly. You should have 
                         a good understanding of, and practical experience with, 
                         Java web application development.  </p>
                    <p><i>Requirements:</i> </p> 
                    <ul>
<li>BS/MS in CS or equivalent. </li>
                         <li>Strong Java skills and experience, including working knowledge of core libraries.</li> 
                         <li>Experience using SQL, and some database design experience.</li> 
                         <li>Significant development experience in a Unix/Linux environment.</li>
                         <li>Previous experience with JSP and servlets is a plus. </li>
                         <li>Experience with Python and C++ desired.</li> 
                    </ul>
<p><a href="#top" class="bodyText">Back to List</a>&#160;&#160;|&#160;&#160;<A HREF="mailto:tces@topcoder.com?subject=Software Engineers (Java)" CLASS="bodyText">Inquire about this position</A></p><BR/>

<h4><a name="jk_search"><font color="093158">Software Engineer (Japanese/Korean Search)</font></a></h4>
<p>Google is growing worldwide! More than half our traffic 
                         comes from outside the United States and we seek world-class 
                         engineers to focus on both our Japanese and Korean search 
                         technology. Our engineering team is working on a number 
                         of projects aimed at creating the best possible search 
                         experience in all languages. In this position you will 
                         address interesting linguistic issues that are unique 
                         to Asian languages, evaluate and incorporate best-of-breed 
                         third-party technologies, or learning from our vast corpora 
                         you will develop these technologies yourself.</p>
<p>If you are a native speaker of Japanese or Korean and are 
                         excited about making more of the web accessible to Korean 
                         or Japanese speakers, then consider joining Google's 
                         software development team:</p>
<p><i>Requirements:</i> </p>
<ul>
<li>BS or MS in Computer Science or equivalent (Ph.D. a plus).</li>
                         <li>Several years of software development experience.</li> 
                         <li>Extensive experience programming in C++.</li>
                         <li>Native speaker of Japanese or Korean. </li>
                         <li>Extensive knowledge of Unix/Linux or Windows environments. </li>
                         <li>Knowledge of TCP/IP and network programming.</li>
                         <li>Experience developing/designing large software systems.</li> 
                         <li>Experience programming in Python a plus.</li> 
                         <li>Knowledge of grammar/linguistics would be a significant plus. </li>
                    </ul>
<p><a href="#top" class="bodyText">Back to List</a>&#160;&#160;|&#160;&#160;<A HREF="mailto:tces@topcoder.com?subject=Software Engineer (Japanese/Korean Search)" CLASS="bodyText">Inquire about this position</A></p><BR/>

<h4><a name="windows"><font color="093158">Software Engineer (Windows)</font></a></h4>
<p>We are looking for Windows developers to join our world-class 
                         engineering team to design and develop cutting edge search 
                         tools. If you have a passion for driving and building 
                         new technologies, join our engineering development team.  </p>
                    <p><i>Requirements:</i> </p>
<ul>
<li>A minimum 3 years of Windows product development experience. </li>
                         <li>Extensive experience programming in C/C++/COM and OO skills. </li>
                         <li>Extensive knowledge of Windows SDK and Win32 API.</li>
                         <li>Experience with any of the following is a big plus: 
                              UI development, multithreaded software, Windows 
                              NT security, and network protocols.</li> 
                         <li>A strong desire to ship products and work in a small team is required.</li>
                         <li>A BS or MS in Computer Science or equivalent.</li>
</ul>
<p><a href="#top" class="bodyText">Back to List</a>&#160;&#160;|&#160;&#160;<A HREF="mailto:tces@topcoder.com?subject=Software Engineer (Windows)" CLASS="bodyText">Inquire about this position</A></p><BR/>

<h4><a name="cluster"><font color="093158">Software Engineer (Cluster Management)</font></a> </h4>
<p>Work with one of the world's largest Linux clusters! As 
                         a part of Google's top notch engineering team, you will 
                         build the infrastructure and tools that run and analyze 
                         Google's search engine and ensure 100% application uptime. 
                         The ideal candidate combines excellent Python and shell 
                         scripting skills with strong Linux cluster management 
                         skills. </p> 
                    <p><i>Requirements:</i> </p>
                     <ul>
<li>BS or MS in Computer Science or equivalent. </li>
                         <li>Several years of software development experience. </li>
                         <li>Extensive experience programming in Python.</li>
                         <li>Excellent knowledge of Linux and network programming.</li> 
                         <li>Experience developing/designing large software systems. </li>
                    </ul>
<p><a href="#top" class="bodyText">Back to List</a>&#160;&#160;|&#160;&#160;<A HREF="mailto:tces@topcoder.com?subject=Software Engineer (Cluster Management)" CLASS="bodyText">Inquire about this position</A></p><BR/>

<h4><a name="frontend"><font color="093158">Software Engineer (FrontEnd Production)</font></a> </h4>
<p>Help shape the way Google looks and works! As part of the 
                         frontend production team, you will assist in the design 
                         and coding of interfaces, do extensive development on 
                         the Google webserver, and help deploy new products and 
                         features to the Google site. Candidates for this position 
                         must be strong coders with excellent communication and 
                         coordination skills.</p>
<p><i>Requirements:</i> </p>
 <ul>
<li>BS/MS in Computer Science or equivalent.</li> 
                         <li>Significant development experience in a Unix/Linux environment using C/C++. </li>
                         <li>Expert HTML skills; background in UI/HCI issues helpful. </li>
                         <li>Javascript and/or webserver development experience a plus. </li>
                         <li>Strong verbal, written, and organizational skills. </li>
                         <li>Proven track record for being detail-oriented with 
                              a demonstrated ability to self-motivate and follow-through 
                              on projects.</li>
</ul>
<p><a href="#top" class="bodyText">Back to List</a>&#160;&#160;|&#160;&#160;<A HREF="mailto:tces@topcoder.com?subject=Software Engineer (FrontEnd Production)" CLASS="bodyText">Inquire about this position</A></p><BR/>

<h4><a name="int_web"><font color="093158">Internal Web Systems Engineer/Lead</font></a></h4>
<p>We are looking for an enthusiastic engineer to join Google's 
                         Information Systems group in an effort to support the 
                         information needs of a wide range of business users throughout 
                         the company. You will be responsible for selecting and/or 
                         building tools and interfaces to automate repetitive 
                         tasks, implementing web based automation, and generating 
                         reports from SQL data sources. In this position you will 
                         play a crucial role as Google diversifies and grows revenue 
                         streams. </p>
<p> <i>Requirements:</i> </p>
 <ul>
<li>BS or MS in Computer Science, Information Systems, or equivalent.</li>
<li>Minimum of 4+ years commercial information systems experience.</li>
<li>Experience with Oracle and SQL, ERP systems a plus.</li>
<li>Strong scripting skills.</li>
<li>Strong experience interfacing with various business systems.</li>
<li>Fluent with Unix and Windows environments.</li>
</ul>
<p><a href="#top" class="bodyText">Back to List</a>&#160;&#160;|&#160;&#160;<A HREF="mailto:tces@topcoder.com?subject=Internal Web Systems Engineer/Lead" CLASS="bodyText">Inquire about this position</A></p><BR/>

<h4><a name="eng_enterprise"><font color="093158">Enterprise Systems Engineer</font></a> </h4>
<p>Google is the premier provider of Internet search and has 
                         the most advanced search technology in the world. We 
                         are looking for a senior level Engineer to 
help create and
maintain the Linux servers/clusters that power Google's corporate search 
appliances.
The ideal candidate is goal-oriented, has the ability to handle 
interruptions while fluidly
switching between several projects, and takes a "work smarter, not 
harder" approach.
</p>
<p> <i>Responsibilities:</i> </p>
 <ul>
<li>Work within Engineering maintaining/developing OS infrastructure for search appliances: </li>
                              <ul>
<li>Configure highly customized Linux distribution and networks.</li>
<li>Package management (release updates), applying security patches.</li>
<li>Help develop tools to maintain and monitor corporate appliances.</li>
<li>Write comprehensive documentation.</li>
</ul>
<li>Monitor stability and performance--offer troubleshooting support to appliance customers.</li>
<li>Train/mentor Junior System Administrators.</li>
</ul>
<p><i>Requirements:</i></p>
<ul>
<li>BS or MS in Computer Science or equivalent experience.</li>
<li>5+ years experience with Unix.</li>
<li>3+ years experience with Linux.</li>
<li>2+ years running large production systems (more than 500 servers).</li>
<li>2+ years doing package management with Linux.</li>
<li>Extensive knowledge of TCP/IP networking, routers, switches, and load balancers.</li>
<li>Extensive knowledge of webservers, firewalls/security, NFS, DNS, NIS, MTAs, VPNs.</li>
<li>Solid H/W understanding of Intel-based PCs.</li>
<li>Programming/scripting ability (Bourne, Perl, Python, C/C++).</li>
</ul>
 <p><a href="#top" class="bodyText">Back to List</a>&#160;&#160;|&#160;&#160;<A HREF="mailto:tces@topcoder.com?subject=Enterprise Systems Engineer" CLASS="bodyText">Inquire about this position</A></p><BR/>
                        
                        <h4><a name="usability"><font color="093158">Usability Analyst</font></a></h4>
<p>Help us find out about our users! Google is looking for 
                         a Usability Analyst to work on all aspects of user testing 
                         at Google. Your responsibilities will include designing 
                         and conducting qualitative user studies to gauge the 
                         usability of new and existing Google features, conducting 
                         log analyses and surveys, and making concrete, data-driven 
                         recommendations for change based on your findings.</p>
<p>The ideal candidate will have strong analytical and quantitative 
                         skills and can work well with technically-minded and 
                         statistically sophisticated people. He or she must be 
                         able to work independently and fast, to manage multiple 
                         projects, and to produce useful data and recommendations 
                         for a wide variety of projects.<BR/>
</p>
<p><i>Requirements:</i> </p>
<ul>
<li> Demonstrated experience in conducting user studies with various scopes and formats (3 - 5 years experience preferred).</li>
<li>Excellent analytical skills, especially with regard to assessing factors in user behavior.</li>
<li>Strong oral and written communication skills.</li>
<li>Solid background in social science research methodology, statistics, and data analysis.</li>
<li>BS or MS in Human Computer Interaction, Cognitive Psychology, Information Science, or related field.</li>
<li>Knowledge of or experience with one or more of the following is a big plus:</li> 
                              <ul>
<li>Web design principles or first-hand experience designing web pages,</li>
<li>HTML, Javascript, and/or programming concepts,</li>
<li>Log analysis or survey data analysis,</li>
<li>Shell scripting, Perl or Python,</li>
<li>Digital video recording or editing software.</li>
</ul>
</ul>
<p><a href="#top" class="bodyText">Back to List</a>&#160;&#160;|&#160;&#160;<A HREF="mailto:tces@topcoder.com?subject=Usability Analyst" CLASS="bodyText">Inquire about this position</A></p><BR/>
                         
<h4><a name="hardware_ee"><font color="093158">Computer Hardware Evaluation Engineer</font></a></h4>
<p>Play a key role in the development of new Google products! 
                         Google is looking for an experienced Computer Hardware 
                         Evaluation Engineer. You be will be responsible for the 
                         evaluation of new hardware designs and for the resolution 
                         of hardware problems in current designs. Your duties 
                         will include devising test plans and specifying test 
                         equipment. </p>
<p><i>Position requirements:</i></p>
<ul>
<li>BSEE, BSCS, BSIT, or equivalent experience.</li>
<li>5 years hands-on experience testing microprocessor 
                              boards and peripheral computer hardware to the component 
                              level.</li>
<li>Majority of test and troubleshooting experience will 
                              have been in a research and development environment 
                              (not production).</li>
<li>Recent experience with Intel Pentium III and IV processors 
                              and related chip sets as used in highly networked 
                              systems.</li>
</ul>
<i>Desired talents and experience:</i> 
<ul>
<li>Thorough understanding of hardware evaluation techniques 
                              and methodologies, including development of test 
                              cases/suites, test automation strategies, analysis 
                              of test data, and implementation of failure prevention 
                              and correction methods.</li>
<li>Working familiarity with Linux and Windows operating systems.</li>
<li>Self-starter.</li>
<li>Highly entrepreneurial.</li>
<li>Excellent oral and written communication skills. 
                              Ability to effectively communicate with people from 
                              diverse educational, experiential, and cultural 
                              backgrounds.</li>
<li>Ability to remain organized and effective in a fast-paced, 
                              start-up environment will ensure priority consideration.</li>
</ul>
<p><a href="#top" class="bodyText">Back to List</a>&#160;&#160;|&#160;&#160;<A HREF="mailto:tces@topcoder.com?subject=Computer Hardware Evaluation Engineer" CLASS="bodyText">Inquire about this position</A></p><BR/>
                         
                         
<h4><a name="hardware_eng"><font color="093158">System Hardware Engineer</font></a></h4>
<p>Play a key role in Google's site operations! Google is 
                         looking for an experienced System Hardware Engineer. 
                         You be will be responsible for troubleshooting and diagnosing 
                         hardware problems, including test plan development and 
                         test automation.</p>
<p><i>Position requirements:</i></p>
<ul>
<li>5+ years related experience in depth knowledge of 
                              the PC architecture (x86 processors, ISA, PCI programming) 
                              and recent in-depth experience with x86 based PC 
                              motherboards, processors, and chipsets.</li>
<li>Experience writing C/C++ device drivers for the PC architecture.</li>
<li>Strong knowledge of distributed computing platforms and interconnects.</li>
<li>Strong organizational, logistical, and problem resolution skills.</li>
<li>Ability to write scripts and programs for hardware testing.</li>
<li>Thorough understanding of hardware QA and test techniques 
                              and methodologies, including development of test 
                              cases/suites, test automation strategies, analysis 
                              of test data, and implementation of failure prevention 
                              and correction methods.</li>
<li>MSCS, MSEE or higher degree or equivalent experience.</li>
</ul>

<p><i>Desired requirements:</i></p>
<ul>
<li>Solid Linux background.</li>
<li>Self-starter.</li>
<li>Excellent oral and written communication skills - 
                              ability to effectively communicate with people from 
                              diverse educational and cultural backgrounds.</li>
<li>Software/hardware development management/project 
                              management experience a plus, particularly experience 
                              w/ hands-on management of a hardware build.</li>
<li>Ability to remain organized and effective in a fast-paced, 
                              start-up environment will ensure priority consideration.</li>
</ul>
<p><a href="#top" class="bodyText">Back to List</a>&#160;&#160;|&#160;&#160;<A HREF="mailto:tces@topcoder.com?subject=System Hardware Engineer" CLASS="bodyText">Inquire about this position</A></p><BR/>

<h4><a name="deployment"><font color="093158">Deployment Support Engineer</font></a></h4>
<P>
This position in the Google Search Services Support Team will be responsible for ensuring the successful deployment of the Google Search Appliance products and services in the enterprise customer environment. Candidate will provide senior technical assistance to customers for installation, implementation support and consulting activities. They will also provide support in configuration, setup, replication and diagnosis of customers' problems. Working knowledge of server appliance product support, XSLT customization and regular expressions manipulation is a plus. Some travel may be required.
</P>

<p><i>Position requirements:</i></p>

<UL>
	<LI> BS degree in Computer Science, Electrical Engineering, or related field.</LI>
	<LI> 5 plus years industry experience in enterprise level software or hardware product deployment.</LI>
	<LI> Strong troubleshooting skills in a Linux environment.</LI>
	<LI> Software development and Internet security experience preferred.</LI>
	<LI> Working knowledge of web technologies, Internet protocol and Unix system administration.</LI>
	<LI> Knowledge of DNS, routing, load balancer and good understanding of RAID and server appliance hardware issue is preferred.</LI>
	<LI> Enthusiasm for problem solving and the ability to work independently and rapidly.</LI>
	<LI> Excellent communication and interpersonal skills.</LI>
	<LI> Outstanding account management and follow-through skills.</LI>
	<LI> Ability to work well with engineers, sales and external customers.</LI>
	<LI> Able to handle ambiguity and generate detailed incident reports.</LI>
	<LI> Must be self-motivated, self-learner, customer oriented, resourceful, enthusiastic and welcome a challenge.</LI>
</UL>
<p><a href="#top" class="bodyText">Back to List</a>&#160;&#160;|&#160;&#160;<A HREF="mailto:tces@topcoder.com?subject=Deployment Support Engineer" CLASS="bodyText">Inquire about this position</A></p><BR/>

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
