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

<title>NVIDIA Sponsors 2004 TopCoder Collegiate Challenge</title>

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
                        <p><span class="bodyTitle">NVIDIA Sponsors 2004 TopCoder Collegiate Challenge</span><br />
                        <span class="bodySubTitle"><em>Visual Computing Technology Leader Continues Sponsorship with World Championship Scheduled for April 16th in Boston</em></span></p>
                        </div>
                        
                        <p><strong>GLASTONBURY, Conn., March 8, 2004&#151;</strong>
TopCoder, Inc., the leader in online programming competition, skills assessment and competitive software development, today announced NVIDIA Corporation (Nasdaq: NVDA), the worldwide leader in visual processing solutions, as a premier sponsor for its 2004 TopCoder Collegiate Challenge (TCCC 04).  The TCCC 04 will bring many of the world's finest student programmers together in competition for international ranking, notoriety and a share of the $100,000 prize purse for Algorithm, Component Design and Development categories. Details and rules are provided at: http://www.topcoder.com/tccc04.</p>

<p>"NVIDIA truly believes that the TopCoder arena fosters an unparalleled competitive spirit among the most brilliant programmers in the world.  We are proud to be a part of this initiative again," said Daniel Rohrer, Manager of DirectX Graphics.  "Our corporate culture encourages innovation and excellence and the TopCoder competition model is a perfect complement to that philosophy."</p>

<p>Beginning in February, more than 1,000 eligible college students from around the world began competing in qualifying rounds of the TCCC 04. Through a series of online rounds, this field will be narrowed to 32 final competitors by March 22nd, comprised of 24 Algorithm and 8 Component competitors. These finalists will compete in a face to face competition at the Boston Park Plaza Hotel in Boston on April 15th and 16th to determine the winners of both competitions.</p>

<p>The TCCC 04 is the third major TopCoder tournament sponsored by NVIDIA.  Last spring, NVIDIA sponsored the TCCC 03 held at MIT and subsequently became a premier sponsor for the 2003 TopCoder Open which took place last December at the Mohegan Sun Casino, Connecticut.</p>

<p>"We are very pleased to have NVIDIA as a repeat sponsor for our competition," said Rob Hughes, President of TopCoder. "NVIDIA correctly recognizes that the TopCoder Collegiate Challenge attracts elite coding 'athletes' from around the globe and provides a unique opportunity for recruiting the best new draftees for their own development teams."</p>

<p><span class="bodySubTitle">About NVIDIA</span><br />
NVIDIA Corporation is a market leader in visual computing technology dedicated to creating products that enhance the interactive experience on consumer and professional computing platforms. Its graphics and communications processors have broad market reach and are incorporated into a wide variety of computing platforms, including consumer digital-media PCs, enterprise PCs, professional workstations, digital content creation systems, notebook PCs, military navigation systems and video game consoles. NVIDIA is headquartered in Santa Clara, California and employs more than 1,800 people worldwide.  For more information, visit the Company's Web site at www.nvidia.com.</p>

<p><span class="bodySubTitle">About TopCoder, Inc.</span><br />
TopCoder is the recognized leader in identifying, evaluating and mobilizing effective software development resources. Through its proprietary programming competitions and rating system, TopCoder recognizes and promotes the abilities of the best programmers around the world.  TopCoder Software harnesses the talent of these developers to design, develop and deploy software through its revolutionary competitive development methodology. TopCoder's methodology emphasizes thorough specification and design, distributed development using reusable components, and a rigorous quality assurance review process and results in higher quality, lower cost software solutions than traditional software development methodologies.  For more information about sponsoring TopCoder Events, recruiting TopCoder members and utilizing TopCoder Software, visit www.topcoder.com.</p>

<p>TopCoder is a trademark of TopCoder, Inc. in the United States and other countries.</p>

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
