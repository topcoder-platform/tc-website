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
        <title>TopCoder :: About TopCoder</title>
        <xsl:call-template name="CSS"/>      
        <!--<LINK REL="stylesheet" TYPE="text/css" HREF="/css/style.css"/>
        <LINK REL="stylesheet" TYPE="text/css" HREF="/css/coders.css"/>-->
        <meta name="description" content="TopCoder is a programming tournament site. All members who compete attain a rating that provides a metric for coding competence and potential. These ratings, coupled with tournament performance, can lead to monetary rewards and employment opportunities." />
        <meta name="keywords" content="Computer Jobs, Programming, Programming Jobs, Programming Contest, Programming Competition, Online Games, Coding, Information Technology Jobs, Java, C++" />
      </head>
      <body bgcolor="#FFFFFF" topmargin="0" marginheight="0" leftmargin="0" marginwidth="0">
        <xsl:call-template name="Top"/>
<!-- Body Begins -->
<table width="100%" height="69%" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
    <tr>
    <!-- Left Column Begins -->
        <td width="170" bgcolor="#CCCCCC" valign="top">
    <!-- Global Seconday Nav Begins -->        
<!-- Left Column Include Begins -->    
    <!-- Global Seconday Nav Begins -->    
        <xsl:call-template name="global_left"/>
    <!-- Global Seconday Nav Ends -->    
<!-- Left Column Include Ends -->
          </td>
    <!-- Left Column Ends -->
    <!-- Gutter Begins -->
        <td width="4" bgcolor="#FFFFFF" valign="top"><img src="/i/table_top_fill.gif" width="4" height="26" border="0"/></td>
    <!-- Gutter Ends -->

<!-- Body Area -->
    <!-- Center Column Begins -->    
        <td class="bodyText" width="100%" bgcolor="#FFFFFF" valign="top">
<xsl:call-template name="BodyTop">
  <xsl:with-param name="image1">white</xsl:with-param>
  <xsl:with-param name="image">about_tc</xsl:with-param>
  <xsl:with-param name="title">Jobs at TopCoder</xsl:with-param>
</xsl:call-template>
            <table border="0" cellspacing="0" cellpadding="0" bgcolor="#FFFFFF" width="100%">
                <tr>
                    <td valign="top" width="11"><img src="/i/clear.gif" alt="" width="11" height="1" border="0"/></td>
                    <td class="bodyText" colspan="2" valign="top" bgcolor="#FFFFFF" width="100%"><img src="/i/clear.gif" alt="" width="240" height="1" border="0"/><br/><br/>
                        <p>TopCoder has established itself as the premier way to differentiate development talent, and has developed several unique products and 
                        services designed to improve software development productivity and efficiency. We are looking to fill internal positions for a Graphic 
                        Designer and a Salesperson. See the job descriptions below for details.</p>
                        
                        <hr width="100%" noshade="noshade" />
                        
                        <p><strong>TopCoder Employment Services Salesperson</strong></p>
                        
                        <p>We are currently looking for a salesperson to join TopCoder Employment Services. Candidates must work well under pressure in a 
                        high-risk environment and must have excellent  communication skills. We currently offer two programs for clients&#151;the TopCoder 
                        Recruiting Program, whereby clients post jobs on our website and are given access to detailed statistical information about interested 
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
                        
                        <hr width="100%" noshade="noshade" />
                        
                        <p><strong>Graphic Designer</strong></p>
                        
                        <p>We are currently looking for a graphic designer in our Marketing Department. The graphic designer must work well under pressure in a 
                        high-risk environment and must have excellent communication skills. The graphic designer must be willing to work long hours and actively 
                        seek out projects. The ideal candidate is a self-starter who seeks out opportunities to learn new technologies and skills. Only qualified 
                        applicants will be contacted. Salary is based on experience.</p>

                        Required Skills: 
                        <ul>
                            <li>Photoshop</li>
                            <li>Illustrator</li>
                            <li>QuarkXpress</li>
                            <li>Advanced HTML layout using CSS</li>
                            <li>Mac and Windows platforms</li>
                        </ul>
                        Additional Skills: 
                        <ul>
                            <li>XSL</li>
                            <li>JSP</li>
                            <li>JavaScript</li>
                            <li>Photography</li>
                            <li>Video Production</li>
                        </ul>
                        Responsibilities: 
                        <ul>
                            <li>Edit and create HTML/JSP templates for our web sites. </li>
                            <li>Design and produce internal promotions for our web sites. </li>
                            <li>Design and produce marketing / sales collateral materials. </li>
                        </ul>
                        This position is at our Glastonbury, CT offices. No telecommuting options are available. <a class="bodyText" href="mailto:tces@topcoder.com?subject=TopCoder Graphic Designer">Apply for this job</a> by email.
                        
                        <hr width="100%" noshade="noshade" />
                    </td>
                    
                    <td valign="top" width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0"/></td>
                </tr>
                <tr>
                    <td colspan="4" valign="top" bgcolor="#FFFFFF" width="100%"><img src="/i/clear.gif" alt="" width="1" height="10" border="0"/></td>
                </tr>       
                <tr>
                    <td valign="top" bgcolor="#FFFFFF" width="11" align="right"><img src="/i/clear.gif" alt="" width="11" height="8" border="0"/></td>
                    <td valign="top" width="75"><img src="/i/table_mid_left2.gif" alt="" width="14" height="8" border="0"/></td>
                    <td valign="top" bgcolor="#FFFFFF" width="100%"><img src="/i/clear.gif" alt="" width="1" height="1" border="0"/></td>
                    <td valign="top" bgcolor="#FFFFFF" width="10"><img src="/i/clear.gif" alt="" width="1" height="1" border="0"/></td>
                </tr>    
                <tr>
                    <td valign="top" width="11" align="right" bgcolor="#FFFFFF"><img src="/i/clear.gif" alt="" width="11" height="8" border="0"/></td>
                    <td valign="top" bgcolor="#FFFFFF" width="14"><img src="/i/table_btm_left2.gif" alt="" width="14" height="8" border="0"/></td>
                    <td valign="top" bgcolor="#FFFFFF" width="100%"><img src="/i/clear.gif" alt="" width="1" height="1" border="0"/></td>
                    <td valign="top" bgcolor="#FFFFFF" width="10"><img src="/i/clear.gif" alt="" width="1" height="1" border="0"/></td>
                </tr>
            </table>
        </td>
    <!-- Center Column Ends -->
<!-- Body Area Ends -->

    <!-- Gutter -->
        <td width="4" bgcolor="#FFFFFF"><img src="/i/clear.gif" width="4" height="1" border="0"/></td>
    <!-- Gutter Ends -->
    <!-- Right Column Begins -->
        <td width="170" bgcolor="#FFFFFF" valign="top"><img src="/i/clear.gif" width="170" height="1" border="0"/><br/>
<!-- Right Column Include Begins --> 
        <xsl:call-template name="public_right_col"/>       
<!-- Right Column Include Ends -->        
        </td>
    <!-- Right Column Ends -->
    <!-- Gutter -->
        <td width="10" bgcolor="#FFFFFF"><img src="/i/clear.gif" width="10" height="1" border="0"/></td>
    <!-- Gutter Ends -->
    </tr>
</table>
<!-- Body Ends -->
        <xsl:call-template name="Foot"/>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
