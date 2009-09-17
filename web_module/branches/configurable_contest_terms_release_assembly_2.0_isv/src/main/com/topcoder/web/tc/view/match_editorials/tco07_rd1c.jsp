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
    <A href="/stat?c=round_overview&er=5&rd=10743">Match Overview</A><br>
    <tc-webtag:forumLink forumID="514950" message="Discuss this match" />
</div>
<span class="bodySubtitle">2007 TopCoder Open<br>Algorithm Round 1C</span><br>Thursday, April 12, 2007
<br><br>


<h2>Match summary</h2> 

TCO07 online Round 1 concluded with section C, which was probably the
easiest of the three sections. No targets participated in this
section, but that didn't mean things would be easy. With only 300
coders advancing to round 2, people did their utmost best to be one of
them. 
The round started off with an easy problem that didn't cause much
trouble for most coders. The medium one was harder and caused about
half of the submissions to fail. The tough hard problem was only solved
by ten coders.
<br />
<br />

In the end, only seven coders, all of them red, managed to correctly
solve all three problems. Leading the pack were 
<tc-webtag:handle coderId="22641658" context="algorithm"/>,
<tc-webtag:handle coderId="2058177" context="algorithm"/> and
<tc-webtag:handle coderId="7446789" context="algorithm"/>.
The other coders to solve all three problems were
<tc-webtag:handle coderId="275640" context="algorithm"/>,
<tc-webtag:handle coderId="309453" context="algorithm"/>,
<tc-webtag:handle coderId="22652597" context="algorithm"/> and
<tc-webtag:handle coderId="15616795" context="algorithm"/>.
<br /><br />

<H1> 

The Problems 

</H1>



<font size="+2"> 

<b><a href="/stat?c=problem_statement&amp;pm=7692&amp;rd=10743" name="7692">SquareCypher</a></b> 

</font> 

