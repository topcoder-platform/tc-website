<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:import href="../includes/modules/calendar.xsl"/>
    <xsl:import href="../includes/modules/simple_search.xsl"/>
    <xsl:import href="../includes/modules/my_stats.xsl"/>
    <xsl:import href="../includes/modules/countries2.xsl"/>
    <xsl:import href="../includes/modules/srm_dates.xsl"/>
    <xsl:template name="global_left">

    <xsl:param name="level1"></xsl:param>
    <xsl:param name="level2"></xsl:param>
    <xsl:param name="level3"></xsl:param>

    <xsl:choose>
<!-- Schedule begins -->
        <xsl:when test="/TC/Task='schedule'">
            <xsl:call-template name="left_nav_top_row" />
            <table width="180" cellspacing="0" cellpadding="0" border="0">
                <xsl:call-template name="competition_row"/>
                <xsl:call-template name="applet_row"/>
                <xsl:call-template name="my_home_row"/>

                <tr>
                    <td id="leftNavOn">
                        <xsl:attribute name="id">
                        <xsl:choose>
                            <xsl:when test="/TC/Command='index'">leftNavSelect</xsl:when>
                            <xsl:otherwise>leftNavOn</xsl:otherwise>
                        </xsl:choose>
                        </xsl:attribute>
                        <A class="leftOn"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=schedule&amp;c=index</xsl:attribute><img alt="" width="10" height="10" src="/i/clear.gif" border="0" />Schedule</A>
                    </td>
                </tr>

                <xsl:call-template name="stats_row"/>
                <xsl:call-template name="education_row"/>
                <xsl:call-template name="events_row"/>
                <xsl:call-template name="rtables_row"/>
                <xsl:call-template name="tc_gear_row"/>
                <xsl:call-template name="rules_row"/>
            </table>

            <xsl:call-template name="simple_search"/>
            <xsl:call-template name="left_nav_btm_row"/>
        </xsl:when>
<!-- Schedule ends -->

<!-- Statistics begins -->
        <xsl:when test="/TC/Task='statistics'">
            <xsl:call-template name="left_nav_top_row" />
            <table width="180" cellspacing="0" cellpadding="0" border="0">
                <xsl:call-template name="competition_row"/>
                <xsl:call-template name="applet_row"/>
                <xsl:call-template name="my_home_row"/>
                <xsl:call-template name="sched_row"/>

                <tr><td id="leftNavOn"><A class="leftOn"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/stat?&amp;c=round_overview</xsl:attribute><img alt="" width="10" height="10" src="/i/nav_arrow_bottom.gif" border="0" />Statistics</A></td></tr>

<!-- Round Overview -->
                <tr>
                    <td id="leftSubnav"><A class="leftOn"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/stat?&amp;c=round_overview</xsl:attribute>Round Overview</A></td>
                </tr>

<!-- Last Match Results -->
        <xsl:choose>
            <xsl:when test="number(/TC/Rating)>0 and/TC/LoggedIn='true'">
                 <tr><td id="leftSubnav"><a class="leftOn"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/stat?c=round_stats</xsl:attribute>Last Match Results</a></td></tr>
                 <tr><td id="leftSubnav"><a class="leftOn"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/stat?c=coder_room_stats&amp;cr=<xsl:value-of select="/TC/UserId"/></xsl:attribute>My Last Match</a></td></tr>
                 <tr><td id="leftSubnav"><a class="leftOn"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/stat?c=member_profile&amp;cr=<xsl:value-of select="/TC/UserId"/></xsl:attribute>Member Profile</a></td></tr>
                 <tr><td id="leftSubnav"><a class="leftOn"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/stat?c=ratings_history&amp;cr=<xsl:value-of select="/TC/UserId"/></xsl:attribute>Ratings History</a></td></tr>
                 <tr><td id="leftSubnav"><a class="leftOn"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/stat?c=earnings_history&amp;cr=<xsl:value-of select="/TC/UserId"/></xsl:attribute>Earnings History</a></td></tr>
            </xsl:when>
            <xsl:otherwise>
                <tr>
                    <td id="leftSubnav"><A class="leftOn"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/stat?&amp;c=last_match</xsl:attribute>Last Match Results</A></td>
                </tr>
            </xsl:otherwise>
        </xsl:choose>

<!-- Coder Rankings -->
                <tr>
                    <td id="leftSubnav"><A class="leftOn"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/stat?&amp;c=coder_ratings</xsl:attribute>Coder Rankings</A></td>
                </tr>

<!-- Problem Archive -->
                <tr>
                    <td id="leftSubnav"><A class="leftOn"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/tc?module=ProblemArchive</xsl:attribute>Problem Archive</A></td>
                </tr>


<!-- Match Editorials -->
                <tr>
                    <td id="leftSubnav">
                        <xsl:attribute name="id">
                        <xsl:choose>
                            <xsl:when test="/TC/Command='editorial_archive'">leftSubnavOn</xsl:when>
                            <xsl:otherwise>leftSubnav</xsl:otherwise>
                        </xsl:choose>
                        </xsl:attribute>
                        <A class="leftOn"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?t=statistics&amp;c=editorial_archive</xsl:attribute>Match Editorials</A>
                    </td>
                </tr>

<!-- Quick Stats -->
                <tr>
                    <td id="leftSubnav">
                        <xsl:attribute name="id">
                        <xsl:choose>
                            <xsl:when test="/TC/Command='quick_stats'">leftSubnavOn</xsl:when>
                            <xsl:otherwise>leftSubnav</xsl:otherwise>
                        </xsl:choose>
                        </xsl:attribute>
                        <A class="leftOn"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?t=statistics&amp;c=quick_stats</xsl:attribute>Quick Stats</A>
                    </td>
                </tr>

