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

<title>Champions Announced In 2005 TCCC Sponsored by Yahoo!&#174;</title>

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
                        <p><span class="bodyTitle">Champions Announced In 2005 TopCoder&#174; Collegiate Challenge Sponsored by Yahoo!&#174;</span><br />
                        <span class="bodySubTitle"><em>Top Algorithm and Component Tournament Winners Take Home Over $150,000 in Prizes</em></span></p>
                        </div>
                        
                        <p><strong>Santa Clara, CA, March 14, 2005&#151;</strong>
TopCoder, Inc., the leader in online programming competition, skills assessment and competitive software development, today announced that Mathijs Vogelzang of the University of Groningen, The Netherlands, Adrian Nicolae Carcu of  the Babes-Bolyai Computer Science University, Romania, and Gary Linscott of Queens University, Canada have won the Algorithm, Design and Development Component tournaments of the 2005 TopCoder Collegiate Challenge sponsored by Yahoo!, held at the Santa Clara Marriott in Santa Clara, CA on March 11th. Vogelzang, known to the member base by his handle 'mathijs',  beat 23 of the world's top computer programmers during the onsite semifinal and Championship rounds for the $20,000 grand prize in the Algorithm tournament. Carcu or 'adic' as he known to the member base and Linscott, known as 'gladius' took home $25,000 and $13,000 respectively as the Design and Development winners in the Component tournament. 
<br /><br />
The Algorithm tournament was a timed competition where the participants solved complex algorithmic problems using Java, .Net, C++ or C#.  The Component tournament was focused on software design and development where the participants in each tournament were provided general requirements and asked to design or develop re-useable software components.   
<br /><br />
At the start of the Algorithm tournament, mathijs was the 15th seed and the 17th ranked member among more than 52,000 TopCoder members worldwide. Mathijs submitted his easy solution first and that proved to the deciding question of the Championship round as he beat out second place finisher Tomasz Czajka of Purdue University, and second runner up Po-Ru Loh from the California Institute of Technology, United States and fourth place finalist Michal Forisek of Comenius University in the Slovak Republic. As a result of his victory mathijs is now the ninth ranked TopCoder algorithmist worldwide. The four finalists earned a spot at the event by besting almost 1,300 other programmers from around the world in simultaneous, online competitions.  
<br /><br />
"It was decided in the last minute," said Vogelzang. "I discovered a bug in my own program but apparently nobody saw it - including the problem writer. I hadn't expected to be in the finals and now I've actually won!" 
<br /><br />
Carcu and Linscott won hard fought contests against an elite field of international opponents. Carcu took top Design honors over Mihai Pasca from the Babes-Bolyai Computer Science University in Romania and Kyle Littlefield of the University of Washington, United States. 
<br /><br />
"The TopCoder members are extraordinary people and very intelligent," said an elated Carcu. "I would encourage developers everywhere to participate in this competition as they may discover they have a talent in software component design."
<br /><br />
Linscott won the Development title by besting opponents Xu Chuan, Zheng Zhang and Zhimin Chen from Zhejiang University, China. 
<br /><br />
"You need a lot of practice and speed in order to be successful - there is a heavy emphasis on doing things quickly and correctly," explained Linscott.
<br /><br />
"Yahoo! salutes each and every competitor who made this event such a great success," said Libby Sartain, Senior Vice President, Human Resources and Chief People Yahoo, "Their passion, creativity and ability to perform in a challenging arena is a great credit to them all."
<br /><br />
The Championship Round finalists of the Coding tournament were as follows:
</p>

<table width="500" align="center" border="0" cellpadding="6" cellspacing="2" class="sidebarBox">
<tr>
<td class="sidebarTitle" align="center" colspan="2">Algorithm Competitors</td>
</tr>
<tr class="sidebarText">
<td width="50%">Jan Kuipers, The Netherlands</td>
<td width="50%">*Tomasz Czajka, Poland</td>
</tr>
<tr class="sidebarText">
<td>Erik-Jan Krijgsman, The Netherlands</td>
<td>Luka Kalinovcic, Croatia</td>
</tr>
<tr class="sidebarText">
<td>Michal Forisek, Slovak Republic</td>
<td>Alexander Neubeck, Germany</td>
</tr>
<tr class="sidebarText">
<td>Hong Chen, USA</td>
<td>Ante Derek, USA</td>
</tr>
<tr class="sidebarText">
<td>Po-Ru Loh, USA</td>
<td>John Dethridge, Australia</td>
</tr>
<tr class="sidebarText">
<td>Robin Nittka, Germany</td>
<td>Marian Dvorsky, Slovak Republic</td>
</tr>
<tr class="sidebarText">
<td>Adrian Kuegel, Germany</td>
<td>Rune Fevang, Norway</td>
</tr>
<tr class="sidebarText">
<td>Xin Qi, USA</td>
<td>Tomasz Idziaszek, Poland</td>
</tr>
<tr class="sidebarText">
<td>Zheng Shao, USA</td>
<td>Eryk Kopczynski, Poland</td>
</tr>
<tr class="sidebarText">
<td>Mathijs Vogelzang, The Netherlands</td>
<td>Georgios Papoutsis, Germany</td>
</tr>
<tr class="sidebarText">
<td>Adam D'Angelo, USA</td>
<td>David Vickrey, USA</td>
</tr>
<tr class="sidebarText">
<td>Marcin Michalski, Poland</td>
<td>Ralph Furmaniak, Canada</td>
</tr>
</table>

<p>The finalists in the Design and Development Component tournament were as follows:</p>

<table width="500" align="center" border="0" cellpadding="6" cellspacing="2" class="sidebarBox">
<tr>
<td class="sidebarTitle" width="50%" align="center">Design Competitors</td>
<td class="sidebarTitle" width="50%" align="center">Development Competitors</td>
</tr>
<tr class="sidebarText">
<td>*Adrian Carcu, Romania</td>
<td>Zheng Zhang, China</td>
</tr>
<tr class="sidebarText">
<td>*Mihai Pasca, Romania</td>
<td>Xu Chuan, China</td>
</tr>
<tr class="sidebarText">
<td>Kyle Littlefield, USA</td>
<td>*Gary Linscott, Canada</td>
</tr>
<tr class="sidebarText">
<td>&#160;</td>
<td>Zhimin Chen, China</td>
</tr>
</table>

<p>
The results of TopCoder's major tournaments, weekly competitions and component development projects create a global database of objectively rated and talent-differentiated student and professional programmers.  
<br /><br />
"Our congratulations go out to mathijs, adic and gladius - true TopCoder Champions," said Rob Hughes, President and COO of TopCoder.  "We would also like to thank our sponsors -Yahoo, Motorola and NVIDIA for their vision and support as we celebrate and reward top programming talent worldwide."
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
