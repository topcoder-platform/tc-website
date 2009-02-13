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
    <A href="/stat?c=round_overview&er=5&rd=10808">Match Overview</A><br />
    <tc-webtag:forumLink forumID="516081" message="Discuss this match" />
</div>
<span class="bodySubtitle">SRM 384</span><br />Wednesday, December 19, 2007
<br /><br />



<h2>Match summary</h2> 

<p>
The last Single Round Match before Christmas brought together more than 850 competitors. As a present for them we prepared a problem set in which they could play a lot of games. Exactly 3 of 5 problems were mathematical games.
</p>
<p>
SRM 384 won goes to <tc-webtag:handle coderId="8355516" context="algorithm"/> for his fantastic performance. He was able to solve complete set in 20 minutes, much faster than anyone else, with the fastest submission on Medium and the second fastest on Hard. The 2nd place goes to <tc-webtag:handle coderId="10574855" context="algorithm"/> who overtook <tc-webtag:handle coderId="7442498" context="algorithm"/> in the challenge phase. So <tc-webtag:handle coderId="7442498" context="algorithm"/> had to be satisfied with 3rd place.</p><p>
In Division 2 more people solved Medium than Easy which was harder than usual. Only few coders were able to solve all 3 problems. The first place goes to <tc-webtag:handle coderId="22692050" context="algorithm"/> who was closely followed by <tc-webtag:handle coderId="22376958" context="algorithm"/> and <tc-webtag:handle coderId="22629908" context="algorithm"/>.

</p>

 

<H1>

The Problems

</H1>

</p>

<font size="+2">

<b><a href="/stat?c=problem_statement&amp;pm=8199&amp;rd=10808" name="8199">Prank</a></b>

</font>