<!-- Advanced Member Search -->
                <tr>
                    <td id="leftSubnav"><A class="leftOn"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/tc?module=ViewAdvanced</xsl:attribute>Advanced Member Search</A></td>
                </tr>
                <tr>
                    <td id="leftSubnav">
                        <a class="leftOn"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/tc?&amp;module=SurveyList</xsl:attribute>Member Surveys</a>
                    </td>
                </tr>


                <xsl:call-template name="education_row"/>
                <xsl:call-template name="events_row"/>
                <xsl:call-template name="rtables_row"/>
                <xsl:call-template name="tc_gear_row"/>
                <xsl:call-template name="rules_row"/>
            </table>

            <xsl:call-template name="simple_search"/>
            <xsl:call-template name="left_nav_btm_row"/>
        </xsl:when>
<!--  Statistics ends -->

<!-- Development-Overview Begins -->
        <xsl:when test="/TC/Task='development'">
            <xsl:call-template name="left_nav_top_row" />
            <table width="180" cellspacing="0" cellpadding="0" border="0">
                <xsl:call-template name="development_row"/>
                <xsl:call-template name="applet_row"/>
                <xsl:call-template name="my_home_row"/>

<!-- Development Round Tables -->
                <tr>
                    <td id="leftNav">
                        <A class="left"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/rtables/viewForum.jsp?forum=205768&amp;mc=916</xsl:attribute><img alt="" width="10" height="10" src="/i/nav_arrow_right.gif" border="0"/>TC Developer Round Tables</A>
                    </td>
                </tr>

<!-- TCS Developer Forums -->
                <tr>
                    <td id="leftNav">
                        <A class="left"><xsl:attribute name="href">http://<xsl:value-of select="/TC/SoftwareHost"/>/forum/c_active_collab.jsp?ft=2</xsl:attribute><img alt="" width="10" height="10" src="/i/nav_arrow_right.gif" border="0"/>TCS Developer Forums</A>
                    </td>
                </tr>

<!-- Components -->
                <xsl:call-template name="components">
                    <xsl:with-param name="level2"><xsl:value-of select="$level2"/></xsl:with-param>
                    <xsl:with-param name="level3"><xsl:value-of select="$level3"/></xsl:with-param>
                </xsl:call-template>

<!-- Contests -->
                <xsl:call-template name="contests">
                    <xsl:with-param name="level2"><xsl:value-of select="$level2"/></xsl:with-param>
                    <xsl:with-param name="level3"><xsl:value-of select="$level3"/></xsl:with-param>
                </xsl:call-template>

<!-- FAQ -->
                <xsl:call-template name="support">
                    <xsl:with-param name="level2"><xsl:value-of select="$level2"/></xsl:with-param>
                    <xsl:with-param name="level3"><xsl:value-of select="$level3"/></xsl:with-param>
                </xsl:call-template>
            </table>

            <xsl:call-template name="simple_search"/>
            <xsl:call-template name="left_nav_btm_row"/>
        </xsl:when>

<!-- Educational Content begins -->
      <xsl:when test="/TC/Task='features'">
            <xsl:call-template name="left_nav_top_row" />
            <table width="180" cellspacing="0" cellpadding="0" border="0">
                <xsl:call-template name="competition_row"/>
                <xsl:call-template name="applet_row"/>
                <xsl:call-template name="my_home_row"/>
                <xsl:call-template name="sched_row"/>
                <xsl:call-template name="stats_row"/>

                <tr><td id="leftNavOn"><A class="leftOn"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/tc?module=Static&amp;d1=tutorials&amp;d2=index</xsl:attribute><img alt="" width="10" height="10" src="/i/nav_arrow_bottom.gif" border="0"/>Educational Content</A></td></tr>

<!-- Alg Tutorials -->
                <tr>
                    <td id="leftSubnav">
                        <xsl:attribute name="id">
                        <xsl:choose>
                        <xsl:when test="/TC/Command='alg_tutorials'">leftSubnavOn</xsl:when>
                        <xsl:otherwise>leftSubnav</xsl:otherwise>
                        </xsl:choose>
                        </xsl:attribute>
                        <A class="leftOn"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/tc?module=Static&amp;d1=tutorials&amp;d2=index</xsl:attribute>Algorithm Tutorials</A>
                    </td>
                </tr>

<!-- Features -->
                <tr>
                    <td id="leftSubnav">
                        <xsl:attribute name="id">
                        <xsl:choose>
      					<xsl:when test="/TC/Task='features'">leftSubnavOn</xsl:when>
                        <xsl:otherwise>leftSubnav</xsl:otherwise>
                        </xsl:choose>
                        </xsl:attribute>
                        <A class="leftOn"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=features&amp;c=index</xsl:attribute>Features</A>
                    </td>
                </tr>

<!-- Tutor Transcripts -->
                <tr>
                    <td id="leftSubnav">
                        <xsl:attribute name="id">
                        <xsl:choose>
                        <xsl:when test="/TC/Command='tutor_transcripts'">leftSubnavOn</xsl:when>
                        <xsl:otherwise>leftSubnav</xsl:otherwise>
                        </xsl:choose>
                        </xsl:attribute>
                        <A class="leftOn"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/tc?module=Static&amp;d1=tutor_transcripts&amp;d2=index</xsl:attribute>Tutor Transcripts</A>
                    </td>
                </tr>

                <xsl:call-template name="events_row"/>
                <xsl:call-template name="rtables_row"/>
                <xsl:call-template name="tc_gear_row"/>
                <xsl:call-template name="rules_row"/>
            </table>

            <xsl:call-template name="simple_search"/>
            <xsl:call-template name="left_nav_btm_row"/>
      </xsl:when>

