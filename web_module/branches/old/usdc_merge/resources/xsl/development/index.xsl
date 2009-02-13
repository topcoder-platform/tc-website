<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:import href="../top.xsl" />
    <xsl:import href="../script.xsl" />
    <xsl:import href="../includes/body_top.xsl" />
    <xsl:import href="../foot.xsl" />
    <xsl:import href="../includes/modules/stats_intro.xsl" />
    <xsl:import href="../includes/global_left.xsl"/>
    <xsl:import href="../includes/dev/public_dev_right.xsl" />
    <xsl:output indent="no" method="html" doctype-public="-//W3C//DTD HTML 4.0 Transitional//EN" />
    <xsl:template match="/">

<html>
<head>

    <xsl:call-template name="Preload" />

 <title>TopCoder Software Development: Another way to compete, earn cash, royalties, and recognition</title>

    <xsl:call-template name="CSS" />

<meta name="description" content="TopCoder is a programming tournament site. All members who compete attain a rating that provides a metric for coding competence and potential. These ratings, coupled with tournament performance, can lead to monetary rewards and employment opportunities." />
<meta name="keywords" content="Computer Jobs, Programming, Programming Jobs, Programming Contest, Programming Competition, Online Games, Coding, Information Technology Jobs, Java, C++" />

</head>

<BODY>
                <xsl:call-template name="Top">
                <xsl:with-param name="level1">development</xsl:with-param>
                </xsl:call-template>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr valign="top">
<!-- Left Column Begins -->
        <td width="180">
            <xsl:call-template name="global_left">
                <xsl:with-param name="level1">dev_index</xsl:with-param>
            </xsl:call-template>
          </td>
<!-- Left Column Ends -->

<!-- Gutter Begins -->
        <td width="15"><img src="/i/clear.gif" width="15" height="5" alt="" border="0" /></td>
<!-- Gutter Ends -->

<!-- Center Column Begins -->
            <td class="bodyText" width="99%">
            <br/>
            
            <div align="center">
            <table border="0" cellpadding="10" cellspacing="0" width="534">
                <tr>
                    <td align="center" class="bodyText">
                        <img src="/i/development/dev_home_promo.jpg" width="489" height="314" alt="" border="0" usemap="#dev_promos"/>
                        <map name="dev_promos">
                        <area shape="rect" alt="" coords="40,55,225,240" href="/?t=development&amp;c=comp_projects" />
                        <area shape="rect" alt="" coords="300,55,435,240" href="/tc?module=ViewReviewProjects " />
                        </map>
                    </td>
                </tr>
                <tr>
                    <td align="left" class="bodyText">Winning solutions are rewarded with cash payouts and royalites. Whether you're looking for a small project for yourself, or if you want to be part of a team, TopCoder Software Projects provide opportunities for you to put your skills to good use.
                    </td>
                </tr>
                <tr>
                    <td align="center" class="bodyText"><a href="/?t=development&amp;c=getting_started"><img src="/i/development/getting_started.gif" border="0" width="534" height="35"/></a>
                    </td>
                </tr>
            </table>

		<br/>

            <hr width="534" size="1px" noshade="noshade"/>

<!--Component Development begins -->
            <table border="0" cellspacing="0" cellpadding="0" width="534">
                <tr valign="top">
                    <td class="bodyText">
                        <p align="left"><font size="3"><strong>Software Components</strong></font><br/>
                        <A href="/?t=development&amp;c=components"><img src="/i/development/graphic_components.gif" alt="" width="165" height="95" border="0"  align="right" /></A>
                        If you're a TopCoder member, you can submit design and development <A href="/?t=development&amp;c=components">solutions</A> for these projects. You will be 
                        paid cash for each winning solution you submit.  Every solution becomes part of a TopCoder Software <A href="http://software.topcoder.com/catalog/c_showroom.jsp">Catalog,</A> now 
                        available for sale online. For every commercial sale of a catalog, TopCoder will pay the members who designed and 
                        developed the components in that catalog a percentage of the sale. </p>
                        
                        <p><A href="/?t=development&amp;c=comp_meth">Learn more</A> about the TopCoder Software Component Methodology</p>
                    </td>
                </tr>
            </table>
<!--Component Development ends -->
            
            <hr width="534" size="1px" noshade="noshade"/>
            
<!--Application Development begins -->
            <table border="0" cellspacing="0" cellpadding="0" width="534">
                <tr valign="top">
                    <td class="bodyText">
                        <p align="left"><font size="3"><strong>Application Development</strong></font><br/>
                        <A href="/?t=development&amp;c=app_projects"><img src="/i/development/graphic_applications.gif" alt="" width="165" height="95" border="0" align="right" /></A>
                        Rated members with a winning track record of Software Component solutions attain Level II TopCoder Developer 
                        status, and become eligible for TopCoder Application Development teams. As part of a team, you will customize 
                        and integrate components for specific applications, both internal to TopCoder and for commercial sale. These 
                        projects pay out higher cash amounts than Component projects, and royalties are paid to team members for 
                        every commercial sale of the application.</p>
                        
                        <p><A href="/?t=development&amp;c=app_meth">Learn more</A> about the TopCoder Software Application Methodology</p>
                    </td>
                </tr>
            </table>
<!--Application Development ends -->
            
            <hr width="534" size="1px" noshade="noshade"/>
            
<!-- Subscribe to catalog begins -->
            <table border="0" cellspacing="0" cellpadding="0" width="534">
                <tr valign="top">
                    <td class="bodyText">
                        <p align="left"><A href="http://software.topcoder.com/components/subscriptions.jsp">Subscribe</A> to a TopCoder Software Component Catalog. 
                        Learn more about components by downloading exclusive documentation. Now available at introductory pricing for as little as $12.95 a month.</p>
                    </td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0"/></td>
                    <td width="10"><A href="http://software.topcoder.com/components/subscriptions.jsp"><img src="/i/development/buy_now.gif" alt="Buy Now" width="170" height="50" border="0" /></A></td>
                </tr>
            </table>
<!-- Subscribe to catalog ends -->
            
            <hr width="534" size="1px" noshade="noshade"/>

            </div>

            <p><br/></p>
            
        </td>
<!-- Center Column Ends -->

<!-- Gutter Begins -->
        <td width="15"><img src="/i/clear.gif" width="15" height="1" alt="" border="0" /></td>
<!-- Gutter Ends -->

<!-- Right Column Begins -->
        <td width="244">
            <xsl:call-template name="public_dev_right" />
        </td>
<!-- Right Column Ends -->

    </tr>
</table>

<!-- Footer Begins -->
        <xsl:call-template name="Foot" />
<!-- Footer Endss -->

</BODY>
</html>
    </xsl:template>
</xsl:stylesheet>

