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

<title>TopCoder Developing Application for CRPF Spinal Cord Injury Research Group</title>

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
                        <p><span class="bodyTitle">TopCoder&#174; Announces Finalists for 2004 TopCoder Open Sponsored by Microsoft&#174;</span><br />
                        <span class="bodySubTitle"><em>International Coding Elite From 12 Countries Will Compete for $150,000 Purse in Programming Championship</em></span></p>
                        </div>
                        
                        <p><strong>GLASTONBURY, Conn., November 1, 2004&#151;</strong>
TopCoder, Inc., the leader in online programming competition, skills assessment and competitive software development, today announced the 31 international finalists who have advanced to the Championship rounds of the 2004 TopCoder Open sponsored by Microsoft. This annual TopCoder tournament, the first such event sponsored by Microsoft, was open to all programmers worldwide and carries a prize purse of $150,000. The tournament's Semifinal and Championship Rounds will be held November 11th and 12th at the Marriott Hotel in Santa Clara, California. For more information visit: <A href="http://www.topcoder.com/tco04">http://www.topcoder.com/tco04</A>.
<br/><br/>
The semifinalists endured numerous online elimination rounds to earn a trip to the prestigious onsite finals, and will now compete head-to-head over two days of intense competition to determine the winners who will share the $150,000 prize purse. The Algorithm competition will award $50,000 in cash, with the Component Design and Development competition awarding $100,000 in total cash prizes. 
<br/><br/>
The 24 finalists in the Algorithm competition are:
<br/><br/>

<table width="500" align="center" border="0" cellpadding="6" cellspacing="2" class="sidebarBox">
<tr>
<td class="sidebarTitle" align="center" colspan="2">Algorithm Competitors</td>
</tr>
<tr>
<td class="sidebarText" width="50%">*Tomasz Czajka, West Lafayette, IN</td>
<td class="sidebarText" width="50%">*Reid Barton, Arlington, MA</td>
</tr>
<tr>
<td class="sidebarText">*Adrian Kuegel, Ulm, Germany</td>
<td class="sidebarText">*Ambrose Feinstein, Orlando, FL</td>
</tr>
<tr>
<td class="sidebarText">*Hubert Hwang, Boston, MA</td>
<td class="sidebarText">*Bogdan Stanescu, Rockville, MD</td>
</tr>
<tr>
<td class="sidebarText">*David Arthur, Stanford, CA</td>
<td class="sidebarText">Chuong Do, Stanford, CA</td>
</tr>
<tr>
<td class="sidebarText">David Vickrey, Menlo Park, CA</td>
<td class="sidebarText">Jared Showalter, Sarasota, FL</td>
</tr>
<tr>
<td class="sidebarText">*Steve Newman, Portola Valley, CA</td>
<td class="sidebarText">Georgios Papoutsis, Berlin, Germany</td>
</tr>
<tr>
<td class="sidebarText">*Oeyvind Grotmol, Trondheim, Norway</td>
<td class="sidebarText">*Zheng Shao, Urbana, IL</td>
</tr>
<tr>
<td class="sidebarText">Carl Nettleblad, V&#228;nge, Sweden</td>
<td class="sidebarText">*John Dethridge, Melbourne, Australia</td>
</tr>
<tr>
<td class="sidebarText">Sergio Sancho, Capital Federal, Argentina</td>
<td class="sidebarText">Tor Myklebust, Waterloo, Canada</td>
</tr>
<tr>
<td class="sidebarText">*Derek Kisman, Calgary, Canada</td>
<td class="sidebarText">Erik Bernhardsson, Solna, Sweden</td>
</tr>
<tr>
<td class="sidebarText">*Ralph Furmaniak, London, Canada</td>
<td class="sidebarText">Pawel Parys, Kalety, Poland</td>
</tr>
<tr>
<td class="sidebarText">Tomasz Idziaszek, Lomianki, Poland</td>
<td class="sidebarText">Grzegorz Lukasik, Wieliczka, Poland</td>
</tr>
<tr>
<td class="sidebarText" colspan="2">*Competitors who have previously participated in TopCoder tournament onsite rounds.</td>
</tr>
</table>

<br/><br/>
The 7 finalists in the Component Design and Development Tournaments are:
<br/><br/>

<table width="500" align="center" border="0" cellpadding="6" cellspacing="2" class="sidebarBox">
<tr>
<td class="sidebarTitle" width="50%" align="center">Design Competitors</td>
<td class="sidebarTitle" width="50%" align="center">Development Competitors</td>
</tr>
<tr>
<td class="sidebarText">*Adrian Carcu, Bistrita, Romania</td>
<td class="sidebarText">*Jin Guan Zhou, ZheJiang, China</td>
</tr>
<tr>
<td class="sidebarText">*Mihai Pasca, Bistrita, Romania</td>
<td class="sidebarText">Celsus Kintanar, Laguna, Philippines</td>
</tr>
<tr>
<td class="sidebarText">*Sergey Kalinichenko, San Francisco, CA</td>
<td class="sidebarText">Chip Bradford, Fairport, NY</td>
</tr>
<tr>
<td class="sidebarText">*Pavlo Aksonov, Kiev, Ukraine</td>
<td class="sidebarText">&#160;</td>
</tr>
<tr>
<td class="sidebarText" colspan="2">*Developers who have previously participated in TopCoder tournament onsite rounds.</td>
</tr>
</table>

<br/><br/>
The $150,000 total prize purse will be distributed as follows:
<br/><br/>
- Algorithm and Design Champions will win $20,000 each, with the second and third place finalists in each segment taking $10,000 and $5,000 respectively.
<br/><br/>
- The Development Champion will win $10,000, with second and third place finalists earning $4,000, and $2,500 in prize money respectively. 
<br/><br/>
"For our 46,000 members from around the world, TopCoder is the league where these top thinkers and technologists are in their element," said Rob Hughes, President and COO of TopCoder. "What better way to attract quality talent than to appeal to the competitive nature that lives within all of these outstanding contestants?"
<br/><br/>
<span class="bodySubtitle">About TopCoder, Inc.</span><br/>
TopCoder is the recognized leader in identifying, evaluating and mobilizing effective software development resources. Through its proprietary programming competitions and rating system, TopCoder recognizes and promotes the abilities of the best programmers around the world.  TopCoder Software harnesses the talent of these developers to design, develop and deploy software through its revolutionary competitive development methodology. TopCoder's methodology emphasizes thorough specification and design, distributed development using reusable components, and a rigorous quality assurance review process and results in higher quality, lower cost software solutions than traditional software development methodologies.  For more information about sponsoring TopCoder Events, recruiting TopCoder members and utilizing TopCoder Software, visit www.topcoder.com.
<br/><br/>
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
