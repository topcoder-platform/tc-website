<jsp:usebean id="NavZone" class="com.topcoder.web.hs.model.NavZoneBean" scope="request" />
<jsp:setproperty name="NavZone" property="Level0" value="how_hs_compete" />
<jsp:setproperty name="NavZone" property="Level1" value="" />

<html>
<head>

<title>TopCoder | High School</title>

<meta name="description" content="TopCoder is a programming tournament site. All members who compete attain a rating that provides a metric for coding competence and potential. These ratings, coupled with tournament performance, can lead to monetary rewards and employment opportunities."/>
<meta name="keywords" content="Computer Jobs, Programming, Programming Jobs, Programming Contest, Programming Competition, Online Games, Coding, Information Technology Jobs, Java, C++"/>

<jsp:include page="../includes/css.jsp" />

</head>

<body>

<jsp:include page="../includes/top.jsp" />

<table border="0" cellspacing="0" cellpadding="0" width="100%">
    <tr valign="top">
        <td width="170" bgcolor="#001934">
        <jsp:include page="../includes/left_nav.jsp" />
        <jsp:include page="../includes/left_calendar.jsp" />
        </td>
        
        <td width="99%">
            <table cellspacing="0" cellpadding="10" border="0"  width="100%">
                
                <tr valign="top">
                    <td align="left" width="99%" class="statText">
                        <img src="/i/hs/headinginside_hscompete.gif" width="348" height="44" border="0">

                        <p><strong><font size="3">What schools can participate?</font></strong><br>
                        All high schools in Connecticut are eligible to participate in TopCoder High School.  Consistent with the CIAC, the high schools 
                        are categorized based on their conference size (i.e. Class S, M, L or LL).  </p>

                        <p><strong><font size="3">How are teams assembled?</font></strong><br>
                        One coach from each high school assembles a group of students to compete.  Any number of students may compete for a school, 
                        but only the top 3 students for a particular high school contribute to that high school's score in a round.  </p>

                        <p><strong><font size="3">How are scores determined?</font></strong><br>
                        The score of a high school for a particular round is the sum of the finishing positions of that high school's top 3 students for 
                        that round.  For example, if Glastonbury High School has 5 students that compete in round 1, and they place 3, 14, 26, 50, 
                        and 87 respectively, the score for that team for round 1 is 43.  The winning high school for a particular round is the high 
                        school with the lowest score.  </p>

                        <p><strong><font size="3">Can a school with less than 3 students on a team still compete?</font></strong><br>
                        Yes.  A high school may have less then 3 students competing, but their scores do not count towards the score for their high 
                        school.  These students are permitted to compete for fun.</p>

                        <p><strong><font size="3">How do schools advance to the playoffs?</font></strong><br>
                        The regular season will consist of 8 regular matches.  In order to be invited to the playoffs, a high school must have 
                        competed in at least 4 "scored" rounds.  This means that they must have had at least 4 rounds in which they had at least 
                        3 students competing.  The highest ranked schools at the end of the regular season will be invited to the playoffs.  A high 
                        school's rank will be determined by the average of that high school's best 4 scores.   </p>
                        
                        <p><br></p>
                        
                    </td>
                </tr>
            </table>
        </td>

        <td width="200">
            <jsp:include page="../includes/right_resources.jsp" />
        </td>
    </tr>
</table>

<jsp:include page="../includes/foot.jsp" />

</body>
</html>
