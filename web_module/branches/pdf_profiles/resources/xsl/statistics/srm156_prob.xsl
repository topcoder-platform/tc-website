<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:import href="../top.xsl"/>
    <xsl:import href="../script.xsl"/>
    <xsl:import href="../includes/body_top.xsl"/>
    <xsl:import href="../foot.xsl"/>
    <xsl:import href="../includes/modules/srm_results.xsl"/>
    <xsl:import href="../includes/modules/white_last_srm.xsl"/>
    <xsl:import href="../includes/modules/quick_stats_pulldown.xsl"/>
    <xsl:import href="../includes/modules/coder_week2.xsl"/>
    <xsl:import href="../includes/modules/practice_room.xsl"/>
    <xsl:import href="../includes/modules/calendar.xsl"/>
    <xsl:import href="../includes/modules/top_room_wins.xsl"/>
    <xsl:import href="../includes/global_left.xsl"/>
    <xsl:import href="../includes/public_right_col.xsl"/>
    <xsl:output indent="no" method="html" doctype-public="-//W3C//DTD HTML 4.0 Transitional//EN"/>
    <xsl:template match="/">

<html>

<head>

<xsl:call-template name="Preload"/>

<title>Single Round Match 156 Statistics at TopCoder</title>

<xsl:call-template name="CSS"/>

<meta name="description" content="TopCoder is a programming tournament site. All members who compete attain a rating that provides a metric for coding competence and potential. These ratings, coupled with tournament performance, can lead to monetary rewards and employment opportunities."/>
<meta name="keywords" content="Computer Jobs, Programming, Programming Jobs, Programming Contest, Programming Competition, Online Games, Coding, Information Technology Jobs, Java, C++"/>

</head>

<body>

<xsl:call-template name="Top"/>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr valign="top">

<!-- Left Column Begins -->
        <td width="170" bgcolor="#CCCCCC">
            <xsl:call-template name="global_left"/>
        </td>
<!-- Left Column Ends -->

<!-- Gutter Begins -->
        <td width="4"><img src="/i/table_top_fill.gif" width="4" height="26" alt="" border="0" /></td>
<!-- Gutter Ends -->

<!-- Center Column Begins -->
        <td class="bodyText" width="100%">
            <xsl:call-template name="BodyTop">
                <xsl:with-param name="image1">white</xsl:with-param>
                <xsl:with-param name="image">statisticsw</xsl:with-param>
                <xsl:with-param name="title">Last Match Editorials</xsl:with-param>
            </xsl:call-template>
            
            <table border="0" cellspacing="10" cellpadding="0" width="100%">
            <tr valign="top">
                    <td class="bodyText" width="100%">

<!--body contextual links-->
                        <table width="100%" border="0" cellspacing="0" cellpadding="3">
                            <tr valign="middle">
                                <td class="statTextLarge" bgcolor="#999999" width="50%"><font size="3">Single Round Match 156</font></td>
                                <td class="bodyText" bgcolor="#999999" width="50%" align="right"><a href="/index?t=statistics&amp;c=editorial_archive" class="bodyText"><strong>Archive</strong></a></td>
                            </tr>

                            <tr valign="middle">
                                <td class="bodyText">Wednesday, July 23, 2003</td>
                                <td class="bodyText" align="right"><a href="mailto:editorial@topcoder.com">Comments / Ideas?</a></td>
                            </tr>
                        </table>
<!--end contextual links-->

<h2>Match summary</h2><p>At the end of the challenge phase, it seemed certain that <b>Yarin</b> would win tonight's SRM by over 100 points.  However, 
a fatal oversight in his 900-point submission knocked him out of the running and gave <b>tomek</b> his second SRM win.  <b>tomek</b>, 
ranked third out of all Division-I coders, earned another bragging right this week: his perfect winning streak now stands at 8 
consecutive matches, crushing <b>Yarin</b>'s almost one-year-old record of 7.</p><p>The race for top score in Division-II was a bit less intense, as most coders who breezed through the easy and medium problems were 
stumped by the 1000-pointer.  It was <b>Dumitru</b>'s high score on this problem that gave him the win in his division, followed by 
<b>vavadera</b>.  <b>imolarolla</b>, a newcomer, came in third place tonight, bagging an initial rating of 1670.

