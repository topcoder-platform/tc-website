<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:import href="../../top.xsl"/>
  <xsl:import href="../../script.xsl"/>
  <xsl:import href="../../includes/body_top.xsl"/>  
  <xsl:import href="../../foot.xsl"/>
  <xsl:import href="../../includes/modules/practice_room.xsl"/>
  <xsl:import href="../../includes/modules/module_login.xsl"/>  
  <xsl:import href="../../includes/modules/calendar.xsl"/>
  <xsl:import href="../../includes/global_left.xsl"/> 
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
    <TD WIDTH="180" VALIGN="top">
  <!-- Global Seconday Nav Begins -->    
<!-- Left Column Include Begins -->  
    <!-- Global Seconday Nav Begins -->  
        <xsl:call-template name="global_left"/>
  <!-- Global Seconday Nav Ends -->  
<!-- Left Column Include Ends -->
      </TD>
  <!-- Left Column Ends -->
	<!-- Gutter Begins -->
		<TD WIDTH="4" BGCOLOR="#FFFFFF" VALIGN="top"><IMG SRC="/i/table_top_fill.gif" WIDTH="4" HEIGHT="26" BORDER="0"/></TD>
    <!-- Gutter Ends -->

<!-- Body Area -->
  <!-- Center Column Begins -->  
		<TD CLASS="bodyText" WIDTH="100%" BGCOLOR="#FFFFFF" VALIGN="top">
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
<B>Special Agents</B>
</P>

<P>
<B>Duties and Responsibilities:</B><BR/>
As the primary investigative arm of the federal government, the FBI is responsible for enforcing over 260 federal statutes and for conducting sensitive national security investigations.
FBI activities include investigations into organized crime, white-collar crime, public corruption, financial crime, fraud against the government, bribery, copy-right matters, civil rights violations, bank robbery, extortion, kidnapping, air piracy, terrorism, foreign counterintelligence, interstate criminal activity, fugitive and drug-trafficking matters, and other violations of federal statutes. 
The FBI also works with other federal, state and local law enforcement agencies in investigating matters of joint interest and in training law enforcement officers from around the world. 
When you join the FBI, you join a united effort against crime. It's a rewarding career for anyone who has the ability and desire to contribute to the proud history and bright future of today's FBI.
</P>

<P>
<B>The FBI Academy at Quantico, VA:</B><BR/>
Each new Agent serves a two-year probationary period upon entering on duty with the FBI. However, preference eligible veterans serve a one year probationary period. At the FBI Academy, you will join a class of Special Agent trainees for 16 weeks of intensive training at one of the world's finest law enforcement training facilities. 
Your classroom hours will be spent studying a wide variety of academic and investigative subjects. The FBI Academy curriculum also includes intensive training in physical fitness, defensive tactics, practical application exercises, and the use of firearms. Several tests will be administered in all of these areas to monitor your progress. 
Upon successful completion of Academy training, you will graduate and receive the credentials of an FBI Special Agent.
</P>

<P>
<B>Your First Assignment: </B><BR/>
As a newly appointed Special Agent, you will be assigned to one of the FBI's field offices based on the current staffing and/or critical specialty needs. New Agents are permitted to make known their preference for assignment and consideration is given to your desires; however, assignment will be based upon the staffing needs of the FBI.
An Agent can generally expect to remain in his/her first office of assignment for a minimum of four years. Your first months will be guided by a veteran Special Agent who will help you apply the lessons learned at the FBI Academy. 
</P>

<P>
<B>Advancement: </B><BR/>
Throughout your career with the FBI, you can qualify for additional training and promotion to a variety of administrative and supervisory positions. 
Special Agents enter as GS 10 employees on the law enforcement government pay scale and can advance to the GS 13 grade level in field non-supervisory assignments. Promotions to supervisory, management, and executive positions are available in grades GS 14 and GS 15 as well as in the Senior Executive Service. All Special Agents may qualify for availability pay, which is an additional premium compensation for unscheduled duty equaling 25 percent of the Agent's base salary. 
As an FBI employee, you will be entitled to a variety of benefits, including group health and life insurance programs, vacation and sick pay, and a full retirement plan. 
</P>

