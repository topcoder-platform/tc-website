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

<!-- Home page begins -->
    <xsl:choose>
        <xsl:when test="/TC/Task='public_home'">
            <table width="170" cellspacing="0" cellpadding="0" border="0">
                <xsl:call-template name="label_row"/>
                <xsl:call-template name="sched_row"/>
                <xsl:call-template name="stats_row"/>
                <xsl:call-template name="feat_row"/>
                <xsl:call-template name="dev_row"/>
                <xsl:call-template name="tourney_row"/>
                <xsl:call-template name="rtables_row"/>
                <xsl:call-template name="rules_row"/>
                <xsl:call-template name="corp_label_row"/>
                <xsl:call-template name="about_row"/>
                <xsl:call-template name="press_row"/>
                <xsl:call-template name="contacts_row"/>
            </table>

            <xsl:call-template name="srm_dates"/>
            <xsl:call-template name="calendar"/>
            <xsl:call-template name="simple_search"/>
            <xsl:call-template name="intro"/>
            <xsl:call-template name="left_nav_btm_row"/>
        </xsl:when>
      
        <xsl:when test="/TC/Task='home'">
            <table width="170" cellspacing="0" cellpadding="0" border="0">
                <xsl:call-template name="label_row"/>
                <xsl:call-template name="sched_row"/>
                <xsl:call-template name="stats_row"/>
                <xsl:call-template name="feat_row"/>
                <xsl:call-template name="dev_row"/>
                <xsl:call-template name="tourney_row"/>
                <xsl:call-template name="rtables_row"/>
                <xsl:call-template name="rules_row"/>
                <xsl:call-template name="corp_label_row"/>
                <xsl:call-template name="about_row"/>
                <xsl:call-template name="press_row"/>
                <xsl:call-template name="contacts_row"/>
            </table>

            <xsl:call-template name="srm_dates"/>
            <xsl:call-template name="calendar"/>
            <xsl:call-template name="simple_search"/>
            <xsl:call-template name="intro"/>
            <xsl:call-template name="left_nav_btm_row"/>
        </xsl:when>
<!-- Home page ends -->
      
<!-- Schedule begins -->
        <xsl:when test="/TC/Task='schedule'">
            <table width="170" cellspacing="0" cellpadding="0" border="0">
                <xsl:call-template name="label_row"/>
                
                <tr>
                    <td id="leftNavOn">
                        <xsl:attribute name="id">
                        <xsl:choose>
                            <xsl:when test="/TC/Command='index'">leftNavSelect</xsl:when>
                            <xsl:otherwise>leftNavOn</xsl:otherwise>
                        </xsl:choose>
                        </xsl:attribute>
                        <A class="leftOn"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=schedule&amp;c=index</xsl:attribute><img alt="" width="10" height="10" src="/i/arrow_white.gif" border="0" />Schedule:</A>
                    </td>
                </tr>

                <xsl:call-template name="stats_row"/>
                <xsl:call-template name="feat_row"/>
                <xsl:call-template name="dev_row"/>
                <xsl:call-template name="tourney_row"/>
                <xsl:call-template name="rtables_row"/>
                <xsl:call-template name="rules_row"/>
                <xsl:call-template name="corp_label_row"/>
                <xsl:call-template name="about_row"/>
                <xsl:call-template name="press_row"/>
                <xsl:call-template name="contacts_row"/>
            </table>

            <xsl:call-template name="simple_search"/>
            <xsl:call-template name="left_nav_btm_row"/>
        </xsl:when>
<!-- Schedule ends -->

