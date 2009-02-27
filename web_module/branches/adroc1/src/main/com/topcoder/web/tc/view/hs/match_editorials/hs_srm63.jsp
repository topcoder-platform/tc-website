<%@  page language="java"  %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Statistics: TCHS SRM 63 Problem Set &amp; Analysis</title>

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
    <a href="/tc?module=HSRoundOverview&rd=13532&snid=3&er=5">Match Overview</a><br />

<tc-webtag:forumLink forumID="524729" message="Discuss this match" /></div>
<span class="bodySubtitle">TCHS SRM 63</span><br />Tuesday, December 2, 2008
<br /><br />
<h2>Match summary</h2> 

<p> 

The last but one High School SRM in Season 3 attracted 96 competitors and

featured 3 problems of moderate difficulty. Despite the lack of significant

algorithm competitions experience (it was his only second HS match), <tc-webtag:handle coderId="22691397" context="hs_algorithm"/>

won the round with solid 1600.78 points. All his 3 submissions were very fast

with 600-pointer submission being the fastest overall. <tc-webtag:handle coderId="22686287" context="hs_algorithm"/> had very

close submission times to <tc-webtag:handle coderId="22691397" context="hs_algorithm"/> on easy and hard, but lost about 40 points

on medium problem. He won 25 points back during the challenge phase, but that

was not enough, so he placed second. <tc-webtag:handle coderId="21761885" context="hs_algorithm"/>, author of the fastest submission

on 900-pointer, took third place because of relatively slow 600-pointer and

lack of challenges. The rest of competitors were significantly behind the Top 3

(the difference between 3rd and 4th places is more than 100 points).

Still, many other participants showed very good perfomance with 23 people scoring

more than 1000.

</p>

 

<H1> 

The Problems 

</H1>

</p> 



<font size="+2"> 

<b><a href="/stat?c=problem_statement&amp;pm=10207&amp;rd=13532" name="10207">SimpleCardGame</a></b> 

</font> 

<A href="Javascript:openProblemRating(10207)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=524729" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

