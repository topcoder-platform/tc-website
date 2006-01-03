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
                    	<img src="/i/development/dev_header.gif" width="500" height="47" alt="" border="0"/><br/>
                        <img src="/i/development/main_promo.jpg" width="500" height="148" alt="" border="0" usemap="#dev_promos"/>
                
                        
                        <map name="dev_promos">
                        <area shape="poly" alt="" coords="24,0, 24,46, 435,46, 480,0" href="/?t=development&amp;c=comp_projects" />
                        <area shape="poly" alt="" coords="25,148, 25,102, 378,102, 332,148" href="/tc?module=ViewReviewProjects " />
                        <area shape="poly" alt="" coords="25,96, 25,52, 434,52, 383,96" href="/?t=development&amp;c=comp_projects " />
                        <area shape="poly" alt="" coords="358,143, 487,143, 487,28" href="/?t=development&amp;c=getting_started " />
                        </map>                        
                    </td>
                </tr>
                <tr>
                    <td align="left" class="bodyText">Winning solutions are rewarded with cash payouts and royalties. Whether you're looking for a small project for yourself, or if you want to be part of a team, TopCoder Software Projects provide opportunities for you to put your skills to good use.
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
            
<!--Review begins -->
            <table border="0" cellspacing="0" cellpadding="0" width="534">
                <tr valign="top">
                    <td class="bodyText">
                        <p align="left"><font size="3"><strong>Review Boards</strong></font><br/>
                        <a href="/tc?module=ReviewBoard&amp;ph=112"><img src="/i/development/review.gif" alt="" width="165" height="95" border="0" align="right" /></a>
                       	Highly rated and experienced TopCoder members fill the ranks of the Architecture and Development Review Board. 
                       	The Architecture Review Board members screen and review all design submissions to ensure the components meet 
                       	the functional requirements, are documented properly and contain the appropriate sequence, use case and class 
                       	diagrams. The Development Review Board members verify that each development submission meets the required 
                       	functionality, coding style, adheres to the component design and contains a suitable test suite.</p>
                        
                        <p><a href="/tc?module=ReviewBoard&amp;ph=112">Meet</a> the TopCoder Review Board members.</p>
                    </td>
                </tr>
            </table>
<!--Review ends -->
            
            <hr width="534" size="1px" noshade="noshade"/>
            

            
<!-- Subscribe to catalog begins -->
            <table border="0" cellspacing="0" cellpadding="0" width="534">
                <tr valign="top">
                    <td class="bodyText">
                        <p align="left">Get unlimited access to our component catalog with a <A href="http://software.topcoder.com/components/subscriptions.jsp">FREE Developer subscription</A> or go for our <A href="http://software.topcoder.com/components/subscriptions.jsp">Enterprise subscription</A> for commercial usage.</p>
                    </td>
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

