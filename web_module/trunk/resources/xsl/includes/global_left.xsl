<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:import href="../includes/modules/calendar.xsl"/>
    <xsl:import href="../includes/modules/simple_search.xsl"/>
    <xsl:import href="../includes/modules/corp_nav.xsl"/>
    <xsl:import href="../includes/modules/intro.xsl"/>
    <xsl:import href="../includes/modules/module_login.xsl"/>
    <xsl:import href="../includes/modules/my_stats.xsl"/>
    <xsl:import href="../includes/modules/countries2.xsl"/>
    <xsl:import href="../includes/modules/srm_dates.xsl"/>
    <xsl:template name="global_left">

    <xsl:param name="level1"></xsl:param>
    <xsl:param name="level2"></xsl:param>

<!-- Home page begins -->
    <xsl:choose>
        <xsl:when test="/TC/Task='public_home'">
            <xsl:call-template name="left_nav_top_row" />
            <table width="180" cellspacing="0" cellpadding="0" border="0">
                <xsl:call-template name="competition_row"/>
                <xsl:call-template name="applet_row"/>
                <xsl:call-template name="sched_row"/>
                <xsl:call-template name="stats_row"/>
                <xsl:call-template name="feat_row"/>
                <xsl:call-template name="events_row"/>
                <xsl:call-template name="rtables_row"/>
                <xsl:call-template name="rules_row"/>
                <xsl:call-template name="tc_info_row"/>
                <xsl:call-template name="about_row"/>
                <xsl:call-template name="reviewboard_row"/>
                <xsl:call-template name="press_row"/>
                <xsl:call-template name="contacts_row"/>
            </table>

            <xsl:call-template name="srm_dates"/>
            <xsl:call-template name="calendar"/>
            <xsl:call-template name="simple_search"/>
            <xsl:call-template name="left_nav_btm_row" />

        </xsl:when>

        <xsl:when test="/TC/Task='home'">
            <xsl:call-template name="left_nav_top_row" />
            <table width="180" cellspacing="0" cellpadding="0" border="0">
                <xsl:call-template name="competition_row"/>
                <xsl:call-template name="applet_row"/>
                <xsl:call-template name="sched_row"/>
                <xsl:call-template name="stats_row"/>
                <xsl:call-template name="feat_row"/>
                <xsl:call-template name="events_row"/>
                <xsl:call-template name="rtables_row"/>
                <xsl:call-template name="rules_row"/>
                <xsl:call-template name="tc_info_row"/>
                <xsl:call-template name="about_row"/>
                <xsl:call-template name="reviewboard_row"/>
                <xsl:call-template name="press_row"/>
                <xsl:call-template name="contacts_row"/>
            </table>

            <xsl:call-template name="srm_dates"/>
            <xsl:call-template name="calendar"/>
            <xsl:call-template name="simple_search"/>
            <xsl:call-template name="left_nav_btm_row" />
        </xsl:when>
<!-- Home page ends -->

<!-- Schedule begins -->
        <xsl:when test="/TC/Task='schedule'">
            <xsl:call-template name="left_nav_top_row" />
            <table width="180" cellspacing="0" cellpadding="0" border="0">
                <xsl:call-template name="competition_row"/>
                <xsl:call-template name="applet_row"/>

                <tr>
                    <td id="leftNavOn">
                        <xsl:attribute name="id">
                        <xsl:choose>
                            <xsl:when test="/TC/Command='index'">leftNavSelect</xsl:when>
                            <xsl:otherwise>leftNavOn</xsl:otherwise>
                        </xsl:choose>
                        </xsl:attribute>
                        <A class="leftOn"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=schedule&amp;c=index</xsl:attribute><img alt="" width="10" height="10" src="/i/nav_arrow_bottom.gif" border="0" />Schedule:</A>
                    </td>
                </tr>

                <xsl:call-template name="stats_row"/>
                <xsl:call-template name="feat_row"/>
                <xsl:call-template name="events_row"/>
                <xsl:call-template name="rtables_row"/>
                <xsl:call-template name="rules_row"/>
                <xsl:call-template name="tc_info_row"/>
                <xsl:call-template name="about_row"/>
                <xsl:call-template name="reviewboard_row"/>
                <xsl:call-template name="press_row"/>
                <xsl:call-template name="contacts_row"/>
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
                <xsl:call-template name="sched_row"/>

                <tr><td id="leftNavOn"><A class="leftOn"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/stat?&amp;c=round_overview</xsl:attribute><img alt="" width="10" height="10" src="/i/nav_arrow_bottom.gif" border="0" />Statistics</A></td></tr>

