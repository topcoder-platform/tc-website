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
<!-- Left Column Begins-->
   <td width="180" id="onLeft">
      <jsp:include page="/includes/global_left.jsp">
         <jsp:param name="node" value="algo_match_editorials"/>
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

<div class="linkBox">
    <A href="/tc?module=Static&d1=match_editorials&d2=archive">Archive</A><br>
    <span id="printableLink"><A href="Javascript:makeInvisible();">Printable view</A><br></span>
    <span id="navigableLink" class="invisible"><A href="Javascript:makeNavigable();">Normal view</A><br></span>
<tc-webtag:forumLink forumID="505996" message="Discuss this match" /></div>
<span class="bodySubtitle">SRM 321</span><br>Monday, October 2, 2006
<br><br>

<h2>Match summary</h2>



<p>
This SRM gave coders still in the running for the TCCC one more chance to practice for the second
online round. In Division 1, most coders finished the easy and the medium
problems quite quickly, and many submitted the hard as well. All three
problems had many opportunities for errors, though, which led to many succesful
challenges. As the end of the challenge phase approached, the match was so tight that the difference between sixth place and first place was less than a challenge! The system test
took a number of solutions down, however, leaving only three coders who
solved all the problems. <tc-webtag:handle coderId="11829284"
context="algorithm"/> took the top spot with <tc-webtag:handle
coderId="10574855" context="algorithm"/> following closely behind and
<tc-webtag:handle coderId="7462740" context="algorithm"/> in third.
</p>
<p>
In Division 2, the easy problem proved to be quite difficult. Along with the abundant opportunities for mistakes in the
other two problems, this led to fairly low
scores overall. In the end, there were also only three Division 2 coders who solved all
their problems. Newcomer <tc-webtag:handle coderId="22653815"
context="algorithm"/> took the top spot with <tc-webtag:handle
coderId="20557476" context="algorithm"/> in second position and
<tc-webtag:handle coderId="21801179" context="algorithm"/> in third.
</p>



<H1>

The Problems

</H1>

</p>



<font size="+2">

<b><a href="/stat?c=problem_statement&amp;pm=6757&amp;rd=10001"
name="6757">KDoubleSubstrings</a></b>

</font>