<A href="Javascript:openProblemRating(8199)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A>

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=516081" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

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

      366 / 464 (78.88%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Success Rate</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      294 / 366 (80.33%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>High Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      <b>Asocasno</b> for 242.97 points (4 mins 51 secs)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Average Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      164.77 (for 294 correct submissions)

    </td>

  </tr>

</table></blockquote>

<p>
This problem was not as easy as usual. Coders needed to be careful about overflow and time limit, but fortunately examples often help them to find these bugs. It is easy to test if a particular previous weight is good. We just need to square its value and add apparentGain. If the result is also square, then square root of this result is possible Jane's real weight. And while difference between the squares of two consecutive integers is (x+1)^2 - x^2 = 2*x + 1, it is enough to try first 50,000 previous weights, because apparentGain (=2*x+1) was limited to 100,000.
<br><br>C++ solution follows:<br>
<pre>
#define ll long long 
class Prank {
    public:
    vector &lt;int&gt; realWeight(int apparentGain) {
        vector&lt;int&gt; ret;
        for (ll i=1;i&lt;50000;i++) {
            ll sq = i*i+apparentGain;
            ll candidate = (ll)round(sqrt(sq));
            if (candidate*candidate == sq) ret.push_back(candidate); 
        }
        return ret;
    }
};
</pre>
</p>

<font size="+2">

<b><a href="/stat?c=problem_statement&amp;pm=7659&amp;rd=10808" name="7659">Library</a></b>

</font>

<A href="Javascript:openProblemRating(7659)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A>

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=516081" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

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

      348 / 464 (75.00%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Success Rate</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      310 / 348 (89.08%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>High Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      <b>numenor</b> for 485.74 points (4 mins 53 secs)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Average Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      372.69 (for 310 correct submissions)

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

      386 / 390 (98.97%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Success Rate</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      368 / 386 (95.34%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>High Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      <b>Im2Good</b> for 248.40 points (2 mins 17 secs)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Average Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      222.00 (for 368 correct submissions)

    </td>

  </tr>

</table></blockquote>

<p>
The problem was pretty straightforward and it caused quite high success rate in both divisions. It was sufficient to check for each record if Mr. Agent has rights to access its room and is a member of its user group. Except that you also needed to ensure to count every document only once. It can be solved by iterating over input arrays, because of the small constraints. But probably the fastest and easiest way for coding, checking and ignoring duplicates is using sets.

<br><br>
<tc-webtag:handle coderId="22688523" context="algorithm"/>'s Java code follows:<br>
<pre>
public class Library {
    public int documentAccess(String[] records, String[] documentRights, String[] roomRights) {
        Set&lt;String&gt; groups = new HashSet&lt;String&gt;();
        Set&lt;String&gt; rooms = new HashSet&lt;String&gt;();
        Set&lt;String&gt; docs = new HashSet&lt;String&gt;();
        for (String group : documentRights) groups.add(group);
        for (String room : roomRights) rooms.add(room);
        for (String s : records)
            if (groups.contains(s.split(" ")[2]) 
                &amp;&amp; rooms.contains(s.split(" ")[1]))
                    docs.add(s.split(" ")[0]);
        return docs.size();
    }
}

</pre>


</p>

<font size="+2">

<b><a href="/stat?c=problem_statement&amp;pm=7756&amp;rd=10808" name="7756">PowerGame</a></b>

</font>

<A href="Javascript:openProblemRating(7756)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A>

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=516081" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

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

      28 / 464 (6.03%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Success Rate</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      7 / 28 (25.00%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>High Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      <b>leohoyee</b> for 628.66 points (25 mins 13 secs)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Average Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      527.59 (for 7 correct submissions)

    </td>

  </tr>

</table></blockquote>

<p>
We need to find only number of moves, because players alternate turns. So if the total number of moves is odd Alan will win and if it is even Bob will win.
At the beginning we can try to solve the problem if we have only one pile of sticks. This can be solved by Dynamic Programming. 
</p><p>
When we are calculating the number of moves the game will last if the size of the pile is <b>x</b>:
<ol>
    <li>We will try all possible moves = moves to <b>x - k^2</b> for all k&gt;0</li>
    <li>If it is possible, we want to move to position from which the game lasts even number of moves 
    (from such position we win and our opponent loses). If there are more such positions we will choose the smallest one, because we want to win as fast as possible.</li>
    <li>If it is possible to move only to positions from which the game lasts odd number of moves, we will lose. We want to lose as slow as possible so we will choose the maximum.</li>
</ol>

Players must play in both piles in their turns, but their strategy in particular piles does not have any reason to change. Therefore the pile with lower overall number of moves will determine the winner.


<br><br>
Java code follows:<br>
<pre>
public class PowerGame {

 public int numberOfMoves(int size) {
    // generate possible moves 
    int power=2;
    int[] moves = new int[105];
    int pocet = 0;
    boolean big=false;
    for (int i=1;i&lt;105&amp;&amp;!big;i++) {
        int num=1;
        for (int j=0;j&lt;power;j++) num*=i;
        if (num&gt;size) big=true; else {
            moves[pocet]=num;
            pocet++;
        }
    }
    // find length of the game in this pile
    int[] length = new int[size+1];
    length[0]=0;
    int INF=999998;
    for (int i=1;i&lt;=size;i++) {
        int smallestEven=INF;
        int largestOdd=-1;
        for (int j=0;j&lt;pocet;j++) if (i-moves[j]&gt;=0) {
            int kam = i - moves[j];
            if (length[kam]%2==0) {
                if (length[kam]&lt;smallestEven) smallestEven = length[kam];    
            } else {
                if (length[kam]&gt;largestOdd) largestOdd=length[kam];
            }
        }
        if (smallestEven!=INF) length[i]=smallestEven+1;
        else length[i]=largestOdd+1;
    }
    return length[size];
 }

 public String winner(int size0, int size1) {
    int length0 = numberOfMoves(size0);
    int length1 = numberOfMoves(size1);
    int minimum = length0&lt;length1 ? length0 : length1;
    String name=(minimum%2==1)?"Alan":"Bob";
    return name+" will win after "+String.valueOf(minimum)+" moves";
 } 

}

</pre>

</p>

<font size="+2">

<b><a href="/stat?c=problem_statement&amp;pm=7657&amp;rd=10808" name="7657">SchoolTrip</a></b>

</font>

<A href="Javascript:openProblemRating(7657)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A>

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=516081" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

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

      120 / 390 (30.77%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Success Rate</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      73 / 120 (60.83%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>High Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      <b>Eryx</b> for 468.45 points (7 mins 28 secs)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Average Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      282.94 (for 73 correct submissions)

    </td>

  </tr>

</table></blockquote>

<p>

Low constraints indicated that almost any correct solution will run in time. There were different types of solutions and their main difference was how hard it was to implement them.
</p><p>
It is almost always good idea to start thinking about the small problem. What happens if we have only 2 students? Lets call them <b>A</b>, <b>B</b> and their probabilities of hitting other students <b>a</b>, <b>b</b>. Student <b>A</b> starts, so after one move with probability <b>a</b> he will hit student <b>B</b> and the game will be finished and with probability <b>(1-a)</b> he will be unsuccessful and it will be <b>B</b>`s turn. So if there is the next move, student <b>B</b> will hit with probability <b>b</b> student <b>A</b> and the game will be finished or we will get back to the situation at the beginning with probability <b>(1-b)</b>. Let the result for our situation at the beginning is <b>x</b> we can write the following equation from the facts above:<br>
<br>
x = 1 + a*0 + (1-a)*(1 + b*0 + (1-b)*x)<br>
x = (1 + (1-a)) / (1 - (1-a)*(1-b)) <br>
<br>
We can create similar equation by our program also for more students. If we want to calculate result <b>x</b> for the inital position we will get linear equation, because if one of the students is hit we will calculate result recursively for the circles with less students, so we can look at these values as constants. If all students in a whole round were unsuccessful we will get to original position, so result is our unknown variable <b>x</b>. And from this linear equation we will calculate <b>x</b>. The students want to minimize overall time of the game, so when we are calculating result for our position, we can try throwing ball at all of the other students, calculate all results and return minimum of them. 
</p>
<p>
Another very popular way to solve this problem was based on the observation that the game will last long with very small probability. So the same idea with moving between positions with the above probabilities, but after few thousand of moves we can assume that the game will be finished. For example <tc-webtag:handle coderId="8355516" context="algorithm"/> used this approach in the fastest <a href="/stat?c=problem_solution&rm=267775&rd=10808&pm=7657&cr=8355516">submission</a>.
</p>


<font size="+2">

<b><a href="/stat?c=problem_statement&amp;pm=6866&amp;rd=10808" name="6866">ChessTraining</a></b>

</font>

<A href="Javascript:openProblemRating(6866)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A>

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=516081" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

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

      61 / 390 (15.64%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Success Rate</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      24 / 61 (39.34%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>High Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      <b>marek.cygan</b> for 950.73 points (6 mins 32 secs)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Average Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      638.16 (for 24 correct submissions)

    </td>

  </tr>

</table></blockquote>

<p>
While queens can move through squares containing other queens, and multiple queens can coexist on a single square, we have the same situation as if each queen has her own chessboard. So it looks like we have a game that consists of several games. Experienced topcoder can start think that Grundy numbers will be useful. If you are not familiar with Grundy numbers, you can read about them in topcoder <a href="/tc?module=Static&d1=tutorials&d2=algorithmGames">Algorithm Games</a> tutorial. </p>

<p>
We would be able to calculate and combine Grundy numbers of every queen position to find out who is the winner of the game only if the rules were that the player who can not move with any of the queens is declared the loser. But we have a different situation. The game is finished after only one subgame (queen) is finished.
</p>
<p>
If there is at least one queen at positions (0,x) or (x,0) or (x,x), where x&gt;0, the game will be finished after first move, so Alice will be the winner.<br>
If there is no queen at these positions:<br>
<ul>
    <li>Nobody wants to move to these positions, because he will lose in the next move.</li>
    <li>So the situation will be the same as if we forbid to move to these positions.</li>
</ul>
Only when there is no other move available, a player will have to move to these positions. So only if he can not move with all the queens at their chessboards (without squares (0,x), (x,0) and (x,x) ). And this reduced problem can be solved now by using the Grundy numbers. First we calculate Grundy numbers for all squares (of course, except (0,x), (x,0), (x,x)) of the chessboards, but with not allowing moves to (0,x), (x,0) and (x,x). Then if xor of these values is 0, the winner of the game will be Bob, otherwise Alice.
<br><br>
Java code follows:
<br><br>
<pre>
public class ChessTraining {
 
 public final int UN = -3; // unknown
 public final int SW = -1; // superwinning
 public final int SL = -2; // superlosing
 
 public int[][] mem;
 
 // calculate Grundy nummber for square (x,y)
 public int wtia(int x,int y) {
    if (mem[x][y]!=UN) return mem[x][y];
    if (x==0&amp;&amp;y==0) return SL;
    if (x==y||x==0||y==0) return SW;
    HashSet&lt;Integer&gt; alles = new HashSet&lt;Integer&gt;();
    for (int i=0;i&lt;x;i++) alles.add(wtia(i,y));
    for (int i=0;i&lt;y;i++) alles.add(wtia(x,i));
    for (int i=1;i&lt;=x&amp;&amp;i&lt;=y;i++) alles.add(wtia(x-i,y-i));
    int ret=0;
    while (alles.contains(ret)) ret++;
    mem[x][y]=ret;
    return ret;
 }
 
 public int combine(int g1,int g2) {
    if (g1==SW||g2==SW) return SW;
    return g1^g2;
 }

 public String game(int[] x, int[] y) {
    int N=100;
    mem = new int[N][N];
    for (int i=0;i&lt;N;i++) for (int j=0;j&lt;N;j++) mem[i][j]=UN;
    for (int i=0;i&lt;N;i++) for (int j=0;j&lt;N;j++) {
        mem[i][j]=wtia(i,j);
    }
    int ret=mem[x[0]][y[0]];
    for (int i=1;i&lt;x.length;i++) {
        ret = combine (ret,mem[x[i]][y[i]]);
    }
    if (ret==0) return "Bob will win";
    return "Alice will win";
 }

}

</pre>

</p>

<br /><br />


<div class="authorPhoto">
    <img src="/i/m/rasto6sk_big.jpg" alt="Author" />
</div>
<div class="authorText">
    By&#160;<tc-webtag:handle coderId="13396848" context="algorithm"/><br />
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
