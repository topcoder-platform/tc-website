<%@ page contentType="text/html; charset=ISO-8859-1"
         import="com.topcoder.web.corp.Constants,
                 com.topcoder.web.corp.controller.TransactionServlet"
         %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Sponsor a TopCoder Computer Programming Tournament</title>

<jsp:include page="../includes/css.jsp" />

<script language="JavaScript" type="text/javascript" src="/js/script.js"></script>

</head>

<body>

<!-- Top begins -->
<jsp:include page="../includes/top.jsp" >
    <jsp:param name="level1" value="sponsorship"/>
</jsp:include>
<!-- Top ends -->

<table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr valign="top">

<!-- Left Column Begins -->
        <td width="170">
            <jsp:include page="../includes/left.jsp">
                <jsp:param name="level1" value="tourny"/>
                <jsp:param name="level2" value="media"/>
            </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Gutter Begins -->
        <td valign="top"><img src="/i/corp/clear.gif" width="10" height="1" alt="" border="0"></td>
        <td valign="top" width="7"><img src="/i/corp/title_brackets.gif" width="7" height="47" alt="[ ]" border="0"></td>
<!-- Gutter Ends -->

<!-- Center Column begins -->
        <td width="100%">
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top"><td id="corpTitle" width="100%" colspan="3"><img src="/i/corp/header_event_sponsorship.gif" alt="" width="546" height="41" border="0"></td></tr>

                <tr valign="top">
                    <td class="bodyText" width="99%">
                        <img src="/i/corp/clear.gif" width="1" height="10" alt="" border="0"><br>

                        <h2 class="corpHead">Tournament - Media Coverage</h2>

                        <table cellpadding="10" cellspacing="0" border="0" align="right">
                        <tr><td><table border="0" cellpadding="6" cellspacing="0" class="sidebarBox">
                            <tr><td class="sidebarTitle">TOURNAMENT PACKAGE LINKS:</td></tr>

                            <tr valign="top">
                                <td class="sidebarText">
                                    <a href="/tc?module=Static&d1=corp&d2=spon_prog&d3=tourny_index">Tournament Overview</a><br />
                                    <a href="/tc?module=Static&d1=corp&d2=spon_prog&d3=tourny_web">Web site coverage</a><br />
                                    <a href="/tc?module=Static&d1=corp&d2=spon_prog&d3=tourny_applet">Applet coverage</a><br />
                                    <a href="/tc?module=Static&d1=corp&d2=spon_prog&d3=tourny_email">Email distribution</a><br />
                                    <strong>Media Coverage</strong><br />
                                    <a href="/tc?module=Static&d1=corp&d2=spon_prog&d3=tourny_onsite">On-site arena</a><br />
                                    <a href="/tc?module=Static&d1=corp&d2=spon_prog&d3=tourny_pr">Public relations</a><br />
                                    <a href="/i/srm_3pgr.pdf">Download Overview (PDF)</a><br />
                                </td>
                            </tr>
                        </table></td></tr>
                        </table>

                        <p>The success of a tournament affects not only a sponsor, but also TopCoder. Media coverage of a tournament
                        is a critical component and one that continues to be built upon and revisited for every tournament to
                        ensure awareness, understanding, impact, and entertainment.</p>

                        <p>However, given the obvious desire for success on a sponsor's part, it is as much a responsibility
                        of the sponsor to promote a tournament as it is TopCoder's. Promoting sponsorship of a tournament
                        through established communications such as internal email newsletters and company websites
                        demonstrate both support for the developer community and an interest in the success of the tournament.</p>

                        <p>TopCoder's growth and marketing is largely based on word of mouth. This is based on the fact that
                        every week 30&#37; of Students and 18&#37; of Professional members indicate "Member Referral"
                        as how they learned of TopCoder.</p>

                        <p>The following media programs are conducted with all tournament marketing:</p>

                        <ul>
                            <li><strong>Campus Posters</strong><br>
                            TopCoder maintains a presence at over 400 schools nationwide. Posters are displayed in multiple
                            places on campus and are placed by either a postering company or by a Student Representative</li><br>

                            <li><strong>Video News Release</strong><br>
                            In past tournaments, footage from the tournament semifinals and finals was run in 6 different
                            markets, TopCoder continues with this in an effort to build recognition for members and sponsors</li><br>

                            <li><strong>Campus Newspaper</strong><br>
                            In the weeks before tournament elimination rounds begin, ads are run at 50 schools across the
                            country</li><br>

                            <li><strong>Local Efforts</strong><br>
                            We research the geographic for the most relevant venues to promote the tournament</li><br>

                            <li><strong><a href="?module=Static&d1=corp&d2=spon_prog&d3=tourny_pr">Public Relations</a></strong><br>
                            Outreach for every tournament begins immediately following the signing of a sponsor.</li>
                        </ul>

                        <p><a href="?module=Static&d1=corp&d2=spon_prog&d3=srm_index">What is the SRM Program?</a></p>

                        <p><br/></p>
                    </td>

<!-- Gutter Begins -->
                    <td width="10"><img src="/i/corp/clear.gif" width="10" height="1" alt="" border="0"></td>
<!-- Gutter Ends -->

<!-- Right Column begins -->
                    <jsp:include page="/right.jsp">
                        <jsp:param name="level1" value="tourny"/>
                        <jsp:param name="level2" value="media"/>
                    </jsp:include>
<!-- Right Column ends -->

                </tr>
            </table>
        </td>
<!-- Center Column ends -->
    </tr>
</table>

<!-- Footer begins -->
  <jsp:include page="/foot.jsp"/>
<!-- Footer ends -->

</body>
</html>
