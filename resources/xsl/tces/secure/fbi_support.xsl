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
<TABLE WIDTH="100%" CELLPADDING="0" CELLSPACING="0" BORDER="0">
   <TR>
      <TD VALIGN="middle" HEIGHT="18" BGCOLOR="#43515E" CLASS="statText"><B>&#160;Back to FBI Jobs</B></TD>
  </TR>
  <TR>
      <TD VALIGN="middle" HEIGHT="18" CLASS="bodyText">&#160;&#160;<A HREF="/?&amp;t=tces&amp;c=fbi_openings&amp;a=secure" CLASS="bodyText">Back to Jobs</A>&#160;|&#160;
<A CLASS="bodyText" HREF="/?&amp;t=tces&amp;c=fbi">FBI Main Page</A>
      </TD>
  </TR>
</TABLE>
<IMG SRC="/i/es/fbi/fbi_logo.gif" WIDTH="100" HEIGHT="103" ALT="" BORDER="0"/>

<P>
<B>IT Specialist (Sys Adm/Customer Support)</B>
</P>
<P><B>This announcement will close at 11/4/2002 12:00 midnight CST. To be considered for employment, you must submit your application before that time.</B> </P>
<P><B>Duty Location:</B> Sacramento, CA </P>
<P><B>Area of Consideration:</B> All Sources within the Sacramento Commuting Area  </P>
<P> 
<B> Who May Apply </B></P>
<OL>
<LI>Current and former civilian federal employees serving under any type of appointment within the Sacramento commuting area may apply. </LI>
<LI>All other qualified applicants within the Sacramento commuting area may apply. </LI>
<LI>Applications will not be accepted from outside the area of consideration. </LI>
</OL>

<UL>
<LI>Expenses incurred will be borne by the selectee. </LI>
<LI>The selectee may be required to serve a one-year probationary period.</LI>
</UL>
<P><B>Duties &amp; Responsibilities: </B></P>

<P>GS-9: Provides technical support concerning the implementation and daily operations of the computer systems and individual microcomputer functions within a field office. In this capacity performs a variety of duties, in support of users located thought the Field Office, resident agencies and/or other off-site locations.</P>

<P>GS-11: As a senior ITS assigned to a Field Office, directs the daily operations of computers that function either as stand alone single processor computer systems or as interlocking portions of the overall mainframe computer system, which is in essence a network/system of microcomputers operating in a distributed environment mode. In this capacity, resolves complex processing problems and errors conditions, except those requiring mainframe programming changes, and serves as an authority concerning the capabilities and potential of on-line applications and individual micro program, used to support administrative and investigative efforts.</P>

<P><B>Qualification Requirements:</B></P> 

<P>GS-9: Applicant must have one year of Specialized Experience at least equivalent to the GS-7 level.</P>

<P>Specialized Experience: Experience which demonstrated knowledge of computer requirements and techniques in carrying out project assignments consisting of several related tasks, such skills typically is the case in development of minor modifications to parts of a system on the basis of detailed specifications provided.</P>

<P>GS-11: Applicant must have one year of Specialized Experience at least equivalent to the GS-9 level.</P>

<P>Specialized Experience: Experience which demonstrated accomplishment of computer project assignments that required a range of knowledge of computer requirements and techniques. For example, assignments would show, on the basis of general design criteria provided, experience in developing modifications to parts of a system that required significant revisions in the logic or techniques used in the original development.</P>

<P>EDUCATION: For grades GS-9 through GS-11 the following graduate education requirements may be substituted for experience: SEE SPECIFIC COURSE WORK REQUIREMENTS BELOW:</P>

<P>GS-9: Two full academic years of graduate level education or Master's Degree or equivalent graduate degree or LL.B. or J.D.</P>

<P>REQUIRED GRADUATE LEVEL COURSE WORK: Transcript from accredited college or university must accompany application and show major study (progressive course work leading to a major in): computer science, information science, information systems management, mathematics, statistics, operations research, or engineering, or course work which required the development or adaptation of computer programs and systems and provided knowledge equivalent to a major in the computer field.</P> 

<P>EDUCATION: Education completed in foreign colleges or universities may be used to meet the above requirements if you can show that the foreign education is comparable to that received in an accredited educational institution in the United States.</P>

