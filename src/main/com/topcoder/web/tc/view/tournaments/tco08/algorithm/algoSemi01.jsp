<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page contentType="text/html;charset=utf-8" %> 
<%@ page import="com.topcoder.web.common.model.EventType" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer" %>
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
    <jsp:param name="tabLev1" value="<%=EventType.ALGORITHM_TOURNAMENT_ID%>"/>
    <jsp:param name="tabLev2" value="summary"/>
    <jsp:param name="tabLev3" value="room1"/>
    </jsp:include>


        <h2>Algorithm Competition Room 1 Summary</h2>
        
        <div class="sub_content">
            <p><img src="/i/m/ivan_metelsky_big.jpg" alt="ivan_metelsky" style="width:55px; height:61px; border:0px; padding-right:2px;" hspace="6" vspace="1" align="left" class="myStatsPhoto" /><span>Tuesday, May 13, 2008<br />Introduction by <tc-webtag:handle coderId="10481120" context="algorithm" darkBG="true" /></span></p>
            <p align="right"><tc-webtag:forumLink forumID="521198" message="Discuss this competition" /></p>
            <br /><br />
            
            <h3>Burunduk1 wins Room 1!</h3>
            <br />
            <p style="float:right; width:200px; height:350px; margin-left:10px;"><img src="/i/tournament/tco08/shotR1.jpg" alt="Burunduk1 wins Room 1!" /></p>
            <p><strong>
Algorithm Semifinal 1 opened the TCO'08 Algorithm Competition this morning. The round proved to be quite eventful.
It started from many fast submissions on the 250, which was quite straightforward implementational problem.
After this, nothing happened for a while. Most coders proceeded to the 500, but some skipped it to directly proceed to the 1000. 
<tc-webtag:handle coderId="144400" context="algorithm" darkBG="true" /> and <tc-webtag:handle coderId="22652597" context="algorithm" darkBG="true" /> even started the round with the 1000.
</strong></p>
<p><strong>
The 500 also looked quite straightforward, so it was not very surprising when submissions on it started to come.
What was more surprising is <tc-webtag:handle coderId="309453" context="algorithm" darkBG="true" />'s fast submission on the 1000. However he resubmitted soon and looked
quite upset, so correctness of his submission was doubtful. Submissions on the 500 continued to appear during
the whole match. In the second half of match <tc-webtag:handle coderId="19849563" context="algorithm" darkBG="true" /> made incredibly fast submission on the 1000. Some time
later <tc-webtag:handle coderId="15868491" context="algorithm" darkBG="true" /> became the third coder to submit the 1000. Almost in the end of the round 5 more coders submitted
their Hards.
</strong></p>
<p><strong>The challenge phase was pretty spectacular. The were many attempts, some successful and some not. Five submissions on the Hard and two submissions
on the Medium were challenged. One particularly funny moment during the challenge was when <tc-webtag:handle coderId="15868491" context="algorithm" darkBG="true" /> successfully
challenged <tc-webtag:handle coderId="21111148" context="algorithm" darkBG="true" />'s submission.</strong></p>

<p><strong>It appeared that many more submissions on the 500 were incorrect - only 4 of them survived the systests. Finally,
<tc-webtag:handle coderId="15868491" context="algorithm" darkBG="true" /> won the round with correct submission on all problems. <tc-webtag:handle coderId="19849563" context="algorithm" darkBG="true" />'s
medium failed, so he took second place.
<tc-webtag:handle coderId="270505" context="algorithm" darkBG="true" /> closed the list of advancers to the Championship Round.
<tc-webtag:handle coderId="309453" context="algorithm" darkBG="true" />, <tc-webtag:handle coderId="15805598" context="algorithm" darkBG="true" />,
<tc-webtag:handle coderId="22663763" context="algorithm" darkBG="true" /> and <tc-webtag:handle coderId="144400" context="algorithm" darkBG="true" />
will have one more chance to advance this evening in the Wildcard Round.</strong></p>

<p><strong>Congratulations to all advancers and good luck in the next round!</strong></p>
            
            <br /><br />
            <p>by <tc-webtag:handle coderId="303644" context="algorithm" darkBG="true" /></p>
            <h4>DriveOrder</h4>
            <p>
