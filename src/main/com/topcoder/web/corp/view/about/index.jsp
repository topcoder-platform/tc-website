<%@ page contentType="text/html; charset=ISO-8859-1"
         autoFlush="false"
         buffer="64kb"
         import="com.topcoder.web.corp.Constants"
         errorPage="../exc/InternalError.jsp" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder | Corporate Services</title>

<jsp:include page="../includes/css.jsp" />

<script language="JavaScript" type="text/javascript" src="/js/script.js"></script>

</head>

<body>

<!-- Top begins -->
<jsp:include page="../includes/top.jsp"/>
<!-- Top ends -->

<table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr>

<!-- Left Column Begins -->
        <td width="170" valign="top" class="leftColumn">
            <jsp:include page="../includes/left.jsp">
                <jsp:param name="level1" value="about"/>
                <jsp:param name="level2" value="index"/>
            </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Gutter Begins -->
        <td valign="top"><img src="/i/clear.gif" width="10" height="1"></td>
<!-- Gutter Ends -->

<!-- Center Column begins -->
        <td width="100%" valign="top"><img src="/i/clear.gif" width="400" height="1" vspace="5" border="0"><br>
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr>
                    <td class="bodyText" width="100%">
                        <h1 class="testHead">About TopCoder Corporate Services</h1>
                        <p>TopCoder is fast becoming the major league for programming competitions. TopCoder brings members together once a week 
                        to compete online (Single Round Match) and twice a year both online and on location (Tournaments).</p>

                        <p><strong>Why Online Competitions</strong><br>
                        Competitions provide an understanding of a person's capabilities through a demonstration of skill. What was lacking in the 
                        world of programming competitions was a format that offered immediate and objective scoring. The solution was the creation 
                        of a <a href="http://www.topcoder.com/index?t=about_tc&c=spons_srm">"Single Round Match"</a> (SRM).</p>

                        <p>In order to drive repeated participation, TopCoder developed <a href="http://www.topcoder.com/index?t=about_tc&c=spons_tourny">"Tournaments"</a> 
                        that offer larger cash prizes to the members who successfully code their way through weekly Single Round Matches and 
                        build a rating that puts them in a seeding for either  the Invitational Tournament (open to all members) or Collegiate 
                        Challenge (open to college students only).</p>

                        <p><strong>Who Benefits</strong></p>
                        
                        <ul>
                            <li>Members<br>
                            Each Single Round Match offers a fun, time-based, and challenging set of problems that put a developer's skills to the test. 
                            TopCoder is in the process of establishing Teams . This coupled with the new Divisions will offer a more level field of 
                            competition for newer members in order to build ratings and move into potential tournament opportunities. </li>

                            <li>Sponsors<br>
                            Reaching the developer community is a difficult task at best. Marketing budgets are limited and with the advent of the 
                            Internet, the expectation for measuring results has only grown. TopCoder offers companies a means of targeting this 
                            desired community through the targeted sponsorship of Single Round Matches and Tournaments. </li>


                            <li>Employers<br>
                            The market for developers is either feast or famine. Regardless of how many developers there are or how many are 
                            available, the issue remains the same&#151;how to determine which candidate is best suited to the needs of your 
                            organization. While certification has offered some credibility, competitions that test a developer's skills in real-world 
                            challenges goes much further to differentiating one candidate from another. </li>
                        </ul>
                    </td>
                </tr>
            </table>

            <p><br/></p>

        </td>
<!-- Center Column ends -->

<!-- Gutter -->
        <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<!-- Gutter Ends -->
    </tr>
</table>

<!-- Footer begins -->
  <jsp:include page="../includes/foot.jsp"/>
<!-- Footer ends -->

</body>
</html>
