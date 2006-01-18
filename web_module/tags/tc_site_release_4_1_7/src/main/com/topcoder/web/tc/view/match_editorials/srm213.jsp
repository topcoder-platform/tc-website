<%@  page language="java"  %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Statistics</title>

<jsp:include page="../script.jsp" />
<LINK REL="stylesheet" TYPE="text/css" HREF="/css/stats.css"/>

</head>

<body>

<jsp:include page="../top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">
<!-- Left Column Begins-->
        <td width="180">
            <jsp:include page="../includes/global_left.jsp">
                <jsp:param name="level1" value="statistics"/>
                <jsp:param name="level2" value="match_editorials"/>
            </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Center Column Begins -->
<td class="statTableSpacer" width="100%" valign="top">
<div class="bodyText">
<jsp:include page="../page_title.jsp" >
<jsp:param name="image" value="statistics_w"/>
<jsp:param name="title" value="Match Editorial"/>
</jsp:include>

<div style="float: right;" align="right"><A href="/tc?module=Static&d1=match_editorials&d2=archive">Archive</A><br>
<tc-webtag:forumLink forumID="505684" message="Discuss this match" /></div>
<span class="bodySubtitle">SRM 213</span><br>Tuesday, September 28, 2004
<br><br>

<span class="bigTitle">Match summary</span>

<p>
Strings, strings, strings, and shoelaces.  Surely, this SRM contained lots of strings, and some coders got all tied up in knots.  
</p>
<p>
Division I was won by <b>monsoon</b> with an amazing six challenges.  <b>antimatter</b>, ever the speed demon, 
finished second with three challenges, and in third place was (former blue coder) <b>mlehenbauer</b>, who also
had the fastest score on the 500.  <b>Ken_Vogel</b> and <b>ZorbaTHut</b>, who had the only submission on the 1000, 
were the other top finishers.</p>

<p>In Division II, newcomer <b>ryanprichard</b> easily won by more than 100 points, solving all three problems 
in about 45 minutes and jumping up to an impressive initial rating of 1892.  The other top coders
in Division II included newcomer <b>jdai</b> and <b>SO?</b>, who has yet to get a Division II question wrong.
<b>csd98412</b> and newcomer <b>xor_freecity</b> rounded out the top 5 in Division II.
</p>