<A href="Javascript:openProblemRating(6757)"><img src="/i/rate_it.gif"
hspace="10" border="0" alt="rate it" /></A>

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=505996"
CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it"
border="0" /></A>

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

      255 / 414 (61.59%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Success Rate</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      220 / 255 (86.27%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>High Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      <b>agysejt</b> for 247.68 points (2 mins 45 secs)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Average Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      172.19 (for 220 correct submissions)

    </td>

  </tr>

</table></blockquote>

<p>
First we concatenate all the elements of str. Then we can iterate over all
possible even-length substrings. For each substring we have to determine the
number of positions in which the first part differs from the second part. If this
number is not greater than k, we have to increment our return value. So we
get the following algorithm:
<pre>
int howMuch(vector &lt;string&gt; str, int k) {
        string s; 
        for(int i=0;i&lt;str.size();++i) s+=str[i]; 
        int n=s.size();
        int ret=0;
        for(int a=0;a&lt;n;++a) for(int b=a;b&lt;n;++b) {
                int len=b-a+1;
                if(len%2!=0) continue;
                int half=len/2;
                int cnt=0;
                for(int i=0;i&lt;half;++i) if(s[a+i]!=s[a+half+i]) ++cnt;
                if(cnt&lt;=k) ++ret;
        }
        return ret;
}
</pre>
</p>



<font size="+2">

<b><a href="/stat?c=problem_statement&amp;pm=6598&amp;rd=10001"
name="6598">Chocolate</a></b>

</font>

<A href="Javascript:openProblemRating(6598)"><img src="/i/rate_it.gif"
hspace="10" border="0" alt="rate it" /></A>

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=505996"
CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it"
border="0" /></A>

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

      246 / 414 (59.42%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Success Rate</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      36 / 246 (14.63%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>High Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      <b>lidaobing</b> for 467.27 points (7 mins 37 secs)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Average Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      350.03 (for 36 correct submissions)

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

      406 / 417 (97.36%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Success Rate</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      185 / 406 (45.57%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>High Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      <b>Michael_Levin</b> for 246.92 points (3 mins 10 secs)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Average Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      199.72 (for 185 correct submissions)

    </td>

  </tr>

</table></blockquote>

<p>
We first note that if we have a possible final rectangle we can easily
determine the number of splits necessary to create the rectangle. If it is
the same rectangle as the orignal one it requires zero splits; if only one of
the lengths of the final rectangle is equal to one of the lengths of the
original rectangle it requires one split; and otherwise, it requires two
splits.
We can iterate over the side of the smallest side of the final rectangle and
we will call its length a. The length of the other side of the final rectangle must
be of size b=nTiles/a, and it must be an integer. Since a&lt;=b, we get at
most sqrt(nTiles) possible final rectangles. For each possible final
rectangle we have to check if it fits in the original rectangle -- if it
does, we have to calculate the number of split operations necessary and
update our best result so far. In the end, we return the best result found, or
-1 if we have found no valid rectangle. The solution follows:
<pre>
int minSplitNumber(int width, int height, int nTiles) {
        int ret=3;
        for(int a=1;a*a&lt;=nTiles;++a) if(nTiles%a==0) {
                int b=nTiles/a;
                if(a&lt;=width&&b&lt;=height||a&lt;=height&&b&lt;=width) {
                        if(a==width&&b==height||a==height&&b==width)
                            ret=min(ret,0);
                        else if(a==width||a==height||b==width||b==height)
                            ret=min(ret,1);
                        else ret=min(ret,2);
                }
        }
        return ret==3?-1:ret;
}
</pre>
Another approach a lot of coders took during the contest is handling case by
case. If we take this approach, we get the following solution:
<pre>
int minSplitNumber(int width, int height, int nTiles) {
        if((long long)width*height&lt;nTiles) return -1;
        if((long long)width*height==nTiles) return 0;
        if(nTiles%width==0||nTiles%height==0) return 1;
        for(int a=1;a*a&lt;=nTiles;++a) if(nTiles%a==0) {
                int b=nTiles/a;
                if(a&lt;=width&&b&lt;=height||a&lt;=height&&b&lt;=width)
        return 2;
        }
        return -1;
}
</pre>
</p>



<font size="+2">

<b><a href="/stat?c=problem_statement&amp;pm=6771&amp;rd=10001"
name="6771">LexStringWriter</a></b>

</font>

<A href="Javascript:openProblemRating(6771)"><img src="/i/rate_it.gif"
hspace="10" border="0" alt="rate it" /></A>

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=505996"
CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it"
border="0" /></A>

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

      91 / 414 (21.98%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Success Rate</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      6 / 91 (6.59%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>High Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      <b>Akinshin</b> for 775.13 points (16 mins 19 secs)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Average Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      572.79 (for 6 correct submissions)

    </td>

  </tr>

</table></blockquote>

<p>
First we have to print all a's, then all b's, etc. To print all the a's, the
optimal way is clearly just to move until the last a, printing all a's
along the way. To print all the b's, there are two possible ways that can be
optimal:
<ul>
<li>First go to the leftmost b, than to the rightmost b, printing all b's
along the way. </li>
<li>First go to the rightmost b, than to the leftmost b, printing all b's
along the way. </li>
</ul>
To print all the c's, we can start from either the leftmost b or the
rightmost b, depending on the order in which we printed the b's. From both
of these starting points we again have the same possible choices: first left,
then right, or first right, then left. Continuing in this way, we will end at
either the leftmost or the rightmost z. So we get the following solution:
<pre>
bool have[256];
int first[256];
int last[256];
int cnt[256];

int minMoves(string s) {
        int n=s.size();
        for(int i=0;i&ltn;++i) {
                if(!have[s[i]]) first[s[i]]=i;
                have[s[i]]=true;
                last[s[i]]=i;
                ++cnt[s[i]];
        }
       
        int leftpos=0,leftval=0,rightpos=0,rightval=0;
        for(char c='a';c&lt='z';++c) if(have[c]) {
                int nleftval=min(leftval+abs(last[c]-leftpos),rightval+abs(last[c]-rightpos))+abs(first[c]-last[c])+cnt[c];
                int nrightval=min(leftval+abs(first[c]-leftpos),rightval+abs(first[c]-rightpos))+abs(last[c]-first[c])+cnt[c];
                leftpos=first[c], leftval=nleftval, rightpos=last[c], rightval=nrightval;
        }
        return min(leftval,rightval);
}
</pre>

</p>



<font size="+2">

<b><a href="/stat?c=problem_statement&amp;pm=6755&amp;rd=10001"
name="6755">WeirdSort</a></b>

</font>

<A href="Javascript:openProblemRating(6755)"><img src="/i/rate_it.gif"
hspace="10" border="0" alt="rate it" /></A>

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=505996"
CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it"
border="0" /></A>

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

      358 / 417 (85.85%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Success Rate</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      120 / 358 (33.52%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>High Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      <b>felix_halim</b> for 482.08 points (5 mins 31 secs)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Average Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      336.66 (for 120 correct submissions)

    </td>

  </tr>

</table></blockquote>

<p>
We first note that if we sort the data and reverse it, we get a valid
ordering. To find the lexicographically smallest one, we start with zero
elements and, every time, append the smallest element left in data such that
it is still possible to create a valid ordering. We can create a valid
ordering in each of the following cases:
<ul>
<li> If all the remaining elements are the same as the current element. In
this case, we can simply append them.
<li> If the difference between the largest remaining element and the current
element is at least two. In this case, we can reverse the remaining elements
and append them. </li>
<li> If there remain elements containing a smaller element than the current
element. In this case, we can split the remaing elements into two parts: the
ones smaller or equal to the current element and the ones greater than the
current element. We can then reverse the first part and append them, then reverse the second part and append them. </li>
</ul>
The only case left is when the current element is the smallest element and
the largest remaining element is exactly one greater. It is easy to see that,
in this case, it is indeed impossible to create a valid ordering. Because we
can only append elements of the same size to it, and after some time we have
to append the element which is one greater, this will make the ordering
invalid. We then get the following algorithm:
<pre>
vector &lt;int&gt; sortArray(vector &lt;int&gt; data) {
        sort(data.begin(),data.end());
        vector&lt;int&gt; ret;
        while(data.size()&gt;0) {
                for(int i=0;i&lt;data.size();++i) {
                        if(ret.size()&gt;0&&ret.back()+1==data[i]) continue;
                        if(data[i]==data[0]&&data[0]+1==data.back())
                continue;
                        ret.push_back(data[i]);
                        data.erase(data.begin()+i);
                        break;
                }
        }
        return ret;
}
</pre>
There are many other interesting approaches to this problem. You can find
some of them by viewing the submitted solutions in the match results section
of the site.
<br /><br />



<font size="+2">

<b><a href="/stat?c=problem_statement&amp;pm=6758&amp;rd=10001"
name="6758">MergingGraph</a></b>

</font>

<A href="Javascript:openProblemRating(6758)"><img src="/i/rate_it.gif"
hspace="10" border="0" alt="rate it" /></A>

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=505996"
CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it"
border="0" /></A>

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

      51 / 417 (12.23%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Success Rate</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      7 / 51 (13.73%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>High Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      <b>Petr</b> for 619.76 points (25 mins 52 secs)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Average Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      509.16 (for 7 correct submissions)

    </td>

  </tr>

</table></blockquote>

<p>
First note that we can safely ignore duplicate edges, that the order of the
merge operations does not matter and that the number of operations to
convert the graph into a cycle is simply n-"the number of vertices in the
final cycle." If there is a vertex that has multiple outgoing edges, then
the vertices to which these edges point must be merged. Similarly, if there
is a vertex that has multiple incoming edges, then the vertices these edges
come from must be merged. We can keep merging vertices
until every vertex has at most one incoming and at most one outgoing edge. Now, for
each connected component, there are two possibilities -- it is path or it is a
cycle:
<ul>
<li> If there are cycles, the length of each cycle must be a multiple of the
cycle of the final solution. In other words, the length of the final cycle
must be a divisor of the greatest common divisor of the lengths of all
cycles. However, it is clear that we can merge all the cycles and the paths in a
final cycle of this length, so the final answer is n-"the greatest common
divisor of the lengths of all cycles."</li>
<li> If there are no cycles, all connected components are paths. We can
connect these paths end-to-end to create a final cycle of length equal to
the sum of the total number of edges of all paths. But it is clear that this
is also the maximum cycle length we can create. So the final answer is n-"the
sum of the number of edges in all paths."</li>
</ul>

In the contest, three different approaches of implementing this algorithm
were successful:
<ul>
<li> Do exactly what the above algorithm says. This was the approach taken by
<tc-webtag:handle coderId="11829284" context="algorithm"/>,
<tc-webtag:handle coderId="7462740" context="algorithm"/>, <tc-webtag:handle
coderId="21822659" context="algorithm"/> and <tc-webtag:handle
coderId="10603164" context="algorithm"/>. </li>
<li> Try for each possible final cycle length, if we can create it. If there
are cycles, we can create a given final cycle length if all cycles have a
length that is a multiple of the final cycle length. If there are no
cycles, we can create a given final cycle length if the sum of the maximum
path length in each component is greater or equal to the final cycle length.
This approach was taken by <tc-webtag:handle coderId="10574855"
context="algorithm"/> and <tc-webtag:handle coderId="7390224"
context="algorithm"/>. </li>
<li> The approach I found most elegant was to calculate the greatest common
divisor of all cycles (if there are any) and the maximum path length in each
component and return n-"this common divisor" if there are any cycles and
n-"the sum of the maximum path lengths in each component" otherwise. This
approach was only taken by <tc-webtag:handle coderId="20812309"
context="algorithm"/>. </li>
</ul>

</p>

<div class="authorPhoto">
    <img src="/i/m/krijgertje_big.jpg" alt="Author" />
</div>
<div class="authorText">
  By&#160;<tc-webtag:handle coderId="9906197" context="algorithm"/><br />
      <em>TopCoder Member</em>
</div>


</div>
</td>
<!-- Center Column Ends -->

<!-- Right Column Begins -->
   <td width="170" id="onRight">
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

<div id="onBottom">
<jsp:include page="../foot.jsp" />
</div>

</body>

</html>
