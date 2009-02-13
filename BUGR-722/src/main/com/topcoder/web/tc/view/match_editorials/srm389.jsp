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
    <A href="/stat?c=round_overview&er=5&rd=11123">Match Overview</A><br />
    <tc-webtag:forumLink forumID="519159" message="Discuss this match" />
</div>
<span class="bodySubtitle">SRM 389</span><br />Thursday, January 24, 2008
<br /><br />



<h2>Match summary</h2> 

<p> 
SRM 389 was a relatively easy problem set compared to recent matches.
The solution to all of the problems could be coded quite quickly once
you figured out the correct algorithm to use, and the constraints were
not large enough to present much difficulty.
As a result, 90 out of 552 Division One coders completed the hard problem.
After the coding phase,
<tc-webtag:handle coderId="8355516" context="algorithm"/>
had the high score with almost 1600 points,
completing all 3 problems in a total of 24 minutes.
However, his 2 successful challenges weren't enough to stop
<tc-webtag:handle coderId="10574855" context="algorithm"/>,
who overtook him with 125 points in the challenge round.
<tc-webtag:handle coderId="20315020" context="algorithm"/>
finished in third place, with
<tc-webtag:handle coderId="7442498" context="algorithm"/>
and
<tc-webtag:handle coderId="20916346" context="algorithm"/>
close behind.
</p> 

<p> 
In Division Two,
<tc-webtag:handle coderId="22710782" context="algorithm"/>
claimed a decisive win in his first SRM,
and will be competing in Division One in his next match.
Coders 
<tc-webtag:handle coderId="21464956" context="algorithm"/>
and
<tc-webtag:handle coderId="22707255" context="algorithm"/>
rounded out the top three.
</p> 

 

<H1> 

The Problems 

</H1>


<font size="+2"> 

<b><a href="/stat?c=problem_statement&amp;pm=8559&amp;rd=11123" name="8559">BoxesOfBooks</a></b> 

</font> 