<!-- Statistics begins -->
        <xsl:when test="/TC/Task='statistics'">
            <table width="170" cellspacing="0" cellpadding="0" border="0">
                <xsl:call-template name="label_row"/>
                <xsl:call-template name="sched_row"/>
                
                <tr><td id="leftNavOn"><img alt="" width="10" height="10" src="/i/arrow_white_down.gif" border="0" />&#160; Statistics:</td></tr>
                
                <tr>
                    <td id="leftSubnav">
                        <xsl:attribute name="id">
                        <xsl:choose>
                        <xsl:when test="/TC/Command='index'">leftSubnavOn</xsl:when>
                        <xsl:otherwise>leftSubnav</xsl:otherwise>
                        </xsl:choose>
                        </xsl:attribute>
                        <A class="leftOn"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/stat?&amp;c=round_overview</xsl:attribute>Round Overview</A>
                    </td>
                </tr>

                <tr>
                    <td id="leftSubnav">
                        <xsl:attribute name="id">
                        <xsl:choose>
                        <xsl:when test="/TC/Command='year_02'">leftSubnavOn</xsl:when>
                        <xsl:otherwise>leftSubnav</xsl:otherwise>
                        </xsl:choose>
                        </xsl:attribute>
                        <A class="leftOn"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/stat?&amp;c=last_match</xsl:attribute>Last Match Results</A>
                    </td>
                </tr>

                <tr>
                    <td id="leftSubnav">
                        <xsl:attribute name="id">
                        <xsl:choose>
                        <xsl:when test="/TC/Command='year_02'">leftSubnavOn</xsl:when>
                        <xsl:otherwise>leftSubnav</xsl:otherwise>
                        </xsl:choose>
                        </xsl:attribute>
                        <A class="leftOn"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/stat?&amp;c=coder_ratings</xsl:attribute>Coder Rankings</A>
                    </td>
                </tr>

                <tr>
                    <td id="leftSubnav">
                        <xsl:attribute name="id">
                        <xsl:choose>
                        <xsl:when test="/TC/Command='editorial_archive'">leftSubnavOn</xsl:when>
                        <xsl:when test="starts-with(/TC/Command,'srm')">leftSubnavOn</xsl:when>
                        <xsl:otherwise>leftSubnav</xsl:otherwise>
                        </xsl:choose>
                        </xsl:attribute>
                        <A class="leftOn"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=statistics&amp;c=editorial_archive</xsl:attribute>Match Editorials</A>
                    </td>
                </tr>

                <tr>
                    <td id="leftSubnav">
                        <xsl:attribute name="id">
                        <xsl:choose>
                        <xsl:when test="/TC/Command='quick_stats'">leftSubnavOn</xsl:when>
                        <xsl:otherwise>leftSubnav</xsl:otherwise>
                        </xsl:choose>
                        </xsl:attribute>
                        <A class="leftOn"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=statistics&amp;c=quick_stats</xsl:attribute>Quick Stats</A>
                    </td>
                </tr>

                <tr>
                    <td id="leftSubnav">
                        <xsl:attribute name="id">
                        <xsl:choose>
                        <xsl:when test="/TC/Command='year_02'">leftSubnavOn</xsl:when>
                        <xsl:otherwise>leftSubnav</xsl:otherwise>
                        </xsl:choose>
                        </xsl:attribute>
                        <A class="leftOn"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?t=search</xsl:attribute>Advanced Member Search</A>
                    </td>
                </tr>
                        
                <xsl:call-template name="feat_row"/>
                <xsl:call-template name="dev_row"/>
                <xsl:call-template name="tourney_row"/>
                <xsl:call-template name="rtables_row"/>
                <xsl:call-template name="rules_row"/>
                <xsl:call-template name="corp_label_row"/>
                <xsl:call-template name="about_row"/>
                <xsl:call-template name="press_row"/>
                <xsl:call-template name="contacts_row"/>
          </table>
            
            <xsl:call-template name="simple_search"/>
            <xsl:call-template name="left_nav_btm_row"/>
        </xsl:when>

        <xsl:when test="/TC/Task='search'">
            <table width="170" cellspacing="0" cellpadding="0" border="0">
                <xsl:call-template name="label_row"/>
                <xsl:call-template name="sched_row"/>
                
                <tr><td id="leftNavOn"><img alt="" width="10" height="10" src="/i/arrow_white_down.gif" border="0"/>&#160; Statistics:</td></tr>
                
                
                <tr>
                    <td id="leftSubnav">
                        <xsl:attribute name="id">
                        <xsl:choose>
                        <xsl:when test="/TC/Command='index'">leftSubnavOn</xsl:when>
                        <xsl:otherwise>leftSubnav</xsl:otherwise>
                        </xsl:choose>
                        </xsl:attribute>
                        <A class="leftOn"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/stat?&amp;c=round_overview</xsl:attribute>Round Overview</A>
                    </td>
                </tr>

                <tr>
                    <td id="leftSubnav">
                        <xsl:attribute name="id">
                        <xsl:choose>
                        <xsl:when test="/TC/Command='year_02'">leftSubnavOn</xsl:when>
                        <xsl:otherwise>leftSubnav</xsl:otherwise>
                        </xsl:choose>
                        </xsl:attribute>
                        <A class="leftOn"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/stat?&amp;c=last_match</xsl:attribute>Last Match Results</A>
                    </td>
                </tr>

                <tr>
                    <td id="leftSubnav">
                        <xsl:attribute name="id">
                        <xsl:choose>
                        <xsl:when test="/TC/Command='year_02'">leftSubnavOn</xsl:when>
                        <xsl:otherwise>leftSubnav</xsl:otherwise>
                        </xsl:choose>
                        </xsl:attribute>
                        <A class="leftOn"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/stat?&amp;c=coder_ratings</xsl:attribute>Coder Rankings</A>
                    </td>
                </tr>

                <tr>
                    <td id="leftSubnav">
                        <xsl:attribute name="id">
                        <xsl:choose>
                        <xsl:when test="/TC/Command='editorial_archive'">leftSubnavOn</xsl:when>
                        <xsl:otherwise>leftSubnav</xsl:otherwise>
                        </xsl:choose>
                        </xsl:attribute>
                        <A class="leftOn"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=statistics&amp;c=editorial_archive</xsl:attribute>Match Editorials</A>
                    </td>
                </tr>

                <tr>
                    <td id="leftSubnav">
                        <xsl:attribute name="id">
                        <xsl:choose>
                        <xsl:when test="/TC/Command='quick_stats'">leftSubnavOn</xsl:when>
                        <xsl:otherwise>leftSubnav</xsl:otherwise>
                        </xsl:choose>
                        </xsl:attribute>
                        <A class="leftOn"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=statistics&amp;c=quick_stats</xsl:attribute>Quick Stats</A>
                    </td>
                </tr>

                <tr>
                    <td id="leftSubnav">
                        <xsl:attribute name="id">
                        <xsl:choose>
                        <xsl:when test="/TC/Task='search'">leftSubnavOn</xsl:when>
                        <xsl:otherwise>leftSubnav</xsl:otherwise>
                        </xsl:choose>
                        </xsl:attribute>
                        <A class="leftOn"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?t=search</xsl:attribute>Advanced Member Search</A>
                    </td>
                </tr>
                        
                <xsl:call-template name="feat_row"/>
                <xsl:call-template name="dev_row"/>
                <xsl:call-template name="tourney_row"/>
                <xsl:call-template name="rtables_row"/>
                <xsl:call-template name="rules_row"/>
                <xsl:call-template name="corp_label_row"/>
                <xsl:call-template name="about_row"/>
                <xsl:call-template name="press_row"/>
                <xsl:call-template name="contacts_row"/>
            </table>
            
            <xsl:call-template name="simple_search"/>
            <xsl:call-template name="left_nav_btm_row"/>
        </xsl:when>
<!-- Schedule begins -->