<!-- Events begins -->
        <xsl:when test="/TC/Task='tournaments'">
            <xsl:call-template name="left_nav_top_row" />
            <table width="180" cellspacing="0" cellpadding="0" border="0">
                <xsl:call-template name="competition_row"/>
                <xsl:call-template name="applet_row"/>
                <xsl:call-template name="my_home_row"/>
                <xsl:call-template name="sched_row"/>
                <xsl:call-template name="stats_row"/>
                <xsl:call-template name="education_row"/>

                <tr>
                    <td id="leftNavOn">
                        <A class="leftOn"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=tournaments&amp;c=tourny_index</xsl:attribute><img alt="" width="10" height="10" src="/i/nav_arrow_bottom.gif" border="0"/>Events</A>
                    </td>
                </tr>

<!-- Tournaments -->
                <tr>
                    <td id="leftSubnav">
                        <xsl:attribute name="id">
                        <xsl:choose>
                            <xsl:when test="starts-with(/TC/Command,'tco03_')">leftSubnavOn</xsl:when>
                            <xsl:when test="starts-with(/TC/Command,'2002tccc_')">leftSubnavOn</xsl:when>
                            <xsl:when test="starts-with(/TC/Command,'invit02_')">leftSubnavOn</xsl:when>
                            <xsl:when test="starts-with(/TC/Command,'tccc02_')">leftSubnavOn</xsl:when>
                            <xsl:when test="starts-with(/TC/Command,'tccc03_')">leftSubnavOn</xsl:when>
                            <xsl:when test="starts-with(/TC/Command,'tourny_')">leftSubnavOn</xsl:when>
                            <xsl:when test="starts-with(/TC/Command,'tourney_')">leftSubnavOn</xsl:when>
                            <xsl:when test="starts-with(/TC/Command,'top_')">leftSubnavOn</xsl:when>
                            <xsl:otherwise>leftSubnav</xsl:otherwise>
                        </xsl:choose>
                        </xsl:attribute>
                        <A class="leftOn" href="/?&amp;t=tournaments&amp;c=tourny_index">Tournaments</A>
                    </td>
                </tr>
                <tr>
                    <td id="leftSubnav">
                        <A class="leftOn" href="/tc?&amp;module=CRPFStatic&amp;d1=crpf&amp;d2=crpf_photos">Charity</A>
                    </td>
                </tr>
                <tr>
                    <td id="leftSubnav">
                        <A class="leftOn" href="/pl/">Private Label</A>
                    </td>
                </tr>

                <xsl:call-template name="rtables_row"/>
                <xsl:call-template name="tc_gear_row"/>
                <xsl:call-template name="rules_row"/>
            </table>

            <xsl:call-template name="simple_search"/>
            <xsl:call-template name="left_nav_btm_row"/>
      </xsl:when>
<!-- Events ends -->

<!-- Support/FAQ begins -->
      <xsl:when test="/TC/Task='support'">
            <xsl:call-template name="left_nav_top_row" />
            <table width="180" cellspacing="0" cellpadding="0" border="0">
                <xsl:call-template name="competition_row"/>
                <xsl:call-template name="applet_row"/>
                <xsl:call-template name="my_home_row"/>
                <xsl:call-template name="sched_row"/>
                <xsl:call-template name="stats_row"/>
                <xsl:call-template name="education_row"/>
                <xsl:call-template name="events_row"/>
                <xsl:call-template name="rtables_row"/>
                <xsl:call-template name="tc_gear_row"/>

                <tr><td id="leftNavOn"><A class="leftOn"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/tc?module=Static&amp;d1=help&amp;d2=index</xsl:attribute><img alt="" width="10" height="10" src="/i/nav_arrow_bottom.gif" border="0"/>Support / FAQs</A></td></tr>

<!-- Alg Competition Guide -->
                <tr>
                    <td id="leftSubnav">
                        <xsl:attribute name="id">
                        <xsl:choose>
                        <xsl:when test="/TC/Command='competition_guide'">leftSubnavOn</xsl:when>
                        <xsl:otherwise>leftSubnav</xsl:otherwise>
                        </xsl:choose>
                        </xsl:attribute>
                        <A class="leftOn"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/tc?module=Static&amp;d1=help&amp;d2=index</xsl:attribute>Algorithm Competition Guide</A>
                    </td>
                </tr>

<!-- General FAQs -->
                <tr>
                    <td id="leftSubnav">
                        <xsl:attribute name="id">
                        <xsl:choose>
                        <xsl:when test="/TC/Command='index'">leftSubnavOn</xsl:when>
                        <xsl:otherwise>leftSubnav</xsl:otherwise>
                        </xsl:choose>
                        </xsl:attribute>
                        <A class="leftOn"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=support&amp;c=index</xsl:attribute>General FAQ</A>
                    </td>
                </tr>

<!-- Competition FAQs -->
                <tr>
                    <td id="leftSubnav">
                        <xsl:attribute name="id">
                        <xsl:choose>
                        <xsl:when test="/TC/Command='comp_faq'">leftSubnavOn</xsl:when>
                        <xsl:otherwise>leftSubnav</xsl:otherwise>
                        </xsl:choose>
                        </xsl:attribute>
                        <A class="leftOn"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=support&amp;c=comp_faq</xsl:attribute>Competition FAQ</A>
                    </td>
                </tr>

<!-- Forms W-9 &amp; W-8BEN FAQs -->
                <tr>
                    <td id="leftSubnav">
                        <xsl:attribute name="id">
                        <xsl:choose>
                        <xsl:when test="/TC/Command='form_faq'">leftSubnavOn</xsl:when>
                        <xsl:otherwise>leftSubnav</xsl:otherwise>
                        </xsl:choose>
                        </xsl:attribute>
                        <A class="leftOn"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=support&amp;c=form_faq</xsl:attribute>Forms W-9 &amp; W-8BEN FAQ</A>
                    </td>
                </tr>

