<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:import href="../top.xsl" />
  <xsl:import href="../script.xsl" />
  <xsl:import href="../includes/body_top.xsl" />  
  <xsl:import href="../foot.xsl" />
  <xsl:import href="../includes/modules/practice_room.xsl" />
  <xsl:import href="../includes/modules/calendar.xsl" />
  <xsl:import href="../includes/global_left.xsl" /> 
  <xsl:import href="../includes/public_right_col.xsl" />     
  <xsl:output indent="no" method="html" doctype-public="-//W3C//DTD HTML 4.0 Transitional//EN" />
  <xsl:template match="/">
<html>

<head>

<xsl:call-template name="Preload" />      

<title>About TopCoder Competitions, Development, Software, Jobs, Employment Services and Sponsorship</title>

<xsl:call-template name="CSS" />      

<meta name="description" content="TopCoder is a programming tournament site. All members who compete attain a rating that provides a metric for coding competence and potential. These ratings, coupled with tournament performance, can lead to monetary rewards and employment opportunities." />
<meta name="keywords" content="Computer Jobs, Programming, Programming Jobs, Programming Contest, Programming Competition, Online Games, Coding, Information Technology Jobs, Java, C++" />

</head>

<body>

<xsl:call-template name="Top" />

<table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr valign="top">

<!-- Left Column Begins -->
        <td width="180">
            <xsl:call-template name="global_left" />
        </td>
<!-- Left Column Ends -->

<!-- Gutter Begins -->
        <td width="10"><IMG src="/i/clear.gif" width="10" height="1" border="0" /></td>
<!-- Gutter Ends -->

<!-- Center Column Begins -->    
        <td width="9%">
            
            <xsl:call-template name="BodyTop">
                <xsl:with-param name="image1">white</xsl:with-param>
                <xsl:with-param name="image">about_tc</xsl:with-param>
                <xsl:with-param name="title">&#160;</xsl:with-param>
            </xsl:call-template>
            
            <table border="0" cellspacing="0" cellpadding="0" width="100%">
                <tr valign="top">
                    <td class="bodyText" width="100%"><IMG src="/i/clear.gif" alt="" width="240" height="1" border="0" />
                    <p>TopCoder is fast becoming the major league for programming competitions. TopCoder brings members together once a week to compete online 
                    &#40;Single Round Match&#41; and twice a year both online and on location &#40;Tournaments&#41;.</p>
                    
                    <p><b>Why Online Competitions</b><br />
                    Competitions provide an understanding of a person's capabilities through a demonstration of skill. What was lacking in the world of programming 
                    competitions was a format that offered immediate and objective scoring. The solution was the creation of a "<A href="/index?t=about_tc&amp;c=spons_srm" class="bodyText">Single Round Match</A>".<br /><br />
                    In order to drive repeated participation, TopCoder developed "<A href="/index?t=about_tc&amp;c=spons_tourny" class="bodyText">Tournaments</A>" that offer larger cash prizes to the members who successfully code their 
                    way through weekly Single Round Matches and build a rating that puts them in a seeding for either the Invitational Tournament (open to all members) 
                    or Collegiate Challenge (open to college students only).</p>
                    
                    <p><b>Who Benefits</b></p>
                    
                    <ul>
                        <li><A href="/index?t=about_tc&amp;c=membr_whyjoin" class="bodyText">Members</A><br />
                        Each Single Round Match offers a fun, time-based, and challenging set of problems that put a developer's skills to the test. This coupled 
                        with the new <A href="/index?t=about_tc&amp;c=membr_divisions" class="bodyText">Divisions</A> will offer a more level 
                        field of competition for newer members in order to build ratings and move into potential tournament opportunities.</li><br />
                    
                        <li><A href="/index?t=about_tc&amp;c=spons_target" class="bodyText">Sponsors</A><br />
                        Reaching the developer community is a difficult task at best. Marketing budgets are limited and with the advent of the Internet, 
                        the expectation for measuring results has only grown. TopCoder offers companies a means of targeting this desired community 
                        through the <A href="/index?t=about_tc&amp;c=spons_target" class="bodyText">targeted sponsorship</A> of Single 
                        Round Matches and Tournaments.</li><br />
                        
                        <li><A href="/index?t=tces&amp;c=index" class="bodyText">Employers</A><br />
                        The market for developers is either feast or famine. Regardless of how many developers there are or how many are available, 
                        the issue remains the same&#151;how to determine which candidate is best suited to the needs of your organization. While 
                        certification has offered some credibility, competitions that test a developer's skills in real-world challenges goes much 
                        further to differentiating one candidate from another.</li>
                    </ul>

                </td>
            </tr>
            
            <p><br /></p>

            </table>
        </td>
<!-- Center Column Ends -->

<!-- Gutter -->
        <td width="10"><IMG src="/i/clear.gif" width="10" height="1" alt="" border="0" /></td>
<!-- Gutter Ends -->

<!-- Right Column Begins -->
        <td width="170">
            <xsl:call-template name="public_right_col"/>       
        </td>
<!-- Right Column Ends -->

<!-- Gutter -->
        <td width="10"><IMG src="/i/clear.gif" width="10" height="1" alt="" border="0" /></td>
<!-- Gutter Ends -->
    </tr>
</table>

<xsl:call-template name="Foot"/>

</body>

</html>

  </xsl:template>
</xsl:stylesheet>