<!-- Features begins -->
        <xsl:when test="/TC/Task='features'">
            <table width="170" cellspacing="0" cellpadding="0" border="0">
                <xsl:call-template name="label_row"/>
                <xsl:call-template name="sched_row"/>
                <xsl:call-template name="stats_row"/>
                
                <tr>
                    <td id="leftNavOn">
                        <xsl:attribute name="id">
                        <xsl:choose>
                            <xsl:when test="/TC/Command='index'">leftNavSelect</xsl:when>
                            <xsl:otherwise>leftNavOn</xsl:otherwise>
                        </xsl:choose>
                        </xsl:attribute>
                        <A class="leftOn"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=features&amp;c=index</xsl:attribute><img alt="" width="10" height="10" src="/i/arrow_white_down.gif" border="0" />&#160;Features</A>
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
                
                <xsl:call-template name="dev_row"/>
                <xsl:call-template name="tourney_row"/>
                <xsl:call-template name="rtables_row"/>
                <xsl:call-template name="rules_row"/>
                <xsl:call-template name="corp_label_row"/>
                <xsl:call-template name="about_row"/>
                <xsl:call-template name="press_row"/>
                <xsl:call-template name="contacts_row"/>
            </table>
          
            <xsl:call-template name="simple_search"/>
            <xsl:call-template name="left_nav_btm_row"/>
        </xsl:when>
<!-- Features ends -->

<!-- Development Begins -->
        <xsl:when test="/TC/Task='development'">
            <table width="170" cellspacing="0" cellpadding="0" border="0">
                <xsl:call-template name="label_row"/>
                <xsl:call-template name="sched_row"/>
                <xsl:call-template name="stats_row"/>
                <xsl:call-template name="feat_row"/>

                <tr><td id="leftNavOn"><img alt="" width="10" height="10" src="/i/arrow_white_down.gif" border="0" />&#160;Development:</td></tr>

                <tr>
                    <td id="leftSubnav">
                        <xsl:attribute name="id">
                        <xsl:choose>
                            <xsl:when test="/TC/Command='index'">leftSubnavOn</xsl:when>
                            <xsl:otherwise>leftSubnav</xsl:otherwise>
                        </xsl:choose>
                        </xsl:attribute>
                        <A class="leftOn"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=development&amp;c=index</xsl:attribute>Overview</A>
                    </td>
                </tr>

                <tr>
                    <td id="leftSubnav">
                        <xsl:attribute name="id">
                        <xsl:choose>
                            <xsl:when test="/TC/Command='dev_payment'">leftSubnavOn</xsl:when>
                            <xsl:otherwise>leftSubnav</xsl:otherwise>
                        </xsl:choose>
                        </xsl:attribute>
                        <A class="leftOn"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=development&amp;c=dev_payment</xsl:attribute>Payment Requirements</A>
                    </td>
                </tr>

                <tr><td id="leftNavSubtitle">Components:</td></tr>
            
                <tr>
                    <td id="leftSubnav">
                        <xsl:attribute name="id">
                        <xsl:choose>
                            <xsl:when test="/TC/Command='components'">leftSubnavOn</xsl:when>
                            <xsl:otherwise>leftSubnav</xsl:otherwise>
                        </xsl:choose>
                        </xsl:attribute>
                        <A class="leftOn"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=development&amp;c=components</xsl:attribute>This Week's Project Winners</A>
                    </td>
                </tr>

                <tr>
                    <td id="leftSubnav">
                        <xsl:attribute name="id">
                        <xsl:choose>
                            <xsl:when test="/TC/Command='comp_projects'">leftSubnavOn</xsl:when>
                            <xsl:otherwise>leftSubnav</xsl:otherwise>
                        </xsl:choose>
                        </xsl:attribute>
                        <A class="leftOn"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=development&amp;c=comp_projects</xsl:attribute>Open Projects</A>
                    </td>
                </tr>
                
                <tr>
                    <td id="leftSubnav">
                        <xsl:attribute name="id">
                        <xsl:choose>
                            <xsl:when test="/TC/Command='comp_meth'">leftSubnavOn</xsl:when>
                            <xsl:otherwise>leftSubnav</xsl:otherwise>
                        </xsl:choose>
                        </xsl:attribute>
                        <A class="leftOn"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=development&amp;c=comp_meth</xsl:attribute>Development Methodology</A>
                    </td>
                </tr>

<!-- Component Documentation and Samples -->
                <tr>
                    <td id="leftSubnav">
                        <xsl:attribute name="id">
                        <xsl:choose>
                            <xsl:when test="/TC/Command='tcs_sample_docs'">leftSubnavOn</xsl:when>
                            <xsl:otherwise>leftSubnav</xsl:otherwise>
                        </xsl:choose>
                        </xsl:attribute>
                        <A class="leftOn"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=development&amp;c=tcs_sample_docs</xsl:attribute>Documentation and Sample Submissions</A>
                    </td>
                </tr>

<!-- Component Design Bonus Contest 1 -->
                <tr>
                    <td id="leftSubnav">
                        <xsl:attribute name="id">
                        <xsl:choose>
                            <xsl:when test="/TC/Command='bonus_contest_0303'">leftSubnavOn</xsl:when>
                            <xsl:otherwise>leftSubnav</xsl:otherwise>
                        </xsl:choose>
                        </xsl:attribute>
                        <A class="leftOn"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=development&amp;c=bonus_contest_0303</xsl:attribute>Design Bonus Contest 1</A>
                    </td>
                </tr>

<!-- Component Design Bonus Contest 2 -->
                <tr>
                    <td id="leftSubnav">
                        <xsl:attribute name="id">
                        <xsl:choose>
                            <xsl:when test="/TC/Command='des_bonus_contest_2'">leftSubnavOn</xsl:when>
                            <xsl:otherwise>leftSubnav</xsl:otherwise>
                        </xsl:choose>
                        </xsl:attribute>
                        <A class="leftOn"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=development&amp;c=des_bonus_contest_2</xsl:attribute>Design Bonus Contest 2</A>
                    </td>
                </tr>

<!-- Applications -->
                <tr><td id="leftNavSubtitle">Applications:</td></tr>

