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

<TABLE WIDTH="100%" CELLPADDING="0" CELLSPACING="0" BORDER="0">

<TR>
<TD VALIGN="middle" HEIGHT="18" BGCOLOR="#43515E" CLASS="statText"><B>&#160;Great Jobs at GE</B></TD>
</TR>

<TR>
<TD VALIGN="middle" HEIGHT="18" CLASS="bodyText">
&#160;&#160;<A CLASS="bodyText" HREF="/?t=jobs&amp;c=ge">Jobs</A>&#160;|&#160;
<A CLASS="bodyText" HREF="/?t=jobs&amp;c=ge_faq">GE IMLP FAQ</A>&#160;|&#160;
<A CLASS="bodyText" HREF="/?t=jobs&amp;c=ge_criteria">IMLP Criteria</A>&#160;|&#160;
</TD>
</TR>

</TABLE>

<IMG SRC="/i/es/ge/ge_logo.gif" WIDTH="70" HEIGHT="60" ALT="" BORDER="0"/>

<P><B>Program Summary and Candidate Criteria</B></P>

<BLOCKQUOTE>
<P><B>Program Summary</B></P>
<UL>
<LI>A 2-year program consisting of four 6-month rotational assignments through different areas of a GE business.</LI>
<LI>On-the-job training in business dynamics, career strategies, communication skills, problem solving, decision making and project leadership</LI>
<LI>Formal coursework in advanced information technology and systems, and their strategic application within GE</LI>
<LI>Develops strong technical foundation, project management skills and process knowledge that cuts across functions to support GE's boundaryless culture</LI>
</UL>

<P><B>Candidate Criteria</B></P>
<UL>
<LI>Strong interest in information technology applications</LI>
<LI>Solid analytical abilities and sharp business acumen</LI>
<LI>BA in Computer Science, Information Systems or Engineering preferred; Business and Liberal Arts degrees or other related experience may be applicable</LI>
</UL>
</BLOCKQUOTE>

<P><A HREF="/?t=jobs&amp;c=ge_faq">Read our Frequently Asked Questions</A></P>

<P><A HREF="#">Click here to apply</A></P>

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