<!-- Round Overview -->
                <tr>
                    <td id="leftSubnav"><A class="leftOn"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/stat?&amp;c=round_overview</xsl:attribute>Round Overview</A></td>
                </tr>

<!-- Last Match Results -->
                <tr>
                    <td id="leftSubnav"><A class="leftOn"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/stat?&amp;c=last_match</xsl:attribute>Last Match Results</A></td>
                </tr>

<!-- Coder Rankings -->
                <tr>
                    <td id="leftSubnav"><A class="leftOn"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/stat?&amp;c=coder_ratings</xsl:attribute>Coder Rankings</A></td>
                </tr>

<!-- Overview -->
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

<!-- Overview -->
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
                    <td id="leftSubnav"><A class="leftOn"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?t=search</xsl:attribute>Advanced Member Search</A></td>
                </tr>

                <xsl:call-template name="feat_row"/>
                <xsl:call-template name="events_row"/>
                <xsl:call-template name="rtables_row"/>
                <xsl:call-template name="rules_row"/>
                <xsl:call-template name="tc_info_row"/>
                <xsl:call-template name="about_row"/>
                <xsl:call-template name="reviewboard_row"/>
                <xsl:call-template name="press_row"/>
                <xsl:call-template name="contacts_row"/>
            </table>

            <xsl:call-template name="simple_search"/>
            <xsl:call-template name="left_nav_btm_row"/>
        </xsl:when>
<!--  Statistics ends -->

<!-- Advanced Member Search begins -->
        <xsl:when test="/TC/Task='search'">
            <xsl:call-template name="left_nav_top_row" />
            <table width="180" cellspacing="0" cellpadding="0" border="0">
                <xsl:call-template name="competition_row"/>
                <xsl:call-template name="applet_row"/>
                <xsl:call-template name="sched_row"/>

                <tr><td id="leftNavOn"><A class="leftOn"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/stat?&amp;c=round_overview</xsl:attribute><img alt="" width="10" height="10" src="/i/nav_arrow_bottom.gif" border="0" />Statistics</A></td></tr>

<!-- Round Overview -->
                <tr>
                    <td id="leftSubnav"><A class="leftOn"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/stat?&amp;c=round_overview</xsl:attribute>Round Overview</A></td>
                </tr>

<!-- Last Match Results -->
                <tr>
                    <td id="leftSubnav"><A class="leftOn"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/stat?&amp;c=last_match</xsl:attribute>Last Match Results</A></td>
                </tr>

<!-- Coder Rankings -->
                <tr>
                    <td id="leftSubnav"><A class="leftOn"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/stat?&amp;c=coder_ratings</xsl:attribute>Coder Rankings</A></td>
                </tr>

<!-- Overview -->
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

<!-- Overview -->
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
                    <td id="leftSubnavOn"><A class="leftOn"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?t=search</xsl:attribute>Advanced Member Search</A></td>
                </tr>

                <xsl:call-template name="feat_row"/>
                <xsl:call-template name="events_row"/>
                <xsl:call-template name="rtables_row"/>
                <xsl:call-template name="rules_row"/>
                <xsl:call-template name="tc_info_row"/>
                <xsl:call-template name="about_row"/>
                <xsl:call-template name="reviewboard_row"/>
                <xsl:call-template name="press_row"/>
                <xsl:call-template name="contacts_row"/>
            </table>

            <xsl:call-template name="simple_search"/>
            <xsl:call-template name="left_nav_btm_row"/>
        </xsl:when>
<!--  Advanced Member Search ends -->

