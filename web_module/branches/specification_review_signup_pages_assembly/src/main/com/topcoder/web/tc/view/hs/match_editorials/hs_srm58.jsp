<%@  page language="java"  %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Statistics: TCHS SRM 58 Problem Set &amp; Analysis</title>

<jsp:include page="../../script.jsp" />
<jsp:include page="../../style.jsp">
  <jsp:param name="key" value="tc_stats"/>
</jsp:include>
<script language="JavaScript" src="/js/print.js"></script>
</head>


<body>

<div id="onTop">
<jsp:include page="../../top.jsp" >
  <jsp:param name="level1" value=""/>
</jsp:include>
</div>


<table width="100%" border="0" cellpadding="0" cellspacing="0">
 <tr valign="top">
<!-- Left Column Begins-->
   <td width="180" id="onLeft">
      <jsp:include page="../../includes/global_left.jsp">
         <jsp:param name="node" value="hs_match_editorials"/>
      </jsp:include>
   </td>
<!-- Left Column Ends -->

<!-- Center Column Begins -->
<td class="statTableSpacer" width="100%" valign="top">
<div class="bodyText">
<jsp:include page="../../page_title.jsp" >
<jsp:param name="image" value="high_school"/>
<jsp:param name="title" value="Match Editorials"/>
</jsp:include>

<div class="linkBox">
    <a href="/tc?module=Static&amp;d1=hs&amp;d2=match_editorials&amp;d3=archive">Archive</a><br />
    <span id="printableLink"><a href="Javascript:makeInvisible();">Printable view</a><br /></span>
    <span id="navigableLink" class="invisible"><a href="Javascript:makeNavigable();">Normal view</a><br /></span>
    <a href="/tc?module=HSRoundOverview&amp;rd=13527&amp;snid=3&amp;er=5">Match Overview</a><br />

<tc-webtag:forumLink forumID="523672" message="Discuss this match" /></div>
<span class="bodySubtitle">TCHS SRM 58</span><br />Thursday, October 2, 2008
<br /><br />


<h2>Match summary</h2> 

<p> 
This time around, the contestants faced a 1000 point problem that required both some
thinking and a clever implementation. This combination turned out to be deadly, as
only four contestants submitted anything, and even those submissions failed. 
Successful challenges were scarce, thus what decided the match were the scores
on the medium problem.
</p>

<p>
<tc-webtag:handle coderId="22709180" context="hs_algorithm"/>, with the fastest
time on the medium, won the round, closely followed by
<tc-webtag:handle coderId="22687801" context="hs_algorithm"/>
and 
<tc-webtag:handle coderId="22654002" context="hs_algorithm"/>.
</p> 

<H1> 
The Problems 
</H1>
</p> 

