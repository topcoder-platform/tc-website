<%@  page language="java"  %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Algorithm Tutorials</title>
<jsp:include page="/script.jsp" />
<jsp:include page="/style.jsp">
<jsp:param name="key" value="tc_main"/>
</jsp:include>
<SCRIPT LANGUAGE="JavaScript" SRC="/js/print.js"></SCRIPT>
<style type="text/css">
.code
{
   width: 500;
   padding: 10px;
   margin: 20px;
   color: #333;
   font-size: 11px;
   font-weight: normal;
   line-height: 14px;
   background-color: #EEEEEE;
   border: 1px solid #999;
}
.GAtableText
{
   color: #333;
   font-size: 11px;
   font-weight: normal;
   line-height: 14px;
   background-color: #EEEEEE;
}
</style>
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
        <td width="180" id="onLeft"><jsp:include page="/includes/global_left.jsp">
            <jsp:param name="node" value="algo_tutorials"/>
            </jsp:include>
        </td>
        <!-- Left Column Ends -->
        <!-- Center Column Begins -->
        <td width="100%" align="center"><div class="tutorBodyFull">
            <jsp:include page="../page_title.jsp" >
            <jsp:param name="image" value="alg_tut"/>
            <jsp:param name="title" value="&#160;"/>
            </jsp:include>
            <div class="linkBox"> <A href="/tc?module=Static&d1=tutorials&d2=alg_index">Archive</A><br>
                <span id="printableLink"><A href="Javascript:makeInvisible();">Printable view</A><br>
                </span> <span id="navigableLink" class="invisible"><A href="Javascript:makeNavigable();">Normal view</A><br>
                </span>
                <tc-webtag:forumLink forumID="515870" message="Discuss this article" /><br />
                <a href="/tc?module=Static&d1=help&d2=writeForTC">Write for TopCoder</a>
            </div>
            
            <span class="bigTitle">Algorithm Games</span>
            <br /><br />

            <div class="authorPhoto">
                <img src="/i/m/rasto6sk_big.jpg" alt="Author" />
            </div>

            <div class="authorText"> By&#160;<tc-webtag:handle coderId="13396848" context="algorithm"/><br />
                <em>TopCoder Member</em>
            </div>

            <br clear="all">

<p><span class="bodySubtitle">Introduction</span><br />
The games we will talk about are two-person games with perfect information, no chance moves, and a win-or-lose outcome. In these games, players usually alternate moves until they reach a terminal position. After that, one player is declared the winner and the other the loser. Most card games don't fit this category, for example, because we do not have information about what cards our opponent has.</p>

<p>First we will look at the basic division of positions to winning and losing. After that we will master the most important game -- the Game of Nim -- and see how understanding it will help us to play composite games. We will not be able to play many of the games without decomposing them to smaller parts (sub-games), pre-computing some values for them, and then obtaining the result by combining these values.</p>

<p><span class="bodySubtitle">The Basics </span><br />
A simple example is the following game, played by two players who take turns moving. At the beginning there are n coins. When it is a player's turn he can take away 1, 3 or 4 coins. The player who takes the last one away is declared the winner (in other words, the player who can not make a move is the loser). The question is: For what n will the first player win if they both play optimally? </p>

<p>We can see that n = 1, 3, 4 are winning positions for the first player, because he can simply take all the coins. For n=0 there are no possible moves -- the game is finished -- so it is the losing position for the first player, because he can not make a move from it. If n=2 the first player has only one option, to remove 1 coin. If n=5 or 6 a player can move to 2 (by removing 3 or 4 coins), and he is in a winning position. If n=7 a player can move only to 3, 4, 6, but from all of them his opponent can win&#8230; </p>

<p><b>Positions have the following properties:</b></p>

<ul>
    <li>All terminal positions are losing. </li>
    <li>If a player is able to move to a losing position then he is in a winning position. </li>
    <li>If a player is able to move only to the winning positions then he is in a losing position. </li>
</ul>

<p>These properties could be used to create a simple recursive algorithm <b>WL-Algorithm</b>:</p> 

<pre class="code">
<b>boolean</b> isWinning(position pos) {
    moves[] = possible positions to which I can move from the
position pos;
    <b>for</b> (all x in moves) 
        <b>if</b> (!isWinning(x)) return true;
    
    <b>return</b> false; 
}
</pre>

<p>Table 1: Game with 11 coins and subtraction set {1, 3, 4}: </p>

<table class="formFrame" width="400" cellpadding="6" cellspacing="2" align="center">
   <tr class="sidebarTitle" nowrap="nowrap">
      <td align="center">n</td>
      <td align="center">0</td>
      <td align="center">1</td>
      <td align="center">2</td>
      <td align="center">3</td>
      <td align="center">4</td>
      <td align="center">5</td>
      <td align="center">6</td>
      <td align="center">7</td>
      <td align="center">8</td>
      <td align="center">9</td>
      <td align="center">10</td>
      <td align="center">11</td>
   </tr>
   <tr class="GAtableText">
      <td align="center">position</td>
      <td align="center">L</td>
      <td align="center">W</td>
      <td align="center">L</td>
      <td align="center">W</td>
      <td align="center">W</td>
      <td align="center">W</td>
      <td align="center">W</td>
      <td align="center">L</td>
      <td align="center">W</td>
      <td align="center">L</td>
      <td align="center">W</td>
      <td align="center">W</td>
   </tr>
