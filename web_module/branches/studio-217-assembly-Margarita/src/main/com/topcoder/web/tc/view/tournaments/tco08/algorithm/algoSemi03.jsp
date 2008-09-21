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
    <jsp:param name="tabLev3" value="room3"/>
    </jsp:include>


        <h2>Algorithm Competition Room 3 Summary</h2>
        
        <div class="sub_content">
            <p><img src="/i/m/ivan_metelsky_big.jpg" alt="ivan_metelsky" style="width:55px; height:61px; border:0px; padding-right:2px;" hspace="6" vspace="1" align="left" class="myStatsPhoto" /><span>Tuesday, May 13, 2008<br />Introduction by <tc-webtag:handle coderId="10481120" context="algorithm" darkBG="true" /></span></p>
            <p align="right"><tc-webtag:forumLink forumID="521200" message="Discuss this competition" /></p>
            <br /><br />
            
            <h3>andrewzta wins Room 3!</h3>
            <br />
            <p style="float:right; width:200px; height:350px; margin-left:10px;"><img src="/i/tournament/tco08/shotR3.jpg" alt="andrewzta wins Room 3!" /></p>
            <p><strong>
The last Semifinal of this year's TCO turned out to have more complicated problems than two previous ones. However submissions on Easy didn't reflect it.
<tc-webtag:handle coderId="251074" context="algorithm" darkBG="true" /> was the first to submit the 250-pointer for 237.69 points. He was just 3 points in front
of <tc-webtag:handle coderId="11919691" context="algorithm" darkBG="true" /> and <tc-webtag:handle coderId="7459080" context="algorithm" darkBG="true" />. Many more coders also
submitted the Easy very fast. After that there was a very long silent period of time. Most coders went to the 550-pointer, but some tried the 950-pointer first.
The idea of solution for the 550-pointer was not hard, but it required lengthy and careful implementation. To the contrary, 950-pointer required really
small implementation, but the idea was hard to get.</strong></p>
<p><strong>
All coders who tried the 950-pointer first or last gave up and proceeded to 550-pointer. Only <tc-webtag:handle coderId="7442498" context="algorithm" darkBG="true" /> tried to
debug his solution till the end of 
the coding phase, but he wasn't successful. The submissions on the Medium problem started to came in the second half of the coding phase.
<tc-webtag:handle coderId="22663468" context="algorithm" darkBG="true" /> was
the first to submit the 550-pointer, and <tc-webtag:handle coderId="11829284" context="algorithm" darkBG="true" /> followed
closely. After a while <tc-webtag:handle coderId="7459080" context="algorithm" darkBG="true" /> and <tc-webtag:handle coderId="308453" context="algorithm" darkBG="true" />
also submitted their Mediums. <tc-webtag:handle coderId="11829284" context="algorithm" darkBG="true" /> took lead
after <tc-webtag:handle coderId="22663468" context="algorithm" darkBG="true" /> resubmitted, but the leader changed once more
after <tc-webtag:handle coderId="251074" context="algorithm" darkBG="true" /> made the
fastest 550-pointer submission. More people submitted their Mediums and by the end of the coding phase there were 15 submissions on it.
</strong></p>
<p><strong>
Four 550-pointer submissions were successfully challenged during the challenge phase. <tc-webtag:handle coderId="7442498" context="algorithm" darkBG="true" /> and
<tc-webtag:handle coderId="251074" context="algorithm" darkBG="true" /> scored
additional 50 and 25 points respectively, and these points helped them to advance to the Wildcard round. System tests proved that 5 more submissions on the Medium problem
are also wrong, including the solution by
<tc-webtag:handle coderId="251074" context="algorithm" darkBG="true" />. So <tc-webtag:handle coderId="11829284" context="algorithm" darkBG="true" /> regained the
lead and won his room. <tc-webtag:handle coderId="7459080" context="algorithm" darkBG="true" /> and
<tc-webtag:handle coderId="269554" context="algorithm" darkBG="true" /> also advanced to
the Championship round with second and third places, respectively.
<tc-webtag:handle coderId="22662189" context="algorithm" darkBG="true" />,
<tc-webtag:handle coderId="22658346" context="algorithm" darkBG="true" />, <tc-webtag:handle coderId="7442498" context="algorithm" darkBG="true" /> and
<tc-webtag:handle coderId="251074" context="algorithm" darkBG="true" /> will have
hard time fighting for the single advancing
spot in the Wildcard round. With 4 targets competing
and only 1 advancer this round is going to be very hot.</strong></p>
<p><strong>
Congratulations to all advancers and good luck in the next round!
</strong></p>
            
            <br /><br />
            <p>by <tc-webtag:handle coderId="272072" context="algorithm" darkBG="true" /></p>
            <h4>WhackAMole</h4>
            <p>This problem has some theoretically interesting features, but as befits an Easy, all competitors needed to solve it was good old brute force.</p>
