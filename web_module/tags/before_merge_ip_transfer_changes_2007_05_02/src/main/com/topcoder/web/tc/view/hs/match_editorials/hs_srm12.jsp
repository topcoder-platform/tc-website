<%@ page language="java" %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>TopCoder Statistics</title>

    <jsp:include page="../../script.jsp"/>
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
        <jsp:include page="../../page_title.jsp">
            <jsp:param name="image" value="high_school"/>
            <jsp:param name="title" value="Match Editorials"/>
        </jsp:include>

        <div class="linkBox">
    <A href="tc?module=Static&d1=hs&d2=match_editorials&d3=archive">Archive</A><br>
    <span id="printableLink"><A href="Javascript:makeInvisible();">Printable view</A><br></span>
    <span id="navigableLink" class="invisible"><A href="Javascript:makeNavigable();">Normal view</A><br></span>

            <tc-webtag:forumLink forumID="506034" message="Discuss this match"/></div>
        <span class="bodySubtitle">TCHS SRM 12</span><br>Monday, August 21, 2006
        <br><br>

        <h2>Match summary</h2>

        <p>

            This match proved to be harder then usual. While almost all
            participants successfully solved the 250 problem, the other two problems appeared to be quite difficult.</p>

        Nevertheless, <tc-webtag:handle coderId="22630491" context="hs_algorithm"/>,
        a newcomer from China, won the match with the fastest times on the 550 and 950
        problems, and an amazing nine successful challenges. He was followed by his
        Chinese fellows <tc-webtag:handle coderId="20812309" context="hs_algorithm"/>,
        <tc-webtag:handle coderId="20331303" context="hs_algorithm"/>,
        <tc-webtag:handle coderId="22630769" context="hs_algorithm"/>,
        and <tc-webtag:handle coderId="22375930" context="hs_algorithm"/>.

        <tc-webtag:handle coderId="11925555" context="hs_algorithm"/> from Romania,
        in third place, was the only European in the top six.
    </p>

    <H1>

        The Problems

    </H1>

</p>


<font size="+2">

    <b><a href="/stat?c=problem_statement&amp;pm=6515&amp;rd=10064" name="6515">IndictDates</a></b>

</font>

<A href="Javascript:openProblemRating(6515)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it"/></A>

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=506034" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0"/></A>

<br>

Used as: Division One - Level One: <blockquote>
    <table cellspacing="2">

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

                87 / 93 (93.55%)

            </td>

        </tr>

        <tr>

            <td class="bodyText" style="background: #eee;">

                <b>Success Rate</b>

            </td>

            <td class="bodyText" style="background: #eee;">

                86 / 87 (98.85%)

            </td>

        </tr>

        <tr>

            <td class="bodyText" style="background: #eee;">

                <b>High Score</b>

            </td>

            <td class="bodyText" style="background: #eee;">

                <b>Burunduk3</b> for 248.81 points (1 mins 58 secs)

            </td>

        </tr>

        <tr>

            <td class="bodyText" style="background: #eee;">

                <b>Average Score</b>

            </td>

            <td class="bodyText" style="background: #eee;">

                223.62 (for 86 correct submissions)

            </td>

        </tr>

    </table>
</blockquote>

The straightforward approach to solving this problem is to simulate the process described in the problem statement.
Let's start at year one and iterate years until we reach one with given indict, circle to the Sun and circle to the
Moon.</p>
But if you want to win the Shortest-250-Competition, so popular at the TopCoder forums, you should use another approach,
based on the
<a href="http://en.wikipedia.org/wiki/Chinese_theorem" target=blank>Chinese remainder theorem</a>. Note, that since 15,
19 and 28 are coprime numbers, the Indict system establishes the one-to-one correspondence between years in range from 1
to 15*19*28 = 7980 and its indict notation.
<br><br>
Let <i>inv(a, b)</i> be such an integer c, that <i>ac mod b = 1</i>.
Consider the expression: <br><br>
<i>Y = inv(28*19, 15)*28*19*(indict-1) + inv(15*19, 28)*15*19*(circleSun-1) + inv(28*15, 19)*28*15*(circleMoon-1)</i>
<br>
Note, that <i>Y mod 7980 = indict-1</i>, <i>Y mod 7980 = circleSun - 1</i> and <i>Y mod 7980 = circleMoon - 1</i>.
<br><br>
In this case (Y mod 7980) + 1 is the answer for the problem.
It's easy to see that <i>inv(28*19, 15) = 13</i>, <i>inv(15*19, 28) = 17</i> and <i>inv(28*15, 19) = 10</i>.
Being simplified, it gives us a beautiful solution:

