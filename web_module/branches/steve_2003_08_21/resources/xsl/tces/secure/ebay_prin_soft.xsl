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
                <xsl:with-param name="title">&#160;TopCoder Employment Services</xsl:with-param>
            </xsl:call-template>

            <table border="0" cellspacing="10" cellpadding="0" width="100%">
            <tr>
                <td class="bodyText" width="100%"><img src="/i/clear.gif" alt="" width="240" height="1" border="0"/><br/>

<!--body contextual links-->
                        <table width="100%" cellpadding="3" cellspacing="0" border="0">
                            <tr><td valign="middle" bgcolor="#43515E" class="statText"><b>&#160;eBay Jobs</b></td></tr>
                            <tr><td valign="middle" class="bodyText"><A href="/?&amp;t=tces&amp;c=ebay_openings&amp;a=secure" class="bodyText">Jobs</A></td></tr>
                        </table>

<!-- Client Job List begins -->
                        <p><A href="/?&amp;t=tces&amp;c=ebay" class="bodyText"><img src="/i/es/ebay/eBay_logo.gif" width="121" height="56" alt="eBay" border="0" /></A></p>

                        <h3>Principal Software Engineer, Messaging - 0300475</h3>
                        
                        
                        <p><strong>Job Description</strong><br />
                        eBay is building a strategic Enterprise Messaging Infrastructure to serve our rapid site expansion and systems growth. We are seeking a Principle Engineer/Architect level 
                        hands-on messaging technology leader to drive this critical implementation. This position requires expertise with MQ Series and pub-sub messaging technologies as well 
                        as experience with high-volume, mission-critical 24x7 solutions.This is a position in the eBay Product Development organization:
                        <ul>
                        <li>Responsible for owning, developing, and maintaining the overarching messaging infrastructure for all enterprise-level systems. </li>
                        <li>Develop Java/J2EE Messaging integration as well as multi-platform specialized C/C++ messaging components. Deliver world-class, large-scale, global, and 
                        secure mission-critical messaging solutions. Support multiple messaging application implementation teams by developing a world-class messaging infrastructure.</li>
                        <li>Work with the engineering staff, DBA, QA and Operation teams to productize and evangelize the messaging infrastructure.</li>
                        <li>Provide mentorship to the product development organization on the use of messaging and design and coding techniques.</li>
                        <li>Must be able to independently design, code and test major features, as well as work jointly with other team members to deliver complex changes.</li>
                        <li>Ensure systems implementations occur in accordance with established Change Control procedures.</li>
                        </ul>
                        </p>
                                                
                        <p><strong>Required Skills</strong></p>
                        
                        <ul>
                        <li>BS/BA in CS or relevant experience.</li>
                        <li>12+ years of large scale, full life cycle development experience and at least 3 years as a Tech Lead or Architect with deep messaging experience</li>
                        <li>Must have experience implementing enterprise wide messaging applications based on MQSeries.</li>
                        <li>Must be able to design MQSeries installations that are robust, highly available, and performing.</li>
                        <li>Nice to have: experience working with hands-on experience working with Tibco Rendezvous Tibco HAWK, Tibco MessageBroker, Tibco Integration manager, 
                        TIBCO Adapter SDK is also preferred. Knowledge of other messaging platforms is a plus.</li>
                        <li>2-3 years of related senior-level development work in Java and J2EE or 2-3 years of related senior-level development work in C, C++. </li>
                        <li>In addition, must have 2-3 years of relational database work experience (Oracle preferred).</li>
                        <li>Demonstrated technical and analytical skills</li>
                        <li>Excellent verbal and written communication skills</li>
                        </ul>


                       
                        
                        <p align="center"><a href="#" class="bodyText">Apply now!</a> | <a href="/?&amp;t=tces&amp;c=ebay_openings&amp;a=secure" class="bodyText">Back to Jobs</a></p>

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

