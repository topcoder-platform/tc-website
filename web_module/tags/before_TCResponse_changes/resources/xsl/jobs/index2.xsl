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
<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="1" VALIGN="top" WIDTH="150" ALIGN="right">
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
</TABLE>
<!--end contextual links-->
          <P>TopCoder is pleased to announce employment opportunities being made available to the TopCoder membership.
          TopCoder Employment Services (TCES) is providing placement services for members with companies from different parts of the United States.
          The follow descriptions reflect open positions. These positions are being made available to TopCoder's rated membership.</P>
          <DIV ALIGN="center"><TABLE WIDTH="100%" BORDER="0" CELLPADDING="2" CELLSPACING="0">
          <TR>
            <TD WIDTH="48%" ALIGN="left" VALIGN="top" CLASS="bodyText">
            <B>Java and/or C++ with Oracle</B><BR/>
            Major Software Vendor<BR/>
            Multiple positions in the San Francisco Bay Area<BR/>
            Very strong Oracle background is a must<BR/>
            Experienced programmers only, no college students please<BR/>
            <A HREF="/?t=jobs&amp;c=inquire&amp;Job=OEOJ021921&amp;JobDesc=Java%20C%2B%2B%20Oracle&amp;To=sburrows@topcoder.com" CLASS="bodyText">Feel qualified and are interested?</A>
            </TD>
            <TD WIDTH="2%">&#160;</TD>
            <TD WIDTH="48%" ALIGN="left" VALIGN="top" CLASS="bodyText">
            <B>Entry Level Java Programmers</B><BR/>
            Software company just outside of NYC<BR/>
            Utilizing complete suite of Java products (except EJBs)<BR/>
            Developing add-ons and tools for an ERP package<BR/>
            Must be a team player<BR/>
            <A HREF="/?t=jobs&amp;c=inquire&amp;Job=CA-J022721&amp;JobDesc=Entry%20Level%20Java%20Programmer&amp;To=sburrows@topcoder.com" CLASS="bodyText">Feel qualified and are interested?</A>
            </TD>
          </TR>
          <TR><TD COLSPAN="3" HEIGHT="18"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="18" BORDER="0"/></TD></TR>
          <TR>
            <TD WIDTH="48%" ALIGN="left" VALIGN="top" CLASS="bodyText">
            <B>C++ Game Programmer</B><BR/>
            Game company in Washington State<BR/>
            Strong C++ coders<BR/>
            Top ranked graduating seniors and professionals only<BR/>
            Must have a passion for games<BR/>
            Lots of hours required<BR/>
                        <A HREF="/?t=jobs&amp;c=inquire&amp;Job=SD-C022521&amp;JobDesc=C%2B%2B%20Game%20Programmer&amp;To=sburrows@topcoder.com" CLASS="bodyText">Feel qualified and are interested?</A>
            </TD>
            <TD WIDTH="2%">&#160;</TD>
            <TD WIDTH="48%" ALIGN="left" VALIGN="top" CLASS="bodyText">
            <B>Experienced Java Programmers</B><BR/>
            Software company just outside of NYC<BR/>
            Utilizing complete suite of Java products (except EJBs)<BR/>
            Developing add-ons and tools for an ERP package<BR/>
            Must be a team player<BR/>
                        <A HREF="/?t=jobs&amp;c=inquire&amp;Job=CA-J022722&amp;JobDesc=Experienced%20Java%20Programmer&amp;To=sburrows@topcoder.com" CLASS="bodyText">Feel qualified and are interested?</A>
            </TD>
          </TR>
          <TR><TD COLSPAN="3" HEIGHT="18"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="18" BORDER="0"/></TD></TR>
          <TR>
            <TD WIDTH="48%" ALIGN="left" VALIGN="top" CLASS="bodyText">
            <B>Artificial Intelligence Lead Programmer</B><BR/>
            AI company with a Boston office<BR/>
            Experience with AI is a must<BR/>
            Experience with team leadership is a must<BR/>
            One position available<BR/>
                                                <A HREF="/?t=jobs&amp;c=inquire&amp;Job=SIJC021421&amp;JobDesc=Artificial%20Intelligence%20Lead%20Programmer&amp;To=sburrows@topcoder.com" CLASS="bodyText">Feel qualified and are interested?</A>
            </TD>
            <TD WIDTH="2%">&#160;</TD>
            <TD WIDTH="48%" ALIGN="left" VALIGN="top" CLASS="bodyText">
            <B>Java Architect and Team Leader</B><BR/>
            Software company just outside of NYC<BR/>
            Utilizing complete suite of Java products (except EJBs)<BR/>
            Developing add-ons and tools for an ERP package<BR/>
            Design and Leadership skills are a must<BR/>
                                                <A HREF="/?t=jobs&amp;c=inquire&amp;Job=CA-J022723&amp;JobDesc=Java%20Architect%20Team%20Leader&amp;To=sburrows@topcoder.com" CLASS="bodyText">Feel qualified and are interested?</A>
            </TD>
          </TR>
          <TR><TD COLSPAN="3" HEIGHT="18"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="18" BORDER="0"/></TD></TR>
          <TR>
            <TD WIDTH="48%" ALIGN="left" VALIGN="top" CLASS="bodyText">
            <B>Top Secret Programmer</B><BR/>
            Software company in the DC area<BR/>
            Top Secret clearance is a must<BR/>
            Java or C++ coders are welcome<BR/>
            Experience with government contracts is helpful<BR/>
                                                <A HREF="/?t=jobs&amp;c=inquire&amp;Job=ON-J022221&amp;JobDesc=Top%20Secret%20Programmer&amp;To=sburrows@topcoder.com" CLASS="bodyText">Feel qualified and are interested?</A>
            </TD>
            <TD WIDTH="2%">&#160;</TD>
            <TD WIDTH="48%" ALIGN="left" VALIGN="top" CLASS="bodyText">
            <B>Cold Fusion and Java</B><BR/>
            Application development company in central CT<BR/>
            Will help bringing existing legacy applications in Cold Fusion into straight Java<BR/>
            Will require leadership in the near future as the staff will increase<BR/>
                        <A HREF="/?t=jobs&amp;c=inquire&amp;Job=CE-J021321&amp;JobDesc=Cold%20Fusion%20and%20Java%20Programmer&amp;To=sburrows@topcoder.com" CLASS="bodyText">Feel qualified and are interested?</A>
            </TD>
          </TR>
          </TABLE></DIV>
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
<xsl:if test="not(/TC/LoggedIn='true')">
<xsl:call-template name="module_login"/>
</xsl:if>
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