<p>
Try each possible configuration of moles (in lexicographic order, to help with tiebreaking).  For each configuration, try all valid player positions and then see if any rotation of the moles will miss those players.  If not, that configuration won't work; move on to the next one.  Remember the working configuration with the most moles.
</p>
<p>
The total runtime, even with a very naive implementation, is 2^10 * 2^10 * 10 * 10, or around 100 million, which will easily run in the time limit.  As with many combinatorial problems, using bit manipulation simplifies running through the mole and player configurations.  There are many other possible optimizations, but competitors are better served just moving on to the next problem!
</p>
<p>
Here's Java code for a bit-based approach:
</p>
<pre>

public String placeMoles(int numHoles, int numHammers) {
  int mask = (1&lt;&lt;numHoles)-1, best_moles = 0, best_mole_bits = 0;
try_moles:
  for (int mole_bits = 0; mole_bits &gt;= mask; mole_bits++) {
    for (int player_bits = 0; player_bits &gt;= mask; player_bits++) {
      // Only try player configurations with numHammers players.
      int num_players = 0;
      for (int i = 0; i &lt; numHoles; i++)
        if ((player_bits &amp; (1&lt;&lt;i)) != 0) num_players++;
      if (num_players != numHammers) continue;
      // See if any mole rotation works for this player setup.
      int rotate = 0;
      for (rotate = 0; rotate &lt; numHoles; rotate++) {
        int rotated_mole_bits =
            ((mole_bits &lt;&lt; rotate) + (mole_bits &gt;&gt; (numHoles-rotate))) &amp; mask;
        if ((rotated_mole_bits &amp; player_bits) == 0) break;
      }
      if (rotate == numHoles) continue try_moles;  // Nope.
    }
    // We have a working mole configuration; see if it's better.
    int num_moles = 0;
    for (int i = 0; i &lt; numHoles; i++)
      if ((mole_bits &amp; (1&lt;&lt;i)) != 0) num_moles++;
    if (num_moles &gt; best_moles) {
      best_moles = num_moles;
      best_mole_bits = mole_bits;
    }
  }
  // Convert best configuration from bits to string.
  String ret = "";
  for (int i = numHoles-1; i &gt;= 0; i--)
    ret += ((best_mole_bits &amp; (1&lt;&lt;i)) == 0) ? 'O' : 'X';
  return ret;
}

</pre>
    

            <br />
            <p>by <tc-webtag:handle coderId="287269" context="algorithm" darkBG="true" /></p>
            <h4>IncompatibleMice</h4>
            <p>
This problem can be broken into two parts: 1) finding the possible locations in the maze of each mouse at any given time after it starts, and 2) testing if a given set of starting times will result in a possible conflict between the mice.
</p>
<p>
The simplest way to find the possible locations of a mouse is to run two breadth-first searches, one from its starting location (the "from" search) and a second from its ending location (the "to" search).  The distance to the ending square in the "from" search should equal the distance to the starting square in the "to" search.  Next, add the distances of corresponding squares of the two searches.  Any square with a sum equal to the length of the shortest path is a square the mouse may pass through, at a time equal to the distance in the "from" search after the mouse begins.
</p>
<p>
Next, you need to test if the mice will conflict, given all possible relative differences between their starting times.  One way to make sure you cover all possibilities is to consider all 6 possible orderings of the 3 mice.  For each ordering, assume the first mouse starts at time zero.  The second mouse can start anywhere from time zero to the length of the first mouse's path.  Likewise, the third mouse can start anywhere from time zero to the maximum of the ending times of the first two mice.
</p>
<p>
If your test for conflict between mice is slow, you can speed it up by testing each pair of mice individually, saving the results for each pair in a one-dimensional array and then using those saved results when testing the possible starting times for all 3 mice.  When testing 2 mice with a given time offset, you can make use of the fact that if the offset if even, the mice can only meet in the centers of squares.  If the offset is odd, the mice can only meet between two squares.  One simple, but more expensive, way to deal with detecting if mice meet between squares is to double the size of the maze in each direction, so that every square center and square edge in the original maze is a square center in the larger maze.
</p>

            <br />
            <p>by <tc-webtag:handle coderId="272072" context="algorithm" darkBG="true" /></p>
            <h4>SequentialThreads</h4>
            <p>