<!-- Features begins -->
        <xsl:when test="/TC/Task='features'">
            <xsl:call-template name="left_nav_top_row" />
            <table width="180" cellspacing="0" cellpadding="0" border="0">
                <xsl:call-template name="competition_row"/>
                <xsl:call-template name="applet_row"/>
                <xsl:call-template name="sched_row"/>
                <xsl:call-template name="stats_row"/>

                <tr>
                    <td id="leftNavOn"><A class="leftOn" href="/?&amp;t=features&amp;c=index"><img alt="" width="10" height="10" src="/i/nav_arrow_bottom.gif" border="0" />Features</A>
                    </td>
                </tr>

                <tr>
                    <td id="leftSubnav">
                        <xsl:attribute name="id">
                        <xsl:choose>
                            <xsl:when test="/TC/Command='index'">leftSubnavOn</xsl:when>
                            <xsl:otherwise>leftSubnav</xsl:otherwise>
                        </xsl:choose>
                        </xsl:attribute>
                        <A class="leftOn"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=features&amp;c=index</xsl:attribute>Archive</A>
                    </td>
                </tr>

                <tr>
                    <td id="leftSubnav">
                        <xsl:attribute name="id">
                        <xsl:choose>
                            <xsl:when test="/TC/Command='feat_topics'">leftSubnavOn</xsl:when>
                            <xsl:otherwise>leftSubnav</xsl:otherwise>
                        </xsl:choose>
                        </xsl:attribute>
                        <A class="leftOn"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=features&amp;c=feat_topics</xsl:attribute>Want to Write?</A>
                    </td>
                </tr>

                <xsl:call-template name="events_row"/>
                <xsl:call-template name="rtables_row"/>
                <xsl:call-template name="rules_row"/>
                <xsl:call-template name="tc_info_row"/>
                <xsl:call-template name="about_row"/>
                <xsl:call-template name="reviewboard_row"/>
                <xsl:call-template name="press_row"/>
                <xsl:call-template name="contacts_row"/>
            </table>

            <xsl:call-template name="simple_search"/>
            <xsl:call-template name="left_nav_btm_row"/>
        </xsl:when>
<!-- Features ends -->

<!-- Development-Overview Begins -->
        <xsl:when test="$level1='development'">
            <xsl:call-template name="left_nav_top_row" />
            <table width="180" cellspacing="0" cellpadding="0" border="0">
                <xsl:call-template name="development_row"/>
                <xsl:call-template name="applet_row"/>

<!-- Overview -->
                <tr>
                    <td id="leftSubnav">
                        <xsl:attribute name="id">
                        <xsl:choose>
                            <xsl:when test="$level2='index'">leftSubnavOn</xsl:when>
                            <xsl:otherwise>leftSubnav</xsl:otherwise>
                        </xsl:choose>
                        </xsl:attribute>
                        <A class="leftOn"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=development&amp;c=index</xsl:attribute>Overview</A>
                    </td>
                </tr>

<!-- How to Get Paid -->
                <tr>
                    <td id="leftSubnav">
                        <xsl:attribute name="id">
                        <xsl:choose>
                            <xsl:when test="$level2='dev_payment'">leftSubnavOn</xsl:when>
                            <xsl:otherwise>leftSubnav</xsl:otherwise>
                        </xsl:choose>
                        </xsl:attribute>
                        <A class="leftOn"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=development&amp;c=dev_payment</xsl:attribute>How to Get Paid</A>
                    </td>
                </tr>

<!-- Development Round Tables -->
                <tr>
                    <td id="leftSubnav">
                        <A class="leftOn"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/rtables/viewForum.jsp?forum=157655&amp;mc=239</xsl:attribute>TC Developer Round Tables</A>
                    </td>
                </tr>

<!-- TCS Developer Forums -->
                <tr>
                    <td id="leftSubnav">
                        <A class="leftOn"><xsl:attribute name="href">http://<xsl:value-of select="/TC/SoftwareHost"/>/forum/c_active_collab.jsp?ft=2</xsl:attribute>TCS Developer Forums</A>
                    </td>
                </tr>

<!-- Components: -->
                <tr><td id="leftNavSubtitle">Components:</td></tr>

<!-- Project Winners -->
                <tr>
                    <td id="leftSubnav">
                        <xsl:attribute name="id">
                        <xsl:choose>
                            <xsl:when test="$level2='components'">leftSubnavOn</xsl:when>
                            <xsl:otherwise>leftSubnav</xsl:otherwise>
                        </xsl:choose>
                        </xsl:attribute>
                        <A class="leftOn"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=development&amp;c=components</xsl:attribute>This Week's Project Winners</A>
                    </td>
                </tr>

