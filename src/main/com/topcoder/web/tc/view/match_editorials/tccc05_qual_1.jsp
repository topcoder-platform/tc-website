<%@  page language="java"  %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Statistics</title>

<jsp:include page="/style.jsp">
  <jsp:param name="key" value="tc_stats"/>
</jsp:include>
<jsp:include page="../script.jsp" />
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
        <td width="180" id="onLeft">	<jsp:include page="/includes/global_left.jsp">
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
<tc-webtag:forumLink forumID="505704" message="Discuss this match" /></div>
<span class="bodySubtitle">2005 TopCoder Collegiate Challenge <br> Qualification Problem Set 1</span><BR/>January 11-12, 2005
<br><br>

<span class="bigTitle">Summary</span> 

<p> 
Rooms 1 and 6 probably had the easiest hard problem, as 99 people got it right.
As a result, it had the highest cutoff of any room, and only a few people made
it in with only the easy problem.  Topping off the list of advancers was tomek,
with a comfortable lead over second place Wernie.  Andrew_Lazarev rounded out
the top 3 and denpoz ended up doing best amongst the newcomers, taking a
respectable 26<sup>th</sup> place.
</p> 
 
<H1> 
The Problems 
</H1>

<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=3477&amp;rd=6523" name="3477">Fairness</a></b> 
</font> 
<A href="Javascript:openProblemRating(3477)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A>
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505704" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

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
      146 / 175 (83.43%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      106 / 146 (72.60%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>weimashizhu</b> for 245.86 points (2 mins 57 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      193.76 (for 106 correct submissions)
    </td>
  </tr>
</table></blockquote> 

<p>
Most of the time, the easiest why to solve any sorting problem is to write a
comparator method and then use the built in sort function that your language of
choice provides.  In this case, we want to break ties in the sort by putting the
word that appears earlier in the input first.  This is known as a stable sort,
and you need to be sure that you use it, or else you could end up with tied
elements in the wrong order.  In Java, the default sort methods are all stable,
while in C++, you have to use stable_sort.  Writing the comparator is fairly
simple.  You just calculate the averages for each word with a couple of loops,
and then return -1, 0 or 1, depending on which of the averages is greater (or 0
if they are equal).
</p>

<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=3473&amp;rd=6523" name="3473">LandMines</a></b> 
</font> 
<A href="Javascript:openProblemRating(3473)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A>
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505704" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

Used as: Division One - Level Two: <blockquote><table cellspacing="2"> 
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
      116 / 175 (66.29%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      95 / 116 (81.90%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>tomek</b> for 913.62 points (7 mins 7 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      631.54 (for 95 correct submissions)
    </td>
  </tr>
</table></blockquote> 

<p>
This problem can be solved using either a depth or breadth first search.  Depth
first search (DFS) is usually easier to code, so we'll go with that one.  The
basic idea of any DFS algorithm is to branch out from some start state, and keep
visiting new states until you can't find any unvisited states to visit, and then
backtrack.  In this case, the state is simply a location on the board.  From a
particular state, you can visit any of the 4 adjacent spaces, so long as the
metal detector doesn't beep in that direction.  It should be noted that you are
allowed to go to a previously visited location even if the metal detector beeps
in that direction.  However, this doesn't really matter because there is no
reason to ever visit a spot more than once as knowing where some of the mines
are doesn't help you deduce anything about other potential mines.  <br/><br/>

Also, you really don't have to worry very much about efficiency in this problem,
so its ok if your code to check for beeping is rather inefficient.  The code
below is very inefficient, as it does a lot of work over and over again to check
for beeps.  An improved version could precalculate whether the metal detector
beeps from each location, in each direction in O(N^2).  Then, the DFS would also
be O(N^2).  Yet, the version below is O(N^3), which is still plenty fast when N
is only 50.

<pre class="code">
boolean[][] visited;
String[] layout;
int ret = 0;
public int numClear(String[] layout){
    this.layout = layout;
    visited = new boolean[layout.length][layout[0].length()];
    dfs(0,0);
    return ret;
}
void dfs(int x, int y){
    if(x&lt;0||x&gt;=layout.length)return;
    if(y&lt;0||y&gt;=layout[0].length())return;
    if(visited[x][y])return;
    <font color="blue">//If we get here, x,y is an unvisited, valid state</font>
    ret++;
    visited[x][y] = true;
    boolean r1 = false, r2 = false;
    boolean c1 = false, c2 = false;
    <font color="blue">//r1, r2, c1, and c2 each represent a beep in a certain direction</font>
    for(int i = 0; i&lt;layout.length; i++){
        if(layout[i].charAt(y) == 'M' &amp;&amp; i &lt; x)r1 = true;
        if(layout[i].charAt(y) == 'M' &amp;&amp; i &gt; x)r2 = true;
    }
    for(int i = 0; i&lt;layout[0].length(); i++){
        if(layout[x].charAt(i) == 'M' &amp;&amp; i &lt; y)c1 = true;
        if(layout[x].charAt(i) == 'M' &amp;&amp; i &gt; y)c2 = true;
    }
    <font color="blue">//now recurse in each of the valid directions</font>
    if(!r1)dfs(x-1,y);
    if(!r2)dfs(x+1,y);
    if(!c1)dfs(x,y-1);
    if(!c2)dfs(x,y+1);
}
</pre>
</p>

<div class="authorPhoto">
    <img src="/i/m/lbackstrom_mug.gif" alt="Author" />
</div>
<div class="authorText">
By&#160;<tc-webtag:handle coderId="159052" context="algorithm"/><br />
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

