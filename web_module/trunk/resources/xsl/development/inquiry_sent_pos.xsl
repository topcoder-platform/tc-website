<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:import href="../top.xsl" />
    <xsl:import href="../script.xsl" />
    <xsl:import href="../includes/body_top.xsl" />  
    <xsl:import href="../foot.xsl" />
    <xsl:import href="../includes/modules/stats_intro.xsl" />  
    <xsl:import href="../includes/global_left.xsl"/> 
    <xsl:import href="../includes/dev/public_dev_right.xsl"/> 
    <xsl:output indent="no" method="html" doctype-public="-//W3C//DTD HTML 4.0 Transitional//EN" />
    <xsl:template match="/">

<html>
<head>

    <xsl:call-template name="Preload" />      

<title>Inquire about the <xsl:value-of select="/TC/DEVELOPMENT/Project"/> project at TopCoder Software Development</title>

    <xsl:call-template name="CSS" />      

<meta name="description" content="TopCoder is a programming tournament site. All members who compete attain a rating that provides a metric for coding competence and potential. These ratings, coupled with tournament performance, can lead to monetary rewards and employment opportunities." />
<meta name="keywords" content="Computer Jobs, Programming, Programming Jobs, Programming Contest, Programming Competition, Online Games, Coding, Information Technology Jobs, Java, C++" />

</head>

<body>

<xsl:call-template name="Top" />

<table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr valign="top">
<!-- Left Column Begins -->
        <td width="180">
            <xsl:call-template name="global_left"/>
        </td>
<!-- Left Column Ends -->

<!-- Gutter Begins -->
        <td width="6"><img src="/i/clear.gif" width="6" height="8" alt="" border="0" /></td>
<!-- Gutter Ends -->

<!-- Center Column Begins -->  
        <td class="bodyText" width="100%">
            <xsl:call-template name="BodyTop">
                <xsl:with-param name="image1">white</xsl:with-param>
                <xsl:with-param name="image">development</xsl:with-param>
                <xsl:with-param name="title">&#160;Inquiry</xsl:with-param>
            </xsl:call-template>
            <xsl:variable name='FORUMID' select='/TC/DEVELOPMENT/forumId'/>
            <xsl:variable name='design' select='/TC/DEVELOPMENT/design'/>
            <xsl:variable name='Project' select='/TC/DEVELOPMENT/Project'/>

              <input type="hidden" name="handle">
                <xsl:attribute name="VALUE"><xsl:value-of select="/TC/DEVELOPMENT/handle"/></xsl:attribute>
              </input>
              <input type="hidden" name="date">
                <xsl:attribute name="VALUE"><xsl:value-of select="/TC/DEVELOPMENT/date"/></xsl:attribute>
              </input>
              <input type="hidden" name="Project">
                <xsl:attribute name="VALUE"><xsl:value-of select="/TC/DEVELOPMENT/Project"/></xsl:attribute>
              </input>
              <input type="hidden" name="forum">
                <xsl:attribute name="VALUE"><xsl:value-of select="/TC/DEVELOPMENT/forumId"/></xsl:attribute>
              </input>

            <table border="0" cellspacing="0" cellpadding="10" width="100%"><img src="/i/clear.gif" alt="" width="240" height="10" border="0" /><br />
                <tr valign="top">
                    <td class="bodyText" width="100%">
                        
                        <p><strong>Your inquiry has been sent. Thank You!</strong></p>
        
                            Thank you, <xsl:value-of select="/TC/DEVELOPMENT/handle"/>, for your interest in the <xsl:value-of select="/TC/DEVELOPMENT/Project"/> component.  You now have access to the
                            <a>
                                <xsl:attribute name="href">
                                    <xsl:value-of select="concat('http://software.topcoder.com/forum/c_forum.jsp?f=',$FORUMID)"/>
                                </xsl:attribute>
                                Developer Forum
                            </a>  
                               <xsl:choose>
                                <!-- xsl:when test="$design=1" -->
                                <xsl:when test="contains($Project, 'Design')">
                                    which can be used to obtain design documentation (see the Design Phase Documents thread), as well as to ask questions regarding the component design. Please post your questions at any time and a product manager will respond within 24 hours. Any questions asked within 6 hours of the submission due date/time may not be answered in time, so get your questions in early! 
                                    <p>The deadline for submitting a design is <xsl:value-of select="/TC/DEVELOPMENT/date"/> at 9:00 AM EST.  Please submit your design through the project's <a href="http://www.topcoder.com/?&amp;t=development&amp;c=comp_projects">TopCoder posting page</a>.  All late submissions will be ignored. Also, a reminder that this is a competition, and only the top 3 submissions will receive payment.</p>
                                </xsl:when>
                                <xsl:otherwise>
                                    which can be used to obtain the component design (See "Development Phase Documents" thread), as well as to ask questions regarding the development process or the component design. Please post your questions at any time and the component designer will respond within 24 hours. Any questions asked within 6 hours of the submission due date/time may not be answered, so get your questions in early!
                                    <p>The deadline for submitting a solution is <xsl:value-of select="/TC/DEVELOPMENT/date"/> at 9:00 AM EST.  Please submit your design through the project's <a href="http://www.topcoder.com/?&amp;t=development&amp;c=comp_projects">TopCoder posting page</a>.  All late submissions will be ignored. Also, a reminder that this is a competition, and only the top 3 submissions will receive payment.</p>
                                </xsl:otherwise>
                            </xsl:choose>

                        <p>If you have any questions please contact <a href="mailto:service@topcodersoftware.com">service@topcodersoftware.com</a></p>
                        
                        <p><br /></p>
                        
                    </td>
                 </tr>
            </table>
        </td>
<!-- Center Column Ends -->

<!-- Gutter begins -->
        <td width="6"><img src="/i/clear.gif" width="6" height="1" alt="" border="0" /></td>
<!-- Gutter Ends -->

<!-- Right Column Begins -->
        <td width="170">
            <xsl:call-template name="public_dev_right" />        
        </td>
<!-- Right Column Ends -->
    </tr>
</table>

<!-- Footer begins -->
        <xsl:call-template name="Foot" />
<!-- Footer ends -->

</body>
</html>
    </xsl:template>
</xsl:stylesheet>