<!-- Open Projects -->
                <tr>
                    <td id="leftSubnav">
                        <xsl:attribute name="id">
                        <xsl:choose>
                            <xsl:when test="$level2='comp_projects'">leftSubnavOn</xsl:when>
                            <xsl:otherwise>leftSubnav</xsl:otherwise>
                        </xsl:choose>
                        </xsl:attribute>
                        <A class="leftOn"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=development&amp;c=comp_projects</xsl:attribute>Open Projects</A>
                    </td>
                </tr>

<!-- Project Status -->
                <tr>
                    <td id="leftSubnav">
                        <xsl:attribute name="id">
                        <xsl:choose>
                            <xsl:when test="$level2='comp_archive'">leftSubnavOn</xsl:when>
                            <xsl:otherwise>leftSubnav</xsl:otherwise>
                        </xsl:choose>
                        </xsl:attribute>
                        <A class="leftOn"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=development&amp;c=comp_archive</xsl:attribute>Project Status</A>
                    </td>
                </tr>

<!-- Development Methodology -->
                <tr>
                    <td id="leftSubnav">
                        <xsl:attribute name="id">
                        <xsl:choose>
                            <xsl:when test="$level2='comp_meth'">leftSubnavOn</xsl:when>
                            <xsl:otherwise>leftSubnav</xsl:otherwise>
                        </xsl:choose>
                        </xsl:attribute>
                        <A class="leftOn"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=development&amp;c=comp_meth</xsl:attribute>Development Methodology</A>
                    </td>
                </tr>

<!-- Documentation and Samples -->
                <tr>
                    <td id="leftSubnav">
                        <xsl:attribute name="id">
                        <xsl:choose>
                            <xsl:when test="$level2='tcs_sample_docs'">leftSubnavOn</xsl:when>
                            <xsl:otherwise>leftSubnav</xsl:otherwise>
                        </xsl:choose>
                        </xsl:attribute>
                        <A class="leftOn"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=development&amp;c=tcs_sample_docs</xsl:attribute>Documentation and Sample Submissions</A>
                    </td>
                </tr>

<!-- Component Design Bonus Contest 2 -->
                <tr>
                    <td id="leftSubnav">
                        <xsl:attribute name="id">
                        <xsl:choose>
                            <xsl:when test="$level2='des_bonus_contest_2'">leftSubnavOn</xsl:when>
                            <xsl:otherwise>leftSubnav</xsl:otherwise>
                        </xsl:choose>
                        </xsl:attribute>
                        <A class="leftOn"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=development&amp;c=des_bonus_contest_2</xsl:attribute>Design Bonus Contest 2</A>
                    </td>
                </tr>

<!-- Component Design Bonus Contest 1 -->
                <tr>
                    <td id="leftSubnav">
                        <xsl:attribute name="id">
                        <xsl:choose>
                            <xsl:when test="$level2='bonus_contest_0303'">leftSubnavOn</xsl:when>
                            <xsl:otherwise>leftSubnav</xsl:otherwise>
                        </xsl:choose>
                        </xsl:attribute>
                        <A class="leftOn"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=development&amp;c=bonus_contest_0303</xsl:attribute>Design Bonus Contest 1</A>
                    </td>
                </tr>

<!-- Applications: -->
                <tr><td id="leftNavSubtitle">Applications:</td></tr>

<!-- Open Projects -->
                <tr>
                    <td id="leftSubnav">
                        <xsl:attribute name="id">
                        <xsl:choose>
                            <xsl:when test="$level2='app_projects'">leftSubnavOn</xsl:when>
                            <xsl:otherwise>leftSubnav</xsl:otherwise>
                        </xsl:choose>
                        </xsl:attribute>
                        <A class="leftOn"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=development&amp;c=app_projects</xsl:attribute>Open Projects</A>
                    </td>
                </tr>

