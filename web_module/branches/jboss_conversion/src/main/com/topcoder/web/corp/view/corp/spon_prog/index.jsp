<%@ page contentType="text/html; charset=ISO-8859-1"
         import="com.topcoder.web.corp.Constants,
                 com.topcoder.web.corp.controller.TransactionServlet"
         %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Sponsorship provides companies with an opportunity to educate, interact and brand themselves to the membership</title>

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
                <jsp:param name="level1" value="sponsorship"/>
                <jsp:param name="level2" value="overview"/>
            </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Gutter Begins -->
        <td valign="top"><img src="/i/corp/clear.gif" width="10" height="1" alt="" border="0"></td>

<!-- Gutter Ends -->

<!-- Center Column begins -->
        <td width="100%">
            <table width="100%" border="0" cellpadding="0" cellspacing="0">


                <tr valign="top">
                    <td class="bodyText" width="99%">
                        <img src="/i/corp/clear.gif" width="1" height="10" alt="" border="0"><br>

                        <div align="center"><img src="/i/corp/tcms_header.gif" width="530" height="76" alt="" border="0"><br/>
                        <img src="/i/corp/marketing_image.jpg" width="530" height="220" alt="" border="0">
                        </div>

                        <p><span class="bodySubtitle">Reaching the TopCoder Community</span><br>
                        TopCoder has created an online venue that brings together some of the most talented developers
                        from around the world.  Each week, TopCoder hosts an online programming competition (Single Round Match)
                        during which developers compete for ratings and bragging rights, and to hone their skills for our
                        large <a href="/corp/?module=Static&d1=corp&d2=spon_prog&d3=market_tourny">tournaments</a>.</p>

                        <p><img src="/i/corp/quote_reggie.gif" width="252" height="123" alt="" border="0" align="right"><span class="bodySubtitle">First of Its Kind</span><br>
                        TopCoder competitions offer a venue previously unavailable to the programming world - real-time competitions
                        that are judged immediately and objectively.  With TopCoder, technologists
                        from around the world are able to compete online in a short and concentrated amount of time.  Moreover,
                        with each weekly Single Round Match lasting only 90-minutes, programmers don't have to sacrifice as much
                        free time to compete and have the chance to compete more often.</p>

                        <p><span class="bodySubtitle">Sponsorship Programs</span><br>
                        TopCoder's Sponsorship Program provides companies with an ability to educate, interact with and market
                        themselves to the member base. This is accomplished by putting sponsoring companies in front of developers
                        in the most applicable places during the most visited times.</p>

                        <p>TopCoder offers a unique opportunity to sponsor diverse events that are designed to meet and exceed
                        your marketing goals. Choose to sponsor the event that is right for you:</p>



                        <ul>
                            <span class="listSubtitle"><a href="/corp/?module=Static&d1=corp&d2=spon_prog&d3=market_tourny">Tournaments</a></span><br>
                            <li>Held biannually</li>
                            <li>Title, Premier and Corporate sponsorships available</li>
                            <li>Online and onsite over a 10 - 12 week period</li>
                            <li>Sponsors promoted on TopCoder website, competition arena, opt-in email and onsite</li>
                            <li>Extensive PR</li>
                        </ul>

                        <ul>
                            <span class="listSubtitle"><a href="/corp/?module=Static&d1=corp&d2=spon_prog&d3=market_conference">Conference Events</a></span><br>
                            <li>For designated developers (conference attendees, emloyees, etc.)</li>
                            <li>Customized for your business needs</li>
                            <li>Online and/or onsite</li>

                        </ul>


                        <p><span class="bodySubtitle">The TopCoder Advantage</span><br>
                        TopCoder offers sponsorships to companies trying to reach a powerful community of technologists.  This highly sought after
                        demographic influences technology buying decisions for thousands of companies.  They dictate the future direction of
                        technology and manage thousands of people.</p>

                        <p>For more information, contact Paul Moriarty at <a href="mailto:sponsorships@topcoder.com?subject=Request For Information - Sponsorship">sponsorships@topcoder.com</a> or 866.TOP.CODE</p>

                        <p><br></p>
                    </td>

<!-- Gutter -->
                    <td width="10"><img src="/i/corp/clear.gif" width="10" height="1" alt="" border="0"></td>
<!-- Gutter Ends -->

<!-- Right Column begins -->
                    <jsp:include page="/right.jsp">
                        <jsp:param name="level1" value="sponsor"/>
                        <jsp:param name="level2" value="srm_index"/>
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
