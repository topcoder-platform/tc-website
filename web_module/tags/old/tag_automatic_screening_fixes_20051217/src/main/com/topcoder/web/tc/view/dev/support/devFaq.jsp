<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>

<head>
<title>Development FAQ</title>

<jsp:include page="../../script.jsp" />

</head>

<body>

<jsp:include page="../../top.jsp" >
    <jsp:param name="level1" value="development"/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">
<!-- Left Column Begins-->
        <td width="180">
            <jsp:include page="/includes/global_left.jsp">
                <jsp:param name="level1" value="development"/>
                <jsp:param name="level2" value="support"/>
                <jsp:param name="level3" value="faq"/>
            </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Gutter Begins -->
        <td width="15"><img src="/i/clear.gif" width="15" height="1" border="0"/></td>
<!-- Gutter Ends -->

<!-- Center Column Begins -->
<td class="bodyText" WIDTH="100%"><img src="/i/clear.gif" width="400" height="1" vspace="5" border="0"><br />

            <p align=right>
                        <a href="#des_dev">Design / Development Ratings</a>&nbsp;&nbsp;|&nbsp;&nbsp;
                        <a href="#reliability">Reliability Rating</a></p>

<h2>Development Faq</h2>
<p>If you have any questions concerning component or application competitions and statistics that are not answered here, please send an email to <A href="mailto:service@topcoder.com">service@topcoder.com</A>.</p>

                <a name="des_dev"></a>
                <h3>Design / Development Ratings</h3>

                <p>
                After each competition, each coder who submitted a solution to the competition is re-rated according to the following algorithm. Keep in mind that software competitions consist of the last 500 scored components of the same level.  The ranking of each coder is then determined based on the score the coder received compared to the scores of the components of the same level.  The rating used for the previous scores is the rating of the coder at the time the coder submitted the solution.
                The average rating of everyone is then calculated:
                <BR/>
                                    <BR/>
                                    <IMG ALT="average rating" HEIGHT="58" WIDTH="167" SRC="/i/rating/avg.gif" ALIGN="center" BORDER="0"/><BR/>
                                    <BR/>
                Where NumCoders is the number of coders in the competition and Rating is the
                rating without the volatility of the coder in the competition before the competition.
                <BR/>
                                    <BR/>
                <B>The competition factor is calculated:</B>
                <BR/>
                                    <BR/>
                                    <IMG ALT="competition factor" HEIGHT="62" WIDTH="356" SRC="/i/rating/cf.gif" ALIGN="center" BORDER="0"/><BR/>
                                    <BR/>
                Where Volatility is the volatility of the coder in the competition before the competition.
                <BR/>
                                    <BR/>
                <B>The skill of the coder is calculated:</B>
                <BR/>
                                    <BR/>
                                    <IMG ALT="skill" HEIGHT="34" WIDTH="138" SRC="/i/rating/skill.gif" ALIGN="center" BORDER="0"/><BR/>
                                    <BR/>
                Where Rating is the coder's rating before the competition.
                <BR/>
                                    <BR/>
                <B>The deviation of the coder is calculated:</B>
                <BR/>
                                    <BR/>
                                    <IMG ALT="deviation" HEIGHT="34" WIDTH="141" SRC="/i/rating/dev.gif" ALIGN="center" BORDER="0"/><BR/>
                                    <BR/>
                Where Volatility is the volatility of the coder before the competition.
                <BR/>
                                    <BR/>
                The probability of the coder getting a higher score than another coder in the
                competition (WPi for i from 1 to NumCoders) is estimated.  See below for the 'Estimation Algorithm'.
                The expected rank of the coder is calculated:
                <BR/>
                                    <BR/>
                                    <IMG ALT="expected rank" HEIGHT="39" WIDTH="118" SRC="/i/rating/er.gif" ALIGN="center" BORDER="0"/><BR/>
                                    <BR/>
                <B>The expected performance of the coder is calculated:</B>
                <BR/>
                                    <BR/>
                                    <IMG ALT="expected performance" HEIGHT="34" WIDTH="170" SRC="/i/rating/ep.gif" ALIGN="center" BORDER="0"/><BR/>
                                    <BR/>
                Where <IMG ALT="inverse standard normal" HEIGHT="11" WIDTH="11" SRC="/i/rating/phi.gif" BORDER="0"/>
                is the inverse of the standard normal function.
                <BR/>
                                    <BR/>
                <B>The actual performance of each coder is calculated:</B>
                <BR/>
                                    <BR/>
                                    <IMG ALT="expected performance" HEIGHT="34" WIDTH="170" SRC="/i/rating/ap.gif" ALIGN="center" BORDER="0"/><BR/>
                                    <BR/>
                Where ARank is the actual rank of the coder in the competition based on score
                (1 for first place, NumCoders forlast).  If the coder tied with another coder,
                the rank is the average of the positions covered by the tied coders.
                <BR/>
                                    <BR/>
                <B>The performed as rating of the coder is calculated:</B>
                <BR/>
                                    <BR/>
                                    <IMG ALT="performed as" HEIGHT="14" WIDTH="286" SRC="/i/rating/pa.gif" ALIGN="center" BORDER="0"/><BR/>
                                    <BR/>
                <B>The weight of the competition for the coder is calculated:</B>
                <BR/>
                                    <BR/>
                                    <IMG ALT="weight of the competition" HEIGHT="37" WIDTH="223" SRC="/i/rating/wt.gif" ALIGN="center" BORDER="0"/><BR/>
                                    <BR/>
                Where TimesPlayed is the number of times the coder has been rated before.
                <BR/>
                                    <BR/>
                To stabilize the higher rated members, the Weight of members whose rating is
                between 2000 and 2500 is decreased 10% and the Weight of members whose rating
                is over 2500 is decreased 20%.
                <BR/>
                                    <BR/>
                <B>A cap is calculated:</B>
                <BR/>
                                    <BR/>
                                    <IMG ALT="cap" HEIGHT="37" WIDTH="186" SRC="/i/rating/cap.gif" ALIGN="center" BORDER="0"/><BR/>
                                    <BR/>
                <B>The new volatility of the coder is calculated:</B>
                <BR/>
                                    <BR/>
                                    <IMG ALT="new volatility" HEIGHT="46" WIDTH="421" SRC="/i/rating/nv.gif" ALIGN="center" BORDER="0"/><BR/>
                                    <BR/>
                <B>The new rating of the coder is calculated:</B>
                <BR/>
                                    <BR/>
                                    <IMG ALT="new rating" HEIGHT="37" WIDTH="253" SRC="/i/rating/nr.gif" ALIGN="center" BORDER="0"/><BR/>
                                    <BR/>
                If |NewRating - Rating| &#62; Cap the NewRating is adjusted so it is at most Cap different than Rating.
                <BR/>
                                    <BR/>
                                    <HR/>
                                    <BR/>
                                    <BR/>
                <B>Estimation Algorithm:</B>
                <BR/>
                                    <BR/>
