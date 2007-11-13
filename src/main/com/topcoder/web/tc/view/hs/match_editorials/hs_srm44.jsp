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
    <A href="/tc?module=HSRoundOverview&rd=10795&snid=2&er=5">Match Overview</A><br />

<tc-webtag:forumLink forumID="516570" message="Discuss this match" /></div>
<span class="bodySubtitle">TCHS SRM 44</span><br />Saturday, November 10, 2007
<br /><br />


<h2>Match summary</h2>

 

<p>

This match saw 80 coders, 11 of them newcomers. Coders were faced with an easy problem set - 13 of them solved correctly 
all three problems. Some implementations of the easy problem should have covered border case, but didn't which resulted in successful 
challenges and failed system tests. After the easy problem, most of coders stepped onto the medimum one, where 
<tc-webtag:handle coderId="14767863" context="algorithm"/> very soon came up with sorrect solution. It seems 
some coders took the hard problem too lightly, which resulted in several resubmits 
(<tc-webtag:handle coderId="12005484" context="algorithm"/> had to resubmit twice).<br /><br />
Thanks to fast solutions for all problems and two successful challenges 
<tc-webtag:handle coderId="22285847" context="algorithm"/> won the match, followed by 
<tc-webtag:handle coderId="22663117" context="algorithm"/> who submited the hard problem a bit slower 
and finished the challenge phase without extra points. Thanks to successful challenges, 
<tc-webtag:handle coderId="15604398" context="algorithm"/> beat 
<tc-webtag:handle coderId="11972352" context="algorithm"/>, took third place and became red.

</p>

 

<H1>

The Problems

</H1>

</p>

 

<font size="+2">

<b><a href="/stat?c=problem_statement&amp;pm=8252&amp;rd=10795" name="8252">YoungBrother</a></b>

</font>

<A href="Javascript:openProblemRating(8252)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A>

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=516570" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