<H1> 
The Problems 
</H1></p><font size="+2"><b>DiskSpace</b>
</font><A href="Javascript:openProblemRating(1777)"><img src="/i/rate_it.gif" width="60" height="18" border="0" hspace="10"/></A><br/> 
Used as: Division Two - Level One: <blockquote><table cellspacing="2"><tr><td style="background: #eee;" class="bodyText"><b>Value</b></td><td style="background: #eee;" class="bodyText"> 
      250 
    </td></tr><tr><td style="background: #eee;" class="bodyText"><b>Submission Rate</b></td><td style="background: #eee;" class="bodyText"> 
      157 / 198 (79.29%) 
    </td></tr><tr><td style="background: #eee;" class="bodyText"><b>Success Rate</b></td><td style="background: #eee;" class="bodyText"> 
      104 / 157 (66.24%) 
    </td></tr><tr><td style="background: #eee;" class="bodyText"><b>High Score</b></td><td style="background: #eee;" class="bodyText"><b>derelikt</b> for 245.89 points (3 mins 41 secs) 
    </td></tr><tr><td style="background: #eee;" class="bodyText"><b>Average Score</b></td><td style="background: #eee;" class="bodyText"> 
      205.71 (for 104 correct submissions) 
    </td></tr></table></blockquote><p>Your goal here is to calculate the smallest number of hard drives your scattered files can take up, given the capacity and current use of 
each drive.</p><p>The first step is to determine how much data there is total between your various hard drives, by adding together the amounts on each drive. 
You can do this because the files can be moved freely, and the drive they came from doesn't matter. This total can be considered your 
unallocated data. At this point, the greedy algorithm is actually a very good strategy, as the best way to minimize the number of drives used is to 
first fill up the largest, then the next largest, and so forth until all data is allocated. Thus, sort <b>total</b>, and go through from greatest to 
least, subtracting from your data total until it reaches or passes zero.</p><pre>
public class DiskSpace {
	public int minDrives(int[] used, int[] total) {
		int data = 0;
		for (int i = 0; i &lt; used.length; i++)
			data += used[i];
		Arrays.sort(total);
		int answer = 0;
		for (int i = total.length - 1; data &gt; 0; i--) {
			data -= total[i];
			answer++;
		}
		return answer;
	}
}
</pre><font size="+2"><b>BombSweeper</b>
</font><A href="Javascript:openProblemRating(1778)"><img src="/i/rate_it.gif" width="60" height="18" border="0" hspace="10"/></A><br/> 
Used as: Division Two - Level Two: <blockquote><table cellspacing="2"><tr><td style="background: #eee;" class="bodyText"><b>Value</b></td><td style="background: #eee;" class="bodyText"> 
      600 
    </td></tr><tr><td style="background: #eee;" class="bodyText"><b>Submission Rate</b></td><td style="background: #eee;" class="bodyText"> 
      126 / 198 (63.64%) 
    </td></tr><tr><td style="background: #eee;" class="bodyText"><b>Success Rate</b></td><td style="background: #eee;" class="bodyText"> 
      99 / 126 (78.57%) 
    </td></tr><tr><td style="background: #eee;" class="bodyText"><b>High Score</b></td><td style="background: #eee;" class="bodyText"><b>derelikt</b> for 559.45 points (7 mins 45 secs) 
    </td></tr><tr><td style="background: #eee;" class="bodyText"><b>Average Score</b></td><td style="background: #eee;" class="bodyText"> 
      369.95 (for 99 correct submissions) 
    </td></tr></table></blockquote> 


Used as: Division One - Level One: <blockquote><table cellspacing="2"><tr><td style="background: #eee;" class="bodyText"><b>Value</b></td><td style="background: #eee;" class="bodyText"> 
      300 
    </td></tr><tr><td style="background: #eee;" class="bodyText"><b>Submission Rate</b></td><td style="background: #eee;" class="bodyText"> 
      138 / 141 (97.87%) 
    </td></tr><tr><td style="background: #eee;" class="bodyText"><b>Success Rate</b></td><td style="background: #eee;" class="bodyText"> 
      127 / 138 (92.03%) 
    </td></tr><tr><td style="background: #eee;" class="bodyText"><b>High Score</b></td><td style="background: #eee;" class="bodyText"><b>SnapDragon</b> for 294.46 points (3 mins 54 secs) 
    </td></tr><tr><td style="background: #eee;" class="bodyText"><b>Average Score</b></td><td style="background: #eee;" class="bodyText"> 
      245.35 (for 127 correct submissions) 
    </td></tr></table></blockquote><p>Here you must solve a formula to give the likelihood that you will win on a given board. To do this, you must ascertain two numbers for 
