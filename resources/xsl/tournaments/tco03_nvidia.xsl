<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:import href="../top.xsl"/>
  <xsl:import href="../script.xsl"/>
  <xsl:import href="../includes/body_top.xsl"/>  
  <xsl:import href="../foot.xsl"/>
  <xsl:import href="../includes/modules/practice_room.xsl"/>
  <xsl:import href="../includes/modules/calendar.xsl"/>
  <xsl:import href="../includes/global_left.xsl"/> 
  <xsl:import href="../includes/public_right_col.xsl"/>     
  <xsl:output indent="no" method="html" doctype-public="-//W3C//DTD HTML 4.0 Transitional//EN"/>
  <xsl:template match="/">

<html>

<head>

<xsl:call-template name="Preload"/>      

<title>Northface University is corporate sponsor of the 2003 TopCoder Open coding tournament</title>

<xsl:call-template name="CSS"/>      

<meta name="description" content="TopCoder is a programming tournament site. All members who compete attain a rating that provides a metric for coding competence and potential. These ratings, coupled with tournament performance, can lead to monetary rewards and employment opportunities."/>
<meta name="keywords" content="Computer Jobs, Programming, Programming Jobs, Programming Contest, Programming Competition, Online Games, Coding, Information Technology Jobs, Java, C++"/>

</head>

<body>

<!-- Header begins -->
<xsl:call-template name="Top"/>
<!-- Header ends -->

<table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr valign="top">
<!-- Left Column Begins -->
        <td width="170" valign="top">
            <xsl:call-template name="global_left"/>
        </td>
<!-- Left Column Ends -->

<!-- Gutter Begins -->
<!-- Gutter Ends -->

<!-- Center Column Begins -->	
        <td class="promoText" width="100%">
            <table width="100%" border="0" cellpadding="0" cellspacing="15">

                  <tr><td align="center"><A href="http://www.northface.edu" target="_blank"><img src="/i/tournament/tco03/sponsors/northface_logo.gif" alt="Northface" width="450" height="75" border="0" /></A><br/>
                        <hr width="100%" size="1" noshade="0"/>
                        </td></tr>
                            
                <tr valign="top">
                    <td class="promoText" width="99%">
                        <p><strong><A href="http://www.northface.edu" target="_blank">Northface University</A> is establishing the finest university in the world for software developers.</strong> 
                        Our educational programs focus on the latest advancements in modeling, business rules, data management and systems integration. The courses are  fast-paced, utilize leading edge technologies 
                        and reinforce best practice skills for the implementation of real-world projects.</p>

                        <p><A href="http://www.northface.edu" target="_blank">Northface University's</A> students are mentored by some of the most well-respected thought leaders in the software industry. The Northface University programs 
                        provide:</p>
                        
                        <blockquote>
                        <ul>
                        <li>An experiential learning environment</li>
                        <li>An accelerated, focused program</li>
                        <li>Competency in key development areas</li>
                        <li>World-class mentoring</li>
                        </ul>
                        </blockquote>
                        
                        <p>The following degree programs are currently offered by <A href="http://www.northface.edu" target="_blank">Northface University</A>:</p>
                        <ul>
                        <li><strong>Bachelor of Science in Computer Science</strong> (on-campus program: 28 month duration) enables students to align IT and business through modeling and business rules. </li>
                        <li><strong>Master of Business Administration in Enterprise Informatics</strong> (online and on-campus program: 24 month duration) provides students with a fast-paced, 
                        educational experience with a 70% real-world, project focus. </li>
                        </ul>

                        <p><A href="http://www.northface.edu" target="_blank">Northface University</A> offers unique  value through the knowledge base of its faculty , its Global 1000 corporate partnerships , and its hands-on approach 
                        to learning. ( The Northface Advantage )</p>
                    </td>
                </tr>

            </table>
            
            <p><br/></p>
            
        </td>
<!-- Center Column Ends -->

<!-- Gutter -->
<!-- Gutter Ends -->

<!-- Right Column Begins -->
        <td width="170">
            <xsl:call-template name="public_right_col">
                <xsl:with-param name="sectionName">tourny</xsl:with-param>
            </xsl:call-template>
        </td>
<!-- Right Column Ends -->

<!-- Gutter -->
        <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"/></td>
<!-- Gutter Ends -->
    </tr>
</table>

<!-- Footer begins -->
<xsl:call-template name="Foot"/>
<!-- Footer ends -->

</body>

</html>

  </xsl:template>
</xsl:stylesheet>
