<html>

<head>

<title>TopCoder | High School</title>

<meta name="description" content="TopCoder is a programming tournament site. All members who compete attain a rating that provides a metric for coding competence and potential. These ratings, coupled with tournament performance, can lead to monetary rewards and employment opportunities."/>
<meta name="keywords" content="Computer Jobs, Programming, Programming Jobs, Programming Contest, Programming Competition, Online Games, Coding, Information Technology Jobs, Java, C++"/>

<jsp:include page="../includes/css.jsp" />

</head>

<body>

<!-- Top begins -->
<jsp:include page="../includes/top.jsp" />
<!-- Top ends -->

<table border="0" cellspacing="0" cellpadding="0" width="100%">
    <tr valign="top">

<!-- Left Column begins -->
        <td width="170" bgcolor="#001934">
            <jsp:include page="../includes/left_nav.jsp" />
            <jsp:include page="../includes/left_calendar.jsp" />
        </td>
<!-- Left Column begins -->
        
<!-- Center Column begins -->
        <td valign="top" width="99%">
            <table cellspacing="0" cellpadding="20" border="0" width="100%">
                <tr valign="top">
                    <td height="100%" class="statTextBig">

                        <div align="center">
                        
                        <jsp:include page="../includes/tchs03_head_tourney.jsp" />

                        <jsp:include page="../includes/tchs03_tabs.jsp" >
                            <jsp:param name="isRulesPage" value="true"/>
                        </jsp:include>

                        <jsp:include page="../includes/tchs03_rules_subnav.jsp" >
                            <jsp:param name="isStructurePage" value="true"/>
                        </jsp:include>

                        <h3>2003 TopCoder High School Challenge<br>Official Rules and Regulations</h3>
                        
                        </div>
                        
                        <p><font size="3"><strong>Competition Round Structure</strong></font><br>
                        Each round of competition consists of three phases: the Coding Phase, Challenge Phase, and System Testing Phase.</p>
                        
                        <ul>
                            <li>The Coding Phase is a timed event where all contestants are presented with the same three questions representing 
                            three levels of complexity and, accordingly, three levels of point earnings potential. Points for a problem are awarded 
                            upon submission of any solution that successfully compiles and are based on the total time that the problem was open 
                            before it was submitted.<br><br></li>
                            
                            <li>The Challenge Phase is a timed event wherein each competitor has a chance to challenge the functionality of other 
                            competitors' code. A successful challenge will result in a loss of the original problem submission points by the 
                            defendant, and a 50 point reward for the challenger; unsuccessful challengers will incur a point reduction of 50 points 
                            as a penalty, applied against their total score in that round of competition.<br><br></li>
                            
                            <li>The System Testing Phase is applied to all submitted code that has not already been successfully challenged. If 
                            TopCoder finds code that is flawed, the author of that code submission will lose all of the points that were originally 
                            earned for that code submission. The automated tester will apply a set of inputs, expecting the output from the code 
                            submission to be correct. If the output from a coder's submission does not match the expected output, the submission 
                            is considered flawed. The same set of input/output test cases will be applied to all code submissions for a given problem. 
                            All successful challenges from the Challenge Phase will be converted into sets of inputs for the System Testing Phase.<br><br></li>
                        </ul>

                        <table width="100%" border="0" cellpadding="0" cellspacing="0">
                            <tr><td width="100%" class="tourney_subnav"><img src="/i/hs/clear.gif" alt="" width="10" height="1" border="0" /></td></tr>
                        </table>

                    </td>
                </tr>
            </table>

            <p><br></p>
        </td>
        
        <td width="" bgcolor="#001934">
            <jsp:include page="../includes/right_resources.jsp" />
        </td>
    </tr>
</table>

<jsp:include page="../includes/foot.jsp" />

</body>

</html>
