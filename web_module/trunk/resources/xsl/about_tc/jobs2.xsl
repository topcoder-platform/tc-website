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

<title>Jobs available working for TopCoder</title>

<xsl:call-template name="CSS"/>      

<meta name="description" content="TopCoder is a programming tournament site. All members who compete attain a rating that provides a metric for coding competence and potential. These ratings, coupled with tournament performance, can lead to monetary rewards and employment opportunities." />
<meta name="keywords" content="Computer Jobs, Programming, Programming Jobs, Programming Contest, Programming Competition, Online Games, Coding, Information Technology Jobs, Java, C++" />

</head>

<body>

<xsl:call-template name="Top"/>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr valign="top">

<!-- Left Column Begins -->
        <td width="180">
            <xsl:call-template name="global_left"/>
          </td>
<!-- Left Column Ends -->

<!-- Gutter Begins -->
        <td width="15"><img src="/i/clear.gif" alt="" width="15" height="1" border="0"/></td>
<!-- Gutter Ends -->

<!-- Center Column Begins -->    
        <td class="bodyText" width="99%">
            <xsl:call-template name="BodyTop">
                <xsl:with-param name="image1">white</xsl:with-param>
                <xsl:with-param name="image">about_tc</xsl:with-param>
                <xsl:with-param name="title">Working at TopCoder</xsl:with-param>
            </xsl:call-template>
            
            <table border="0" cellspacing="0" cellpadding="0"  width="100%">
                <tr valign="top">
                    <td class="bodyText" width="100%"><br />
                    
                        <p><img src="/i/about/man_computer.jpg" alt="" width="200" height="151" border="0" align="left"  style="padding-left: 0px; padding-top: 0px; padding-right: 7px; padding-bottom: 7px;"/>TopCoder, Inc. organizes and hosts online and onsite programming competitions for a global community of members. TopCoder members 
                        extend across all professional and collegiate levels. The attraction of competition and the associated rewards create a powerful community of 
                        programmers. Corporate partners access this member base for employment, software development and sponsorship. </p>
                        
                        <p>Incorporated in 2001, TopCoder, Inc. is fast becoming the standard by which talent and software are measured.  Our small staff is young, 
                        enthusiastic and welcomes the challenges of charting new territory within the industry.  The Company has been built with integrity as our 
                        cornerstone, and we value honesty at every level &#150; from our employees and our clients alike.</p>

                        <p>Through our high-quality software, cutting-edge recruiting offerings, and world-renowned programming tournaments, we are committed 
                        to excellence.  We expect the same commitment and drive from our current and future employees.</p>
                       <h3>Currently available positions:</h3>
                        <ul>
                            <li><a href="?&#38;t=about_tc&#38;c=tc_project_manager">Project Manager</a></li>
                            <li><a href="?&#38;t=about_tc&#38;c=tc_salesperson">Salesperson</a></li>
                        </ul>
                    </td>
                    
                </tr>
            </table>
        </td>
<!-- Center Column Ends -->

<!-- Gutter -->
        <td width="15"><img src="/i/clear.gif" width="15" height="1" border="0"/></td>
<!-- Gutter Ends -->

<!-- Right Column Begins -->
        <td width="170">
            <xsl:call-template name="public_right_col"/>       
        </td>
<!-- Right Column Ends -->

<!-- Gutter -->
        <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"/></td>
<!-- Gutter Ends -->
    </tr>
</table>

<xsl:call-template name="Foot"/>

</body>

</html>

  </xsl:template>
</xsl:stylesheet>
