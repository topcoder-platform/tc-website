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
                       
                       <h3>Sales Director</h3>
                       
                       
                       Job Description: 
                        
                        <p>TopCoder Software, a division of TopCoder, Inc. is a progressive software company looking to hire a motivated, hard 
                        working salesperson to develop the New York City/Northern New Jersey area. TopCoder Software markets application 
                        development services to companies in multiple industries using a unique combination of competition qualified software 
                        developers, a rigorous development methodology and catalogs of re-usable software components. TopCoder Software also 
                        sells subscriptions to the component catalogs.</p>
                        
                        Responsibilities include: 
                        <ul>
                            <li>Exceed all revenue targets - Following a six-month period to build a sales pipeline, we expect our 
                            sales representatives to exceed quarterly revenue goals.</li>                            
                            <li>Build sales pipeline - Identify new customer prospects via professional networks, cold calling and any 
                            other means necessary to build a sales pipeline.</li>                 
                            <li>Schedule meetings - Set up meetings for TopCoder executives at qualified prospects with identified needs.</li>
                            <li>Build business plan - Build a plan for developing the assigned business including specific customers and timeframes.</li>
                        </ul>
                        
                        Qualifications include: 
                        <ul>
                            <li>Business development experience Ð Ideal candidates should have at least three years of prior technical sales experience 
                            in the New York/Northern New Jersey area.</li>                 
                            <li>Strong selling skills Ð Ideal candidates should have experience identifying, qualifying and closing 
                            software or services deals.</li>                            
                            <li>Prior success - Ideal candidates should have a demonstrated ability to consistently exceed quota.</li> 
                            <li>Strong work ethic - Ideal candidates should be able to grow a pipeline two to four times the size of quota targets and prioritize likely prospects.</li>
                            <li>College Degree - Four year degree preferred.</li>                       
                        </ul>
                        
                 <p> <strong>Contact Information</strong><br/>
                        Company: TopCoder Software<br/>
                        Contact: Dave Tanacea<br/>
                        Email: <a class="bodyText" href="mailto:dtanacea@topcoder.com?subject=TopCoder Software Sales Director">dtanacea@topcoder.com</a><br/>
                        Address: 703 Hebron Ave<br/>
	               Glastonbury, CT  06033<br/>
                        Phone: 860.633.5540</p>
                        <p><br /></p>
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
            <xsl:call-template name="public_right_col">
                <xsl:with-param name="sectionSubname">working_topcoder</xsl:with-param>
            </xsl:call-template>
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
