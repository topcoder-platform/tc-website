<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:import href="../top.xsl"/>
  <xsl:import href="../script.xsl"/>
  <xsl:import href="../includes/body_top.xsl"/>
  <xsl:import href="../foot.xsl"/>
  <xsl:import href="../includes/modules/practice_room.xsl"/>
  <xsl:import href="../includes/modules/calendar.xsl"/>
  <xsl:import href="../includes/modules/tccc03_links.xsl"/>
  <xsl:import href="../includes/global_left.xsl"/>
  <xsl:import href="../includes/public_right_col.xsl"/>
  <xsl:output indent="no" method="html" doctype-public="-//W3C//DTD HTML 4.0 Transitional//EN"/>
  <xsl:template match="/">

<html>
<head>

<xsl:call-template name="Preload"/>

<title>TopCoder | Tournaments</title>

<xsl:call-template name="CSS"/>

<meta name="description" content="TopCoder is a programming tournament site. All members who compete attain a rating that provides a metric for coding competence and potential. These ratings, coupled with tournament performance, can lead to monetary rewards and employment opportunities."/>
<meta name="keywords" content="Computer Jobs, Programming, Programming Jobs, Programming Contest, Programming Competition, Online Games, Coding, Information Technology Jobs, Java, C++"/>

</head>

<body>

<a name="top_page"></a>

<xsl:variable name="contestId">
    <xsl:value-of select="/TC/SCHEDULE/ContestId"/>
</xsl:variable>

<!-- Top Begins -->
<xsl:call-template name="Top"/>
<!-- Top Ends -->

<table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr valign="top">

<!-- Left Column Begins -->
        <td width="180">
              <xsl:call-template name="global_left"/>
        </td>
<!-- Left Column Ends -->

<!-- Gutter Begins -->
        <td width="6"><img src="/i/clear.gif" width="6" height="1" border="0"/></td>
<!-- Gutter Ends -->

