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
    <A href="tc?module=Static&d1=hs&d2=match_editorials&d3=archive">Archive</A><br>
    <span id="printableLink"><A href="Javascript:makeInvisible();">Printable view</A><br></span>
    <span id="navigableLink" class="invisible"><A href="Javascript:makeNavigable();">Normal view</A><br></span>
    <A href="/tc?module=HSRoundOverview&rd=10718&snid=1&er=5">Match Overview</A><br>

<tc-webtag:forumLink forumID="514494" message="Discuss this match" /></div>
<span class="bodySubtitle">TCHS07 Round 2 Gamma</span><br>Thursday, March 8, 2007
<br><br>

<h2>Match summary</h2> 

Completing all three tasks in about 48 minutes, <tc-webtag:handle coderId="21468741" context="hs_algorithm"/> secured the win by a margin of more than 100 points.  At the end of the challenge phase, six coders had solved the hard problem but, by the end of system testing, <tc-webtag:handle coderId="22378820" context="hs_algorithm"/> was the only other to pass system tests on all three problems, earning himself a second place finish.<br /><br /> 

In all, with 100 slots for advancement, and only 35 competitors, earning a positive score was all that was required to stay in the tournament.  Thirty-three of the 35 were able to do so.<br /><br />

<H1> 
The Problems 
</H1>

<font size="+2"> 

<b><a href="/stat?c=problem_statement&amp;pm=7570&amp;rd=10718" name="7570">ItemizedList</a></b> 

</font> 

<A href="Javascript:openProblemRating(7570)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=514494" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