<!-- Ratings Overview -->
                <tr>
                    <td id="leftSubnav">
                        <xsl:attribute name="id">
                        <xsl:choose>
                        <xsl:when test="/TC/Command='ratings'">leftSubnavOn</xsl:when>
                        <xsl:otherwise>leftSubnav</xsl:otherwise>
                        </xsl:choose>
                        </xsl:attribute>
                        <A class="leftOn"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=support&amp;c=ratings</xsl:attribute>Ratings Overview</A>
                    </td>
                </tr>

<!-- Charity Donations -->
                <tr>
                    <td id="leftSubnav">
                        <xsl:attribute name="id">
                        <xsl:choose>
                        <xsl:when test="/TC/Command='charities'">leftSubnavOn</xsl:when>
                        <xsl:otherwise>leftSubnav</xsl:otherwise>
                        </xsl:choose>
                        </xsl:attribute>
                        <A class="leftOn"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=support&amp;c=charities</xsl:attribute>Charity Donations</A>
                    </td>
                </tr>

<!-- Sample Problem Statements -->
                <tr>
                    <td id="leftSubnav">
                        <xsl:attribute name="id">
                        <xsl:choose>
                        <xsl:when test="/TC/Command='sample_problems'">leftSubnavOn</xsl:when>
                        <xsl:otherwise>leftSubnav</xsl:otherwise>
                        </xsl:choose>
                        </xsl:attribute>
                        <A class="leftOn"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=support&amp;c=sample_problems</xsl:attribute>Sample Problem Statements</A>
                    </td>
                </tr>
            </table>

            <xsl:call-template name="simple_search"/>
            <xsl:call-template name="left_nav_btm_row"/>
        </xsl:when>
<!-- Support/FAQs begins -->

<!-- About Us begins -->
        <xsl:when test="/TC/Task='about_tc'or/TC/Task='tces'">
            <xsl:call-template name="left_nav_top_row" />
            <table width="180" cellspacing="0" cellpadding="0" border="0">
                <xsl:call-template name="tc_info_row"/>

                <tr>
                    <td id="leftNavOn">
                        <A class="leftOn"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/tc?module=Static&amp;d1=about&amp;d2=index</xsl:attribute><img alt="" width="10" height="10" src="/i/nav_arrow_bottom.gif" border="0"/>About TopCoder</A></td>
                </tr>


<!-- Members -->
                <tr>
                    <td id="leftSubnav">
                        <xsl:attribute name="id">
                        <xsl:choose>
                        <xsl:when test="/TC/Command='index'">leftSubnavOn</xsl:when>
                        <xsl:otherwise>leftSubnav</xsl:otherwise>
                        </xsl:choose>
                        </xsl:attribute>
                        <A class="leftOn"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/tc?module=Static&amp;d1=about&amp;d2=index</xsl:attribute>Overview</A>
                    </td>
                </tr>

<!-- Members -->
                <tr>
                    <td id="leftSubnav">
                        <xsl:attribute name="id">
                        <xsl:choose>
                        <xsl:when test="/TC/Command='membr_whyjoin'">leftSubnavOn</xsl:when>
                        <xsl:otherwise>leftSubnav</xsl:otherwise>
                        </xsl:choose>
                        </xsl:attribute>
                        <A class="leftOn"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/tc?module=Static&amp;d1=about&amp;d2=whyjoin</xsl:attribute>Why Join TopCoder?</A>
                    </td>
                </tr>

<!-- Jobs at TopCoder -->
                <tr>
                    <td id="leftSubnav">
                        <xsl:attribute name="id">
                        <xsl:choose>
                        <xsl:when test="/TC/Command='jobs'">leftSubnavOn</xsl:when>
                        <xsl:otherwise>leftSubnav</xsl:otherwise>
                        </xsl:choose>
                        </xsl:attribute>
                        <A class="leftOn"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/tc?module=Static&amp;d1=about&amp;d2=jobs</xsl:attribute>Working at TopCoder</A>
                    </td>
                </tr>

<!-- Terms -->
                <tr>
                    <td id="leftSubnav">
                        <xsl:attribute name="id">
                        <xsl:choose>
                        <xsl:when test="/TC/Command='terms'">leftSubnavOn</xsl:when>
                        <xsl:otherwise>leftSubnav</xsl:otherwise>
                        </xsl:choose>
                        </xsl:attribute>
                        <A class="leftOn"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/tc?module=Static&amp;d1=about&amp;d2=whyjoin</xsl:attribute>Terms, Revisions</A>
                    </td>
                </tr>

<!-- Privacy -->
                <tr>
                    <td id="leftSubnav">
                        <xsl:attribute name="id">
                        <xsl:choose>
                        <xsl:when test="/TC/Command='privacy'">leftSubnavOn</xsl:when>
                        <xsl:otherwise>leftSubnav</xsl:otherwise>
                        </xsl:choose>
                        </xsl:attribute>
                        <A class="leftOn"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/tc?module=Static&amp;d1=about&amp;d2=privacy</xsl:attribute>Privacy Policy</A>
                    </td>
                </tr>

                <xsl:call-template name="reviewboard_row"/>
                <xsl:call-template name="press_row"/>
                <xsl:call-template name="management_row"/>
                <xsl:call-template name="contacts_row"/>
            </table>

            <xsl:call-template name="simple_search"/>
            <xsl:call-template name="left_nav_btm_row"/>
        </xsl:when>
<!-- About Us ends -->

<!-- Press Room begins -->
        <xsl:when test="/TC/Task='news_events'">
            <xsl:call-template name="left_nav_top_row" />
            <table width="180" cellspacing="0" cellpadding="0" border="0">
                <xsl:call-template name="tc_info_row"/>
                <xsl:call-template name="about_row"/>
                <xsl:call-template name="reviewboard_row"/>

                <tr>
                    <td id="leftNavSelect"><A class="leftOn"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=news_events&amp;c=index</xsl:attribute><img alt="" width="10" height="10" src="/i/clear.gif" border="0"/>Press Room</A></td>
                </tr>

                <xsl:call-template name="management_row"/>
                <xsl:call-template name="contacts_row"/>
          </table>

            <xsl:call-template name="simple_search"/>
            <xsl:call-template name="left_nav_btm_row"/>
        </xsl:when>