<A href="Javascript:openProblemRating(8559)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=519159" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

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

      623 / 666 (93.54%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Success Rate</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      539 / 623 (86.52%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>High Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      <b>samsam</b> for 248.94 points (1 mins 51 secs) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Average Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      214.15 (for 539 correct submissions) 

    </td> 

  </tr> 

</table></blockquote> 

<p>
To solve this problem, you simply loop over all of the books and keep track
of the weight of the box you are currently filling.
If adding the next book would not exceed the weight limit, you add its
weight to the total for that box and move on to the next book.
On the other hand, if it would exceed the weight limit, you count this box,
reset the current weight to the weight of the next book, and continue.
Once you are done, don't forget to count the current box even if it is
not full.
Also, you must be careful to return 0 if there are no books.
</p>

<pre>
    public int boxes(int[] weights, int maxWeight) {
        if (weights.length == 0) return 0;
        int boxes = 0; // number of boxes
        int curr = 0;  // weight of current box
        for (int i=0; i&lt;weights.length; i++) {
            if (curr+weights[i] &gt; maxWeight) {
                boxes++;
                curr=0;
            }
            curr += weights[i];
        }
        boxes++; // last partially-filled box
        return boxes;
    }
</pre>

<p>
545 out of 672 Division Two coders solved this problem correctly.
As an interesting exercise, what if you noticed that someone's solution
processed the books in the opposite direction, from the bottom of the stack
to the top?
Can you come up with an input that would cause their program to return
the wrong result?
</p>

<font size="+2"> 

<b><a href="/stat?c=problem_statement&amp;pm=6125&amp;rd=11123" name="6125">ApproximateDivision</a></b> 

</font> 

<A href="Javascript:openProblemRating(6125)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=519159" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

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

      520 / 666 (78.08%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Success Rate</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      368 / 520 (70.77%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>High Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Gumx</b> for 491.41 points (3 mins 46 secs) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Average Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      369.04 (for 368 correct submissions) 

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

      544 / 552 (98.55%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Success Rate</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      479 / 544 (88.05%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>High Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      <b>ltdtl</b> for 247.42 points (2 mins 54 secs) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Average Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      222.50 (for 479 correct submissions) 

    </td> 

  </tr> 

</table></blockquote> 

<p>
The problem statement gave the following identity:
</p>

<pre>
     1      1      c^0     c^1     c^2
    --- = ----- = ----- + ----- + ----- + ...
     b     t-c     t^1     t^2     t^3
</pre>

<p>
From here, you must do three things:
</p>

<ol>
<li>compute t</li>
<li>compute c</li>
<li>evaluate the sum</li>
</ol>

<p>
The problem statement tells you exactly what value to use for t:
the smallest power of 2 greater than or equal to b.
Starting with the lowest power of 2 (which is 1),
continue multiplying it by 2 until it is greater than or equal to b:
</p>

<pre>
    int t = 1;
    while (t &lt; b) t *= 2;
</pre>

<p>
Next, you must compute c.
The formula tells you that b=t-c, therefore c=t-b.
</p>

<pre>
    int c = t - b;
</pre>

<p>
Finally, we must compute the first <b>terms</b> terms of the sum.
The first term is 1/t, and to compute each additional term,
you multiply the previous term by c/t.
</p>

<pre>
    double total = 0;
    double curr = 1.0 / t;
    for (int i=0; i&lt;terms; i++) {
        total += curr;
        curr = curr * (double(c) / double(t));
    } 
    return total * a;
</pre>



<font size="+2"> 

<b><a href="/stat?c=problem_statement&amp;pm=8545&amp;rd=11123" name="8545">GuitarChords</a></b> 

</font> 

<A href="Javascript:openProblemRating(8545)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=519159" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

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

      58 / 666 (8.71%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Success Rate</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      15 / 58 (25.86%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>High Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Gumx</b> for 761.39 points (17 mins 3 secs) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Average Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      457.51 (for 15 correct submissions) 

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

      390 / 552 (70.65%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Success Rate</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      270 / 390 (69.23%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>High Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Petr</b> for 433.46 points (11 mins 29 secs) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Average Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      276.08 (for 270 correct submissions) 

    </td> 

  </tr> 

</table></blockquote> 

<p>
You can easily show yourself that the result will never be 13 or greater,
as this would mean that your fingers are at least 12 frets apart.
If they were,
you could move your finger on the higher fret down 12 frets and it will still
play the same note.
Given this fact, you can show that you never need to use the 24th or higher
fret, for if you were, you could move <i>every</i> note down 12 frets.
</p>

<p>
Now, knowing that on each string you only have to consider the first 24 notes
it can sound, you can compute how many total possible chords there are.
With a maximum of 6 notes in the chord, and each note playable in 2 positions
on a given string, there are 12 chord notes on each string, and therefore
12^6 possible chords.
</p>

<p>
A efficient search can check all of the possible chords,
make sure all notes are sounded at least once, and remember the lowest
difficulty value seen.
</p>

<p>
The problem statement gives an example with a difficulty of 4, however
higher difficulties are possible.
Can you construct an input that results in a higher difficulty value?
What is the highest difficulty value possible?  (Hint: it's greater than 7.)
</p>

<font size="+2"> 

<b><a href="/stat?c=problem_statement&amp;pm=8543&amp;rd=11123" name="8543">LittleSquares</a></b> 

</font> 

<A href="Javascript:openProblemRating(8543)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=519159" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

<br> 

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

      146 / 552 (26.45%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Success Rate</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      90 / 146 (61.64%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>High Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Eryx</b> for 943.79 points (7 mins 0 secs) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Average Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      690.85 (for 90 correct submissions) 

    </td> 

  </tr> 

</table></blockquote> 

<p>
Last month in SRM 384,
<tc-webtag:handle coderId="13396848" context="algorithm"/>
gave us a refresher on using Grundy numbers to solve games that consist of
several smaller independent games.
This problem was a reward and further practice for those who read and
studied this powerful yet quite simple technique.
If you had trouble with this problem, you should definitely read his
editorial entitled 
<a href="/tc?module=Static&d1=tutorials&d2=algorithmGames">Algorithm Games</a>.
</p>

<p>
The first step is to decompose the game into a set of smaller games.
In this problem, the key is the constraint that says that the top half of
each 2x2 block must be in an even-numbered row.
This means that we can separate a NxM board into M/2 Nx2 boards.
Each of those Nx2 boards is independent -- every block drawn will be in exactly
one of those pieces.
</p>

<p>
The next step is to compute the Grundy number for each state in a
single Nx2 board.
With a maximum N of 10, there are only 2^20 possible states.
To compute a Grundy number, you consider all the states that you can move to
(by considering all the places that you can draw a block), and find the
smallest Grundy number not represented.
This is a perfect task for dynamic programming.
</p>

<p>
Finally, once you have analyzed all possible states, you compute the
logical XOR of the Grundy numbers of the initial states of each of the
Nx2 boards.
If this XOR is 0 the second player can win the game,
otherwise the first player has a winning move.
</p>

<p>
See the forum for this SRM for some particularly short solutions to this
problem.
</p>



<br /><br />


<div class="authorPhoto">
    <img src="/i/m/legakis_big.jpg" alt="Author" />
</div>
<div class="authorText">
    By&#160;<tc-webtag:handle coderId="287269" context="algorithm"/><br />
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