<br> 

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

      34 / 35 (97.14%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Success Rate</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      32 / 34 (94.12%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>High Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Curiouser</b> for 248.19 points (2 mins 25 secs) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Average Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      217.63 (for 32 correct submissions) 

    </td> 

  </tr> 

</table></blockquote> 

Most coders using C++ used the STL map&lt;string, int&gt; here, iterated through the array, and then
iterated through the completed map to generate the required output.  This was easy enough.<br /><br />

Another approach is to first sort the array, then iterate through the array, keeping count of each 
item as you go, and adding the previous item (and it's quantity) to the list whenever a new item is
found.  In Java:

<pre>
public String[] generateList (String[] items) {
    Arrays.sort(items);
    ArrayList ret = new ArrayList();
    String cur = items[0];
    int count = 1;
    for (int i = 1; i < items.length; i++) {
        if (cur.equals(items[i])) {
            count++;
        } else {
            ret.add(cur + " - " + count);
            cur = items[i];
            count = 1;
        }
    }
    ret.add(cur + " - " + count);
    return (String[])ret.toArray(new String[0]);
}
</pre>

 
<font size="+2"> 

<b><a href="/stat?c=problem_statement&amp;pm=7565&amp;rd=10718" name="7565">FractionPoints</a></b> 

</font> 

<A href="Javascript:openProblemRating(7565)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=514494" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

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

      25 / 35 (71.43%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Success Rate</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      13 / 25 (52.00%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>High Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Burunduk3</b> for 458.12 points (8 mins 45 secs) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Average Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      298.77 (for 13 correct submissions) 

    </td> 

  </tr> 

</table></blockquote> 

Careful reading of the problem statement, and implementing the definitions exactly as given, were the
keys to solving this problem.  Three basic pieces of functionality are needed: sorting the data, finding a median 
(being careful to handle appropriately when there are an even or odd number of elements), and extracting
the lower and upper halves of a data set (again, paying attention to parity).<br /><br />

Following how the the terminology was defined in the problem statement, a basic recursive solution seems
pretty natural, and indeed works well here.  However, an iterative approach is also possible.  In general,
we are looking for the "a/b" point in the data.  If a/b = 1/2, then we take the median, and we're done.
Otherwise, if 2a &lt; b, then our desired point is in the lower half, and we need to find the a/(b/2) point of
the lower half.  If 2a > b, then we need the (a-b/2)/(b/2) point from the upper half of the data.<br /><br />

Having noticed this much, we can simply sort our data, and then keep track of the range of elements in
which the target point exists, like this:

<pre>
public double findPoint(int[] data, int numerator, int denominator) {
    Arrays.sort(data);
    int beginPoint = 0;
    int endPoint = data.length - 1;
    while (denominator > 2) {
        if (numerator < denominator / 2) {
            endPoint = (beginPoint + endPoint - 1) / 2;
        } else {
            beginPoint = (beginPoint + endPoint + 2) / 2;
            numerator -= denominator / 2;
        }
        denominator /= 2;
    }
    if ((endPoint - beginPoint) % 2 == 1) {
        int point1 = data[(beginPoint + endPoint) / 2];
        int point2 = data[(beginPoint + endPoint + 1) / 2];
        return 0.5 * (point1 + point2);
    } else {
        return data[(beginPoint + endPoint) / 2];
    }
}
</pre>


<font size="+2"> 

<b><a href="/stat?c=problem_statement&amp;pm=7563&amp;rd=10718" name="7563">YahtzeeAdversary</a></b> 

</font> 

<A href="Javascript:openProblemRating(7563)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=514494" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

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

      6 / 35 (17.14%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Success Rate</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      2 / 6 (33.33%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>High Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Burunduk3</b> for 535.21 points (33 mins 20 secs) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Average Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      523.51 (for 2 correct submissions) 

    </td> 

  </tr> 

</table></blockquote> 

Yahtzee is a pretty popular game, and typically the goal is to maximize one's score.  However, the addition
of an adversary (who has the goal of minimizing the first player's score) into the game changes things a bit.
The variable scoring also means that the optimal stratey might change, depending on what formations are worth
the most points.<br /><br />

First, we need to think about how much effort is involved in determining what we want to know.  Since there
are five dice, and we're going to choose some subset of them to re-roll, this means there are no more than
2<sup>5</sup> = 32 choices that the second player can make.  When we consider the restriction that at least
two dice must be chosen, this number is actually only 26.  (<em>Problem writer's note: the restriction about
having a minimum of two dice was not arbitrary, but was intended instead to prevent the majority of cases, where the
existing dice showed no scoring formation, from having a trivial solution of not re-rolling anything.</em>)<br /><br />

Next, for each of these possible re-rollings, we need to calculate the expected score.  Noting that this
means the average score for each possible result of re-rolling, we can determine in the back of our minds
that there are no more than 6<sup>5</sup> = 7776 possible results after re-rolling the dice.  So, hopefully
it's obvious that 7776 * 26 = 202,176... and more importantly, that brute forcing this easily runs in time.<br /><br />

Now, all that's left is to consider each of the 26 re-rollings, and determine which one has the lowest
expected score.  In my example shown here, note that I calculate the expected score by iterating through 6
possible results for each of the five dice.  For any of the dice that are not being re-rolled, I keep the value
fixed for each of the 6 iterations.  Why do I do this?  Simply put, it allows an easy apples-to-apples
comparison between outcomes, without having to divide and compare floating point numbers.  By doing it this
way, I actually calculated the total score resulting from 7,776 results of re-rolling (some of which are
identical, depending upon how many dice are fixed versus re-rolled).  I can then directly compare these
totals.  Lastly, notice that I generate all of the possible results in lexicographic order already, so that
I don't have to handle tiebreaking if another possible selection has the same expected result.

<pre>
int[] s;
int[] d;

public boolean has(int[] v, int x) {
    for (int i = 0; i < v.length; i++)
        if (v[i] == x)
            return true;
    return false;
}

public int scoreHand(int[] values) {
    int res = 0;
    Arrays.sort(values);
    // Check for Yahtzee
    if (values[0] == values[4])
        res = Math.max(res, s[0]);
    // Check for Full House
    if (values[0] == values[1] && values[3] == values[4] && (values[1] == values[2] || values[2] == values[3]))
        res = Math.max(res, s[3]);
    // Check for large straight
    if (values[1] - values[0] == 1 && values[2] - values[1] == 1 && values[3] - values[2] == 1 && values[4] - values[3] == 1)
        res = Math.max(res, s[1]);
    // Check for small straight
    if (has(values, 3) && has(values, 4)) {
        if (has(values, 2) && (has(values, 1) || has(values, 5)))
            res = Math.max(res, s[2]);
        if (has(values, 5) && has(values, 6))
            res = Math.max(res, s[2]);
    }
    return res;
}

public int getExpectedScore(int[] values) {
    int res = 0;
    int[] i = new int[5];
    for (i[0] = 1; i[0] <= 6; i[0]++)
        for (i[1] = 1; i[1] <= 6; i[1]++)
            for (i[2] = 1; i[2] <= 6; i[2]++)
                for (i[3] = 1; i[3] <= 6; i[3]++)
                    for (i[4] = 1; i[4] <= 6; i[4]++)
                        res += scoreHand(new int[]{
                            has(values, 0) ? i[0] : d[0],
                            has(values, 1) ? i[1] : d[1],
                            has(values, 2) ? i[2] : d[2],
                            has(values, 3) ? i[3] : d[3],
                            has(values, 4) ? i[4] : d[4]});
    return res;
}

public int[] reRollDice(int[] scores, int[] dice) {
    s = scores; d = dice;
    int bestExpected = 999999999;
    int[] best = new int[0];
    int testScore;
    for (int a = 0; a <= 4; a++)
        for (int b = a + 1; b <= 4; b++) {
            testScore = getExpectedScore(new int[]{a, b});
            if (testScore < bestExpected) {
                bestExpected = testScore;
                best = new int[]{a, b};
            }
            for (int c = b + 1; c <= 4; c++) {
                testScore = getExpectedScore(new int[]{a, b, c});
                if (testScore < bestExpected) {
                    bestExpected = testScore;
                    best = new int[]{a, b, c};
                }
                for (int d = c + 1; d <= 4; d++) {
                    testScore = getExpectedScore(new int[]{a, b, c, d});
                    if (testScore < bestExpected) {
                        bestExpected = testScore;
                        best = new int[]{a, b, c, d};
                    }
                    for (int e = d + 1; e <= 4; e++) {
                        testScore = getExpectedScore(new int[]{a, b, c, d, e});
                        if (testScore < bestExpected) {
                            bestExpected = testScore;
                            best = new int[]{a, b, c, d, e};
                        }
                    }
                }
            }
        }
    return best;
}
</pre>



<div class="authorPhoto">
    <img src="/i/m/timmac_big.jpg" alt="Author" />
</div>
<div class="authorText">
    By&#160;<tc-webtag:handle coderId="10407399" context="algorithm"/><br />    <em>TopCoder Member</em>
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
