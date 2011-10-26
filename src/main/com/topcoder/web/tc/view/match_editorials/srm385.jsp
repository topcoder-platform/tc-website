<%@  page language="java"  %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Statistics</title>

<jsp:include page="/script.jsp" />
<jsp:include page="/style.jsp">
  <jsp:param name="key" value="tc_stats"/>
</jsp:include>
<SCRIPT LANGUAGE="JavaScript" SRC="/js/print.js"></SCRIPT>
</head>
<body>
<div id="onTop">
<jsp:include page="../top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>
</div>



<table width="100%" border="0" cellpadding="0" cellspacing="0">
 <tr valign="top">
<%-- Left Column Begins--%>
   <td width="180" id="onLeft">
      <jsp:include page="/includes/global_left.jsp">
         <jsp:param name="node" value="algo_match_editorials"/>
      </jsp:include>
   </td>
<%-- Left Column Ends --%>

<%-- Center Column Begins --%>
<td class="statTableSpacer" width="100%" valign="top">
<div class="bodyText">
<jsp:include page="../page_title.jsp" >
<jsp:param name="image" value="statistics_w"/>
<jsp:param name="title" value="Match Editorial"/>
</jsp:include>

<div class="linkBox">
    <A href="/tc?module=Static&d1=match_editorials&d2=archive">Archive</A><br />
    <span id="printableLink"><A href="Javascript:makeInvisible();">Printable view</A><br /></span>
    <span id="navigableLink" class="invisible"><A href="Javascript:makeNavigable();">Normal view</A><br /></span>
    <A href="/stat?c=round_overview&er=5&rd=10810">Match Overview</A><br />
    <tc-webtag:forumLink forumID="518660" message="Discuss this match" />
</div>
<span class="bodySubtitle">SRM 385</span><br />Thursday, December 27, 2007
<br /><br />



<h2>Match summary</h2> 

<p> 
The last SRM in the year, authored by 
<tc-webtag:handle coderId="10574855" context="algorithm"/><%-- Petr --%> , 
attracted 1359 participants. In Division 1, coders faced a very tough 1100-point
problem which eventually no one managed to get right. 
Thus, the first place went to <tc-webtag:handle coderId="7340263" context="algorithm"/><%-- gevak --%> 
with 2 solved problems and strong performance during the challenge phase. 
<tc-webtag:handle coderId="19849563" context="algorithm"/><%-- ACRush --%> 
and
<tc-webtag:handle coderId="15056181" context="algorithm"/><%-- vlad89 --%> 
took the 2nd and 3rd places, respectively.
</p> 

<p>
In Division 2, 28 coders solved all three problems correctly.
<tc-webtag:handle coderId="20424392" context="algorithm"/><%-- AlixM --%> 
won the Division with 3 correct problems and 4 successful challenges.
He was followed by 
<tc-webtag:handle coderId="22664173" context="algorithm"/><%-- kefir --%> 
and
<tc-webtag:handle coderId="14890998" context="algorithm"/><%-- B.Good --%> .
</p>


 

<H1> 

The Problems 

</H1>

</p> 

 

<font size="+2"> 

<b><a href="/stat?c=problem_statement&amp;pm=8483&amp;rd=10810" name="8483">RussianSpeedLimits</a></b> 

</font> 

<A href="Javascript:openProblemRating(8483)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=518660" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

<br> 

