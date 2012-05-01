<%@  page language="java"  %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Statistics</title>

<jsp:include page="../../script.jsp" />
<jsp:include page="../../style.jsp">
  <jsp:param name="key" value="tc_stats"/>
</jsp:include>
<SCRIPT LANGUAGE="JavaScript" SRC="/js/print.js"></SCRIPT>
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
    <A href="/tc?module=Static&d1=hs&d2=match_editorials&d3=archive">Archive</A><br />
    <span id="printableLink"><A href="Javascript:makeInvisible();">Printable view</A><br /></span>
    <span id="navigableLink" class="invisible"><A href="Javascript:makeNavigable();">Normal view</A><br /></span>
    <A href="/tc?module=HSRoundOverview&rd=10803&snid=2&er=5">Match Overview</A><br />

<tc-webtag:forumLink forumID="516573" message="Discuss this match" /></div>
<span class="bodySubtitle">TCHS SRM 47</span><br />Tuesday, December 4, 2007
<br /><br />


<h2>Match summary</h2>
<p>
130 students participated the match, 22 of them newcomers. They faced a set of problems somewhat brute-force solvable and not so tricky. Finally 7 people successfully solved all problems.<br><br>
<tc-webtag:handle coderId="22658843" context="hs_algorithm"/> took the first place with a pretty high score in coding phase, thanks to his so fast 1000 solution. The second and third places were occupied by <tc-webtag:handle coderId="20036294" context="hs_algorithm"/> and <tc-webtag:handle coderId="11972352" context="hs_algorithm"/>, respectively. Challenge phase didn't play an important role in this match. They all took their places by scores in coding phase.
</p>

 

<H1>

The Problems

</H1>

</p>

<font size="+2">

<b><a href="/stat?c=problem_statement&amp;pm=8295&amp;rd=10803" name="8295">CardsShuffle</a></b>

</font>

