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
<tc-webtag:forumLink forumID="505864" message="Discuss this match" /></div>
<span class="bodySubtitle">SRM 298</span><br>Tuesday, April 11, 2006
<br><br>

<span class="bigTitle">Match summary</span>

<p>
Since this Single Round Match took place during the ACM ICPC finals, it was surprising (and nice) to see such a big crowd attending, that almost reached a thousand participants. This was the first competition in which char type was used as input, so it was good to have so many testers.
</p>
<p>
In division 1 the problem set seemed easy, with a great number of coders finishing all three problems with good times. Also with a good number of challenges, mostly because of a 500-point problem with many things to consider, the top scorers finished with a lot more points than what's usual.
</p>
<p>

ivan_metelsky took the first place thanks to good times in all problems and two succesfull challenges that gave him the extra points needed to reach the top. 
Behind him, Crush with an amazing performance on 1000-point problem and also good times in the other two managed to get second position, less than 100 points ahead of ACRush, who had the best time in both 250 and 500. 
misof, gawry and Ying rounded up the top 6, within 100 points from the top 3.
</p>
<p>
Division 2 was a whole different story, with no coder correctly finishing the hard problem, the match was decided with speed in the other two problems, but mostly with challenges. 
Specially in 250 problem, where many coders failed to correctly handling all the cases of the simulation and some having trouble using the '\' character in output, challenge points were there to take them, and crucial to the final score.
</p>
<p>

nirmal_mehta took the first spot, thanks to a carefully but not too slow performance in the 250 problem, a really quick programming of the 500, but specially, to 6 succesfull challenges that made his only unsuccesfull one look like nothing. 
In second place by a difference of less than 100 points, came RakeshN, that have a similar performance on problems, but "just" 3 succesfull challenges. 
emka207 completed the top 3 with a really fast implementation in the 250, but a slower one in the 500, and also 3 correct challenges.
</p>

