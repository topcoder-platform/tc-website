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

<title>JavaOne Coding Challenge Powered by TopCoder</title>

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
                        <p><span class="bodyTitle">JAVAONE<sup>SM</sup> CODING CHALLENGE POWERED BY TOPCODER TO BE FEATURED AT JAVAONE, SUN'S 2004 WORLDWIDE JAVA DEVELOPER CONFERENCE<sup>SM</sup></span><br />
                        <span class="bodySubTitle"><em>One of Highest Rated 2003 JavaOne Conference Events Back for Second Consecutive Year</em></span></p>
                        </div>

<p><strong>GLASTONBURY, Conn., May 3, 2004&#151;</strong>
TopCoder, Inc., the leader in online programming competition, skills assessment and competitive software development, today announced that they are teaming up with Sun Microsystems, Inc. (Nasdaq: SUNW), the creator of Java(TM) technology, to showcase development skills at the ninth annual 2004 JavaOneSM conference, scheduled for June 28-July 1 in San Francisco. Sun and TopCoder will be bringing Java technology programmers together for coding, competition and fun. TopCoder Inc.'s versatile competitive coding platform will power the conference's popular JavaOne Coding Challenge, one of the highest-rated attendee events in 2003. The coding competition will provide attendees with an exciting and challenging experience along with a chance to win prizes. TopCoder will also be promoting the event among its global membership of more than 38,000 professional and student programmers. For more information on the JavaOne conference, visit <A href="http://java.sun.com/javaone/sf">http://java.sun.com/javaone/sf</A>.
<br/><br/>
"The TopCoder-powered Coding Challenge was one of the highest rated programs by our attendees last year," said Mike Bellisimo, Senior Director of Sun Developer Outreach. "It's an exciting and fun event that creates a buzz among our community and adds a new dimension of interaction and participation to the JavaOne Conference experience."
<br/><br/>
The competition will give Conference attendees a chance to apply what they learn during the Conference sessions to real-world programming problems. In the onsite Competition Arena, participants will be presented with real-world programming problems and will use the Java programming language to code, compile, test and submit solutions to the problem sets. The problems will focus on three major themes: Mobility, Enterprise Applications and Web Services.
<br/><br/>
Throughout each day, competitors' submissions will be objectively scored for accuracy and the time it took to complete the problem. At the conclusion of each day's Qualification Round, the four individuals who have achieved the highest scores will be invited back to compete head-to-head, where they will battle it out in the onsite Competition Arena. The Grand prize will include one complimentary full conference badge to the 2005 JavaOne conference valued at $1,995, a collection of 23 Java Series publications valued at $950 and a Zodiac(TM) Mobile Entertainment console and package from TapwaveSM   valued at $625. Additional prizes include gift certificates of $500 for 1st runners up, $250 for 2nd runners up and $125 for 3rd runners up daily. In addition, the first 1,000 contestants will receive one 2004 JavaOne Coding Challenge T-shirt and messenger bag. The daily winners will be shown on the JavaOne Coding Challenge Scoreboard throughout each day.
<br/><br/>
"The JavaOne Conference is one of the most anticipated events of the year for the Java Developer community and TopCoder is once again delighted to add our brand of dynamic competition to the event's program," said Rob Hughes, President of TopCoder, Inc.  "To win a coding competition such as this, at the world's Premier developer event, is an accomplishment worthy of industry-wide recognition."
</p>
<p><span class="bodySubTitle">About JavaOneSM, Sun's 2004 Worldwide Java Developer Conference<sup>SM</sup></span><br />
The JavaOneSM conference is the leading event for Java technology developers. Established in 1996, the Conference provides Java technology developers with access to the greatest minds and innovations in the Java technology development community. Attendees have a chance to network with other developers and get exposure to real-world solutions and the Java technology industry.
</p>
<p><span class="bodySubTitle">About TopCoder, Inc.</span><br />
TopCoder is the recognized leader in identifying, evaluating and mobilizing effective software development resources. Through its proprietary programming competitions and rating system, TopCoder recognizes and promotes the abilities of the best programmers around the world.  TopCoder Software harnesses the talent of these developers to design, develop and deploy software through its revolutionary competitive development methodology. TopCoder's methodology emphasizes thorough specification and design, distributed development using reusable components, and a rigorous quality assurance review process and results in higher quality, lower cost software solutions than traditional software development methodologies.  For more information about sponsoring TopCoder Events, recruiting TopCoder members and utilizing TopCoder Software, visit www.topcoder.com.
<br/><br/>
TopCoder is a registered trademark of TopCoder, Inc. in the United States and other countries
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