that board: the number of bombs, and the number of spaces which neither contain nor neighbor any bombs.</p><p>Counting the bombs is easy, but the latter sum is a bit more difficult to reach. For each space on the board, you must check each of 
its eight neighbors for bombs. However, you don't want to check a neighbor that doesn't actually exist, such as a square off the edge of the 
board. So before checking a neighbor to see if it contains a bomb, you must first check to see that it within the bounds of the board. It is 
undoubtedly easier and less error-prone to put this check into its own function:</p><pre>
bool isBomb(vector &lt;string&gt; board, int row, int col) {
   if (row &lt; 0 || row &gt;= board.size() || col &lt; 0 || col &gt;= board[0].length())
      return false;
   else
      return board[row][col] == 'B';
}
</pre><p>Once you have both numbers, executing the formula is simple arithmetic - but make sure to multiply by 100, to yield a percentage.</p><font size="+2"><b>WordParts</b>
</font><A href="Javascript:openProblemRating(1361)"><img src="/i/rate_it.gif" width="60" height="18" border="0" hspace="10"/></A><br/> 
Used as: Division Two - Level Three: <blockquote><table cellspacing="2"><tr><td style="background: #eee;" class="bodyText"><b>Value</b></td><td style="background: #eee;" class="bodyText"> 
      1000 
    </td></tr><tr><td style="background: #eee;" class="bodyText"><b>Submission Rate</b></td><td style="background: #eee;" class="bodyText"> 
      24 / 198 (12.12%) 
    </td></tr><tr><td style="background: #eee;" class="bodyText"><b>Success Rate</b></td><td style="background: #eee;" class="bodyText"> 
      9 / 24 (37.50%) 
    </td></tr><tr><td style="background: #eee;" class="bodyText"><b>High Score</b></td><td style="background: #eee;" class="bodyText"><b>Dumitru</b> for 592.29 points (28 mins 1 secs) 
    </td></tr><tr><td style="background: #eee;" class="bodyText"><b>Average Score</b></td><td style="background: #eee;" class="bodyText"> 
      495.24 (for 9 correct submissions) 
    </td></tr></table></blockquote><p>Your task in this problem is to determine if a given compound word is composed entirely of prefixes and/or suffixes of a given base 
word. If it is composed in this fashion, you must return the smallest number of such affixes into which the compound word can be 
divided.</p><p>Solving this problem requires knowledge of either dynamic programming or memoization, programming tricks which are rarely seen 
in Division-II.  I personally have always been a fan of the latter technique; memoized recursion seems both easier to comprehend and 
easier to code than DP.</p><p>To make things easier, it is wise to start your solution by creating a dictionary of valid word parts.  Simply create a new array and 
add to it every prefix and suffix of <b>original</b>, including the whole word itself.</p><pre>	vector&lt;string&gt; dict;
	for (int i = 1, i &lt; original.length() - 1; i++)
		dict.push_back(original.substr(0, i));  
		// Add every prefix
	for (int i = 1; i &lt; original.length() - 1; i++)
		dict.push_back(original.substr(i));     
		// Add every suffix
	dict.push_back(original);                       
	// Add the entire word
