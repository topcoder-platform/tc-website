<%@ page import="com.topcoder.shared.util.ApplicationServer" %>
<div id="leftNav">
    <ul>
        <li><a href="/admin/">Admin Home</a></li>
        <li><a href="/admin/?module=Static&d1=contestHome">Contest Admin</a></li>
        <li><a href="/admin/?module=TermsList">Terms of Use Admin</a></li>
        <li><a href="/admin/?module=SurveyList">Survey Admin</a></li>
        <li><a href="/report">TopCoder Reporting</a></li>
        <li><a href="/email/emailServlet">Mass Email System</a></li>
        <li><a href="/query/query">Query Tool</a></li>
        <li><a href="/longcontest/?module=AdminHome">Long Contest Admin</a></li>
        <li><a href="/admin/?module=VisaLetters">Visa Letters</a></li>
        <li><a href="/admin/?module=CleanSchools">Clean Schools</a></li>
        <li><a href="/admin/?module=IntroEventList">Intro Events</a></li>
        <li><a href="/admin/?module=ProjectContestSetup&catid=1">Contest Project Setup</a></li>
        <%--<li><a href="/admin/?module=Static&d1=info">HELP!</a></li>--%>
        <li><a href="/education/admin/">Educational Platform Admin</a></li>
        <li><a href="http://<%=ApplicationServer.FORUMS_SERVER_NAME%>/jive4/admin">TC Forums Admin</a></li>
        <li><a href="http://<%=ApplicationServer.STUDIO_SERVER_NAME%>/jive4/admin">Studio Forums Admin</a></li>
        <li><a href="/PactsInternalServlet">PACTS Admin</a></li>
    </ul>
</div>