<!-- Open Application Projects -->
                <tr>
                    <td id="leftSubnav">
                        <xsl:attribute name="id">
                        <xsl:choose>
                            <xsl:when test="/TC/Command='app_projects'">leftSubnavOn</xsl:when>
                            <xsl:otherwise>leftSubnav</xsl:otherwise>
                        </xsl:choose>
                        </xsl:attribute>
                        <A class="leftOn"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=development&amp;c=app_projects</xsl:attribute>Open Projects</A>
                    </td>
                </tr>

<!-- Application Development Methodology -->
                <tr>
                    <td id="leftSubnav">
                        <xsl:attribute name="id">
                        <xsl:choose>
                            <xsl:when test="/TC/Command='app_meth'">leftSubnavOn</xsl:when>
                            <xsl:otherwise>leftSubnav</xsl:otherwise>
                        </xsl:choose>
                        </xsl:attribute>
                        <A class="leftOn"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=development&amp;c=app_meth</xsl:attribute>Development Methodology</A>
                    </td>
                </tr>

                <xsl:call-template name="tourney_row"/>
                <xsl:call-template name="rtables_row"/>
                <xsl:call-template name="rules_row"/>
                <xsl:call-template name="corp_label_row"/>
                <xsl:call-template name="about_row"/>
                <xsl:call-template name="press_row"/>
                <xsl:call-template name="contacts_row"/>
            </table>

            <xsl:call-template name="simple_search"/>
            <xsl:call-template name="left_nav_btm_row"/>
        </xsl:when>
<!-- Developement -->

<!-- Tournaments begins -->
        <xsl:when test="/TC/Task='tournaments'">
            <table width="170" cellspacing="0" cellpadding="0" border="0">
                <xsl:call-template name="label_row"/>
                <xsl:call-template name="sched_row"/>
                <xsl:call-template name="stats_row"/>
                <xsl:call-template name="feat_row"/>
                <xsl:call-template name="dev_row"/>
            
                <tr>
                    <td id="leftNavOn">
                        <xsl:attribute name="id">
                        <xsl:choose>
                            <xsl:when test="/TC/Command='tourny_index'">leftNavSelect</xsl:when>
                            <xsl:otherwise>leftNavOn</xsl:otherwise>
                        </xsl:choose>
                        </xsl:attribute>
                        <A class="leftOn"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=tournaments&amp;c=tourny_index</xsl:attribute><img alt="" width="10" height="10" src="/i/arrow_white_down.gif" border="0"/>&#160;Tournaments:</A>
                    </td>
                </tr>

                <tr>
                    <td id="leftSubnav">
                        <xsl:attribute name="id">
                        <xsl:choose>
                            <xsl:when test="starts-with(/TC/Command,'tccc03_')">leftSubnavOn</xsl:when>
                            <xsl:otherwise>leftSubnav</xsl:otherwise>
                        </xsl:choose>
                        </xsl:attribute>
                        <A class="leftOn" href="/?&amp;t=tournaments&amp;c=tccc03_champ">2003 Collegiate Challenge</A></td>
                </tr>
                
                <tr>
                    <td id="leftSubnav">
                        <xsl:attribute name="id">
                        <xsl:choose>
                            <xsl:when test="/TC/Command='index'">leftSubnavOn</xsl:when>
                            <xsl:when test="starts-with(/TC/Command,'invit02')">leftSubnavOn</xsl:when>
                            <xsl:otherwise>leftSubnav</xsl:otherwise>
                        </xsl:choose>
                        </xsl:attribute>
                        <A class="leftOn" href="/?&amp;t=tournaments&amp;c=invit02_champ">2002 Invitational</A></td>
                </tr>
            
                <tr>
                    <td id="leftSubnav">
                        <xsl:attribute name="id">
                        <xsl:choose>
                        <xsl:when test="/TC/Command='index'">leftSubnavOn</xsl:when>
                        <xsl:when test="starts-with(/TC/Command,'tourny_s')">leftSubnavOn</xsl:when>
                        <xsl:when test="starts-with(/TC/Command,'tourny_r')">leftSubnavOn</xsl:when>
                        <xsl:when test="starts-with(/TC/Command,'tccc02')">leftSubnavOn</xsl:when>
                            <xsl:otherwise>leftSubnav</xsl:otherwise>
                        </xsl:choose>
                        </xsl:attribute>
                        <A class="leftOn" href="/?&amp;t=tournaments&amp;c=tourny_sched">2002 Collegiate Challenge</A></td>
                </tr>
                
                <tr>
                    <td id="leftSubnav">
                        <xsl:attribute name="id">
                        <xsl:choose>
                        <xsl:when test="/TC/Command='index'">leftSubnavOn</xsl:when>
                        <xsl:when test="starts-with(/TC/Command,'tourny_tci_01')">leftSubnavOn</xsl:when>
                            <xsl:otherwise>leftSubnav</xsl:otherwise>
                        </xsl:choose>
                        </xsl:attribute>
                        <A class="leftOn" href="/?&amp;t=tournaments&amp;c=tourny_tci_01">2001 Invitational</A></td>
                </tr>
                
                <tr>
                    <td id="leftSubnav">
                        <xsl:attribute name="id">
                        <xsl:choose>
                        <xsl:when test="/TC/Command='index'">leftSubnavOn</xsl:when>
                        <xsl:when test="starts-with(/TC/Command,'tourny_tccc_01')">leftSubnavOn</xsl:when>
                            <xsl:otherwise>leftSubnav</xsl:otherwise>
                        </xsl:choose>
                        </xsl:attribute>
                        <A class="leftOn" href="/?&amp;t=tournaments&amp;c=tourny_tccc_01">2001 Collegiate Challenge</A></td>
                </tr>
                
                <xsl:call-template name="rtables_row"/>
                <xsl:call-template name="rules_row"/>
                <xsl:call-template name="corp_label_row"/>
                <xsl:call-template name="about_row"/>
                <xsl:call-template name="press_row"/>
                <xsl:call-template name="contacts_row"/>
            </table>
            
            <xsl:call-template name="simple_search"/>
            <xsl:call-template name="left_nav_btm_row"/>
      </xsl:when>