<A href="Javascript:openProblemRating(8295)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A>

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=516573" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

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

      114 / 116 (98.28%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Success Rate</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      111 / 114 (97.37%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>High Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      <b>Zuza</b> for 249.07 points (1 mins 44 secs)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Average Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      214.30 (for 111 correct submissions)

    </td>

  </tr>

</table></blockquote>

<p>

This was a straightforward  problem. A simple string simulation will work. See <tc-webtag:handle coderId="22658843" context="hs_algorithm"/>'s clear simulation <a href="/tc?module=HSProblemSolution&cr=22658843&rd=10803&pm=8295">solution</a>.<br>
In fact, the specified cards shuffle is just a circular left shift for the first <b>last</b> cards and nothing changes by a successive <b>last</b> times shuffles. So we can get a more efficient solution like below (Java code).<br>
<pre>
public String shuffle(String cards,int first,int last,int times)
{
    for(int i=0;i&lt;(times%last);i++)
    {
        cards=cards.substring(first-1,end)+
              cards.substring(0,first-1)+cards.substring(last);
    }
    return cards;
}
</pre>
</p>

<font size="+2">

<b><a href="/stat?c=problem_statement&amp;pm=8402&amp;rd=10803" name="8402">GraphClique</a></b>

</font>

<A href="Javascript:openProblemRating(8402)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A>

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=516573" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

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

      70 / 116 (60.34%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Success Rate</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      57 / 70 (81.43%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>High Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      <b>LittlePig</b> for 493.82 points (3 mins 11 secs)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Average Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      364.23 (for 57 correct submissions)

    </td>

  </tr>

</table></blockquote>

<p>

The writer posted this problem with maximum number of vertices in graph 22, and it was lowered down to 18 in final test. So many pure brute-force solutions passed system test in the contest.<br>
Enumeration of all vertex subsets is necessary, so the tricky part is to check whether a subset is a clique. A O(N^2) inefficient brute-force check is  avoidable. A simple dynamic programming method is sufficient. Say checking a nonempty subset S, we pick an arbitrary vertex v from S, and check whether a edge exists between v and every one of all other vertices in S and the subset S-{v} is a clique by memorized states. This leads to a O(N) check and O(N*2^N) solution.<br>
Furthermore, using some bitwise tricky, it can be improved to O(2^N). Below is a Java solution.<br>
<pre>
public int[] allClique(String[] graph)
{
    final int n=graph.length;
    int res[]=new int[n];
    int edge[]=new int[1 &lt;&lt; n];
    boolean can[]=new boolean[1 &lt;&lt; n];
    int bcnt[]=new int[1 &lt;&lt; n];
    can[0]=true;bcnt[0]=0;
    for(int i=0;i &lt; n;i++)
    {
        int b=1 &lt;&lt; i;
        for(int j=0;j &lt; n;j++)
            if(graph[i].charAt(j)=='1')
                b^=(1 &lt;&lt; j);
        edge[1 &lt;&lt; i]=b;
    }
    for(int t=1;t &lt; (1 &lt;&lt; n);t++)
    {
        int low=(t^(t-1))&t;
        bcnt[t]=1+bcnt[t^low];
        can[t]=false;
        if(can[t^low]&&(edge[low]&t)==t)
        {
            can[t]=true;
            res[bcnt[t]-1]++;
        }
     }
     return res;
}
</pre>
Note that "low=(t^(t-1))&t" in the code is to get the lowest bit with 1 in t's binary representation.  
</p>

<font size="+2">

<b><a href="/stat?c=problem_statement&amp;pm=7833&amp;rd=10803" name="7833">RandomShuffle</a></b>

</font>

<A href="Javascript:openProblemRating(7833)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A>

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=516573" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

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

      13 / 116 (11.21%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Success Rate</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      7 / 13 (53.85%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>High Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      <b>donalexey</b> for 916.91 points (8 mins 42 secs)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Average Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      594.02 (for 7 correct submissions)

    </td>

  </tr>

</table></blockquote>

<p>
At the first glance, one can easily come up with a simple recursive solution like this(Java code).
<pre>
int solve(int[] cur,int pos)
{
    if(pos==cur.length)
    {
        for(int i=0;i &lt; cur.length;i++)
            if(cur[i]!=outputArray[i])
                return 0;
        return 1;
    }
    int res=0;
    for(int i=0;i &lt; cur.length;i++)
    {
        int tmp=cur[pos];
        cur[pos]=cur[i];
        cur[i]=tmp;
        res+=solve(cur,pos+1);
        tmp=cur[pos];
        cur[pos]=cur[i];
        cur[i]=tmp;
    }
    return res;
}
</pre>
But unfortunately, it will run out of time when the length of <b>outputArray</b> is 10. How to improve it?<br>
One observation is that it searches too many unnecessary states, because some states during search procedure have deviated the goal <b>outputArray</b> so much that it's impossible to yield the goal. So we can prune some search branches by some "heuristic". One of that is the number of mismatched positions, namely a number not lying in right position. Note that a swap operation can only put at most 2 numbers into right positions.<br>
 Say we encounter a state with m mismatched positions and w swaps remaining, if m>2*w, we needn't recursive down. This leads to a solution efficient enough to pass system test. Below is one of the problem testers <tc-webtag:handle coderId="10481120" context="algorithm"/>'s Java code.
<pre>
int N;
int cnt = 0;
int[] res, cur;
void solve(int pos, int cNeq) 
{
    if (cNeq &gt; 2 * (N - pos)) return;
    if (pos == N) 
    {
        cnt++;
        return;
    }
    solve(pos+1, cNeq);
    for (int i=0; i &lt; N; i++) if (i != pos) 
    {
        int was = cNeq;
        if (cur[pos] == res[pos]) cNeq++;
        if (cur[i] == res[i]) cNeq++;
        if (cur[pos] == res[i]) cNeq--;
        if (cur[i] == res[pos]) cNeq--;
        int tmp = cur[pos]; cur[pos] = cur[i]; cur[i] = tmp;
        solve(pos+1, cNeq);
        cNeq = was;
        tmp = cur[pos]; cur[pos] = cur[i]; cur[i] = tmp;
    }
}
public double probability(int[] outputArray) 
{
    N = outputArray.length;
    cur = new int[N];
    for (int i=0; i &lt; N; i++) cur[i] = i+1;
    res = outputArray;
    int cNeq = 0;
    for (int i=0; i &lt; N; i++) if (cur[i] != res[i]) cNeq++;
    solve(0, cNeq);
    double ret = cnt;
    for (int i=0; i &lt; N; i++) ret /= 1.0*N;
    return ret;
}
</pre>
Note that the calculation of heuristic in this solution is optimized.<br>
The writer's solution is somewhat complicated and uses a search technique called "meet in the middle".
It ensures a predictable running time. Interested reader can see writer's code in practice room.<br>
</p>
<p>&nbsp;</p>
 

<div class="authorPhoto">
    <img src="/i/m/nophoto.jpg" alt="Author" />
</div>
<div class="authorText">
    By&#160;<tc-webtag:handle coderId="15166995" context="algorithm"/><br />    <em>TopCoder Member</em>
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
