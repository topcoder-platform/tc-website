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

<title>TopCoder Announces Yahoo! as Title Sponsor for TCCC04</title>

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
                        <p><span class="bodyTitle">TopCoder Announces Yahoo! as Title Sponsor for Annual International Programming Tournament</span><br />
                        <span class="bodySubTitle"><em>Leading Global Internet Company Pairs with TopCoder to Determine Collegiate World Champions of Coding</em></span></p>
                        </div>
                        
                        <p><strong>GLASTONBURY, Conn., February 16, 2004&#151;</strong>
TopCoder, Inc., the leader in online programming competition, skills assessment and competitive software development, today announced Yahoo! Inc. as the title sponsor for the 2004 TopCoder Collegiate Challenge (TCCC). The 2004 TCCC will bring many of the world's finest student programmers together in competition for international ranking, notoriety and a share of the $100,000 prize purse for Algorithm, Component Design and Development categories. Details and rules are provided at:  <a href="/tccc04">http://www.topcoder.com/tccc04</a></p>

<p>"Yahoo! is proud to sponsor the TopCoder Collegiate Challenge and showcase the programmers and developers of tomorrow as they put their skills to the test," said Libby Sartain, Senior Vice President, Human Resources and Chief People Yahoo.  "Many of the participants in this event are as fun, innovative and talented as our own employees and we are excited to have the Yahoo! team on-site to meet the competitors and witness their considerable coding capabilities."</p>

<p>Beginning in February, eligible college students from around the world will compete in qualifying rounds of the 2004 TCCC. Contestants will have their choice of participating in either the Algorithm or Component competitions, or both should they be that skilled.  Through a series of online rounds, the field will be narrowed to 32 semifinalists, comprised of 24 Algorithm and 8 Component competitors. These semifinalists will then compete head-to-head over two days during the onsite finals at the Boston Park Plaza Hotel in Boston, Massachusetts on April 15th and 16th to determine the winners. In addition to an expanded semifinal field, the 2004 TCCC marks the first TopCoder tournament to have coaches. Coaches will provide competitors in the Component Design Competition with technical guidance and support during the competition. The Algorithm tournament will award up to 500 competitors with $40,000 in cash and other prizes. The Component tournament will award $60,000 in cash prizes, with $40,000 being awarded for the Design competition and $20,000 for the Development competition.</p>

<p>The $100,000 total prize purse will be distributed as follows:</p>

<ul>
<li>Algorithm and Design Champions will win $25,000 each, with the second, third and fourth place finalists taking $9,000, $4,000 and $2,000, respectively.</li>
<li>The Development Champion will win $15,000, with second, third and fourth place finalists earning $2,500, $1,500 and $1,000 in prize money. </li>
</ul>

<p>"TopCoder is dedicated to providing the frontline of competitive coding challenges to colleges and students across frontiers and beyond borders," said Rob Hughes, President of TopCoder.  "Yahoo!'s commitment to identifying and recognizing the next wave of programming excellence brings global prestige to our event as well as a new level of excitement and anticipation among our competitors."</p>

<p><span class="bodySubTitle">About TopCoder, Inc.</span><br />
TopCoder is the recognized leader in identifying, evaluating and mobilizing effective software development resources. Through its proprietary programming competitions and rating system, TopCoder recognizes and promotes the abilities of the best programmers around the world.  TopCoder Software harnesses the talent of these developers to design, develop and deploy software through its revolutionary competitive development methodology. TopCoder's methodology emphasizes thorough specification and design, distributed development using reusable components, and a rigorous quality assurance review process and results in higher quality, lower cost software solutions than traditional software development methodologies.  For more information about sponsoring TopCoder Events, recruiting TopCoder members and utilizing TopCoder Software, visit www.topcoder.com.</p>

<p>TopCoder is a trademark of TopCoder, Inc. in the United States and other countries</p>

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