<!-- Press Room ends -->

<!-- Contact Us begins -->
        <xsl:when test="/TC/Task='contacts'">
            <xsl:call-template name="left_nav_top_row" />
            <table width="180" cellspacing="0" cellpadding="0" border="0">
                <xsl:call-template name="tc_info_row"/>
                <xsl:call-template name="about_row"/>
                <xsl:call-template name="reviewboard_row"/>
                <xsl:call-template name="press_row"/>
                <xsl:call-template name="management_row"/>

<!-- Contact Us -->
                <tr>
                    <td id="leftNavSelect"><A class="leftOn"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=contacts&amp;c=index</xsl:attribute><img alt="" width="10" height="10" src="/i/clear.gif" border="0"/>Contact Us</A></td>
                </tr>
            </table>

            <xsl:call-template name="simple_search"/>
            <xsl:call-template name="left_nav_btm_row"/>
        </xsl:when>
<!-- Contact Us ends -->


<!-- no task -->
        <xsl:when test="/TC/Task=''">
            <xsl:choose>
                <xsl:when test="/TC/LoggedIn='true'">
                     <!-- <xsl:call-template name="my_stats"/> -->
                </xsl:when>
                <xsl:otherwise>
                     <!-- <xsl:call-template name="module_login"/> -->
                </xsl:otherwise>
            </xsl:choose>

            <xsl:call-template name="left_nav_top_row" />
            <table width="180" cellspacing="0" cellpadding="0" border="0">
                <xsl:call-template name="competition_row"/>
                <xsl:call-template name="applet_row"/>
                <xsl:call-template name="my_home_row"/>
                <xsl:call-template name="sched_row"/>
                <xsl:call-template name="stats_row"/>
                <xsl:call-template name="education_row"/>
                <xsl:call-template name="events_row"/>
                <xsl:call-template name="rtables_row"/>
                <xsl:call-template name="tc_gear_row"/>
                <xsl:call-template name="rules_row"/>
            </table>

            <xsl:call-template name="srm_dates"/>
            <xsl:call-template name="calendar"/>
            <xsl:call-template name="simple_search"/>
            <xsl:call-template name="left_nav_btm_row"/>
        </xsl:when>
<!-- no task -->


        <xsl:otherwise>
            <xsl:call-template name="left_nav_top_row" />
            <table width="180" cellspacing="0" cellpadding="0" border="0">
                <xsl:call-template name="competition_row"/>
                <xsl:call-template name="applet_row"/>
                <xsl:call-template name="my_home_row"/>
                <xsl:call-template name="sched_row"/>
                <xsl:call-template name="stats_row"/>
                <xsl:call-template name="education_row"/>
                <xsl:call-template name="events_row"/>
                <xsl:call-template name="rtables_row"/>
                <xsl:call-template name="tc_gear_row"/>
                <xsl:call-template name="rules_row"/>
            </table>

            <xsl:call-template name="simple_search"/>
            <xsl:call-template name="left_nav_btm_row"/>
        </xsl:otherwise>
    </xsl:choose>
</xsl:template>

<!-- Navigation Rows Below -->
    <xsl:template name="left_nav_top_row">
        <img alt="" width="180" height="5" src="/i/spacer.gif" border="0" /><br/>
        <img alt="" width="170" height="11" src="/i/left_nav_top.gif" border="0" /><br/>
    </xsl:template>

    <xsl:template name="left_nav_btm_row">
        <img alt="" width="180" height="23" src="/i/left_nav_btm.gif" border="0"/><br /><br />
        <div align="center"><img src="/i/logo_ghosted_bracket.gif" width="160" height="77" alt="[ TopCoder ]" vspace="10" border="0"/></div><br /><br />
    </xsl:template>

    <xsl:template name="member_features">
        <xsl:choose>
            <xsl:when test="/TC/LoggedIn='true'">
                <xsl:call-template name="my_stats"/>
            </xsl:when>
            <xsl:otherwise>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

<xsl:template name="competition_row">
                <tr><td id="leftNavTitle" >Competition:</td></tr>
</xsl:template>

<xsl:template name="development_row">
                <tr><td id="leftNavTitle" >Development:</td></tr>
</xsl:template>

<xsl:template name="read_row">
                <tr><td id="leftNavTitle" >Please Read:</td></tr>
</xsl:template>

<xsl:template name="applet_row">
                <tr><td id="leftNavApplet"><img alt="" width="10" height="10" src="/i/nav_arrow_right.gif" border="0"/><A href="Javascript:arena()" class="left">Launch Arena Applet</A></td></tr>
</xsl:template>

<xsl:template name="my_home_row">
    <xsl:if test="/TC/LoggedIn='true'">
        <tr><td id="leftNav"><img alt="" width="10" height="10" src="/i/nav_arrow_right.gif" border="0"/><A class="left"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/tc?module=Static&amp;d1=my_home&amp;d2=index</xsl:attribute>$HOME</A></td></tr>
    </xsl:if>
</xsl:template>

<xsl:template name="sched_row">
                <tr><td id="leftNav"><img alt="" width="10" height="10" src="/i/nav_arrow_right.gif" border="0"/><A class="left"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=schedule&amp;c=index</xsl:attribute>Schedule</A></td></tr>
</xsl:template>

<xsl:template name="stats_row">
                <tr><td id="leftNav"><img alt="" width="10" height="10" src="/i/nav_arrow_right.gif" border="0"/><A class="left"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/stat?&amp;c=round_overview</xsl:attribute>Statistics</A></td></tr>
</xsl:template>