<H1>
The Problems
</H1>
</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=6173&amp;rd=9819"
name="6173">IndicatorMotion</a></b>
</font>
<A href="Javascript:openProblemRating(6173)"><img src="/i/rate_it.gif"
hspace="10" border="0" alt="rate it" /></A>
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=505864"
CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss
it" border="0" /></A>
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
      373 / 499 (74.75%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      258 / 373 (69.17%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>filthy</b> for 249.63 points (1 mins 6 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      157.48 (for 258 correct submissions)
    </td>
  </tr>
</table></blockquote>
<p>
This problem was quite straightforward, but it needed to be programmed
carefully because all the bar transformations could be confusing. 
</p>
<p>

The idea was doing a simple simulation taking into account all that's said in the problem statement. <br/>
First you parsed the input string into pieces of 3 characters each, and this pieces in the instruction character (the first one) and the number (the last two). Depending on the language, there are several forms to do that easily enough.<br/>
After that, all that was needed was a function or method that given
the current state and the instruction to perform, gives you the next
state. This could be done with a bunch of "if"s or cases or having a precomputed table.
</p>
<p>

With this ready, initialize the return string with startState
and the actual state also, and the repeatedly apply the function for
each instruction the number of seconds given while appending the
resulting state to the result string.<br/>
The faster and cleaner way to implement the changing state function is
having a string with all the states in 'R' or 'L' order "-\\|/" for
example, and remembering the position of the current state. Then, each
instruction is moving a number of spaces in that string in circular
fashion (ie. doing the operations modulo 4). See below for Java code
with this idea.

<pre>
String sts="-\\|/";
//this is a good and fast to code way to map characters into consecutive integers
String instrs="SRFL"; //S=move 0, R=move 1, F=move 2, L=move -1=move 3
int ist=sts.indexOf(startState); //index of current state
StringBuffer r = new StringBuffer("" + startState); //result string
for(int k=0;k&lt;p.length()/3;k++) { //iterate instructions
 int v=Integer.parseInt(program.substring(3*k+1,3*k+3)); //times to repeat instruction
 int o=instrs.indexOf(program.charAt(3*k)); //it says how much to move in sts
 for(int j=0;j&lt;v;j++) {
   ist=(ist+o)%4; //execute instruction
   r.append(sts.charAt(ist)); //append result
 }
}
return r.toString();
</pre>
</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=6160&amp;rd=9819"
name="6160">FibonacciPositioning</a></b>
</font>
<A href="Javascript:openProblemRating(6160)"><img src="/i/rate_it.gif"
hspace="10" border="0" alt="rate it" /></A>
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=505864"
CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss
it" border="0" /></A>
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
      356 / 499 (71.34%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      296 / 356 (83.15%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>filthy</b> for 499.73 points (0 mins 40 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      378.60 (for 296 correct submissions)
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
      364 / 365 (99.73%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      347 / 364 (95.33%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>ACRush</b> for 248.17 points (2 mins 26 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      223.27 (for 347 correct submissions)
    </td>
  </tr>
</table></blockquote>
<p>
This problem can sound math-oriented and maybe difficult at first, but is truly a
quite simple simulation, so a bunch of coders of both divisions managed to solve it really quickly. Since fibonacci sequence has an exponencial explosion
(this you could know ahead or maybe have figured out trying a few
values), it is the fact that the maximum fibonacci number that is
important here has low index. More specifically, F<sub>40</sub> is
greater than the 10000000 upper bound for the input n.
</p>
<p>

Also, if looked carefully, the formula for the third case (when the
number was in the middle of two consecutive fibonacci's) also works
for the case that the number is an exact fibonacci number, because the
second part of the formula is either 0 if n is the lower bound used
(F<sub>i</sub>) or 1 if it is the upper bound (F<sub>i+1</sub>), so
you can use that formula for all the cases 
(if you start from F<sub>2</sub> to avoid 1 to be given position 1).
</p>
<p>
So, the solution to this problem is finding two consecutive fibonacci
numbers that have n between them and make the calculation as it was
presented in the problem statement. Start with 1 and 2 and iterate
over each subsequent pair of fibonacci numbers to find the interval,
and then let your language do the math. Java/C++ code follows:
<pre>
int a=1,b=2,i=2; //a and b are cosecutive fibonacci numbers, i is the index of a
while(n>b) { //n is outside [a,b] interval
 b=b+a; // a little trick to get next pair of fibonacci's without aux variable
 a=b-a; // since b here equals oldB+oldA, a = b-a = oldB+oldA-oldA = oldB
 i++;
}
return ((double)i)+((double)(n-a))/((double)(b-a));
</pre>
</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=6183&amp;rd=9819"
name="6183">IndicatorMotionDrawing</a></b>
</font>
<A href="Javascript:openProblemRating(6183)"><img src="/i/rate_it.gif"
hspace="10" border="0" alt="rate it" /></A>
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=505864"
CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss
it" border="0" /></A>
<br>
Used as: Division Two - Level Three: <blockquote><table
cellspacing="2">
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
      16 / 499 (3.21%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      0 / 16 (0.00%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>null</b> for null points (NONE)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      No correct submissions
    </td>
  </tr>
</table></blockquote>
<p>
This problem was really difficult for division 2, and that was reflected in the fact that no coder was able to solve it properly (only one submission made it through challenge phase, but failed to pass the system tests).
When seeing that you have to move around the screen, you can
immediatly think that this is a labyrinth problem, but if you look
carefully at example 2, you see that you may need to go back, so it's
not a standard labyrinth problem anyhow.<br/>
The first thing to notice are the constraints. 
Since the input field can contain at most 3 * 4 = 12 characters, an 
exponential idea should come directly to your head.</p>
<p>
We can say that the entire state of the screen can be
represented with 12 state variables of 5 values each (space and the
four bar states) and 2 variables r and c with 3 and 4 possible values, respectively, for the current position of the bar. This gives a
total of 5<sup>12</sup>x3x4 = 2929687500 which seems a little too much, but it didn't stopped a couple of coders from trying this approach.
</p>
<p>
But thinking a little more you could realize that, with exception of the actual position, you don't care about the other places state. If it is not in it's correct state
(ie. the one in desiredScreen), we <b>must</b> pass through it again, so
the current state of the cell does not really matter. 
So what we should keep in each state is whether
each square is in the desired state already, the current state of the bar
and its position (row and column). This gives us a total of (2<sup>12</sup>)x4x3x4 = 196608
states. This is much smaller than the previous estimation and can be processed.
</p>
<p>
Then we have to connect each state with the ones we can arrive from
it in one instruction, to get a graph in which we can simply run a BFS. This can be done
by carefully simulating each one of the 7 instructions and setting the
state of the current position to 0 or 1 depending on whether we got it to
the desired state or not. The initiating state will have 1 in the
positions where there are spaces in desiredStates and 0 in the rest,
with the exception of (0,0) that will have 0 or 1 depending on whether
startState and the first character in the first element of
desiredScreen are equal or not.
</p>
<p>
To make the implementation easier we can complete smaller screens with
spaces and work always with a 3 by 4 screen.
Also, you can notice that any bar state can be reached from any other bar state
sing only one of the instructions.
Therefore, you don't need to care about exact instructions, 
and can either just change your bar to whatever you want or move it in any direction.
</p>
<p>
Java implementation follows:
<pre>
private int setBit(int n, int p, int v) {
   return (n & ~(1&lt;&lt;p)) | (v&lt;&lt;p);
}
private class state {
   public int x,y,p,s;
}
private static int all = (1&lt;&lt;12)-1;
private int memo [][][][];
private boolean isFinal(state s) {
   return s.p==all;
}
//first 4 are movements, the other 4 are the changing state
//we are adding the possibility of changing to the actual state, but
//this doesn't change because it is
//never usefull to do it
private static int dx[]={0,0,1,-1,0,0,0,0};
private static int dy[]={1,-1,0,0,0,0,0,0};
private static int fs[]={0,0,0,0,1,2,3,4};  
//0 means remain in current state (when moving), the other are the next states

public int getMinSteps(String[] dS, char startState) {
   Queue&lt;state&gt; q = new LinkedList&lt;state&gt;();
   String barStates=" /|\\-";
   state start=new state();
   start.x=start.y=start.p=0;
   start.s=barStates.indexOf(startState);
   int [][] ds=new int[3][4];
   for(int i=0;i&lt;dS.length;i++)for(int j=0;j&lt;dS[i].length();j++)
ds[i][j]=barStates.indexOf(dS[i].charAt(j));
   for(int i=0;i&lt;3;i++)for(int j=0;j&lt;4;j++) if (ds[i][j]==0)
start.p=setBit(start.p,i*4+j,1);
   start.p=setBit(start.p, start.x*4+start.y,
(ds[start.x][start.y]==start.s)?1:0);
   memo = new int[3][4][all+1][5];
   memo[start.x][start.y][start.p][start.s]=1;
   q.offer(start);
   while(!q.isEmpty()) {
       state s=q.poll();
       int a=memo[s.x][s.y][s.p][s.s];
       if (isFinal(s)) return a-1;
       for(int d=0;d&lt;dx.length;d++) {
           state ns=new state();
           ns.x=s.x+dx[d];
           ns.y=s.y+dy[d];
           ns.s=fs[d];
           if (ns.s==0) ns.s=s.s;
           if (ns.x&lt;0||ns.x&gt;2||ns.y&lt;0||ns.y&gt;3) continue;
           ns.p=setBit(s.p, ns.x*4+ns.y, (ds[ns.x][ns.y]==ns.s)?1:0);
           if (memo[ns.x][ns.y][ns.p][ns.s]==0) {
               memo[ns.x][ns.y][ns.p][ns.s]=a+1;
               q.offer(ns);
           }
       }
   }
   return -1;
}
</pre>
</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=6157&amp;rd=9819"
name="6157">OrderDoesMatter</a></b>
</font>
<A href="Javascript:openProblemRating(6157)"><img src="/i/rate_it.gif"
hspace="10" border="0" alt="rate it" /></A>
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=505864"
CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss
it" border="0" /></A>
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
      236 / 365 (64.66%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      72 / 236 (30.51%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>ACRush</b> for 463.10 points (8 mins 8 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      302.50 (for 72 correct submissions)
    </td>
  </tr>
</table></blockquote>
<p>
Even though there can be at most 50 matrices, it is clear that trying all the possible orderings it's
not the way to go, even if you try to use backtracking to cut some parts.
</p>
<p>
The best way to think about the problem is to start from the end of the problem statement: 
when is it even possible to achieve such an ordering?
</p>
<p>
If we try to construct the sequence by appending a suitable matrix to the right side of the current order, 
each appending operation only changes the number of columns of the result of the constructed prefix from one number 
(that have to be the number of rows of the appended matrix) to another (the number of columns of the new matrix). 
The number of rows will never change and is equal to the number of rows of the very first matrix used.
</p>
<p>
Thus we can reword the problem in terms of graph theory.
Think of a graph with nodes representing integers between 1 and 1000, 
and with directed edges representing the matrices from the input (an AxB matrix maps to an edge from A to B). 
This graph can contain loops (edges from one node to itself, representing square matrices) and multiple edges between the same pair of nodes (several equal size matrices). 
The problem asks us to find a path which goes through each edge (i.e., uses each matrix)
exactly once.
The resulting matrix's size can be computed multiplicating the values of the starting and ending nodes of the path.
</p>
<p>
The path we described above is known as Eulerian path in a graph. 
Graphs which allow the construction of Eulerian cycles are called Eulerian graphs. 
<a href="/?t=sponsor&c=link&link=http://en.wikipedia.org/wiki/Leonhard_Euler">Euler</a> observed that a necessary condition 
for the existence of an Eulerian path is that all but two vertices in the graph have a <i>degree</i> of 0.
The two other nodes must either have <i>degrees</i> of 1 and -1, or both of 0. 
A <i>degree</i> of a node can be computed as the difference
between the number of edges coming to this node (<i>in-degree</i>) and the number of edges outgoing from the node (<i>out-degree</i>).

This is because all but the starting and ending nodes of the
path will be entered and left the same number of times, the starting node will be left once more than it is entered (vice versa for then ending node). 
If all nodes have <i>degree</i> of 0, we can go through each edge exactly once starting and ending at the same node. 
Also, we need the underlying undirected graph to be connected (to be able to reach every node in the same path).
The Euler theorem states that these two conditions are enough for the path to exist 
(read more about Eulerian paths and cycles <a href="/?t=sponsor&c=link&link=http://mathworld.wolfram.com/EulerianGraph.html">here</a>).
</p>
<p>
Since we already can determine the cases where no Eulerian path exists, lets look at the second part of the problem.
We need to find the maximal number of elements the resulting matrix can contain.
If there are nodes A and B which <i>degrees</i> are 1 and -1, these two <b>must</b> be the start and the end of the path.
In this case the resulting matrix will contain A * B elements.
</p>
<p>
Otherwise, if every node has a degree of 0, this an Eulerian cycle exists. 
In other words, the path will start and end at the same node, and any node from the cycle can be chosen as the start.
Therefore, we find the maximal node A in the cycle, and the largest resulting matrix will contain A * A elements.
(because the result will be an AxA matrix).  
</p>
<p>
For a clean implementation see misof's  <a href="/stat?c=problem_solution&rm=248275&rd=9819&pm=6157&cr=8357090">solution</a>.
</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=6158&amp;rd=9819"
name="6158">CountingCommonSubsequences</a></b>
</font>
<A href="Javascript:openProblemRating(6158)"><img src="/i/rate_it.gif"
hspace="10" border="0" alt="rate it" /></A>
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=505864"
CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss
it" border="0" /></A>
<br>
Used as: Division One - Level Three: <blockquote><table
cellspacing="2">
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
      60 / 365 (16.44%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      50 / 60 (83.33%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>Crush</b> for 933.33 points (7 mins 42 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      634.45 (for 50 correct submissions)
    </td>
  </tr>
</table></blockquote>
<p>
As many counting problems, this one cries to be solved with dynamic
programming. 
In this case, things become easier if we find a recursive function and then memorize the results
instead of thinking directly in traditional DP iterative implementation.
</p>
<p>

First, lets define the function f(<b>i</b>,<b>j</b>,<b>k</b>) as the number of common
subsequences (including the empty one) that the strings <b>s</b>, <b>t</b> and <b>u</b>
have, where <b>s</b> is <b>a</b> but starting from the character <b>i</b>, and similarly
with <b>t</b>, <b>j</b> and <b>b</b>, and <b>u</b>, <b>k</b> and <b>c</b>.
</p>
<p>

It's clear now that f(0,0,0)-1 is the answer for the problem, because
it's the same number minus one for the empty sequence.<br/>
For arbitrary <b>i</b>,<b>j</b> and <b>k</b>, the subsequences counted in f(<b>i</b>,<b>j</b>,<b>k</b>) are either the empty sequence or starts with a lowercase letter, so we can sat that f(<b>i</b>,<b>j</b>,<b>k</b>) = 1 + g(<b>i</b>,<b>j</b>,<b>k</b>,'a') + g(<b>i</b>,<b>j</b>,<b>k</b>,'b') + ... + g(<b>i</b>,<b>j</b>,<b>k</b>,'z'), 
where g(<b>i</b>,<b>j</b>,<b>k</b>,<b>l</b>) is the function that counts the number of subsequences that start with the letter <b>l</b> and <b>i</b>, <b>j</b> and <b>k</b> represent the same as in f.<br/>
We can note then that g(<b>i</b>,<b>j</b>,<b>k</b>,<b>l</b>) = f(<b>i'</b>,<b>j'</b>,<b>k'</b>) where <b>i'</b>, <b>j'</b> and <b>k'</b> are the next occurence of the letter <b>l</b> after <b>i</b>, <b>j</b> and <b>k</b> respectively (we use that <b>l</b> and continue with following existent subsequences). 
If there isn't such <b>i'</b>, <b>j'</b> or <b>k'</b>, then clearly g(<b>i</b>,<b>j</b>,<b>k</b>,<b>l</b>) = 0.
</p>
<p>

Since g can be "built in" f with a simple for to iterate over all
possible <b>l</b>'s, in f there is a perfectly recursive especification of the problem.
</p>
<p>

Also, we can remember the results for f in a 50x50x50 matrix (the possible values for <b>i'</b>, <b>j'</b> and <b>k'</b>),
and the number of operations is in the order of 50x50x50x26x150 (in
each position we do a 26 loops, once for each character and 3 searches
for the character in each of the strings, with each search bounded with 50
character comparissons), this should work fine.<br/>
Actually the order of the number of operations gives 487500000 which is a little tight, 
but is acceptable as an upper bound taking into account that there are a lot of <b>i'</b>,<b>j'</b>,<b>k'</b> combinations that are never used (only 0,0,0 and the ones where <b>i</b>-1, <b>j</b>-1 and <b>k</b>-1 character is the same are actually visited) and that the
actual search for a character in the string is not always 50.<br/>
Is possible to establish much more tight bounds to this problem with a
more precise analysis on the frequency of each character in the input and the relationship between the length of the search part and the number of visited <b>i'</b>,<b>j'</b>,<b>k'</b> combinations, but with this we should convince ourselves that the idea works in
time.<br/>
A short implementation of method f without the memo part follows:
<pre>
String a,b,c; //the input strings
long f(int i, int j, int k) {
 long r = 1;
 for (char l='a'; l&lt;='z'; l++) {
  int npa = a.indexOf(l, i), 
   npb = b.indexOf(l, j),
   npc = c.indexOf(l, k);
  if (npa &gt;= 0 && npb &gt;= 0 && npc &gt;= 0) //they all exist
   r += ccs(npa+1, npb+1, npc+1) ;
  }
 return r ;
}
</pre>
For an iterative, fastly coded implementation, see gawry's <a href="/stat?c=problem_solution&rm=248282&rd=9819&pm=6158&cr=7390224">code</a>.
</p><div class="authorPhoto">
    <img src="/i/m/soul-net_big.jpg" alt="Author" />
</div>
<div class="authorText">
  By&#160;<tc-webtag:handle coderId="15231364" context="algorithm"/><br />
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
