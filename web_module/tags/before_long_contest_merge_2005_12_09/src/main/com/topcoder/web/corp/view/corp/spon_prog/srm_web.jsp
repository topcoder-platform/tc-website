<%@ page contentType="text/html; charset=ISO-8859-1"
         import="com.topcoder.web.corp.Constants,
                 com.topcoder.web.corp.controller.TransactionServlet"
         %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Sponsor a TopCoder Single Round Match</title>

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
                <jsp:param name="level1" value="srm"/>
                <jsp:param name="level2" value="web"/>
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

                        <h2 class="corpHead">SRMs - TopCoder Web Site</h2>

                        <p>TopCoder.com is the primary medium for introducing prospective members to the concept of weekly programming
                        competitions. Additionally, the site serves the membership with a "trading card" approach where every member has
                        a complete set of statistics accompanying their profile.</p>

                        <p>Please note, membership information is viewable to a certain extent on the public side of the site. Rating and earning
                        history, match performance, code submissions, challenges, and more are available only to registered members.</p>

                        <p>The following page placements are included in the SRM Sponsorship Program (red blocks indicate sponsor area):</p>

                        <div align="center">
                        <table width="75%" border="0" cellpadding="0" cellspacing="0">
                            <tr valign="top">
                                <td width="33%" align="center">
                                    <p><img src="/i/corp/publichome.gif" alt="" width="135" height="205" border="0"/></p>
                                    <p><img src="/i/corp/statsindex.gif" alt="" width="135" height="205" border="0"/></p>
                                    <p><img src="/i/corp/matchsummary.gif" alt="" width="135" height="205" border="0"/></p>
                                </td>

                                <td width="33%" align="center">
                                    <p><img src="/i/corp/memberhome.gif" alt="" width="135" height="205" border="0"/></p>
                                    <p><img src="/i/corp/calendar.gif" alt="" width="135" height="205" border="0"/></p>
                                    <p><img src="/i/corp/matchresults.gif" alt="" width="135" height="205" border="0"/></p>
                                </td>

                                <td width="33%" align="center">
                                    <p><img src="/i/corp/registration.gif" alt="" width="135" height="205" border="0"/></p>
                                    <p><img src="/i/corp/matchoverview.gif" alt="" width="135" height="205" border="0"/></p>
                                </td>
                            </tr>
                        </table>
                        </div>

                        <p><strong>Note</strong> - TopCoder marketing will work with a sponsor's internal or external creative team to develop all
                        graphics necessary for the web site at no additional cost to sponsors.</p>

                        <p><a href="?module=Static&d1=corp&d2=spon_prog&d3=tourny_index">What is the Tournament Program?</a></p>

                        <p><br/></p>
                    </td>

<!-- Gutter -->
                    <td width="10"><img src="/i/corp/clear.gif" width="10" height="1" alt="" border="0"></td>
<!-- Gutter Ends -->

<!-- Right Column begins -->
                    <jsp:include page="/right.jsp">
                        <jsp:param name="level1" value="srm"/>
                        <jsp:param name="level2" value="web"/>
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