<P>Applicants must meet qualification requirements by the closing date of this announcement.</P>

<P>BASIS FOR RATING: Applicants who meet the qualifications above will be further evaluated to determine the extent to which their education, work experience and training indicate they possess the knowledge, skills abilities (KSAs) required to perform the duties and responsibilities of the position.</P>

<P><B>RANKING FACTORS/KSAs: When addressing the knowledge, skills and abilities for this position, classified and/or sensitive information should not be stated or attached to your application.</B></P>

<P><B>APPLICANTS FOR ALL GRADE LEVELS MUST ADDRESS THE FOLLOWING KSAs:</B><BR/><BR/>
<B>1.</B> Ability to work effectively with others to resolve technical problems.<BR/>
<B>2.</B> Ability to analyze situations and reach logical conclusions. <BR/>
<B>3.</B> Ability to communicate technical information to both non-technical and technical personnel.<BR/>
<B>4.</B> Ability to communicate effectively in writing.<BR/>
<B>5.</B> Knowledge of computer software, equipment and operating systems. </P>

<P><B>IN ADDITION TO THE ABOVE, APPLICANTS APPLYING FOR THE GS-9 MUST ADDRESS THE KSAs LISTED BELOW: </B><BR/><BR/>
<B>6.</B> Knowledge of current state of the art network administration and telecommunications practices and techniques.<BR/>
<B>7.</B> Knowledge of the design, development, and implementation of software for stand-alone and networked microcomputer applications. </P>

<P><B>IN ADDITION TO THE ABOVE, APPLICANTS APPLYING FOR THE GS-11 LEVEL MUST ADDRESS THE KSAs LISTED BELOW:</B><BR/><BR/>
<B>8.</B> Ability to install, maintain, and troubleshoot hardware/software (including client/server), and perform LAN/WAN diagnostics. </P>

<P><B>WORKING CONDITIONS:</B></P>
<OL>
<LI>Applicant must be available for travel, as necessary. </LI>
<LI>A valid Government driver's license is necessary. </LI>
<LI>Day shift, but must be available to work other shifts as required. </LI>
<LI>Must be able to lift heavy weight in excess of 50 lbs with or without reasonable accommodation. </LI>
<LI>Must be willing and able to work in confined spaces as necessary.</LI>
</OL>

<P><B>HOW TO APPLY:</B></P>
<P>Applicants have several options in applying for this position. Applicants must submit all documents as required by this announcement. Applicants applying on-line for this position will be able to apply until 12:00 midnight Central Time on the closing date of this announcement.</P>
<OL>
<LI>Due to mail delays, applicants are strongly encouraged to apply for this position using the FBI's on-line application system at www.fbijobs.com. Please Note: When applying on-line, current federal employees or those with reinstatement eligibility, must fax a copy of their latest SF-50, Notification of Personnel Action and most current performance appraisal. If you are qualifying based on education, you must also fax a copy of your college transcripts. If you are claiming veterans' preference, you must fax supporting documentation (i.e., DD-214, SF-15, VA letter). Fax number 202-324-5388. When faxing documents, your name, announcement number and the title of the position you are applying for, must be stated on each page. If you do not identify what you are applying for, your application may not be considered. </LI>
<LI>Because applicants have the option of applying on-line or faxing, applications received via the mail after the rating process has begun will not receive consideration. Applicants may mail in their applications to the following address: Federal Bureau of Investigation, Staffing Unit, Room 6094, 935 Pennsylvania Avenue, N.W., Washington, D.C. 20535, Attention: Penny Reed. Submit the original and one copy of your application. All applications must be received by the closing date in order to receive consideration. </LI>
<LI>Applicants may fax their applications to 202-324-5388. You must also fax any of the documents listed in #1 as required by this vacancy. The announcement number and your name must be printed on each page of the applications. Illegible applications will not be considered, nor will you be contacted to submit another application. </LI>
<LI><B>FBI employees may not apply on-line.</B> FBI employees must submit the original and a copy of his/her application internally. Applicants must complete and sign the FD-881 FBI Support Position Application, fill out the Basic Requirements page(s), address the Ranking Factors/KSAs, and submit to the Staffing Unit, Room 6094, or Fax to 202-324-5388, Attention: Penny Reed. </LI>
</OL>

