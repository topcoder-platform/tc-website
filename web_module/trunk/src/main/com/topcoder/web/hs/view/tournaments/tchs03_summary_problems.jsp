<html>

<head>

<title>TopCoder | High School</title>

<meta name="description" content="TopCoder is a programming tournament site. All members who compete attain a rating that provides a metric for coding competence and potential. These ratings, coupled with tournament performance, can lead to monetary rewards and employment opportunities."/>
<meta name="keywords" content="Computer Jobs, Programming, Programming Jobs, Programming Contest, Programming Competition, Online Games, Coding, Information Technology Jobs, Java, C++"/>

<jsp:include page="../includes/css.jsp" />

<script language="JavaScript">
  function changeImage(image, newImage) {
    document[image].src=newImage;
    return;
  }
</script>
     
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
                            <jsp:param name="isSummaryPage" value="true"/>
                        </jsp:include>

                        <jsp:include page="../includes/tchs03_summary_subnav.jsp" >
                            <jsp:param name="isProblemsPage" value="true"/>
                        </jsp:include>

                        </div>

                        <h2>Problem Set Analysis &amp; Opinion</h2>
                        <p>by XXX, <em>TopCoder Member</em><br />
                        Saturday, April 5, 2002</p>

                        <p>The first run at the finals had to be cancelled midway due to network issues. 
                        While TopCoder tried hard to work through the issues, in the end it was decided 
                        that the contest was disrupted beyond salvaging, and I think that all of the 
                        competitors agreed. The second run had much easier problems - more on par with 
                        round 3 of the semifinals, and 3 of the finalists were able to finish all 3 
                        problems during the coding phase. At the end of the coding phase, dgarthur was 
                        on top, with 1447.71 points. Yarin was 2 challenges behind, with 1382.79. 
                        dmwright and sjelkjd rounded out the room, in third and fourth places, 
                        respectively. The problems turned out to be easy enough that everyone's 
                        submissions were correct, and dgarthur walked away with the big check.</p>
                        
                        <font size="+2"><b>DQuads</b></font><br />
                        Used as: Division 1 - Level 1:
                        <blockquote>
                        <table cellspacing="2" cellpadding="2">
                        <tr>
                        <td style="background: #1B2E5D;" class="statTextBig"><b>Value</b></td>
                        <td style="background: #1B2E5D;" class="statTextBig">275</td>
                        </tr>
                        <tr>
                        <td style="background: #1B2E5D;" class="statTextBig"><b>Submission Rate</b></td>
                        <td style="background: #1B2E5D;" class="statTextBig">4 / 4  (100.00%) </td>
                        </tr>
                        <tr>
                        <td style="background: #1B2E5D;" class="statTextBig"><b>Success Rate</b></td>
                        <td style="background: #1B2E5D;" class="statTextBig">4 / 4  (100.00%)</td>
                        </tr>
                        <tr>
                        <td style="background: #1B2E5D;" class="statTextBig"><b>High Score</b></td>
                        <td style="background: #1B2E5D;" class="statTextBig"><b>Yarin</b> for 237.49 points</td>
                        </tr>
                        </table></blockquote>
                        <p>This was a pretty simple problem, and could be easily solved with 4 nested 
                        loops. You can simply iterate through all possible sets of 4 ordered points, 
                        check if they formed a loop with no cross edges, and increment a counter if they 
                        did. It the end, you have counted each loop 4 times (once for each possible 
                        start spot), so you have to divide by 4.</p>
                        
                        <font size="+2"><b>Robot</b></font><br />
                        Used as: Division 1 - Level 2:
                        <blockquote>
                        <table cellspacing="2" cellpadding="2">
                        <tr>
                        <td style="background: #1B2E5D;" class="statTextBig"><b>Value</b></td>
                        <td style="background: #1B2E5D;" class="statTextBig">450</td>
                        </tr>
                        <tr>
                        <td style="background: #1B2E5D;" class="statTextBig"><b>Submission Rate</b></td>
                        <td style="background: #1B2E5D;" class="statTextBig">4 / 4  (100.00%) </td>
                        </tr>
                        <tr>
                        <td style="background: #1B2E5D;" class="statTextBig"><b>Success Rate</b></td>
                        <td style="background: #1B2E5D;" class="statTextBig">4 / 4  (100.00%)</td>
                        </tr>
                        <tr>
                        <td style="background: #1B2E5D;" class="statTextBig"><b>High Score</b></td>
                        <td style="background: #1B2E5D;" class="statTextBig"><b>Yarin</b> for 385.26 points</td>
                        </tr>
                        </table></blockquote>
                        <p>Again, nothing really tricky here. You need to keep track of the probability 
                        for each location at each time step, and at each time step, update the 
                        probabilities according to the following recurrence: <BR /><TT>prob[t][x][y] = sum 
                        over all directions(prob[t-1][x+dx][y+dy])/8</TT> <BR />If one of the directions 
                        contains an obstacle, then you have to take that into account, so that the robot 
                        stays in the same location. So, you can modify the recurrence so that you also 
                        add in each invalid direction. So, you get: <BR /><TT>prob[t][x][y] = sum over all 
                        directions(prob[t-1][x+dx][y+dy])/8 + (number of directions that you can't go) * 
                        (prob[t-1][x+dx][y+dy]) / 8 </TT></p>
                        
                        <font size="+2"><b>SkewTree</b></font><br />
                        Used as: Division 1 - Level 3:
                        <blockquote>
                        <table cellspacing="2" cellpadding="2">
                        <tr>
                        <td style="background: #1B2E5D;" class="statTextBig"><b>Value</b></td>
                        <td style="background: #1B2E5D;" class="statTextBig">950</td>
                        </tr>
                        <tr>
                        <td style="background: #1B2E5D;" class="statTextBig"><b>Submission Rate</b></td>
                        <td style="background: #1B2E5D;" class="statTextBig">3 / 4  (75.00%) </td>
                        </tr>
                        <tr>
                        <td style="background: #1B2E5D;" class="statTextBig"><b>Success Rate</b></td>
                        <td style="background: #1B2E5D;" class="statTextBig">3 / 3  (100.00%)</td>
                        </tr>
                        <tr>
                        <td style="background: #1B2E5D;" class="statTextBig"><b>High Score</b></td>
                        <td style="background: #1B2E5D;" class="statTextBig"><b>dgarthur</b> for 863.41 points</td>
                        </tr>
                        </table></blockquote>
                        <p>Balanced binary search trees are used frequently in algorithms. Their 
                        guaranteed O(nlgn) access time makes such trees quite versatile. In specific 
                        cases, where the probability distribution governing access to the tree is known 
                        a priori, it may be possible to improve access times via an unbalanced binary 
                        search tree. Suppose a node had relative access probability P and depth D in the 
                        tree. By summing P*(D+1) for each node in the tree we have a statistic that can 
                        be used to measure the overall tree access time. To minimize this value in an 
                        efficient manner, we can use Dynamic Programming(bottom-up) or 
                        Memoization(top-down). Here I will describe a top-down approach. Assume we have 
                        a list containing each node, sorted by value, and their corresponding 
                        probabilities. Iterating through the list, we can elect any element to be the 
                        root of our tree. This leaves a group of nodes that must be on the left, and 
                        group on the right. Since the left and right set of nodes are simply smaller 
                        versions of the same problem, we recursively apply this method to each side. The 
                        value for any given rooted tree is the sum of the values from each of its 
                        subtrees, plus the sum of all the probabilities in the tree. Taking the minimum 
                        from all possible roots produces the best value.</p>

                        <table width="100%" border="0" cellpadding="0" cellspacing="0">
                            <tr><td width="100%" class="tourney_subnav"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td></tr>
                        </table>

                    </td>
                </tr>
            </table>

            <p><br/></p>
        
        </td>
        
        <td width="" bgcolor="#001934">
            <jsp:include page="../includes/right_resources.jsp" />
        </td>
    </tr>
</table>

<jsp:include page="../includes/foot.jsp" />

</body>

</html>
