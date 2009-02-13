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

<title>Press Room</title>

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
                <xsl:with-param name="title">&#160;</xsl:with-param>
            </xsl:call-template>
            
            <table border="0" cellspacing="0" cellpadding="10" width="100%">
                <tr valign="top">
                    <td class="prText" width="100%"><img src="/i/clear.gif" alt="" width="400" height="1" border="0"/><br />
                        <div align="center">
                        <p><span class="bodyTitle">Better than You: King of code</span></p>
                        </div>

						<p>
						Poland's Tomek Czajka has programmed his way to glory, and $75,000 in winnings. So we had to ask: Star Wars, or Lord of the Rings?
						<br/><br/>
						Known in his competitive coding circles by first name only, Tomek Czajka is one of the world's best programmers. He's earned over $75,000 in algorithm-writing contests over the last few years on TopCoder, the Top Gun of programming competition sites. In addition to fortune and fame in the developer community, TopCoder winners are often recruited by event sponsors like Microsoft, Yahoo, and Google. Tomek is ranked #2 on the site he'd be #1 if he hadn't taken a break during the last few months, which caused a slight dip in his ranking.  A recent graduate of Warsaw University, Tomek is on his way to Purdue University to begin a Ph.D. program in computer science.
						<br/><br/>
						Who: Tomek Czajka<br/>
						What: TopCoder, soon-to-be graduate student in computer science<br/>
						Where: Purdue University<br/>
						Age: 23
						<br/><br/>
						<b>Who do you live with?</b><br/>
						A university friend Piotrek now, my girlfriend Ela for the first two months at Purdue.
						<br/><br/>
						<b>How much TopCoder money have you won?</b><br/>
						$75,175
						<br/><br/>
						<b>Where does all that money go?</b><br/>
						To a bank in New York; I will start spending when I move to Purdue.
						<br/><br/>
						<b>How many TopCoder contests have you won?</b><br/>
						Two major contests (TopCoder Open 2003, TopCoder Collegiate Challenge 2004) and eight weekly single-round matches
						<br/><br/>
						<b>What would you be doing if you weren't a programmer?</b><br/>
						Math
						<br/><br/>
						<b>What kind of research will you be doing?</b><br/>
						Paper and pencil computer science - algorithmics, computability theory, logic, etc.
						<br/><br/>
						<b>Song you would/always pick to sing at karaoke:</b><br/>
						Whiskey by Dzem
						<br/><br/>
						<b>The innovation you wish you'd come up with:</b><br/>
						Automatic Theorem Prover 2008
						<br/><br/>
						<b><i>Star Wars</i> or <i>Lord of the Rings</i>?</b><br/>
						Lord of the Rings
						<br/><br/>
						<b>Biggest career or academic setback:</b><br/>
						Setback? Can't remember.
						<br/><br/>
						<b>Favorite algorithm:</b><br/>
						Integer sorting in expected O(n log log n) time by Andersson, Hagerup, Nilsson, and Raman in 1995. There are faster ones known today, but that one is lovely.
						<br/><br/>
						<b>What is the Next Big Thing?</b><br/>
						A programming language that is 10 times easier on the details side
						<br/><br/>
						<b>Favorite geek word:</b><br/>
						I will be taking an Intensive English Training next week.
						<br/><br/>
						<b>Favorite pastime during boring classes:</b><br/>
						Games of paper soccer
						<br/><br/>
						<b>Food items in top desk drawer:</b><br/>
						Mars bars
						<br/><br/>
						<b>Little thing you do every day that is the secret of your success:</b><br/>
						Sleep a lot
						<br/><br/>
						Better than You is Red Herring's series of Q&amp;As with young VCs, entrepreneurs, geeks, and other industry upstarts. Email comments and suggestions to rblitstein@redherring.com.
						</p>

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