<P>Should you have any questions, you may contact Penny Reed at 202-324-2506.</P>

<P>Applicants must indicate at the top of their application, the lowest grade they are willing to accept. Failure to do so will result in your being considered only for the highest grade level for which you qualify.</P>

<P>Current Federal employees serving under a career or career-conditional appointment, and former Federal employees with reinstatement eligibility who wish to be considered for this position under merit promotion and/or FBI external examining procedures, must indicate their preference(s). (For those applying by fax or through the mail, you must document your preference on the first page of your application. For those applying through the FBI's on-line application system, you must indicate your preference in your resume response.) In addition, you must submit a copy of your latest SF-50, Notification of Personnel Action. Also, if you wish to be considered under the FBI external examining procedure, you must submit your DD-214 for proper application of veteran's preference.</P> 

<P><B>ADDITIONAL INFORMATION </B></P>
<UL>
<LI>Identification of promotion potential in this announcement does not constitute a commitment or an obligation on the part of management to promote the employee selected at some future date. Promotion will depend upon administrative approval and the continuing need for an actual assignment and performance of higher-level duties. </LI>
<LI>Management has the prerogative to select at any grade for which this position has been announced. </LI>
<LI>To expedite the process, candidates selected for an interview will be advised to bring a completed copy of Form FD-140, Employment for Application, Federal Bureau of Investigation. </LI>
<LI>As a condition of employment, male applicants born after December 31, 1959, must have registered with the selective service system, or are exempt from having to do so under Selective Service Law. </LI>
<LI>Application materials will not be returned. However, official transcripts will be returned if requested during the opening period of this announcement only. </LI>
<LI>Applicants must notify the office of any contact number or address changes. Failure to do so may result in the discontinuation of your application.</LI>
</UL>

<P>Your failure to provide necessary and relevant information required by this vacancy announcement may disqualify you for consideration. Additional information will not be requested when your application is incomplete. Your application will be evaluated solely on the basis of information you have submitted.</P>

<P>This position is in the excepted service. It is excluded from the provisions under the Veterans Employment Opportunity Act (VEOA), the Veterans Readjustment Act (VRA), and the career transition assistance program. </P>

<P>Applicants claiming veteran's preference must clearly identify: if you served on active duty in the U.S. Military and were separated under honorable conditions, you may be eligible for veterans' preference. Military retirees at the rank of Major, Lieutenant Commander or higher are not eligible for preference unless they are disabled veterans. National Guard and Reserve active duty for training purposes does not qualify for preference. If you claim veterans' preference , you must submit a copy of your DD-214 which documents your character of service with your application. If you claim 10-point Veterans' Preference, you must also submit a SF-15, application for 10-point Veterans Preference, and the required documentation listed on the form to support the claim. More information on Veterans' Preference is available in the VETGUIDE which may be found at the United States Office of Personnel Management's web site at www.opm.gov.</P>
 
<P>Applicants must be U.S. citizens and consent to a complete background investigation, urinalysis, and polygraph. Only those candidates determined to be best qualified will be contacted to proceed in the selection process.</P>

<P>The FBI welcomes and encourages applications from persons with physical and mental disabilities and will reasonably accommodate the needs of those persons. The decision on granting reasonable accommodation will be on a case-by-case basis. The FBI is firmly committed to satisfying its affirmative obligations under the Rehabilitation Act of 1973, to ensure that persons with disabilities have every opportunity to be hired and advanced on the basis of merit within the FBI.</P>

<P>The Federal Bureau of Investigation is an Equal Opportunity Employer. All qualified applicants will receive consideration for this vacancy. Except where otherwise provided by law, selection will be made without regard to, and there will be no discrimination because of race, religion, color, national origin, sex, political affiliations, marital status, nondisqualifying physical or mental disability, age, sexual orientation, membership or nonmembership in an employee organization, or on the basis of personal favoritism or other non-merit factors.</P>

<P ALIGN="center"><A HREF="/jobposting?&amp;t=JobHitTask&amp;jid=62&amp;jt=1" TARGET="_blank" CLASS="bodyText">APPLY NOW</A> | <A HREF="/?&amp;t=tces&amp;c=fbi_openings&amp;a=secure" CLASS="bodyText">Back to Jobs</A></P>
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
