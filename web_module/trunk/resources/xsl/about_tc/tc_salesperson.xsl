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
                       
                       <h3>Salesperson</h3>
                        
                        <p>We are currently looking for a salesperson to join TopCoder Employment Services. Candidates must work well under pressure in a 
                        high-risk environment and must have excellent  communication skills. We currently offer two programs for clients&#151;the TopCoder 
                        Recruiting Program, whereby clients post jobs on our web site and are given access to detailed statistical information about interested 
                        candidates, and the TopCoder Testing Program, whereby clients have the ability to test a developer's programming skills prior to making 
                        a hiring decision. The salesperson will be calling on qualified companies to identify and contact appropriate professionals interested in 
                        finding quality candidates through TopCoder. The salesperson will build a relationship with these professionals and set up phone calls 
                        and meetings for themselves and TopCoder executives.  Only qualified applicants with in-demand skills will be contacted. Salary and 
                        commission is based on experience.</p>
                        
                        Responsibilities: 
                        <ul>
                            <li>Identify companies with sales potential for TopCoder Employment Services.</li>
                            <li>Identify appropriate professionals within the companies. </li>
                            <li>Contact appropriate professionals and describe our company and programs. </li>
                            <li>Build a relationship with appropriate professionals. </li>
                            <li>Set up phone calls and meetings between appropriate professionals and TopCoder Executives. </li>
                            <li>Negotiate contracts and agreements with interested parties.</li>
                            <li>Ensure the collection of any outstanding payments due to TopCoder.</li>
                        </ul>
                        This position is at our Glastonbury, CT offices. No telecommuting options are available. <a class="bodyText" href="mailto:tces@topcoder.com?subject=TopCoder Employment Services Salesperson">Apply for this job</a> by email.

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
