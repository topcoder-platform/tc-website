<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:import href="../../top.xsl"/>
  <xsl:import href="../../script.xsl"/>
  <xsl:import href="../../includes/body_top.xsl"/>  
  <xsl:import href="../../foot.xsl"/>
  <xsl:import href="../../includes/modules/practice_room.xsl"/>
  <xsl:import href="../../includes/modules/module_login.xsl"/>  
  <xsl:import href="../../includes/modules/calendar.xsl"/>
  <xsl:import href="../../includes/global_left.xsl"/> 
  <xsl:import href="../../includes/public_right_col.xsl"/>     
  <xsl:output indent="no" method="html" doctype-public="-//W3C//DTD HTML 4.0 Transitional//EN"/>
  <xsl:template match="/">

<html>

<head>

<xsl:call-template name="Preload"/>      

<title>TopCoder | Employment Services</title>

<xsl:call-template name="CSS"/>      

<meta name="description" content="TopCoder is a programming tournament site. All members who compete attain a rating that provides a metric for coding competence and potential. These ratings, coupled with tournament performance, can lead to monetary rewards and employment opportunities."/>
<meta name="keywords" content="Computer Jobs, Programming, Programming Jobs, Programming Contest, Programming Competition, Online Games, Coding, Information Technology Jobs, Java, C++"/>

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
        <td width="4"><img src="/i/table_top_fill.gif" width="4" height="26" border="0"/></td>
<!-- Gutter Ends -->

<!-- Center Column Begins -->  
        <td class="bodyText" width="100%">
            <xsl:call-template name="BodyTop">
                <xsl:with-param name="image1">white</xsl:with-param>
                <xsl:with-param name="image">jobs</xsl:with-param>
                <xsl:with-param name="title">TopCoder Employment Services</xsl:with-param>
            </xsl:call-template>

            <table border="0" cellspacing="10" cellpadding="0" width="100%">
            <tr>
                <td class="bodyText" width="100%"><img src="/i/clear.gif" alt="" width="240" height="1" border="0"/><br/>

<!--body contextual links-->
                        <table width="100%" cellpadding="3" cellspacing="0" border="0">
                            <tr><td valign="middle" bgcolor="#43515E" class="statText"><b>&#160;PayPal Jobs</b></td></tr>
                            <tr><td valign="middle" class="bodyText"></td></tr>
                        </table>

<!-- Client Job List begins -->
                        <p><A href="/?&amp;t=tces&amp;c=paypal" class="bodyText"><img src="/i/es/paypal/paypal_logo.gif" width="150" height="50" alt="PayPal" border="0" /></A></p>

                        <p><h3>Software QA Localization Engineer</h3></p>
                        
                        <p><strong>Primary Job Responsibilities</strong><br> 
                        Main responsibilities include the estimation and prioritization of work for optimal risk mitigation, identification of holes, ambiguities, 
                        and other shortcomings in feature specifications, creation and maintenance of detailed test scripts for proposed work, identification of 
                        missing test cases and refining existing scripts for modularity and automation purposes. Black box testing of International PayPal 
                        websites with emphasis on country - specific features and risks, gray box testing to validate database tables, working with QA Manager 
                        to streamline processes and improve test coverage, submission and follow - through of software defect reports, interfacing with 
                        3rd party localization QA team to assure timely testing and quality of work. This position may evolve into a lead position for a small 
                        but growing team.
                        </br>
                        </p>
                        
                        <p><strong>Job Requirements</strong></p>
                        <p>4-6+ years of Software QA engineering experience with a strong understanding of QA methodology and prior experience testing features 
                        and languages for international web-based service applications, preferably in the financial industry. 1-2 years experience working 
                        with/managing 3rd party vendors. Excellent written and verbal communications skills are a must. Outstanding attention to detail is a must. 
                        Knowledge of general programming techniques is preferred as is detailed hands-on knowledge of Unix and SQL. Experience in development, 
                        writing automated scripts, and/or using test automation tools is big a plus. Experience leading small teams is a plus. Fluency in written 
                        and spoken French is a plus.</p>   
                        
                        <p>Must be able to work within tight deadlines and be adept at balancing shifting priorities and time-management. Must be team-oriented 
                        and yet be capable of working largely on your own with minimum supervision. This position requires healthy doses of initiative and also 
                        the willingness to work long hours (and sometimes weekends) when necessary, and also to remain flexible in a very dynamic environment.</p>       
                        
                        <p><A href="/jobposting?&amp;t=JobHitTask&amp;jid=173&amp;jt=2" class="bodyText">Apply now!</A></p>
                        <p><A href="/?&amp;t=tces&amp;c=paypal_openings&amp;a=secure" class="bodyText">Back To Jobs</A></p>

<!-- Client Job List ends -->

                        <p><br/></p>
                        
                    </td>
                </tr>
            </table>
        </td>
<!-- Center Column Ends -->

<!-- Gutter -->
        <td width="4"><img src="/i/clear.gif" width="4" height="1" border="0"/></td>
<!-- Gutter Ends -->

<!-- Right Column Begins -->
        <td width="170"><img src="/i/clear.gif" width="170" height="1" border="0"/><br/>
            <xsl:call-template name="public_right_col"/>       
        </td>
<!-- Right Column Ends -->

<!-- Gutter -->
        <td width="10" bgcolor="#FFFFFF"><img src="/i/clear.gif" width="10" height="1" border="0"/></td>
<!-- Gutter Ends -->
    </tr>
</table>


<xsl:call-template name="Foot"/>

</body>

</html>

  </xsl:template>
</xsl:stylesheet>

