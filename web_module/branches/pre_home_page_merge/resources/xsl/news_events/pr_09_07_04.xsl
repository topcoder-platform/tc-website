<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:import href="../top.xsl"/>
  <xsl:import href="../script.xsl"/>
  <xsl:import href="../includes/body_top.xsl"/>  
  <xsl:import href="../foot.xsl"/>
  <xsl:import href="../includes/modules/practice_room.xsl"/>
  <xsl:import href="../includes/modules/calendar.xsl"/>
  <xsl:import href="../includes/global_left.xsl"/>
  <xsl:import href="../includes/pr_right_col.xsl"/>     
  <xsl:output indent="no" method="html" doctype-public="-//W3C//DTD HTML 4.0 Transitional//EN"/>
  <xsl:template match="/">

<html>

<head>

<xsl:call-template name="Preload"/>      

<title>Michael Morris to Speak at 2004 SDBP Conference</title>

<xsl:call-template name="CSS"/>      

<meta name="description" content="TopCoder is a programming tournament site. All members who compete attain a rating that provides a metric for coding competence and potential. These ratings, coupled with tournament performance, can lead to monetary rewards and employment opportunities."/>
<meta name="keywords" content="Computer Jobs, Programming, Programming Jobs, Programming Contest, Programming Competition, Online Games, Coding, Information Technology Jobs, Java, C++"/>

</head>

<body>

<!-- Header begins -->
<xsl:call-template name="Top"/>
<!-- Header ends -->

<table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr valign="top">
<!-- Left Column Begins -->
        <td width="180" valign="top">
            <xsl:call-template name="global_left"/>
        </td>
<!-- Left Column Ends -->

<!-- Gutter Begins -->
        <td width="4"><img src="/i/table_top_fill.gif" width="4" height="26" border="0"/></td>
<!-- Gutter Ends -->

<!-- Center Column Begins -->	
        <td class="bodyText" width="99%">
            <xsl:call-template name="BodyTop">
                <xsl:with-param name="image1">white</xsl:with-param>
                <xsl:with-param name="image">press_room</xsl:with-param>
                <xsl:with-param name="title">&#160;Press Release</xsl:with-param>
            </xsl:call-template>
            
            <table border="0" cellspacing="0" cellpadding="10" width="100%">
                <tr valign="top">
                    <td class="prText" width="100%"><img src="/i/clear.gif" alt="" width="400" height="1" border="0"/><br />
                        <div align="center">
                        <p><span class="bodyTitle">TopCoder Software Industry Expert Michael Morris to Speak at 2004 SD Best Practices Conference</span><br />
                        <span class="bodySubTitle"><em>VP of Software Development to Discuss Competition Based Software Methodology</em></span></p>
                        </div>
                        
                        <p><strong>GLASTONBURY, Conn., September 7, 2004&#151;</strong>
						TopCoder, Inc., the leader in online programming competition, skills assessment and competitive software development, today announced that Michael Morris, vice president of software development, will be speaking at the Software Development Best Practices Conference and Expo at the Hynes Convention Center in Boston, MA September 20-23rd. Produced by CMP Media's SD Events group, the SD Best Practices Conference and Expo gives software management professionals an expansive range of topics that focus on boosting efficiency, streamlining infrastructure and producing successful project outcomes to enhance the quality of software production.  
						<br/><br/>
						In the presentation titled "Competition Based Software Methodology" Morris will examine how organizations can obtain incredible results by implementing a development methodology that requires developers to compete against each other in a highly disciplined environment. The advanced level process &amp; methods session will take place Wednesday, September 22 at 3:45 pm.
						<br/><br/>
						Joining TopCoder Software in 2002 as the Vice President of Software Development, Michael P. Morris brings a decade of technology experience, across vertical markets, to drive the company's technology vision, product development and virtual project teams.  Morris' commitment to the proper design and development of software applications has elevated him to "guru" status among programmers, managers and chief technology officers alike.  His specialties - Component Based Development and Web services - have earned him published articles, industry recognition and speaking engagements at acclaimed institutions, such as Java One and Harvard University. Formerly, Morris was the director of design and development for the northern California region of Tallan, a custom software development and consulting company.  
						<br/><br/>
						<span class="bodySubtitle">About TopCoder, Inc.</span><br/>
						TopCoder is the recognized leader in identifying, evaluating and mobilizing effective software development resources. Through its proprietary programming competitions and rating system, TopCoder recognizes and promotes the abilities of the best programmers around the world.  TopCoder Software harnesses the talent of these developers to design, develop and deploy software through its revolutionary competitive development methodology. TopCoder's methodology emphasizes thorough specification and design, distributed development using reusable components, and a rigorous quality assurance review process and results in higher quality, lower cost software solutions than traditional software development methodologies.  For more information about sponsoring TopCoder Events, recruiting TopCoder members and utilizing TopCoder Software, visit www.topcoder.com.
						<br/><br/>
						TopCoder is a trademark of TopCoder, Inc. in the United States and other countries. All other product and company names herein may be trademarks of their respective owners.
						</p>
                        <p>###</p>
                        <p><br /></p>
                        

                    </td>
                </tr>
            </table>
        </td>
<!-- Center Column Ends -->

<!-- Gutter -->
        <td width="4"><img src="/i/clear.gif" width="4" height="1" border="0"/></td>
<!-- Gutter Ends -->

<!-- Right Column Begins -->
        <td width="170" valign="top"><img src="/i/clear.gif" width="170" height="1" border="0"/><br/>
            <xsl:call-template name="pr_right_col"/>       
        </td>
<!-- Right Column Ends -->

<!-- Gutter -->
        <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"/></td>
<!-- Gutter Ends -->
    </tr>
</table>

<!-- Footer begins -->
<xsl:call-template name="Foot"/>
<!-- Footer ends -->

</body>

</html>

  </xsl:template>
</xsl:stylesheet>