<!-- Tournaments ends -->

<!-- Support/FAQs begins -->
      <xsl:when test="/TC/Task='support'">
            <table width="170" cellspacing="0" cellpadding="0" border="0">
                <xsl:call-template name="label_row"/>
                <xsl:call-template name="sched_row"/>
                <xsl:call-template name="stats_row"/>
                <xsl:call-template name="feat_row"/>
                <xsl:call-template name="dev_row"/>
                <xsl:call-template name="tourney_row"/>
                <xsl:call-template name="rtables_row"/>
                
                <tr><td id="leftNavOn"><img alt="" width="10" height="10" src="/i/arrow_white_down.gif" border="0"/>Support/FAQs:</td></tr>
                
                <tr>
                    <td id="leftSubnav">
                        <xsl:attribute name="id">
                        <xsl:choose>
                        <xsl:when test="/TC/Command='index'">leftSubnavOn</xsl:when>
                        <xsl:otherwise>leftSubnav</xsl:otherwise>
                        </xsl:choose>
                        </xsl:attribute>
                        <A class="leftOn"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=support&amp;c=index</xsl:attribute>General FAQs</A>
                    </td>
                </tr>

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
              
                <xsl:call-template name="corp_label_row"/>
                <xsl:call-template name="about_row"/>
                <xsl:call-template name="press_row"/>
                <xsl:call-template name="contacts_row"/>
            </table>

            <xsl:call-template name="simple_search"/>
            <xsl:call-template name="left_nav_btm_row"/>
        </xsl:when>

<!-- about us and press nav -->
        <xsl:when test="/TC/Task='about_tc'">
            <table width="170" cellspacing="0" cellpadding="0" border="0">
                <xsl:call-template name="label_row"/>
                <xsl:call-template name="sched_row"/>
                <xsl:call-template name="stats_row"/>
                <xsl:call-template name="feat_row"/>
                <xsl:call-template name="dev_row"/>
                <xsl:call-template name="tourney_row"/>
                <xsl:call-template name="rtables_row"/>
                <xsl:call-template name="rules_row"/>
                <xsl:call-template name="corp_label_row"/>

<!-- About Us begins -->

                <tr>
                    <td id="leftNavOn">
                        <xsl:attribute name="id">
                        <xsl:choose>
                        <xsl:when test="/TC/Command='index'">leftNavSelect</xsl:when>
                        <xsl:otherwise>leftNavOn</xsl:otherwise>
                        </xsl:choose>
                        </xsl:attribute>
                        <A class="leftOn"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=about_tc&amp;c=index</xsl:attribute><img alt="" width="10" height="10" src="/i/arrow_white_down.gif" border="0"/>&#160; About Us:</A></td>
                </tr>
               
<!-- For Members -->
                <tr><td id="leftNavSubtitle">for Members:</td></tr>

                <tr>
                    <td id="leftSubnav">
                        <xsl:attribute name="id">
                        <xsl:choose>
                        <xsl:when test="/TC/Command='membr_whyjoin'">leftSubnavOn</xsl:when>
                        <xsl:otherwise>leftSubnav</xsl:otherwise>
                        </xsl:choose>
                        </xsl:attribute>
                        <A class="leftOn"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=about_tc&amp;c=membr_whyjoin</xsl:attribute>Why membership?</A>
                    </td>
                </tr>
                

                <tr>
                    <td id="leftSubnav">
                        <xsl:attribute name="id">
                        <xsl:choose>
                        <xsl:when test="/TC/Command='membr_ratings'">leftSubnavOn</xsl:when>
                        <xsl:otherwise>leftSubnav</xsl:otherwise>
                        </xsl:choose>
                        </xsl:attribute>
                        <A class="leftOn"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=about_tc&amp;c=membr_ratings</xsl:attribute>What are ratings?</A>
                        </td></tr>
              

                <tr>
                    <td id="leftSubnav">
                        <xsl:attribute name="id">
                        <xsl:choose>
                        <xsl:when test="/TC/Command='membr_divisions'">leftSubnavOn</xsl:when>
                        <xsl:otherwise>leftSubnav</xsl:otherwise>
                        </xsl:choose>
                        </xsl:attribute>
                        <A class="leftOn"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=about_tc&amp;c=membr_divisions</xsl:attribute>What are divisions?</A>
                        </td></tr>
                

                <tr>
                    <td id="leftSubnav">
                        <xsl:attribute name="id">
                        <xsl:choose>
                        <xsl:when test="/TC/Command='membr_match'">leftSubnavOn</xsl:when>
                        <xsl:otherwise>leftSubnav</xsl:otherwise>
                        </xsl:choose>
                        </xsl:attribute>
                        <A class="leftOn"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=about_tc&amp;c=membr_match</xsl:attribute>What is a match?</A>
                        </td></tr>
             

                <tr>
                    <td id="leftSubnav">
                        <xsl:attribute name="id">
                        <xsl:choose>
                        <xsl:when test="/TC/Command='membr_tournament'">leftSubnavOn</xsl:when>
                        <xsl:otherwise>leftSubnav</xsl:otherwise>
                        </xsl:choose>
                        </xsl:attribute>
                        <A class="leftOn"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=about_tc&amp;c=membr_tournament</xsl:attribute>What is a tournament?</A>
                        </td></tr>
               
                <tr>
                    <td id="leftSubnav">
                        <xsl:attribute name="id">
                        <xsl:choose>
                        <xsl:when test="/TC/Command='membr_referrals'">leftSubnavOn</xsl:when>
                        <xsl:otherwise>leftSubnav</xsl:otherwise>
                        </xsl:choose>
                        </xsl:attribute>
                        <A class="leftOn"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=about_tc&amp;c=membr_referrals</xsl:attribute>What are referrals?</A>
                        </td>
                </tr>

                <tr>
                    <td id="leftSubnav">
                        <xsl:attribute name="id">
                        <xsl:choose>
                        <xsl:when test="/TC/Command='membr_comm'">leftSubnavOn</xsl:when>
                        <xsl:otherwise>leftSubnav</xsl:otherwise>
                        </xsl:choose>
                        </xsl:attribute>
                        <A class="leftOn"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=about_tc&amp;c=membr_comm</xsl:attribute>What is the community?</A>
                        </td>
                </tr>

                <tr> <td id="leftSubnav"><A class="leftOn"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=tces&amp;c=index</xsl:attribute>What is TCES?</A></td></tr>

                <tr>
                    <td id="leftSubnav">
                        <xsl:attribute name="id">
                        <xsl:choose>
                        <xsl:when test="/TC/Command='jobs'">leftSubnavOn</xsl:when>
                        <xsl:otherwise>leftSubnav</xsl:otherwise>
                        </xsl:choose>
                        </xsl:attribute>
                        <A class="leftOn"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=about_tc&amp;c=jobs</xsl:attribute>Jobs at TopCoder</A>
                    </td>
                </tr>

