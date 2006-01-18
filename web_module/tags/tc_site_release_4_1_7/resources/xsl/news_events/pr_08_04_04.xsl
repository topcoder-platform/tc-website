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

<title>NVIDIA Named Sponsor of 2004 TCO</title>

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
                        <p><span class="bodyTitle">NVIDIA Named Premier Level Sponsor of 2004 TopCoder Open Tournament</span><br />
                        <span class="bodySubTitle"><em>Graphics and Communications Processors Leader Joins Elite Group of Sponsors for Top Programming Event</em></span></p>
                        </div>
                        
                        <p><strong>GLASTONBURY, Conn., August 04, 2004&#151;</strong>
TopCoder, Inc., the leader in online programming competition, skills assessment and competitive software development, today announced that NVIDIA Corporation (Nasdaq: NVDA) has been named as a premier level sponsor for the 2004 TopCoder Open. This year's TopCoder Open will bring the world's finest professional and collegiate programmers together in competition for international ranking, celebrity and a share of the $150,000 prize purse for Algorithm, Component Design and Development categories. The Onsite Finals will take place November 11th and 12th at the Santa Clara Marriott in Santa Clara, CA. Full registration details and rules are provided at:  http://www.topcoder.com/tco04
<br/><br/>
"We are thrilled to be a part of this exciting coding competition for the 3rd consecutive year," said Daniel Rohrer, Manager of DirectX Graphics. "The characteristics that allow TopCoder competitors to be successful closely mirror qualities we look for in our engineers at NVIDIA - a drive to win, a razor-sharp mind, and a competitive spirit. We look forward to welcoming TopCoder's finalists to Silicon Valley in November, as well as seeing who prevails among the elite professional and university coders."
<br/><br/>
The initial online qualification rounds will begin September 7th and continue through September 29th, with the top 32 competitors advancing to the onsite finals. Contestants can compete in the Algorithm or Component competitions, or both. 
<br/><br/>
Cash prizes for the 2004 TopCoder Open will comprise $100,000 for the component contest and $50,000 for the algorithm contest for an overall prize purse worth $150,000. "As an ongoing sponsor, NVIDIA shows their commitment to building long term and valuable relationships with a community of top notch developers," said Rob Hughes, President and COO of TopCoder. "NVIDIA recognizes that being the market leader in visual computing technology means consistently attracting highly skilled developers from around the world - and the TopCoder Open attracts the brightest and the best." 
<br/><br/>
<span class="bodySubTitle">About NVIDIA</span><br />
NVIDIA Corporation is a market leader in visual computing technology dedicated to creating products that enhance the interactive experience on consumer and professional computing platforms. Its graphics and communications processors have broad market reach and are incorporated into a wide variety of computing platforms, including consumer PCs, enterprise PCs, notebook PCs, professional workstations, handhelds, and video game consoles. NVIDIA is headquartered in Santa Clara, California and employs more than 1,900 people worldwide.  For more information, visit the Company's Web site at www.nvidia.com.
<br/><br/>
<span class="bodySubTitle">About TopCoder, Inc.</span><br />
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
