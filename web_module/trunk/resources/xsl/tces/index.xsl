<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:import href="../top.xsl"/>
  <xsl:import href="../script.xsl"/>
  <xsl:import href="../includes/body_top.xsl"/>  
  <xsl:import href="../foot.xsl"/>
  <xsl:import href="../includes/modules/practice_room.xsl"/>
  <xsl:import href="../includes/modules/module_login.xsl"/>  
  <xsl:import href="../includes/modules/calendar.xsl"/>
  <xsl:import href="../includes/tces/public_tces_left.xsl"/> 
  <xsl:import href="../includes/public_right_col.xsl"/>     
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
<P>
<B>Program Description </B>
</P>

<P>
TopCoder Employment Services [TCES] is pleased to announce its Candidate Recruiting Program.  
Through this program, [TCES] is actively soliciting top companies who are looking to hire software 
engineers and developers. The targeted companies value programming talent and are interested in 
hiring TopCoder members. TopCoder members will be notified via email of new job postings to the site, 
and all members will have the ability to express interest in open positions at these top companies 
through the job postings and employment advertisements on TopCoder's website. Members will also have 
an opportunity to showcase their competition achievements and be able to upload resumes as part of the process.
</P>

<P>
While the program is open to all members, regardless of rating status, rated members will have a 
distinct advantage over non-rated members since potential employers will be able to view their competition 
statistics and code samples, in addition to any uploaded resume information. In line with TopCoder's 
overall philosophy, this will allow companies to differentiate coders who would otherwise look the same 
on paper. Non-rated members wishing to obtain a rating should review the <A HREF="/?&amp;t=schedule&amp;c=index" CLASS="bodyText">competition calendar</A> for the 
next Single Round Match date.
</P>
<BR/>

<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#FFFFFF" WIDTH="100%">
	<TR>
		<TD COLSPAN="3" VALIGN="middle" HEIGHT="17" BGCOLOR="#43515E" CLASS="statText">&#160;<B>Employers</B></TD>
	</TR>
   <TR>
		<TD VALIGN="middle" CLASS="bodyText" ALIGN="center"><A HREF="/?&amp;t=tces&amp;c=nvidia"><IMG SRC="/i/es/nvidia/nvidia_logo.gif" WIDTH="120" HEIGHT="83" BORDER="0"/></A></TD>
		<TD><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="1" BORDER="0"/></TD>
		<TD WIDTH="100%" VALIGN="middle" CLASS="bodyText"><B>NVIDIA&#174; Corporation (Nasdaq: NVDA)</B> is the worldwide leader in graphics processors and media and communications devices.  At NVIDIA we work hard. We thrive on innovation. We define the cutting-edge. We deliver to the nth degree.
         <A HREF="/?&amp;t=tces&amp;c=nvidia" CLASS="bodyText">Click here</A> to check out our open Software Engineering positions.<BR/><BR/></TD>
	</TR>
	<TR>
		<TD COLSPAN="3" BGCOLOR="#43515E" CLASS="statText"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
	</TR>    
  <TR>
		<TD VALIGN="middle" CLASS="bodyText" ALIGN="center"><A HREF="/?&amp;t=tces&amp;c=cryptic"><IMG SRC="/i/es/cryptic/cryptic_logo.gif" WIDTH="120" HEIGHT="63" ALT="" BORDER="0" VSPACE="10"/></A></TD>
		<TD><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="1" BORDER="0"/></TD>
		<TD WIDTH="100%" VALIGN="middle" CLASS="bodyText">Want to be a part of creating the world's first super powered MMP experience?  Cryptic Studios is an independent developer of massively multiplayer online games for the PC and next generation consoles.  We're looking for a Gameplay Programmer and an entry level Level Designer.            
          <A HREF="/?&amp;t=tces&amp;c=cryptic" CLASS="bodyText">Click here</A> for more information.<BR/><BR/></TD>
	</TR>
	<TR>
		<TD COLSPAN="3" BGCOLOR="#43515E" CLASS="statText"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
	</TR>   	
	<TR>
		<TD VALIGN="middle" CLASS="bodyText" ALIGN="center"><A HREF="/?&amp;t=tces&amp;c=fbi"><IMG SRC="/i/es/fbi/fbi_logo.gif" WIDTH="100" HEIGHT="103" BORDER="0"/></A></TD>
		<TD><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="1" BORDER="0"/></TD>
		<TD WIDTH="100%" VALIGN="middle" CLASS="bodyText">The FBI. It is like no other career choice you've explored. It's 
		challenging. Compelling. Important. Whatever your background or expertise, you will find an FBI future exceptionally
		 rewarding. Because the work you perform will have a daily impact on the nation's security and the quality-of-life 
		 for all U.S. citizens.  <A HREF="/?&amp;t=tces&amp;c=fbi" CLASS="bodyText">Are you ready?</A><BR/><BR/></TD>
	</TR>
	<TR>
		<TD COLSPAN="3" BGCOLOR="#43515E" CLASS="statText"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
	</TR>	
	<TR>
		<TD VALIGN="middle" CLASS="bodyText" ALIGN="center"><A HREF="/?&amp;t=tces&amp;c=google"><IMG SRC="/i/es/google_sm.gif" WIDTH="143" HEIGHT="59" BORDER="0"/></A></TD>
		<TD><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="1" BORDER="0"/></TD>
		<TD WIDTH="100%" VALIGN="middle" CLASS="bodyText">Google is looking for exceptional people who like to develop innovative new products, especially software 
