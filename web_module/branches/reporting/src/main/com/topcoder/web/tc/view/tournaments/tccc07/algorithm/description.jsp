<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page contentType="text/html;charset=utf-8" %> 
<%@ page import="com.topcoder.web.common.model.EventType" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>2007 TopCoder Collegiate Challenge - Computer Programming Tournament</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <link type="text/css" rel="stylesheet" href="/css/tournaments/tccc07.css"/>
    <link type="text/css" rel="stylesheet" href="/css/coders.css"/>
    <jsp:include page="../../script.jsp" />
</head>
<body>

<div align="center" style="background: transparent;">
    <div id="containAll">
    <div id="content">

        <jsp:include page="../nav.jsp" >
        <jsp:param name="tabLev1" value="<%=EventType.ALGORITHM_TOURNAMENT_ID%>"/>
        <jsp:param name="tabLev2" value="description"/>
        <jsp:param name="tabLev3" value=""/>
        </jsp:include>

            <div id="pageBody">
                <h1><span>Algorithm Competition</span></h1>
                
                <p>The Algorithm competition, part of the 2007 TopCoder Collegiate Challenge, is a timed contest where all contestants compete online and are given the same problems to solve under the same time constraints.  The competition is available in four programming languages:  Java, C#, C++, and VB.NET.</p>

                <p>Each online and onsite round of competition (including the Qualification Rounds) consists of three phases: Coding Phase, Challenge Phase, and System Testing Phase. (Note: The format of these competition rounds is similar to the format of TopCoder Single Round Matches.)</p>
                    <ul>
                        <li>The Coding Phase is a timed event where all contestants are presented with the same three questions representing three levels of complexity and, accordingly, three levels of point earnings potential. Points for a problem are awarded upon submission of any solution that successfully compiles and are calculated on the total time elapsed from the time the problem was opened until the time it was submitted. During the online rounds, the Coding Phase will last 75 minutes. During the onsite rounds, the Coding Phase will last 85 minutes.</li>
                        <li>The Challenge Phase is a timed event wherein each competitor has a chance to challenge the functionality of other competitors' code. A successful challenge will result in a loss of the original problem submission points by the defendant, and a 50-point reward for the challenger. Unsuccessful challengers will incur a point reduction of 25 points as a penalty, applied against their total score in that round of competition. During the online rounds, the Challenge Phase will last 15 minutes. During the onsite rounds, the Challenge Phase will last 10 minutes.</li>
                        <li>The System Testing Phase is applied to all submitted code that has not already been successfully challenged. If the TopCoder System Test finds code that is flawed, the author of that code submission will lose all of the points that were originally earned for that code submission. The automated tester will apply a set of inputs, expecting the output from the code submission to be correct. If the output from a coder's submission does not match the expected output, the submission is considered flawed. The same set of input/output test cases will be applied to all code 
                        submissions for a given problem. All successful challenges from the Challenge Phase will be added to the sets of inputs for the System Testing Phase.</li>
                    </ul>
                <p>When is the competition?  See the schedule <a href="/tc?module=Static&d1=tournaments&d2=tccc07&d3=algorithm&d4=schedule" alt="TCCC07 Algorithm Schedule">here.</a></p>

                <p>It is important for you to read the official <a href="/tc?module=Static&d1=tournaments&d2=tccc07&d3=algorithm&d4=rules" alt="TCCC07 Algorithm Rules &amp; Regulations">rules and regulations</a> for more details.</p>
                <p>We encourage you to utilize the TopCoder practice rooms in the competition arena prior to competing.</p>
                <p>The competition is free and you must be an 18 years or older collegiate member, as well as meet all eligibility criteria, in order to participate.</p>


            </div>
    </div>
    <jsp:include page="../footer.jsp" />
    </div>
</div>
</body>
</html>