<p>
<H1>
The Problems
</H1>
</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=2850&amp;rd=5859" name="2850">Chivalry</a></b>
</font>
<A href="Javascript:openProblemRating(2850)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A>
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505684" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

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
      216 / 251 (86.06%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      173 / 216 (80.09%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>cypressx</b> for 244.84 points (4 mins 8 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      195.04 (for 173 correct submissions)
    </td>
  </tr>
</table></blockquote>
<p>This problem was a simulation that was inspired by my experience getting off a crowded train.  
Basically the rules you have to follow are:</p>
<ol>
        <li>If there's a woman and a man at the front of each line, the woman goes next.</li>
        <li>Otherwise, if there's anyone left on line 1, (it's both women or both men) - take the first person from line 1</li>
        <li>Otherwise, take the first person from line 2.</li>
</ol>

<p>You also have to consider when one line is empty and the other is not.  Taking all of these into account,
my solution looked like this:
<pre>
        String out = "";

        while (line1.length() &gt; 0 || line2.length() &gt; 0)
        {
            if (line1.length() &gt; 0 &amp;&amp; line1.charAt(0) == 'W')
            {        
                // we don't have to look at line2 because the tie-break rule 
                // means we'd take line1 anyway
                out += 'W';
                line1 = line1.substring(1);     // consume first person on line 1
            }
            else if (line2.length() &gt; 0 &amp;&amp; line2.charAt(0) == 'W')
            {
                // we already looked at line1 and it doesn't start with a woman, 
                // but line2 does, so take it
                out += 'W';
                line2 = line2.substring(1);     // consume first person on line 1
            }
            else
            {
                // both start with men
                // take first person from line1 if there's anyone left, otherwise line2
                if (line1.length() &gt; 0) line1 = line1.substring(1);
                else line2 = line2.substring(1);
                out += 'M';
            }
        }

        return out;
</pre>
</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=2848&amp;rd=5859" name="2848">ShoelaceLength</a></b>
</font>
<A href="Javascript:openProblemRating(2848)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A>
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505684" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

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
      118 / 251 (47.01%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      79 / 118 (66.95%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>theflea74</b> for 442.26 points (10 mins 33 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      300.49 (for 79 correct submissions)
    </td>
  </tr>
</table></blockquote>

<p>Ok, so I admit, I'm really not <i>that</i> lazy when my shoelaces break.  Anyway, to work out this 
problem, you'd be best off to draw a diagram for yourself; see below.</p>

<p>First, you initialize the length to the starting width (which goes horizontally across the bottom of the laces).  
Then, for each pair of laces, you add twice the hypotenuse of triangle AED.  (You add twice the hypotenuse 
because there are effectively two laces that cross each other.)</p>

<p>Since the width between the pairs of eyelets increases linearly, you can pre-calculate the difference in the widths 
from one set to the next as:</p>
<pre>
        double delta = (endWidth - startWidth)/(numPairs - 1.0);
</pre>

<p>Then, you loop through between the pairs:
<pre>
        // starting length is the starting width (the horizontal distance)
        double len = startWidth;

        // "current" top width
        double width = startWidth;

        // pre-calculated difference between widths
        double delta = (endWidth - startWidth)/(numPairs - 1.0);

        for (int i = 0; i &lt; numPairs - 1; ++i) 
        {
            double nextWidth = width + delta;

            double base = (nextWidth + width)/2.0;
            len += 2.0*Math.sqrt(base*base + spread*spread);

            width = nextWidth;
        }

        return len;
</pre>

<p>The height of the triangle (or trapezoid) is a constant, and is given as <b>spread</b>.  To clarify the calculation 
of the hypotenuse of the triangle (the diagonal of the trapezoid), refer to the following diagram.</p>
<br/>
<center><img src="/i/srm/srm213.PNG" border="0"/></center>

<p>We need to calculate AD, the diagonal of ABDC (or hypotenuse of AED):
<pre>
        AD = sqrt(ED<sup>2</sup> + AE<sup>2</sup>)
</pre>
</p>
<p>
From the diagram,
<pre>
        CD = CE + EF + FD
</pre>
</p>
<p>
But since ABDC is isosceles,
<pre>
        CD = FD + AB + FD
        CD = 2FD + AB
        FD = (CD - AB)/2
</pre>
</p>
<p>
But what we really need is ED:
<pre>
        ED = EF + FD
</pre>
</p>
<p>
Again, since ABDC is isosceles,
<pre>
        ED = AB + FD
</pre>
</p>
<p>
From above,
<pre>
        ED = AB + (CD - AB)/2
</pre>
</p>
<p>
Therefore,
<pre>
        ED = (AB + CD)/2
</pre>
</p>
<p>
And so we can calculate AD as:
<pre>
        AD = sqrt(ED<sup>2</sup> + AE<sup>2</sup>) 
        AD = sqrt(((AB+CD)/2)<sup>2</sup> + AE<sup>2</sup>)
</pre>
</p>

</p>
<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=2893&amp;rd=5859" name="2893">Uptime</a></b>
</font>
<A href="Javascript:openProblemRating(2893)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A>
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505684" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

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
      39 / 251 (15.54%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      7 / 39 (17.95%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>ryanprichard</b> for 656.92 points (23 mins 15 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      531.60 (for 7 correct submissions)
    </td>
  </tr>
</table></blockquote>

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
      129 / 183 (70.49%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      63 / 129 (48.84%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>mlehenbauer</b> for 476.35 points (6 mins 23 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      304.99 (for 63 correct submissions)
    </td>
  </tr>
</table></blockquote>
<p>
<p>This problem was based on some real code I wrote for work.  As in many TopCoder problems, there are 
three steps to the solution:
<ol>
        <li>Parse the input</li>
        <li>Calculate (difference between "now" and "start")</li>
        <li>Format the output</li>
</ol>
</p>

<p>If you reuse your parsing method for both the starting and ending dates, this makes things easier.  I wrote a 
parser that calculates the number of seconds since the start of the given year.  First, it calculates the number 
of seconds in the months between January and the current month (taking leap years into acount), then the 
number of seconds between the first of the current month and the current time in hours, minutes, seconds.</p>
<pre>
    private static final int days[] =     {31, 28, 31, 30, 31, 30, 
                                           31, 31, 30, 31, 30, 31};
    private static final int leapDays[] = {31, 29, 31, 30, 31, 30, 
                                           31, 31, 30, 31, 30, 31};

    // returns seconds since midnight of Jan 1 of this year
    private int getOffset(String d)
    {
        // [1-31] [Jan-Dec] [1900-2199] at [1-12]:[00-59]:[00-59] [AM/PM]
        String pieces[] = d.split("[ :]");

        int year = Integer.parseInt(pieces[2]);
        // returns 0 for Jan, 1 for Feb, ... 11 for Dec
        int month = getMonthIndex(pieces[1]);

        int out = 0;
        // seconds between Jan 1 and first of this month
        for (int i = 0; i &lt; month; ++i) 
        {
            if (isLeap(year))
                out += leapDays[i] * 24*60*60;
            else
                out += days[i] * 24*60*60;
        }

        // based on number of days, seconds since beginning of month
        out += (Integer.parseInt(pieces[0])-1) * 24*60*60;

        // add hours, minutes, seconds
        int hh = Integer.parseInt(pieces[4]);
        out += hh*60*60;
        int mm = Integer.parseInt(pieces[5]);
        out += mm*60;
        int ss = Integer.parseInt(pieces[6]);
        out += ss;

        // add 12 hours for PM
        if ("PM".equals(pieces[7])) out += 12*60*60;

        return out;
    }
</pre>

<p>The difference between <b>start</b> and <b>now</b> is calculated as:
<ul>
        <li>the number of seconds between the start and ending years, </li>
        <li>minus the number of seconds between Jan 1 of the start year and the start time, </li>
        <li>plus the number of seconds between Jan 1 of the end year and the end time.  </li>
</ul>
You have to take into account leap years when calculating seconds between start and ending years as well.</p>

<p>After you calculate the number of seconds between the dates, formatting the output is straightforward and 
has probably been seen (and written) by many of you before:
<pre>
        String out = "";
        int days = seconds / (24*60*60);
        if (days > 0) out += days + "d ";       // note trailing space
        seconds -= days * 24*60*60;

        int hours = seconds / (60*60);
        if (hours > 0) out += hours + "h ";     // note trailing space
        seconds -= hours * 60*60;

        int minutes = seconds / 60;
        if (minutes > 0) out += minutes + "m "; // note trailing space
        seconds -= minutes * 60;

        if (seconds > 0) out += seconds + "s";
        return out.trim();      // remove possible trailing space
</pre>
</p>

<p>See <b>ryanprichard</b>'s solution for a clean implementation of this exact method.</p>

<p>To save time, some Java coders tried to use java.util.Date, or java.util.Calendar, only to get burned
by Daylight Savings Time.  If you calculate the time difference yourself, you can't go wrong.
Oddly, the C# Date class did work correctly; see <b>mlehenbauer</b>'s (short)solution as an example.</p>

</p>
<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=2859&amp;rd=5859" name="2859">Taxicab</a></b>
</font>
<A href="Javascript:openProblemRating(2859)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A>
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505684" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

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
      164 / 183 (89.62%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      68 / 164 (41.46%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>Kawigi</b> for 241.77 points (5 mins 16 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      186.30 (for 68 correct submissions)
    </td>
  </tr>
</table></blockquote>
<p>
<p>This problem turned out to be more difficult than your usual Division I 250.  I guess the real algorithm
used by the New York City Taxi &amp; Limosine Commission must be worth a lot of money!</p>

<p>The intended solution looks like this.  For each minute, calculate the speed.  If the speed is more than 6 miles per
hour (more than 2 blocks/minute), accumulate one 'unit' for each 1/5 of a mile travelled (this might include 
fractional units).  Otherwise, accumulate one unit for those 60 seconds.</p>

<p>The final calculation is: if there is one unit or less, charge $2.50.  Otherwise, charge $2.50 +
(number of units - 1)*0.40.</p>

<p>You needed to be careful when converting from blocks to "fifths of a mile" and from
blocks/minute to miles per hour.</p>

<p><b>Kawigi</b>, who also had the high score on this problem, wrote a straightforward implementation of this calculation.</p>

</p>
<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=2897&amp;rd=5859" name="2897">TCMinMin</a></b>
</font>
<A href="Javascript:openProblemRating(2897)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A>
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505684" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

Used as: Division One - Level Three: <blockquote><table cellspacing="2">
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
      1 / 183 (0.55%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      0 / 1 (0.00%)
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
<p>This problem wasn't all that difficult for a Div 1 hard, but it was long.  Coders evidently spent a 
disproportionate amount of time on the 250 and couldn't complete this problem.  Sadly, the lone solution (by
<b>ZorbaTHut</b>) failed.</p>

<p>You'll need to create a few lookup tables (really "symbol tables" in compiler parlance.)  For example:
<ul>
        <li>Defined functions and their return types</li>
        <li>Local variables for each function</li>
        <li>Parameters for each function</li>
</ul>
</p>

<p>To more easily store multiple pieces of information for each function or variable, I created two data structures:
<ul>
        <li><tt>Var</tt> - to represent a local variable or parameter, its name, and its type, if known.</li>
        <li><tt>Function</tt>, which extends <tt>Var</tt>.  This represents a function's name, and return type, and
                in addition, we store its index (the order that it was originally found in the program).  
                The name and return type are inherited from <tt>Var</tt>.</li>
</ul>
</p>

<p>Since the number of functions, variables and parameters is limited to 26 (due to the fact that they are all 
represented by single-lower case characters), these lookup tables can be implemented as arrays:
<ol>
        <li>One-dimensional array of functions. The index was the function name, minus 'a' (0-25).  Each entry is a 
                <tt>Function</tt> object. If the value at a requested index is null, the function was previously unknown.
                </li>
        <li>Two-dimensional array of local variables for each function.  The first index is the function name (0-25) 
                and the second index is the variable name (0-25); the values are <tt>Var</tt> objects.</li>
        <li>One-dimensional array of <i>number</i> of parameters to each function.  The index is based on the function name.</li>
        <li>Two-dimensional array of parameters to each function.  The first index is the function name (0-25) and the second 
                index is the <i>sequence</i> of the parameter in the function definition.  Entries in this array
                are <tt>Var</tt> objects, which store the name and type.</li>
</ol>
</p>

<p>A global variable, 'changed', is used to indicate that something was changed during this iteration.  This is 
only set to true if a previously unknown (or undiscovered) variable, parameter or function return type was just 
determined (or discovered.)  A 'while' loop will terminate only when this variable didn't change.  If nothing was changed, 
this must mean that the types of all functions, parameters and variables have been determined.
<pre>
   changed = true;
        do
        {
           changed = false;
                // calling this might set changed to true
           Parse program
        } while (changed)
</pre>
</p>

<p>To parse the program, each line is examined one at a time.  You can use a finite state machine 
(FSM) to do this, which takes an action depending on what state we're currently in:
<ul>
        <li><b>State 1</b> - Looking for function definition</li>
        <li><b>State 2</b> - Inside a function, parsing variables</li>
        <li><b>State 3</b> - Inside a function, processing statements</li>
</ul>
</p>

<p>To simplify the rest of the process, a 'lookup' method can be factored out, as well as a 'unify' method:
<pre>
   Var lookup(name)
      Look in current function's local variable table
      If not found, look in current function's parameter table for the variable
      (exactly one of the above must be true, based on the problem statement)
   
   Var unify(Var a, Var b)
      -- "Unifies" the types of a and b
      If type of a is known and type of b is not, 
           set type of b = type of a
           set the changed flag

      else If type of b is known and type of a is not, 
           set type of a = type of b
           set the changed flag
</pre>
</p>

<p>While in state 1, if the line starts with the string "function", a function declaration is being seen.  It is looked up 
in the <tt>Function</tt> lookup table.  If it doesn't exist yet, its sequence in the program is noted and a 
<tt>Function</tt> object is created and added to the function lookup table and the 'changed' flag is set.
Whether it was originally found or not, the 'current function' is set to this object.  The line is parsed to find
the parameter names (and their order) as well as any type information for each one.  (At this point, if it's 
not the first iteration, we cannot learn anything new from this line.)  The FSM transitions to state 2 and the 
next line is inspected.</p>

<p>To determine if we're in state 2, and not 3, the second letter in the current line is inspected.  If it is a 
colon, the line must be a local variable definition.  The name and type are added to the current function's 
information in the lookup table.  If this is new information, the changed flag is set.  Again, if this is not 
the first iteration, nothing new will be learned.  The FSM remains in state 2 and the next line is examined.</p>

<p>Otherwise, we're in state 3.  The line is parsed; afterwards, the FSM remains in state 3.  There are four types of 
statements to consider:
<ol>
        <li>Simple assignment (<b><tt>a=b</tt></b>) . In this case, the two variables are looked up for the current function, and 
        if either is of unknown type, they can be 'unified'.</li>
        <li>Expresson (<b><tt>a=b+c</tt></b>). In case of <tt>*</tt> or <tt>/</tt>, the three variables can all immediately be set to integer types.  
        Otherwise, the three variables' types can be 'unified' if at least one of their types is known.</li>
        <li>Constant assignment (<b><tt>a="b"</tt></b> or <b><tt>a=0</tt></b>).  The type of the variable is easily determined and updated
        in the lookup table.</li>
        <li>Function call (<b><tt>a=f(b)</tt></b>).  If <tt>a</tt> or the return type of <tt>f</tt> are known, the types can be 'unified'.  Furthermore, the types of each of the arguments can be 'unified' with the types of each of the parameters.</li>
</ol>
</p>

<p>While in states 2 or 3, if the line starts with the String "return", the return type of the current function can 
(possibly) be set.  If a variable is being returned, it can be 'unified' with the current <tt>Function</tt> object. 
(Since <tt>Function</tt>s extend <tt>Var</tt>s, they can be unified with variables.)  If it is set for the 
first time, the 'changed' flag is set (this is taken care of by the <tt>unify</tt> method.)  After the return is seen, we 
go back to state 1.</p>

<p>After the <tt>while</tt> loop terminates, we know the types of all the functions, parameters and variables.  All that 
is left is to generate the output.</p>

<p>During parsing, we kept track of the index of each function in the original input as well as the sequence of its 
parameters.  Therefore, we go through each function in order and generate its signature from each of its parameters and
its return type.  Then, for each defined variable in that function, output their names and types alphabetically, which is easy 
because the local parameter lookup table -- a two-dimensional array -- is already ordered by function name and variable name.</p>

</p>

<p>
<img src="/i/m/dplass_mug.gif" alt="" width="55" height="61" border="0" hspace="6" vspace="1" align="left" class="myStatsPhoto"/><br />
By&#160;<tc-webtag:handle coderId="251184" context="algorithm"/><br />
<span class="smallText"><em>TopCoder Member</em></span><br clear="all" />
</p>

</div>
</td>

<!-- Center Column Ends -->

<!-- Right Column Begins -->
         <td width="170">
            <jsp:include page="../public_right.jsp">
               <jsp:param name="level1" value="privatelabel"/>
            </jsp:include>
         </td>
<!-- Right Column Ends -->

<!-- Gutter -->
         <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<!-- Gutter Ends -->
    </tr>
</table>

<jsp:include page="../foot.jsp" />

</body>

</html>
