<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:import href="../top.xsl"/>
  <xsl:import href="../script.xsl"/>
  <xsl:import href="../includes/body_top.xsl"/>  
  <xsl:import href="../foot.xsl"/>
  <xsl:import href="../includes/modules/stats_intro.xsl"/>  
  <xsl:import href="../includes/public_dev_left.xsl"/>
  <xsl:import href="../includes/public_dev_right.xsl"/>     
  <xsl:output indent="no" method="html" doctype-public="-//W3C//DTD HTML 4.0 Transitional//EN"/>
  <xsl:template match="/">
    <HTML>
      <HEAD>
        <xsl:call-template name="Preload"/>      
        <TITLE>TopCoder :: Development</TITLE>
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
<!-- Left Column Include Begins -->  
    <!-- Global Seconday Nav Begins -->        
        <xsl:call-template name="public_dev_left"/>
  <!-- Global Seconday Nav Ends -->      
<!-- Left Column Include Ends -->              
      </TD>
  <!-- Left Column Ends -->
  <!-- Gutter Begins -->
    <TD WIDTH="4" BGCOLOR="#CCCCCC" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="4" HEIGHT="8" BORDER="0"/></TD>
    <!-- Gutter Ends -->

<!-- Body Area -->
  <!-- Center Column Begins -->  
    <TD CLASS="bodyText" WIDTH="100%" bgcolor="#CCCCCC" valign="top">
<xsl:call-template name="BodyTop">
  <xsl:with-param name="image1">steelblue</xsl:with-param>
  <xsl:with-param name="image">development</xsl:with-param>
  <xsl:with-param name="title">&#160;Overview</xsl:with-param>
</xsl:call-template>
<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif" WIDTH="100%">
  <TR>
    <TD BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif" VALIGN="top" WIDTH="11"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="1" BORDER="0"/></TD>
    <TD CLASS="statText" COLSPAN="2" VALIGN="top" BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="240" HEIGHT="1" BORDER="0"/><BR/>
                                    <B>Email Engine Enhancement Component Development</B>
                                    <BR/>

                                    <a href="/?&amp;t=development&amp;c=tcs_inquire&amp;Project=Email Engine Enhancement Development" CLASS="statText"><B>Click here to inquire &gt;&gt;</B></a>
                                    <BR/>
<P>
<B>Overview</B>
</P>

<P>
The Email Engine component provides basic and advanced email functionality through Java API's.  As with any email software, the component supports one or more primary (TO), carbon copy (CC) and blind carbon copy (BCC) recipients, a subject line and file attachment capabilities.
As its name suggests, the Email Engine is used to send email messages.  This is not a GUI-based component such as Outlook Express or Yahoo Mail that manages user email accounts.  Rather, the Email Engine is a set of Java API's that enables a developer to send emails directly from application code.
<BR/>
The existing Email Engine implementation needs to be enhanced to include the ability to attach files to email messages.
<BR/>
For more details, check out the <A HREF="http://www.topcodersoftware.com/pages/c_component.jsp?comp=600056&amp;cat=11" CLASS="statText">Email Engine Enhancement Component</A> at <A HREF="http://www.topcodersoftware.com" CLASS="statText">topcodersoftware.com</A>.
</P>

<P>
<B>Project Type</B>
</P>
<P>
Component Development Project: Provide a development solution for the Email Engine Enhancement component.<br/>
Please review the <a href="http://www.topcoder.com/?&amp;t=development&amp;c=index" CLASS="statText">TopCoder Software Component Development Methodology</a> for further details regarding this project type.

</P>

<B>Technologies</B>

<UL>
	<LI>Java 1.4</LI>
</UL>


<P>
<B>Payment</B>
</P>
<P>
TopCoder will compensate the member with the winning solution. Compensation will consist of both initial payments and royalties on the sale of the component. The initial payment will be distributed in two installments.<br/>
First Milestone: When the winning solution is submitted and review board suggestions are integrated.<br/>
Second Milestone: Is marked by the completion of the development project*.
</P>

<P>
Members will also collect royalties on the revenue generated from the sale of the component. The total royalty per component will be equal to 10%* of the component's revenue, with 25%* of the royalty being paid to the designer, 25% to the developer(s), 25% to the Architecture Board member(s) and 25% to the QA Board member(s).  Royalties may be diluted if additional work is done to the component, as the total work effort for the component will increase.  
</P>