<!-- Center Column Begins -->
        <td class="bodyText" width="100%">
            <xsl:call-template name="BodyTop">
                <xsl:with-param name="image1">steelgray</xsl:with-param>
                <xsl:with-param name="image">tournaments_gray</xsl:with-param>
                <xsl:with-param name="title">2003 TopCoder Collegiate Challenge</xsl:with-param>
            </xsl:call-template>

            <xsl:call-template name="tccc03_links">
                <xsl:with-param name="selectedTab">schools</xsl:with-param>
            </xsl:call-template>

            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr>
                    <td width="100%" class="tourney_subnav"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                </tr>
            </table>

            <table border="0" cellspacing="0" cellpadding="0" class="tourney_bkgd" width="100%">
                <tr valign="top">
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0"/></td>
                    <td width="100%"><img src="/i/clear.gif" alt="" width="240" height="10" border="0"/><br/>
                        <table width="100%" border="0" cellpadding="3" cellspacing="1">
                            <tr><td colspan="4" class="statText"><strong>Schools Represented</strong><br /><br /></td></tr>

                        <tr>
                            <td width="25%" align="center" class="tourney_subhead1">Northeast</td>
                            <td width="25%" align="center" class="tourney_subhead1">Southeast</td>
                            <td width="25%" align="center" class="tourney_subhead1">West</td>
                            <td width="25%" align="center" class="tourney_subhead1">Midwest</td>
                        </tr>

                        <tr valign="top">
                            <td width="25%" align="left" class="statText">
                            Massachusetts Institute of Technology (25)<br />
                            Cornell University (10)<br />
                            Carnegie Mellon University (9)<br />
                            Virginia Polytechnic Institute State University (9)<br />
                            Binghamton University SUNY (8)<br />
                            Rochester Institute of Technology (8)<br />
                            Princeton University (6)<br />
                            University of Maryland College Park (6)<br />
                            University of Virginia (6)<br />
                            George Mason University (5)<br />
                            Old Dominion University (5)<br />
                            Stony Brook SUNY (5)<br />
                            University of Massachusetts Amherst (5)<br />
                            Rutgers University (4)<br />
                            Stevens Institute of Technology (4)<br />
                            Ohio State University (3)<br />
                            Syracuse University (3)<br />
                            Boston University (2)<br />
                            Columbia University (2)<br />
                            Lafayette College (2)<br />
                            Messiah College (2)<br />
                            Northeastern University (2)<br />
                            Oberlin College (2)<br />
                            Pennsylvania State University (2)<br />
                            Rensselaer Polytechnic Institute (2)<br />
                            The College of New Jersey (2)<br />
                            University at Albany SUNY (2)<br />
                            University of Connecticut (2)<br />
                            University of Massachusetts Dartmouth (2)<br />
                            University of Pennsylvania (2)<br />
                            Worcester Polytechnic Institute (2)<br />
                            Amherst College (1)<br />
                            Case Western Reserve University (1)<br />
                            Cedarville College (1)<br />
                            City College (1)<br />
                            Cleveland State University (1)<br />
                            Dartmouth College (1)<br />
                            Denison University (1)<br />
                            Drexel University (1)<br />
                            Geneseo SUNY (1)<br />
                            George Washington University (1)<br />
                            Hobart and William Smith Colleges (1)<br />
                            Kings College (1)<br />
                            Liberty University (1)<br />
                            Pace University (1)<br />
                            Queens College (1)<br />
                            Springfield Technical Community College (1)<br />
                            United States Military Academy (1)<br />
                            University at Buffalo SUNY (1)<br />
                            University of Akron (1)<br />
                            University of Cincinnati (1)<br />
                            University of Massachusetts Boston (1)<br />
                            University of Pittsburgh (1)<br />
                            University of Rochester (1)<br />
                            Yale University (1)<br />
                            Yeshiva University (1)<br />
                            </td>

                            <td width="25%" align="left" class="statText">
                            Georgia Institute of Technology (13)<br />
                            Duke University (9)<br />
                            University of Florida (7)<br />
                            Florida Institute of Technology (6)<br />
                            University of Central Florida (5)<br />
                            University of Kentucky (5)<br />
                            Armstrong Atlantic State University (3)<br />
                            Florida State University (3)<br />
                            Clemson University (2)<br />
                            Middle Tennessee State University (2)<br />
                            Western Kentucky University (2)<br />
                            College of Charleston (1)<br />
                            Embry-Riddle Aeronautical University (1)<br />
                            Florida International University (1)<br />
                            Francis Marion University (1)<br />
                            Georgia State University (1)<br />
                            Jacksonville State University (1)<br />
                            Johnson &amp; Wales University-Charleston (1)<br />
                            University of North Carolina Chapel Hill (1)<br />
                            University of North Carolina Charlotte (1)<br />
                            University of South Carolina Columbia (1)<br />
                            University of South Florida (1)<br />
                            University of Tennessee Knoxville (1)<br />
                            University of West Florida (1)<br />
                            Valdosta State University (1)<br />
                            Vanderbilt University (1)<br />
                            </td>
                            
                            <td width="25%" align="left" class="statText">
                            University of Texas Austin (13)<br />
                            Stanford University (12)<br />
                            California Institute of Technology (9)<br />
                            University of California Berkeley (8)<br />
                            University of California Los Angeles (8)<br />
                            University of Utah (7)<br />
                            University of California Irvine (5)<br />
                            De Anza College (3)<br />
                            Eastern Washington University (3)<br />
                            University of California Davis (3)<br />
                            University of California San Diego (3)<br />
                            Arizona State University (2)<br />
                            Brigham Young University (2)<br />
                            Oregon State University (2)<br />
                            San Jose State University (2)<br />
                            Texas A&amp;M University College Station (2)<br />
                            Texas Tech University (2)<br />
                            University of California Santa Barbara (2)<br />
                            University of Colorado Boulder (2)<br />
                            University of Houston Main Campus (2)<br />
                            University of North Texas (2)<br />
                            Utah State University (2)<br />
                            Baylor College of Medicine (1)<br />
                            Brigham Young University Hawaii (1)<br />
                            California State Polytechnic San Luis Obispo (1)<br />
                            California State Polytechnic University, Pomona (1)<br />
                            California State University Chico (1)<br />
                            California State University Long Beach (1)<br />
                            California State University Sacramento (1)<br />
                            Harvey Mudd College (1)<br />
                            Kansas State University (1)<br />
                            Oklahoma Christian University of Science &amp; Arts (1)<br />
                            Oklahoma State University (1)<br />
                            Rice University (1)<br />
                            University of California Santa Cruz (1)<br />
                            University of Idaho (1)<br />
                            University of Texas Arlington (1)<br />
                            University of Texas Dallas (1)<br />
                            Wichita State University (1)<br />
                            </td>
                            
                            <td width="25%" align="left" class="statText">
                            University of Michigan Ann Arbor (16)<br />
                            Purdue University System (6)<br />
                            University of Illinois Urbana-Champaign (6)<br />
                            University of Wisconsin Madison (6)<br />
                            University of Minnesota Twin Cities (5)<br />
                            University of Nebraska Lincoln (4)<br />
                            Illinois Institute of Technology (3)<br />
                            University of Arkansas Fayetteville (3)<br />
                            University of Wisconsin Milwaukee (3)<br />
                            Western Illinois University (3)<br />
                            Indiana University (2)<br />
                            Iowa State University (2)<br />
                            Michigan State University (2)<br />
                            Milwaukee School of Engineering (2)<br />
                            Saginaw Valley State University (2)<br />
                            University of Illinois Chicago (2)<br />
                            University of Missouri Columbia (2)<br />
                            Western Michigan University (2)<br />
                            Arkansas Tech University (1)<br />
                            DePaul University (1)<br />
                            DePauw University (1)<br />
                            Grinnell College (1)<br />
                            Harding University (1)<br />
                            Knox College (1)<br />
                            Lake Forest College (1)<br />
                            Louisiana Tech University (1)<br />
                            Loyola University Chicago (1)<br />
                            Luther College (1)<br />
                            Michigan Technological University (1)<br />
                            Missouri Western State College (1)<br />
                            Northern Michigan University (1)<br />
                            Northwestern University (1)<br />
                            Ouachita Baptist University (1)<br />
                            Rose-Hulman Institute of Technology (1)<br />
                            Trinity Christian College (1)<br />
                            University of Arkansas Little Rock (1)<br />
                            University of Chicago (1)<br />
                            University of Louisiana Lafayette (1)<br />
                            University of Michigan Dearborn (1)<br />
                            University of Minnesota Duluth (1)<br />
                            University of Missouri Rolla (1)<br />
                            University of Missouri Saint Louis (1)<br />
                            University of Wisconsin Eau Claire (1)<br />
                            University of Wisconsin Parkside (1)<br />
                            </td>
                        </tr>

                            <tr><td colspan="4"><img src="/i/clear.gif" alt="" width="1" height="5" border="0"/></td></tr>

                            <tr><td colspan="4" align="center" class="tourney_subhead1">International</td></tr>

                            <tr valign="top">
                                <td colspan="2" class="statText">
                            Canada (40)<br />
                            China (14)<br />
                            Australia (12)<br />
                            India (10)<br />
                            Norway (7)<br />
                            United Kingdom (7)<br />
                            Germany (6)<br />
                            Romania (6)<br />
                            Russian Federation (6)<br />
                            Sweden (5)<br />
                            Malaysia (3)<br />
                            Croatia (2)<br />
                                </td>

                                <td colspan="2" class="statText">
                            Hungary (2)<br />
                            Poland (2)<br />
                            South Africa (2)<br />
                            Colombia (1)<br />
                            Czech Republic (1)<br />
                            France (1)<br />
                            Iran (1)<br />
                            Ireland (1)<br />
                            Israel (1)<br />
                            Mexico (1)<br />
                            Portugal (1)<br />
                            Ukraine (1)<br />
                                </td>
                            </tr>

                            <tr><td colspan="4"><img src="/i/clear.gif" alt="" width="1" height="10" border="0"/></td></tr>
                    </table>
                        <p><br/></p>
                    </td>
                    <td valign="top" width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0"/></td>
                </tr>
            </table>
        </td>
<!-- Center Column Ends -->

<!-- Gutter Begins -->
        <td width="6"><img src="/i/clear.gif" width="6" height="1" border="0"/></td>
<!-- Gutter Ends -->

  <!-- Right Column Begins -->
        <td width="170"><img src="/i/clear.gif" width="170" height="1" border="0"/><br/>

        <xsl:call-template name="public_right_col"/>

        </td>
  <!-- Right Column Ends -->

<!-- Gutter Begins -->
        <td width="6"><img src="/i/clear.gif" width="6" height="1" border="0"/></td>
<!-- Gutter Ends -->

    </tr>
</table>

<!-- Footer Begins -->
<xsl:call-template name="Foot"/>
<!-- Footer Ends -->

</body>
</html>

  </xsl:template>
</xsl:stylesheet>

