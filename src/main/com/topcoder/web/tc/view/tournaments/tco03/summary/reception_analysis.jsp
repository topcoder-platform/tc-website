<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>2003 TopCoder Open sponsored by Intel&#174;  - Summary - Opening Night Reception</title>

<jsp:include page="../../../script.jsp" />

<style type="text/css" media="screen">
	.leadPhoto
	{
		float: right;
		position: relative;
		top: 0px;
		width: 200px;
		margin-left: 10px;
		margin-top: 0px;
		margin-right: 2px;
		margin-bottom: 4px;
	}
	
	.leadPhotoCaption
	{
		font-size: 10px;
		font-weight: bold;
		color: #333333;
	}
	
	.pointsLabel, .points
	{
		font-size: 12px;
		font-weight: normal;
		color: #333333;
		background-color: #EEEEEE;
		text-align: left;
		padding: 8px;
		margin: 1px;
		white-space: nowrap;
	}
	
	.pointsLabel
	{
		font-weight: bold;
		text-align: right;
	}
	
	.pointsTable
	{
		background-color: #FFFFFF;
		border-style: solid;
		border-color: #CCCCCC;
		border-width: 1px;
	}
	
	.terciary
	{
		color: #666666;
		font-size: 12px;
		font-weight: bold;
		font-style: normal;
		text-align: right;
	}
	
	.terciary A:link
	{
		color: #00F;
		font-weight: normal;
		text-decoration: underline;
	}
	
	.terciary A:visited
	{
		color: #006;
		font-weight: normal;
		text-decoration: underline;
	}
	
	.terciary A:hover
	{
		color: #F00;
		font-weight: normal;
		text-decoration: none;
	}
	
	.terciary A:active
	{
		color: #F00;
		font-weight: normal;
		text-decoration: none;
	}
</style>

</head>

<body onLoad="timer(1);">

<jsp:include page="../../../top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">
<!-- Left Column Begins-->
        <td width="180">
            <jsp:include page="../../../includes/global_left.jsp">
                <jsp:param name="level1" value="events"/>
                <jsp:param name="level2" value="tournaments"/>
            </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Gutter Begins -->
        <td width="15"><img src="/i/clear.gif" width="15" height="1" border="0"/></td>
<!-- Gutter Ends -->

<!-- Center Column Begins -->
         <td class="bodyText" WIDTH="100%">

<jsp:include page="../tco03Head.jsp" />

<!-- Tab bar links-->
<jsp:include page="../tco03Links.jsp" >
   <jsp:param name="selectedContest" value="coding"/>
   <jsp:param name="selectedTab" value="coding_summary"/>
</jsp:include>

<!-- Tab bar sublinks-->
<jsp:include page="../tco03Sublinks.jsp" >
   <jsp:param name="selectedList" value="summary"/>
   <jsp:param name="selectedTab" value="reception"/>
