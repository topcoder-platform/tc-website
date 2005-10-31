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
                        <p><span class="bodyTitle">Program for life</span><br/>
                        <span class="bodySubTitle"><em>By Pawel Gorecki<br />NewsWeek Poland</em></span></p>
                        </div>

<p>
They get their Ph.D.'s at the age of twenty. At thirty they become
professors in America. Warsaw University graduates are some of the best computer scientists in the world.
<br /><br />
There are millions of computers and millions of computer programmers
at hundreds of different colleges, but only at a select few places in the
world is our future being programmed. Three of them - Massachusetts
Institute of Technology, Stanford University and the California Institute
of Technology - are a surprise to no one. But hardly anyone knows that
the list of the best also includes Warsaw University. This year,
Warsaw's Faculty of Informatics has a good chances to overtake the US
computer science giants. For sure, not by the number of students and
not with the scale of facilities, but by the scientific ability of its best graduates.
<br /><br />
The most prestigious competitions are organized by the computer science
portal TopCoder and by the Association for Computing Machinery (ACM). For
programmers, TopCoder tourneys are like the soccer World Cup. Each of the
few thousand competitors has four elimination rounds to get through. Every
week programmers from Sydney to Vladivostok solve problems over the
Internet. However the most important are the finals, to which the best
contestants go in person. A victory means $25,000 in prize
money and job offers from the best colleges and companies. The other
programming tournament, organized by the ACM, recognizes teams of
programmers. In both, for the last few years Poles are amongst the top
players. Moreover - in the rank list prepared by TopCoder, Warsaw
University was classified amongst the top five of the best computer
science departments in the world. In January CNN, an American news
channel, announced the high rank of the Polish university. In March the
next finals are going to be held in Santa Clara. Where are such successes
coming from in a country in which hard science drags its feet,
universities do not have money for heating and students can't afford books?
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