<pre>
    <font color=blue>struct</font> IndictDates{<br>
    &nbsp;&nbsp;&nbsp;&nbsp;<font color=blue>int</font> getYear(<font color=blue>int</font> indict,<font color=blue>
    int</font> circleSun,<font color=blue>int</font> circleMoon){<br>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font color=blue>return </font>
    (6916*indict+4845*circleSun+4200*circleMoon-1)%7980+1;<br>
    &nbsp;&nbsp;&nbsp;&nbsp;}<br>
    };
</pre>

<font size="+2">
    <b><a href="/stat?c=problem_statement&amp;pm=6512&amp;rd=10064" name="6512">DistinctDice</a></b>

</font>

<A href="Javascript:openProblemRating(6512)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it"/></A>

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=506034" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0"/></A>

<br>

Used as: Division One - Level Two: <blockquote>
    <table cellspacing="2">

        <tr>

            <td class="bodyText" style="background: #eee;">

                <b>Value</b>

            </td>

            <td class="bodyText" style="background: #eee;">

                550

            </td>

        </tr>

        <tr>

            <td class="bodyText" style="background: #eee;">

                <b>Submission Rate</b>

            </td>

            <td class="bodyText" style="background: #eee;">

                51 / 93 (54.84%)

            </td>

        </tr>

        <tr>

            <td class="bodyText" style="background: #eee;">

                <b>Success Rate</b>

            </td>

            <td class="bodyText" style="background: #eee;">

                17 / 51 (33.33%)

            </td>

        </tr>

        <tr>

            <td class="bodyText" style="background: #eee;">

                <b>High Score</b>

            </td>

            <td class="bodyText" style="background: #eee;">

                <b>YuJieLu</b> for 532.32 points (5 mins 12 secs)

            </td>

        </tr>

        <tr>

            <td class="bodyText" style="background: #eee;">

                <b>Average Score</b>

            </td>

            <td class="bodyText" style="background: #eee;">

                401.15 (for 17 correct submissions)

            </td>

        </tr>

    </table>
</blockquote>

<p>

    Fisrt of all let's enumerate die's sides in the order they are mentioned in the problem statement:
</p>

<div align="center">
    <img src="/i/srm/tchs_srm_12_1.jpg" alt=""/>
</div>
<br>
The first task we need to fulfill is to learn how to rotate the die.
You need some imagination to see that we can carry out any rotation
of the die by combining only two basic rotations, shown on the figure below.
<br>
<br>

<div align="center">
    <img src="/i/srm/tchs_srm_12_1.jpg" alt=""/>
</div>
<br>
Since we have enumerated the die's sides,
let's represent each of these rotations as a permutation.
The i'th element of the permutation will be the side that will appear at the
position i after applying the rotation. In this case,
<b>rotateRight</b> = {2, 3, 1, 0, 4, 5} and <b>rotateBack</b> = {4, 5, 2, 3, 1, 0}.
</p>

Let's implement the <b>ApplyRotation</b> procedure, that takes
string <b>die</b> and int[] <b>permutation</b> and applies the rotation
of the <b>die</b> according to the <b>permutation</b>.
The pseudocode follows:
<pre><font color=blue>string</font> ApplyRotation(<font color=blue>string</font> die, <font color=blue>int</font>[]
    permutation){<br>
    &nbsp;&nbsp;&nbsp;&nbsp;<font color=blue>string</font> result = "";<br>
    &nbsp;&nbsp;&nbsp;&nbsp;<font color=blue>for</font>( i = 0; i &lt; 6; i++)result+=die[permutation[i]];<br>
    &nbsp;&nbsp;&nbsp;&nbsp;<font color=blue>return</font> result;<br>
    }
</pre>
Now, for each die, let's apply all possible rotations and select
one with the lexicographically first notation. Let's call such a notation a <i>normal form</i> of the die. In this case,
we can compare
any two dice by their normal forms.

Now the pseudocode of the solution looks as follows:
<pre>
    <font color=blue>int</font> getDistinct( <font color=blue>string</font>[] givenDice ){<br>
    &nbsp;&nbsp;&nbsp;&nbsp;<font color=blue>for</font>( i = 0; i <givenDice.size(); i++)<br>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;givenDice[i] = normalForm(givenDice[i]);<br>
    &nbsp;&nbsp;&nbsp;&nbsp;sort(givenDice);<br>
    &nbsp;&nbsp;&nbsp;&nbsp;<font color=blue>int</font> Answer = 1;<br>
    &nbsp;&nbsp;&nbsp;&nbsp;<font color=blue>for</font>( i = 1; i &lt; givenDice.size(); i++)<br>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font color=blue>if</font>(givenDice[i]!=givenDice[i-1])<br>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Answer++;<br>
    &nbsp;&nbsp;&nbsp;&nbsp;<font color=blue>return</font> Answer;<br>
    }
