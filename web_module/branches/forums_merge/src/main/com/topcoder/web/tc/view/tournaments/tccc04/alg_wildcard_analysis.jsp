<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>2004 TopCoder Collegiate Challenge - Computer Programming Tournament - Summary</title>

<jsp:include page="../../script.jsp" />

<link type="text/css" rel="stylesheet" href="/css/TCCC04style.css"/>
    
</head>

<body>

<jsp:include page="../../top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">
<!-- Left Column Begins-->
        <td width="180">
            <jsp:include page="../../includes/global_left.jsp">
                <jsp:param name="level1" value="events"/>
                <jsp:param name="level2" value="tournaments"/>
            </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Gutter Begins -->
        <td width="15"><img src="/i/clear.gif" width="15" height="1" border="0"/></td>
<!-- Gutter Ends -->

<!-- Center Column Begins -->
         <td class="bodyText" WIDTH="100%">

<jsp:include page="tccc04Head.jsp" />

<!-- Tab bar links-->
<jsp:include page="tccc04links.jsp" >
   <jsp:param name="tabLev1" value="algorithm"/>
   <jsp:param name="tabLev2" value="summary"/>
   <jsp:param name="tabLev3" value="wildcard"/>
</jsp:include>

            <img src="/i/clear.gif" width="1" height="10" border="0"/><br/>
            <div class="leadPhoto">
            <span class="bodyText" align="center"><p align="center"><a href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=photos">See more photos!</a></p></span>
            <img src="/i/tournament/tccc04/onsite_photos/wildcard.jpg" alt="" width="200" height="350" class="photoFrameBig" /><br/>
            <span class="leadPhotoCaption">ZorbaTHut takes the wildcard<br/><br/></span>
            </div>
            
            <h2>ZorbaTHut stays alive</h2>

            <a href="/tc?module=MemberProfile&cr=273217"><img src="/i/m/schveiguy_mug.gif" alt="" width="55" height="61" border="0" align="left" class="myStatsPhoto"/></a>
            <p>by <a href="/tc?module=MemberProfile&cr=273217">schveiguy</a>, <br/>
            <em>TopCoder Member</em><br />
            Thursday, April 15, 2004<br/>
            introduction by lbackstrom
            <br/><br/></p>

<p>
The wildcard round proved to be as exciting as everyone had hoped.  The 6 runners up started off with a pretty 
standard easy problem that involved a search and could be solved depth of breadth first.  With one exception, all 
coders scored similarly on the first problem.  lars and haha both opted to skip the medium problem, in favor of a 
hard problem, hoping that no one would solve all 3.  The rest of the coders moved on to the medium, and Zorba was 
able to submit it for an impressive 457 points.  Over the remainder of the coding phase, everyone but lars, who 
skipped the medium, submitted the 500 point problem.
<br/><br/>
Despite a lot of time to work on it, no one was able to finish the 1k, and at the end of the coding phase, Zorb 
led by less than a challenge.  However, bladerunner had the first successful challenge of the day, taking down 
haha's medium problem.  With haha out of the way though, Zorb's lead was greater than 50 points, and only a 
failure would unseat him.  As the system tests rolled down the list, the first three competitors whose results 
showed up failed to correctly solve a problem, eliciting oohs from the audience.  However, the fourth and fifth 
competitors had better luck, passing both problems.  Finally, ZorbaTHut, with a reputation for subtle bugs, came 
up...
<br/><br/>
But this time, he had no mistakes, and his submissions both passed, giving him a berth in the finals.  So, at the 
end of the day, all of the top four seeds ended up advancing.  Hopefully, tomorrow will prove to be as exciting 
as today was.  Good luck to all of the four finalists.
</p>

<h1>WordPuzzle</h1>

<p>
This problem maps to a simple BFS to find the shortest path.  Perhaps the most
difficult part is to define the edges.  The easiest way to do this is to define
a function isAdjacent(string s1, string s2), which should return true if the two
strings are connected by an edge.  Then, we can use bfs starting at the
beginning word to determine the shortest path.
</p>

<p>
The next part of the problem is to break any ties that may occur.  Since all
the strings are the same length, this job is made much simpler.  One easy way
to guarantee that a path is lexicographically smallest is to sort the words
before running the BFS.  Then you always use the lexigraphically smallest
sequence first.  Of course, you must make sure that you figure out which
indexes the end and beginning strings are at before running the BFS.
</p>

<h1>RussianDolls</h1>

