<%@  page language="java"  %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Statistics</title>

<jsp:include page="../script.jsp" />
<LINK REL="stylesheet" TYPE="text/css" HREF="/css/stats.css"/>

</head>

<body>

<jsp:include page="../top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">
<!-- Left Column Begins-->
        <td width="180">
            <jsp:include page="../includes/global_left.jsp">
                <jsp:param name="level1" value="statistics"/>
                <jsp:param name="level2" value="match_editorials"/>
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

<div style="float: right;" align="right"><A href="/tc?module=Static&d1=match_editorials&d2=archive">Archive</A><br>
<tc-webtag:forumLink forumID="505561" message="Discuss this match" /></div>
<span class="bodySubtitle">SRM 135</span><br>Tuesday, February 11, 2003
<br><br>

<span class="bigTitle">Match summary</span>

<p>
    The last competition before the Collegiate Championship went off without a hitch.   Well over 400 competed in what
    turned out to be a very exciting match.  In Division 1 it was a close race between all of the top rated competitors.
    Lunatic Fringe came out early finishing the easy and medium problems before anyone.  At one point yellow rated
    coders led all of the rooms.  This slowly changed as Yarin, John Dethridge, and Ambrose came through - submitting
    their solutions to the hard problem.  Despite their efforts, Modulator, a yellow rated competitor, emerged from the
    coding phase with the highest score.  In the challenge phase, the top position exchanged numerous times between
    Yarin and Modulator.   Once the system testing had completed, Yarin prevailed with one of the few correct solutions
    to the hard problem.
</p>

<p>
    Division 2 had similar intensity.  Many of the higher rated coders raced through the easy and medium problems to be
    faced with a difficult hard - a permutation problem where timing out was a factor.  A number of submissions were
    made, but in the end only two Division 2 coders successfully completed it.  Mishagam came out on top with 1353
    points and is now competing as a Division 1 coder.
</p>
                             
<H1> The Problems </H1> 


                                        <font size="+2"><b>VideoCrypto</b></font>&#160;
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505561" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

                                            Used as: Division-II, Level 1:
                                        <blockquote><table cellspacing="2">
                                        <tr>
                                        <td style="background: #eee;" class="bodyText"><b>Value</b></td>
                                        <td style="background: #eee;" class="bodyText">300</td>
                                        </tr>
                                        <tr>
                                        <td style="background: #eee;" class="bodyText"><b>Submission Rate</b></td>
                                        <td style="background: #eee;" class="bodyText">212 / 247 (85.83%)</td>
                                        </tr>
                                        <tr>
                                        <td style="background: #eee;" class="bodyText"><b>Success Rate</b></td>
                                        <td style="background: #eee;" class="bodyText">190 / 212 (89.62%)</td>
                                        </tr>
                                        <tr>
                                        <td style="background: #eee;" class="bodyText"><b>High Score</b></td>
                                        <td style="background: #eee;" class="bodyText"><b>Jwizard </b> for 282.60 points</td>
                                        </tr>
                                        </table></blockquote>
                                        Reference Implementation: brett1479 in practice room
                                        <h4>Implementation</h4>


<p>
    In this problem coders were presented with a unique encryption/decryption scheme for black and white pictures.  Given
    the secret key and cyphertext(both pictures), competitors were required to juxtapose the two images and determine
    which spots would be colored in decrypted image.  As explained in the problem, this required a scan through the
    joint image only retaining the color where both a even and immediately following odd numbered column were both
    colored.  This directly translated into 2 for loops: the outer for the rows of the image, and the inner for the
    columns.  The inner was incremented 2 each time to check a group of even and odd blocks per iteration.