<!-- For Sponsors -->
                <tr><td id="leftNavSubtitle">for Sponsors:</td></tr>
               
                <tr>
                    <td id="leftSubnav">
                        <xsl:attribute name="id">
                        <xsl:choose>
                        <xsl:when test="/TC/Command='spons_srm'">leftSubnavOn</xsl:when>
                        <xsl:otherwise>leftSubnav</xsl:otherwise>
                        </xsl:choose>
                        </xsl:attribute>
                        <A class="leftOn"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=about_tc&amp;c=spons_srm</xsl:attribute>Single Round Match Package</A>
                        </td>
                    </tr>

                <tr>
                    <td id="leftSubnav">
                        <xsl:attribute name="id">
                        <xsl:choose>
                        <xsl:when test="/TC/Command='spons_tourny'">leftSubnavOn</xsl:when>
                        <xsl:otherwise>leftSubnav</xsl:otherwise>
                        </xsl:choose>
                        </xsl:attribute>
                        <A class="leftOn"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=about_tc&amp;c=spons_tourny</xsl:attribute>Tournament Package</A>
                        </td>
                    </tr>

<!-- For Employers -->
                <tr><td id="leftNavSubtitle">for Employers:</td></tr>

                <tr>
                    <td id="leftSubnav">
                        <xsl:attribute name="id">
                        <xsl:choose>
                        <xsl:when test="/TC/Command='nopagehere'">leftSubnavOn</xsl:when>
                        <xsl:otherwise>leftSubnav</xsl:otherwise>
                        </xsl:choose>
                        </xsl:attribute>
                        <A class="leftOn"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=tces&amp;c=index</xsl:attribute>Employment Services</A>
                    </td>
                </tr>

                <tr>
                    <td id="leftSubnav">
                        <xsl:attribute name="id">
                        <xsl:choose>
                        <xsl:when test="/TC/Command='empl_difference'">leftSubnavOn</xsl:when>
                        <xsl:otherwise>leftSubnav</xsl:otherwise>
                        </xsl:choose>
                        </xsl:attribute>
                        <A class="leftOn"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=about_tc&amp;c=empl_difference</xsl:attribute>Competition vs Certification</A>
                    </td>
                </tr>
             

                <xsl:call-template name="press_row"/>
                <xsl:call-template name="contacts_row"/>
            </table>
          
            <xsl:call-template name="simple_search"/>
            <xsl:call-template name="left_nav_btm_row"/>
        </xsl:when>

<!-- Press Room begins -->
        <xsl:when test="/TC/Task='news_events'">
            <table width="170" cellspacing="0" cellpadding="0" border="0">
                <xsl:call-template name="label_row"/>
                <xsl:call-template name="sched_row"/>
                <xsl:call-template name="stats_row"/>
                <xsl:call-template name="feat_row"/>
                <xsl:call-template name="dev_row"/>
                <xsl:call-template name="tourney_row"/>
                <xsl:call-template name="rtables_row"/>
                <xsl:call-template name="rules_row"/>
                <xsl:call-template name="corp_label_row"/>
                <xsl:call-template name="about_row"/>
                
                <tr>
                    <td id="leftNavOn">
                        <xsl:attribute name="id">
                        <xsl:choose>
                        <xsl:when test="/TC/Command='index'">leftNavSelect</xsl:when>
                        <xsl:when test="starts-with(/TC/Command,'pr')">leftNavSelect</xsl:when>
                        <xsl:otherwise>leftNavOn</xsl:otherwise>
                        </xsl:choose>
                        </xsl:attribute>
                        <A class="leftOn"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=news_events&amp;c=index</xsl:attribute><img alt="" width="10" height="10" src="/i/arrow_white_down.gif" border="0"/>&#160;Press Room</A></td>
                </tr>
                
                <tr>
                    <td id="leftSubnav">
                        <xsl:attribute name="id">
                        <xsl:choose>
                        <xsl:when test="/TC/Command='articles'">leftSubnavOn</xsl:when>
                        <xsl:when test="starts-with(/TC/Command,'article')">leftSubnavOn</xsl:when>
                        <xsl:otherwise>leftSubnav</xsl:otherwise>
                        </xsl:choose>
                        </xsl:attribute>
                        <A class="leftOn"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=news_events&amp;c=articles</xsl:attribute>Articles</A>
                    </td>
                </tr>
                
                <xsl:call-template name="contacts_row"/>
          </table>

            <xsl:call-template name="simple_search"/>
            <xsl:call-template name="left_nav_btm_row"/>
        </xsl:when>
<!-- Press Room ends -->

