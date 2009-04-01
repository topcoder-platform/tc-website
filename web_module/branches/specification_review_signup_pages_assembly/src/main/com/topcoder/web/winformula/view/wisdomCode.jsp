<%@ page import="com.topcoder.shared.util.ApplicationServer" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=utf-8" %>
<%@page import="com.topcoder.web.winformula.Constants"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
    <title>ESPN Winning Formula Challenge :: Powered by TopCoder - Wisdom of the Code</title>
    <%-- Meta Tags --%>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <jsp:include page="style.jsp">
        <jsp:param name="key" value="tc_winformula"/>
    </jsp:include>
</head>

<body>
    <div id="wrapper">
    <%-- Wrapper --%>
    
        <jsp:include page="nav.jsp">
        <jsp:param name="tabLev1" value="homepage" />
        <jsp:param name="tabLev2" value="" />
        <jsp:param name="tabLev3" value="" />
        </jsp:include>
        
        <div id="container">
        <%-- Container --%>
        <div id="main-content">
        <%-- Main Content --%>
        
            <h1>Wisdom of the Code</h1>
                <div class="full-content">
                    <p>In addition to competing against each other, participants of the ESPN Winning Formula Challenge will also be competing against two additional "competitors". These users' predictions will represent the collective predictions, or the "Wisdom of the Code" gathered from the algorithmic predictions of all of our <em>human</em> competitors.</p>
                    <p>The first WoC user, <a href="http://<%=ApplicationServer.WINFORMULA_SERVER_NAME%>/?module=ViewProfile&cr=<%=Constants.WISDOM_ALL%>">"WisdomOfAll"</a>, will represent the collective predictions of every other individual competitor. The weekly predictions made by this user will leverage all of the algorithmic prediction power in the competition in order to make the most informed collective prediction possible. Its predicted score will be the average score returned from all predictions for each side.</p>
                    <p>The other WoC user, <a href="http://<%=ApplicationServer.WINFORMULA_SERVER_NAME%>/?module=ViewProfile&cr=<%=Constants.WISDOM_BEST%>">"WisdomOfTheBest"</a>, will leverage only the collective power of the elite ten algorithms in order to make its own prediction. At the time that predictions are made, those of current top ten, season-to-date, highest scoring algorithms will be aggregated in the same manner as with the WisdomOfAll in order to generate the WisdomOfTheBest predictions.</p>
                    <p>The <a href="http://<%=ApplicationServer.WINFORMULA_SERVER_NAME%>/?module=ViewProfile&cr=<%=Constants.WISDOM_ALL%>">WisdomOfAll</a>, and <a href="http://<%=ApplicationServer.WINFORMULA_SERVER_NAME%>/?module=ViewProfile&cr=<%=Constants.WISDOM_BEST%>">WisdomOfTheBest</a> users will be scored and will appear in the statistics and the standings as if they were traditional competitors in the competition. They, of course, will not be eligible for prizes and will not take away any prize positions from other competitors. This will allow competitors to benchmark their own algorithms against the Wisdom of the Code, and you can check to see how any individual member stacks up by looking at their ESPN WFC profile page.</p>
                </div>


        </div>
        
  </div>
  
  <div id="footer">
  <%-- Footer --%>
  </div>

<%-- End Wrapper --%>
</div>    
</body>
</html>