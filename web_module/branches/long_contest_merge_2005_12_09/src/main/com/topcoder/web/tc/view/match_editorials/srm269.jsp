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
<tc-webtag:forumLink forumID="505782" message="Discuss this match" /></div>
<span class="bodySubtitle">SRM 269</span><br>Wednesday, October 26, 2005
<br><br>

<span class="bigTitle">Match summary</span>

<p>
In Division 1, <b>ploh</b> took the first prize followed by the close triplet 
<b>jvpardon</b>, <b>Egor</b> and <b>radeye</b>. <b>Ruberik</b>, who was a leader 
for a long time, had to resubmit the 1000th problem because of a silly mistake and 
lost more than 500 points. <b>Gluk</b> became yellow by taking the 14th place.

</p>
<p>
In Division 2, <b>cep</b> was the first, followed by <b>lishengren</b> and <b>HoldMeDown</b>.
</p>
</p>
 
<H1> 
The Problems 
</H1>

</p> 
<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=4830&amp;rd=8002" name="4830">AccessChanger</a></b> 
</font> 
<A href="Javascript:openProblemRating(4830)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A>
<A HREF="http://<%=ApplicationServer.FORUMS_SERVER_NAME%>/?module=ThreadList&forumID=505782"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br>
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
      238 / 259 (91.89%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      149 / 238 (62.61%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>HoldMeDown</b> for 244.08 points (4 mins 26 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      193.73 (for 149 correct submissions) 
    </td> 
  </tr> 

</table></blockquote> 
<p>
<p>
Each line of the <b>program</b> can be processed separately.
For each line we can find the part of the line which is a comment by searching for "//" string. 
After that we can remove the comment, make the required replacement and get the comment back.
Here is a sample Java code.
</p>
<pre>
    for (int i = 0; i &lt program.length; i++) {
        int ps = program[i].indexOf("//");
        if (ps &lt 0)
            ps = program[i].length() ;
        program[i] = program[i].substring(0, ps).replaceAll("->",".") + 
			program[i].substring(ps);
    }
</pre>
</p>

<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=4717&amp;rd=8002" name="4717">PatternOptimizer</a></b> 
</font> 
<A href="Javascript:openProblemRating(4717)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A>
<A HREF="http://<%=ApplicationServer.FORUMS_SERVER_NAME%>/?module=ThreadList&forumID=505782"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br>
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
      188 / 259 (72.59%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      138 / 188 (73.40%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>lishengren</b> for 486.14 points (4 mins 49 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      360.83 (for 138 correct submissions) 
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
      214 / 220 (97.27%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      200 / 214 (93.46%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>tomek</b> for 247.25 points (3 mins 0 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      218.17 (for 200 correct submissions) 
    </td> 
  </tr> 

</table></blockquote> 
<p>
<p>
After a short thought we are realizing that all we need to solve the problem is 
to replace each substring consisting of only '?' and '*' characters that contains at least one '*' 
by the string with '*' followed by the same amount of '?' as was in the 
original substring.
</p>
<p>
This operation can be done manually or by iterative replacing "?*" with "*?" and "**" with "*".
Here is a sample Java code.
</p>
<pre>
    while (pattern.contains("?*") || pattern.contains("**")) {
        pattern = pattern.replaceAll("\\?\\*", "*?");
        pattern = pattern.replaceAll("\\*\\*", "*");
    }
</pre>
</p>
<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=4831&amp;rd=8002" name="4831">RegimentArming</a></b> 
</font> 

<A href="Javascript:openProblemRating(4831)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A>
<A HREF="http://<%=ApplicationServer.FORUMS_SERVER_NAME%>/?module=ThreadList&forumID=505782"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br>
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
      102 / 259 (39.38%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      47 / 102 (46.08%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>cep21</b> for 894.03 points (10 mins 1 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      589.77 (for 47 correct submissions) 
    </td> 
  </tr> 

</table></blockquote> 
<p>
<p>
Let get the first N guns and then go forward. 
Each time we will take one more gun to the right and return the leftmost gun. 
How did the sum of gun power change? Each time it is changed by the same constant until the new gun 
type is taken or returned. Therefore, the maximal sum of gun power will be such interval of the guns
that either starts with the new gun type or ends with it. 
So, we can try all positions where type of the gun changes and get one with the maximal result. 
You can use the <b>cep21</b>'s solution as an example.
</p>
</p>
<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=4650&amp;rd=8002" name="4650">SecurityBunker</a></b> 
</font> 
<A href="Javascript:openProblemRating(4650)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A>
<A HREF="http://<%=ApplicationServer.FORUMS_SERVER_NAME%>/?module=ThreadList&forumID=505782"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br>
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
      146 / 220 (66.36%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      63 / 146 (43.15%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>tmyklebu</b> for 452.50 points (9 mins 24 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      277.05 (for 63 correct submissions) 
    </td> 
  </tr> 

</table></blockquote> 
<p>
<p>Let build the weighted graph where vertices are bombs and secret objects.
This graph will have edges from any one bomb to all others bombs and to all secret objects.
Weight of any edge is a distance between vertices in terms of the problem.</p>

<p>All secret objects in the bunker can be destroyed by the explosion of any one bomb if and only if
there is such a path between each pair of a bomb and a secret object that the weight of any edge  
in this path is not greater than D. We can find the minimum edge in the path for all pairs
of vertices using 
<a href="http://www.topcoder.com/tc?module=Static&d1=tutorials&d2=graphsDataStrucs3">Floyd-Warshall algorithm</a>. 
You can use the <b>ante</b>'s submit as a sample of this solution.
</p>

<p>
Some coders wrote solutions which are based on the 
<a href="http://en.wikipedia.org/wiki/Prim's_algorithm">Prim algorithm</a>. These solutions are also correct. 
</p>

</p>
<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=4620&amp;rd=8002" name="4620">PieSharing</a></b> 
</font> 
<A href="Javascript:openProblemRating(4620)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A>
<A HREF="http://<%=ApplicationServer.FORUMS_SERVER_NAME%>/?module=ThreadList&forumID=505782"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br>
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
      87 / 220 (39.55%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      24 / 87 (27.59%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>tomek</b> for 911.96 points (9 mins 0 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      626.06 (for 24 correct submissions) 
    </td> 
  </tr> 

</table></blockquote> 
<p>
<p>
Take the N pieces with the maximal total size so that no two of them are adjoined. 
Okey, we have an answer.
</p>

<p>
Let prove that if we have the described set of N pieces we can always choose the order in which
we can eat all of them. Because Ted will eat much more pieces than you, you can always find two 
successive Ted's pieces and eat your nearest piece. In this case, the remaining pieces will 
satisfy the requirement that no your adjoined pieces exists and we can repeat the eating.
</p>

<p>
Now, let's find how to take the N pieces with the maximal total size so that no two of them are adjoined. 
This can be done using the dynamic programming. To remove the circular nature of the pie we will 
solve the problem twice - for the taken first piece and for the case when we don't take it. In the first case 
we can't take the second and the last pieces.
Let A[<b>ps</b>, <b>cnt</b>] be a maximal total size that can be taken by <b>cnt</b> pieces 
starting from the position <b>ps</b>. The A array can be calculated using the recursive formula 

</p>
<pre>
    A[<b>ps</b>, <b>cnt</b>] = max (
    	A[<b>ps</b>+2, <b>cnt</b>-1] + <b>pieces</b>[<b>ps</b>], //get the piece in the position <b>ps</b>

    	A[<b>ps</b>+1, <b>cnt</b>] // do not get it
    )
</pre>
<p>
Here is the sample Java code.
</p>
<pre>
public class PieSharing {
    int[] pieces;
    int n,m;

    int data[][];

    public int share(int[] pieces) {
        this.pieces = pieces;
        n = pieces.length;
        m = n/3;
        data = new int[n+2][m+1];
        for(int[] line : data ) {
            Arrays.fill(line, -1);
        }
        int ans1 = get(1, m);
        n--;
        for(int[] line : data ) {
            Arrays.fill(line, -1);
        }
        int ans2 = get(0, m);
        return Math.max(ans1, ans2);
    }

    int get(int ps, int cnt) {
        if (data[ps][cnt] != -1)
            return data[ps][cnt];
        if (cnt == 0)
            return 0;
        if (ps &gt= n)
            return -2;

        return data[ps][cnt] = Math.max(get(ps+1, cnt), get(ps+2, cnt-1) + pieces[ps]);
    }
}
</pre>
</p>



      <img src="/i/m/Andrew_Lazarev_mug.gif" alt="" width="55" height="61" border="0" hspace="6" vspace="1" align="left" class="myStatsPhoto"/><br />
      By&#160;<tc-webtag:handle coderId="7485898" context="algorithm"/><br />
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