engineers and tech-savvy product managers. Are you exceptional at what you do? 
<A HREF="/?&amp;t=tces&amp;c=google" CLASS="bodyText">Click here</A> to view current 
positions available at Google.<BR/><BR/></TD>
	</TR>
	<TR>
		<TD COLSPAN="3" BGCOLOR="#43515E" CLASS="statText"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
	</TR>	
	<TR>
		<TD VALIGN="middle" CLASS="bodyText" ALIGN="center"><A HREF="/?&amp;t=tces&amp;c=ge"><IMG SRC="/i/es/ge/ge_logo.gif" WIDTH="70" HEIGHT="60" ALT="" BORDER="0"/></A></TD>
		<TD><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="1" BORDER="0"/></TD>
		<TD VALIGN="middle" CLASS="bodyText">
<A HREF="/?&amp;t=tces&amp;c=ge" CLASS="bodyText">Click here</A> for information about GE's premier entry-level Information Management Leadership Program (IMLP).  
IMLP puts information management careers on the fast track. Program graduates are in tremendous demand throughout GE.<BR/><BR/>		
       </TD>
	</TR>	
	<TR>
		<TD COLSPAN="3" BGCOLOR="#43515E" CLASS="statText"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
	</TR>
	<TR>
		<TD VALIGN="middle" CLASS="bodyText" ALIGN="center"><A HREF="/?&amp;t=tces&amp;c=apex"><IMG SRC="/i/es/apex/apexlogo.gif" WIDTH="82" HEIGHT="94" ALT="Apex" BORDER="0"/></A></TD>
		<TD><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="1" BORDER="0"/></TD>
		<TD VALIGN="middle" CLASS="bodyText">Apex is a company built upon a set of core values that guide their every action - excellence, human 
