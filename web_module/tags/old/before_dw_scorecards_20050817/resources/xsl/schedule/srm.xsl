<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:import href="../top.xsl"/>
  <xsl:import href="../script.xsl"/>
  <xsl:import href="../includes/body_top.xsl"/>
  <xsl:import href="../foot.xsl"/>
  <xsl:import href="../includes/modules/practice_room.xsl"/>
  <xsl:import href="../includes/modules/calendar.xsl"/>
  <xsl:import href="../includes/global_left.xsl"/>
  <xsl:import href="../includes/public_right_col.xsl"/>
  <xsl:output indent="no" method="html" doctype-public="-//W3C//DTD HTML 4.0 Transitional//EN"/>
  <xsl:template match="/">
    <HTML>
      <HEAD>
        <xsl:call-template name="Preload"/>
        <TITLE>Single Round Match (SRM) Schedule at TopCoder</TITLE>
        <xsl:call-template name="CSS"/>
        <META NAME="description" CONTENT="TopCoder is a programming tournament site. All members who compete attain a rating that provides a metric for coding competence and potential. These ratings, coupled with tournament performance, can lead to monetary rewards and employment opportunities."/>
        <META NAME="keywords" CONTENT="Computer Jobs, Programming, Programming Jobs, Programming Contest, Programming Competition, Online Games, Coding, Information Technology Jobs, Java, C++"/>
      </HEAD>
      <BODY>
        <a name="top_page"></a>
        <xsl:variable name="roundId">
          <xsl:value-of select="/TC/SCHEDULE/Round/Details/round_id"/>
        </xsl:variable>
        <xsl:call-template name="Top"/>
        <!-- Body Begins -->
<TABLE WIDTH="100%" BORDER="0" CELLPADDING="0" CELLSPACING="0">
    <TR valign="top">

<!-- Left Column Begins -->
        <TD WIDTH="180" VALIGN="top">
              <xsl:call-template name="global_left"/>
        </TD>
<!-- Left Column Ends -->

<!-- Gutter Begins -->
        <TD WIDTH="15"><IMG SRC="/i/clear.gif" WIDTH="15" HEIGHT="5" BORDER="0"/></TD>
<!-- Gutter Ends -->

