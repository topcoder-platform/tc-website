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
                                  <IMG ALT="" BORDER="0">
                                    <xsl:attribute name="SRC"><xsl:value-of select="/TC/SCHEDULE/Round/Details/path"/></xsl:attribute>
                                    <xsl:attribute name="WIDTH"><xsl:value-of select="/TC/SCHEDULE/Round/Details/width"/></xsl:attribute>
                                    <xsl:attribute name="HEIGHT"><xsl:value-of select="/TC/SCHEDULE/Round/Details/height"/></xsl:attribute>
                                  </IMG>
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
                        <TD COLSPAN="3" ALIGN="center" class="bodyText">
                            <BR/>All times are Eastern Time unless otherwise noted<BR/><BR/>

                            <xsl:choose>
                            <xsl:when test="$roundId=4710">
                                <b>Win an Intel&#174; Centrino&#153; mobile technology-based notebook computer</b><br/><br/>
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
                 <xsl:when test="$roundId&lt;4230">
                      <TR><TD COLSPAN="3" ALIGN="left" VALIGN="top" CLASS="bodyText">
                        <xsl:choose>
                        <xsl:when test="$roundId=4220">
                          <B>This match has a total prize purse of $20,000</B><BR/>
                          - $1000 from each match is donated to <A HREF="/index?t=support&amp;c=charities" CLASS="bodyText">charity</A><BR/>
                          - $200 is paid to the unrated competitor who has the highest points for the match<BR/>
                        </xsl:when>
                        <xsl:otherwise>
                          <B>This match has a total prize purse of $10,000</B><BR/>
                          - $500 from each match is donated to <A HREF="/index?t=support&amp;c=charities" CLASS="bodyText">charity</A><BR/>
                          - $100 is paid to the unrated competitor who has the highest points for the match<BR/>
                        </xsl:otherwise>
                        </xsl:choose>
                        - Coders must place with a positive point total to collect their prize.<BR/><BR/>
                        <A HREF="/index?t=support&amp;c=divisions" CLASS="bodyText">More about the Prize structure</A><BR/><BR/>
                        <B>Single Round Match Description</B><UL>
                      <LI>Maximum of 10 coders per room</LI>
                      <LI>Ratings will be adjusted post-match</LI>
                      <LI>Members will be emailed prior to the match with date and time (opt-in)</LI>
                      <LI>Members will be emailed the match results (opt-in)</LI>
                      </UL>
                      The match will feature a mixed programming language format.  For each individual problem, the coder will have the option of using either Java, C++, Microsoft&#174; Visual C#&#174; .NET or Microsoft&#174; Visual Basic&#174; .NET to code the solution.  Syntactical knowledge of all four languages will be helpful during the challenge phase of each round of competition.<BR/><BR/>
                      <B>Divisions and Room Assignments:</B><UL>
            <LI>Members rated 1200 or better compete in Division-I</LI>
            <LI>Members rated 1199 or lower compete in Division-II</LI>
            <LI>Members not yet rated compete in Division-II</LI>
                      <LI>Room assignments place members of like divisions together</LI>
                      <LI>Rating changes go into effect in next participated match</LI>
                      <LI>In the event that any member who is ineligible to receive prizes (due to age or country restrictions) places in a position in which they would receive a prize, they will be asked to pick a charity to which to donate their prize.  In the event that the member does not pick a charity, TopCoder will pick a charity to which the ineligible member's prize will be paid.</LI></UL>
                      <A HREF="/index?t=support&amp;c=divisions" CLASS="bodyText">More about the Division structure</A><BR/><BR/>
                      <B>Eligibility:</B><BR/><BR/>
                      Open to members meeting the following eligibility requirements:<UL>
            <LI>Ages 13 and up can compete in any match</LI>
            <LI>18 and older and meet the following residence requirements to claim cash prizes</LI>
                      <LI>All US* Citizens</LI>
                      <LI>All Lawful Permanent Residents of the US (i.e., Green Card Holders)</LI>
                      <LI>All Citizens and Legal Permanent Residents of Canada, excluding Quebec</LI>
                      <LI>All Citizens and Legal Permanent Residents of China</LI>                      
                      <LI>All Citizens and Legal Permanent Residents of Australia</LI>
                      <LI>All Citizens and Legal Permanent Residents of India</LI>
                      <LI>All Citizens and Legal Permanent Residents of Ireland</LI>
                      <LI>All Citizens and Legal Permanent Residents of New Zealand</LI>                      
                      <LI>All Citizens and Legal Permanent Residents of the United Kingdom</LI>
                      <LI>All non-immigrants** currently residing in the US with a valid Visa</LI></UL>
                      *(including the US Territories of Guam, Puerto Rico and the US Virgin Islands)<BR/>
                      ** Non-immigrants refer to people who come to the US, but not permanently (i.e., they are not permanent residents)<BR/><BR/>
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