<P>
<B>Qualification Requirements:</B><BR/>
Entry Requirements:To carry out its mission, the FBI needs men and women who can fill a variety of demanding positions. To qualify as an FBI Special Agent, you must be a U.S. citizen, or a citizen of the Northern Mariana Islands, at least 23 and not have reached your 37th birthday on appointment. Candidates must be completely available for assignment anywhere in the FBI's jurisdiction, have uncorrected vision not worse than 20/200 (Snellen) and corrected 20/20 in one eye and not worse than 20/40 in the other eye. All candidates must pass a color vision test. 
Special Agent applicants also must meet hearing standards by audiometer test. No applicant will be considered who exceeds the following: a) average hearing loss of 25 decibels (ANSI) at 1000, 2000, and 3000 Hertz; b) single reading of 35 decibels at 1000, 2000, and 3000 Hertz; c) single reading of 35 decibels at 500 Hertz; and d) single reading of 45 decibels at 4000 Hertz. 
Candidates must possess a valid driver's license, and be in excellent physical condition with no defects which would interfere in firearm use, raids, or defensive tactics. 
Applicants must possess a four-year degree from a college or university accredited by one of the regional or national institutional associations recognized by the United States Secretary of Education. 
</P>

<P>
<B>Critical Skill Needs:</B> 
</P>

<P>
Candidates who otherwise meet entry requirements and possess one or more of the following critical skills are currently deemed essential to address our increasingly complex responsibilities and will be prioritized in the hiring process. 
<OL>
	<LI> Computer Science and other Information Technology specialties </LI>
	<LI> Engineering </LI>
	<LI> Physical Sciences (Physics, Chemistry, Biology, etc.) </LI>
	<LI> Foreign Language Proficiency (Arabic, Farsi, Pashtu, Urdu, Chinese [all dialects], Japanese, Korean, Russian, Spanish, and Vietnamese) </LI>
	<LI> Foreign Counterintelligence </LI>
	<LI> Counterterrorism </LI>
	<LI> Military Intelligence experience </LI>
</OL>
</P>

<P>
Although the above listing includes the most critical investigative skill needs, the FBI continues to be a diverse agency with employees possessing various experiences. Candidates who possess skills and experience such as accounting, law, business, education, and health care are also encouraged to apply. 
</P>

<P>
<B>Entry Programs:</B> 
</P>

<P>
<B>LAW:</B><BR/>
To qualify under the Law Program, you must have a JD degree from a resident law school.
</P>

<P>
<B>ACCOUNTING:</B><BR/>
Any applicant who wishes to be considered for the Accounting Program may qualify when he/she either: 1) Has been certified as a CPA; OR 2) Possesses a four year business degree with a major in accounting, or related business degree that included or was supplemented by 24 hours of accounting courses and an additional six semester hours of business law or other elective business courses, and two years of progressively responsible accounting work in a professional accounting firm or comparable public setting, such as a state comptroller or the General Accounting Office, the last which would be in a management, team leader or other type of position which would provide experiences in a variety of areas (banking, insurance, problem solving, etc.) and allow for exposure and experiences dealing with higher level organizational entities, i.e., partners and directors. 
</P>

<P>
<B>LANGUAGE: </B><BR/>
To qualify under the Language Program, you must have a BS or BA degree in any discipline and be proficient in a language that meets the needs of the FBI. Candidates will be expected to pass a Language Proficiency Test. 
</P>

<P>
<B>COMPUTER SCIENCE:</B><BR/>
To qualify under the Computer Science Program, you must have a BS in Computer Science or a related discipline; or any BS or BA degree plus certification as a Cisco Certified Professional (CCNP) or a Cisco Certified Internetworking Expert (CCIE) 
</P>

<P>
<B>DIVERSIFIED: </B><BR/>
To qualify under the Diversified Program, you must have a BS or BA degree in any discipline, plus three years of full-time work experience, or an advanced degree accompanied by two years of full-time work experience. 
Competitive candidates will complete a battery of written tests and, in some cases, specialized testing in your field of expertise. If you pass these tests, you may be eligible for an interview based upon your overall qualifications, your competitiveness among other candidates, and the needs of the FBI. 
Successful completion of the written test and an interview will be followed by a thorough background investigation that will include: credit and arrest checks; interviews of associates; contacts with personal and business references, past employers and neighbors; and verification of educational achievements.
Just as some things can qualify you for a career as a Special Agent, some things can disqualify you. These may include: conviction of a felony or major misdemeanor; use of illegal drugs; or failure to pass a drug-screening test. All candidates will be given a polygraph examination to determine the veracity of information provided in the application for employment to include the extent of any illegal drug usage and issues surrounding security concerns. 
<A HREF="http://www.fbi.gov/employment/booklet/SAapplinfobooklet.pdf" TARGET="_blank" CLASS="bodyText">Special Agent Selection Process Application Booklet (SASPAB)</A> 
</P>
 
