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
    <A href="/stat?c=round_overview&er=5&rd=10664">Match Overview</A><br>
    <tc-webtag:forumLink forumID="506230" message="Discuss this match" />
</div>
<span class="bodySubtitle">SRM 340</span><br>Tuesday, February 20, 2007
<br><br>

<h2>Match summary</h2> 

<p> 
Due to some technical problems with the room assignments, the match started four minutes later than planned, but once things settled down all 1135 contestants were able to start on this SRM. In Division 1 all three problems were reasonable tricky. After the coding phase there were only a few contestants who had submitted all three problems, with <tc-webtag:handle coderId="7442498" context="algorithm"/> in first place and <tc-webtag:handle coderId="7433858" context="algorithm"/> two challenges behind. Because of the tricky problems, there were many possible points to be gained in the challenge phase, and <tc-webtag:handle coderId="7433858" context="algorithm"/> used this to take the first position. During the system tests many solutions failed, but <tc-webtag:handle coderId="7433858" context="algorithm"/>'s solutions didn't, which made him the winner of this SRM. Because noone else solved all three problems correctly, <tc-webtag:handle coderId="7442498" context="algorithm"/> kept his second place despite his solution to the easy problem failing. Rounding out the top three was <tc-webtag:handle coderId="19849563" context="algorithm"/>, who had a very fast time on the medium and a good challenge phase.
<br /><br /> 


In Division 2, most coders got the easy quickly, but the medium and the hard were the same tricky problems as the easy and the medium of Division 1. In the end only <tc-webtag:handle coderId="10691314" context="algorithm"/> managed to solve all problems correctly, <tc-webtag:handle coderId="15266216" context="algorithm"/> came in second and newcomer <tc-webtag:handle coderId="22673803" context="algorithm"/> came in third.
<br /><br />
</p> 
 
<H1> 
The Problems 
</H1>
</p> 