Dynamic Programming is the approach to use for this problem, with a
few subtleties that must be properly handled.  Here is one method.
</p>
<p>
The subproblem to be solved is calculating <code>P(n,t)</code>, the
probability that the first <code>n</code> threads will finish after
receiving exactly <code>t</code> time slices (no earlier, no later).
Time slices that go to other threads are ignored for these purposes.
</p>
<p>
In theory, there is no limit to how many time slices could be
required.  However, in practice, the probability will become
vanishingly small after a certain number.  Picking a cutoff time, as
high as possible without risking exceeding the runtime limit, is a
good way to deal with this.  As it turns out, even a cutoff of 1000
works well enough, and the worst case is easy to test if competitors
worry about accuracy.
</p>
<p>
<code>P(1,t)</code> is just 0.0 or 1.0 everywhere, since there's no
doubt how many time slices the first thread will consume before
finishing.  The complicated part is computing <code>P(n,t)</code>.
</p>
<p>
Suppose we know all values of <code>P(n-1,t)</code>.  Now, iterate
through all possible numbers of time slices <code>t</code> doled out
to the <code>n</code> threads under consideration.  We need to relate
this to the completion times of the left <code>n-1</code> threads in
order to use <code>P(n-1,t)</code>.  So, let us call <code>t</code>
the time at which the final time slice is sent to the left
<code>n-1</code> threads.  What are the odds of this occurring for a
given <code>t</code>?
</p>
<p>
It is the sum, for each possible <code>lt</code>, of:
[odds that <code>lt-1</code> out of <code>t-1</code> time slices are
sent to those left <code>n-1</code> threads] *
[odds that the final time slice will be sent to the left
<code>n-1</code> threads] *
[odds that those threads will finish after exactly <code>lt</code> time slices].
The second probability is just <code>(n-1)/n</code>, and the third
probability is <code>P(n-1,lt)</code>.  As for the first probability,
we can update it for each <code>lt</code> as we run over the
<code>t</code>s, or it can be calculated directly with some
combinatorics.
</p>
<p>
Note that there's still a little work to do after these <code>t</code>
time slices, but not much, because all of the remaining time slices
will be given to the rightmost thread.  So we should actually count
each result towards <code>P(n,t + [remaining time slices])</code>,
being careful to handle cases where the <code>n</code>th thread has or
hasn't yet reached its synchronization subtask.  After running through
all possible <code>t</code>s, the values for <code>P(n,t)</code>
should be as desired.
</p>
<p>
The final calculation of the average runtime for <code>n</code>
threads is the sum of <code>t*P(n,t)</code>.  The total runtime is
<code>O(n*t^2)</code>.
</p>
<p>
Java code follows</p>:
<pre>static final int MAXTIME = 2500;

public double expectedExecutionTime(String[] threads) {
  double[] P = new double[MAXTIME];  // Dynamic array for P(n-1,t).
  P[threads[0].length()] = 1.0;
  for (int n = 1; n &lt; threads.length; n++) {
    int sind = threads[n].indexOf('S'), rest = threads[n].length() - sind;
    double rprob = 1.0/(n+1);  // Prob of time slice going to rightmost thread.
    double[] P2 = new double[MAXTIME+50];  // Dynamic array for P(n,t).
    double[] lt_prob = new double[MAXTIME+1];  // Probability for each lt.
    lt_prob[0] = 1.0;
    for (int t = 1; t &lt; MAXTIME; t++) {
      // Update P2 using all possibile lt values.
      for (int lt = 1; lt &lt;= t; lt++)
        P2[t + Math.max(0, sind-(t-lt)) + rest] +=
            lt_prob[lt-1] * (1.0-rprob) * P[lt];
      // Update lt_prob, adding one more time slice.
      for (int lt = t; lt &gt;= 0; lt--)
        lt_prob[lt+1] = (1.0-rprob) * lt_prob[lt] + rprob * lt_prob[lt+1];
      lt_prob[0] *= rprob;
    }
    P = P2;
  }
  double ret = 0.0;
  for (int i = 0; i &lt; MAXTIME; i++) ret += i * P[i];
  return ret;
}</pre>

            
        </div><%-- .sub_content --%>
        
    </div><%-- #content --%>

<jsp:include page="../footer.jsp" />

</div><%-- #wrapper --%>

</body>
</html>