<!-- Development Methodology -->
                <tr>
                    <td id="leftSubnav">
                        <xsl:attribute name="id">
                        <xsl:choose>
                            <xsl:when test="$level2='app_meth'">leftSubnavOn</xsl:when>
                            <xsl:otherwise>leftSubnav</xsl:otherwise>
                        </xsl:choose>
                        </xsl:attribute>
                        <A class="leftOn"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=development&amp;c=app_meth</xsl:attribute>Development Methodology</A>
                    </td>
                </tr>

                <xsl:call-template name="tc_info_row"/>
                <xsl:call-template name="about_row"/>
                <xsl:call-template name="reviewboard_row"/>
                <xsl:call-template name="press_row"/>
                <xsl:call-template name="contacts_row"/>
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
                <xsl:call-template name="sched_row"/>
                <xsl:call-template name="stats_row"/>
                <xsl:call-template name="feat_row"/>

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
                        <A class="leftOn" href="/tc/?&amp;module=Static&amp;d1=crpf&amp;d2=index">Charity</A>
                    </td>
                </tr>
<!-- Private Label Events -->
                <xsl:call-template name="rtables_row"/>
                <xsl:call-template name="rules_row"/>
                <xsl:call-template name="tc_info_row"/>
                <xsl:call-template name="about_row"/>
                <xsl:call-template name="reviewboard_row"/>
                <xsl:call-template name="press_row"/>
                <xsl:call-template name="contacts_row"/>
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
                <xsl:call-template name="sched_row"/>
                <xsl:call-template name="stats_row"/>
                <xsl:call-template name="feat_row"/>
                <xsl:call-template name="events_row"/>
                <xsl:call-template name="rtables_row"/>

                <tr><td id="leftNavOn"><img alt="" width="10" height="10" src="/i/nav_arrow_bottom.gif" border="0"/>Support/FAQ:</td></tr>

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

<!-- Divisions -->
                <tr>
                    <td id="leftSubnav">
                        <xsl:attribute name="id">
                        <xsl:choose>
                        <xsl:when test="/TC/Command='divisions'">leftSubnavOn</xsl:when>
                        <xsl:otherwise>leftSubnav</xsl:otherwise>
                        </xsl:choose>
                        </xsl:attribute>
                        <A class="leftOn"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=support&amp;c=divisions</xsl:attribute>Divisions</A>
                    </td>
                </tr>

<!-- Competition Preview -->
                <tr>
                    <td id="leftSubnav">
                        <xsl:attribute name="id">
                        <xsl:choose>
                        <xsl:when test="/TC/Command='comp_preview'">leftSubnavOn</xsl:when>
                        <xsl:otherwise>leftSubnav</xsl:otherwise>
                        </xsl:choose>
                        </xsl:attribute>
                        <A class="leftOn"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=support&amp;c=comp_preview</xsl:attribute>Competition Preview</A>
                    </td>
                </tr>

<!-- Getting Started -->
                <tr>
                    <td id="leftSubnav">
                        <xsl:attribute name="id">
                        <xsl:choose>
                        <xsl:when test="/TC/Command='getting_started'">leftSubnavOn</xsl:when>
                        <xsl:otherwise>leftSubnav</xsl:otherwise>
                        </xsl:choose>
                        </xsl:attribute>
                        <A class="leftOn"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=support&amp;c=getting_started</xsl:attribute>Getting Started</A>
                    </td>
                </tr>

<!-- Competition Process -->
                <tr>
                    <td id="leftSubnav">
                        <xsl:attribute name="id">
                        <xsl:choose>
                        <xsl:when test="/TC/Command='comp_process'">leftSubnavOn</xsl:when>
                        <xsl:otherwise>leftSubnav</xsl:otherwise>
                        </xsl:choose>
                        </xsl:attribute>
                        <A class="leftOn"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=support&amp;c=comp_process</xsl:attribute>Competition Process</A>
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

<!-- Editor Information -->
                <tr>
                    <td id="leftSubnav">
                        <xsl:attribute name="id">
                        <xsl:choose>
                        <xsl:when test="/TC/Command='editor_info'">leftSubnavOn</xsl:when>
                        <xsl:otherwise>leftSubnav</xsl:otherwise>
                        </xsl:choose>
                        </xsl:attribute>
                        <A class="leftOn"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=support&amp;c=editor_info</xsl:attribute>Editor Information</A>
                    </td>
                </tr>

