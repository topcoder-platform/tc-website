<%@ page contentType="text/html;charset=utf-8" %> 
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>2007 TopCoder Open - Computer Programming Tournament</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <link type="text/css" rel="stylesheet" href="/css/tournaments/tco07.css"/>
    <link type="text/css" rel="stylesheet" href="/css/coders.css"/>
    <jsp:include page="../../script.jsp" />
</head>
<body>

<div align="center" style="background: transparent;">
    <div id="content">

        <jsp:include page="../header.jsp" />

        <table cellpadding="0" cellspacing="0" id="spacer">
        <tbody>
            <tr>
                <td id="navSpacer">

                    <jsp:include page="../nav.jsp" >
                    <jsp:param name="tabLev1" value="marathon"/>
                    <jsp:param name="tabLev2" value="description"/>
                    <jsp:param name="tabLev3" value=""/>
                    </jsp:include>

                </td>
                <td id="bodySpacer" width="100%">
                    <div id="pageBody">

                        <h1><span>Marathon Match Competition</span></h1>
<p>
As part of the 2007 TopCoder Open, the Marathon Match Competition provides a more flexible format with an extended timeline that offers different types of problems than what can be offered in a traditional TopCoder algorithm round.  Competitors may submit code in the following languages:  Java, C++, C#, VB.NET and Python.
</p>
<p>
After four rounds of elimination, we will narrow the field down to the top eight finalists from all around the world to attend the Championship Round in Las Vegas, Nevada, USA on June 26 - June 29, 2007.
</p>
<h2>How does it work?</h2>
<p>
Every eligible participant that registers for the competition will be able to open the problem statement at the same time.  Unlike traditional algorithm competitions, the system is not necessarily testing for correctness. In Marathon Matches, the scoring mechanism may be different for each problem. A description of the scoring mechanism will be provided in the problem statement. Competitors will have to understand the scoring mechanism in order to effectively compete.
</p>
<p>
Clicking the Submit link will take you to a page that will allow you to paste in a solution, select the proper language and either submit (for compilation and testing) or save your code. When the Submit button is selected, the code will be immediately compiled. Any compilation messages or errors will be shown in the Messages Area. If the compilation was successful, the submission will then be placed on a queue for automated testing. Example test cases will not be tested. When your submission has been processed, you will receive an email indicating such and your place in the standings will be adjusted accordingly. 
</p>
<p>
Clicking the Test Examples button will immediately compile and place your submission on a queue for automated testing of just the example test cases. Detailed feedback will be made available when the tests are complete, including processing time, score, and any output from the program. Competitors may submit test examples once every 30 minutes. The competitor's rank and overall score will not be updated.
</p>
<p>
Competitors are encouraged to improve solutions and resubmit throughout the submission phase.  The most recent submission is the one that will always count towards the standings.  
</p>
<h2>System Testing</h2>
<p>
Once time is up for submitting, each submission will be run against a larger set of test cases and be issued a final score.  This final score will determine the rankings of the match and the advancers of the round.
</p>
<p>
When is the competition?  See the <A href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco07&amp;d3=marathon&amp;d4=schedule">schedule</A>.
</p>
<p>
It is important for you to read the official <A href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco07&amp;d3=marathon&amp;d4=rules">rules and regulations</A> for more details.  
</p>
<p>
The competition is free and you must be 18 years or older, as well as meet all eligibility criteria, in order to participate.
</p>
<%--
<h2>How to Register for the Marathon Match Competition</h2>
<p>
<strong>Already a TopCoder Member?</strong><br>
Click <A href="/tc?module=TCO07ViewRegistration&amp;ct=marathon">here</A> to register for the TCO07 Marathon Match Competition.
</p>
<p>
<strong>Not Yet a TopCoder Member?</strong><br>
Click <A href="/reg/">here</A> to register as a TopCoder member.<br>
Check your email and activate your new TopCoder account.<br>
Click <A href="/tc?module=TCO07ViewRegistration&amp;ct=marathon">here</A> to register for the TCO07 Marathon Match Competition
</p>
--%>
                    </div>
                </td>
            </tr>
        </table>


        <jsp:include page="../footer.jsp" />
    </div>
</div>

</body>

</html>