<br> 

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

      92 / 96 (95.83%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Success Rate</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      80 / 92 (86.96%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>High Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Tavo92</b> for 248.75 points (2 mins 1 secs) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Average Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      228.32 (for 80 correct submissions) 

    </td> 

  </tr> 

</table></blockquote> 

<p>

This problem asked to determine the winner in a round of Blackjack game. Since the round has actually ended and the points

are known for each player, getting the winner is not hard at all. The problem statement gives us 2 rules that must

be followed. Using them, one can come with the following algorithm to solve the problem:

</p>

<ol>

<li>Determine if there is at least one player with 21 or fewer points. If there are none, return -1 (there is no winner).</li>

<li>Find the maximum number of points M scored by players who has 21 or fewer points.</li>

<li>Find the number C of players who scored exactly M points. If C is greater than 1, return -1 (many winners).</li>

<li>Return the index of the only one player who scored M points.</li>

</ol>

<p>

Below is a Java implementation that follows exactly these 4 simple steps:

</p>

<pre>

public class SimpleCardGame {

  public int whoIsTheWinner(int[] points) {

<font color="gray">    // step 1</font>

    boolean have = false;

    for (int i=0; i &lt; points.length; i++)

      if (points[i] &lt;= 21)

        have = true;

    if (!have) return -1;



<font color="gray">    // step 2</font>

    int M = 0;

    for (int i=0; i &lt; points.length; i++)

      if (points[i] &lt;= 21 && points[i] > M)

        M = points[i];



<font color="gray">    // step 3</font>

    int C = 0;

      for (int i=0; i &lt; points.length; i++)

        if (points[i] == M)

          C++;

    if (C > 1) return -1;



<font color="gray">    // step 4</font>

    for (int i=0; i &lt; points.length; i++)

      if (points[i] == M)

        return i;



<font color="gray">    // this line is never executed</font>

    return -2;

  }

}

</pre>

<p>

Of course, the provided implementation is far from being short. Look at the fastest

<a href="http://www.topcoder.com/tc?module=HSProblemSolution&cr=22655751&rd=13532&pm=10207">submission</a> on this problem by

<tc-webtag:handle coderId="22655751" context="hs_algorithm"/> for an example of short and clean implementation.

</p>



<font size="+2"> 

<b><a href="/stat?c=problem_statement&amp;pm=10205&amp;rd=13532" name="10205">Telltale</a></b> 

</font> 

<A href="Javascript:openProblemRating(10205)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=524729" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

<br> 

Used as: Division One - Level Two: <blockquote><table cellspacing="2"> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Value</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      600 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Submission Rate</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      74 / 96 (77.08%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Success Rate</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      48 / 74 (64.86%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>High Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      <b>meret</b> for 577.30 points (5 mins 40 secs) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Average Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      398.62 (for 48 correct submissions) 

    </td> 

  </tr> 

</table></blockquote> 

<p>

Your friend wants to tell a cool sounding exaggerated variant of a story at many parties and at the same time

he doesn't want to be caught as a liar. To help him, we first assume that he tells the exaggerated variant

everywhere, and than exclude all situations when he can be caught as a liar. There are two kinds of such situations:

</p>

<ol>

<li>When somebody already knows the true variant of the story and hears the exaggerated variant at some party,

he can tell that your friend is a liar. So, for all parties where at least one such person is present, we exclude

these parties from those where the exaggerated variant can be told.</li>

<li>If somebody hears different variants of the story at different parties, he can also justify that your friend is a liar.

To prevent this, we iterate through all pairs of parties A and B. If there is at least one person that visits both

parties and we already know that true variant of the story must be told at party A, then party B must also

be excluded from those where the exaggerated variant can be told.</li>

</ol>

<p>

We've prevented both kinds of situations where the friend can be caught as a liar, so we're done, right? Actually, not.

When we applied step 2, we've possibly deduced that true variant of the story must be told instead of exaggerated one

at some parties. Therefore, it's possible that more people are now able to hear the true variant at some party,

and some of these people may be able to detect the lie at other parties. Consider an example <b>n</b>=4, <b>a</b>={0},

<b>parties</b>={"2 3", "0 1", "1 2"}. First, we deduce that the friend should tell the true variant at party 1, because person

0 is present there and she knows the true variant. Than, person 1 is present at both parties 1 and 2. Since he

tells the true variant at party 1, he must tell it at party 2 as well. But this is <i>not</i> enough to prevent the friend

from being detected. Now person 2 knows the true variant. She is present at parties 0 and 2, so she's able to catch the friend.

</p>

<p>

So, one application of step 2 is not enough to solve the problem. However, the fix is easy - we must apply this step several

times, until there are no more changes in the list of parties where the true variant of the story must be told.

Alternatively, we can repeat step 2 exactly m times, where m is the number of parties. Since at each repeat we deduce

that true variant of the story must be told at least at some party and the number of such deducements is bounded by

the number of parties, m repeats is always enough.

</p>

<p>

Java implementation of this approach is given below:

</p>

<pre>

public class Telltale {

  public int doNotTellTheTruth(int n, int[] a, String[] parties) {

    int m = parties.length;



<font color="gray">    // parse parties to determine which people attend each party</font>

    boolean[][] visit = new boolean[m][n];

    for (int i=0; i&lt;m; i++) {

      String[] toks = parties[i].split(" ");

      for (int j=0; j&lt;toks.length; j++)

        visit[i][Integer.parseInt(toks[j])-1] = true;

    }



<font color="gray">    // apply step 1</font>

    boolean[] tellTrue = new boolean[m];

    for (int i=0; i&lt;m; i++)

      for (int j=0; j&lt;n; j++)

        for (int k=0; k&lt;a.length; k++)

          if (a[k]-1==j && visit[i][j])

            tellTrue[i] = true;



<font color="gray">    // apply m times step 2</font>

    for (int x=0; x&lt;m; x++)

      for (int i=0; i&lt;m; i++)

        for (int j=0; j&lt;m; j++)

          for (int k=0; k&lt;n; k++)

            if (tellTrue[i] && visit[i][k] && visit[j][k])

              tellTrue[j] = true;



<font color="gray">    // calculate and return result</font>

    int res = 0;

    for (int i=0; i&lt;m; i++)

      if (!tellTrue[i]) res++;

    return res;

  }

}

</pre>

<p>

There is also an approach to this problem that uses graphs. We can build a graph where each vertex corresponds

to a party. Two parties that share at least one person are

connected by an edge, which means that at both parties we must tell the same variant of the story. In each

connected component of this graph the same variant of the story should be told. If at least

one party in a component

is visited by a person who already knows the true variant, we must tell the true variant, otherwise

the exaggerated one can be told everywhere in the component. To get the connected components,

<a href="http://www.topcoder.com/tc?module=Static&d1=tutorials&d2=graphsDataStrucs2">DFS or BFS traversal</a>

can be used.

</p>



<font size="+2"> 

<b><a href="/stat?c=problem_statement&amp;pm=10206&amp;rd=13532" name="10206">SoccerFan</a></b> 

</font> 

<A href="Javascript:openProblemRating(10206)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=524729" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

<br> 

Used as: Division One - Level Three: <blockquote><table cellspacing="2"> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Value</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      900 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Submission Rate</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      33 / 96 (34.38%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Success Rate</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      24 / 33 (72.73%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>High Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      <b>DaViDeX</b> for 781.73 points (11 mins 24 secs) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Average Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      567.09 (for 24 correct submissions) 

    </td> 

  </tr> 

</table></blockquote> 

<p>

This problem is mostly implementational, because getting the solution idea is not hard. Note that by changing the number of

goals scored by one team we can change match result to absolutely any other result (to get the victory of one team under

another, set the number of goals for this team to sufficiently large value; to get draw set one team's number of goals

equal to the number of goals scored by the other team). So the problem can be solved using the following pseudocode:

</p>

<pre>

If team <b>winner</b> is the winner according to <b>results</b>

  Return -2



For each match M (in increasing order of index)

  For each possible outcome O in {victory, draw, defeat}

    Let team T is the winner according to

      <b>results</b> where the outcome of match M is changed to O

    If T = <b>winner</b>

      Return the index of M



Return -1

</pre>

<p>

What's left is to transform this pseudocode into the code in real programming language. In Java it can be done as follows:

</p>

<pre>

import java.util.*;



public class SoccerFan {

<font color="gray">  // maps team name to integer team identifier</font>

  Map teams = new HashMap();



<font color="gray">  // PNT[i][j] is the number of points scored by i-th

  // team in case of outcome j out of {win, draw, defeat}</font>

  int[][] PNT = new int[][] {{3, 1, 0}, {0, 1, 3}};



<font color="gray">  // t1 - identifier of team1 in the i-th match

  // t2 - identifier of team2 in the i-th match

  // res - the outcome of the i-th match</font>

  int[] t1, t2, res;



<font color="gray">  // team identifier for <b>winner</b></font>

  int winId;



<font color="gray">  // returns the identifier for the given team

  // (if necessary, inserts the team into teams</font>

  int getId(String team) {

    if (teams.containsKey(team)) return teams.get(team);

    teams.put(team, teams.size());

    return teams.get(team);

  }



<font color="gray">  // checks if <b>winner</b> is the winner according to

  // the data in t1, t2 and res</font>

  boolean check() {

<font color="gray">    // calculate the number of points for each team</font>

    int[] pnt = new int[teams.size()];

    for (int i=0; i&lt;t1.length; i++) {

      pnt[t1[i]] += PNT[0][res[i]];

      pnt[t2[i]] += PNT[1][res[i]];

    }



<font color="gray">    // find if there's a team that scored

    // at least as much as team winId</font>

    for (int i=0; i&lt;teams.size(); i++)

      if (i != winId && pnt[i] &gt;= pnt[winId])

        return false;



    return true;

  }



  public int whereIsMistake(String[] results, String winner) {

<font color="gray">    // initialize t1, t2 and res</font>

    t1 = new int[results.length];

    t2 = new int[results.length];

    res = new int[results.length];



<font color="gray">    // parse <b>results</b> into t1, t2 and res</font>

    for (int i=0; i&lt;results.length; i++) {

      StringTokenizer st = new StringTokenizer(results[i], " :");

      t1[i] = getId(st.nextToken());

      t2[i] = getId(st.nextToken());

      int a = Integer.parseInt(st.nextToken());

      int b = Integer.parseInt(st.nextToken());

      if (a&gt;b) res[i] = 0;

      if (a==b) res[i] = 1;

      if (a&lt;b) res[i] = 2;

    }



<font color="gray">    // find the team identifier for <b>winner</b></font>

    winId = getId(winner);



<font color="gray">    // check if <b>winner</b> is the winner according to <b>results</b></font>

    if (check()) return -2;



<font color="gray">    // for each match</font>

    for (int i=0; i&lt;t1.length; i++) {

<font color="gray">      // remember the real outcome of the match</font>

      int was = res[i];

<font color="gray">      // for each possible outcome of the match</font>

      for (res[i]=0; res[i]&lt;3; res[i]++)

<font color="gray">        // check if it allows team <b>winner</b> to become the winner</font>

        if (check()) return i;

<font color="gray">      // restore the real outcome</font>

      res[i] = was;

    }



    return -1;

  }

}

</pre></p>

<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=8002&amp;rd=13531" name="8002">DecreasingNumbers</a></b> 
</font> 
<A href="Javascript:openProblemRating(8002)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=524575" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
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
      68 / 125 (54.40%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      42 / 68 (61.76%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>niyaznigmatul</b> for 988.30 points (3 mins 6 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      625.95 (for 42 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
<p>
<p>
First of all let's note that a one-to-one correpondance
between decreasing numbers and non-empty subsets of set of digits {0..9} exists. 
All digits in a decreasing number are different (so they form a subset) and exactly
one decreasing number can be formed from each subset (you need arrange elements of it
in a decreasing order). So there exists only 2^10 - 1 = 1023 decreasing numbers. They
can be easily generated. After it one need to sort them increasingly and return
the answer for the problem.
</p>
<p>
Java implementation of this approach can look as follows.
</p>
<p>
<pre>
public class DecreasingNumbers {
	ArrayList&lt;Long&gt; list; 
	void go(int pos, String s) {
		if (pos == -1) {
			if (s.length() > 0) {
				list.add(Long.parseLong(s));
			}
			return;
		}
		go(pos - 1, s + pos);
		go(pos - 1, s);
	}
	public long getNth(int n) {
		list = new ArrayList&lt;Long&gt;();
		go(9, "");
		Collections.sort(list);
		if (n >= list.size()) {
			return -1;
		}
		return list.get(n);
	}	
}
</pre>
</p>






<div class="authorPhoto">
    <img src="/i/m/ivan_metelsky_big.jpg" alt="Author" />
</div>
<div class="authorText">
    By&#160;<tc-webtag:handle coderId="10481120" context="algorithm" /><br />    <em>TopCoder Member</em>
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
