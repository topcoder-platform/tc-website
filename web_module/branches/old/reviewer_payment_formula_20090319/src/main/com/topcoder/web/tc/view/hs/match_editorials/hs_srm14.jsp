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

        <tc-webtag:forumLink forumID="506036" message="Discuss this match"/></div>
    <span class="bodySubtitle">TCHS SRM 14</span><br>Monday, September 11, 2006
    <br><br>

    <h2>Match summary</h2>


    <p>
        This problem set was a bit harder then the average High School match. Though the problems didn't require a
        knowledge of complex algorithms, all of them required some careful coding, especially when handling border
        cases.
        These challenges led to a success rate of around 60% for each of the problems.<br>
        <br>
        The begining of the match belonged to <tc-webtag:handle coderId="11972352" context="hs_algorithm"/>, who got the
        fastest solution on the easy problem and the second fastest on the medium, giving him an impressive 744.01 out
        of 750 points. Many other coders were not far behind, however, and the final result came down to their
        performance on the tricky 1,000 point problem.
        After the end of the coding phase <tc-webtag:handle coderId="22375930" context="hs_algorithm"/> held first place
        with a great score of 1563.93, <tc-webtag:handle coderId="22268848" context="hs_algorithm"/>
        was second with 1491.21, followed by
        <tc-webtag:handle coderId="20812309" context="hs_algorithm"/>, with
        <tc-webtag:handle coderId="21111148" context="hs_algorithm"/> right after him, both with over 1480 points.
        After the challenge phase <tc-webtag:handle coderId="22375930" context="hs_algorithm"/> was still in first, with
        an extra 25 points. <tc-webtag:handle coderId="20812309" context="hs_algorithm"/>
        moved to second, thanks to 75 points from challenges, and
        <tc-webtag:handle coderId="20331303" context="hs_algorithm"/> advanced to third after grabbing 225 challange
        points. It's worth noting that both <tc-webtag:handle coderId="20812309" context="hs_algorithm"/> and
        <tc-webtag:handle coderId="20331303" context="hs_algorithm"/> were fighting for challenges in the same room.
        System tests brought down a fair number of solutions, but didn't change the top three spots.

    </p>


    <H1>

        The Problems

    </H1>

</p>


<font size="+2">

    <b><a href="/stat?c=problem_statement&amp;pm=6720&amp;rd=10066" name="6720">Xox</a></b>

</font>

<A href="Javascript:openProblemRating(6720)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it"/></A>

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=506036" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0"/></A>

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

                153 / 158 (96.84%)

            </td>

        </tr>

        <tr>

            <td class="bodyText" style="background: #eee;">

                <b>Success Rate</b>

            </td>

            <td class="bodyText" style="background: #eee;">

                94 / 153 (61.44%)

            </td>

        </tr>

        <tr>

            <td class="bodyText" style="background: #eee;">

                <b>High Score</b>

            </td>

            <td class="bodyText" style="background: #eee;">

                <b>Zuza</b> for 249.24 points (1 mins 34 secs)

            </td>

        </tr>

        <tr>

            <td class="bodyText" style="background: #eee;">

                <b>Average Score</b>

            </td>

            <td class="bodyText" style="background: #eee;">

                219.87 (for 94 correct submissions)

            </td>

        </tr>

    </table>
</blockquote>

<p>
    All you need to do is to loop through the text, mark all the letters that are included in a "xox" and return the
    number of marked letters. The sample code can be as follows:
<pre>
    public int count(String text) {
    int res=0;
    boolean b[]=new boolean[50];
    for(int i=0;i&lt;text.length()-2;i++)
    if(text.substring(i,i+3).equals("xox")) b[i]=b[i+1]=b[i+2]=true;
    for(boolean x : b)if(x)res++;
    return res;
    }
</pre>
It doesn't seem difficult to code, and yet many, even high rated coders, got it wrong. Most of the failed solutions
weren't wrong answers, but exceptions when one reaches out of the array or string bounds, for testcases like "h". You
can also look at the nice <tc-webtag:handle coderId="12005484" context="hs_algorithm"/>
<a href="/tc?module=HSProblemSolution&amp;cr=12005484&amp;rd=10066&amp;pm=6720">solution</a> that uses set, in place of
array, for marking letters.
<br><br>


<font size="+2">

    <b><a href="/stat?c=problem_statement&amp;pm=6721&amp;rd=10066" name="6721">FriendsTrouble</a></b>

</font>

<A href="Javascript:openProblemRating(6721)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it"/></A>

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=506036" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0"/></A>

<br>

Used as: Division One - Level Two: <blockquote>
    <table cellspacing="2">

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

                131 / 158 (82.91%)

            </td>

        </tr>

        <tr>

            <td class="bodyText" style="background: #eee;">

                <b>Success Rate</b>

            </td>

            <td class="bodyText" style="background: #eee;">

                82 / 131 (62.60%)

            </td>

        </tr>

        <tr>

            <td class="bodyText" style="background: #eee;">

                <b>High Score</b>

            </td>

            <td class="bodyText" style="background: #eee;">

                <b>cypressx</b> for 496.30 points (2 mins 27 secs)

            </td>

        </tr>

        <tr>

            <td class="bodyText" style="background: #eee;">

                <b>Average Score</b>

            </td>

            <td class="bodyText" style="background: #eee;">

                400.91 (for 82 correct submissions)

            </td>

        </tr>

    </table>