<!-- Software Requirements -->
                <tr>
                    <td id="leftSubnav">
                        <xsl:attribute name="id">
                        <xsl:choose>
                        <xsl:when test="/TC/Command='software_req'">leftSubnavOn</xsl:when>
                        <xsl:otherwise>leftSubnav</xsl:otherwise>
                        </xsl:choose>
                        </xsl:attribute>
                        <A class="leftOn"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=support&amp;c=software_req</xsl:attribute>Software Requirements</A>
                    </td>
                </tr>

<!-- Rules &amp; Qualifications -->
                <tr>
                    <td id="leftSubnav">
                        <xsl:attribute name="id">
                        <xsl:choose>
                        <xsl:when test="/TC/Command='rules_qual'">leftSubnavOn</xsl:when>
                        <xsl:otherwise>leftSubnav</xsl:otherwise>
                        </xsl:choose>
                        </xsl:attribute>
                        <A class="leftOn"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=support&amp;c=rules_qual</xsl:attribute>Rules &amp; Qualification</A>
                    </td>
                </tr>

<!-- Visual Guide -->
                <tr>
                    <td id="leftSubnav">
                        <xsl:attribute name="id">
                        <xsl:choose>
                        <xsl:when test="/TC/Command='guide'">leftSubnavOn</xsl:when>
                        <xsl:otherwise>leftSubnav</xsl:otherwise>
                        </xsl:choose>
                        </xsl:attribute>
                        <A class="leftOn"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=support&amp;c=guide</xsl:attribute>Visual Guide</A>
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

                <xsl:call-template name="tc_info_row"/>
                <xsl:call-template name="about_row"/>
                <xsl:call-template name="reviewboard_row"/>
                <xsl:call-template name="press_row"/>
                <xsl:call-template name="contacts_row"/>
            </table>

            <xsl:call-template name="simple_search"/>
            <xsl:call-template name="left_nav_btm_row"/>
        </xsl:when>
<!-- Support/FAQs begins -->

<!-- About Us begins -->
        <xsl:when test="/TC/Task='about_tc'">
            <xsl:call-template name="left_nav_top_row" />
            <table width="180" cellspacing="0" cellpadding="0" border="0">
                <xsl:call-template name="tc_info_row"/>

                <tr>
                    <td id="leftNavOn">
                        <A class="leftOn"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=about_tc&amp;c=index</xsl:attribute><img alt="" width="10" height="10" src="/i/nav_arrow_bottom.gif" border="0"/>About TopCoder</A></td>
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
                        <A class="leftOn"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=about_tc&amp;c=index</xsl:attribute>Overview</A>
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
                        <A class="leftOn"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=about_tc&amp;c=membr_whyjoin</xsl:attribute>Why Join TopCoder?</A>
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
                        <A class="leftOn"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=about_tc&amp;c=jobs</xsl:attribute>Working at TopCoder</A>
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
                        <A class="leftOn"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=about_tc&amp;c=terms</xsl:attribute>Terms, Revisions</A>
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
                        <A class="leftOn"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=about_tc&amp;c=privacy</xsl:attribute>Privacy Policy</A>
                    </td>
                </tr>

                <xsl:call-template name="reviewboard_row"/>
                <xsl:call-template name="press_row"/>
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

<!-- Contact Us -->
                <tr>
                    <td id="leftNavSelect"><A class="leftOn"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=contacts&amp;c=index</xsl:attribute><img alt="" width="10" height="10" src="/i/clear.gif" border="0"/>Contact Us</A></td>
                </tr>
            </table>

            <xsl:call-template name="simple_search"/>
            <xsl:call-template name="left_nav_btm_row"/>
        </xsl:when>
<!-- Contact Us ends -->

