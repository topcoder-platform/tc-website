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

<title>AlphaSimplex jobs at TopCoder Employment Services</title>

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
                            <tr><td valign="middle" bgcolor="#43515E" class="statText"><b>&#160;AlphaSimplex Jobs</b></td></tr>
                            <tr><td valign="middle" class="bodyText"><A href="/?&amp;t=tces&amp;c=alphasimplex_softdev&amp;a=secure" class="bodyText">Jobs</A></td></tr>
                        </table>

<!-- Client Message Begins -->
                        <p><A href="/?&amp;t=tces&amp;c=alphasimplex" class="bodyText"><img src="/i/es/alphasimplex/alphasimplex_logo.gif" width="150" height="57" alt="AlphaSimplex" border="0" /></A></p>

                       <p>AlphaSimplex Group, LLC (ASG) is a quantitative investment management company based in Cambridge, Massachusetts which, together with its technology 
                       affiliate RiskPlex, Inc., develops and integrates cutting-edge technologies from several disciplines to create risk-controlled quantitative investment strategies.</p>

                        <p>We believe that the most valuable asset of any business entity is its human capital. Therefore, we are committed to attracting and retaining the most talented and highly 
                        motivated individuals seeking a career in quantitative investment management. Although ASG purposefully maintains a lower headcount than many of its competitors, 
                        we are always prepared to recruit uniquely qualified individuals for the following positions: </p>
                        <ul>
                        <li>Research scientists </li>
                        <li>Systems engineers </li>
                        <li>Web developers </li>
                        </ul>
                        <p>Most ASG personnel have advanced degrees in finance, economics, statistics, mathematics, physics, operations research, or computer science, however, we are more 
                        interested in raw talent than in pedigree. We are particularly interested in individuals with graduate training in the following fields 
                        (no prior experience in the financial industry is necessary):</p>
                        <ul>
                        <li>Accounting </li>
                        <li>Bioinformatics </li>
                        <li>Cognitive Neurosciences </li>
                        <li>Computer Science </li>
                        <li>Electrical Engineering </li>
                        <li>Experimental Physics </li>
                        <li>Operations Research </li>
                        <li>Statistics </li>
                        </ul>
                        <p>Individuals with advanced training in other quantitative disciplines are also encouraged to apply. If you are excited by the prospect of changing the investment management 
                        industry by developing and implementing cutting-edge technologies that span many diverse disciplines, and you are at the top of your field, we want to meet you.  
                        Check out our open positions <A href="/?&amp;t=tces&amp;c=alphasimplex_softdev&amp;a=secure" class="bodyText">here</A>. </p>
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

