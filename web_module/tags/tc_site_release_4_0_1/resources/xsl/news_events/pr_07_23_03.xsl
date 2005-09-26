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

<title>Revelation Software to Sponsor 2003 TopCoder Open</title>

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
                        <p><span class="bodyTitle">Revelation Software to Sponsor 2003 TopCoder Open</span><br />
                        <span class="bodySubTitle"><em>Software Company to Gain Exposure to Top Programmers Worldwide</em></span></p>
                        </div>
                        
                        <p><strong>GLASTONBURY, Conn., July 23, 2003&#151;</strong>
                        TopCoder, Inc., the leader in on-line programming competition and skills assessment, today announced Revelation Software 
                        as a corporate sponsor for its 2003 TopCoder Open.  Revelation intends to gain critical awareness of their product offerings 
                        through sponsorship of this tournament.</p>

                        <p>The 2003 Open will begin online on October 7th and will culminate at the Mohegan Sun Casino in Connecticut on December 
                        4th and 5th.  This tournament will award a $100,000 prize purse, with $50,000 being awarded to the champion.</p>

                        <p>"By being associated with this tournament, Revelation will gain in-depth exposure to and contact with many of the best 
                        programmers in the world," said Jack Hughes, Chairman and Founder of TopCoder.  "In turn, TopCoder is excited to bring 
                        the message and products of this great, forward-thinking company to our membership that is nearly 30,000 strong."</p>

                        <p>"We are delighted to sponsor this event.  It's an opportunity for us to show our support for the developer community.  
                        Events like this one bring out the best solutions from the best developers, and those are the type of developers we want," 
                        said Mike Ruane, President and CEO of Revelation Software.</p>

                        <p><span class="bodySubTitle">About TopCoder, Inc.</span><br />
                        TopCoder, Inc. organizes and hosts online and onsite programming competitions for a global community of members.  TopCoder 
                        members extend across all professional and collegiate levels.  The attraction of competition and the associated rewards create 
                        a powerful community of programmers.  Corporate partners access this member base for employment, software development 
                        and sponsorship.  For registration details or information regarding TopCoder Software, TopCoder Employment Services or 
                        sponsorship of TopCoder Events, please visit www.topcoder.com.</p>

                        <p>Revelation Software Founded in 1982, Revelation Software delivers a suite of application development tools and companion 
                        services that take full advantage of leading network computing architectures, messaging, groupware, and client server platforms. 
                        Today, the company's flagship product OpenInsight for Workgroups is the only database development and application environment 
                        that provides both Windows and Java-based GUI s tools to develop and deploy web-based and client server applications that 
                        support native and relational XML, SQL, Lotus Notes and the leading legacy Multi-Value data sources such a ARev, Pick and IBM 
                        Universe. There are more than 1.5 million licensed users of Revelation products across 60,000 deployed sites worldwide. The 
                        company has offices in Westwood, New Jersey, as well as a European subsidiary in the United Kingdom, and an Asia Pacific 
                        subsidiary in Australia. </p>

                        <p>Note to editors: Revelation Software is a division of Revelation Technologies. Revelation Software, OpenInsight and JOI are 
                        trademarks of Revelation Technologies. All other trademarks and trade names are property of their respective holders.</p>

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
