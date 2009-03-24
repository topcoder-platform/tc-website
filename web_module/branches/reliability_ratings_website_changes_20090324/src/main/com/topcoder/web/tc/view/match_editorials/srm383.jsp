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
<%-- Left Column Begins--%>
   <td width="180" id="onLeft">
      <jsp:include page="/includes/global_left.jsp">
         <jsp:param name="node" value="algo_match_editorials"/>
      </jsp:include>
   </td>
<%-- Left Column Ends --%>

<%-- Center Column Begins --%>
<td class="statTableSpacer" width="100%" valign="top">
<div class="bodyText">
<jsp:include page="../page_title.jsp" >
<jsp:param name="image" value="statistics_w"/>
<jsp:param name="title" value="Match Editorial"/>
</jsp:include>

<div class="linkBox">
    <A href="/tc?module=Static&d1=match_editorials&d2=archive">Archive</A><br />
    <span id="printableLink"><A href="Javascript:makeInvisible();">Printable view</A><br /></span>
    <span id="navigableLink" class="invisible"><A href="Javascript:makeNavigable();">Normal view</A><br /></span>
    <A href="/stat?c=round_overview&er=5&rd=10806">Match Overview</A><br />
    <tc-webtag:forumLink forumID="516080" message="Discuss this match" />
</div>
<span class="bodySubtitle">SRM 383</span><br />Thursday, December 13, 2007
<br /><br />



<h2>Match summary</h2> 

 

<p> 
SRM 383 came a mere 38 hours after the previous SRM, giving coders barely enough time to finish working through the problems in the practice room before being back in the arena for another match. Nevertheless, 924 competitors showed up for the main event, with another 74 competing in the TopCoder College Tour.</p>
<p>
In Division 1, coders were greeted by an easy problem which was perhaps more straightforward than has been the case in recent matches. However, there were a few pitfalls to watch out for and a couple of tricky cases that weren't covered in the examples. A dynamic programming problem was next up for the medium, while the evil hard problem only tempted 2 coders to submit solutions.
</p>
<p>
The top-ranked coders brushed off the first two problems in no time, which lead to a number of very close scores going into the challenge phase. While <tc-webtag:handle coderId="10574855" context="algorithm"/>'s position at the top of the division looked unassailable, few points separated the next 20 positions. There was a particularly interesting battle between <tc-webtag:handle coderId="7340263" context="algorithm"/> and <tc-webtag:handle coderId="7442498" context="algorithm"/>, who were competing in the same room and had entered the challenge phase separated by less than a point. The system tests confirmed that <tc-webtag:handle coderId="10574855" context="algorithm"/>'s hard solution was correct and it cemented his 34th SRM win. <tc-webtag:handle coderId="7340263" context="algorithm"/> had powered through the challenge phase, taking 175 points to take second position, while <tc-webtag:handle coderId="7442498" context="algorithm"/> took the bronze medal.
</p>
<p>In division 2, the challenge phase was somewhat less exciting, with none of the eventual top 5 gaining or losing any points. Newcomer <tc-webtag:handle coderId="22703762" context="algorithm"/> lead from the start and won the division, while <tc-webtag:handle coderId="22696894" context="algorithm"/> took second and <tc-webtag:handle coderId="22675930" context="algorithm"/> took third.
<H1> 

The Problems 

</H1>

</p> 

 

<font size="+2"> 

<b><a href="/stat?c=problem_statement&amp;pm=8398&amp;rd=10806" name="8398">FloorLayout</a></b> 

</font> 

