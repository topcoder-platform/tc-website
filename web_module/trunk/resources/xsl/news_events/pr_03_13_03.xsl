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
    <HTML>
      <HEAD>
        <xsl:call-template name="Preload"/>
        <TITLE>Sun Microsystems(TM) and TopCoder Highlight Field for 2003 Collegiate Challenge </TITLE>
        <xsl:call-template name="CSS"/>
        <!--<LINK REL="stylesheet" TYPE="text/css" HREF="/css/style.css"/>
        <LINK REL="stylesheet" TYPE="text/css" HREF="/css/coders.css"/>-->
        <META NAME="description" CONTENT="TopCoder is a programming tournament site. All members who compete attain a rating that provides a metric for coding competence and potential. These ratings, coupled with tournament performance, can lead to monetary rewards and employment opportunities."/>
        <META NAME="keywords" CONTENT="Computer Jobs, Programming, Programming Jobs, Programming Contest, Programming Competition, Online Games, Coding, Information Technology Jobs, Java, C++"/>
      </HEAD>
      <BODY>
        <xsl:call-template name="Top"/>
<!-- Body Begins -->
<TABLE WIDTH="100%" BORDER="0" CELLPADDING="0" CELLSPACING="0">
    <TR>
    <!-- Left Column Begins -->
        <TD WIDTH="180" VALIGN="top">
<!-- Left Column Include Begins -->
    <!-- Global Seconday Nav Begins -->
        <xsl:call-template name="global_left"/>
	<!-- Global Seconday Nav Ends -->
<!-- Left Column Include Ends -->
        </TD>
	<!-- Left Column Ends -->
	<!-- Gutter Begins -->
        <TD WIDTH="4" VALIGN="top"><IMG SRC="/i/table_top_fill.gif" WIDTH="4" HEIGHT="26" BORDER="0"/></TD>
    <!-- Gutter Ends -->

<!-- Body Area -->
	<!-- Center Column Begins -->
        <TD CLASS="bodyText" WIDTH="100%" VALIGN="top">
<xsl:call-template name="BodyTop">
  <xsl:with-param name="image1">white</xsl:with-param>
  <xsl:with-param name="image">press_room</xsl:with-param>
  <xsl:with-param name="title">&#160;Press Releases - 2003</xsl:with-param>