</pre>

Finally, we need to implement the <b>normalForm</b> procedure.
Notice that the die's positon is unambiguously determined by it's front
side and top side. (In this case, any die can occupy at most 6*4 = 24 different
positions.) To generate all the rotations, we need to set each side of
the die as it's front side and then apply <b>rotateRight</b> 4 times.
Let's see the pseudocode:

<pre>
    <font color=blue>string</font> normalForm(<font color=blue>string</font> die){<br>
    &nbsp;&nbsp;&nbsp;&nbsp;<font color=blue>string</font> result = die, tmp;<br>
    &nbsp;&nbsp;&nbsp;&nbsp;<font color=blue>for</font>(<font color=blue>int</font> i = 0; i &lt; 4; i++){<br>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;die = ApplyRotation(die, rotateBack);<br>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;tmp = fourRightRotations(die);<br>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font color=blue>if</font>(tmp &lt; result)result = tmp;<br>
    &nbsp;&nbsp;&nbsp;&nbsp;}<br>
    &nbsp;&nbsp;&nbsp;&nbsp;<i><font color=green>//now all the rotations with side 1, 5, 0, and 4 at front are
    handled</font></i><br><br>
    &nbsp;&nbsp;&nbsp;&nbsp;die = ApplyRotation(die, rotateBack);<br>
    &nbsp;&nbsp;&nbsp;&nbsp;die = ApplyRotation(die, rotateRight);<br>
    &nbsp;&nbsp;&nbsp;&nbsp;die = ApplyRotation(die, rotateBack);<br>
    &nbsp;&nbsp;&nbsp;&nbsp;<i><font color=green>//now side 3 at front</font></i><br><br>
    &nbsp;&nbsp;&nbsp;&nbsp;tmp = fourRightRotations(die);<br>
    &nbsp;&nbsp;&nbsp;&nbsp;<font color=blue>if</font>(tmp &lt; result)result = tmp;<br>
    &nbsp;&nbsp;&nbsp;&nbsp;die = ApplyRotation(die, rotateBack);<br>
    &nbsp;&nbsp;&nbsp;&nbsp;die = ApplyRotation(die, rotateBack);<br>
    &nbsp;&nbsp;&nbsp;&nbsp;<i><font color=green>//now side 2 at front</font></i><br><br>
    &nbsp;&nbsp;&nbsp;&nbsp;tmp = fourRightRotations(die);<br>
    &nbsp;&nbsp;&nbsp;&nbsp;<font color=blue>if</font>(tmp &lt; result)result = tmp;<br>
    &nbsp;&nbsp;&nbsp;&nbsp;<font color=blue>return</font> result;<br>
    }
</pre>

At last, here is the <b>fourRightRotations</b> function, which
applies right rotation four times and returns the lexicographically first among them:

<pre><font color=blue>string</font> fourRightRotations(<font color=blue>string</font> die){<br>
    &nbsp;&nbsp;&nbsp;&nbsp;<font color=blue>string</font> result = die; <br>
    &nbsp;&nbsp;&nbsp;&nbsp;<font color=blue>for</font>(<font color=blue>int</font> j = 0; j &lt; 4; j++){<br>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;die = ApplyRotation(die, rotateRight);<br>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font color=blue>if</font>(die &lt;
    result)result = die;<br>
    &nbsp;&nbsp;&nbsp;&nbsp;}<br>
    &nbsp;&nbsp;&nbsp;&nbsp;<font color=blue>return</font> result;<br>
    }
</pre>

Another approach of recursive generation of the rotations was used by
<tc-webtag:handle coderId="22630491" context="hs_algorithm"/>. See his
<a href="/tc?module=HSProblemSolution&amp;cr=22630491&amp;rd=10064&amp;pm=6512">solution</a> for the details.<br>
<br>
<br>

<font size="+2">
    <b><a href="/stat?c=problem_statement&amp;pm=6694&amp;rd=10064" name="6694">Dragon</a></b>
</font>

<A href="Javascript:openProblemRating(6694)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it"/></A>

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=506034" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0"/></A>

<br>