<P>
<B>Designer</B>
</P>
<P>
Royalty Percentage - 25%<BR/>
Total Payment - $120.00<BR/>
First Deliverable - $90.00<BR/>
Project Completion - $30.00<BR/>
</P>

<P>
<SUP>*</SUP>Completion of the project is defined as follows: 
</P>

<UL>
	<LI>The Initial Submission has been delivered by the Initial Submission Due Date.</LI>
	<LI>The Submission has been selected by the board as the winning submission.</LI>
	<LI>Final payment is conditional on acceptance of the fully functional component by the Development Review Board.</LI>
</UL>

<P>
<B>Eligibility</B>
</P>
<P>
You must be a rated TopCoder member, at least 18 years of age, meeting all of the membership requirements and fit into one of the following categories:
</P>

<OL>
	<LI>A US Citizen </LI>
	<LI>A Lawful Permanent Resident of the US (i.e., a Green Card holder) </LI>
	<LI>Currently lawfully residing in the US with valid employment authorization to act as an independent contractor.</LI>
	<LI>A Non US Citizen working in their country of residence.</LI>
</OL>

<P>
<B>Time Line</B>
<BR/>All submissions are required to be submitted by the Initial Submission Due Date.  All questions submitted prior to 6PM EDT on the Initial Submission Due Date will be answered. Following review from the board the winning member is given untill the Final Submission Due Date to modify their submission.
<BR/>
</P>
<P>
Component Posting: 11/15/2002<BR/>
Initial Submission Due Date: 11/29/2002<BR/>
Final Submission Due Date: 12/13/2002<BR/>

After inquiring for this project please make sure you are registered at www.topcodersoftware.com.  Each eligible member will be granted access to more detailed information about the project and the deliverables.
</P>


            <a href="/?&amp;t=development&amp;c=tcs_inquire&amp;Project=Email Engine Enhancement Development" CLASS="statText"><B>Click here to inquire &gt;&gt;</B></a>
          <P><BR/></P>
    </TD>
    <TD VALIGN="top" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
  </TR>
  <TR>
    <TD COLSPAN="4" VALIGN="top" BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="10" BORDER="0"/></TD>
  </TR>     
  <TR>
    <TD VALIGN="top" BACKGROUND="" BGCOLOR="#CCCCCC" WIDTH="11" ALIGN="right"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="8" BORDER="0"/></TD>
    <TD BACKGROUND="/i/steel_darkblue_bg.gif" VALIGN="top" BGCOLOR="#000033" WIDTH="14"><IMG SRC="/i/table_mid_left2x.gif" ALT="" WIDTH="14" HEIGHT="8" BORDER="0"/></TD>
    <TD BACKGROUND="/i/steel_darkblue_bg.gif" VALIGN="top" BGCOLOR="#000033" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
    <TD VALIGN="top" BACKGROUND="" BGCOLOR="#CCCCCC" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
  </TR>  
  <TR>
    <TD VALIGN="top" BACKGROUND="" WIDTH="11" ALIGN="right" BGCOLOR="#CCCCCC"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="8" BORDER="0"/></TD>
    <TD VALIGN="top" BACKGROUND="" BGCOLOR="#CCCCCC" WIDTH="14"><IMG SRC="/i/table_btm_left2.gif" ALT="" WIDTH="14" HEIGHT="8" BORDER="0"/></TD>
    <TD VALIGN="top" BACKGROUND="" BGCOLOR="#CCCCCC" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
    <TD VALIGN="top" BACKGROUND="" BGCOLOR="#CCCCCC" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
  </TR>
</TABLE>
    </TD>
  <!-- Center Column Ends -->
<!-- Body Area Ends -->

  <!-- Gutter -->
    <TD WIDTH="4" BGCOLOR="#CCCCCC"><IMG SRC="/i/clear.gif" WIDTH="4" HEIGHT="1" BORDER="0"/></TD>
    <!-- Gutter Ends -->
  <!-- Right Column Begins -->
    <TD WIDTH="170" BGCOLOR="#CCCCCC" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="170" HEIGHT="1" BORDER="0"/><BR/>
<!-- Right Column Include Begins -->        
        <xsl:call-template name="public_dev_right"/>        
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