<A href="Javascript:openProblemRating(7692)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=514950" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

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

      397 / 406 (97.78%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Success Rate</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      362 / 397 (91.18%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>High Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Eryx</b> for 248.69 points (2 mins 4 secs) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Average Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      205.97 (for 362 correct submissions) 

    </td> 

  </tr> 

</table></blockquote> 

This problem didn't cause a lot of trouble. The easiest way to solve
it was to first figure out how many characters were moved to the
beginning. This turns out to be 1+sqrt(cryptogram.size()-1). After
that, just put those characters on the square-numbered places and the
others on the remaining places. Code to do this follows:


<pre>
string decrypt(string cryptogram) {
  int numSquares = (int)floor(sqrt(cryptogram.size() - 1.0)) + 1;
  int i=0, j=numSquares;

  string sol;
  for (int k=0; k&lt;cryptogram.size(); k++)
    if (isSquare(k)) 
      sol+=cryptogram[i++]; 
    else 
      sol+=cryptogram[j++];

  return sol;
}
</pre>



<font size="+2"> 

<b><a href="/stat?c=problem_statement&amp;pm=7670&amp;rd=10743" name="7670">RaceTrack</a></b> 

</font> 

<A href="Javascript:openProblemRating(7670)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=514950" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

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

      252 / 406 (62.07%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Success Rate</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      129 / 252 (51.19%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>High Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      <b>gozman</b> for 485.78 points (4 mins 53 secs) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Average Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      329.37 (for 129 correct submissions) 

    </td> 

  </tr> 

</table></blockquote> 


A quote from <tc-webtag:handle coderId="8357090" context="algorithm"/>
the editorial for TC07 Round 1A: "... there is one
natural question you should ask: given a fixed value X, can I find an
efficient way to verify whether the condition holds for my X?" Well,
for this problem you can actually determine easily whether a distance
X is achievable. Just put one judge in the first seat, put the next
judge in the first seat that has distance greater than or equal to X from that
seat, and so on. If you place all the judges this way, it is possible --
but if you run out of seats, it isn't. Moreover, the placement is also
the one obeying the tie-breaker rule of putting all judges as close to
the start as possible. After noticing this, just do a binary search on
the answer and you're done:

<pre>
string judgePositions(int length, int judges, vector&lt;int&gt; pos) {
  int lo=0, hi=length;
  string sol;

  while (lo!=hi) {
    int X=(lo+hi+1)/2;
      
    int placed=0;
    int prev=-INFTY;
    string used(pos.size(), '0');

    for (int i=0; i&lt;pos.size(); i++) 
      if (pos[i]&gt=prev+X && placed&lt;judges) placed++, prev=pos[i], used[i]='1';

    if (placed==judges)
      lo=X, sol=used;
    else
      hi=X-1;
  }

  return sol;
}
</pre>

 

<font size="+2"> 

<b><a href="/stat?c=problem_statement&amp;pm=7506&amp;rd=10743" name="7506">MedievalCity</a></b> 

</font> 

<A href="Javascript:openProblemRating(7506)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=514950" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

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

      19 / 406 (4.68%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Success Rate</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      10 / 19 (52.63%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>High Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      <b>malcin</b> for 597.89 points (27 mins 33 secs) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Average Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      482.34 (for 10 correct submissions) 

    </td> 

  </tr> 

</table></blockquote> 

This problem gave a lot of coders a hard time. First notice that the
bounds allow the city to cover an area bigger than 10,000 times
10,000, so that drawing it in an array is impossible. To solve the
problem we start with parsing the input string, resulting in the
coordinates of the wall. We'd like this boundary to be oriented
clockwise (or counterclockwise, whatever you prefer). To do this
we calculate the area, and reverse the coordinate list if it
turns out to be negative:


<pre>
string s;
for (int i=0; i&lt;boundary.size(); i++) s+=boundary[i];

int x=0,y=0,i=0,area=0;
vector&lt;int&gt; bx,by;
 
bx.push_back(x);
by.push_back(y);
    
while (i&lt;s.size()) {
  char c=s[i++];
  int n = (i&lt;s.size() && isdigit(s[i])) ? 0 : 1;
  while (i&lt;s.size() && isdigit(s[i])) n=10*n+s[i++]-'0';
 
  if (c=='L') x-=n;
  if (c=='R') x+=n;
  if (c=='U') y+=n;
  if (c=='D') y-=n;
 
  bx.PB(x);
  by.PB(y);

  area += bx[bx.size()-1]*by[by.size()-2] - bx[bx.size()-2]*by[by.size()-1];
}
 
if (area&lt;0) {
  reverse(bx.begin(),bx.end());
  reverse(by.begin(),by.end());
}
</pre>


Now that we have the coordinates of the boundary in a clockwise
fashion, we want to figure out which squares are directly adjacent to
it on the inside, and which are directly adjacent to the outside. To
do so, I'll assign the coordinate (x,y) to the square to the
bottom-right of lattice point (x,y). A boundary piece from (x,y) going
to the right then results in a square (x,y) on the inner boundary and a
square (x,y+1) on the outer boundary. Boundary pieces in other
directions also result in one square on the inner boundary and one on
the outer one. Some squares may enter the lists multiple times. To
prevent this, most languages have out-of-the-box datastructures, like
C++'s set:


<pre>
set&lt;pair&lt;int,int&gt; &gt; inner,outer;

for (int i=1; i&lt;bx.size(); i++) {    
  int dx=0,dy=0;
  if (bx[i]&gt;bx[i-1]) dx=+1;
  if (bx[i]&lt;bx[i-1]) dx=-1;
  if (by[i]&gt;by[i-1]) dy=+1;
  if (by[i]&lt;by[i-1]) dy=-1;
 
  int x=bx[i-1], y=by[i-1];
  while (x!=bx[i] || y!=by[i]) {
    if (dx==+1) {
      inner.insert(make_pair(x,y));
      outer.insert(make_pair(x,y+1));
    }
    if (dx==-1) {
      inner.insert(make_pair(x-1,y+1));
      outer.insert(make_pair(x-1,y));
    }
    if (dy==+1) {
      inner.insert(make_pair(x,y+1));
      outer.insert(make_pair(x-1,y+1));
    }
    if (dy==-1) {
      inner.insert(make_pair(x-1,y));
      outer.insert(make_pair(x,y));
    }
 
    x+=dx; y+=dy;
  }
} 
</pre>

Now that we have the inner and outer boundaries, we know how many squares
are 0-dangerous and we'll proceed with the 1-dangerous squares. Those
are all squares that are adjacent to 0-dangerous squares, but that are
not 0-dangerous themselves and are not on the outer boundary. We can
use this insight iteratively to find all n-dangerous cells too:


<pre>
int DX[4] = { 1,-1,0,0 };
int DY[4] = { 0,0,1,-1 };

int sol=0;

for (int danger=0; danger&lt;=dangerBound; danger++) {
  sol += inner.size();
  set&lt;pair&lt;int,int&gt; &gt; newinner;

  for (set&lt;pair&lt;int,int&gt; &gt;::iterator it=inner.begin(); it!=inner.end(); it++) {
    int x=it->first, y=it->second;
    for (int d=0; d&lt;4; d++) {
      int nx=x+DX[d], ny=y+DY[d];
      if (!inner.count(make_pair(nx,ny)) && !outer.count(make_pair(nx,ny)))
        newinner.insert(make_pair(nx,ny));    
    }  
  }
 
  outer=inner;
  inner=newinner;
}    

return sol;
</pre>

<br /><br />




<div class="authorPhoto">
    <img src="/i/m/Jan_Kuipers_big.jpg" alt="Author" />
</div>
<div class="authorText">
By&#160;<tc-webtag:handle coderId="309453" context="algorithm"/><br />
    <em>TopCoder Member</em>
</div>


</div>
</td>

<!-- Center Column Ends -->

<!-- Right Column Begins -->
         <td width="170" id="onRight">
            <jsp:include page="/public_right.jsp">
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