Taking the difference of each coder's performance is also a normal
distribution.  A positive value would then indicate a win and a negative
value would indicate a loss.  The percentage chance that a player wins,
therefore, uses the standard normal cumulative disribution as follows:
    <BR />
 &#160;&#160;&#160;&#160;        WinProbability( SkillA, DeviationA, SkillB, DeviationB)
    <BR/>
 &#160;&#160;&#160;&#160;        Return snorm( (SkillB-SkillA) / Math.sqrt(DeviationA^2 + DeviationB^2) )

<BR/>Using this model, a coder's
performance can be turned into a percentage using the normal distribution, so that 50% represents expected
performance and 25% represents better three days out of four, etc.  Then, to estimate the probability that the
coder beats coder i, the range from 0% to 100% is broken into 1% blocks, and the midpoint is taken of each
block and the corresponding performance is computed.  The win probability is the number of blocks where the
midpoint favors coder i.  If it's a tie, the block is split between both coders.
                <BR/>
                                    <BR/>
Here is the psuedo-code function to estimate the probability of coder A beating coder B
(<IMG ALT="inverse standard normal" HEIGHT="11" WIDTH="11" SRC="/i/rating/phi.gif" BORDER="0"/> is the inverse of the
standard normal function):
                <BR/>
                                    <BR/>