<P>
Applicants must be U.S. citizens and consent to a complete background investigation, urinalysis, and polygraph. Only those candidates determined to be best qualified will be contacted to proceed in the selection process.
The FBI welcomes and encourages applications from persons with physical and mental disabilities and will reasonably accommodate the needs of those persons. The decision on granting reasonable accommodation will be on a case-by-case basis. The FBI is firmly committed to satisfying its affirmative obligations under the Rehabilitation Act of 1973, to ensure that persons with disabilities have every opportunity to be hired and advanced on the basis of merit within the FBI.
</P>

<P>
The Federal Bureau of Investigation is an Equal Opportunity Employer. All qualified applicants will receive consideration for this vacancy. Except where otherwise provided by law, selection will be made without regard to, and there will be no discrimination because of race, religion, color, national origin, sex, political affiliations, marital status, nondisqualifying physical or mental disability, age, sexual orientation, membership or nonmembership in an employee organization, or on the basis of personal favoritism or other non-merit factors.
</P>
<P>
<B>IMPORTANT NOTE: </B><BR/>
By clicking on "APPLY HERE", you authorize TopCoder to release your member
profile information, competition statistics, code samples, resume, rating
and ranking to the FBI.
</P>
<P>
Due to the high volume of response being received, the FBI will only accept
applications for the first seven(7) days of each month. In order for your
application to be reviewed, it must be submitted by 11:59 pm CST on the 7th
day of each month.
</P>
<P ALIGN="center"><A HREF="/jobposting?&amp;t=JobHitTask&amp;jid=29&amp;jt=1" TARGET="_blank" CLASS="bodyText">Apply Here</A> | <A HREF="/?&amp;t=tces&amp;c=fbi_openings&amp;a=secure" CLASS="bodyText">Back to Jobs</A></P>
<!--end contextual links-->
          <P><BR/></P>
					</TD>
					<TD VALIGN="top" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
				</TR>
				<TR>
					<TD COLSPAN="4" VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="10" BORDER="0"/></TD>
				</TR>   	
				<TR>
					<TD VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="11" ALIGN="right"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="8" BORDER="0"/></TD>
					<TD VALIGN="top" WIDTH="75"><IMG SRC="/i/table_mid_left2.gif" ALT="" WIDTH="14" HEIGHT="8" BORDER="0"/></TD>
					<TD VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
					<TD VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
				</TR>	
				<TR>
					<TD VALIGN="top" WIDTH="11" ALIGN="right" BGCOLOR="#FFFFFF"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="8" BORDER="0"/></TD>
					<TD VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="14"><IMG SRC="/i/table_btm_left2.gif" ALT="" WIDTH="14" HEIGHT="8" BORDER="0"/></TD>
					<TD VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
					<TD VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
				</TR>
			</TABLE>
		</TD>
	<!-- Center Column Ends -->
<!-- Body Area Ends -->

	<!-- Gutter -->
		<TD WIDTH="4" BGCOLOR="#FFFFFF"><IMG SRC="/i/clear.gif" WIDTH="4" HEIGHT="1" BORDER="0"/></TD>
    <!-- Gutter Ends -->
	<!-- Right Column Begins -->
		<TD WIDTH="170" BGCOLOR="#FFFFFF" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="170" HEIGHT="1" BORDER="0"/><br/>
<!-- Right Column Include Begins --> 
        <xsl:call-template name="public_right_col"/>       
<!-- Right Column Include Ends -->        
        </TD>
	<!-- Right Column Ends -->
	<!-- Gutter -->
		<TD WIDTH="10" BGCOLOR="#FFFFFF"><IMG SRC="/i/clear.gif" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
    <!-- Gutter Ends -->
	</TR>
</TABLE>
<!-- Body Ends -->
        <xsl:call-template name="Foot"/>
      </BODY>
    </HTML>
  </xsl:template>
</xsl:stylesheet>