</pre><p>With our dictionary in hand, we can now launch our recursive function.  This function need take only one parameter: the current 
position in <b>compound</b>.  It operates by checking each word in the dictionary against the current position in <b>compound</b>.  If 
there is a match, it recurses on the remainder of the string and updates the best result found so far.  For the outline of the function, 
including the memoization step, refer to the pseudocode below.</p><pre>
int minParts(int position) {
   if we have already executed this function for the current position,
      immediately return the previously found result
   if position = compound.length,
      return 0 (the empty case)
   let answer = INFINITY;
      for each word w in dictionary
   if w is a prefix of compound.substring(position),
      let temp = minParts(position + w.length)
   if (temp &lt; answer)
      set answer = temp
   return answer
}
</pre><p>The memoization step is necessary for cases such as the one where both <b>original</b> and <b>compound</b> consist of 50 A's in a 
row.  The dictionary will contain 99 elements (some duplicates of each other), and nearly all of these entries will cause the recursive 
function to call itself again at every position in the string, yielding an exponential number of calls and necessitating far more than the 
allowed 8 seconds.  Memoization ensures that the function will never have to do work more than 50 times.</p><p>One last thing to note is that the greedy algorithm fails on this problem.  Your recursive function needs to check every word in the 
dictionary as a possibility at each position; you cannot simply look for the longest prefix/suffix present in the compound word and break 
the word up accordingly.  To understand why, consider the example given in the problem statement where <b>original</b> = "BAAABA" 
and <b>compound</b> = "BAAABAAA".  The correct answer is 2 ("BAAA", "BAAA"), but the greedy algorithm will incorrectly return 3 
("BAAABA", "A", "A"), as it tries to use the largest dictionary word possible at the beginning.</p><font size="+2"><b>SmartElevator</b>
</font><A href="Javascript:openProblemRating(1788)"><img src="/i/rate_it.gif" width="60" height="18" border="0" hspace="10"/></A><br/> 
Used as: Division One - Level Two: <blockquote><table cellspacing="2"><tr><td style="background: #eee;" class="bodyText"><b>Value</b></td><td style="background: #eee;" class="bodyText"> 
      550 
    </td></tr><tr><td style="background: #eee;" class="bodyText"><b>Submission Rate</b></td><td style="background: #eee;" class="bodyText"> 
      67 / 141 (47.52%) 
    </td></tr><tr><td style="background: #eee;" class="bodyText"><b>Success Rate</b></td><td style="background: #eee;" class="bodyText"> 
      58 / 67 (86.57%) 
    </td></tr><tr><td style="background: #eee;" class="bodyText"><b>High Score</b></td><td style="background: #eee;" class="bodyText"><b>Yarin</b> for 512.45 points (7 mins 48 secs) 
    </td></tr><tr><td style="background: #eee;" class="bodyText"><b>Average Score</b></td><td style="background: #eee;" class="bodyText"> 
      325.63 (for 58 correct submissions) 
    </td></tr></table></blockquote><p>The goal of this problem is to determine the optimal strategy for your company's elevator. Given the arrival floors, arrival 
