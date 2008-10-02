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
<tc-webtag:forumLink forumID="505756" message="Discuss this match" /></div>
<span class="bodySubtitle">2005 TopCoder Open <br> Online Round 2 </span><BR/>August 24, 2005
<br><br>

<h2>Match summary</h2>
<p>
The competition heated up with round 2 of the TCO.  Out of 400 excellent coders,
only 200 could advance.  Most coders were able to solve
the easy problem without too much trouble, and many coders moved on to the medium
within a few minutes.  In fact, some of the fastest coders had submitted all three
problems within half an hour of the start.  As the seconds ticked away, however, a number of big
names had yet to submit anything but the easy problem.  Yarin, mathijs and
natori were still working on a second problem after one hour.  Yarin managed to
get his 1000 pointer submitted with about 10 minutes left though, and no one was
worried about natori with his reputation for getting challenges (though he
submitted the medium in the final seconds just in case).  But at the end of the
coding phase, the cutoff stood at 433.96 -- a tad above natori's 431.24, and far
above mathijs' 242.22.  But, all the resubmissions of the medium and hard boded
well for a rash of failures. <br/><br/>
Indeed, the challenge phase brought 117 failures and the cutoff fell to 251.80.
Chief among the challengers was dzetkulict whose 8 challenges put him above the
cutoff by themselves.  HardCoder was next with 6, followed by the reliable
natori at 4.  Yet these were far from all the failures, and during system tests,
the cutoff dropped all the way to 235.40 meaning that a good score on the easy
problem was all you needed to advance.  However, this was too high for as many
as 6 reds, including reid and mathijs (who would have made it but for a failed
challenge).
</p>
<H1>
The Problems
</H1>
<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=4709&amp;rd=8017" name="4709">FloorTiling</a></b>
</font>
<A href="Javascript:openProblemRating(4709)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A>
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505756" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

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
      345 / 361 (95.57%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">

      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      311 / 345 (90.14%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>

    </td>
    <td class="bodyText" style="background: #eee;">
      <b>nullspace</b> for 248.58 points (2 mins 9 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>

    </td>
    <td class="bodyText" style="background: #eee;">
      219.96 (for 311 correct submissions)
    </td>
  </tr>
</table></blockquote>
<p>


The best way to do this problem is to just iterate over the rows.  The first row
has an offset of 0, the next an offset of <b>offset</b>, the next
2*<b>offset</b> and so on.  For each row, the leftmost tile starts at the offset
of that row, modulo the size of the tile.  Once you've figured this out, its
just a bit of simple math to figure out the gap to the left and right of the
tiles:

<pre>
    public int tile(int size, int offset, int width, int height){
        int off = 0;
        int ret = 0;
        for(int i = 0; i&lt;height; i++){
            ret += off + (width-off)%size;
            off+=offset;
            off = off % size;
        }
        return ret;
    }
</pre>

</p>
<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=4635&amp;rd=8017" name="4635">PartyGame</a></b>
</font>
<A href="Javascript:openProblemRating(4635)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A>
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505756" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

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
      221 / 361 (61.22%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>

    <td class="bodyText" style="background: #eee;">
      121 / 221 (54.75%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">

      <b>Eryx</b> for 481.84 points (5 mins 33 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">

      324.68 (for 121 correct submissions)
    </td>
  </tr>
</table></blockquote>
<p>

This problem may have seemed awfully similar to the ChutesAndLadders problem
from a few weeks ago.  However, the solution turns out to be quite different.
While that problem only required a simulation of the game, this one required
that you do a bit of math to figure things out.<br/><br/>
The first step to solving this problem is dynamic programming.  If we know the
expected number of moves required for all positions k &gt; j, then we can calculate the
number of moves required for position j.  First count the number of positions
that are red and that we could reach (with moves of size 1 to N).  Next add up the
expected values for all the reachable positions that are green.  Lets say that
there are R reachable red positions, and G reachable green position.  In this
case, the expected number of moves, assuming that we get to one of the green
squares is going to be <tt>sum/G</tt> where <tt>sum</tt> is the sum from the
expected values of the green squares.  Now, G/(R+G) percent of the time we will
end up on one of the green squares in one roll, while the rest of the time, we
will have to reroll.  If we reroll, the situation is the same, since we haven't
moved.  Eventually, we will get a roll that lets us move though, so we will
always have to add in the <tt>sum/G</tt> part.<br/><br/>

This is where the math comes in.  R/(R+G) times we will have to roll again.
This means that (R/(R+G))<sup>2</sup> times we will have to roll two more times, and so
on.  This gives us a sequence, the sum of which is the expected number of times
we must roll before we hit a green square:
<pre>
    1 + (R/(R+G))<sup>1</sup> + (R/(R+G))<sup>2</sup> + (R/(R+G))<sup>3</sup> + ...
</pre>

This sequence if of the form <tt>1 + x + x<sup>2</sup> + ...</tt> and it adds up
to <tt>1/(1-x)</tt>,
which is <tt>1/(1-(R/(R+G)))</tt> in this case.  With a little manipulation, we can
actually reduce the equation to 
(R+G)/G.  Of course we can combine this with the
expected value from the reachable green squares and substitute N in for R+G to
get
<tt>(sum+N)/G</tt><br/><br/>
The only other thing you need to think about a bit are the cases when you roll
to or off the end of the field, but this is easily dealt with by considering those
positions as green ones with an expected number of rolls of 0.

</p>
<font size="+2">

<b><a href="/stat?c=problem_statement&amp;pm=2976&amp;rd=8017" name="2976">Answer</a></b>
</font>
<A href="Javascript:openProblemRating(2976)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A>
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505756" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

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
      111 / 361 (30.75%)
    </td>

  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      27 / 111 (24.32%)
    </td>
  </tr>

  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>bladerunner</b> for 778.25 points (16 mins 9 secs)
    </td>
  </tr>

  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      592.18 (for 27 correct submissions)
    </td>
  </tr>
</table></blockquote>

<p>
A lot of the solutions to this problem timed out.  One sure way to avoid that is
to do a bit of preprocessing on the input.  Build a set of bitmasks for each
letter, where each bitmask represents a set of words that might be left after 
that letter is revealed by a single guess. This can be done by considering each
word and letter pair.  For each such pair, look at all the other
words, and if they have the same letter in all the same places (and nowhere
else), then both words would result in the same letters being revealed from the
same guess.  For instance, when the words are {"FOG", "DOG", "ANT", "CAT", "RAT"} there
are three bitmasks corresponding to the three sets of letters that might be
revealed by an initial guess of 'A': 00011<sub>2</sub>, 00100<sub>2</sub> and
11000<sub>2</sub>.  These correspond to having no 'A', an 'A' in the first
position, and an 'A' in the second position, respectively.  Here is some code to
find all the masks.

<pre>
    m = new int[26][18];<font color="blue">//masks go in here</font>
    c = new int[26];<font color="blue">//says how many masks for a particular letter</font>

    for(int i = 0; i&lt;26; i++){
        boolean[] u = new boolean[words.length];
        for(int j = 0; j&lt;words.length; j++){
            <font color="blue">//if a word is already in some mask, don't consider it again</font>
            if(u[j])continue;
            int mask = 1&lt;&lt;j;
            for(int k = j+1; k&lt;words.length; k++){
                boolean ok = true;
                for(int l = 0; ok &amp;&amp; l&lt;words[j].length(); l++){
                    if((words[j].charAt(l) == i+'A') ^ (words[k].charAt(l) == i+'A')){
                        ok = false;
                    }
                }
                if(ok){
                    <font color="blue">//here we've found that word k has letter i 
                    //in the same positions as word j</font>
                    u[k] = true;
                    mask |= 1&lt;&lt;k;
                }
            }
            m[i][c[i]++] = mask;
        }
    }

</pre>
Once we've done this, the rest of the solution is fairly simple.  We write a
recursive method (memoized of course) that computes how long it takes to
differentiate between some subset of words.  Note that once some letters are
revealed and the final word has been narrowed down to some subset, we don't
actually need to know exactly which letters have been revealed.  Now, we do the
natural thing to figure out many guesses it will take: consider guessing each
letter.  When we guess some letter, some of the letters in the word may be
revealed.  The revealed letters will correspond to one of the bitmasks we
precomputed (we don't actually have to think about which letters get revealed,
just use the bitmasks).  We now have the subset of words that were possible from our
previous guesses (the input to the recursive method) and the subset of words
possible from the letters revealed.  A simple logical AND operation on the two
bitmasks gives us the subset of words to consider after this guess.  We repeat
this process for each possible set of letters revealed by our guess (these
correspond to the bitmasks computed) and take the worst case of those.  That
gives us the number of guesses we need for a particular letter.  By repeating
for each letter, we find the best letter to guess.
<pre>
<font color="blue">//the recursive method</font>
int go(int mask){
    if((mask &amp; (mask-1)) == 0){
        <font color="blue">//a tricky way to find out if there are 
        //only 0 or 1 things in the bitmask</font>
        return 0;
    }
    <font color="blue">//the memoization</font>
    if(dp[mask]!=0)return dp[mask];
    int ret = 1000;
a:  for(int i = 0; i&lt;26; i++){
        <font color="blue">//considering guessing letter i</font>

        int it = 0;
        for(int j = 0; j&lt;c[i]; j++){
            <font color="blue">//m[i][j] is a bitmask corresponding to some 
            //set of revealed letters for letter i.</font>
            int m2 = mask &amp; m[i][j];
            <font color="blue">//if m2 == mask, it means that guessing letter i will
            //not give us any new information, so we shouldn't do that </font>
            if(m2 == mask)continue a;
            it = Math.max(it,go(m2)+1);
        }
        ret = Math.min(ret,it);
    }
    return dp[mask] = ret;
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