</table>

<p>This game could be played also with a rule (usually called the misere play rule) that the player who takes away the last coin is declared the loser. You need to change only the behavior for the terminal positions in WL-Algorithm. Table 1 will change to this:</p>

<table class="formFrame" width="400" cellpadding="6" cellspacing="2" align="center">
   <tr class="sidebarTitle" nowrap="nowrap">
      <td align="center">n</td>
      <td align="center">0</td>
      <td align="center">1</td>
      <td align="center">2</td>
      <td align="center">3</td>
      <td align="center">4</td>
      <td align="center">5</td>
      <td align="center">6</td>
      <td align="center">7</td>
      <td align="center">8</td>
      <td align="center">9</td>
      <td align="center">10</td>
      <td align="center">11</td>
   </tr>
   <tr class="GAtableText">
      <td align="center">position</td>
      <td align="center">W</td>
      <td align="center">L</td>
      <td align="center">W</td>
      <td align="center">L</td>
      <td align="center">W</td>
      <td align="center">W</td>
      <td align="center">W</td>
      <td align="center">W</td>
      <td align="center">L</td>
      <td align="center">W</td>
      <td align="center">L</td>
      <td align="center">W</td>
   </tr>
</table>

<p>It can be seen that whether a position is winning or losing depends only on the last k positions, where k is the maximum number of coins we can take away. While there are only 2^k possible values for the sequences of the length k, our sequence will become periodic. You can try to use this observation to solve the following problem: <br>
<a href="/stat?c=problem_statement&pm=6856">SRM 330: LongLongNim</a> </p>

<p><span class="bodySubtitle">The Game of Nim </span><br />
The most famous mathematical game is probably the Game of Nim. This is the game that you will probably encounter the most times and there are many variations on it, as well as games that can be solved by using the knowledge of how to play the game. Usually you will meet them as Division I 1000 pointers (though hopefully your next encounter will seem much easier). Although these problems often require a clever idea, they are usually very easy to code. </p>

<p><b>Rules of the Game of Nim</b>: There are n piles of coins. When it is a player's turn he chooses one pile and takes at least one coin from it. If someone is unable to move he loses (so the one who removes the last coin is the winner). </p>

<div align="center"><img src="/i/education/algorithmGames_01.png" alt="" border="0" style="margin: 10px;" /></a></div> 

<p>Let n1, n2, &#8230; nk, be the sizes of the piles. It is a losing position for the player whose turn it is if and only if <b>n<sub>1</sub> xor n<sub>2</sub> xor .. xor n<sub>k</sub> = 0</b>. </p>

<p><b>How is xor being computed?</b></p>
<pre class="code">
    6 = (110)2           1 1 0
    9 = (1001)2        1 0 0 1
    3 = (11)2              1 1
                       --------
                       1 1 0 0
</pre>

<ul>
    <li><b>xor</b> of two logic values is true if and only if one of them is true and the second is false</li>
    <li>when computing <b>xor</b> of integers, first write them as binary numbers and then apply <b>xor</b> on columns. </li>
    <li>so <b>xor</b> of even number of 1s is 0 and <b>xor</b> of odd number of 1s is 1 </li>
</ul>

<p><b>Why does it work?</b></p>
<ul>
  <li>From the losing positions we can move only to the winning ones:<br>
       - if xor of the sizes of the piles is 0 then it will be changed after our move (at least one 1 will be changed to 0, so in that column will be odd number of 1s).</li>
  <li>From the winning positions it is possible to move to at least one losing:<br>
        - if xor of the sizes of the piles is not 0 we can change it to 0 by finding the left most column where the number of 1s is odd, changing one of them to 0 and then by changing 0s or 1s on the right side of it to gain even number of 1s in every column.</li>
</ul>

<p>Examples:<br>
Position (1, 2, 3) is losing because 1 xor 2 xor 3 = (1)<sub>2</sub> xor (10)<sub>2</sub> xor (11)<sub>2</sub> = 0 <br>
Position (7, 4, 1) is winning because 7 xor 4 xor 1 = (111)<sub>2</sub> xor (10)<sub>2</sub> xor (1)<sub>2</sub> = (10)<sub>2</sub> = 2 </p>

<p>Example problems: <br>
<a href="/stat?c=problem_statement&pm=7424">SRM 338: CakeParty</a> <br>
<a href="/stat?c=problem_statement&pm=6239">SRM 309: StoneGameStrategist</a></p>

<p>The last one example problem is harder, because it is not so easy to identify where the sizes of piles are hidden. Small hint: Notice the differences between the sizes of piles. If you would not be able to figure it out you can find the solution in the <a href="/tc?module=Static&d1=match_editorials&d2=srm309">SRM 309 Problem set & Analysis</a>. </p>

