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
                            <jsp:param name="isOnlinePage" value="true"/>
                        </jsp:include>

                        <h3>2003 TopCoder High School Challenge<br>Official Rules and Regulations</h3>
                        
                        </div>
                        
                        <p><font size="3"><strong>Final Round</strong></font><br>
                        Representatives from the top 10 performing CT high schools will travel to on Tuesday, May 20th to compete in the Final 
                        round, which will commence at 1:00PM.  All contestants must arrive at UCONN no later than 12:00PM on Tuesday, May 
                        20th.  If a contestant is unable to attend the Final round, he/she will forfeit his/her spot, and his/her team will compete 
                        with one less individual.</p>

                        <p>The Final Round will be a single round, consisting of 1 room with up to 36 coders. The winning team is determined 
                        by comparing the total point values from all three phases of the round (see Competition Round Structure) for each coder 
                        on a team.  Each high school representative’s score will be summed with those of the other representatives, and the 
                        winner of the Final Round will be the team with the highest aggregate point total for the round.  In the event of a tie, the 
                        team with the highest amount of total points acquired throughout the entire regular season will win.</p>
                        
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