<!-- Center Column Begins -->
        <TD CLASS="bodyText" WIDTH="100%" BGCOLOR="#FFFFFF" VALIGN="top">
              <xsl:call-template name="BodyTop">
                <xsl:with-param name="image1">white</xsl:with-param>
                <xsl:with-param name="image">schedule</xsl:with-param>
                <xsl:with-param name="title"><xsl:value-of select="/TC/SCHEDULE/Round/Details/contest_name"/></xsl:with-param>
              </xsl:call-template>
              <TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#FFFFFF" WIDTH="100%">
                <TR>
                  <TD VALIGN="top" WIDTH="11"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="1" BORDER="0"/></TD>
                  <TD CLASS="bodyText" COLSPAN="2" VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="100%">
                    <IMG SRC="/i/clear.gif" ALT="" WIDTH="240" HEIGHT="1" BORDER="0"/><BR/>

                    <TABLE WIDTH="428" BORDER="0" CELLPADDING="0" CELLSPACING="0" ALIGN="center">
                      <TR><TD COLSPAN="3" ALIGN="center"><IMG SRC="/i/clear.gif" ALT="" WIDTH="428" HEIGHT="10" BORDER="0" /></TD></TR>



                          <TR>
                            <TD COLSPAN="3" ALIGN="center">
                              <xsl:choose>
                                <xsl:when test="/TC/SCHEDULE/Round/Details/path=''">
                                  <IMG SRC="/i/srm_banner.jpg" ALT="" WIDTH="428" HEIGHT="80" BORDER="0" />
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:choose>
                                  <xsl:when test="/TC/SCHEDULE/Round/Details/link=''">
                                      <IMG ALT="" BORDER="0">
                                        <xsl:attribute name="SRC"><xsl:value-of select="/TC/SCHEDULE/Round/Details/path"/></xsl:attribute>
                                        <xsl:attribute name="WIDTH"><xsl:value-of select="/TC/SCHEDULE/Round/Details/width"/></xsl:attribute>
                                        <xsl:attribute name="HEIGHT"><xsl:value-of select="/TC/SCHEDULE/Round/Details/height"/></xsl:attribute>
                                      </IMG>
                                      </xsl:when>
                                        <xsl:otherwise>
                                      <a><xsl:attribute name="href"><xsl:value-of select="/TC/SCHEDULE/Round/Details/link"/></xsl:attribute>
                                          <IMG ALT="" BORDER="0">
                                            <xsl:attribute name="SRC"><xsl:value-of select="/TC/SCHEDULE/Round/Details/path"/></xsl:attribute>
                                            <xsl:attribute name="WIDTH"><xsl:value-of select="/TC/SCHEDULE/Round/Details/width"/></xsl:attribute>
                                            <xsl:attribute name="HEIGHT"><xsl:value-of select="/TC/SCHEDULE/Round/Details/height"/></xsl:attribute>
                                          </IMG>
                                      </a>
                                    </xsl:otherwise>
                                  </xsl:choose>
                                </xsl:otherwise>
                              </xsl:choose>

                              <TR BGCOLOR="#CCCCCC">
                                <TD WIDTH="130" HEIGHT="24" VALIGN="middle" ALIGN="center" class="bodyText"><B>Date</B></TD>
                                <TD WIDTH="130" HEIGHT="24" VALIGN="middle" ALIGN="center" class="bodyText"><B>Registration</B></TD>
                                <TD WIDTH="130" HEIGHT="24" VALIGN="middle" ALIGN="center" class="bodyText"><B>Start</B></TD>
                              </TR>
                              <TR BGCOLOR="#666666">
                                <TD WIDTH="130" HEIGHT="18" VALIGN="middle" ALIGN="center" class="statText">
                                <b> <xsl:value-of select="/TC/SCHEDULE/Round/Details/date"/><br/> </b>
                                </TD>
                                <TD WIDTH="130" HEIGHT="18" VALIGN="middle" ALIGN="center" class="statText">
                                  <B>
                                    <xsl:value-of select="/TC/SCHEDULE/Round/Details/reg_begin"/>
                                  </B>
                                </TD>
                                <TD WIDTH="130" HEIGHT="18" VALIGN="middle" ALIGN="center" class="statText">
                                  <B>
                                    <xsl:value-of select="/TC/SCHEDULE/Round/Details/coding_begin"/>
                                  </B>
                                </TD>
                              </TR>
                            </TD>
                          </TR>


                      <xsl:if test="$roundId='4365'">
                        <TR><TD COLSPAN="3" ALIGN="center" class="bodyText">
                          <A HREF="/?&amp;t=schedule&amp;c=srm_spon_artifact">...More about Artifact</A>
                        </TD></TR>
                      </xsl:if>

                      <TR>
                        <TD COLSPAN="3" ALIGN="left" class="bodyText">
                            <center><BR/>All times are Eastern Time unless otherwise noted, click <a><xsl:attribute name="HREF">http://www.timeanddate.com/worldclock/fixedtime.html?day=<xsl:value-of select="/TC/SCHEDULE/Round/Details/day"/>&amp;month=<xsl:value-of select="/TC/SCHEDULE/Round/Details/month"/>&amp;year=<xsl:value-of select="/TC/SCHEDULE/Round/Details/year"/>&amp;hour=<xsl:value-of select="/TC/SCHEDULE/Round/Details/hour"/>&amp;min=<xsl:value-of select="/TC/SCHEDULE/Round/Details/minute"/>&amp;sec=0&amp;p1=179</xsl:attribute>here</a>
                            to see when coding begins in other time zones.<br/><br/></center>

                            <xsl:choose>
                            <xsl:when test="$roundId=4710">
                                <b>For information on how to win an Intel&#174; Centrino&#153; mobile technology-based notebook computer click <a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco03&amp;d3=tco03_intel">here</a></b><br/><br/>
                           </xsl:when>
                                <xsl:when test="$roundId=5856">
                                    <p>
                                    If you're a member of <a href="/?t=sponsor&amp;c=link&amp;link=http://www.intel.com/IDS&amp;refer=srm_details" target="_blank">Intel Developer Services</a> AND take part in Single Round Match 210, you'll be eligible for a chance to win one Intel&#174; Centrino&#153; mobile technology-based notebook!
                                    </p>
                                    <table width="428" border="0" cellpadding="6" cellspacing="2" class="sidebarBox">
                                        <tr>
                                        <td align="left" valign="middle">
                                        </td>
                                    </tr>
                                        <tr valign="top">
                                        <td align="left" valign="middle">
                                            <h2>Intel<sup>&#174;</sup><br/>Centrino&#153;<br/>Mobile<br/>Technology-<br/>based Tablet<br/>PC Quick<br/>Specs</h2>
                                        </td>
                                        <td align="left" valign="middle">
                                            <img src="/i/tournament/tco04/intel_tablet.jpg" width="216" height="167" border="0"/>
                                        </td>
                                    </tr>
                                    </table>
                                 <table width="428" border="0" cellpadding="6" cellspacing="2" class="sidebarBox">
                                    <tr valign="top">
                                        <td class="sidebarTitle">Configuration Details:</td>
                                        <td class="sidebarText">1 Intel<sup>&#174;</sup> Pentium<sup>&#174;</sup> M PROCESSOR 1.0GHz, Intel<sup>&#174;</sup>
                                        855GM CHIPSET, OEM BASEBOARD, DDR266 512MB (1x512MB) MEMORY, INTEGRATED GRAPHICS, TABLET FORM FACTOR CHASSIS, WINDOWS
                                        XP TABLET PC OS, CALEXICO 802.11b (Intel<sup>&#174;</sup> PRO/Wireless 2100 network connection)</td>
                                    </tr>

                                    <tr valign="top">
                                        <td class="sidebarTitle">Description:</td>
                                        <td class="sidebarText">Intel<sup>&#174;</sup> Pentium<sup>&#174;</sup> M based Centrino&#153; Tablet Platform</td>
                                    </tr>

                                    <tr valign="top">
                                        <td class="sidebarTitle">Functionality:</td>
                                        <td class="sidebarText">Production-level</td>
                                    </tr>

                                    <tr valign="top">
                                        <td class="sidebarTitle">New Technologies:</td>
                                        <td class="sidebarText">Intel<sup>&#174;</sup> Pentium<sup>&#174;</sup> M processor, Intel<sup>&#174;</sup> 855
                                        Chipset family, Intel<sup>&#174;</sup> PRO/Wireless 2100 network connection (Centrino&#153; Mobile Technology)</td>
                                    </tr>
                                </table>
                                    <p><b>For Official Contest Rules on how to win an Intel&#174; Centrino&#153; Mobile Technology-based Tablet PC click <a href="Javascript:openWin('/tc?module=Static&amp;d1=tournaments&amp;d2=tco04&amp;d3=intel&amp;d4=tablet_rules','comp',545,655)">here</a></b></p><br/>
                               </xsl:when>
                                </xsl:choose>

                            <xsl:if test="number($roundId)=5075">
                              In celebration of SRM 200, TopCoder will hold 10 random drawings at the conclusion of the challenge phase.  In order to be eligible to be randomly chosen for a prize, you must both register for SRM 200 during the registration period and participate in the match.<br/>
                              <br/>
                              The prizes to be given away are: <br/>
                              <br/>
                              (3) TopCoder Hooded Jackets<br/>
                              (3) TopCoder Backpacks<br/>
                              (4) TopCoder Polo Shirts<br/>
                              <br/>
                              A given competitor will only be eligible to win, at most, one random drawing.
                              <br/>
                              <br/>
                           </xsl:if>

                            <xsl:choose>
                            <xsl:when test="$roundId=5849">
                                <table>
                                  <tr><td class="bodyText" colspan="3">TopCoder has adjusted the hours of certain SRMs to better accommodate members in Europe, Asia and Australia.  The additional dates and times are as follows:</td></tr>
                                  <tr><td class="bodyText"></td></tr>
                                  <tr><td class="bodyText">August 10:</td><td class="bodyText">Register - 10:00AM ET </td><td class="bodyText">Compete - 1:00PM ET</td></tr>
                                  <tr><td class="bodyText">September 14:</td><td class="bodyText">Register - 6:00AM ET </td><td class="bodyText">Compete - 9:00AM ET</td></tr>
                                  <tr><td class="bodyText">October 4:</td><td class="bodyText">Register - 10:00AM ET </td><td class="bodyText">Compete - 1:00PM ET</td></tr>
                                  <tr><td class="bodyText">November 4:</td><td class="bodyText">Register - 6:00AM ET </td><td class="bodyText">Compete - 9:00AM ET</td></tr>
                                  <tr><td class="bodyText">December 6:</td><td class="bodyText">Register - 10:00AM ET </td><td class="bodyText">Compete - 1:00PM ET</td></tr>
                                </table>
                                <br/>
                            </xsl:when>
                            <xsl:when test="$roundId=5853">
                                <table>
                                  <tr><td class="bodyText" colspan="3">TopCoder has adjusted the hours of certain SRMs to better accommodate members in Europe, Asia and Australia.  The additional dates and times are as follows:</td></tr>
                                  <tr><td class="bodyText"></td></tr>
                                  <tr><td class="bodyText">September 14:</td><td class="bodyText">Register - 6:00AM ET </td><td class="bodyText">Compete - 9:00AM ET</td></tr>
                                  <tr><td class="bodyText">October 4:</td><td class="bodyText">Register - 10:00AM ET </td><td class="bodyText">Compete - 1:00PM ET</td></tr>
                                  <tr><td class="bodyText">November 4:</td><td class="bodyText">Register - 6:00AM ET </td><td class="bodyText">Compete - 9:00AM ET</td></tr>
                                  <tr><td class="bodyText">December 6:</td><td class="bodyText">Register - 10:00AM ET </td><td class="bodyText">Compete - 1:00PM ET</td></tr>
                                </table>
                                <br/>
                            </xsl:when>
                            <xsl:when test="$roundId=5857">
                                <table>
                                  <tr><td class="bodyText" colspan="3">TopCoder has adjusted the hours of certain SRMs to better accommodate members in Europe, Asia and Australia.  The additional dates and times are as follows:</td></tr>
                                  <tr><td class="bodyText"></td></tr>
                                  <tr><td class="bodyText">October 4:</td><td class="bodyText">Register - 10:00AM ET </td><td class="bodyText">Compete - 1:00PM ET</td></tr>
                                  <tr><td class="bodyText">November 4:</td><td class="bodyText">Register - 6:00AM ET </td><td class="bodyText">Compete - 9:00AM ET</td></tr>
                                  <tr><td class="bodyText">December 6:</td><td class="bodyText">Register - 10:00AM ET </td><td class="bodyText">Compete - 1:00PM ET</td></tr>
                                </table>
                                <br/>
                            </xsl:when>
                            <xsl:when test="$roundId=5860">
                                <table>
                                  <tr><td class="bodyText" colspan="3">TopCoder has adjusted the hours of certain SRMs to better accommodate members in Europe, Asia and Australia.  The additional dates and times are as follows:</td></tr>
                                  <tr><td class="bodyText"></td></tr>
                                  <tr><td class="bodyText">November 4:</td><td class="bodyText">Register - 6:00AM ET </td><td class="bodyText">Compete - 9:00AM ET</td></tr>
                                  <tr><td class="bodyText">December 6:</td><td class="bodyText">Register - 10:00AM ET </td><td class="bodyText">Compete - 1:00PM ET</td></tr>
                                </table>
                                <br/>
                            </xsl:when>
                            <xsl:when test="$roundId=5864">
                                <table>
                                  <tr><td class="bodyText" colspan="3">TopCoder has adjusted the hours of certain SRMs to better accommodate members in Europe, Asia and Australia.  The additional dates and times are as follows:</td></tr>
                                  <tr><td class="bodyText"></td></tr>
                                  <tr><td class="bodyText">December 7:</td><td class="bodyText">Register - 10:00AM ET </td><td class="bodyText">Compete - 1:00PM ET</td></tr>
                                </table>
                                <br/>
                            </xsl:when>
                            </xsl:choose>


                        </TD>
                </TR>

                <TR>
                    <TD COLSPAN="3" ALIGN="center">
                        <table width="100%" cellspacing="0" cellpadding="3" border="0" bgcolor="#EEEEEE">
                            <tr valign="middle"><td class="statTextLarge" bgcolor="#999999" width="50%"><font size="3">Getting started in the Competition Arena</font></td></tr>
                            <tr>
                                <td class="bodyText">
                                    <p style="padding: 3px">Load the Competition Arena as an <A class="bodyText" href="Javascript:arena()">Applet</A><br/>
                                    Load the Competition Arena as a <A class="bodyText" href="/contest/arena/ContestAppletProd.jnlp">Java Web Start Application</A><br/>
                                    Don't have JWS? <A class="bodyText" href="http://java.sun.com/products/javawebstart/index.html" target="_blank">Download</A> it on java.sun.com<br/>
                                    Check out the <A class="bodyText" href="/?t=arena&amp;c=plugins">plugins</A> available for the Competition Arena</p>
                                </td>
                            </tr>
                        </table><br/>
                        <IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="10" BORDER="0"/><BR/>
                    </TD>
                </TR>

                <xsl:choose>
                    <xsl:when test="$roundId='7223' or $roundId='8004' or $roundId='8005' or $roundId='7227'">
                      <TR><TD COLSPAN="3" ALIGN="left" VALIGN="top" CLASS="bodyText">
                        <font size="3"><b>Total Prize Purse of $5,000 !!!</b></font><br/><br/>
                        <B>Single Round Match Description</B>
                      <UL>
                            <li>Competitors with a rating of 1200 or higher at the start of the match will be placed into a division one room. All other competitors, including non-rated competitors, will be placed into a division two room.</li>
                            <li>Room assignments within each division will performed randomly, with prizes distributed evenly among all rooms in each division.</li>
                            <li>70% of the total purse will be awarded to division one competitors, and 30% to division two competitors.</li>
                            <li>Approximately 20 competitors will be assigned to each room.</li>
                            <li>The first, second, and third place coders in each division one room will receive 50%, 30%, and 20% of the room award, respectively.</li>
                            <li>The first and second place competitors in each division two room will receive 60% and 40% of the room award, respectively.</li>
                            <li>In the event of a tie for any prize winning position, the sum of the awards of the tied competitors will be distributed evenly. (For example, if five coders tie for second place in a division one room, each will receive (30%+20%)/5 or 10% of the room award.)</li>
                            <li>Prizes will only be awarded to competitors who finish with greater than zero scores.</li>
                            <li>In order to be eligible for prizes, a competitor must be a TopCoder member in good standing, at least 18 years of age,  and must not be a resident of Cuba, Iran, Iraq, Libya, North Korea, Sudan, Syria, the Quebec province of Canada, or anywhere else where this contest is prohibited by applicable law.</li>
                            <li><a href="/?t=support&amp;c=ratings_cal">Rating changes</a> go into effect in next participated rated event</li>
                            <li>For a complete guide to competing in a Single Round Match, read the <a href="/tc?module=Static&amp;d1=help&amp;d2=index">Algorithm Competition Guide</a></li>
                      </UL>
                      <B>Eligibility:</B>
                      <UL>
                        <li>Any TopCoder member in good standing, who is at least 13 years of age, may compete in this competition.</li>
                        <li>In order to be eligible for prizes, a competitor must be a TopCoder member in good standing, at least 18 years of age,  and must not be a resident of Cuba, Iran, Iraq, Libya, North Korea, Sudan, Syria, the Quebec province of Canada, or anywhere else where this contest is prohibited by applicable law.</li>
                        <li>In the event that any member who is ineligible to receive prizes places in a position in which they would receive a prize, they will be asked to pick a <a href="?&amp;t=support&amp;c=charities">charity</a> to which to donate their prize. In the event that the member does not pick a charity, TopCoder will pick a charity to which the ineligible member's prize will be paid.</li>
                      </UL>
                      <BR/><BR/>

                      <A CLASS="bodyText"><xsl:attribute name="HREF">/?t=schedule&amp;c=srm_rules&amp;RoundId=<xsl:value-of select="$roundId"/></xsl:attribute><B>Click here for complete rules &amp; regulations</B></A>
                      </TD></TR>

                    </xsl:when>
                    <xsl:otherwise>
                      <TR><TD COLSPAN="3" ALIGN="left" VALIGN="top" CLASS="bodyText">
                        <B>Single Round Match Description</B>
                      <UL>
                      <LI>Maximum of 20 coders per room</LI>
                      <LI>Ratings will be adjusted post-match</LI>
                      <LI>Members will be emailed prior to the match with date and time (opt-in)</LI>
                      </UL>
                      The match will feature a mixed programming language format.  For each individual problem, the coder will have the option of using either Java, C++, Microsoft&#174; Visual C#&#174; .NET or Microsoft&#174; Visual Basic&#174; .NET to code the solution.  Syntactical knowledge of all four languages will be helpful during the challenge phase of each round of competition.<BR/><BR/>
                      <B>Divisions and Room Assignments:</B>
            <UL>
            <LI>Members rated 1200 or better compete in Division-I</LI>
            <LI>Members rated 1199 or lower compete in Division-II</LI>
            <LI>Members not yet rated compete in Division-II</LI>
                      <LI>Room assignments place members of like divisions together</LI>
                      <LI>Rating changes go into effect in next participated match</LI></UL>
                      <B>Eligibility:</B><BR/><BR/>
                      Anyone who is at least 13 years of age may compete in any Single Round Match.<BR/><BR/>
                      <A CLASS="bodyText"><xsl:attribute name="HREF">/?t=schedule&amp;c=srm_rules&amp;RoundId=<xsl:value-of select="$roundId"/></xsl:attribute><B>Click here for complete rules &amp; regulations</B></A>
                      </TD></TR>

                    </xsl:otherwise>
                </xsl:choose>


                        </TABLE>

                        <P><BR/></P>

                    </TD>
                </TR>
            </TABLE>
        </TD>
<!-- Center Column Ends -->

<!-- Gutter -->
            <TD WIDTH="15"><IMG SRC="/i/clear.gif" WIDTH="15" HEIGHT="1" BORDER="0"/></TD>
<!-- Gutter Ends -->

<!-- Right Column Begins -->
        <TD WIDTH="170"><IMG SRC="/i/clear.gif" WIDTH="170" HEIGHT="1" BORDER="0"/><BR/>
            <xsl:call-template name="public_right_col"/>
        </TD>
<!-- Right Column Ends -->

<!-- Gutter Begins -->
        <TD WIDTH="10"><IMG SRC="/i/clear.gif" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
<!-- Gutter Ends -->
    </TR>
</TABLE>

<xsl:call-template name="Foot"/>

</BODY>

</HTML>

  </xsl:template>
</xsl:stylesheet>

