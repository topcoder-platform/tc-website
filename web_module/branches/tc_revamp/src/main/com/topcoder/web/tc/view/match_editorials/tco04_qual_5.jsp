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
<tc-webtag:forumLink forumID="505678" message="Discuss this match" /></div>
<span class="bodySubtitle">2004 TopCoder Open <br> Qualification Problem Set 5</span><BR/>September 7-8, 2004
<br><br>

<span class="bigTitle">Summary</span>

<p> 
Jongman was one of two yellow coders to win his problem set, and he did so by
over 70 points, beating second place ZorbaTHut, and third place kalinov, not to
mention every one's favorite problem writer, Yarin.
</p> 
 
<p>
<H1> 
The Problems 
</H1>
</p> 

<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=2969&amp;rd=5877" name="2969">TheThe</a></b> 
</font> 
<A href="Javascript:openProblemRating(2969)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A>
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505678" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

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
      197 / 211 (93.36%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      168 / 197 (85.28%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>gepa</b> for 248.02 points (2 mins 2 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      218.90 (for 168 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 

<p>
A good string tokenizer was all you needed in this problem.  Simply loop through
all of the lines, tokenizing each one into words.  Then, look at all pairs of
adjacent lines, and see if the first token of one line matches the last token of
the preceding line.
</p>

<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=2979&amp;rd=5877" name="2979">FewestTurns</a></b> 
</font> 
<A href="Javascript:openProblemRating(2979)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A>
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505678" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

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
      81 / 211 (38.39%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      37 / 81 (45.68%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>JongMan</b> for 796.40 points (12 mins 9 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      481.02 (for 37 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 

<p>
This is a pretty standard search problem.  The most efficient way to do it is
with a breadth first search, but a simpler depth first search can be made to
work as long as you are careful about not blowing the stack.  Most coders went
for a breadth first approach, so I'll discuss that one.  The basic idea here is
like any other breadth first search problem, you have a first in, first out
queue.  Each element in the queue represents a location and direction in the
map.  You also have a table which tells how many turns it has taken to get to a
particular location in a particular direction.  After you take a location and
direction off the queue, you look at all the positions and directions that can
be reached from there.  For each one, you also look up how many turns it has
taken in the table.  If the value in the table doesn't exist, or is greater than
the number of turns required to get there from the location we took off the
queue, we insert the location and direction into the queue, and update the
table.  At the end, we return the minimum value in the table for the final
position and some direction.
</p>
<pre>
    queue q;
    table t;
    initialize t[a][b][c] = INF, for all a,b,c;
<font color="blue">//insert starting location and all four directions</font>
    q.insert(startx,starty,0);
    q.insert(startx,starty,1);
    q.insert(startx,starty,2);
    q.insert(startx,starty,3);
    t[startx][starty][0] = 0;
    t[startx][starty][1] = 0;
    t[startx][starty][2] = 0;
    t[startx][starty][3] = 0;
    while(!q.isEmpty()){
        x = q.first().x;
        y = q.first().y;
        dir = q.first().dir;
        q.removeFirst();
        turns = table[x][y][dir];
        if(roadFrom(x,y,x+dx[dir],y+dy[dir])){
            if(t[x+dx[dir]][y+dy[dir]][dir] &gt; turns){
                t[x+dx[dir]][y+dy[dir]][dir] = turns;
                q.insert(x+dx[dir],y+dy[dir],dir);
            }
        }
        if(t[x][y][(dir+1)%4] &gt; turns+1){
            t[x][y][(dir+1)%4] = turns+1;
            q.insert(x,y,(dir+1)%4);
        }
        if(t[x][y][(dir+3)%4] &gt; turns+1){
            t[x][y][(dir+3)%4] = turns+1;
            q.insert(x,y,(dir+3)%4);
        }
    }
    return min(t[finalx][finaly][0],t[finalx][finaly][1],
        t[finalx][finaly][2],t[finalx][finaly][3]);
</pre>

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