Used as: Division One - Level Three: <blockquote>
    <table cellspacing="2">

        <tr>

            <td class="bodyText" style="background: #eee;">

                <b>Value</b>

            </td>

            <td class="bodyText" style="background: #eee;">

                950

            </td>

        </tr>

        <tr>

            <td class="bodyText" style="background: #eee;">

                <b>Submission Rate</b>

            </td>

            <td class="bodyText" style="background: #eee;">

                28 / 93 (30.11%)

            </td>

        </tr>

        <tr>

            <td class="bodyText" style="background: #eee;">

                <b>Success Rate</b>

            </td>

            <td class="bodyText" style="background: #eee;">

                8 / 28 (28.57%)

            </td>

        </tr>

        <tr>

            <td class="bodyText" style="background: #eee;">

                <b>High Score</b>

            </td>

            <td class="bodyText" style="background: #eee;">

                <b>YuJieLu</b> for 868.07 points (8 mins 53 secs)

            </td>

        </tr>

        <tr>

            <td class="bodyText" style="background: #eee;">

                <b>Average Score</b>

            </td>

            <td class="bodyText" style="background: #eee;">

                666.22 (for 8 correct submissions)

            </td>

        </tr>

    </table>
</blockquote>

<p>
    In this problem we need to use dynamic programming twice (read <a href="/tc?module=Static&d1=tutorials&d2=dynProg">this</a>
    tutorial if you are unfamiliar with it).
    To compute the probability of the knights' win, we need to predict the dragon's behavior.
    To do this, we need to know when it is worthwhile for the dragon to attack and when it is better to skip and hide in
    the cave.
    At first, for all possible amounts of knights and dragon's heads
    that may appear after dragon's turn, let's determine the probability of knight's victory. Let K[i][j] be the
    probability of victory of <i>i</i> knights over <i>j</i>-headed dragon. This is quite simple - see the following
    pseudocode:</p>

<pre><font color=blue>for</font> i = 0 <font color=blue>to</font> k <font color=blue>do</font> K[i][0] = 1.0;<br>
    <font color=blue>for</font> i = 1 <font color=blue>to</font> k <font color=blue>do</font><br>
    &nbsp;&nbsp;&nbsp;<font color=blue>for</font> j = 1 <font color=blue>to</font> h <font color=blue>do</font><br>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;K[i][j] = probKnight * K[i-1][j-1] + (1 - probKnight) * K[i - 1][j];<br>
</pre>

Now all we need is for each configuration to decide if it is profitable for the dragon
to atack the knights. Let's define D[a][b] as the probability of the knights' win if the a-headed dragon
faces b knights (and the dragon still may attack).
In this case the dragon has two options.
First, he can skip and knights will win with probability K[a][b].
Otherwise, with probability of <b>probDragon</b> he will kill a knight or loose one head otherwise.
In the first case knights will win with probability of D[a][b - 1], and in the second their win will occur with
probability of D[a - 1][b].
This means, the cumulative probability of their win is Pab = (<b>probDragon</b>* D[a][b - 1] + (1 - <b>probDragon</b>) *
D[a - 1][b]).
Therefore, the dragon will attack only if Pab will be smaller than K[a][b], since he wants to minimize the knights'
chances to win.
The following pseudocode calculates D[i][j]'s (the answer to our problem is D[heads][knights]): </p>

<pre><font color=blue>for</font> i = 1 <font color=blue>to</font> k <font color=blue>do</font><br>
    &nbsp;&nbsp;&nbsp;<font color=blue>for</font> j = 1 <font color=blue>to</font> h <font color=blue>do</font><br>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;D[i][j] = <font color=blue>min</font>(K[i][j], probDragon * D[i-1][j] + (1 -
    probDragon) * D[i][j-1]);<br>
</pre>

You can also see <tc-webtag:handle coderId="21111148" context="hs_algorithm"/>'s
<a href="/tc?module=HSProblemSolution&amp;cr=21111148&amp;rd=10064&amp;pm=6694">solution</a> for
a clear implementation of this approach. As an implementation detail, you can solve the problem with only one
two-dimensional array.
To do this you need to store values of D[i][j] in the array K[i][j], overwriting corresponding values of K[i][j]
(clearly, the answer to our problem will be K[heads][knights]):

<pre><font color=blue>for</font> i = 1 <font color=blue>to</font> k <font color=blue>do</font><br>
    &nbsp;&nbsp;&nbsp;<font color=blue>for</font> j = 1 <font color=blue>to</font> h <font color=blue>do</font><br>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;K[i][j] = <font color=blue>min</font>(K[i][j], probDragon * K[i-1][j] + (1 -
    probDragon) * K[i][j-1]);<br>
</pre>


<div class="authorPhoto">
    <img src="/i/m/Pawa_big.jpg" alt="Author" />
</div>
<div class="authorText">
    By&#160;<tc-webtag:handle coderId="10323773" context="algorithm"/><br />
    <em>TopCoder Member</em>
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