</p>

                                        <font size="+2"><b>Plates</b></font>&#160;
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505561" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

                                            Used as: Division-II, Level 2 :
                                        <blockquote><table cellspacing="2">
                                        <tr>
                                            <td style="background: #eee;" class="bodyText"><b>Value</b></td>
                                            <td style="background: #eee;" class="bodyText">550</td>
                                            </tr>
                                            <tr>
                                            <td style="background: #eee;" class="bodyText"><b>Submission Rate</b></td>
                                            <td style="background: #eee;" class="bodyText">111 / 247 (44.94%)</td>
                                            </tr>
                                            <tr>
                                            <td style="background: #eee;" class="bodyText"><b>Success Rate</b></td>
                                            <td style="background: #eee;" class="bodyText">68 / 111 (61.26%)</td>
                                            </tr>
                                            <tr>
                                            <td style="background: #eee;" class="bodyText"><b>High Score</b></td>
                                            <td style="background: #eee;" class="bodyText"><b>jdandr2 </b> for 509.98 points</td>
                                        </tr>
                                        </table></blockquote>

                                            Used as: Division-I Level 1 :
                                        <blockquote><table cellspacing="2">
                                        <tr>
                                            <td style="background: #eee;" class="bodyText"><b>Value</b></td>
                                            <td style="background: #eee;" class="bodyText">250</td>
                                            </tr>
                                            <tr>
                                            <td style="background: #eee;" class="bodyText"><b>Submission Rate</b></td>
                                            <td style="background: #eee;" class="bodyText">157 / 172 (91.28%)</td>
                                            </tr>
                                            <tr>
                                            <td style="background: #eee;" class="bodyText"><b>Success Rate</b></td>
                                            <td style="background: #eee;" class="bodyText">130 / 157 (82.80%)</td>
                                            </tr>
                                            <tr>
                                            <td style="background: #eee;" class="bodyText"><b>High Score</b></td>
                                            <td style="background: #eee;" class="bodyText"><b>radeye </b> for 248.28 points</td>
                                        </tr>
                                        </table></blockquote>

                                        Reference Implementation: brett1479 in practice room
                                        <h4>Implementation</h4>

<p>
    As described in the problem, license plates have a distinct format composed of letters and digits.  Supposing that
    license plates were assigned lexicographically (dictionary ordering) coders were asked to calculate how many
    license plates could still be generated given the format and the last assigned plate.  To quickly calculate the
    remaining values one could transform the given plate number into a numeric value.  This is done by realizing the
    letter digits of the plate are base 26 values whereas the digits are base 10.  A string of multiplications quickly
    determines the necessary number.  For example, lets say you had the license plate "9448".  Since all are digits,
    all represent base 10 values.  The calculation goes as follows: ((9*10+4)*10+4)*10+8) = 9448.  The multiplications
    have been written out explicitly so the loop structure of the resulting code could be inferred.  Another example
    may be "AB98A" whose calculation would be:
(((0*26+1)*10+9)*10+8)*26+0 where 'A' and 'B' are treated as 0 and 1 respectively.  As illustrated here, a loop that
    tests whether each character is a digit and multiplies by 10 or 26 accordingly produces the correct result.
</p>

                                        <font size="+2"><b>Marriage</b></font>&#160;
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505561" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

                                            Used as: Division-II, Level 3:
                                            <blockquote><table cellspacing="2">
                                        <tr>
                                            <td style="background: #eee;" class="bodyText"><b>Value</b></td>
                                            <td style="background: #eee;" class="bodyText">1000</td>
                                            </tr>
                                            <tr>
                                            <td style="background: #eee;" class="bodyText"><b>Submission Rate</b></td>
                                            <td style="background: #eee;" class="bodyText">22 / 247 (8.91%)</td>
                                            </tr>
                                            <tr>
                                            <td style="background: #eee;" class="bodyText"><b>Success Rate</b></td>
                                            <td style="background: #eee;" class="bodyText">3 / 22 (13.64%)</td>
                                            </tr>
                                            <tr>
                                            <td style="background: #eee;" class="bodyText"><b>High Score</b></td>
                                            <td style="background: #eee;" class="bodyText"><b>mishagam </b> for 601.63 points</td>
                                        </tr>
                                        </table></blockquote>
                                        Reference Implementation: brett1479 in practice room
                                        <h4>Implementation</h4>

<p>
    This problem asked coders to arrange marriages between a group of men and women given how they felt about each
    other.  The input contained the satisfaction values each person would receive for marrying a particular mate.  By
    computing every permutation of mates and selecting the highest sum we arrive at our answer.  The only catch is,
    avoid marriages that produce negative satisfaction values.  This is done via a check in the recursion as seen in
    the reference implementation.  To avoid timing out, make sure you eliminate the people you have married together
    from future recursive steps.  This can be done via a boolean array that marks who has already been married.