<!-- Contact Us begins -->
        <xsl:when test="/TC/Task='contacts'">
            <table width="170" cellspacing="0" cellpadding="0" border="0">
                <xsl:call-template name="label_row"/>
                <xsl:call-template name="sched_row"/>
                <xsl:call-template name="stats_row"/>
                <xsl:call-template name="feat_row"/>
                <xsl:call-template name="dev_row"/>
                <xsl:call-template name="tourney_row"/>
                <xsl:call-template name="rtables_row"/>
                <xsl:call-template name="rules_row"/>
                <xsl:call-template name="corp_label_row"/>
                <xsl:call-template name="about_row"/>
                <xsl:call-template name="press_row"/>

                <tr>
                    <td id="leftNavOn">
                        <xsl:attribute name="id">
                        <xsl:choose>
                        <xsl:when test="/TC/Command='index'">leftNavSelect</xsl:when>
                        <xsl:otherwise>leftNavOn</xsl:otherwise>
                        </xsl:choose>
                        </xsl:attribute>
                        <A class="leftOn"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=contacts&amp;c=index</xsl:attribute><img alt="" width="10" height="10" src="/i/arrow_white.gif" border="0"/>Contact Us</A></td>
                </tr>
            </table>

            <xsl:call-template name="simple_search"/>
            <xsl:call-template name="left_nav_btm_row"/>
        </xsl:when>
<!-- TopCoder Info ends -->

        <xsl:when test="/TC/Command='terms'">
            <table width="170" cellspacing="0" cellpadding="0" border="0">
                <xsl:call-template name="read_row"/>
            
                <tr>
                    <td valign="middle" class="statText" bgcolor="#333333" background="/i/graybv_lite_bg.gif" >
                          <A class="statText"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=&amp;c=terms</xsl:attribute>Terms, Revisions</A>
                    </td>
                </tr>
               
               <xsl:call-template name="div_line_row"/>
                <xsl:call-template name="privacy_row"/>
                <xsl:call-template name="label_row"/>
                <xsl:call-template name="sched_row"/>
                <xsl:call-template name="stats_row"/>
                <xsl:call-template name="feat_row"/>
                <xsl:call-template name="dev_row"/>
                <xsl:call-template name="tourney_row"/>
                <xsl:call-template name="rtables_row"/>
                <xsl:call-template name="rules_row"/>
                <xsl:call-template name="corp_label_row"/>
                <xsl:call-template name="about_row"/>
                <xsl:call-template name="press_row"/>
                <xsl:call-template name="contacts_row"/>
            </table>

            <xsl:call-template name="simple_search"/>
            <xsl:call-template name="left_nav_btm_row"/>
      </xsl:when>

      <xsl:when test="/TC/Command='privacy'">
            <!-- <xsl:call-template name="module_login"/> -->
            <table width="170" cellspacing="0" cellpadding="0" border="0">
                <xsl:call-template name="read_row"/>
                <xsl:call-template name="terms_row"/>
                
                <tr>
                    <td valign="middle" class="statText" bgcolor="#333333" background="/i/graybv_lite_bg.gif" >
                        <A class="statText"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=&amp;c=privacy</xsl:attribute>Privacy Policy</A>
                    </td>
                </tr>
                
                <xsl:call-template name="label_row"/>
                <xsl:call-template name="sched_row"/>
                <xsl:call-template name="stats_row"/>
                <xsl:call-template name="feat_row"/>
                <xsl:call-template name="dev_row"/>
                <xsl:call-template name="tourney_row"/>
                <xsl:call-template name="rtables_row"/>
                <xsl:call-template name="rules_row"/>
                <xsl:call-template name="corp_label_row"/>
                <xsl:call-template name="about_row"/>
                <xsl:call-template name="press_row"/>
                <xsl:call-template name="contacts_row"/>
            </table>

            <xsl:call-template name="simple_search"/>
            <xsl:call-template name="left_nav_btm_row"/>
      </xsl:when>

      <xsl:when test="/TC/Task='tces'">
            <table width="170" cellspacing="0" cellpadding="0" border="0">
                
                <tr>
                    <td id="leftNavOn">
                        <xsl:attribute name="id">
                        <xsl:choose>
                        <xsl:when test="/TC/Command='index'">leftNavSelect</xsl:when>
                        <xsl:otherwise>leftNavOn</xsl:otherwise>
                        </xsl:choose>
                        </xsl:attribute>
                        <A class="leftOn"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=tces&amp;c=index</xsl:attribute><img alt="" width="10" height="10" src="/i/arrow_white_down.gif" border="0"/>&#160;Employment Services</A></td>
                </tr>

                <tr>
                    <td id="leftSubnav">
                        <xsl:attribute name="id">
                        <xsl:choose>
                        <xsl:when test="/TC/Command='hiring'">leftSubnavOn</xsl:when>
                        <xsl:otherwise>leftSubnav</xsl:otherwise>
                        </xsl:choose>
                        </xsl:attribute>
                        <A class="leftOn"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=tces&amp;c=hiring</xsl:attribute>Hiring for Employers</A>
                    </td>
                </tr>
            
                <tr>
                    <td id="leftSubnav">
                        <A href="http://corporate.topcoder.com/tces/?task=MainTask" class="leftOn">TCES Reporting</A>
                    </td>
                </tr>
                
                <xsl:call-template name="label_row"/>
                <xsl:call-template name="sched_row"/>
                <xsl:call-template name="stats_row"/>
                <xsl:call-template name="feat_row"/>
                <xsl:call-template name="dev_row"/>
                <xsl:call-template name="tourney_row"/>
                <xsl:call-template name="rtables_row"/>
                <xsl:call-template name="rules_row"/>
                <xsl:call-template name="corp_label_row"/>
                <xsl:call-template name="about_row"/>
                <xsl:call-template name="press_row"/>
                <xsl:call-template name="contacts_row"/>
            </table>

            <xsl:call-template name="simple_search"/>
            <xsl:call-template name="left_nav_btm_row"/>
        </xsl:when>


        <xsl:otherwise>
            <xsl:choose>
                <xsl:when test="/TC/LoggedIn='true'">
                     <!-- <xsl:call-template name="my_stats"/> -->
                </xsl:when>
                <xsl:otherwise>
                     <!-- <xsl:call-template name="module_login"/> -->
                </xsl:otherwise>
            </xsl:choose>
            
            <table width="170" cellspacing="0" cellpadding="0" border="0">
                <xsl:call-template name="label_row"/>
                <xsl:call-template name="sched_row"/>
                <xsl:call-template name="stats_row"/>
                <xsl:call-template name="feat_row"/>
                <xsl:call-template name="dev_row"/>
                <xsl:call-template name="tourney_row"/>
                <xsl:call-template name="rtables_row"/>
                <xsl:call-template name="rules_row"/>
                <xsl:call-template name="corp_label_row"/>
                <xsl:call-template name="about_row"/>
                <xsl:call-template name="press_row"/>
                <xsl:call-template name="contacts_row"/>
            </table>
          
            <xsl:call-template name="srm_dates"/>
            <xsl:call-template name="calendar"/>
            <xsl:call-template name="simple_search"/>
            <xsl:call-template name="intro"/>
            <xsl:call-template name="left_nav_btm_row"/>
        </xsl:otherwise>
    </xsl:choose>