</jsp:include>

            <p class="terciary">
                <a href="/tc?module=Static&d1=tournaments&d2=tco03&d3=summary&d4=reception">Play-by-Play</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="/tc?module=Static&d1=tournaments&d2=tco03&d3=summary&d4=reception_photos">Photos</a>&nbsp;&nbsp;|&nbsp;&nbsp;Problem Analysis
            </p>
            
            <h2>Problem Set Analysis &amp; Opinion</h2>

            <p>by <a href="#">brett1479</a>, <em>TopCoder Member</em><br />
            Wednesday, December 4, 2003</p>

            <p>The first run at the finals had to be cancelled midway due to network issues. While TopCoder tried hard to work through the issues, in the end it was decided 
            that the contest was disrupted beyond salvaging, and I think that all of the competitors agreed. The second run had much easier problems - more on par with 
            round 3 of the semifinals, and 3 of the finalists were able to finish all 3 problems during the coding phase. At the end of the coding phase, <strong>dgarthur</strong> was 
            on top, with 1447.71 points. <strong>Yarin</strong> was 2 challenges behind, with 1382.79. <strong>dmwright</strong> and <strong>sjelkjd</strong> rounded out the room, in third and fourth places, 
            respectively. The problems turned out to be easy enough that everyone's submissions were correct, and <strong>dgarthur</strong> walked away with the big check.</p>
                        
            <h3>DQuads<br/>
            <span class="bodyText">Used as: Division 1 - Level 1:</span></h3>
                        
            <blockquote>
            <table border="0" cellspacing="2" cellpadding="0" class="pointsTable">
                    <tr>
                    <td class="pointsLabel">Value</td>
                    <td class="points">275</td>
                </tr>
                               			
                    <tr>
                    <td class="pointsLabel">Submission Rate</td>
                    <td class="points">4 / 4  (100.00%) </td>
                </tr>
                
                    <tr>
                    <td class="pointsLabel">Success Rate</td>
                    <td class="points">4 / 4  (100.00%)</td>
                </tr>
                
                    <tr>
                    <td class="pointsLabel">High Score</td>
                    <td class="pointsLabel">Yarin</b> for 237.49 points</td>
                </tr>
            </table>
            </blockquote>
            
            <p>This was a pretty simple problem, and could be easily solved with 4 nested loops. You can simply iterate through all possible sets of 4 ordered points, 
            check if they formed a loop with no cross edges, and increment a counter if they did. It the end, you have counted each loop 4 times (once for each possible 
            start spot), so you have to divide by 4.</p>
                        
            <h3>Robot<br/>
            <span class="bodyText">Used as: Division 1 - Level 2:</span></h3>
                        
            <blockquote>
            <table border="0" cellspacing="2" cellpadding="0" class="pointsTable">
                <tr>
                    <td class="pointsLabel">Value</td>
                    <td class="points">450</td>
                </tr>

                <tr>
                    <td class="pointsLabel">Submission Rate</td>
                    <td class="points">4 / 4  (100.00%) </td>
                </tr>
                
                <tr>
                    <td class="pointsLabel">Success Rate</td>
                    <td class="points">4 / 4  (100.00%)</td>
                </tr>
                
                <tr>
                    <td class="pointsLabel">High Score</td>
                    <td class="pointsLabel">Yarin</b> for 385.26 points</td>
                </tr>
            </table>
            </blockquote>
            
            <p>Again, nothing really tricky here. You need to keep track of the probability for each location at each time step, and at each time step, update the 
            probabilities according to the following recurrence: <BR /><TT>prob[t][x][y] = sum over all directions(prob[t-1][x+dx][y+dy])/8</TT> <BR />If one of the directions 
            contains an obstacle, then you have to take that into account, so that the robot stays in the same location. So, you can modify the recurrence so that you also 
            add in each invalid direction. So, you get: <BR /><TT>prob[t][x][y] = sum over all directions(prob[t-1][x+dx][y+dy])/8 + (number of directions that you can't go) * 
            (prob[t-1][x+dx][y+dy]) / 8 </TT></p>
                        
            <h3>SkewTree<br/>
            <span class="bodyText">Used as: Division 1 - Level 3:</span></h3>
                        
            <blockquote>
            <table border="0" cellspacing="2" cellpadding="0" class="pointsTable">
                <tr>
                    <td class="pointsLabel">Value</td>
                    <td class="points">950</td>
                </tr>

                <tr>
                    <td class="pointsLabel">Submission Rate</td>
                    <td class="points">3 / 4  (75.00%) </td>
                </tr>
                
                <tr>
                    <td class="pointsLabel">Success Rate</td>
                    <td class="points">3 / 3  (100.00%)</td>
                </tr>
                
                <tr>
                    <td class="pointsLabel">High Score</td>
                    <td class="pointsLabel">dgarthur</b> for 863.41 points</td>
                </tr>
            </table>
            </blockquote>
            
            <p>Balanced binary search trees are used frequently in algorithms. Their guaranteed O(nlgn) access time makes such trees quite versatile. In specific 
            cases, where the probability distribution governing access to the tree is known a priori, it may be possible to improve access times via an unbalanced binary 
            search tree. Suppose a node had relative access probability P and depth D in the tree. By summing P*(D+1) for each node in the tree we have a statistic that can 
            be used to measure the overall tree access time. To minimize this value in an efficient manner, we can use Dynamic Programming(bottom-up) or 
            Memoization(top-down). Here I will describe a top-down approach. Assume we have a list containing each node, sorted by value, and their corresponding 
            probabilities. Iterating through the list, we can elect any element to be the root of our tree. This leaves a group of nodes that must be on the left, and 
            group on the right. Since the left and right set of nodes are simply smaller versions of the same problem, we recursively apply this method to each side. The 
            value for any given rooted tree is the sum of the values from each of its subtrees, plus the sum of all the probabilities in the tree. Taking the minimum 
            from all possible roots produces the best value.</p>

            <p><br/></p>
        </td>
<!-- Center Column Ends -->

<!-- Gutter -->
         <td width="15"><img src="/i/clear.gif" width="15" height="1" border="0"></td>
<!-- Gutter Ends -->

<!-- Right Column Begins -->
         <td width="170">
            <jsp:include page="../../../public_right.jsp">
               <jsp:param name="level1" value="privatelabel"/>
            </jsp:include>
         </td>
<!-- Right Column Ends -->

<!-- Gutter -->
         <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<!-- Gutter Ends -->
    </tr>
</table>

<jsp:include page="../../../foot.jsp" />

</body>

</html>