<font size="+2"> 
<strong><a href="/stat?c=problem_statement&amp;pm=9914&amp;rd=13527" name="9914">DeckRearranging</a></strong> 
</font> 
<a href="Javascript:openProblemRating(9914)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></a> 
<a href="http://forums.topcoder.com/?module=ThreadList&amp;forumID=523672" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></a>
<br /> 
Used as: Division One - Level One: <blockquote><table cellspacing="2"> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Value</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      250 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Submission Rate</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      78 / 81 (96.30%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Success Rate</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      77 / 78 (98.72%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>High Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>wcao</strong> for 248.35 points (2 mins 19 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Average Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      212.14 (for 77 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 

<p>
Imagine that we are solving the task manually. We have the old deck of cards in front of us,
and a set of instructions how to insert them into the new deck.
</p>

<p>
Instead of keeping the new deck of cards as a stack, we can arrange them into a row, with
the top card on the left and the bottom one on the right. Now, whenever inserting a new
card, we count from the left until we find the right place where it should be inserted,
place the new card there, and shift the remaining cards one position to the right.
</p>

<p>
This exact approach is easily implemented using a simple array.
Note that the resulting algorithm is very similar to the simple sorting algorithm InsertSort.
Java code follows.
</p>

<pre>
  <font color="#298a52"><strong>public</strong></font> String rearrange(String deck, <font color="#298a52"><strong>int</strong></font>[] above) {
    <font color="#298a52"><strong>int</strong></font> N = above.length;
    <font color="#298a52"><strong>char</strong></font>[] newDeck = <font color="#a52829"><strong>new</strong></font> <font color="#298a52"><strong>char</strong></font>[N];
    <font color="#a52829"><strong>for</strong></font> (<font color="#298a52"><strong>int</strong></font> i=<font color="#ff00ff">0</font>; i&lt;N; i++) {
      <font color="#a52829"><strong>for</strong></font> (<font color="#298a52"><strong>int</strong></font> j=i; j&gt;above[i]; j--) newDeck[j]=newDeck[j-<font color="#ff00ff">1</font>];
      newDeck[above[i]]=deck.charAt(i);
    }
    String result = <font color="#ff00ff">&quot;&quot;</font>;
    <font color="#a52829"><strong>for</strong></font> (<font color="#298a52"><strong>int</strong></font> i=<font color="#ff00ff">0</font>; i&lt;N; i++) result += newDeck[i];
    <font color="#a52829"><strong>return</strong></font> result;
  }
</pre>

<p>
Exercise: Did you find this task too easy? Then find and implement a solution that is faster than
quadratic in the number of cards.
</p>

<font size="+2"> 
<strong><a href="/stat?c=problem_statement&amp;pm=9917&amp;rd=13527" name="9917">SolitaireSimulation</a></strong> 
</font> 
<a href="Javascript:openProblemRating(9917)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></a> 
<a href="http://forums.topcoder.com/?module=ThreadList&amp;forumID=523672" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></a>
<br /> 
Used as: Division One - Level Two: <blockquote><table cellspacing="2"> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Value</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      500 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Submission Rate</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      57 / 81 (70.37%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Success Rate</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      50 / 57 (87.72%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>High Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Kankuro</strong> for 481.32 points (5 mins 38 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Average Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      319.56 (for 50 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 

<p>
As the class name suggests, simulation was enough to solve this task.
</p>

<p>
Approach 1: Heavy artillery. Use a map to assign turn numbers to visited states. 
Whenever a state appears for the second time, thanks to the map we will find this
out. The difference in turn numbers of both occurrences is the length of the
period.
</p>

<pre>
  vector&lt;<font color="#298a52"><strong>int</strong></font>&gt; step(vector&lt;<font color="#298a52"><strong>int</strong></font>&gt; prev) {
    vector&lt;<font color="#298a52"><strong>int</strong></font>&gt; next(<font color="#ff00ff">1</font>, prev.size() );
    <font color="#a52829"><strong>for</strong></font> (<font color="#298a52"><strong>int</strong></font> i=<font color="#ff00ff">0</font>; i&lt;<font color="#298a52"><strong>int</strong></font>(prev.size()); i++) <font color="#a52829"><strong>if</strong></font> (prev[i]&gt;<font color="#ff00ff">1</font>) next.push_back( prev[i]-<font color="#ff00ff">1</font> );
    sort( next.begin(), next.end() );
    <font color="#a52829"><strong>return</strong></font> next;
  }

  <font color="#298a52"><strong>int</strong></font> periodLength(vector &lt;<font color="#298a52"><strong>int</strong></font>&gt; heaps) {
    map&lt; vector&lt;<font color="#298a52"><strong>int</strong></font>&gt;, <font color="#298a52"><strong>int</strong></font>&gt; visited;
    sort( heaps.begin(), heaps.end() );
    <font color="#298a52"><strong>int</strong></font> time = <font color="#ff00ff">0</font>;
    visited[ heaps ] = time++;
    <font color="#a52829"><strong>while</strong></font> (<font color="#ff00ff">1</font>) {
      heaps = step( heaps );
      <font color="#a52829"><strong>if</strong></font> (visited.count( heaps )) <font color="#a52829"><strong>return</strong></font> time - visited[ heaps ];
      visited[ heaps ] = time++;
    }
  }
</pre>

<p>
Approach 2: Use <a href="http://en.wikipedia.org/wiki/Cycle_detection#Tortoise_and_hare">Floyd's cycle finding algorithm</a>.
</p>

<pre>
  <font color="#298a52"><strong>public</strong></font> <font color="#298a52"><strong>int</strong></font> periodLength(<font color="#298a52"><strong>int</strong></font>[] heaps) {
    ArrayList&lt;Integer&gt; slow = <font color="#a52829"><strong>new</strong></font> ArrayList&lt;Integer&gt;();
    <font color="#a52829"><strong>for</strong></font> (<font color="#298a52"><strong>int</strong></font> i=<font color="#ff00ff">0</font>; i&lt;heaps.length; i++) slow.add(heaps[i]);
    Collections.sort(slow);
    ArrayList&lt;Integer&gt; fast = slow;

    <font color="#a52829"><strong>while</strong></font> (<font color="#ff00ff">true</font>) {
      slow = step(slow);
      fast = step(fast);
      fast = step(fast);
      <font color="#a52829"><strong>if</strong></font> (slow.equals(fast)) {
        <font color="#298a52"><strong>int</strong></font> period = <font color="#ff00ff">0</font>;
        <font color="#a52829"><strong>while</strong></font> (<font color="#ff00ff">true</font>) {
          slow = step(slow);
          period++;
          <font color="#a52829"><strong>if</strong></font> (slow.equals(fast)) <font color="#a52829"><strong>return</strong></font> period;
        }
      }
    }
  }
</pre>

<p>
Approach 3: Just store all visited states in an array, and for each new state traverse the entire array
and check whether it already occured. Thanks to how this game works, even such solutions would pass
with plenty of time left.
</p>

<p>
To see that the first two approaches work in time, it is enough to note that the states of the game
are simply <a href="http://www.research.att.com/~njas/sequences/A000041">integer partitions</a>
of the number of cards, which is at most 50. The number 50 has only 204,226 different partitions, 
so this is an upper bound on the number of states we have to visit until one repeats.
</p>

<p>
The fact that the third solution works in time is related to how the game behaves &ndash;
it tends to reach a roughly "triangular" state (such as "1,2,3,4") quickly.
The game is called <a href="http://en.wikipedia.org/wiki/Bulgarian_solitaire">Bulgarian solitaire</a>.
Follow the link for an overview of research related to this game.
</p>

<p>
Exercise: Find the absolutely worst test case, i. e., one that forces Approach 1 to visit as many
states as possible. How would you make sure your case really is the worst one?
(Hint: Find a way how to compute pre-period and period lengths for all states at the same time.)
</p>


<font size="+2"> 
<strong><a href="/stat?c=problem_statement&amp;pm=10057&amp;rd=13527" name="10057">Digsaw</a></strong> 
</font> 
<a href="Javascript:openProblemRating(10057)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></a> 
<a href="http://forums.topcoder.com/?module=ThreadList&amp;forumID=523672" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></a>
<br /> 
Used as: Division One - Level Three: <blockquote><table cellspacing="2"> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Value</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      1000 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Submission Rate</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      4 / 81 (4.94%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Success Rate</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      0 / 4 (0.00%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>High Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      No correct submissions 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Average Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      No correct submissions 
    </td> 
  </tr> 
</table></blockquote> 

<p>
This task turned out to be too difficult for everyone participating in this match, but some of
the submissions were very close to passing. The problem might seem intimidating at the first
glance, but if we find the right approach, it can be implemented in under 50 lines of code.
</p>

<p>
Observation 1: Whenever we decide to place a strip horizontally, we need to place other four strips 
horizontally as well, to get a 5 by 5 square. (There is no other way how to create a rectangle.)
</p>

<p>
Observation 2: There are just a few patterns how the strips can be arranged. For N=3 there is just one
(all vertically), for N=7 there are four patterns, for N=11 there are 11 and for N=15 there are 34 patterns
(one with 15 vertical strips, one with 15 horizontal, eleven with 5 horizontal, and twenty-one with 10
horizontal strips).
</p>

<p>
While there are just a few patterns, there are lots and lots of ways how to assign the individual strips
to their places in the pattern. Trying all of them is not doable within the time limit. Luckily, we don't have to.
</p>

<p>
We can approach the problem from the other side: Given a bitmap, can it be assembled from the strips
we have?
</p>

<p>
For the largest possible input, there are 9000 bitmaps to check (corresponding to numbers 1000 to 9999).
Each time we can process all valid patterns, cut the bitmap into strips, and then compare the obtained
set of strips with the one given in the input.
</p>

<p>
In the solution below, we encode each strip to an integer in the range 0 to 31, to avoid unnecessary
manipulations with strings. The function check() cuts the current bitmap into pieces, so that the
horizontal rows of strips start in columns a, b, and c, and then checks whether the obtained set
of pieces is good.
</p>

<pre>
  <font color="#298a52"><strong>static</strong></font> String[] digitBitmaps = {
    <font color="#ff00ff">&quot;XXX..XXXXXXXX.XXXXXXXXXXXXXXXX&quot;</font>,
    <font color="#ff00ff">&quot;X.X..X..X..XX.XX..X....XX.XX.X&quot;</font>,
    <font color="#ff00ff">&quot;X.X..XXXXXXXXXXXXXXXX..XXXXXXX&quot;</font>,
    <font color="#ff00ff">&quot;X.X..XX....X..X..XX.X..XX.X..X&quot;</font>,
    <font color="#ff00ff">&quot;XXX..XXXXXXX..XXXXXXX..XXXXXXX&quot;</font>
  };

  <font color="#298a52"><strong>int</strong></font> N, D;
  <font color="#298a52"><strong>int</strong></font>[] pcs;
  <font color="#298a52"><strong>int</strong></font>[][] bitmap;

  <font color="#298a52"><strong>void</strong></font> makeBitmap(<font color="#298a52"><strong>int</strong></font> num) {
    bitmap = <font color="#a52829"><strong>new</strong></font> <font color="#298a52"><strong>int</strong></font>[N][<font color="#ff00ff">5</font>];
    <font color="#a52829"><strong>for</strong></font> (<font color="#298a52"><strong>int</strong></font> i=<font color="#ff00ff">0</font>; i&lt;N; i++) Arrays.fill(bitmap[i],<font color="#ff00ff">0</font>);
    <font color="#298a52"><strong>int</strong></font>[] digits = <font color="#a52829"><strong>new</strong></font> <font color="#298a52"><strong>int</strong></font>[D]; <font color="#a52829"><strong>for</strong></font> (<font color="#298a52"><strong>int</strong></font> i=<font color="#ff00ff">0</font>; i&lt;D; i++) { digits[D-<font color="#ff00ff">1</font>-i]=num%<font color="#ff00ff">10</font>; num/=<font color="#ff00ff">10</font>; }
    <font color="#a52829"><strong>for</strong></font> (<font color="#298a52"><strong>int</strong></font> i=<font color="#ff00ff">0</font>; i&lt;D; i++) <font color="#a52829"><strong>for</strong></font> (<font color="#298a52"><strong>int</strong></font> j=<font color="#ff00ff">0</font>; j&lt;<font color="#ff00ff">5</font>; j++) <font color="#a52829"><strong>for</strong></font> (<font color="#298a52"><strong>int</strong></font> k=<font color="#ff00ff">0</font>; k&lt;<font color="#ff00ff">3</font>; k++) 
      bitmap[<font color="#ff00ff">4</font>*i+k][j] = digitBitmaps[j].charAt(<font color="#ff00ff">3</font>*digits[i]+k)==<font color="#ff00ff">'X'</font> ? <font color="#ff00ff">1</font> : <font color="#ff00ff">0</font>;
  }

  <font color="#298a52"><strong>int</strong></font> getPiece(<font color="#298a52"><strong>int</strong></font> x0, <font color="#298a52"><strong>int</strong></font> y0, <font color="#298a52"><strong>int</strong></font> dx, <font color="#298a52"><strong>int</strong></font> dy) {
    <font color="#298a52"><strong>int</strong></font> a=<font color="#ff00ff">0</font>; <font color="#a52829"><strong>for</strong></font> (<font color="#298a52"><strong>int</strong></font> i=<font color="#ff00ff">0</font>; i&lt;<font color="#ff00ff">5</font>; i++) { a*=<font color="#ff00ff">2</font>; a+=bitmap[x0+i*dx][y0+i*dy]; }
    <font color="#298a52"><strong>int</strong></font> b=<font color="#ff00ff">0</font>; <font color="#a52829"><strong>for</strong></font> (<font color="#298a52"><strong>int</strong></font> i=<font color="#ff00ff">4</font>; i&gt;=<font color="#ff00ff">0</font>; i--) { b*=<font color="#ff00ff">2</font>; b+=bitmap[x0+i*dx][y0+i*dy]; }
    <font color="#a52829"><strong>return</strong></font> Math.min(a,b);
  }

  <font color="#298a52"><strong>int</strong></font> toNumber(String S) {
    <font color="#298a52"><strong>int</strong></font> a=<font color="#ff00ff">0</font>; <font color="#a52829"><strong>for</strong></font> (<font color="#298a52"><strong>int</strong></font> i=<font color="#ff00ff">0</font>; i&lt;<font color="#ff00ff">5</font>; i++) { a*=<font color="#ff00ff">2</font>; <font color="#a52829"><strong>if</strong></font> (S.charAt(i)==<font color="#ff00ff">'X'</font>) a++; }
    <font color="#298a52"><strong>int</strong></font> b=<font color="#ff00ff">0</font>; <font color="#a52829"><strong>for</strong></font> (<font color="#298a52"><strong>int</strong></font> i=<font color="#ff00ff">4</font>; i&gt;=<font color="#ff00ff">0</font>; i--) { b*=<font color="#ff00ff">2</font>; <font color="#a52829"><strong>if</strong></font> (S.charAt(i)==<font color="#ff00ff">'X'</font>) b++; }
    <font color="#a52829"><strong>return</strong></font> Math.min(a,b);
  }

  <font color="#298a52"><strong>boolean</strong></font> check(<font color="#298a52"><strong>int</strong></font> a, <font color="#298a52"><strong>int</strong></font> b, <font color="#298a52"><strong>int</strong></font> c) {
     <font color="#298a52"><strong>boolean</strong></font>[] taken = <font color="#a52829"><strong>new</strong></font> <font color="#298a52"><strong>boolean</strong></font>[N]; Arrays.fill(taken,<font color="#ff00ff">false</font>);
     <font color="#298a52"><strong>int</strong></font>[] required = <font color="#a52829"><strong>new</strong></font> <font color="#298a52"><strong>int</strong></font>[N];
     <font color="#298a52"><strong>int</strong></font> x = <font color="#ff00ff">0</font>;
     <font color="#a52829"><strong>if</strong></font> (a+<font color="#ff00ff">5</font>&lt;=N) <font color="#a52829"><strong>for</strong></font> (<font color="#298a52"><strong>int</strong></font> i=<font color="#ff00ff">0</font>; i&lt;<font color="#ff00ff">5</font>; i++) { taken[a+i]=<font color="#ff00ff">true</font>; required[x++]=getPiece(a,i,<font color="#ff00ff">1</font>,<font color="#ff00ff">0</font>); }
     <font color="#a52829"><strong>if</strong></font> (b+<font color="#ff00ff">5</font>&lt;=N) <font color="#a52829"><strong>for</strong></font> (<font color="#298a52"><strong>int</strong></font> i=<font color="#ff00ff">0</font>; i&lt;<font color="#ff00ff">5</font>; i++) { taken[b+i]=<font color="#ff00ff">true</font>; required[x++]=getPiece(b,i,<font color="#ff00ff">1</font>,<font color="#ff00ff">0</font>); }
     <font color="#a52829"><strong>if</strong></font> (c+<font color="#ff00ff">5</font>&lt;=N) <font color="#a52829"><strong>for</strong></font> (<font color="#298a52"><strong>int</strong></font> i=<font color="#ff00ff">0</font>; i&lt;<font color="#ff00ff">5</font>; i++) { taken[c+i]=<font color="#ff00ff">true</font>; required[x++]=getPiece(c,i,<font color="#ff00ff">1</font>,<font color="#ff00ff">0</font>); }
     <font color="#a52829"><strong>for</strong></font> (<font color="#298a52"><strong>int</strong></font> i=<font color="#ff00ff">0</font>; i&lt;N; i++) <font color="#a52829"><strong>if</strong></font> (!taken[i]) required[x++]=getPiece(i,<font color="#ff00ff">0</font>,<font color="#ff00ff">0</font>,<font color="#ff00ff">1</font>);
     Arrays.sort(required);
     <font color="#a52829"><strong>for</strong></font> (<font color="#298a52"><strong>int</strong></font> i=<font color="#ff00ff">0</font>; i&lt;N; i++) <font color="#a52829"><strong>if</strong></font> (pcs[i]!=required[i]) <font color="#a52829"><strong>return</strong></font> <font color="#ff00ff">false</font>;
     <font color="#a52829"><strong>return</strong></font> <font color="#ff00ff">true</font>;
  }

  <font color="#298a52"><strong>public</strong></font> <font color="#298a52"><strong>int</strong></font> largestNumber(String[] pieces) {
    N = pieces.length; D = (N+<font color="#ff00ff">1</font>)/<font color="#ff00ff">4</font>;
    pcs = <font color="#a52829"><strong>new</strong></font> <font color="#298a52"><strong>int</strong></font>[N]; <font color="#a52829"><strong>for</strong></font> (<font color="#298a52"><strong>int</strong></font> i=<font color="#ff00ff">0</font>; i&lt;N; i++) pcs[i]=toNumber(pieces[i]); Arrays.sort(pcs);

    <font color="#298a52"><strong>int</strong></font> lo, hi=<font color="#ff00ff">1</font>;
    <font color="#a52829"><strong>for</strong></font> (<font color="#298a52"><strong>int</strong></font> i=<font color="#ff00ff">0</font>; i&lt;D; i++) hi*=<font color="#ff00ff">10</font>; lo=hi/<font color="#ff00ff">10</font>; hi--; <font color="#a52829"><strong>if</strong></font> (D==<font color="#ff00ff">1</font>) lo--;
    <font color="#a52829"><strong>for</strong></font> (<font color="#298a52"><strong>int</strong></font> num=hi; num&gt;=lo; num--) {
      makeBitmap(num);
      <font color="#a52829"><strong>if</strong></font> (check(N,N,N)) <font color="#a52829"><strong>return</strong></font> num;
      <font color="#a52829"><strong>if</strong></font> (D&gt;=<font color="#ff00ff">2</font>) <font color="#a52829"><strong>for</strong></font> (<font color="#298a52"><strong>int</strong></font> a=<font color="#ff00ff">0</font>; a+<font color="#ff00ff">5</font>&lt;=N; a++) <font color="#a52829"><strong>if</strong></font> (check(a,N,N)) <font color="#a52829"><strong>return</strong></font> num;
      <font color="#a52829"><strong>if</strong></font> (D&gt;=<font color="#ff00ff">3</font>) <font color="#a52829"><strong>for</strong></font> (<font color="#298a52"><strong>int</strong></font> a=<font color="#ff00ff">0</font>; a+<font color="#ff00ff">5</font>&lt;=N; a++) <font color="#a52829"><strong>for</strong></font> (<font color="#298a52"><strong>int</strong></font> b=a+<font color="#ff00ff">5</font>; b+<font color="#ff00ff">5</font>&lt;=N; b++) <font color="#a52829"><strong>if</strong></font> (check(a,b,N)) <font color="#a52829"><strong>return</strong></font> num;
      <font color="#a52829"><strong>if</strong></font> (D==<font color="#ff00ff">4</font>) <font color="#a52829"><strong>if</strong></font> (check(<font color="#ff00ff">0</font>,<font color="#ff00ff">5</font>,<font color="#ff00ff">10</font>)) <font color="#a52829"><strong>return</strong></font> num;
    }
    <font color="#a52829"><strong>return</strong></font> -<font color="#ff00ff">1</font>;
  }
</pre>

<p>
Exercise: By hand, construct a valid input for which we can assemble at least 16 different bitmaps.
Once you implemented the solution, find out the input for which this count is maximized.
</p>

<br />


<div class="authorPhoto">
    <img src="/i/m/misof_big.jpg" alt="Author" />
</div>
<div class="authorText">
    By&#160;<tc-webtag:handle coderId="8357090" context="algorithm" /><br />    <em>TopCoder Member</em>
</div>
</div>
</td>
<!-- Center Column Ends -->

<!-- Right Column Begins -->
   <td width="170" id="onRight">
  <jsp:include page="../../public_right.jsp">
   <jsp:param name="level1" value="tchs"/>
  </jsp:include>
   </td>
<!-- Right Column Ends -->

<!-- Gutter -->
   <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<!-- Gutter Ends -->
  </tr>
</table>

<div id="onBottom">
<jsp:include page="../../foot.jsp" />
</div>


</body>

</html>