times, and destination floors of the elevator's users, you must return the shortest possible time in which the elevator can complete 
its task.</p><p>The constraints are what make this problem possible. There are at most five employees to consider, which should be a small 
enough number for even the slowest of brute-force algorithms to handle in 8 seconds.</p><p>To understand how to account for each case, let us consider an example where the maximum five employees all need to use the 
elevator.  Your code should cycle through every permutation of "0011223344", where the first instance of a number signals picking 
up the corresponding employee, and the second instance signals dropping that employee off. Check the time required for each permutation, 
and the smallest value you find will be the answer.</p><p>C++ users have an advantage here with the ever-useful <tt>next_permutation()</tt> function. If your language doesn't have 
<tt>next_permutation()</tt> built-in, you should strongly consider writing one yourself and additing it to your code library for 
future use.</p><p>Alternately, this problem can be solved by recursion.  Refer to the following pseudocode:</p><pre>
int timeWaiting(int[] passengerState, int currentFloor, int currentTime) {
   if every passenger has been dropped off,
      return currentTime
   let answer = INFINITY
   for each passenger p
      if p has already been dropped off,
         go on to the next passenger
      otherwise, if p has not yet been picked up,
         let newFloor = p's starting floor
         let distance = abs(currentFloor - newFloor)
         let newTime = max(p's arrival time, currentTime + distance)
         let newPassengerState = passengerState with p now on elevator
         let completionTime = timeWaiting(newPassengerState, newFloor, newTime)
      otherwise, if p is currently in the elevator,
         let newFloor = p's destination floor
         let distance = abs(currentFloor - newFloor)
         let newTime = currentTime + distance;
         let newPassengerState = passengerState with p dropped off
         let completionTime = timeWaiting(newPassengerState, newFloor, newTime)
      if completionTime &lt; answer
	   set answer = completionTime
   return answer
}
</pre><font size="+2"><b>PathFinding</b>
</font><A href="Javascript:openProblemRating(1110)"><img src="/i/rate_it.gif" width="60" height="18" border="0" hspace="10"/></A><br/> 
Used as: Division One - Level Three: <blockquote><table cellspacing="2"><tr><td style="background: #eee;" class="bodyText"><b>Value</b></td><td style="background: #eee;" class="bodyText"> 
      900 
    </td></tr><tr><td style="background: #eee;" class="bodyText"><b>Submission Rate</b></td><td style="background: #eee;" class="bodyText"> 
      34 / 141 (24.11%) 
    </td></tr><tr><td style="background: #eee;" class="bodyText"><b>Success Rate</b></td><td style="background: #eee;" class="bodyText"> 
      17 / 34 (50.00%) 
    </td></tr><tr><td style="background: #eee;" class="bodyText"><b>High Score</b></td><td style="background: #eee;" class="bodyText"><b>ZorbaTHut</b> for 736.40 points (14 mins 3 secs) 
    </td></tr><tr><td style="background: #eee;" class="bodyText"><b>Average Score</b></td><td style="background: #eee;" class="bodyText"> 
      546.83 (for 17 correct submissions) 
    </td></tr></table></blockquote><p>This problem gives you a board consisting of empty spaces, walls, and the starting positions of two players (A and B).  It then 
asks you to determine the least possible number of turns in which players A and B can switch positions. On any turn, either or both 
players may move a single space vertically, horizontally, or diagonally, but they cannot switch positions in any single turn. It is also 
important to note that a player may remain in the same location - it does not have to move on every turn. (This oversight ruined many 
otherwise-perfect submissions, including <b>Yarin</b>'s.)</p><p>Yet again, the input restrictions on this problem allow a solution which would otherwise time out.  The largest possible board is 20 
by 20, meaning there are only 400 places where a single player can be, and only 160000 possible configurations for the locations of 
both players.  So as long as the algorithm used stays within those general bounds (i.e., doesn't consider board configurations more than 
once), it should run well within 8 seconds.</p><p>The best and fastest way to solve this problem is to use a breadth-first search.  The state of the board can be described as a 4-tuple: 
(playerA_row, playerA_col, playerB_row, playerB_col).  The starting and ending states are easy enough to figure out, simply by 
scanning the input array for the location of the 'A' and 'B' characters.  All that's left is to enumerate all the different ways to get from 
one state to another, which can be accomplished as follows:</p><pre>
int playerA_row, playerA_col, playerB_row, playerB_col;
    for (playerA_rowChange=-1; playerA_rowChange &lt;= 1; ++playerA_rowChange)
      for (playerA_colChange=-1; playerA_colChange &lt;= 1; ++playerA_colChange)
        for (playerB_rowChange=-1; playerB_rowChange &lt;= 1; ++playerB_rowChange)
          for (playerB_colChange=-1; playerB_colChange &lt;= 1; ++playerB_colChange) {
            playerA_newRow=playerA_row + playerA_rowChange;
            playerA_newCol=playerA_col + playerA_colChange;
            playerB_newRow=playerB_row + playerB_rowChange;
            playerB_newCol=playerB_col + playerB_colChange;
            // Validate, check, and enqueue the new state.
}
</pre><p>Once we have a new state, we need to validate it.  Validation consists of several steps:</p><ol><li>Have we seen this state before?  If we've already dealt with this combination of player positions, we should skip it and go on 
to the next for-loop permutation (using the <tt>continue</tt> command).  The easiest way to check if we've seen this state before is 
to create a new <tt>boolean visited[20][20][20][20]</tt>, initialize each entry to <tt>false</tt>, and mark an entry as <tt>true</tt> 
after we've gotten past this step of the validation.</li><li>Are both players in valid locations? Neither player should be inside of a wall, or off the board, or in the same location.</li><li>Did this move cause the players to swap places?  If <tt>(playerA_newRow == playerB_row &amp;&amp; playerA_newCol == playerB_col &amp;&amp; 
playerB_newRow == playerA_row &amp;&amp; playerB_newCol == playerA_col)</tt>, then the players have crossed paths, and this move was 
invalid.</li><li>Did we win? If the players have switched places, we can immediately return the number of turns we've taken so far.</li></ol><p>After the state has been validated, we can push it (and the number of turns it took to get to it) to the back of our queue, and pop 
the next element.  If the queue becomes empty, then it's impossible for the players to switch positions with each other, and we 
return -1.</p>

                        <p><img src="/i/m/LunaticFringe_mug.gif" alt="" width="55" height="61" border="0" hspace="6" vspace="1" align="left" /><br />
                        By&#160;<a class="bodyText" href="/stat?c=member_profile&amp;cr=288584"><strong>LunaticFringe</strong></a><br/>
                        <span class="smallText"><em>TopCoder Member</em></span><br clear="all" /></p>

                    </td>
                </tr>
            </table>
            
            <p><br /></p>
            
        </td>
<!-- Center Column Ends -->

<!-- Gutter -->
        <td width="4"><img src="/i/clear.gif" width="4" height="1" border="0"/></td>
<!-- Gutter Ends -->

<!-- Right Column Begins -->
        <td width="170">
            <img src="/i/clear.gif" width="170" height="1" border="0"/><br />
            <xsl:call-template name="public_right_col"/>
        </td>
<!-- Right Column Ends -->

<!-- Gutter -->
        <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"/></td>
<!-- Gutter Ends -->

    </tr>
</table>

<xsl:call-template name="Foot"/>

</body>

</html>

    </xsl:template>
</xsl:stylesheet>