</p>

                                        <font size="+2"><b>Clusters</b></font>&#160;
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505561" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

                                            Used as: Division-I, Level 2:
                                            <blockquote><table cellspacing="2">
                                        <tr>
                                            <td style="background: #eee;" class="bodyText"><b>Value</b></td>
                                            <td style="background: #eee;" class="bodyText">450</td>
                                            </tr>
                                            <tr>
                                            <td style="background: #eee;" class="bodyText"><b>Submission Rate</b></td>
                                            <td style="background: #eee;" class="bodyText">128 / 172 (74.42%)</td>
                                            </tr>
                                            <tr>
                                            <td style="background: #eee;" class="bodyText"><b>Success Rate</b></td>
                                            <td style="background: #eee;" class="bodyText">48 / 128 (37.50%)</td>
                                            </tr>
                                            <tr>
                                            <td style="background: #eee;" class="bodyText"><b>High Score</b></td>
                                            <td style="background: #eee;" class="bodyText"><b>Lunatic Fringe </b> for 385.21 points</td>
                                        </tr>
                                        </table></blockquote>
                                        Reference Implementation: brett1479 in practice room
                                        <h4>Implementation</h4>


<p>
    The clustering coefficient of a particular vertex in a graph is the ratio between how many of its neighbors are
    connected and how many of its neighbors could be connected.  This type of analysis is typically used in
    acquaintance graphs that study social patterns and thus the "friendship" analogy may be helpful here.  If someone
    has a high clustering coefficient it means, in general, that many of his/her friends are friends with each other.
    In this example, the "linkage" analogy was used as is sometimes done in search engines.  A web page would receive
    a high clustering score if the pages it links to were highly interlinked.  To solve this problem you dump all of
    the input into a large adjacency matrix and iterate through it.  For each vertex determine all of its neighbors,
    and count how many edges they had between them.  Dividing this value by
    n*(n-1) (number of total possible directed edges between n vertices) will produce the clustering coefficient.
    To avoid rounding issues it can be easier to leave the values in numerator/denominator format and compare accordingly.
</p>

                                        <font size="+2"><b>CircleHighway</b></font>&#160;
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505561" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

                                            Used as: Division-I, Level 3:
                                            <blockquote><table cellspacing="2">
                                        <tr>
                                            <td style="background: #eee;" class="bodyText"><b>Value</b></td>
                                            <td style="background: #eee;" class="bodyText">950</td>
                                            </tr>
                                            <tr>
                                            <td style="background: #eee;" class="bodyText"><b>Submission Rate</b></td>
                                            <td style="background: #eee;" class="bodyText">27 / 172 (15.70%)</td>
                                            </tr>
                                            <tr>
                                            <td style="background: #eee;" class="bodyText"><b>Success Rate</b></td>
                                            <td style="background: #eee;" class="bodyText">5 / 27 (18.52%)</td>
                                            </tr>
                                            <tr>
                                            <td style="background: #eee;" class="bodyText"><b>High Score</b></td>
                                            <td style="background: #eee;" class="bodyText"><b>Yarin </b> for 701.43 points</td>
                                        </tr>
                                        </table></blockquote>
                                        Reference Implementation: brett1479 in practice room
                                        <h4>Implementation</h4>

<p>
    The last thing you want to do in Siberia is push your car.  To minimize the agony of such an experience this problem
    asked for the minimum amount of initial pushing that would be required to allow your vehicle to make one complete
    1000km pushless trip around the track.  Gas stations along the way were low on gas and could not always be counted
    on for help.  In addition, the car's tank can only holds enough gas to travel 500km so poorly placed gas stations
    could ruin any chances of success.  One of the easier solutions was to assume your were in the correct starting
    position and simulate a test run.  If you failed, record how much you failed by, push the car that distance, and
    repeat the process.  After iterating this process 10 or so times, if you still haven't found a solution, place your
    car at the next gas station and try again.  This strategy was used in the reference implementation.
</p>

<p>
<img src="/i/m/brett1479_mug.gif" alt="" width="55" height="61" border="0" hspace="6" vspace="1" align="left" class="myStatsPhoto"/><br />
By&#160;<tc-webtag:handle coderId="251317" context="algorithm"/><br />
<span class="smallText"><em>TopCoder Member</em></span><br clear="all" />
</p>

</div>
</td>

<!-- Center Column Ends -->

<!-- Right Column Begins -->
         <td width="170">
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

<jsp:include page="../foot.jsp" />

</body>

</html>