<!-- TCES begins -->
      <xsl:when test="/TC/Task='tces'">
            <xsl:call-template name="left_nav_top_row" />
            <table width="180" cellspacing="0" cellpadding="0" border="0">
                <xsl:call-template name="jobs_row"/>
                <xsl:call-template name="applet_row"/>

                <tr>
                    <td id="leftNavOn">
                        <xsl:attribute name="id">
                        <xsl:choose>
                        <xsl:when test="/TC/Command='index'">leftNavSelect</xsl:when>
                        <xsl:otherwise>leftNavOn</xsl:otherwise>
                        </xsl:choose>
                        </xsl:attribute>
                        <A class="leftOn"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=tces&amp;c=index</xsl:attribute><img alt="" width="10" height="10" src="/i/nav_arrow_bottom.gif" border="0"/>Jobs for Members</A></td>
                </tr>

                <tr>
                    <td id="leftNav">
                        <A class="left"><xsl:attribute name="href">http://<xsl:value-of select="/TC/CorpHost"/>/?module=Static&amp;d1=corp&amp;d2=recruiting&amp;d3=index</xsl:attribute><img alt="" width="10" height="10" src="/i/nav_arrow_right.gif" border="0"/>Hiring for Employers</A>
                    </td>
                </tr>

                <tr>
                    <td id="leftNav">
                        <A class="left"><xsl:attribute name="href">http://<xsl:value-of select="/TC/CorpHost"/>/tces/?task=MainTask</xsl:attribute><img alt="" width="10" height="10" src="/i/nav_arrow_right.gif" border="0"/>TCES Reporting</A><br /><div style="font-size:11px; font-weight:normal; margin-left:10;">Employers log in to access Recruiting Reports</div>
                    </td>
                </tr>

                <xsl:call-template name="tc_info_row"/>
                <xsl:call-template name="about_row"/>
                <xsl:call-template name="reviewboard_row"/>
                <xsl:call-template name="press_row"/>
                <xsl:call-template name="contacts_row"/>
            </table>

            <xsl:call-template name="simple_search"/>
            <xsl:call-template name="left_nav_btm_row"/>
        </xsl:when>
<!-- TCES ends -->
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
                <xsl:call-template name="sched_row"/>
                <xsl:call-template name="stats_row"/>
                <xsl:call-template name="feat_row"/>
                <xsl:call-template name="events_row"/>
                <xsl:call-template name="rtables_row"/>
                <xsl:call-template name="rules_row"/>
                <xsl:call-template name="tc_info_row"/>
                <xsl:call-template name="about_row"/>
                <xsl:call-template name="reviewboard_row"/>
                <xsl:call-template name="press_row"/>
                <xsl:call-template name="contacts_row"/>
            </table>

            <xsl:call-template name="srm_dates"/>
            <xsl:call-template name="calendar"/>
            <xsl:call-template name="simple_search"/>
            <xsl:call-template name="left_nav_btm_row"/>
        </xsl:when>
<!-- no task -->


        <xsl:otherwise>
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
                <xsl:call-template name="sched_row"/>
                <xsl:call-template name="stats_row"/>
                <xsl:call-template name="feat_row"/>
                <xsl:call-template name="events_row"/>
                <xsl:call-template name="rtables_row"/>
                <xsl:call-template name="rules_row"/>
                <xsl:call-template name="tc_info_row"/>
                <xsl:call-template name="about_row"/>
                <xsl:call-template name="reviewboard_row"/>
                <xsl:call-template name="press_row"/>
                <xsl:call-template name="contacts_row"/>
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

<xsl:template name="jobs_row">
                <tr><td id="leftNavTitle" >Job Listing:</td></tr>
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

<xsl:template name="sched_row">
                <tr><td id="leftNav"><img alt="" width="10" height="10" src="/i/nav_arrow_right.gif" border="0"/><A class="left"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=schedule&amp;c=index</xsl:attribute>Schedule</A></td></tr>
</xsl:template>

<xsl:template name="stats_row">
                <tr><td id="leftNav"><img alt="" width="10" height="10" src="/i/nav_arrow_right.gif" border="0"/><A class="left"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/stat?&amp;c=round_overview</xsl:attribute>Statistics</A></td></tr>
</xsl:template>

<xsl:template name="feat_row">
                <tr><td id="leftNav"><img alt="" width="10" height="10" src="/i/nav_arrow_right.gif" border="0"/><A class="left"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=features&amp;c=index</xsl:attribute>Features</A></td></tr>
</xsl:template>