</xsl:call-template>
            <TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" WIDTH="100%">
                <TR><TD VALIGN="middle" CLASS="bodyText" COLSPAN="2"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="23" BORDER="0"/></TD></TR>
                <TR>
                    <TD VALIGN="top" WIDTH="11"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="1" BORDER="0"/></TD>
                    <TD CLASS="bodyText" VALIGN="top" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="400" HEIGHT="1" BORDER="0"/><br />
                        <div align="center"><strong>Sun Microsystems and TopCoder Highlight Field for 2003 Collegiate Challenge Programming Tournament</strong><br />
                        Students Across the Globe Vie for Share of $100,000 in Java[tm] and C++ Programming Tournament</div>

                        <p><strong>SANTA CLARA, Calif.  and GLASTONBURY, CT.&#151;March, 13, 2003&#151;</strong>Sun Microsystems, Inc. and
                        TopCoder, Inc., a company committed to identifying and promoting computer programming talent through competition, today
                        announced the top fifty Java[tm] and C++ programmers remaining in its 2003 Collegiate Challenge. The tournament will award
                        a total prize purse of $100,000.  This is the second consecutive year that Sun and TopCoder have hosted this world-renowned
                        collegiate programming tournament and the fifth major tournament hosted by TopCoder.</p>

                        <p>"Sun is thrilled to be the exclusive sponsor of the 2003 Collegiate Challenge," said Stans Kleijnen, vice president, Market
                        Development Engineering, Sun Microsystems, Inc.  "This type of collegiate competition enables students to sharpen their
                        Java programming skills and enhance their opportunities for employment when they graduate."</p>

                        <p>The 2003 Sun Microsystems and TopCoder Collegiate Challenge brings together the world's highest-rated college-level Java
                        and C++ computer programmers and members of the TopCoder community.  The programmers are ranked based upon their
                        performance during weekly online competitions and the top ranked members are then invited to participate in four online
                        elimination rounds of regional competition.  The winner of each region will be named Regional Champion on March 24, awarded
                        $600 and automatically advanced to the final field of sixteen competitors.  The remaining sixteen will compete in the
                        tournament's semifinal and championship rounds, which will be held April 4 and 5, 2003 at the University Park Hotel @ MIT
                        in Cambridge, Massachusetts.  There, the tournament champion will win $50,000. </p>

                        <p>The fifty programmers that participated in the Regional Championships represent thirty-four schools from eight countries
                        around the world.  CalTech had the strongest representation with six programmers, followed by the Massachusetts Institute of
                        Technology, Duke University, Stanford University and Georgia Tech, each with three programmers. </p>

                        <p>Eight semifinalists from previous tournaments are still competing in this year's Collegiate Challenge.  Among them is Daniel
                        Wright of Stanford University.  This returning Collegiate Challenge champion chose to use Java technology to secure his
                        $100,000 purse in 2002.  Also competing in this year's challenge is former finalist David Arthur from Duke University. </p>

                        <p>"Each year a new class of graduates enters the IT workforce," said TopCoder Chairman and founder, Jack Hughes.  "TopCoder
                        competitions enable technology companies and recruiters to identify and objectively assess candidates through testing and rating
                        coding skills under real-world conditions.  TopCoder offers services to assist companies looking to hire top programming talent."</p>

                        <p><br /></p>

                        <p><strong>About TopCoder, Inc.</strong><br />
                        TopCoder, Inc. organizes and hosts online and onsite programming competitions for its members.  With a global membership
                        database, TopCoder members extend across all professional and collegiate levels.  The attraction of competition and the
                        associated rewards create a powerful community of programmers.  Access to this community is granted to corporate partners
                        who both promote and profit from the relationship.  For more information, visit www.topcoder.com.</p>

                        <p><strong>About Sun Microsystems, Inc.</strong><br />
                        Since its inception in 1982, a singular vision&#151;"The Network Is The Computer[tm]"&#151;has propelled Sun
                        Microsystems, Inc. (Nasdaq: SUNW) to its position as a leading provider of industrial-strength hardware, software and services
                        that make the Net work.  Sun can be found in more than 100 countries and on the World Wide Web at http://sun.com.</p>

                        <p>###</p>

                        <p>Sun, Sun Microsystems, the Sun logo, Java and The Network Is The Computer are trademarks or registered trademarks of
                        Sun Microsystems, Inc. in the United States and other countries.</p>

                        <p><br /></p>

                    </TD>
                    <TD VALIGN="top" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
                </TR>

                <TR><TD COLSPAN="3" VALIGN="top" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="10" BORDER="0"/></TD></TR>
            </TABLE>
        </TD>
	<!-- Center Column Ends -->
<!-- Body Area Ends -->

	<!-- Gutter -->
        <TD WIDTH="4"><IMG SRC="/i/clear.gif" WIDTH="4" HEIGHT="1" BORDER="0"/></TD>
    <!-- Gutter Ends -->
	<!-- Right Column Begins -->
        <TD WIDTH="170" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="170" HEIGHT="1" BORDER="0"/><BR/>
<!-- Right Column Include Begins -->
        <xsl:call-template name="pr_right_col"/>
<!-- Right Column Include Ends -->
        </TD>
	<!-- Right Column Ends -->
	<!-- Gutter -->
        <TD WIDTH="10"><IMG SRC="/i/clear.gif" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
    <!-- Gutter Ends -->
    </TR>
</TABLE>
<!-- Body Ends -->
        <xsl:call-template name="Foot"/>
      </BODY>
    </HTML>
  </xsl:template>
</xsl:stylesheet>
