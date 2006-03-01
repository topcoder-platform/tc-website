<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Tournaments</title>

<jsp:include page="/script.jsp" />
<jsp:include page="/style.jsp">
  <jsp:param name="key" value="tc_main"/>
</jsp:include>
<script language="JavaScript">
  function changeImage(image, newImage) {
    document[image].src=newImage;
    return;
  }
</script>
</head>

<body>

<jsp:include page="/top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">
<!-- Left Column Begins-->
        <td width="180">
            <jsp:include page="/includes/global_left.jsp">
                <jsp:param name="node" value="topcoder_tournaments"/>
            </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Center Column Begins -->
<TD class="bodyText" width="100%" valign="top">
<div align="center" style="margin: 0px 10px 0px 10px;">


            <jsp:include page="links.jsp" />
            <jsp:include page="links_summary.jsp" />

            <table border="0" cellspacing="0" cellpadding="3" width="100%">
                <tr><td height="1"><img src="/i/clear.gif" alt="" width="10" height="3" border="0"/></td></tr>
                <tr><td class="tourney_subnav"><strong>Championship Problem Analysis & Opinion</strong></td></tr>
                <tr valign="top">
                    <td width="10%" class="bodyText">
                        <p>Saturday, April 5, 2002</p>
                        
                        <p><b>Problem Set Analysis & Opinion</b></p>
                        
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
                        <td style="background: #eee;" class="bodyText"><b>Value</b></td>
                        <td style="background: #eee;" class="bodyText">275</td>
                        </tr>
                        <tr>
                        <td style="background: #eee;" class="bodyText"><b>Submission Rate</b></td>
                        <td style="background: #eee;" class="bodyText">4 / 4  (100.00%) </td>
                        </tr>
                        <tr>
                        <td style="background: #eee;" class="bodyText"><b>Success Rate</b></td>
                        <td style="background: #eee;" class="bodyText">4 / 4  (100.00%)</td>
                        </tr>
                        <tr>
                        <td style="background: #eee;" class="bodyText"><b>High Score</b></td>
                        <td style="background: #eee;" class="bodyText"><b>Yarin</b> for 237.49 points</td>
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
                        <td style="background: #eee;" class="bodyText"><b>Value</b></td>
                        <td style="background: #eee;" class="bodyText">450</td>
                        </tr>
                        <tr>
                        <td style="background: #eee;" class="bodyText"><b>Submission Rate</b></td>
                        <td style="background: #eee;" class="bodyText">4 / 4  (100.00%) </td>
                        </tr>
                        <tr>
                        <td style="background: #eee;" class="bodyText"><b>Success Rate</b></td>
                        <td style="background: #eee;" class="bodyText">4 / 4  (100.00%)</td>
                        </tr>
                        <tr>
                        <td style="background: #eee;" class="bodyText"><b>High Score</b></td>
                        <td style="background: #eee;" class="bodyText"><b>Yarin</b> for 385.26 points</td>
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
                        <td style="background: #eee;" class="bodyText"><b>Value</b></td>
                        <td style="background: #eee;" class="bodyText">950</td>
                        </tr>
                        <tr>
                        <td style="background: #eee;" class="bodyText"><b>Submission Rate</b></td>
                        <td style="background: #eee;" class="bodyText">3 / 4  (75.00%) </td>
                        </tr>
                        <tr>
                        <td style="background: #eee;" class="bodyText"><b>Success Rate</b></td>
                        <td style="background: #eee;" class="bodyText">3 / 3  (100.00%)</td>
                        </tr>
                        <tr>
                        <td style="background: #eee;" class="bodyText"><b>High Score</b></td>
                        <td style="background: #eee;" class="bodyText"><b>dgarthur</b> for 863.41 points</td>
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

                        <img src="/i/m/brett1479_mug.jpg" alt="" width="55" height="61" border="0" hspace="6" vspace="1" align="left"/>
                        By&#160;brett1479<br/><div class="smallText"><i>TopCoder Member</i><br/><a href="/tc?module=MemberProfile&cr=251317" class="smallText">Author Profile</a></div><br clear="all"/>
                    </td>
                </tr>            
            </table>

   <br><br>
   </div>
</div>
</td>
<!-- Center Column Ends -->

<!-- Right Column Begins -->
         <td width="170">
            <jsp:include page="/public_right.jsp">
               <jsp:param name="level1" value="default"/>
            </jsp:include>
         </td>
<!-- Right Column Ends -->

<!-- Gutter -->
         <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<!-- Gutter Ends -->
    </tr>
</table>

<jsp:include page="/foot.jsp" />

</body>

</html>
