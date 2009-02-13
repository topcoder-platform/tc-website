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
                <jsp:param name="level2" value="review"/> 
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
                        
                        <h2 class="corpHead">Tournaments - Post-Tournament Review</h2>

                        <p>A major attraction of sponsorship as a marketing vehicle is that it can be measured. As part of TopCoder's 
                        integrated marketing program and to aid sponsors in achieving their objective, a post-tournament review 
                        is developed for each sponsor.</p>

                        <p>The post-tournament review includes (but not limited to) the following:</p>
                        
                        <p><span class="bodySubtitle">Overview of TopCoder's Technology Platform and Competition Process</span></p>
                            
                        <p><span class="bodySubtitle">Member Demographics</span></p>
                            
                        <p><span class="bodySubtitle">Tournament Outreach</span></p>
                            
                            <ul>
                                <li><strong>College Effort</strong><br>
                                    Overview of College Outreach<br>
                                    Targeted Schools listings<br>
                                    Emails sent to Faculty<br>
                                    Emails sent to Student Reps<br>
                                    Sponsor Co-branded Campus Posters</li>
                
                                <li><strong>Public Relations</strong><br>
                                    Releases or alerts before first elimination round</li>
                
                                <li><strong>Onsite</strong><br>
                                    Sponsors' Co-branded Posters<br>
                                    Sponsors' Co-branded Speaking Opportunity Pamphlet/Handout</li>
                
                                <li><strong>Sponsors' Technical Presentations (if any)</strong><br>
                                    Emails promoting RSVP for seats</li>
                                
                                <li><strong>Web Site</strong><br>
                                    Home Page promotions<br>
                                    Monthly Calendars</li>
                            </ul></li>
                            
                        <p><span class="bodySubtitle">Tournament Activity</span></p>
                            
                            <ul>
                                <li><strong>Web site</strong><br>
                                    Sponsor Dedicated Area samples<br>
                                    Regional Breakdown<br>
                                    Tourney Schedule<br>
                                    Semifinal Bracketing<br>
                                    Editorial Program</li>

                                <li><strong>Arena Applet</strong><br>
                                    Sample from Lobby<br>
                                    Sample from Coding<br>
                                    Sample from Status<br>
                                    Sample from Leader Board</li>

                                <li><strong>Emails</strong><br>
                                    Match Announcement sample<br>
                                    Match Result sample</li>

                                <li><strong>Onsite</strong><br>
                                    Arena View<br>
                                    Stage<br>
                                    Scoreboard</li>

                                <li><strong>Public Relations</strong><br>
                                    Campus Media<br>
                                    General/Business Media<br>
                                    Trade/Technology Media<br>
                                    Meetings/Interviews<br>
                                    Press Releases/News Coverage</li>
                            </ul></li>

                        <p><span class="bodySubtitle">Post-Tournament Reporting</span></p>
                            
                            <ul>
                                <li><strong>Arena Applet</strong><br>
                                    Survey Questions<br>
                                    Hours spent learning and coding table/graphs<br>
                                    Hours spent by school</li>

                                <li><strong>Collegiate</strong><br>
                                    Advocate Responses<br>
                                    TopCoder in Curriculum<br>
                                    Female Demographics<br>
                                    Emails / Posters Table</li>
                            </ul></li>

                        <p><span class="bodySubtitle">Onsite effort</span></p>

                            <ul>
                                <li><strong>Sponsors Technical Presentation (if any)</strong><br>
                                    Emails<br>
                                    Breakdown of attendees</li>

                                <li><strong>Web Traffic</strong><br>
                                    Week, Page Views, Visitors, Unique Visitors, Sponsor Clicks</li>
                            </ul>

                        <p><br/></p>
                    </td>

<!-- Gutter Begins -->
                    <td width="10"><img src="/i/corp/clear.gif" width="10" height="1" alt="" border="0"></td>
<!-- Gutter Ends -->

<!-- Right Column begins -->
                    <jsp:include page="../../right.jsp">
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
  <jsp:include page="../../foot.jsp"/>
<!-- Footer ends -->

</body>
</html>