<xsl:template name="education_row">
                <tr><td id="leftNav"><img alt="" width="10" height="10" src="/i/nav_arrow_right.gif" border="0"/><A class="left"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/tc?module=Static&amp;d1=tutorials&amp;d2=index</xsl:attribute>Educational Content</A></td></tr>
</xsl:template>

<xsl:template name="dev_overview_row">
                <tr><td id="leftNav"><img alt="" width="10" height="10" src="/i/nav_arrow_right.gif" border="0"/><A class="left"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?t=development&amp;c=index</xsl:attribute>Overview</A></td></tr>
</xsl:template>

<xsl:template name="dev_paid_row">
                <tr><td id="leftNav"><img alt="" width="10" height="10" src="/i/nav_arrow_right.gif" border="0"/><A class="left"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?t=development&amp;c=index</xsl:attribute>How to Get Paid</A></td></tr>
</xsl:template>

<xsl:template name="dev_roundtables_row">
                <tr><td id="leftNav"><img alt="" width="10" height="10" src="/i/nav_arrow_right.gif" border="0"/><A class="left"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?t=development&amp;c=index</xsl:attribute>TC Developer Round Tables</A></td></tr>
</xsl:template>

<xsl:template name="dev_forums_row">
                <tr><td id="leftNav"><img alt="" width="10" height="10" src="/i/nav_arrow_right.gif" border="0"/><A class="left"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?t=development&amp;c=index</xsl:attribute>TCS Developer Forums</A></td></tr>
</xsl:template>

<xsl:template name="components_row">
                <tr><td id="leftNav"><img alt="" width="10" height="10" src="/i/nav_arrow_right.gif" border="0"/><A class="left"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?t=development&amp;c=components</xsl:attribute>Components</A></td></tr>
</xsl:template>

<xsl:template name="events_row">
                <tr><td id="leftNav"><img alt="" width="10" height="10" src="/i/nav_arrow_right.gif" border="0"/><A class="left"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=tournaments&amp;c=tourny_index</xsl:attribute>Events</A></td></tr>
</xsl:template>

<xsl:template name="rtables_row">
                <tr><td id="leftNav"><img alt="" width="10" height="10" src="/i/nav_arrow_right.gif" border="0"/><A class="left"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/rtables/index.jsp</xsl:attribute>Round Tables (Forums)</A></td></tr>
</xsl:template>

<xsl:template name="tc_gear_row">
                <tr><td id="leftNav"><img alt="" width="10" height="10" src="/i/nav_arrow_right.gif" border="0"/><A class="left"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/tc?module=Static&amp;d1=store&amp;d2=store_home</xsl:attribute>TopCoder Gear</A></td></tr>
</xsl:template>

<xsl:template name="rules_row">
                <tr><td id="leftNav" ><img alt="" width="10" height="10" src="/i/nav_arrow_right.gif" border="0"/><A class="left"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/tc?module=Static&amp;d1=help&amp;d2=index</xsl:attribute>Support / FAQs</A></td></tr>
</xsl:template>

<xsl:template name="reg_row">
                <tr><td id="leftNav" ><img alt="" width="10" height="10" src="/i/nav_arrow_right.gif" border="0"/><A class="left"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/Registration</xsl:attribute>Register</A></td></tr>
</xsl:template>

<xsl:template name="new_mbr_row">
                <tr><td id="leftNav" ><img alt="" width="10" height="10" src="/i/nav_arrow_right.gif" border="0"/><A class="left"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=new_mbr&amp;c=index</xsl:attribute>New Member Tour</A></td></tr>
</xsl:template>

<!-- TopCoder Info begins -->
<xsl:template name="tc_info_row">
                <tr><td id="leftNavTitle" >TopCoder Info:</td></tr>
</xsl:template>

<xsl:template name="about_row">
                <tr><td id="leftNav" ><img alt="" width="10" height="10" src="/i/nav_arrow_right.gif" border="0"/><A class="left"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/tc?module=Static&amp;d1=about&amp;d2=index</xsl:attribute>About TopCoder</A></td></tr>
</xsl:template>

<xsl:template name="reviewboard_row">
                <tr><td id="leftNav" ><img alt="" width="10" height="10" src="/i/nav_arrow_right.gif" border="0"/><A class="left" href="/tc?module=ReviewBoard&amp;ph=112">Review Boards</A></td></tr>
</xsl:template>

<xsl:template name="press_row">
                <tr><td id="leftNav" ><img alt="" width="10" height="10" src="/i/nav_arrow_right.gif" border="0"/><A class="left"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=news_events&amp;c=index</xsl:attribute>Press Room</A></td></tr>
</xsl:template>

<xsl:template name="management_row">
                <tr><td id="leftNav" ><img alt="" width="10" height="10" src="/i/nav_arrow_right.gif" border="0"/><A class="left"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/tc?module=Static&amp;d1=about&amp;d2=management</xsl:attribute>Management Team</A></td></tr>
</xsl:template>

<xsl:template name="contacts_row">
                <tr><td id="leftNav" ><img alt="" width="10" height="10" src="/i/nav_arrow_right.gif" border="0"/><A class="left"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=contacts&amp;c=index</xsl:attribute>Contact Us</A></td></tr>
</xsl:template>

