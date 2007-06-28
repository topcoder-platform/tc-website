<%@ page contentType="text/html;charset=utf-8" %> 
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
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
                    <jsp:param name="tabLev1" value="algorithm"/>
                    <jsp:param name="tabLev2" value="summary"/>
                    <jsp:param name="tabLev3" value="room3"/>
                    </jsp:include>

                </td>
                <td id="bodySpacer" width="100%">
                    <div id="pageBody">

                                     <h1><span>bmerry wins Room 3!</span></h1>

                        <img src="/i/m/Olexiy_big2.jpg" alt="" width="55" height="61" border="0" hspace="6" vspace="1" align="left" class="myStatsPhoto"/><br />
<A HREF="http://forums.topcoder.com/?module=ThreadList&amp;forumID=514956">Discuss this match</A><br>
Thursday, June 28, 2007<br>
Introduction by <a href="/tc?module=MemberProfile&amp;cr=303644&amp;tab=alg" class="coderTextRed">Olexiy</a>

<img style="float:right; width:200px; 350px; padding-left:10px;" src="/i/tournament/tco07/shotR3.jpg">
<br><br>
<p>
For more minute-by-minute analysis, check out <tc-webtag:handle coderId="10574855" context="algorithm"/>'s latest <a href="/tc?module=Static&d1=tournaments&d2=tco07&d3=blogs&d4=Petr05">blog</a>.
</p>
<p>
<tc-webtag:handle coderId="251074" context="algorithm"/> and <tc-webtag:handle coderId="21971539" context="algorithm"/> advance to the finals, while <tc-webtag:handle coderId="7462740" context="algorithm"/>, <tc-webtag:handle coderId="9927526" context="algorithm"/>, <tc-webtag:handle coderId="293874" context="algorithm"/> and <tc-webtag:handle coderId="272072" context="algorithm"/> are heading for the wildcard.</p>
</p>
<p>
Congratulations to the advancers and good luck to the coders competing in the Wildcard and Finalsrounds!
</p>
	

<p><span style="font-size:14px; font-weight:bold;">BusyTime</span></p>
<p>by <tc-webtag:handle coderId="303185" context="algorithm"/></p>

<p>Let's solve the problem on discrete values first. Let's say we have a fixed time T which we want to use for each processor. Now we use a matrix S[p][t] which tells us what task is being executed on processor p at time t. If we can fill the entire matrix with chunks of  jobs, so that each job has at most need[job] elements and also each column doesn't have two  elements with the same value for the job, then it means the amount of time we can use in all processors is at least T. We can check if the matrix can be filled by assigning job values to the elements in the matrix row by row going top to bottom and for each row going from left to right. When we fill the rows we have to be careful not to use more than T slots for a job, even though need[job] is bigger than T, because if we do then we'll have parts of the same job being executed at the same time. </p>
<p>It's obvious that any valid covering can be transformed to this covering and back by swapping elements an making sure at each step that the solution is still valid. Now we'll just binary search to find the maximum value for T. We can easily adapt this solution to the problem where T is a real number, but we might want to be careful due to the precision in the binary search algorithm. The simple way to get the result right is to iterate the search a fixed number of times (for example 100) so that we know  all bits in the answer have been found and we don't have to worry about the epsilon.</p>
<p><span style="font-size:14px; font-weight:bold;">ToolingUp</span></p>
<p>by <tc-webtag:handle coderId="303185" context="algorithm"/></p>

<p>The trick in this problem is that growing the sum quadratically and the elements used linearly grows the lowest common multiple exponentially, thus the results should be pretty small. In any solution it doesn't make sense to use any number that isn't a prime or a power of a prime, since if we use X = A * B then we can decrease the sum by using A and B while the lcm doesn't change. Now the solution becomes clear, we'll use dynamic programming to fill the following matrix: best[p][s] is the largest lcm we can find for a set of numbers with the sum s and with the largest prime number used smaller or equal to p. We will initialize best[0][0] with the lcm of the numbers in sizes, and then we just use something very similar to the knapsack's problem dynamic programming solution. Here's some code:</p>
<pre>
    int bestResult = 499;
    for (int i = 2; i < 500; i++) {
      if (prime(i) == 0) {
        for (int j = bestResult; j >= 0; j--) {
          if (best[j] == 0) continue;
          int ii = i;
          while (ii + j <= bestResult) {
            int jj = ii / (int)gcd(ii, best[0]);
            if (best[ii + j] == 0 || best[ii + j] < best[j] * jj) {
              best[ii + j] = best[j] * jj;
              if (best[ii + j] >= targetLcm) bestResult = ii + j;
            }
            ii *= i;
          }
        }
      }
    }
    return bestResult;
</pre>
<p>Instead of using a whole matrix we can use two rows cause we generate best[p] from best[p-1], and to use just one row we fill the elements of the row from right to left, so that if we are currently at element j, all elements from j to the end are elements of best[p] being processed and all elements from start to j are elements of best[p - 1].</p>

<p><span style="font-size:14px; font-weight:bold;">Inc</span></p>
<p>by <tc-webtag:handle coderId="287269" context="algorithm"/></p>
<p>
This problem can be solved with a recursive function to return the final state of the board, given the current state and how may turns have been taken.
From the number of turns, you can deduce whose turn it is to move next.
To find that player's best move, simply loop through all legal moves, generate the new board state, and call the function recursively to determine what final state this move would result in.
Coding the somewhat complex tiebreaking rules can be simplified a bit by looping over the legal moves in the correct order.
</p>

<p>
Of course, a recursive function will time out without using dynamic programming or memoization.
It is key to realize that not all possible 3^25 board positions are reachable from any single starting position.  You only need to store the increment (mod 3) for each row and column, leading to a much more manageable 3^10 possible states.
</p>

<p>
This problem would be simpler if it only asked for your final score, rather than the final board position.
You can either store both the score and board position in your memoization table, or have a function that computes your score based on the initial board position and increments for each row and column.
Efficient coding is required to avoid timing out.
I had to add a second memoization table to the function that computes the score based on a board position in order to make my solution fast enough.
That explains why I'm not among the ranks of the the coders participating in the onsite rounds of the TopCoder Open.
</p>


<br /><br />
                    </div>
                </td>
            </tr>
        </table>


        <jsp:include page="../footer.jsp" />
    </div>
</div>

</body>

</html>