<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=7503&amp;rd=10664" name="7503">CssPropertyConverter</a></b> 
</font> 
<A href="Javascript:openProblemRating(7503)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=506230" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
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
      576 / 610 (94.43%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      554 / 576 (96.18%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>exod40</b> for 249.25 points (1 mins 33 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      221.54 (for 554 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
<p>
This is just a 'do what it says'-problem. It can help if you are familiar with the string functions of your library, but it is not necessary, as the solution below shows.

<pre>
string getCamelized(string cssPropertyName) {
    string ret; int i=0;
    while(i&lt;(int)cssPropertyName.size()) {
        if(cssPropertyName[i]=='-') {
            ret+=toupper(cssPropertyName[i+1]);
            i+=2;
        } else {
            ret+=cssPropertyName[i+1];
            ++i;
        }
    }
    return ret;
</pre>
</p>

<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=7504&amp;rd=10664" name="7504">ProblemsToSolve</a></b> 
</font> 
<A href="Javascript:openProblemRating(7504)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=506230" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
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
      451 / 610 (73.93%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      65 / 451 (14.41%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>mohamedafattah</b> for 453.11 points (9 mins 20 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      295.83 (for 65 correct submissions) 
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
      495 / 511 (96.87%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      297 / 495 (60.00%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>NauCoder</b> for 246.23 points (3 mins 31 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      197.81 (for 297 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
<p>
The easiest way to tackle this problem is to look at the stop condition first. It states: "You may stop once the difference between the maximum and minimum pleasantness of the problems you've solved is greater than or equal to the int variety." Because the constraints are low enough, we can just fix the two problems for which the pleasantness between the two problems is large enough by iterating over all possible pairs of problems. If the constraints allow you to fix some important variables, it is usually a good thing to do, since it usually reduces the problem to a much simpler one. In this case, the problem becomes: "find the minimum number of problems needed to solve problems i and j, starting at problem 0 and skipping at most one problem at a time."
<br /><br />

This remaining problem can be solved as follows. Suppose i &lt; j. Then what we have to do is first solve problem 0, from there solve some sequence of problems ending at problem i and finally from there solve some problems ending at problem j. In formula, this is 1+calc(0,i)+calc(i,j). It is easy to see that the number of problems we need to solve to get from problem i to problem j is only dependant on the difference between i and j, so our formula becomes 1+calc(i-0)+calc(j-i). The last thing needed is to determine calc(x). By drawing it on paper, we directly see that the result is (x+1)/2, using integer division.
<br /><br />

All this gives us the following algorithm:

<pre>
int calc(int x) { return (x+1)/2; }
int minNumber(vector &lt;int&gt; pleasantness, int variety) {
    int ret=pleasantness.size();
    for(int i=0;i&lt;(int)pleasantness.size();++i) {
        for(int j=i+1;j&lt;(int)pleasantness.size();++j) {
            if(abs(pleasantness[i]-pleasantness[j])&gt;=variety) {
                ret=min(ret,1+calc(i-0)+calc(j-i));
            }
        }
    }
    return ret;
}
</pre>

The given algorithm is not the fasted possible (it's O(n^2)), but that is not necessary for a competition like topcoder. What matters is that it works, it is fast to code, and it's easy to see that it works. Just in case you are interested, the problem can be solved in O(n) as follows: iterate through all problems and keep track of the minimum and the maximum encountered so far as well as the minimum and maximum encountered on even positions so far. As soon as the difference between the minimum and maximum of even positions becomes large enough, we can return i/2+1 -- and as soon as the difference between the minimum and maximum of all positions becomes large enough, we can return i/2+2. To see why this works, I advise you to draw some cases on paper yourself.
<br /><br />

Of course there are many other algorithms possible. If you are interested, you can find them using the match results on this site. Two noteworthy alternatives are:
<ul>
<li>Dynamic programming on the minimum and maximum encountered so far (or better: their positions) and the current position (used by <tc-webtag:handle coderId="7433858" context="algorithm"/> and <tc-webtag:handle coderId="19849563" context="algorithm"/>)</li>
<li>First fix the two position like we did, but then use dynamic programming on the current position alone, where we cannot skip one of the fixed positions (used by <tc-webtag:handle coderId="11829284" context="algorithm"/>).</li>
</ul>
</p>

<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=7505&amp;rd=10664" name="7505">CsCourses</a></b> 
</font> 
<A href="Javascript:openProblemRating(7505)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=506230" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
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
      70 / 610 (11.48%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      3 / 70 (4.29%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>lNVISIBLE</b> for 585.81 points (21 mins 24 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      556.37 (for 3 correct submissions) 
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
      297 / 511 (58.12%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      125 / 297 (42.09%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>ACRush</b> for 462.11 points (8 mins 16 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      288.67 (for 125 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
<p>
After reading the problem statement, you should immediately think of dynamic programming. If you're unfamiliar with this technique, you should first read the tutorial on dynamic programming, which can be found under the educational content. To see why this is problem is suitable for dynamic programming, consider the following properties: If we know the current theoretical and practical skill and which month it is, we can determine the optimal solution from this point on, without needing to know anything of the past. In other words: the triple of current theoretical skill, practical skill and month is a state. Furthermore, in an optimal solution, the month will be at most equal to the number of courses, because it isn't useful to take a course multiple times.  Therefore, there are only a few (51^3 = 132651) possible states.
<br /><br />

After deciding that dynamic programming is the way to go, we must choose how to implement this. There are actually quite a lot of possibilities. To name a few:

<ul>
<li>Memoization. We can store the optimal course to take in the memoization function itself and create the optimal solution from that (see <tc-webtag:handle coderId="7581406" context="algorithm"/>), or create a second function to construct the optimal solution (see <tc-webtag:handle coderId="19849563" context="algorithm"/> or <tc-webtag:handle coderId="7446789" context="algorithm"/>).</li>
<li>Use a queue. In this case we can process all states in the lexicographical order, so that at each state we can store our previous state and construct the optimal from that information (see <tc-webtag:handle coderId="310333" context="algorithm"/> or <tc-webtag:handle coderId="8357090" context="algorithm"/>).</li>
<li>Backward dynamic programming. Start at the end (where we have reached the wanted skill levels) and determine what could be our previous state, etc. This has the advantage that it we can easily store the next course to take at each state (see <tc-webtag:handle coderId="7442498" context="algorithm"/>).</li>
<li>Forward dynamic programming. In this case it is not so easy to see which previous state we should choose if there are multiple ways to reach a certain state with the same number of courses taken. In this case we have to compare the entire path to reach these previous states. But because the constraints are low enough, this approach is also possible (see <tc-webtag:handle coderId="7433858" context="algorithm"/>).</li>
</ul>

Which one of these approaches is the 'best' depends on your personal preference. Here, I will describe the memoization approach in more detail. If you want to see  another approach, I suggest you look at the mentioned solutions.
<br /><br />

For the memoization approach, we need two functions. One is a recursive function that, given the current state, returns the cost from that state to reach our wanted skill level. The other is a function that returns the best path. Here is an example of such two such functions.

<pre>
int dp(int curtheoretical,int curpractical,int curmonth) {
    if(curtheoretical&gt;=skillBound&&curpractical&gt;=skillBound) return 0;
    if(curmonth&gt;=(int)theoreticalValue.size()) return INF;
    if(done[curtheoretical][curpractical][curmonth]) return cache[curtheoretical][curpractical][curmonth]; 
    else done[curtheoretical][curpractical][curmonth]=true;

    int ret=INF;
    for(int i=0;i&lt;(int)theoreticalValue.size();++i)
        if(curtheoretical&gt;=theoreticalValue[i]-1&&curpractical&gt;=practicalValue[i]-1&&curmonth&lt;expire[i]) {
            int cur=dp(max(curtheoretical,theoreticalValue[i]),max(curpractical,practicalValue[i]),curmonth+1)+1;
            if(cur&lt;ret) {
                ret=cur;
                bestcourse[curtheoretical][curpractical][curmonth]=i;
            }
        }
    return cache[curtheoretical][curpractical][curmonth]=ret;
}

vector&lt;int&gt; construct() {
    vector&lt;int&gt; ret;
    int curtheoretical=0,curpractical=0,curmonth=0;
    while(curtheoretical&lt;skillBound||curpractical&lt;skillBound) {
        int course=bestcourse[curtheoretical][curpractical][curmonth];
        ret.push_back(course);
        curtheoretical=max(curtheoretical,theoreticalValue[course]);
        curpractical=max(curpractical,practicalValue[course]);
        ++curmonth;
    }
    return ret;
}
</pre>
</p>

<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=7507&amp;rd=10664" name="7507">VegetableGarden</a></b> 
</font> 
<A href="Javascript:openProblemRating(7507)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=506230" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
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
      6 / 511 (1.17%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      4 / 6 (66.67%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>marek.cygan</b> for 637.94 points (24 mins 33 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      542.34 (for 4 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
<p>
The key to solving this problem is to remember how we test in geometry problems if a certain point lies inside a polygon. One way to do this is to draw a line from the point in an arbitrary direction, and test if the number of lines of the polygon it intersects is even (outside the polygon) or odd (inside the polygon).
<br /><br />

In this case we can do something very similar: we make a path through the garden, and for each plot we care about, remember if our path has an even or an odd number of segments above the plot. Now a solution to the problem is a path from the upperleft corner to the upperleft corner, with no forbidden plots having an odd number of segments above it and some wanted plots having an odd number of segments above it. We can now see that the the current x-coordinate, the current y-coordinate and for each point the parity of the number of segments above it constitute a state. Because there are maximal ten points we care about, there are maximal 51*51*2^10=2663424 states, which is doable for a computer (the code below runs in about 0.8 seconds). We can use a simple breadth-first search to determine the shortest paths for each of the possible combinations of plots inside the path. The code follows:

<pre>
vector &lt;int&gt; getMinDistances(vector &lt;string&gt; garden) {
    int h=(int)garden.size(),w=(int)garden[0].size();
    
    int nrcare=0,nrwant=0,cant=0;
    for(int i=0;i&lt;h;++i) for(int j=0;j&lt;w;++j) if(garden[i][j]=='I') { garden[i][j]='0'+nrcare; ++nrwant; ++nrcare; }
    for(int i=0;i&lt;h;++i) for(int j=0;j&lt;w;++j) if(garden[i][j]=='X') { garden[i][j]='0'+nrcare; cant|=1&lt;&lt;nrcare; ++nrcare; }
    
    for(int j=0;j&lt;w;++j) {
        under[h][j]=0;
        for(int i=h-1;i&gt;=0;--i) under[i][j]=under[i+1][j]|(isdigit(garden[i][j])?1&lt;&lt;(garden[i][j]-'0'):0);
    }

    int DX[]={-1,0,1,0,0};
    int DY[]={0,1,0,-1,0};
    
    for(int i=0;i&lt;=h;++i) for(int j=0;j&lt;=w;++j) for(int k=0;k&lt;(1&lt;&lt;nrcare);++k) best[i][j][k]=INF;
    queue&lt;State&gt; q;
    best[0][0][0]=0; q.push(State(0,0,0));
    
    while(!q.empty()) {
        int x=q.front().x,y=q.front().y,z=q.front().z; q.pop();
        for(int k=0;k&lt;4;++k) {
            int nx=x+DX[k],ny=y+DY[k];
            if(nx&lt;0||nx&gt;h||ny&lt;0||ny&gt;w) continue;
            int nz=z; if(DY[k]==+1) nz^=under[x][y]; else if(DY[k]==-1) nz^=under[nx][ny];
            if(best[x][y][z]+1&lt;best[nx][ny][nz]) { best[nx][ny][nz]=best[x][y][z]+1; q.push(State(nx,ny,nz)); }
        }
    }

    vector&lt;int&gt; ret(nrwant,INF);
    for(int i=1;i&lt;(1&lt;&lt;nrcare);++i) if((i&cant)==0) ret[bitcount[i]-1]&lt;?=best[0][0][i];
    return ret;
}
</pre>
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
   <jsp:param name="level1" value="default"/>
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
