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

<title>Diversified Data jobs at TopCoder Employment Services</title>

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
                            <tr><td valign="middle" bgcolor="#43515E" class="statText"><b>&#160;Diversified Data Jobs</b></td></tr>
                            <tr><td valign="middle" class="bodyText"><A href="/?&amp;t=tces&amp;c=diversifieddata_openings&amp;a=secure" class="bodyText">Jobs</A></td></tr>
                        </table>

<!-- Client Message Begins -->
                        <p><A href="/?&amp;t=tces&amp;c=diversifieddata" class="bodyText"><img src="/i/es/diversifieddata/diversifieddata_logo.gif" width="150" height="38" alt="AlphaSimplex" border="0" /></A></p>

                       <p>Diversified Data sees the big picture!</p>
                       <p><strong>Solutions</strong></p>
                       <p>Understanding clients' requirements, challenges, and technology goals is the foundation of our customer-centric solutions. Diversified Data is the leader in 
                       Content Addressed Storage (CAS) consulting and the design and integration of complex content and knowledge management environments.  Our Professional 
                       Services teams build solutions that fuel the greatest technology breakthroughs of the 21st century.</p>
                       <p>Teams comprising our leading solutions architects, accomplished engineers, project managers, and senior developers collaborate to craft end-to-end solutions 
                       that can be deployed and sustained locally or globally. </p>
                       <p>Solving our clients' most challenging technology problems and enabling their success is our mission and our passion. Discover the exceptional benefits of 
                       Diversified Data&#174; solutions in the following core competencies:</p>
                        <ul>
                        <li>Analysis of business requirements </li>
                        <li>Business process design </li>
                        <li>Completion of project plans and storyboards </li>
                        <li>Integration with legacy and Line of Business systems </li>
                        <li>Customization of user interface and delivery of specifically tailored features </li>
                        <li>Testing of solution </li>
                        <li>Application and administrative training </li>
                        <li>Centera QuickStart Developer Training </li>
                        </ul>

                        <p><strong>Proven, Results-Focused Methodology</strong></p>
                        <p>
                        Diversified Data has developed a clearly defined, results-based methodology utilizing industry-standard best practices. Diversified Data uses this methodology 
                        for implementing clients' Centera solutions and developing its own Centera software products. Our proven methodology provides a roadmap for the successful and 
                        rapid implementation of a customized Centera solution. The Diversified Data Methodology includes guidelines, checklists and templates to ensure product success 
                        and client satisfaction at every stage. We are an <A href="http://www.emc.com/partnersalliances/partner_pages/divdata.jsp" class="bodyText">EMC Centera Partner</A>.
                        </p>
                        <p><strong>What we're looking for:</strong></p>
                        <p>Developers with 3+ years of experience to join our team on a contract-to-hire basis.  Check out more of the 
                        details <A href="/?&amp;t=tces&amp;c=diversifieddata_openings&amp;a=secure" class="bodyText">here</A>.</p>
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

