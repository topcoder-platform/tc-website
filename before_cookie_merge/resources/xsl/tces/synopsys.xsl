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

<title>Synopsys jobs at TopCoder Employment Services</title>

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
                            <tr><td valign="middle" bgcolor="#43515E" class="statText"><b>&#160;Synopsys Jobs</b></td></tr>
                            <tr><td valign="middle" class="bodyText"><A href="/?&amp;t=tces&amp;c=synopsys_openings&amp;a=secure" class="bodyText">Jobs</A></td></tr>
                        </table>

<!-- Client Message Begins -->
                        <p><A href="/?&amp;t=tces&amp;c=synopsys" class="bodyText"><img src="/i/es/synopsys/synopsys_logo.gif" width="130" height="34" alt="Synopsys" border="0" /></A></p>

                        <p>In 1986, a group of six determined engineers had an idea that would forever change the world of high-level 
                        design automation. Armed with a loan, a plan, and a great deal of inspiration, Dr. Aart J. de Geus and his peers 
                        set out to successfully commercialize logic synthesis. Little did they know, 13 years later they would produce 
                        a company that now has market dominance in synthesis, design creation, high level verification, deep submicron, 
                        and services. Critical areas that will most assuredly allow design engineers to develop the next generation of 
                        electronic products, and beyond. </p>

                        <p>Synopsys' mission is clear&#151;to revolutionize the way in which electronic design is done and deliver 
                        the latest methodologies, tools, and services to maximize the productivity of its customers. Our goal, to 
                        improve designs from every standpoint, from performance and costs, to power and time-to-market. With 
                        such tremendous focus on leadership, excellence and integrity in every step of every process, it's not 
                        surprising that Synopsys will achieve this aggressive goal. And it's no surprise that every important chip 
                        in the future will be designed using Synopsys. </p>

                        <p>With major investments in R&amp;D, substantial acquisitions of highly innovative companies, and a 
                        phenomenal fiscal year (revenue exceeding $717 million), we're well on our way to becoming the world's 
                        indisputable total-solution EDA provider. The tribute to our success, the nearly 3,000 employees or 
                        revolutionaries across the globe. Revolutionaries who provide products and services that will allow 
                        engineers to design the next generation of high complexity System-on-a-Chip solutions. Revolutionaries 
                        determined to make Synopsys the technology powerhouse for SoC.</p>

                        <p>Of course, innovative minds demand an innovative workplace. And once again, Synopsys leads the way 
                        in the EDA industry. Unique programs such as our Dual Career Ladder provide enriched opportunities in 
                        every area of the company for every employee. Flexibility and choice in our benefit plans, investment 
                        plans, work schedules, and telecommuting options ensures a meaningful balance of work and life. A strong 
                        focus on community-based outreach and volunteer efforts makes that balance meaningful. And weekly 
                        employee socials, summer concerts, and extensive family-sponsored events ensure we play as hard as 
                        we work.</p>

                        <p>If you're serious about being an integral part of important innovation, lead the revolution. Bring 
                        your ideas to Synopsys. Technology begins with us.</p>

                        <p><A href="/?&amp;t=tces&amp;c=synopsys_openings&amp;a=secure" class="bodyText">Job Listings</A></p>
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