Used as: Division Two - Level One: <blockquote><table cellspacing="2"> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Value</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      250 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Submission Rate</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      636 / 702 (90.60%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Success Rate</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      566 / 636 (88.99%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>High Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      <b>jackson.liao31</b> for 248.88 points (1 mins 54 secs) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Average Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      204.53 (for 566 correct submissions) 

    </td> 

  </tr> 

</table></blockquote> 

<p>
This problem can be solved in the straightforward way, by reading the signs 
one by one and updating the current speed limit ant city bounds information. 
Thus, we need just two variables to keep the current state of the road: an 
integer speed limit and a boolean flag which holds <tt>true</tt> value when
we are inside a city and <tt>false</tt> otherwise. 
</p>

<p>
Java solution follows.
</p>

<pre>
public class RussianSpeedLimits {

    private int getDefaultLimit(boolean isInCity) {
        return isInCity ? 60 : 90;
    }

    public int getCurrentLimit(String[] signs) {
        boolean isInCity = true;
        int speedLimit = getDefaultLimit(isInCity);
        for (String sign : signs) {
            if (sign.equals("default")) {
                speedLimit = getDefaultLimit(isInCity);
            } else if (sign.equals("city")) {
                isInCity = !isInCity;
                speedLimit = getDefaultLimit(isInCity);
            } else {
                speedLimit = Integer.parseInt(sign);
            }
        }
        return speedLimit;
    }
}
</pre>

<p>
For a similar C++ implementation, see <tc-webtag:handle coderId="21684580" context="algorithm"/><%-- dcp --%> 's 
<a href="/stat?c=problem_solution&rm=267878&rd=10810&pm=8483&cr=21684580">solution</a>.
</p>

 

<font size="+2"> 

<b><a href="/stat?c=problem_statement&amp;pm=8482&amp;rd=10810" name="8482">UnderscoreJustification</a></b> 

</font> 

<A href="Javascript:openProblemRating(8482)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=518660" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

<br> 

Used as: Division Two - Level Two: <blockquote><table cellspacing="2"> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Value</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      500 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Submission Rate</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      437 / 702 (62.25%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Success Rate</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      344 / 437 (78.72%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>High Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      <b>ankit.pruthi</b> for 497.95 points (1 mins 49 secs) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Average Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      302.85 (for 344 correct submissions) 

    </td> 

  </tr> 

</table></blockquote> 

 

Used as: Division One - Level One: <blockquote><table cellspacing="2"> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Value</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      250 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Submission Rate</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      554 / 565 (98.05%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Success Rate</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      522 / 554 (94.22%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>High Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      <b>bmerry</b> for 244.17 points (4 mins 24 secs) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Average Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      196.24 (for 522 correct submissions) 

    </td> 

  </tr> 

</table></blockquote> 

<p>
The first thing to notice about this problem is that the number of space 
characters between any two consecutive words in the aligned line of text 
can be calculated by dividing the total number of spaces in the line by
the number of word-separating space intervals. Here, the number of spaces
is equal to the line <tt>width</tt> minus the total number of letters in 
the given
<tt>words</tt> array, and the number of space intervals is equal to the 
number of words
minus one. If such division produces no remainder, then all the space 
intervals are equal and we only need to format the answer by inserting 
the corresponding number of spaces (i.e., underscores) between consecutive
pairs of words. Otherwise, the two possible space interval sizes can be
calculated by rounding the division result up and down:
</p>

<pre>
int totalSpaces = width - &lt;<i>Total number of letters in</i> words&gt;;
int numIntervals = words.size() - 1;
int shortInterval = totalSpaces / numIntervals;
int longInterval = totalSpaces / numIntervals + 1;
</pre>

<p>
The exact number of space intervals of each size can be found using
the fact that there are <tt>numIntervals</tt> in total and the total number 
of space characters is <tt>totalSpaces</tt>. 
</p>

<pre>
int numLongIntervals = totalSpaces - shortInterval * numIntervals;
int numShortIntervals = numIntervals - numLongIntervals;
</pre>

<p>
Now we need to decide which intervals should be short and which should be long.
Taking into account that the resulting line must be the lexicographically 
smallest one, we want to place long intervals before words starting 
from a lowercase letter and short intervals before words starting from an 
uppercase letter, as long as we haven't used all the intervals of the 
corresponding length.
</p>

<p>
A C++ solution implementing this approach follows.
</p>

<pre>
string justifyLine(vector<string> words, int width) {
    int totalLetters = accumulate(words.begin(), words.end(), string()).size();
    int totalSpaces = width - totalLetters;
    
    int numIntervals = words.size() - 1;
    int shortInterval = totalSpaces / numIntervals;
    int longInterval = shortInterval + 1;
    int numLongIntervals = totalSpaces - shortInterval * numIntervals;
    int numShortIntervals = numIntervals - numLongIntervals;
    
    string line = words[0];
    for (int i = 1; i &lt; words.size(); i++) {
        // We will use the short interval if any of the following conditions 
        // is true:
        // a. The word starts from an uppercase letter 
        //        AND we haven&#39;t used up all short intervals.
        // b. We have used up all long intervals.
        if ((words[i][0] &lt; &#39;_&#39; &amp;&amp; numShortIntervals > 0) 
                || (numLongIntervals == 0)) {
            line += string(shortInterval, '_');
            numShortIntervals--;
        } else {
            line += string(longInterval, '_');
            numLongIntervals--;
        }
        line += words[i];
    }
    return line;
}

</pre>

<p>
Note that the number of long intervals can also be calculated using the division remainder
operator, as did <tc-webtag:handle coderId="15805598" context="algorithm"/> in his Java
<a href="/stat?c=problem_solution&rm=267825&rd=10810&pm=8482&cr=15805598">solution</a>.
</p>
 

<font size="+2"> 

<b><a href="/stat?c=problem_statement&amp;pm=8474&amp;rd=10810" name="8474">SummingArithmeticProgressions</a></b> 

</font> 

<A href="Javascript:openProblemRating(8474)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=518660" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

<br> 

Used as: Division Two - Level Three: <blockquote><table cellspacing="2"> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Value</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      1000 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Submission Rate</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      159 / 702 (22.65%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Success Rate</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      31 / 159 (19.50%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>High Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Tanaeem</b> for 791.21 points (15 mins 28 secs) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Average Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      574.69 (for 31 correct submissions) 

    </td> 

  </tr> 

</table></blockquote> 

<p>
Since we need to represent the numbers as the sum of an arithmetic progression,
let's first calculate that sum using the well-known 
<a target="_blank" href="http://en.wikipedia.org/wiki/Arithmetic_Progression#Calculating_the_value_of_an_arithmetic_series">formula</a>:
<br/>
<tt> (x) + (x+d) + (x+2*d) + ... + (x+(k-1)*d) = k * x + k * (k-1) / 2 * d</tt>
<br/>
Now, we can introduce two new constants for convenience:<br/>
<tt>A = k</tt><br/>
<tt>B = k * (k-1) / 2</tt><br/>
</pre>
and redefine the problem as follows: How many integers between <tt>left</tt> and <tt>right</tt>
can be expressed in the form <tt>A * x + B * d</tt>, where <tt>x</tt> and <tt>d</tt> are some
positive integers?
</p>

<p>
Obviously, any number not divisible by 
<tt><a target="_blank" href="http://en.wikipedia.org/wiki/Greatest_Common_Divisor">GCD</a>(A, B)</tt> can not be 
represented as <tt>A * x + B * d</tt>, so we can divide <tt>A</tt>, <tt>B</tt>, <tt>left</tt>, and 
<tt>right</tt> by GCD(A, B) and get the same problem with <tt>A</tt> and <tt>B</tt> being
relatively prime. (Notice that <tt>left</tt> should be rounded up and <tt>right</tt> should 
be rounded down after the division.)
</p>

<p>
Now, it can be proven that any number greater than or equal to <tt>2 * A * B</tt> can be represented as 
<tt>A * x + B * d</tt>. Here is a hint for the proof: for every such number N, <br/>
<tt>N mod A = (B * d) mod A</tt><br/>
<tt>N mod B = (A * x) mod B</tt><br/>
and since A and B are relatively prime, we can find values for <tt>x</tt> and <tt>d</tt> such that 
<tt>1 &le; d &le; A</tt> and <tt>1 &le; x &le; B</tt>
that satisfy those two equations.<br/>
To find out if the numbers less than <tt>2 * A * B</tt> can be represented in the form <tt>A * x + B * d</tt>,
we can use the fact that for every such representation we can reduce <tt>x</tt> by <tt>B</tt>
and correspondingly increase <tt>d</tt> by <tt>A</tt> to get the same sum. Thus, we only need to check
values from <tt>1</tt> to <tt>B</tt> for <tt>x</tt>.
</p>

<p>
The C++ solution follows.
</p>

<pre>
bool canRepresent(int A,int B,int N) {
    for (int x = 1; x &lt;= B; x++) {
        if (A * x &gt;= N)
            return false;
        if ((N - A * x) % B == 0) {
            return true;
        }
    }
    return false;
}

int howMany(int left, int right, int k) {
    int A = k;
    int B = k * (k - 1) / 2;
    int D = GCD(A, B);
    A /= D;
    B /= D;
    left = (left + D - 1) / D;
    right /= D;
    int ans = 0;
    while (left &lt;= right &amp;&amp; left &lt; 2 * A * B) {
        ans += canRepresent(A, B, left++);
    }
    ans += right - left + 1;
    return ans;
}
</pre>

 

<font size="+2"> 

<b><a href="/stat?c=problem_statement&amp;pm=8471&amp;rd=10810" name="8471">TurningMaze</a></b> 

</font> 

<A href="Javascript:openProblemRating(8471)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=518660" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

<br> 

Used as: Division One - Level Two: <blockquote><table cellspacing="2"> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Value</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      500 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Submission Rate</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      295 / 565 (52.21%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Success Rate</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      200 / 295 (67.80%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>High Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Zuza</b> for 458.70 points (8 mins 41 secs) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Average Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      279.73 (for 200 correct submissions) 

    </td> 

  </tr> 

</table></blockquote> 

<p>
As it is said in the problem statement, rotating a room twice does not change the 
orientation of the room's doors. That is why the complete state of the maze can be 
described by two vectors of boolean values, <tt>rows</tt> and <tt>columns</tt>, where
<tt>rows[i]</tt> is <tt>true</tt> if row number <tt>i</tt> has been rotated an 
odd number of times, and <tt>false</tt> otherwise; the <tt>columns</tt> vector 
stores the similar information about the columns. Given these two vectors, we can 
get the current type of the room in row <tt>i</tt>, column <tt>j</tt>
using the following rules:
<ul>
    <li>If the initial type of the room is either 'A' or 'B', the current type is the same.</li>
    <li>If exactly one of the values <tt>rows[i]</tt>, <tt>columns[j]</tt> is <tt>true</tt>, room
    type 'C' changes to 'D' and vise versa; otherwise, the current room type is the same as the initial one.</li>
</ul>
</p>

<p>
Now, the adventurer's state at any moment of time can be fully described by his 
two coordinates and the two vectors describing the maze's state. From the 
current state <tt>&lt;x, y, rows, columns&gt;</tt>, the adventurer can either
go to one of the neighbouring rooms, provided that both the current and the 
neighbouring rooms have the necessary doors, or press the button and change 
the state of the maze. Thus, each state can have at most 5 adjacent states. 
</p>

<p>
It is convenient to represent the vectors <tt>rows</tt> and <tt>columns</tt>
as integer variables, each bit of which corresponds to a boolean value in 
the vector. Then the initial state can be represented as <tt>&lt;0, 0, 0, 0&gt;</tt>
and the final state is <tt>&lt;M - 1, N - 1, X, Y&gt;</tt>, where M is the number 
of rows in the maze description, N is the number of columns, X is any number
between 0 and 2<sup>M</sup> - 1 and Y is any number between 0 and 2<sup>N</sup> - 1,
inclusively. To find the path from the initial state to the final one in the 
graph of states, a 
<a href="/tc?module=Static&d1=tutorials&d2=graphsDataStrucs2#breadth">breadth-first search algorithm</a> 
can be used.
The total number of states is equal to 7 * 7 * 2<sup>7</sup> * 2<sup>7</sup> = 
802,816, and a good BFS implementation should run in time. For an example of 
solution using the BFS algorithm, see 
<tc-webtag:handle coderId="11972352" context="algorithm"/><%-- Zuza --%> 's
fastest 
<a href="/stat?c=coder_room_stats&cr=11972352&rd=10810&rm=267829">C++ solution</a> or
the similar 
<a href="/stat?c=problem_solution&rm=267828&rd=10810&pm=8471&cr=7452866">Java solution</a> 
by 
<tc-webtag:handle coderId="7452866" context="algorithm"/><%-- Im2Good --%> .
</p>



 

<font size="+2"> 

<b><a href="/stat?c=problem_statement&amp;pm=8458&amp;rd=10810" name="8458">InfiniteAddition</a></b> 

</font> 

<A href="Javascript:openProblemRating(8458)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=518660" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

<br> 

Used as: Division One - Level Three: <blockquote><table cellspacing="2"> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Value</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      1100 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Submission Rate</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      10 / 565 (1.77%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Success Rate</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      0 / 10 (0.00%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>High Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      <b>null</b> for null points (NONE) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Average Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      No correct submissions 

    </td> 

  </tr> 

</table></blockquote> 

<p>
Before trying to find the three requested strings, we can cut off some cases in 
which the answer can not possibly exist based on the given numbers. 
Note that the LCM of any two given numbers should be divisible by the 
third number. For example, if LCM(sum, op1) is not a multiple of op2, then the 
string of length op2 is periodic with period LCM(sum, op1) mod op2.
Therefore, if a solution exists for the given values of sum, op1, and op2, 
then LCM(sum, op1, op2) = LCM(sum, op1) = LCM(sum, op2) = LCM(op1,op2).
</p>

<p>
Next, we get a system of linear equations with variables being the values of 
the three strings' characters (i.e. there are sum + op1 + op2 variables in total)
and the equations of form <br/>
S[i mod sum] = P[i mod op1] + Q[i mod op2] (mod 26)<br/>
where i = 0, ..., LCM(sum, op1, op2) - 1.<br/>
<font color="white">That's pretty much everything coherent I can tell you about 
    this problem, so the further several paragraphs will be based on the author's 
    explanation.</font>
<br/>
As <tc-webtag:handle coderId="10574855" context="algorithm"/><%-- Petr --%>  explains,
we can not solve the equation system modulo 26, so we should solve it twice, 
modulo 2 and modulo 13, using Gaussian elimination, and get a set of free variables,
which can be assigned any values, and all other variables expressed linearly in 
terms of the free ones. (It turns out that the set of free variables is the same
for solutions modulo 2 and modulo 13.) At that, each variable should depend only
on those located before it in the answer format (that is, a variable representing 
a letter in S depends only on free variables representing the earlier letters in S;
a variable representing a letter in P depends on the free variables representing 
the earlier letters in P or any letters in S, etc.) That can be achieved by running
the Gaussian elimination from the last variable's column to the first one.
</p>

<p>
Having solved the equation system, we try all possible letter values for each free
variable in turn, until we find a value that can lead to a valid solution, then 
go on to the next variable in the format order, and so on, until we get all the 
values. For each set of assigned free variables we verify that those values 
do not break any of the equations and that the resulting solution can be non-periodic.
</p>

<p>
We check that each of the strings S, P, and Q can be non-periodic separately; 
moreover, it turns out that we can even perform the check for each specific period g
(where g is a divisor of the corresponding string length) separately from other 
periods. Thus, for each period g we try to find two variables with distance g between
them that are expressed by different linear functions of the remaining free variables.
</p>

<p>
You can check out the solutions of the few brave TopCoders who dared to implement the 
described approach in the practice room.
<br/>
<font color="white">And here comes the solution for mere mortals.</font>
<br/>
If you are not satisfied with the above explanation, here is another approach that
should be easier to understand and implement. Notice how in every example, the first
string (S) contains only characters 'A', 'B', and 'Z'. (Well, there
are not many examples in the problem statement for this observation to be convincing enough,
but you could generate more test answers using any slow brute force solution.)
Furthermore, it turns out that the second string contains only characters 'A', 'B',
'Y', and 'Z', with the exception of 'C' appearing in the last position in some rare
cases. So, using these two observations, we can get a pretty fast brute force 
solution. I think its correctness could even be proven, but we will leave the proof
as an exercize for the reader. 
</p>

<br /><br />


<div class="authorPhoto">
    <img src="/i/m/dmytro_big4.jpg" alt="Author" />
</div>
<div class="authorText">
    By&#160;<tc-webtag:handle coderId="7546003" context="algorithm"/><br />
    <em>TopCoder Member</em>
</div>


</div>
</td>
<%-- Center Column Ends --%>

<%-- Right Column Begins --%>
   <td width="170" id="onRight">
  <jsp:include page="../public_right.jsp">
   <jsp:param name="level1" value="default"/>
  </jsp:include>
   </td>
<%-- Right Column Ends --%>

<%-- Gutter --%>
   <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<%-- Gutter Ends --%>
  </tr>
</table>

<div id="onBottom">
<jsp:include page="../foot.jsp" />
</div>

</body>

</html>
