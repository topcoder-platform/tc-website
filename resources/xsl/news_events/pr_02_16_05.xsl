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

<title>NVIDIA Corporation Returns as Premier Sponsor of 2005 TCCC</title>

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
                        <p><span class="bodyTitle">NVIDIA Corporation Returns as Premier Sponsor of 2005 TopCoder&#174; Collegiate Challenge</span><br />
                        <span class="bodySubTitle"><em>Worldwide Leader in Graphics and Digital Media Processors Continues Partnership with International Championship of Programming for College Students</em></span></p>
                        </div>
                        
                        <p><strong>GLASTONBURY, CT, February 16, 2005&#151;</strong>
                        TopCoder, Inc., the leader in online programming competition, skills assessment and competitive software development, today announced NVIDIA Corporation (Nasdaq: NVDA), a worldwide leader in graphics and digital media processors, as Premier sponsor of its 2005 TopCoder Collegiate Challenge (TCCC 05).  This will be the 3rd consecutive Collegiate Challenge sponsored by NVIDIA, which was among the first companies to partner with TopCoder and its powerful community of programmers. The TCCC 05 will bring many of the world's finest student programmers together in competition over the course of ten weeks for international ranking, notoriety and a share of the $150,000 prize purse for Algorithm, Component Design and Development categories. Details and rules are provided at: http://www.topcoder.com/tccc05.
                        <br /><br />
                        "NVIDIA recognizes that it takes amazing people to build great products," said Ben de Waal, VP of GPU Software, NVIDIA Corporation. "We are excited to return as Premier Sponsor of the TopCoder Collegiate Challenge and to interact with some of the sharpest developers in the world." 
                        <br /><br />
                        What began as an initial round with more than 1,300 coders jockeying for programming position, will culminate in an exciting face-to-face "code off" between 24 Algorithm and 8 Component competitors at the Santa Clara Marriott on March 10th and 11th, 2005.  
                        <br /><br />
                        "NVIDIA is a true technology visionary committed to advancing the state of the digital gaming and graphics industry to as yet only dreamed of levels," said Rob Hughes, president of TopCoder. "By participating in the TopCoder Collegiate Challenge, NVIDIA is able to interface with the software developers who will engineer the future." 
                        <br /><br />
                        <span class="bodySubtitle">About NVIDIA</span><br />
                        NVIDIA Corporation is a worldwide leader in graphics and digital media processors. The Company's products enhance the end-user experience on consumer and professional computing devices. NVIDIA graphics processing units (GPUs), media and communications processors (MCPs), and wireless media processors (WMPs) have broad market reach and are incorporated into a variety of platforms, including consumer and enterprise PCs, notebooks, workstations, PDAs, mobile phones, and video game consoles. NVIDIA is headquartered in Santa Clara, California and employs more than 2,000 people worldwide. For more information, visit the Company's Web site at www.nvidia.com.
                        <br /><br />
                        <span class="bodySubtitle">About TopCoder, Inc.</span><br />
                        TopCoder is the recognized leader in identifying, evaluating and mobilizing effective software development resources. Through its proprietary programming competitions and rating system, TopCoder recognizes and promotes the abilities of the best programmers around the world.  TopCoder Software harnesses the talent of these developers to design, develop and deploy software through its revolutionary competitive development methodology. TopCoder's methodology emphasizes thorough specification and design, distributed development using reusable components, and a rigorous quality assurance review process and results in higher quality, lower cost software solutions than traditional software development methodologies.  For more information about sponsoring TopCoder Events, recruiting TopCoder members and utilizing TopCoder Software, visit www.topcoder.com.
                        <br /><br />
                        TopCoder is a registered trademark of TopCoder, Inc. in the United States and other countries.
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