<xsl:template name="components">
    <xsl:param name="level2"></xsl:param>
    <xsl:param name="level3"></xsl:param>
    <!-- Components: -->
    <tr>
        <td id="leftSubnav">
            <xsl:attribute name="id">
                <xsl:choose>
                    <xsl:when test="$level2='components'">leftNavOn</xsl:when>
                    <xsl:otherwise>leftNav</xsl:otherwise>
              </xsl:choose>
            </xsl:attribute>
            <A class="leftOn">
                <xsl:attribute name="class">
                    <xsl:choose>
                        <xsl:when test="$level2='components'">leftOn</xsl:when>
                        <xsl:otherwise>left</xsl:otherwise>
                    </xsl:choose>
                </xsl:attribute>
            <xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?t=development&amp;c=comp_projects</xsl:attribute>
            <img width="10" height="10" alt="" border="0" src="/i/nav_arrow_bottom.gif">
                 <xsl:attribute name="src">
                    <xsl:choose>
                        <xsl:when test="$level2='components'">/i/nav_arrow_bottom.gif</xsl:when>
                        <xsl:otherwise>/i/nav_arrow_right.gif</xsl:otherwise>
                    </xsl:choose>
                </xsl:attribute>
            </img>Components</A>
        </td>
    </tr>

        <xsl:if test="$level2='components'">
            <!-- Open Projects -->
                            <tr>
                                <td id="leftSubnav">
                                    <xsl:attribute name="id">
                                    <xsl:choose>
                                        <xsl:when test="$level3='comp_projects'">leftSubnavOn</xsl:when>
                                        <xsl:otherwise>leftSubnav</xsl:otherwise>
                                    </xsl:choose>
                                    </xsl:attribute>
                                    <A class="leftOn"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?t=development&amp;c=comp_projects</xsl:attribute>Projects</A>
                                </td>
                            </tr>

            <!-- Review Opportunities -->
                            <tr>
                                <td id="leftSubnav">
                                    <xsl:attribute name="id">
                                    <xsl:choose>
                                        <xsl:when test="$level3='comp_reviews'">leftSubnavOn</xsl:when>
                                        <xsl:otherwise>leftSubnav</xsl:otherwise>
                                    </xsl:choose>
                                    </xsl:attribute>
                                    <A class="leftOn"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/tc?module=ViewReviewProjects</xsl:attribute>Review Opportunities</A>
                                </td>
                            </tr>
              <!-- Project Winners -->
                            <tr>
                                <td id="leftSubnav">
                                    <xsl:attribute name="id">
                                    <xsl:choose>
                                        <xsl:when test="$level3='components'">leftSubnavOn</xsl:when>
                                        <xsl:otherwise>leftSubnav</xsl:otherwise>
                                    </xsl:choose>
                                    </xsl:attribute>
                                    <A class="leftOn"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?t=development&amp;c=components</xsl:attribute>Recent Project Winners</A>
                                </td>
                            </tr>

            <!-- Project Submit and Review -->
                            <tr>
                                <td id="leftSubnav">
                                    <xsl:attribute name="id">
                                    <xsl:choose>
                                        <xsl:when test="$level3='comp_project_submit'">leftSubnavOn</xsl:when>
                                        <xsl:otherwise>leftSubnav</xsl:otherwise>
                                    </xsl:choose>
                                    </xsl:attribute>
                                    <A class="leftOn"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/SoftwareHost"/>/review</xsl:attribute>Project Submit &amp; Review</A>
                                </td>
                            </tr>

            <!-- Project Status -->
                            <tr>
                                <td id="leftSubnav">
                                    <xsl:attribute name="id">
                                    <xsl:choose>
                                        <xsl:when test="$level3='comp_archive'">leftSubnavOn</xsl:when>
                                        <xsl:otherwise>leftSubnav</xsl:otherwise>
                                    </xsl:choose>
                                    </xsl:attribute>
                                    <A class="leftOn"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?t=development&amp;c=comp_archive</xsl:attribute>Project Status</A>
                                </td>
                            </tr>

            <!-- Development Methodology -->
                            <tr>
                                <td id="leftSubnav">
                                    <xsl:attribute name="id">
                                    <xsl:choose>
                                        <xsl:when test="$level3='comp_meth'">leftSubnavOn</xsl:when>
                                        <xsl:otherwise>leftSubnav</xsl:otherwise>
                                    </xsl:choose>
                                    </xsl:attribute>
                                    <A class="leftOn"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?t=development&amp;c=comp_meth</xsl:attribute>Development Methodology</A>
                                </td>
                            </tr>

        </xsl:if>
    </xsl:template>

<!-- Contests -->
    <xsl:template name="contests">
        <xsl:param name="level2"></xsl:param>
        <xsl:param name="level3"></xsl:param>
    <tr>
        <td id="leftSubnav">
            <xsl:attribute name="id">
                <xsl:choose>
                    <xsl:when test="$level2='contests'">leftNavOn</xsl:when>
                    <xsl:otherwise>leftNav</xsl:otherwise>
              </xsl:choose>
            </xsl:attribute>
            <A class="leftOn">
                <xsl:attribute name="class">
                    <xsl:choose>
                        <xsl:when test="$level2='contests'">leftOn</xsl:when>
                        <xsl:otherwise>left</xsl:otherwise>
                    </xsl:choose>
                </xsl:attribute>
            <xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/tc?module=Static&amp;d1=dev&amp;d2=usdc_overview</xsl:attribute>
            <img width="10" height="10" alt="" border="0" src="/i/nav_arrow_bottom.gif">
                 <xsl:attribute name="src">
                    <xsl:choose>
                        <xsl:when test="$level2='contests'">/i/nav_arrow_bottom.gif</xsl:when>
                        <xsl:otherwise>/i/nav_arrow_right.gif</xsl:otherwise>
                    </xsl:choose>
                </xsl:attribute>
            </img>Contests</A>
        </td>
    </tr>

    <xsl:if test="$level2='contests'">

<!-- ULTIMATE!! -->
    <tr>
        <td id="leftSubnav">
            <xsl:attribute name="id">
            <xsl:choose>
                <xsl:when test="$level3='tco_components'">leftSubnavOn</xsl:when>
                <xsl:otherwise>leftSubnav</xsl:otherwise>
            </xsl:choose>
            </xsl:attribute>
            <A class="leftOn"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/tc?module=Static&amp;d1=dev&amp;d2=usdc_overview</xsl:attribute>Ultimate Contest</A>
        </td>
    </tr>