<br />

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

      70 / 80 (87.50%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Success Rate</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      55 / 70 (78.57%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>High Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      <b>neal_wu</b> for 249.48 points (1 mins 18 secs)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Average Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      219.21 (for 55 correct submissions)

    </td>

  </tr>

</table></blockquote>

<p>

        <p>
            Like problem statement says, John's brother can perform two operations: add new line and delete new line. We will 
            label those with &lt;enter&gt; and &lt;backspace&gt;. Let's see what happens with chars when brother presses something.<br />
            <br />
            Suppose text in the editor is<br />
            <code>{"abc", "defg"}</code><br />
            In the first case, after brother's actions, it could be<br />
            <code>{"abc", "d&lt;enter&gt;efg"}</code>    which is equal to <code>{"abc", "d", "efg"}</code><br />
            or in the second case<br />
            <code>{"abc", "&lt;backspace&gt;defg"}</code>    which is equal to <code>{"abcdefg"}</code>.<br />
        John's brother hasn't deleted any chars, so there are same chars after his actions.
        It is obvious (and the most important part of the solution) that chars don't change order (if char x was before y in original
        text, it will always remain before y, in every editor state). If you put all chars in one line,
        no matter how many times brother pressed &lt;enter&gt; or &lt;backspace&gt; (even zero times), that line
        will always be same. So, concatenate all <type>String</type>s from <b>lines</b> to get only one
        line. Then take <b>k</b> by <b>k</b> <type>char</type>s (you will do that <b>n</b> times) to get 
        exactly same text which was before John's young brother started to play with text. Following solution in Java:
<pre><code>    <font color="#008080">// concat all strings in <b>lines</b></font>
    <font color="#FF0000">String</font> ssum = <font color="#0000FF">new</font> <font color="#FF0000">String</font>("");
    <font color="#0000FF">for</font> (<font color="#0000FF">int</font> i = <font color="#FF0000">0</font>; i &lt; lines.<font color="#0000FF">length</font>; i++)
        ssum += lines[i];
    
    <font color="#FF0000">String</font>[] ret = <font color="#0000FF">new</font> <font color="#FF0000">String</font>[n];
    <font color="#008080">// take substring of length k and add into result</font>
    <font color="#0000FF">for</font> (<font color="#0000FF">int</font> i = <font color="#FF0000">0</font>; i &lt; n; i++){
        ret[i] = ssum.substring(<font color="#FF0000">0</font>, k);
        ssum = ssum.substring(k);
    }
    <font color="#0000FF">return</font> ret;
        </code></pre>

        </p>
    This problem didn't involve any knowledge about algorithms and was pretty straighforward, but some coders
    trapped with a test cases like <code><b>lines</b> = {"", "", ""}, <b>n</b> = 10, <b>k</b> = 0</code> is. 
    For a nice and clean implementation you can see <tc-webtag:handle coderId="22693941" context="algorithm"/>'s
    <a href="/tc?module=HSProblemSolution&cr=22693941&rd=10795&pm=8252">code</a>.

</p>

 

<font size="+2">

<b><a href="/stat?c=problem_statement&amp;pm=8250&amp;rd=10795" name="8250">DriveCar</a></b>

</font>

<A href="Javascript:openProblemRating(8250)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A>

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=516570" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

<br />

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

      59 / 80 (73.75%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Success Rate</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      39 / 59 (66.10%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>High Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      <b>mirosuaf</b> for 497.17 points (2 mins 8 secs)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Average Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      381.34 (for 39 correct submissions)

    </td>

  </tr>

</table></blockquote>

<p>

        <p>
            I will describe two ways of solving this task.<br />
            <p>
                <b>First approach:</b><br />
                During each turn, car can step only closer to the end of the road, so minimum number of changing lanes depends only 
                on steps done over cells which are closer to start (named cells with lower index). Let <code>DP[i][j]</code> be a
                minimum number of changing lanes driving the car from start position to i-th cell of j-th lane (0-based). If i-th cell
                of j-th lane contains an obstacle, set <code>DP[i][j]</code> to <code>infinity</code>.
                Then you can define recurrent relation:<br />
                <code>DP[i][j] = min(DP[i][j], DP[i - 1][j])</code> - car keeps driving on same lane<br />
                <code>DP[i][j] = min(DP[i][j], DP[i - 1][j + 1] + 1)</code> - car turned right on the last lane. Of course, this
                is possible only if <code>j</code> represents lane 0 or 1<br />
                <code>DP[i][j] = min(DP[i][j], DP[i - 1][j - 1] + 1)</code> - car turned left on the last lane. This
                is possible only if <code>j</code> represents lane 1 or 2<br /><br />
                Process three by three cells, starting from the leftmost ones. You should only handle all three cells at position 0, what
                is actually initial state.
                Car starts from second lane at position 0 -    initialize <code>DP[0][1]</code> to zero because car didn't make any 
                lane changes. Cells at position 0 in first and third lane are not reachable, so they shouldn't be processed - you can just
                set <code>DP[0][0] = DP[0][2] = infinity</code>. According
                to recurrent relation, proceed to cells with greater index, but be careful, don't make car crash - don't drive car out of
                the road and watch out about obstacles. Following solution in Java:<pre><code>
    <font color="#0000FF">int</font> n = road[<font color="#FF0000">0</font>].<font color="#0000FF">length</font>();
    <font color="#0000FF">int</font>[][] dp = new <font color="#0000FF">int</font>[n][road.<font color="#0000FF">length</font>];
    <font color="#0000FF">int</font> inf = <font color="#FF0000">1</font> &lt;&lt; <font color="#FF0000">30</font>;
    for (<font color="#0000FF">int</font> i = <font color="#FF0000">0</font>; i &lt; n; i++)
        for (<font color="#0000FF">int</font> j = <font color="#FF0000">0</font>; j &lt; <font color="#FF0000">3</font>; j++)
            dp[i][j] = inf;
    dp[<font color="#FF0000">0</font>][<font color="#FF0000">1</font>] = <font color="#FF0000">0</font>;
    for (<font color="#0000FF">int</font> i = <font color="#FF0000">1</font>; i &lt; n; i++)
        for (<font color="#0000FF">int</font> j = <font color="#FF0000">0</font>; j &lt; <font color="#FF0000">3</font>; j++)
            <font color="#0000FF">if</font> (road[j].charAt(i) == '.'){
                <font color="#008080">// car can continue driving on the same lane</font>
                dp[i][j] = dp[i - <font color="#FF0000">1</font>][j];
                <font color="#008080">// car can go right</font>
                <font color="#0000FF">if</font> (validPlace(j + <font color="#FF0000">1</font>))
                    dp[i][j] = <font color="#FF0000">Math</font>.min(dp[i - <font color="#FF0000">1</font>][j + <font color="#FF0000">1</font>] + <font color="#FF0000">1</font>, dp[i][j]);
                <font color="#008080">// car can go left</font>
                <font color="#0000FF">if</font> (validPlace(j - <font color="#FF0000">1</font>))
                    dp[i][j] = <font color="#FF0000">Math</font>.min(dp[i - <font color="#FF0000">1</font>][j - <font color="#FF0000">1</font>] + <font color="#FF0000">1</font>, dp[i][j]);
            }
    <font color="#008080">// take the minimum of last square of all three lanes</font>
    <font color="#0000FF">int</font> ret = <font color="#FF0000">Math</font>.min(dp[n - <font color="#FF0000">1</font>][<font color="#FF0000">0</font>], Math.min(dp[n - <font color="#FF0000">1</font>][<font color="#FF0000">1</font>], dp[n - <font color="#FF0000">1</font>][<font color="#FF0000">2</font>]));
    <font color="#0000FF">if</font> (ret == inf)
        return -<font color="#FF0000">1</font>;    
    <font color="#0000FF">else</font>
        return ret;</code></pre>
                If <b>l</b> is a number of cells in one lane, then time complexity for this algorithm is O(l).
            </p>
            <p>
                <b>Second approach:</b><br />
                Road (lanes and cells) and moves can be represented as a weighted graph. Each cell can be represented as vertex and each move 
                as edge, what    is actually connection between neighbours cells - cell with lover index -&gt; cell with greater index. 
                Note that edge is <b>directed</b> - differ in and out edge. Cell at i-th position of j-th lane (marked (i, j)) should be 
                connected with the others cells in the following    manner:
                <ul>
                    <li>
                        If cell contains an obstacle, don't add any out edge from vertex which represents that cell
                    </li>
                    <li>
                        If cell is a part of open road, then consider two cases:
                        <ul>
                            <li>
                                if car changes lane, add an edge weight 1 (1 lane change) to cells at position i+1 of lanes j-1 and j+1 - an out
                                edge from (i, j) -&gt; (i+1, j-1) and from (i, j) -&gt; (i+1, j+1). Just be careful that next lane exists
                                (i.e. if j=0, you should connect cell only with cell from lane 1, but if j=1, you should
                                connect cell with cells from lane 0 and lane 2).
                            </li>
                            <li>
                                if car keeps driving on same lane, add an edge weight 0 (car doesn't change lane) from current cell to the next 
                                cell (cell with greater index) in a same lane - (i, j) -&gt; (i+1, j).
                            </li>
                        </ul>
                    </li>
                </ul>
                Once you make a graph like described one, start the shortest path algorithm. Actually, you need the length of the shortest 
                path
                from cell (0, 1) to some of the rightmost cells of the each lane, of couse, each rightmost cell must satisfy property that
                it doesn't contain an obstacle.<br />
                With small modification on graph, you can get final information in only one vertex, not in three rightmost. Actually, you
                should add vertex more, named <b>resultVertex</b>. Add an out edge weight 0 from each of the rightmost cells to
                <b>resultVertex</b> - if <b>l</b> is a number of cells in each lane, you should add (l-1, 0) -&gt; <b>resultVertex</b>,
                (l-1, 1) -&gt; <b>resultVertex</b> and (l-1, 2) -&gt; <b>resultVertex</b>. Take a look at <a href="#drivecargraph">image</a> 
                bellow to make it clear.<br />
                <a name="drivecargraph"></a>
                <center><img src="/i/education/tchs_srm44_drivecargraph.gif"></center>
                    <br />
            </p>

            Most of coders solved this problem using first approach.
            See <tc-webtag:handle coderId="20812309" context="algorithm"/>'s 
            <a href="/tc?module=HSProblemSolution&cr=20812309&rd=10795&pm=8250">solution</a> for a clean
            implementation of the the first approach. 
            <tc-webtag:handle coderId="22687801" context="algorithm"/>'s  used the second approach to come up
            with a good solution. You can see it 
            <a href="/tc?module=HSProblemSolution&cr=22687801&rd=10795&pm=8250">here</a>.
        </p>


</p>

 

<font size="+2">

<b><a href="/stat?c=problem_statement&amp;pm=8159&amp;rd=10795" name="8159">DogField</a></b>

</font>

<A href="Javascript:openProblemRating(8159)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A>

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=516570" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

<br />

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

      26 / 80 (32.50%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Success Rate</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      15 / 26 (57.69%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>High Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      <b>Loner</b> for 739.88 points (18 mins 14 secs)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Average Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      559.91 (for 15 correct submissions)

    </td>

  </tr>

</table></blockquote>

<p>

    <p>
        Low constraints suggests that you can use brute-force to solve this task, or at least a part of it. 
        We can divide this task into two parts.<br /><br />
        At the first part of task, let's find the smallest number of seconds between dog and dog-house
        for all dog - dog-house pairs. One move between adjacent squares costs dog 1 second. Again, you can represent field
        as a graph. Each square will play role of a vertex. If squares <b>a</b> and <b>b</b> are adjacent, add an <b>undirected</b>
        edge in the graph    between vertices which represents <b>a</b> and <b>b</b>. Because one move costs 1 second, set the weight 
        of all edges to 1. Shortest path from some dog to some dog-house equals the smallest number of seconds which dog
        can spend to come into dog-house. Once you make a graph, run the shortest path algorithm <b>d</b> times, each time
        starting with a new dog. This graph is sparse (each vertex has at most 4 neighbours), so you can speed by using adjacency 
        list instead of adjacency matrix. Since all edges have same weight, you can use BFS to find shortest paths. Just be careful 
        about rules given in the statement - do not relax edges from squares which contain rock or dog-house.<br /><br />
        Once you find all shortest paths, step onto brute-force. Assign exactly one dog-house to each dog, and vice versa. Also, 
        before you assign some dog-house to the dog, make sure that dog-house is reachable by that dog. For each assignment find 
        sum of all shortest paths between each dog and dog-house which is assigned to it. Compute sum for every assignment 
        (two assignments are different if there exists a dog which has two different dog-houses assigned). From all sums take the 
        smallest one and return it. If there is no assignment in which you can assign all dog-houses, return -1. Each assignment
        represents one permutation of dog-houses. For 10 dogs, there will be 3,628,800 permutations what is enough to pass within 
        time limit - fix all dogs, permute all dog-houses and to i-th dog assign i-th dog-house from permutation.
        See <tc-webtag:handle coderId="15700786" context="algorithm"/>'s  
        <a href="/tc?module=HSProblemSolution&cr=15700786&rd=10795&pm=8159">solution</a> for a clean 
        implementation.
        <br /><br />
        
        This problem can be solved using dynamic programming with bitmask. In this case, <code>DP[i][mask]</code> is
        a minimum sum that last <code>i</code> dogs hide into dog-houses which are enumerated in <code>mask</code>.
        See <tc-webtag:handle coderId="11972352" context="algorithm"/>'s 
        <a href="/tc?module=HSProblemSolution&cr=11972352&rd=10795&pm=8159">solution</a> for a clean 
        implementation of this kind a solution. Btw, this solution is faster than a previous one.

    </p>


</p>
<p>&nbsp;</p>
 

<div class="authorPhoto">
    <img src="/i/m/boba5551_big.jpg" alt="Author" />
</div>
<div class="authorText">
    By&#160;<tc-webtag:handle coderId="20394568" context="algorithm"/><br />    <em>TopCoder Member</em>
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
