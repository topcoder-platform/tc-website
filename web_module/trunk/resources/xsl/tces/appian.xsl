<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:import href="../top.xsl"/>
  <xsl:import href="../script.xsl"/>
  <xsl:import href="../includes/body_top.xsl"/>  
  <xsl:import href="../foot.xsl"/>
  <xsl:import href="../includes/modules/practice_room.xsl"/>
  <xsl:import href="../includes/modules/module_login.xsl"/>  
  <xsl:import href="../includes/modules/calendar.xsl"/>
  <xsl:import href="../includes/global_left.xsl"/> 
  <xsl:import href="../includes/public_right_col.xsl"/>     
  <xsl:output indent="no" method="html" doctype-public="-//W3C//DTD HTML 4.0 Transitional//EN"/>
  <xsl:template match="/">

<html>

<head>

<xsl:call-template name="Preload"/>      

<title>TopCoder | Employment Services</title>

<xsl:call-template name="CSS"/>      

<meta name="description" content="TopCoder is a programming tournament site. All members who compete attain a rating that provides a metric for coding competence and potential. These ratings, coupled with tournament performance, can lead to monetary rewards and employment opportunities." />
<meta name="keywords" content="Computer Jobs, Programming, Programming Jobs, Programming Contest, Programming Competition, Online Games, Coding, Information Technology Jobs, Java, C++" />

</head>

<body>

<xsl:call-template name="Top"/>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr valign="top">

<!-- Left Column Begins -->
        <td width="170" bgcolor="#CCCCCC">
            <xsl:call-template name="global_left"/>
        </td>
<!-- Left Column Ends -->

<!-- Gutter Begins -->
        <td width="4"><img src="/i/table_top_fill.gif" width="4" height="26" alt="" border="0"/></td>
<!-- Gutter Ends -->

<!-- Center Column Begins -->  
        <td class="bodyText" width="100%">
            <xsl:call-template name="BodyTop">
                <xsl:with-param name="image1">white</xsl:with-param>
                <xsl:with-param name="image">jobs</xsl:with-param>
                <xsl:with-param name="title">&#160;TopCoder Employment Services</xsl:with-param>
            </xsl:call-template>
            
            <table border="0" cellspacing="10" cellpadding="0" width="100%">
                <tr valign="top">
                    <td class="bodyText" width="100%"><img src="/i/clear.gif" alt="" width="240" height="1" border="0" /><br />

<!--body contextual links-->
                        <table width="100%" cellpadding="3" cellspacing="0" border="0">
                            <tr><td valign="middle" bgcolor="#43515E" class="statText"><b>&#160;Appian Jobs</b></td></tr>
                            <tr><td valign="middle" class="bodyText"><A href="/?&amp;t=tces&amp;c=appian_soft_eng&amp;a=secure" class="bodyText">Jobs</A></td></tr>
                        </table>

<!-- Client Message Begins -->
                        <p><A href="/?&amp;t=tces&amp;c=appian" class="bodyText"><img src="/i/es/appian/appian_logo.gif" width="121" height="38" alt="Appian" border="0" /></A></p>

                        <p>What's your edge?</p>

                        <p>Today, organizations have virtually unlimited access to data.  The sheer volume can easily overwhelm the unprepared.</p>

                        <p>For the prepared, however, the ability to capture and use data effectively and efficiently can be a critical competitive 
                        edge. Whether you're a blue-chip company competing for market share or a government agency serving the public, Appian 
                        can help you manage and leverage your data to gain a strategic advantage.</p>

                        <p>Appian is a software and professional services company dedicated to connecting people and ideas.  We build real time, 
                        enterprise web solutions that leverage the power of personalization to enable blue-chip companies and government agencies 
                        to integrate and transform the way business users work together and interact with information.</p>

                        <p>Appian solutions are tailored to meet the special needs of our customers. Our expertise and experience includes 
                        development and deployment of solutions for the energy, financial services, retail, telecommunications, insurance, and 
                        health care industries, in addition to extensive work for federal and state government.</p>

                        <p>Our client relationships are enduring. With dozens of sites and thousands of users, these organizations demand the best.  
                        Best in technical thought.  Best in rapid deployment.  And best in building solutions that scale to meet unexpected demand 
                        and future growth.</p>

                        <p>Since 1999, Appian revenue and personnel have increased by 100% annually. We are completely self-funded and 
                        profitable. Such solid, triple-digit growth is unusual during an economic downturn. But then, Appian isn't like other 
                        companies.</p>

                        <p>We are looking to hire top quality <A href="/?&amp;t=tces&amp;c=appian_soft_eng&amp;a=secure" class="bodyText">Software Engineers.</A></p>
<!-- Client Message Ends -->

                        <p><br /></p>
                        
                    </td>
                </tr>
            </table>
        </td>
<!-- Center Column Ends -->

<!-- Gutter -->
        <td width="4"><img src="/i/clear.gif" width="4" height="1" alt="" border="0" /></td>
<!-- Gutter Ends -->

<!-- Right Column Begins -->
        <td width="170"><img src="/i/clear.gif" width="170" height="1" alt="" border="0" /><br />
            <xsl:call-template name="public_right_col"/>       
        </td>
<!-- Right Column Ends -->

<!-- Gutter -->
        <td width="10" bgcolor="#FFFFFF"><img src="/i/clear.gif" width="10" height="1" alt="" border="0" /></td>
<!-- Gutter Ends -->
    </tr>
</table>


<xsl:call-template name="Foot"/>

</body>

</html>

  </xsl:template>
</xsl:stylesheet>