To simulate the process, we will create an array of counters cnt, with the i-th element of cnt
representing the number of cars from the i-th road which already passed the crossing.
We will process in steps - on each step we will determine the car which has
the priority to pass the crossing, add this car to the output and increase the corresponding
cnt[i] by one.
</p>
<p>
First, we will get rid of a special case with major road - if there is a major road, then
we add all cars from that road to the output, set cnt[major] to the maximal possible value
and then forget about the major road at all.
</p>
<p>
Now, as we have three roads with neither of them being major, things become easy: 
list the cars present at the crossing and, if there are three or one cars, then 
lexicographically first car advances. If there are two cars, then find the index n
of the empty road and the car which passes is from the road (n - 1) (or, (n + 2) % 3, to be correct :).
</p>
<p>
Java solution follows:
</p>
<pre>
    int[] len;
    public String determineOrder(String[] cars, int major) {
        String ans = "";
        String[] data = cars.clone();
        len = new int[3];
        for (int i = 0; i &lt; 3; i++)
            len[i] = data[i].length();
        int[] v = new int[3];
        if (major != -1) {
            ans = data[major];
            v[major] = len[major];
            major = -1;
        }
        while (ans.length() &lt; len[0] + len[1] + len[2]) {
            int tg = solve(data, v);
            ans += data[tg].charAt(v[tg]++);
        }
        return ans;
    }
    int solve(String[] data, int[] v) {
        char m = 'Z' + 1;
        int cnt = 0;
        for (int i = 0; i &lt; 3; i++)
            if (v[i] &lt; len[i]) {
                cnt++;
                m = (char)Math.min(m, data[i].charAt(v[i]));
            }
        if (cnt == 1) {
            for (int i = 0; i &lt; 3; i++)
                if (v[i] != len[i])
                    return i;
            return -11; // something went wrong!
        }
        if (cnt == 3) {
            for (int i = 0; i &lt; 3; i++)
                if (v[i] != len[i] && data[i].charAt(v[i]) == m)
                    return i;
            return -12; // something went wrong!
        }
        for (int i = 0; i &lt; 3; i++) {
            int n1 = (i + 1) % 3;
            if (v[i] != len[i] && v[n1] == len[n1])
                return i;
        }
        return -13; // something went wrong!
    }
</pre>

            <br />
            <p>by <tc-webtag:handle coderId="10481120" context="algorithm" darkBG="true" /></p>
            <h4>MultiplayerBattleships</h4>
            <p>
In this problem small constraints give a hint to us - we should find what information constitutes 
the state of the game and then solve the problem using dynamic programming over all possible game states. 
The most straightforward approach specifies a game's state in the following way:
</p>
<ol>
<li>Number of a player who will make the next move.</li>
<li>For each deck, store whether this deck was already attacked or not.</li>
</ol>
<p>
The problem of this approach is that the number of states can be too large. 
In one of the maximal testcases
</p>
<pre>
    XXX.XXX
    .......
    XXX.XXX
    .......
    XXX.XXX
    .......
    XXX.XXX
</pre>
<p>
With 16 players the number of states will be as large as 2<sup>24</sup> * 16 = 268,435,456. 
To reduce this number let's note that it doesn't matter what exactly decks
within the ship are attacked, only the number of these decks is important. 
So our new approach is to store just the number of unattacked for each ship and the number of player
to do next move. 
This approach reduces the number of states significantly and now the worst case is the following:
</p>
<pre>
    XX.XX.X
    ......X
    XX.XX..
    ......X
    XX.XX.X
    .......
    XX.XX.X
</pre>
<p>
Here we have 16 * 3<sup>10</sup> * 2 = 1,889,568 states. 
It may still seem too large as we need to do significant amount of processing at each state. 
But in fact only 1/<b>playerCount</b> of all states are reachable, 
because the total number of attacked decks on the field uniquely determines the number of player to do next move. 
If there are X attacked decks, then
the next player to move has (0-indexed) number X % <b>playerCount</b>. 
So, in fact we have at most 118,098 states.
</p>
<p>
Now to solve the problem we write a recursive function which takes a state and returns 
an array of points each player will obtain after the end of the game assuming it
starts from the given state. 
The algorithm used by this function is the following:
</p>
<ul>
<li>Consider all possible moves for the player who needs to do next move.</li>
<li>For each move calculate the number of points scored by this move and recursively call the same function for the state we get immediately after the move is made.
Add the number of points to the result of recursive call to get the final result of the game for each possible first move.</li>
<li>Select the move which gives most points in the final result to the player who does the first move from current state (use the tiebreaker if necessary).
Return the final result of the game for this move.</li>
</ul>
<p>
To finish our solution, we just need to add memoization to this recursive function to ensure that each state is processed at most once.
</p>

            <br />
            <p>by <tc-webtag:handle coderId="10481120" context="algorithm" darkBG="true" /></p>
            <h4>BinaryMatrix</h4>
            <p>