</xsl:template>

<!-- Navigation Rows Below -->
<xsl:template name="div_line_row">
                <tr><td valign="top"  bgcolor="#000000"><img alt="" width="1" height="1" src="/i/clear.gif" border="0"/></td></tr>
</xsl:template>

<xsl:template name="left_nav_btm_row">
                        <img alt="" width="170" height="23" src="/i/left_nav_btm.gif" border="0"/><br/><br/>
                        <img src="/i/logo_ghosted_bracket.gif" width="160" height="77" alt="[ TopCoder ]" vspace="10" border="0"/>
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

<xsl:template name="label_row">
                <tr><td id="leftNavTitle" >What's Inside:</td></tr>
</xsl:template>

<xsl:template name="read_row">
                <tr><td id="leftNavTitle" >Please Read:</td></tr>
</xsl:template>

<xsl:template name="sched_row">
                <tr><td id="leftNav" ><img alt="" width="10" height="10" src="/i/arrow_white.gif" border="0"/><A class="left"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=schedule&amp;c=index</xsl:attribute>Schedule</A></td></tr>
</xsl:template>

<xsl:template name="stats_row">
                <tr><td id="leftNav" ><img alt="" width="10" height="10" src="/i/arrow_white.gif" border="0"/><A class="left"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/stat?&amp;c=round_overview</xsl:attribute>Statistics</A></td></tr>
</xsl:template>

<xsl:template name="feat_row">
                <tr><td id="leftNav" ><img alt="" width="10" height="10" src="/i/arrow_white.gif" border="0"/><A class="left"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=features&amp;c=index</xsl:attribute>Features</A></td></tr>
</xsl:template>

<xsl:template name="dev_row">
                <tr><td id="leftNav" ><img alt="" width="10" height="10" src="/i/arrow_white.gif" border="0"/><A class="left"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=development&amp;c=index</xsl:attribute>Development</A></td></tr>
</xsl:template>

<xsl:template name="tourney_row">
                <tr><td id="leftNav" ><img alt="" width="10" height="10" src="/i/arrow_white.gif" border="0"/><A class="left"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=tournaments&amp;c=tourny_index</xsl:attribute>Tournaments</A></td></tr>
</xsl:template>

<xsl:template name="rtables_row">
                <tr><td id="leftNav" ><img alt="" width="10" height="10" src="/i/arrow_white.gif" border="0"/><A class="left"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/rtables/index.jsp</xsl:attribute>Round Tables</A></td></tr>
</xsl:template>

<xsl:template name="rules_row">
                <tr><td id="leftNav" ><img alt="" width="10" height="10" src="/i/arrow_white.gif" border="0"/><A class="left"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=support&amp;c=index</xsl:attribute>Support/FAQs</A></td></tr>
</xsl:template>

<xsl:template name="reg_row">
                <tr><td id="leftNav" ><img alt="" width="10" height="10" src="/i/arrow_white.gif" border="0"/><A class="left"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/reg/index.jsp</xsl:attribute>Register</A></td></tr>
</xsl:template>

<xsl:template name="new_mbr_row">
                <tr><td id="leftNav" ><img alt="" width="10" height="10" src="/i/arrow_white.gif" border="0"/><A class="left"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=new_mbr&amp;c=index</xsl:attribute>New Member Tour</A></td></tr>
</xsl:template>

<xsl:template name="terms_row">
                <tr><td id="leftSubnav" ><A class="left"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=&amp;c=terms</xsl:attribute>Terms, Revisions</A></td></tr>
</xsl:template>

<xsl:template name="privacy_row">
                <tr><td id="leftSubnav" ><A class="left"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=&amp;c=privacy</xsl:attribute>Privacy Policy</A></td></tr>
</xsl:template>

<!-- TopCoder Info -->
<xsl:template name="corp_label_row">
                <tr><td id="leftNavTitle" >TopCoder Info:</td></tr>
</xsl:template>

<xsl:template name="about_row">
                <tr><td id="leftNav" ><img alt="" width="10" height="10" src="/i/arrow_white.gif" border="0"/><A class="left"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=about_tc&amp;c=index</xsl:attribute>About Us</A></td></tr>
</xsl:template>

<xsl:template name="press_row">
                <tr><td id="leftNav" ><img alt="" width="10" height="10" src="/i/arrow_white.gif" border="0"/><A class="left"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=news_events&amp;c=index</xsl:attribute>Press Room</A></td></tr>
</xsl:template>

<xsl:template name="contacts_row">
                <tr><td id="leftNav" ><img alt="" width="10" height="10" src="/i/arrow_white.gif" border="0"/><A class="left"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=contacts&amp;c=index</xsl:attribute>Contacts</A></td></tr>
</xsl:template>

<!-- Nav ends -->

</xsl:stylesheet>