WinProbability( SkillA, DeviationA, SkillB, DeviationB)
                <BR/>
         Set count, a, b to 0.
                <BR/>
         Set fa = SkillA + <!-- <SPAN STYLE="font-family:Symbol;">f</SPAN> -->f((a + .5)/100)*DeviationA
                <BR/>
         Set fb = SkillB + <!-- <SPAN STYLE="font-family:Symbol;">f</SPAN> -->f((b + .5)/100)*DeviationB
                <BR/>
         While (a&#60;100)
                <BR/>
 &#160;&#160;        If fa&#60;fb:
                <BR/>
 &#160;&#160;&#160;&#160;         Add 100-b to count
                <BR/>
  &#160;&#160;&#160;&#160;        Increment a
                <BR/>
&#160;&#160;&#160;&#160; Set fa = SkillA + <!-- <SPAN STYLE="font-family:Symbol;">f</SPAN> -->f((a + .5)/100)*DeviationA
                <BR/>
&#160;&#160;         If fa == fb:
                <BR/>
&#160;&#160;&#160;&#160;          Add 100-b-.5 to count
                <BR/>
&#160;&#160;&#160;&#160;          Increment a
                <BR/>
&#160;&#160;&#160;&#160;          Increment b
                <BR/>
&#160;&#160;&#160;&#160;         Set fa = SkillA + <!-- <SPAN STYLE="font-family:Symbol;">f</SPAN> -->f((a + .5)/100)*DeviationA
                <BR/>
&#160;&#160;&#160;&#160;         Set fb = SkillB + <!-- <SPAN STYLE="font-family:Symbol;">f</SPAN> -->f((b + .5)/100)*DeviationB
                <BR/>
&#160;&#160;         If fa&#62;fb:
                <BR/>
&#160;&#160;&#160;&#160;            Increment b
                <BR/>
&#160;&#160;&#160;&#160;            Set fb = SkillB + <!-- <SPAN STYLE="font-family:Symbol;">f</SPAN> -->f((b + .5)/100)*DeviationB
                <BR/>
            Return count  (count is the win probability)
            </p>

                <a name="reliability"></a>
            <h3>Reliability Rating</h3>
<p>Member profiles have been modified to reflect a reliability factor for all component design and development competitions.
The reliability factor is calculated as the percent of projects that a member registers for in which that same
member presents a timely submission that achieves the minimum passing component score of 70.</p>

<p>Members will be eligible to receive a bonus on top of any prize money won if their Reliability Ratings are equal to or exceed
80%. Winning members with Reliability Ratings equal to or exceeding 80% and less than 90% will receive a bonus equal to 10%
of the prize. For Reliability Ratings equal to or exceeding 90% and less than 95%, winning members will receive a bonus equal
to 15% of the prize. And winning members with a Reliability Rating equal to or exceeding of 95% will receive a bonus equal
to 20% of the prize. The following is an example of payouts based on the member's Reliability Rating:</p>


			<table width="400" align="center" border="0" cellpadding="5" cellspacing="2" class="sidebarBox">

                <tr>

                	<td class="sidebarTitle">0% - 79%</td>
                    <td class="sidebarTitle">80% - 89%</td>
                    <td class="sidebarTitle">90% - 94%</td>
                    <td class="sidebarTitle">95 - 100%</td>
                </tr>


                <tr>

                    <td class="sidebarText">$5,000</td>
                    <td class="sidebarText">$5,500</td>
                    <td class="sidebarText">$5,750</td>
                    <td class="sidebarText">$6,000</td>
                </tr>
                <tr>

                    <td class="sidebarText">$2,000</td>
                    <td class="sidebarText">$2,200</td>
                    <td class="sidebarText">$2,300</td>
                    <td class="sidebarText">$2,400</td>
                </tr>
                <tr>

                    <td class="sidebarText">$500</td>
                    <td class="sidebarText">$550</td>
                    <td class="sidebarText">$575</td>
                    <td class="sidebarText">$600</td>
                </tr>
               	<tr>

                    <td class="sidebarText">$200</td>
                    <td class="sidebarText">$220</td>
                    <td class="sidebarText">$230</td>
                    <td class="sidebarText">$240</td>
                </tr>
               	<tr>

                    <td class="sidebarText">$100</td>
                    <td class="sidebarText">$110</td>
                    <td class="sidebarText">$115</td>
                    <td class="sidebarText">$120</td>
                </tr>

            </table>

            <p><br/></p>
        </td>
<!-- Center Column Ends -->

<!-- Gutter -->
         <td width="15"><img src="/i/clear.gif" width="15" height="1" border="0"></td>
<!-- Gutter Ends -->

<!-- Right Column Begins -->
         <td width="180">
            <jsp:include page="../right.jsp"/>
         </td>
<!-- Right Column Ends -->

<!-- Gutter -->
         <td width="2"><img src="/i/clear.gif" width="2" height="1" border="0"></td>
<!-- Gutter Ends -->

    </tr>
</table>

<jsp:include page="../../foot.jsp" />

</body>

</html>