<p>
This problem is pretty straightforward to solve with recursion.  We define our
recursive function as f(N, hidden, visible), which returns how many ways we can
arrange a set of <b>N</b> dolls with <b>hidden</b> dolls behind the cardboard
and the dolls in <b>visible</b> being outside the cardboard.  We can define our
recurrance relationship in terms of f(N-1 hidden+x, visible).  The four
possible cases are:
</p>
<ol>
<li>If <b>N</b> is an element of <b>visible</b>, and there were <b>hidden</b> +
    1 dolls behind the cardboard, then we can use doll <b>N</b> to envelop one
    the hidden dolls and bring the nested set out from behind the cardboard to
    get <b>N</b> total dolls and <b>hidden</b> dolls behind the cardboard.  We
    must add this value <b>hidden</b> + 1 times because you can envelop any of
    the <b>hidden</b> + 1 dolls behind the cardboard.
<li>If <b>N</b> is an element of <b>visible</b>, and there were only
    <b>hidden</b> dolls behind the cardboard, then we can place doll <b>N</b>
    by itself outside the cardboard to keep the number of hidden dolls
    constant.
<li>If <b>N</b> is not in <b>visible</b>, and there were <b>hidden</b> dolls
    behind the cardboard, then enveloping one of the hidden dolls and leaving
    doll <b>N</b> behind the cardboard keeps <b>hidden</b> constant.  Again,
    you must multiply by <b>hidden</b> since you could envelop any of the
    hidden dolls.
<li>If <b>N</b> is not in <b>visible</b>, and there were <b>hidden</b> - 1
    dolls behind the cardboard hidden, then placing doll <b>N</b> by itself
    behind the cardboard will bring the <b>hidden</b> count up by 1.
</ol>
We can define the function (in pseudocode) as:
</p>

<pre>
long f(N, hidden, visible)
{
  // check for invalid conditions
  if(hidden &lt; 0 || hidden &gt; N)
    return 0;
  if(N == 0) // base case, no dolls
    return 1;
  if(visible.contains(N))
    // envelop one of the hidden dolls
    return f(N - 1, hidden + 1, visible) * (hidden + 1) 
      // do not envelop, place it by itself
      + f(N - 1, hidden, visible);                      
  // not in visible, place behind the cardboard
  else
    // envelop one of the hidden dolls
    return f(N - 1, hidden, visible) * hidden           
      // do not envelop, place it by itself.
      + f(N - 1, hidden - 1, visible);                  
}
</pre>

<p>
With the recurrance relationship defined, we can use memoization with the
number of dolls and the number of hidden dolls to make sure a timeout does not
occur.  Alternatively, you could start with 0 dolls and build the data up from
there using DP.
</p>


<h1>OpenBlackjack</h1>

<p>
Blackjack is one of the only casino games where it is possible to have better
odds than the dealer.  However, it is still very possible to lose a lot of
money really quickly.  In this problem, you are trying to figure out how much
money you really could have made if you had played all your hands perfectly.
</p>

<p>
I will leave the explanation of the game of blackjack up to the problem
statement.  To solve this problem, we need to simulate play.  Like the medium
problem, the play can be defined with a recursive function, and can then be
memoized against the current position in the deck and the money you have.  One
misconception that is proven false with some of the later examples is that you
only need to store the maximum money earned at a given card in the deck.
However, the rules of when you stop playing make this assumption false.  If you
win by blackjack, you win 1 and 1/2 times your bet, offsetting your winnings by
1/2 your bet.  If you then lose all your money, you will potentially walk away
with more or less money than if you didn't get blackjack.  This nuance forces
you to try sequences of card playing where you actually have less money at some
points than with other sequences, but have more at the end.
</p>

<p>
Each call of the recursive play function will play a single round of blackjack.
Since the dealer's play is predefined, all the function can decide is what
cards you take, and whether you double down or not.  Surprisingly, these simple
rules are difficult to write into code.  Once the round is over, you are back
to the beginning of the play function at a different position in the deck, and
with a potentially different amount of money.
</p>

<p>
Some corner cases to look for are doubling down only when it is allowed,
scoring the current cards correctly, not allowing a hit on a score of 21, and
what to do when you run out of cards.
</p>

         <p><br/></p>
         </td>
<!-- Center Column Ends -->

<!-- Gutter -->
         <td width="15"><img src="/i/clear.gif" width="15" height="1" border="0"></td>
<!-- Gutter Ends -->

<!-- Right Column Begins -->
         <td width="170">
            <jsp:include page="../../public_right.jsp">
               <jsp:param name="level1" value="privatelabel"/>
            </jsp:include>
         </td>
<!-- Right Column Ends -->

<!-- Gutter -->
         <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<!-- Gutter Ends -->
    </tr>
</table>

<jsp:include page="../../foot.jsp" />

</body>

</html>
