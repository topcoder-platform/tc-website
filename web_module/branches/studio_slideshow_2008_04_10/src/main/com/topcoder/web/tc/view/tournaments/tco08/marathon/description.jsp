<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page contentType="text/html;charset=utf-8" %> 
<%@ page import="com.topcoder.web.common.model.EventType" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>The 2008 TopCoder&reg; Open - Get ready for the Ultimate TopCoder Event!</title>
<link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
<link type="text/css" rel="stylesheet" href="/css/tournaments/tco08.css"/>
<link type="text/css" rel="stylesheet" href="/css/coders.css"/>
<script language="JavaScript" type="text/javascript" src="/js/arena.js"></script>
</head>
<body id="page_sub">

<div id="wrapper">

    <jsp:include page="../nav.jsp" >
    <jsp:param name="tabLev1" value="<%=EventType.MARATHON_TOURNAMENT_ID%>"/>
    <jsp:param name="tabLev2" value="description"/>
    <jsp:param name="tabLev3" value=""/>
    </jsp:include>


        <h2>Marathon Competition</h2>
        
        <div class="sub_content">
            <p>As part of the 2008 TopCoder Open, the Marathon Competition provides a more flexible format with an extended timeline that offers different types of problems than what can be offered in the Algorithm Competition. Competitors may submit code in the following languages: Java, C++, C#, VB.NET and Python.</p>
            <p>After three rounds of elimination, we will narrow the field down to the top twelve finalists from around the world to attend the Championship Round in Las Vegas, Nevada, USA, May 11 - May 15, 2008.</p>
            
            <h3>How does it work?</h3>
            <p>Every eligible participant that registers for the competition will be able to open the problem statement at the same time. Unlike traditional algorithm competitions, the system is not necessarily testing for correctness. In the Marathon Competition, the scoring mechanism may be different for each problem. A description of the scoring mechanism will be provided in the problem statement. Competitors will have to understand the scoring mechanism in order to effectively compete.</p>
            <p>Clicking the Submit link will take you to a page that will allow you to paste in a solution, select the proper language and either submit (for compilation and testing) or save your code. When the Submit button is selected, the code will be immediately compiled. Any compilation messages or errors will be shown in the Messages Area. If the compilation was successful, the submission will then be placed on a queue for automated testing. Example test cases will not be tested. When your submission has been processed, you will receive an email indicating such and your place in the standings will be adjusted accordingly.</p>
            <p>Clicking the Test Examples button will immediately compile and place your submission on a queue for automated testing of just the example test cases. Detailed feedback will be made available when the tests are complete, including processing time, score, and any output from the program. Competitors may submit test examples once every 30 minutes. The competitor's rank and overall score will not be updated.</p>
            <p>Competitors are encouraged to improve solutions and resubmit throughout the submission phase. The most recent submission is the one that will always count towards the standings.</p>
            
            <h3>System Testing</h3>
            <p>Once time is up for submitting, each submission will be run against a larger set of test cases and be issued a final score. This final score will determine the rankings of the match and the advancers of the round.</p>
            <p>When is the competition? See the schedule <a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco08&amp;d3=marathon&amp;d4=schedule">here</a>.</p>
            <p>It is important for you to read the official <a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco08&amp;d3=marathon&amp;d4=rules">rules and regulations</a> for more details.</p>
            <p>The competition is free and you must be a member who is 18 years or older, as well as meet all eligibility criteria, in order to participate.</p>
    
        </div><%-- .sub_content --%>
        
</div><%-- #content --%>
<jsp:include page="../footer.jsp" />

</div><%-- #wrapper --%>

</body>
</html>