<p><span class="bodySubtitle">Composite games - Grundy numbers </span><br />
<b>Example game</b>: N x N chessboard with K knights on it. Unlike a knight in a traditional game of chess, these can move only as shown in the picture below (so the sum of coordinates is decreased in every move). There can be more than one knight on the same square at the same time. Two players take turns moving and, when it is a player's, turn he chooses one of the knights and moves it. A player who is not able to make a move is declared the loser. </p>
 
<div align="center"><img src="/i/education/algorithmGames_02.png" alt="" border="0" style="margin: 10px;" /></a></div> 

<p>This is the same as if we had K chessboards with exactly one knight on every chessboard. This is the ordinary sum of K games and it can be solved by using the grundy numbers. We assign grundy number to every subgame according to which size of the pile in the Game of Nim it is equivalent to. When we know how to play Nim we will be able to play this game as well. </p>

<pre class="code">
<b>int</b> grundyNumber(position pos) {
    moves[] = possible positions to which I can move from pos
    set s;
    <b>for</b> (all x in moves) insert into s grundyNumber(x);
    //return the smallest non-negative integer not in the set s;    
    <b>int</b> ret=0;
    <b>while</b> (s.contains(ret)) ret++;
    <b>return</b> ret;
}
</pre>

<p>The following table shows grundy numbers for an 8 x 8 board:</p>

<div align="center"><img src="/i/education/algorithmGames_03.png" alt="" border="0" style="margin: 10px;" /></a></div> 

<p>We could try to solve the original problem with our WL-Algorithm, but it would time out because of the large number of possible positions. </p>

<p>A better approach is to compute grundy numbers for an N x N chessboard in O(n<sup>2</sup>) time and then xor these K (one for every horse) values. If their xor is 0 then we are in a losing position, otherwise we are in a winning position.</p>

<p><b>Why is the pile of Nim equivalent to the subgame if its size is equal to the grundy number of that subgame? </b></p>

<ul>
    <li>If we decrease the size of the pile in Nim from A to B, we can move also in the subgame to the position with the grundy number B. (Our current position had grundy number A so it means we could move to positions with all smaller grundy numbers, otherwise the grundy number of our position would not be A.)</li>
    <li>If we are in the subgame at a position with a grundy number higher than 0, by moving in it and decreasing its grundy number we can also decrease the size of pile in the Nim. </li>
    <li>If we are in the subgame at the position with grundy number 0, by moving from that we will get to a position with a grundy number higher than 0. Because of that, from such a position it is possible to move back to 0. By doing that we can nullify every move from the position from grundy number 0. </li>
</ul>

<p>Example problems:<br>
<a href="/stat?c=problem_statement&pm=2987&rd=5862">SRM 216: Roxor</a></p>

<p><span class="bodySubtitle">Other composite games </span><br />
It doesn't happen often, but you can occasionally encounter games with a slightly different set of rules. For example, you might see the following changes: </p>

<p>1. When it is a player's move he can choose some of the horses (at least one) and move with all the chosen ones. <br><br>
<b>Solution:</b> You are in a losing position if and only if every horse is in a losing position on his own chessboard (so the grundy number for every square, where the horse is, is 0). </p>

<p>2. When it is a player's move he can choose some of the horses (at least one), but not all of them, and move with all chosen ones. <br><br>
<b>Solution:</b> You are in a losing position if and only if the grundy numbers of all the positions, where horses are, are the same. </p>

<p>You can verify correctness of both solutions by verifying the basic properties (from a winning position it is possible to move to a losing one and from a losing position it is possible to move only to the winning ones). Of course, everything works for all other composite games with these rules (not only for horse games). </p>

<p><b>Homework:</b> What would be changed if a player had to move with every horse and would lose if he were not able to do so? </p>

<p><span class="bodySubtitle">Conclusion </span><br />
Don't worry if you see a game problem during SRM -- it might be similar to one the games described above, or it could be reduced to one of them. If not, just think about it on concrete examples. Once you figure it out the coding part is usually very simple and straightforward. Good luck and have fun. </p>

<p><b>Other resources:</b><br>
<a target="_blank" href="<tc-webtag:linkTracking link='http://www.madras.fife.sch.uk/maths/games/' refer='algorithmGames' />">Collection of many mathematical games</a><br>
<a target="_blank" href="<tc-webtag:linkTracking link='http://sps.nus.edu.sg/%7Elimchuwe/cgt/' refer='algorithmGames' />">Introductory combinatorial game theory</a><br>
<i>Winning ways for your mathematical plays</i> by Elwyn R. Berlekamp, John H. Conway, Richard K. Guy</p>

            <p>&nbsp; </p>
            <br>
            <br>
        </td>
        <!-- Center Column Ends -->
        <!-- Right Column Begins -->
        <td width="170" id="onRight"><jsp:include page="../public_right.jsp">
            <jsp:param name="level1" value="defaults"/>
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