<xsl:template name="dev_row">
                <tr><td id="leftNav"><img alt="" width="10" height="10" src="/i/nav_arrow_right.gif" border="0"/><A class="left"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=development&amp;c=index</xsl:attribute>Development</A></td></tr>
</xsl:template>

<xsl:template name="dev_overview_row">
                <tr><td id="leftNav"><img alt="" width="10" height="10" src="/i/nav_arrow_right.gif" border="0"/><A class="left"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=development&amp;c=index</xsl:attribute>Overview</A></td></tr>
</xsl:template>

<xsl:template name="components_row">
                <tr><td id="leftNav"><img alt="" width="10" height="10" src="/i/nav_arrow_right.gif" border="0"/><A class="left"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=development&amp;c=components</xsl:attribute>Components</A></td></tr>
</xsl:template>

<xsl:template name="applications_row">
                <tr><td id="leftNav"><img alt="" width="10" height="10" src="/i/nav_arrow_right.gif" border="0"/><A class="left"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=development&amp;c=app_projects</xsl:attribute>Applications</A></td></tr>
</xsl:template>

<xsl:template name="events_row">
                <tr><td id="leftNav"><img alt="" width="10" height="10" src="/i/nav_arrow_right.gif" border="0"/><A class="left"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=tournaments&amp;c=tourny_index</xsl:attribute>Events</A></td></tr>
</xsl:template>

<xsl:template name="rtables_row">
                <tr><td id="leftNav"><img alt="" width="10" height="10" src="/i/nav_arrow_right.gif" border="0"/><A class="left"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/rtables/index.jsp</xsl:attribute>Round Tables</A></td></tr>
</xsl:template>

<xsl:template name="listings_row">
                <tr><td id="leftNav"><img alt="" width="10" height="10" src="/i/nav_arrow_right.gif" border="0"/><A class="left"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?t=tces&amp;c=index</xsl:attribute>Job Listing</A></td></tr>
</xsl:template>

<xsl:template name="rules_row">
                <tr><td id="leftNav" ><img alt="" width="10" height="10" src="/i/nav_arrow_right.gif" border="0"/><A class="left"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=support&amp;c=index</xsl:attribute>Support/FAQs</A></td></tr>
</xsl:template>

<xsl:template name="reg_row">
                <tr><td id="leftNav" ><img alt="" width="10" height="10" src="/i/nav_arrow_right.gif" border="0"/><A class="left"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/reg/index.jsp</xsl:attribute>Register</A></td></tr>
</xsl:template>

<xsl:template name="new_mbr_row">
                <tr><td id="leftNav" ><img alt="" width="10" height="10" src="/i/nav_arrow_right.gif" border="0"/><A class="left"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=new_mbr&amp;c=index</xsl:attribute>New Member Tour</A></td></tr>
</xsl:template>

<!-- TopCoder Info begins -->
<xsl:template name="tc_info_row">
                <tr><td id="leftNavTitle" >TopCoder Info:</td></tr>
</xsl:template>

<xsl:template name="about_row">
                <tr><td id="leftNav" ><img alt="" width="10" height="10" src="/i/nav_arrow_right.gif" border="0"/><A class="left"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=about_tc&amp;c=index</xsl:attribute>About TopCoder</A></td></tr>
</xsl:template>

<xsl:template name="reviewboard_row">
                <tr><td id="leftNav" ><img alt="" width="10" height="10" src="/i/nav_arrow_right.gif" border="0"/><A class="left" href="/tc/?module=Static&amp;d1=review_board&amp;d2=competition">Review Boards</A></td></tr>
</xsl:template>

<xsl:template name="press_row">
                <tr><td id="leftNav" ><img alt="" width="10" height="10" src="/i/nav_arrow_right.gif" border="0"/><A class="left"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=news_events&amp;c=index</xsl:attribute>Press Room</A></td></tr>
</xsl:template>

<xsl:template name="contacts_row">
                <tr><td id="leftNav" ><img alt="" width="10" height="10" src="/i/nav_arrow_right.gif" border="0"/><A class="left"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=contacts&amp;c=index</xsl:attribute>Contact Us</A></td></tr>
</xsl:template>
<!-- TopCoder Info ends -->

<!-- Nav ends -->
</xsl:stylesheet>