<A href="Javascript:openProblemRating(8398)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=516080" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

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

      388 / 455 (85.27%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Success Rate</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      359 / 388 (92.53%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>High Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      <b>tollek</b> for 245.41 points (3 mins 54 secs) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Average Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      190.88 (for 359 correct submissions) 

    </td> 

  </tr> 

</table></blockquote> 

<p>
This problem simply required you to count the number of boards in the image. The trick was to scan over the whole image counting squares, but making sure that each board is only counted once. There were several ways to do this: some coders erased the entire floorboard as it was counted the first time; others only counted one end of each board, by checking if the previous square was also part of the same board.
</p>
<p>
C++ code implementing the second method follows. 
</p>
<p>
<pre>
class FloorLayout{
public:
  int countBoards(vector &lt;string&gt; layout){
    int count = 0;
    for (int i=0;i&lt;layout.size();i++)
      for (int j=0;j&lt;layout[i].size();j++)
        if (layout[i][j] == '-'){
          if (j==0 || layout[i][j-1]=='|') count++;
        } else {
          if (i==0 || layout[i-1][j]=='-') count++;
        }
    return count;
  }
};
</pre>
</p>

<font size="+2"> 

<b><a href="/stat?c=problem_statement&amp;pm=8396&amp;rd=10806" name="8396">Planks</a></b> 

</font> 

<A href="Javascript:openProblemRating(8396)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=516080" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

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

      285 / 455 (62.64%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Success Rate</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      123 / 285 (43.16%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>High Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      <b>ygge</b> for 462.61 points (8 mins 12 secs) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Average Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      322.44 (for 123 correct submissions) 

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

      465 / 469 (99.15%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Success Rate</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      372 / 465 (80.00%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>High Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      <b>bmerry</b> for 246.77 points (3 mins 15 secs) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Average Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      199.45 (for 372 correct submissions) 

    </td> 

  </tr> 

</table></blockquote> 

<p>
This problem was on the easy side for the Div I easy/Div II medium, but nevertheless had a couple of "gotchas" to catch out unwary coders. The basic strategy was to try every possible final length and see how much money we could make by cutting planks to that length. Consider cutting the planks to a common length of L. The number of new planks we can obtain from the plank with index <tt>i</tt> is given by integer division <tt>lengths[i] / L</tt>. The number of cuts is given by <tt>(lengths[i] - 1) / L</tt>. This was the first place where coders could slip up as only the last example contained a case where a board was an exact multiple of the optimal length (which is the only time that the number of new planks differs from the number of cuts).
</p>
<p>
Next we have to work out the maximum amount of money we can make at a given length. For a single plank, this is clearly <pre>(L * number of new planks * woodValue) - (number of cuts * costPerCut).</pre> However, it is important to notice that if this value is negative, then we should throw the board away instead. Many solutions failed because they cut as many smaller planks as possible at a given length, regardless of whether it was profitable to do so or not. Again, the last example gave a significant hint that this might be an issue, but didn't make the solution completely obvious.
</p>
<p>
We can then simply take the length that gives the best profit and return that value. C++ code follows.
</p>
<p>
<pre>
class Planks{
public:
  int makeSimilar(vector &lt;int&gt; lengths,int costPerCut,int woodValue){
    int bestProfit = 0;
    for (int newLength = 1;newLength &lt;= 10000;newLength++){
      int profit = 0;
      for (int i=0;i&lt;lengths.size();i++){
        int newPlanks = lengths[i] / newLength;
        int cuts = (lengths[i] - 1) / newLength;
        if (newPlanks * newLength * woodValue &gt; cuts * costPerCut)
          profit += newPlanks * newLength * woodValue - cuts * costPerCut;
      }
      bestProfit = max(bestProfit,profit);
    }
    return bestProfit;
  }
};
</pre>
</p>

 

<font size="+2"> 

<b><a href="/stat?c=problem_statement&amp;pm=8383&amp;rd=10806" name="8383">HillWalker</a></b> 

</font> 

<A href="Javascript:openProblemRating(8383)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=516080" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

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

      30 / 455 (6.59%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Success Rate</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      13 / 30 (43.33%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>High Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      <b>thocev5</b> for 683.71 points (21 mins 32 secs) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Average Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      501.34 (for 13 correct submissions) 

    </td> 

  </tr> 

</table></blockquote> 

<p>

This problem was simply a case of scanning over the supplied map and returning the highest point that we could reach. We can work out easily if we can reach a point on the walk, by checking if sum of minimum time to reach that point from the hotel and the minimum time to get back to the hotel is less than or equal to the amount of time we have for the walk. These minimum times can be calculated for all points using Dijkstra's algorithm.
</p><p>
Note that both the shortest path out and the shortest path back from all points can both be calculate using (0, 0) as the source: to get the return time, just swap the edge direction.
</p>
<p>
<pre>
int di[] = {-1,0,1,0};
int dj[] = {0,-1,0,1};

// Utility class to use with our priority queue
struct state{
  int i,j,T;
  state(int i, int j, int T) : i(i), j(j), T(T) {};
  bool operator&lt;(const state &other) const {
    return T &gt; other.T; // Note the reversal, to get the smallest element
  }
};

class HillWalker{
public:
  int highestPoint(vector &lt;string&gt; landscape,int threshold,int timeToDark){

    int N = landscape.size(), M = landscape[0].size();
    vector &lt;vector &lt;int&gt; &gt; ht(N, vector &lt;int&gt; (M) );

    // First parse the map to a more useful format
    for ( int i=0 ; i&lt;N ; i++ )
      for ( int j=0 ; j&lt;M ; j++ )
        if (landscape[i][j] &lt; 'a')
          ht[i][j] = landscape[i][j] - 'A';
        else
          ht[i][j] = landscape[i][j] - 'a' + 26;

    // out and back will store the shortest paths;
    vector &lt;vector &lt;int&gt; &gt; out(N, vector &lt;int&gt; (M,-1) );
    vector &lt;vector &lt;int&gt; &gt; back(N, vector &lt;int&gt; (M,-1) );

    priority_queue &lt;state&gt; Q;

    // Do Dijkstra for the way out
    Q.push( state(0,0,0) );
    while ( !Q.empty() ){
      int i = Q.top().i;
      int j = Q.top().j;
      int T = Q.top().T;
      Q.pop();
      if (out[i][j]!=-1)
        continue;
      out[i][j] = T;
      for ( int k=0 ; k&lt;4 ; k++ ){
        int ni = i + di[k], nj = j + dj[k];
        if ( ni&lt;0 || nj&lt;0 || ni&gt;=N || nj&gt;=M )
          continue;
        if ( abs(ht[ni][nj] - ht[i][j]) &lt;= threshold )
          Q.push( state(ni, nj, T + time(ht[i][j], ht[ni][nj]) ) );
      }
    }
      
    // Now do Dijkstra for the way back
    Q.push( state(0,0,0) );
    while ( !Q.empty() ){
      int i = Q.top().i;
      int j = Q.top().j;
      int T = Q.top().T;
      Q.pop();
      if (back[i][j]!=-1)
        continue;
      back[i][j] = T;
      for ( int k=0 ; k&lt;4 ; k++ ){
        int ni = i + di[k], nj = j + dj[k];
        if ( ni&lt;0 || nj&lt;0 || ni&gt;=N || nj&gt;=M )
          continue;
        if ( abs(ht[ni][nj] - ht[i][j]) &lt;= threshold )
          Q.push( state(ni, nj, T + time(ht[ni][nj], ht[i][j]) ) );
      }
    }

    // Now find the highest reachable point
    int best = 0;
    for ( int i=0 ; i&lt;N ; i++)
      for ( int j=0 ; j&lt;M ; j++)
        if ( out[i][j]&gt;-1 && back[i][j]&gt;-1 && out[i][j]+back[i][j]&lt;=timeToDark )
          best = max( best, ht[i][j] );

    return best; 
  }

  int time(int from,int to){
    if (to &lt;= from) return 1;
    return (to - from) * (to - from);
  }
};
</pre></p>
 

<font size="+2"> 

<b><a href="/stat?c=problem_statement&amp;pm=8397&amp;rd=10806" name="8397">FloorBoards</a></b> 

</font> 

<A href="Javascript:openProblemRating(8397)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=516080" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

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

      244 / 469 (52.03%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Success Rate</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      117 / 244 (47.95%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>High Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      <b>vlad89</b> for 462.92 points (8 mins 10 secs) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Average Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      299.28 (for 117 correct submissions) 

    </td> 

  </tr> 

</table></blockquote> 

<p>

Experienced TopCoders will have seen the small constraints for this problem and immediately have started thinking of solutions that are exponential in one of the dimensions. This is indeed the way to proceed. Split the layout in two with a horizontal line, and consider the case where the upper part above has been completed and we need to work out how to complete the lower part to minimize the number of boards. This number of new boards in the lower part is of course the number of new boards considering it in isolation minus the number of those boards that are continuations of boards from the upper part. However, the number of boards that continuous between the two sections only depends on the state of the bottom row of the upper part. We can therefore construct a dynamic programming solution, memoizing on how much of the board we've already completed and the state of the bottom row.
</p><p>
There are several ways that coders could approach dividing the board. Coders could either step square by square in row-major order or step row by row. A recursive C++ solution considering the squares in row-major order is given below. The state is given by the i and j indices of the next square we're considering and a bitmask giving the state of the bottom row (bit k is set if the bottom square in column k is a vertical board and not set otherwise).
</p><p>
<pre>
int mem[1 &lt;&lt 12][12][12];

class FloorBoards{
public:
  int layout(vector &lt;string&gt; room){
    memset(mem,-1,sizeof(mem));
    int ret = rec(0, 0, 0, room, room.size(), room[0].size());
    return ret;
  }
  
  int rec(int i, int j, int bm, const vector &lt;string&gt; &r, int N, int M){
    if ( i==N ) return 0;
    if (mem[bm][j][i] &gt; -1) return mem[bm][j][i];

    // If the current square is blocked, just keep recursing
    if (r[i][j] == '#') return rec( i+(j+1)/M, (j+1)%M, bm&~(1&lt;&lt;j), r, N, M );

    // Try adding a vertical board in the current square
    int vertical = rec( i+(j+1)/M, (j+1)%M, bm | (1&lt;&lt;j), r, N, M );
    // If the square above is not also vertical, this is a new board
    if ( (bm & 1&lt;&lt;j) == 0 )
      vertical++;
    
    // Try adding a horizontal board
    int horizontal = rec( i+(j+1)/M, (j+1)%M, bm&~(1&lt;&lt;j),  r, N, M );
    // If the previous square is not also horizontal, this is a new board
    if ( j==0 || r[i][j-1]=='#' || (bm & 1&lt;&lt;(j-1))!=0 )
      horizontal++;
      
    return mem[bm][j][i] = min(vertical, horizontal);        
  }
};
</pre>;
</p>

<font size="+2"> 

<b><a href="/stat?c=problem_statement&amp;pm=8275&amp;rd=10806" name="8275">PyramidPuzzle</a></b> 

</font> 

<A href="Javascript:openProblemRating(8275)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=516080" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

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

      2 / 469 (0.43%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Success Rate</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      1 / 2 (50.00%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>High Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Petr</b> for 464.35 points (42 mins 49 secs) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Average Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      464.35 (for 1 correct submission) 

    </td> 

  </tr> 

</table></blockquote> 

<p>
A last-minute testing issue with the original division 1 hard problem lead to this backup problem from <tc-webtag:handle coderId="8357090" context="algorithm"/> being used instead. While it is conceptually not too hard to see the solution here, the implementation is tricky to say the least and the problem elicited just two solutions with only a single one surviving the contest.
</p><p>
The overall effect of the set of tranformations that Juliet applies to the puzzle is to leave all the triangles in some permutation of their original positions. The question then asks what is the minimum number of times this set of transformations would have to be applied to return the shape to its original state. This is the same as asking for the minumum number of times we have to apply the permutation to itself before we reach the identity transformation.
</p><p>
This has been the theme of previous TopCoder problems such as <a href="/tc?module=Static&d1=match_editorials&d2=tco06_online_rd_1#6052">NumPermutationOrders</a> from TCO06 Round 1. The answer is in the cycle structure of the permutation and is given by the least common multiple of the cycle lengths. So, all we have to do is to work through the transformations to determine the permutation, find all its cycles, then determine their LCM modulo 987654319. It sounds easy, but actually calculating the transformations is almost impossibly fiddly.
</p><p>
The trick here is to work out a good order to store all the triangle positions and build of the transformations from simpler ones, such as swapping and rotating individual faces. For an example written during the competition, see <a href="/stat?c=problem_solution&rm=267714&rd=10806&pm=8275&cr=10574855"><tc-webtag:handle coderId="10574855" context="algorithm"/>'s code</a>.
</p><p>
Calculating the LCM of the cycle lengths mod 987654319 is easiest done by factorizing all the cycle lengths. A minimal set of factors that 
contains all the cycle length factorizations as subsets can then be determined greedily and these factors can be multiplied mod 987654319. It turns out that this is actually unnecessary, as the numbers don't tend to grow very large anyway and none of the system tests actually cause the modulus to come into play.
</p>

<br /><br />


<div class="authorPhoto">
    <img src="/i/m/StevieT_big2.jpg" alt="Author" />
</div>
<div class="authorText">
    By&#160;<tc-webtag:handle coderId="21911760" context="algorithm"/><br />
    <em>TopCoder Member</em>
</div>


</div>
</td>
<%-- Center Column Ends --%>

<%-- Right Column Begins --%>
   <td width="170" id="onRight">
  <jsp:include page="../public_right.jsp">
   <jsp:param name="level1" value="default"/>
  </jsp:include>
   </td>
<%-- Right Column Ends --%>

<%-- Gutter --%>
   <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<%-- Gutter Ends --%>
  </tr>
</table>

<div id="onBottom">
<jsp:include page="../foot.jsp" />
</div>

</body>

</html>