The first thing we should note in this problem is that circular shifts of rows don't change 
the total amount of ones in the matrix. 
If this total amount is equal to the sum of all elements of <b>columns</b>, 
then we immediately know that we can never achieve a good matrix. 
Otherwise, we will try to satisfy the requirements for the first four columns only 
(the requirement for the fifth column will be satisfied automatically).
</p>
<p>
Let M(R) be the part of input matrix consisting of rows with indices greater than or equal to R only.
Our next goal is to write a method 
moves(R, c<sub>1</sub>, c<sub>2</sub>, c<sub>3</sub>, c<sub>4</sub>) -- 
the minimal number of circular shifts needed to transform the matrix M(R) 
into a matrix with exactly c<sub>i</sub> ones in i-th column for each i, 1 &le; i &le; 4 
(we'll return maxMoveCount + 1 if the transformation is not possible).
To calculate this function we can use recursion with memoization - 
we try to shift the R-th row K times, where K is between 0 and 4 (shifting more than 4 times obviously doesn't make sense). 
If the row after K shifts looks like a<sub>1</sub>a<sub>2</sub>a<sub>3</sub>a<sub>4</sub>a<sub>5</sub>, 
then the total amount of moves required to finish the transformation can be found as
K + moves(R+1, c<sub>1</sub>-a<sub>1</sub>, c<sub>2</sub>-a<sub>2</sub>, c<sub>3</sub>-a<sub>3</sub>, c<sub>4</sub>-a<sub>4</sub>). 
The minimum of this expression over all K will be returned as the result of method moves().
</p>
<p>
The method moves() helps us to find the answer for the problem. 
If moves(0, <b>columns</b>[0], <b>columns</b>[1], <b>columns</b>[2], <b>columns</b>[3]) &gt; <b>maxMoveCount</b>,
then there is no solution and we should return an empty String[]. 
Otherwise the solution can be constructed by assigning each row in a greedy manner. 
Before assigning each next row R we know the number <i>movesLeft</i> of
circular shifts we can apply to the rest of rows and the numbers <i>ones<sub>i</sub></i> of ones we should put into the rest of each i-th column. 
We again consider all possible
ways to shift the R-th row and check for each way whether we can complete solution after it or not. 
If we shift the row K times to obtain row a<sub>1</sub>a<sub>2</sub>a<sub>3</sub>a<sub>4</sub>a<sub>5</sub>,
the solution can be completed if and only if K + moves(R+1, ones<sub>1</sub>-a<sub>1</sub>, ones<sub>2</sub>-a<sub>2</sub>, ones<sub>3</sub>-a<sub>3</sub>,
ones<sub>4</sub>-a<sub>4</sub>) &le; movesLeft. 
Among all shifts that allow to complete the solution we should choose the lexicographically maximal and proceed to the next row.
</p>
<p>
There is still one unsolved problem left. 
The space of possible values for function moves is quite large -- in the worst case it contains like 40*41<sup>4</sup> = 113,030,440 different values,
so we are not able to calculate all values in the given time and even are not able to fit all possible return values into the memory. 
To resolve the issue we can make the optimization,
which reduces the number of possible states in about 16 times. Let N be the total number of rows in input matrix. 
Note that (i+1)-th parameter in function moves
can take values between 0 and <b>columns</b>[i], inclusive (0 &le; i &le; 3). If <b>columns</b>[i] &le; N/2, let's leave this parameter unchanged. 
Otherwise, the requirement for
i-th column can be reformulated as "the number of zeros must be equal to N - <b>columns</b>[i]" and N - <b>columns</b>[i] <= N/2. 
So let the (i+1)-th parameter means not the number of ones, but
the number of zeros. 
In such way each of parameters (except the first one) can take at most N/2+1 values, and the total amount of states reduces to 40*21<sup>4</sup> = 7,779,240.
This is enough for our program to run in time.
</p>

        </div><%-- .sub_content --%>
        
    </div><%-- #content --%>

<jsp:include page="../footer.jsp" />

</div><%-- #wrapper --%>

</body>
</html>
