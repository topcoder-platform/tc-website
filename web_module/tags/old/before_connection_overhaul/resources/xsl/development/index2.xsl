<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:import href="../top.xsl" />
    <xsl:import href="../script.xsl" />
    <xsl:import href="../includes/body_top.xsl" />
    <xsl:import href="../foot.xsl" />
    <xsl:import href="../includes/modules/stats_intro.xsl" />
    <xsl:import href="../includes/global_left.xsl"/>
    <xsl:import href="../includes/dev/tcs_tco_projects.xsl" />
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
    <xsl:call-template name="Top" />

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
            <td class="bodyText" width="100%">

            <div align="center">
            <table border="0" cellpadding="0" cellspacing="0" width="534">
                <tr>
                    <td width="534" align="left" class="bodyText">
                        <img src="/images/clear.gif" width="1" height="20" alt="" border="0"/><br/>
                        <strong><img src="/i/development/title_another_way.gif" alt="Another way to compete, earn cash, royalties, and recognition" width="510" height="84" border="0" /></strong>
                        <p align="left"><strong>You've got a few TopCoder Single Round Matches under your belt. Now you're ready for these challenging 
                        (and potentially lucrative) projects. Winning solutions are rewarded with cash payouts and royalites. Whether you're 
                        looking for a small project for yourself, or if you want to be part of a team, TopCoder Software Projects provide 
                        opportunities for you to put your skills to good use.</strong></p>
                        <img src="/images/clear.gif" width="1" height="1" alt="" border="0"/>
                    </td>
                </tr>
            </table>

            <table border="0" cellspacing="0" cellpadding="0" width="534">
                <tr valign="top">
                    <td class="bodyText" width="25%" align="center"><A href="/?t=development&amp;c=dev_payment"><img src="/i/development/promo_howtogetpaid.gif" alt="How to get paid" width="126" height="126" border="0" /></A></td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0"/></td>
                    <td class="bodyText" width="25%" align="center"><A href="http://software.topcoder.com/forum/c_active_collab.jsp?ft=2"><img src="/i/development/promo_dev_forums.gif" alt="Developer Forums" width="126" height="126" border="0" /></A></td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0"/></td>
                    <td class="bodyText" width="25%" align="center"><A href="/rtables/viewForum.jsp?forum=157655&amp;mc=239"><img src="/i/development/promo_roundtables.gif" alt="Round Tables" width="126" height="126" border="0" /></A></td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0"/></td>
                    <td class="bodyText" width="25%" align="center"><A href="/?t=development&amp;c=comp_projects"><img src="/i/development/promo_openprojects.gif" alt="Open Projects" width="126" height="126" border="0" /></A></td>
                </tr>
            </table><br/>
            
            </div>

            <table border="0" cellspacing="0" cellpadding="0" width="100%">
                <tr valign="top">
                    <td class="bodyText">
                        <p><font size="3"><strong>Software Components</strong></font><br/>
                        If you're a rated TopCoder member, you can submit design and development <A href="/?t=development&amp;c=components">solutions</A> for these projects. You will be 
                        paid cash for each winning solution you submit.  Every solution becomes part of a TopCoder Software <A href="http://software.topcoder.com/catalog/c_showroom.jsp">Catalog,</A> now 
                        available for sale online. For every commercial sale of a catalog, TopCoder will pay the members who designed and 
                        developed the components in that catalog a percentage of the sale. </p>
                        
                        <p><A href="/?t=development&amp;c=comp_meth">Learn more</A> about the TopCoder Software Component Methodology</p>
                    </td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0"/></td>
                    <td width="10"><A href="/?t=development&amp;c=components"><img src="/i/development/graphic_components.gif" alt="" width="165" height="95" border="0" /></A></td>
                </tr>
            </table>
            
            <hr width="100%" size="1px" noshade="noshade"/>
            
            <table border="0" cellspacing="0" cellpadding="0" width="100%">
                <tr valign="top">
                    <td class="bodyText">
                        <p><font size="3"><strong>Application Development</strong></font><br/>
                        Rated members with a winning track record of Software Component solutions attain Level II TopCoder Developer 
                        status, and become eligible for TopCoder Application Development teams. As part of a team, you will customize 
                        and integrate components for specific applications, both internal to TopCoder and for commercial sale. These 
                        projects pay out higher cash amounts than Component projects, and royalties are paid to team members for 
                        every commercial sale of the application.</p>
                        
                        <p><A href="/?t=development&amp;c=app_meth">Learn more</A> about the TopCoder Software Application Methodology</p>
                    </td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0"/></td>
                    <td width="10"><A href="/?t=development&amp;c=app_projects"><img src="/i/development/graphic_applications.gif" alt="" width="165" height="95" border="0" /></A></td>
                </tr>
            </table>
            
            <hr width="100%" size="1px" noshade="noshade"/>
            
            <table border="0" cellspacing="0" cellpadding="0" width="100%">
                <tr valign="top">
                    <td class="bodyText">
                        <p><A href="http://software.topcoder.com/components/subscriptions.jsp">Subscribe</A> to a TopCoder Software Component Catalog. 
                        Learn more about components by downloading exclusive documentation. Now available at introductory pricing for as little as $12.95 a month.</p>
                    </td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0"/></td>
                    <td width="10"><A href="http://software.topcoder.com/components/subscriptions.jsp"><img src="/i/development/buy_now.gif" alt="Buy Now" width="170" height="50" border="0" /></A></td>
                </tr>
            </table>
            
            <hr width="100%" size="1px" noshade="noshade"/>

            <p><br/></p>
            
        </td>
<!-- Center Column Ends -->

<!-- Gutter Begins -->
        <td width="15"><img src="/i/clear.gif" width="15" height="1" alt="" border="0" /></td>
<!-- Gutter Ends -->

<!-- Right Column Begins -->
        <td width="244">
            <xsl:call-template name="tcs_tco_projects" />
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

