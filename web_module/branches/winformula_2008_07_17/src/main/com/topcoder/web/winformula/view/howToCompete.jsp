<%@ page import="com.topcoder.shared.util.ApplicationServer" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=utf-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
    <title>ESPN Winning Formula Challange :: Powered by TopCoder - How To Compete</title>
    <%-- Meta Tags --%>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <jsp:include page="style.jsp">
        <jsp:param name="key" value="tc_winformula"/>
    </jsp:include>
    <script type="text/javascript" src="js/scripts.js"></script>
  
</head>

<body>
    <div id="wrapper">
    <%-- Wrapper --%>
    
        <jsp:include page="nav.jsp">
        <jsp:param name="tabLev1" value="compete" />
        <jsp:param name="tabLev2" value="" />
        <jsp:param name="tabLev3" value="" />
        </jsp:include>
        
        <div id="container">
        <%-- Container --%>
        <div id="main-content">
        <%-- Main Content --%>
        
        
            <h1>How to Compete</h1>
            <div class="full-content">
                <div align="center"><img src="/i/events/winformula/timeline.png" alt="Winning Formula Timeline" /></div>
                <br /><br />
                <p>Participation in ESPN Winning Formula Challenge is completely FREE! Just follow the simple steps below and you'll be on your way to possibly claiming some of our $100,000 in prize money!</p>
                <ol class="howCompete">
                    <li><strong><a href="/reg/" target="_blank">Sign up</a> for FREE to become a TopCoder member</strong> (select at least the &quot;Competition Registration&quot; checkbox)<br />
                    ESPN Winning Formula Challenge is run using a TopCoder programming contest. TopCoder members are a worldwide community of programmers who compete in algorithm and development contests for prize money. Become a member now to compete in this challenge and other TopCoder contests! If you are already a TopCoder member, go to step to. <a href="/reg/" target="_blank">Sign up at TopCoder &gt;&gt;</a></li>
                    <li><strong><a href="http://<%=ApplicationServer.WINFORMULA_SERVER_NAME%>/?module=ViewRegistration&amp;ct=1001">Register</a> for the Winning Formula Challenge</strong><br />
                    If you are already a TopCoder member, all you have to do is register for the Winning Formula Challenge! Register now to participate in this contest! <a href="http://<%=ApplicationServer.WINFORMULA_SERVER_NAME%>/?module=ViewRegistration&amp;ct=1001">Contest registration &gt;&gt;</a></li>
                    <li><strong><a href="http://<%=ApplicationServer.WINFORMULA_SERVER_NAME%>/?module=SecureStatic&amp;d1=downloadStats">Download ESPN's statistical data</a> and build your algorithm</strong><br />
                    Once you've registered, you'll need to download ESPN's statistical data on which your algorithm will be basing its predictions. Use this data to build your algorithm. <a href="http://<%=ApplicationServer.WINFORMULA_SERVER_NAME%>/?module=Static&amp;d1=downloadStats">Download the data &gt;&gt;</a>And <a href="http://<%=ApplicationServer.WINFORMULA_SERVER_NAME%>/?module=Static&amp;d1=problemStatement">view the problem statement &gt;&gt;</a></li>
                    <li><strong><a href="http://<%=ApplicationServer.WINFORMULA_SERVER_NAME%>/?module=Static&amp;d1=manageMyAlgorithms">Submit your algorithm</a> each week</strong> (through week 11)<br />
                    You can submit your algorithm each week until the start of that week's first game. The season starts on week 1 and you may continue to update your algorithm through week 11. After week 11 you may not make any changes to your algorithm and your latest uploaded algorithm will be used for the remainder of the season (weeks 12-15). <a href="http://<%=ApplicationServer.WINFORMULA_SERVER_NAME%>/?module=Static&amp;d1=manageMyAlgorithms">Submit your algorithm &gt;&gt;</a></li>
                    <li><strong><a href="http://<%=ApplicationServer.WINFORMULA_SERVER_NAME%>/?module=Static&amp;d1=howToCompete">Win Cash!</a></strong><br />
                    Prizes will be awarded to the season winner and possibly to the next nine finishers. Weekly prizes will also be awarded, even for the &quot;preseason&quot; weeks. While the prize breakout is to be determined, there will be a total of $100,000 awarded!</li>
                </ol>
            </div>
        
        <%-- Main Content --%>
        </div>
        <%-- End Container --%>
        </div>

    <div id="footer">
    <%-- Footer --%>
    </div>
    
<%-- End Wrapper --%>
</div>
</body>
</html>