dignity and integrity.  They consider themselves "the best place for the best
people to work."  
<A HREF="/?&amp;t=tces&amp;c=apex" CLASS="bodyText">Click here</A> to view current job opportunities available at Apex.<BR/><BR/>		
		</TD>
	</TR>
	<TR>
		<TD COLSPAN="3" BGCOLOR="#43515E" CLASS="statText"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
	</TR>
	<TR>
		<TD VALIGN="middle" CLASS="bodyText" ALIGN="center"><A HREF="/?&amp;t=tces&amp;c=tcs_openings&amp;a=secure"><IMG SRC="/i/es/topcoder/topcoder_logo.gif" WIDTH="160" HEIGHT="31" VSPACE="16" ALT="TopCoder" BORDER="0"/></A></TD>
		<TD><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="1" BORDER="0"/></TD>
		<TD VALIGN="middle" CLASS="bodyText">TopCoder Software Sales - <A HREF="/?&amp;t=tces&amp;c=tcs_openings&amp;a=secure" CLASS="bodyText">Click here</A> for details.<BR/><BR/>	
		</TD>
	</TR>
	<TR>
		<TD COLSPAN="3" BGCOLOR="#43515E" CLASS="statText"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
	</TR>	
			
</TABLE>

<!-- <DIV ALIGN="center">
<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="2" BGCOLOR="#FFFFFF" WIDTH="100%">
	<TR>
		<TD COLSPAN="3" VALIGN="middle" HEIGHT="17" BGCOLOR="#43515E" CLASS="statText">&#160;<B>Client Employers</B></TD>
	</TR>
	<TR>
		<TD WIDTH="50%" VALIGN="top" CLASS="bodyText"><A HREF="/?&amp;t=tces&amp;c=google"><IMG SRC="/i/es/google_sm.gif" WIDTH="143" HEIGHT="59" BORDER="0"/></A><BR/>
Google is looking for exceptional people who like to develop innovative new products, especially software 
engineers and tech-savvy product managers. Are you exceptional at what you do? 
<A HREF="/?&amp;t=tces&amp;c=google" CLASS="bodyText">Click here</A> to view current 
positions available at Google.<BR/>		
		</TD>
		<TD><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="1" BORDER="0"/></TD>
		<TD WIDTH="50%" VALIGN="top" CLASS="bodyText"><A HREF="/?&amp;t=tces&amp;c=ge"><IMG SRC="/i/es/ge/ge_logo.gif" WIDTH="70" HEIGHT="60" ALT="" BORDER="0"/></A><BR/>
<A HREF="/?&amp;t=tces&amp;c=ge" CLASS="bodyText">Click here</A> for information about GE's premier entry-level Information Management Leadership Program (IMLP).  
IMLP puts information management careers on the fast track. Program graduates are in tremendous demand throughout GE.<BR/>		
       </TD>
	</TR>
	<TR>
		<TD VALIGN="top" CLASS="bodyText"><A HREF="/?&amp;t=tces&amp;c=apex"><IMG SRC="/i/es/apex/apexlogo.gif" WIDTH="82" HEIGHT="94" ALT="Apex" BORDER="0"/></A><BR/>
Apex is a company built upon a set of core values that guide their every action - excellence, human 
dignity and integrity.  They consider themselves "the best place to work for the best people to work."  
<A HREF="/?&amp;t=tces&amp;c=apex" CLASS="bodyText">Click here</A> to view current job opportunities available at Apex.<BR/>		
		</TD>
		<TD><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="1" BORDER="0"/></TD>
		<TD VALIGN="top" CLASS="bodyText">&#160;</TD>
	</TR>	
</TABLE>          
</DIV> -->

<P><BR/></P>
<P CLASS="smallText">
<B>Members:</B> Please note our Disclaimer<BR/>
By indicating interest in a job, you authorize TopCoder to release your member profile information, 
competition statistics, code samples, resume, rating and ranking to the potential employer.  You will 
have the ability to update and change your profile information at any time and we encourage you to keep 
it updated.  Only TopCoder sponsors and subscribing employers will have access to view your profile 
information, competition statistics, code samples, resume, rating and ranking.  The personal information 
you provide must be accurate and complete and all registration details (where applicable) must contain 
your real name, address and other requested details. You are solely responsible for your personal 
information and we may take any action with respect to your personal information we deem necessary or 
appropriate if we believe it may cause us to suffer any loss, liability or commercial damage.
</P>

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