</blockquote>

<p>
If you are familiar with the basis of the grah theory, this problem can be translated into
<br><br><i>Given an undirected graph, find the number of
    <a href="http://en.wikipedia.org/wiki/Connected_component_(graph_theory)">connected components</a>.</i>
<br><br>
Most of the coders used dfs to mark all the vertices of the connected component. The answer in that case is the number
of the times you need to run dfs to cover the whole graph. The fastest
<a href="/tc?module=HSProblemSolution&amp;cr=8471704&amp;rd=10066&amp;pm=6721">submission</a> by
<tc-webtag:handle coderId="8471704" context="hs_algorithm"/> uses exaclty this idea.
<br><br>
There is another possible solution, that doesn't require any graph knowledge. The pseudo code follows:
<ul>
    <li>Iinitalize Group[i]=i for each person i</li>
    <li>For every pair of friends (i,j)</li>
    <ul>
        <li>if Group[i] != Group[j] merge i and j into single group</li>
    </ul>
    <li>Return the number of groups left</li>
</ul>
This approach can be seen in<tc-webtag:handle coderId="22629916" context="hs_algorithm"/>'s
<a href="/tc?module=HSProblemSolution&amp;cr=22629916&amp;rd=10066&amp;pm=6721">code</a>.
<br><br>

<font size="+2">

    <b><a href="/stat?c=problem_statement&amp;pm=6722&amp;rd=10066" name="6722">TournamentSchedule</a></b>

</font>

<A href="Javascript:openProblemRating(6722)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it"/></A>

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=506036" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0"/></A>

<br>

Used as: Division One - Level Three: <blockquote>
    <table cellspacing="2">

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

                38 / 158 (24.05%)

            </td>

        </tr>

        <tr>

            <td class="bodyText" style="background: #eee;">

                <b>Success Rate</b>

            </td>

            <td class="bodyText" style="background: #eee;">

                22 / 38 (57.89%)

            </td>

        </tr>

        <tr>

            <td class="bodyText" style="background: #eee;">

                <b>High Score</b>

            </td>

            <td class="bodyText" style="background: #eee;">

                <b>Weiqi</b> for 836.11 points (13 mins 7 secs)

            </td>

        </tr>

        <tr>

            <td class="bodyText" style="background: #eee;">

                <b>Average Score</b>

            </td>

            <td class="bodyText" style="background: #eee;">

                559.90 (for 22 correct submissions)

            </td>

        </tr>

    </table>
</blockquote>

<p>
    After taking a glance at the constraints one should realize that, with a maximum of six teams, a bruteforce solution
    won't have a problem running in time.
    There are two things you need to handle when generating the schedule:
    <ul>
        <li>Do not count the same schedule twice.</li>
        <li>Make sure that schedule is in accordance with the given preferences.</li>
    </ul>

    <p>
        To address the first point you can assign the unique representation to every round. One way to do that is
        representing it as a list of <b>n/2</b> pairs,
        where each pair has the lower index on the first position and additionally pairs are sorted by the first
        element.
        In example:
        <pre>
            A B C
            3-5 1-2 0-4
            2-1 3-5 1-2
            0-4 4-0 3-5
        </pre>
        All A,B,C represent the same round, but only C is corresponding to the above constraints. Please note that every
        round setting can be uniquely represented
        in this fashion. So generating only rounds in this format will ensure that you will count each of the schedules
        exactly once. Now generating all the schedules can be done
        by recursive function, which generates pairs one by one:
        <pre>
            int generate(int round, int match){
            if(round == n-1){ //we have found a solution
            return 1;
            }
            if(match == n/2){ //the whole round was generated
            return(round + 1, 0);
            }
            int result = 0;
            int a = 0;
            //we set a to the first team that wasn't assigned in that round
            while(usedInRound[a][round])a++;
            usedInRound[a][round] = true;
            //b will be always greater than a
            for(int b = a+1;b&lt;n;b++){
            if(usedInRound[b][round])continue;
            //every two teams can play only once, one against the other.
            if(played[a][b])continue;
            usedInRound[b][round] = true;
            played[a][b] = true;
            result += generate(round, match+1);
            usedInRound[b][round] = false;
            played[a][b] = false;
            }
            usedInRound[a][round] = false;
            return result;
            }
        </pre>
        The only thing missing is compliance with the given preferences.
        You just need to add a check in each step, before generating the pair (a,b) in any round, to test if a or b
        needs to play with somebody else in that round. If it's so, you don't take this pair.
        The other way is to add a check, after generating the each whole round, to see if the needed matches are in it.
        You can take a look on the <a href="/tc?module=HSProblemSolution&amp;cr=22375930&amp;rd=10066&amp;pm=6722">
        fastest solution</a> by <tc-webtag:handle coderId="22375930" context="hs_algorithm"/>, who used this approach.
    </p>

  <div class="authorPhoto">
    <img src="/i/m/slex_big.jpg" alt="" width="55" height="61" border="0" hspace="6" vspace="1" align="left" class="myStatsPhoto"/>
    <br/>
  </div>
<div class="authorText">
    By&#160;<tc-webtag:handle coderId="8382018" context="algorithm"/><br/>    <em>TopCoder Member</em>
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
