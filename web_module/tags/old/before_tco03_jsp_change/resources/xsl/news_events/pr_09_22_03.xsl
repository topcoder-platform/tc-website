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

<title>NVIDIA Signs On To Sponsor 2003 TopCoder Open</title>

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
                        <p><span class="bodyTitle">NVIDIA Signs On To Sponsor 2003 TopCoder Open</span><br />
                        <span class="bodySubTitle"><em>Leader in Visual Processing Recruits Talent and Promotes Products via Programming Competition Sponsorship </em></span></p>
                        </div>
                        
                        <p><strong>GLASTONBURY, Conn., September 22, 2003&#151;</strong>
                        TopCoder, Inc., the leader in on-line programming competition, skills assessment and competitive software development, today announced NVIDIA as a premier sponsor for its 2003 TopCoder Open.  NVIDIA is seeking exceptional candidates for their open programming positions while continuing to increase exposure of the NVIDIA suite of graphics cards.</p>

                        <p>"We are thrilled to have NVIDIA return to sponsor a premier programming competition for students and professionals," said Jack Hughes, Chairman and Founder of TopCoder.  "As a recognized leader in graphics technology, one of the most demanding areas in all of computing, NVIDIA is a perfect match for the TopCoder community who represent many of the best and brightest software developers."</p>

                        <p>The 2003 Open will begin online on October 7th and will culminate at the Mohegan Sun Casino in Connecticut on December 4th and 5th.  This is the first tournament in which all professionals and university students are able to compete in the initial qualification rounds, and through the process of elimination, 16 final competitors will advance to the championship and compete against one another for their share of the $100,000 prize purse, with $50,000 being awarded to the champion.  Details are available at: <A href="/index?t=tournaments&amp;c=tco03_overview">http://www.topcoder.com/tco</A></p>

                         <p>"TopCoder has built a great community of top notch, competitive talent.  It's great when you see such a group of supportive folks really driving each other to excel.  We see a lot of synergy between the TopCoder community and our own here at NVIDIA.  We're delighted to be participating again, and I'm personally excited to see the college talent go toe to toe with the professionals.  It'll be a great match!" said Daniel Rohrer, Manager of Direct X Graphics at NVIDIA.</p>

                        <p>The 2003 Open is the second major TopCoder tournament sponsored by NVIDIA.  Earlier this year, NVIDIA was a premier sponsor of the TopCoder Collegiate Challenge held at MIT in April.</p>

                        <p><span class="bodySubTitle">About TopCoder, Inc.</span><br />
                        TopCoder, Inc. organizes and hosts online and onsite programming competitions for a global community of members.  TopCoder members extend across all professional and collegiate levels.  The attraction of competition and the associated rewards create a powerful community of programmers.  Corporate partners access this member base for employment, software development and sponsorship.  For registration details or information regarding TopCoder Software, TopCoder Employment Services or sponsorship of TopCoder Events, please visit <A href="/">www.topcoder.com.</A></p>

                        <p><span class="bodySubTitle">About Nvidia</span><br />
                        NVIDIA Corporation is a market leader in visual computing technology dedicated to creating products that enhance the interactive experience on consumer and professional computing platforms. Its graphics and communications processors have broad market reach and are incorporated into a wide variety of computing platforms, including consumer digital-media PCs, enterprise PCs, professional workstations, digital content creation systems, notebook PCs, military navigation systems and video game consoles. NVIDIA is headquartered in Santa Clara, California and employs more than 1,600 people worldwide. For more information, visit the Company's Web site at <A href ="http://www.nvidia.com">www.NVIDIA.com</A>.</p>

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