<!-- Component Design Bonus Contest 2 -->
    <tr>
        <td id="leftSubnav">
            <xsl:attribute name="id">
            <xsl:choose>
                <xsl:when test="$level3='tco_components'">leftSubnavOn</xsl:when>
                <xsl:otherwise>leftSubnav</xsl:otherwise>
            </xsl:choose>
            </xsl:attribute>
            <A class="leftOn"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/tc?module=Static&amp;d1=tournaments&amp;d2=tco03&amp;d3=tco03_comp_overview</xsl:attribute>TCO Component Contest</A>
        </td>
    </tr>

<!-- Component Design Bonus Contest 2 -->
    <tr>
        <td id="leftSubnav">
            <xsl:attribute name="id">
            <xsl:choose>
                <xsl:when test="$level3='des_bonus_contest_2'">leftSubnavOn</xsl:when>
                <xsl:otherwise>leftSubnav</xsl:otherwise>
            </xsl:choose>
            </xsl:attribute>
            <A class="leftOn"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?t=development&amp;c=des_bonus_contest_2</xsl:attribute>Design Bonus Contest 2</A>
        </td>
    </tr>

<!-- Component Design Bonus Contest 1 -->
    <tr>
        <td id="leftSubnav">
            <xsl:attribute name="id">
            <xsl:choose>
                <xsl:when test="$level3='bonus_contest_0303'">leftSubnavOn</xsl:when>
                <xsl:otherwise>leftSubnav</xsl:otherwise>
            </xsl:choose>
            </xsl:attribute>
            <A class="leftOn"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?t=development&amp;c=bonus_contest_0303</xsl:attribute>Design Bonus Contest 1</A>
        </td>
    </tr>
        </xsl:if>
  </xsl:template>

<!-- FAQ -->
    <xsl:template name="support">
        <xsl:param name="level2"></xsl:param>
        <xsl:param name="level3"></xsl:param>
    <tr>
        <td id="leftSubnav">
            <xsl:attribute name="id">
                <xsl:choose>
                    <xsl:when test="$level2='support'">leftNavOn</xsl:when>
                    <xsl:otherwise>leftNav</xsl:otherwise>
              </xsl:choose>
            </xsl:attribute>
            <A class="leftOn">
                <xsl:attribute name="class">
                    <xsl:choose>
                        <xsl:when test="$level2='support'">leftOn</xsl:when>
                        <xsl:otherwise>left</xsl:otherwise>
                    </xsl:choose>
                </xsl:attribute>
            <xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=development&amp;c=getting_started</xsl:attribute>
            <img width="10" height="10" alt="" border="0" src="/i/nav_arrow_bottom.gif">
                 <xsl:attribute name="src">
                    <xsl:choose>
                        <xsl:when test="$level2='support'">/i/nav_arrow_bottom.gif</xsl:when>
                        <xsl:otherwise>/i/nav_arrow_right.gif</xsl:otherwise>
                    </xsl:choose>
                </xsl:attribute>
            </img>Support / FAQs</A>
        </td>
    </tr>

    <xsl:if test="$level2='support'">

<!-- Getting Started -->
    <tr>
        <td id="leftSubnav">
            <xsl:attribute name="id">
            <xsl:choose>
                <xsl:when test="$level3='getStarted'">leftSubnavOn</xsl:when>
                <xsl:otherwise>leftSubnav</xsl:otherwise>
            </xsl:choose>
            </xsl:attribute>
            <A class="leftOn"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=development&amp;c=getting_started</xsl:attribute>Getting Started</A>
       </td>
    </tr>

<!-- Component Documentation -->
    <tr>
        <td id="leftSubnav">
            <xsl:attribute name="id">
            <xsl:choose>
                <xsl:when test="$level3='compDocumentation'">leftSubnavOn</xsl:when>
                <xsl:otherwise>leftSubnav</xsl:otherwise>
            </xsl:choose>
            </xsl:attribute>
            <A class="leftOn"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/tc?module=Static&amp;d1=dev&amp;d2=support&amp;d3=compDocumentation</xsl:attribute>Component Documentation</A>
        </td>
    </tr>

<!-- Ratings -->
    <tr>
        <td id="leftSubnav">
            <xsl:attribute name="id">
            <xsl:choose>
                <xsl:when test="$level3='ratings'">leftSubnavOn</xsl:when>
                <xsl:otherwise>leftSubnav</xsl:otherwise>
            </xsl:choose>
            </xsl:attribute>
            <A class="leftOn"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/tc?module=Static&amp;d1=dev&amp;d2=support&amp;d3=ratings</xsl:attribute>Rating System</A>
        </td>
    </tr>

<!-- dev faq -->
    <tr>
        <td id="leftSubnav">
            <xsl:attribute name="id">
            <xsl:choose>
                <xsl:when test="$level3='reliability'">leftSubnavOn</xsl:when>
                <xsl:otherwise>leftSubnav</xsl:otherwise>
            </xsl:choose>
            </xsl:attribute>
            <A class="leftOn"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/tc?module=Static&amp;d1=dev&amp;d2=support&amp;d3=reliability</xsl:attribute>Reliability Rating</A>
        </td>
    </tr>

<!-- How to Get Paid -->
    <tr>
        <td id="leftSubnav">
            <xsl:attribute name="id">
            <xsl:choose>
                <xsl:when test="$level3='getPaid'">leftSubnavOn</xsl:when>
                <xsl:otherwise>leftSubnav</xsl:otherwise>
            </xsl:choose>
            </xsl:attribute>
            <A class="leftOn"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=development&amp;c=dev_payment</xsl:attribute>How to Get Paid</A>
        </td>
    </tr>

        </xsl:if>
  </xsl:template>

<!-- Nav ends -->
</xsl:stylesheet>
