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
<tc-webtag:forumLink forumID="505568" message="Discuss this match" /></div>
<span class="bodySubtitle">SRM 137</span><br>Thursday, March 6, 2003
<br><br>
                                 
<H1> The Problems </H1> 

                                       <p>
                                            The phrase "March Madness" best describes the last SRM.  Over 15% of the division 1 competitors submitted the hard problem, but only 2 passed systests.  SnapDragon, who won the competition, resubmitted the hard problem twice, and eventually won by successfully challenging 5 of the coders in his room.  "I didn't even check the last [challenge], I just went for the sweep" said SnapDragon, after sucessfully challenging all of the div 1 hards in his room.  schveiguy, the second place finisher, had the highest problem score but could not top SnapDragon's challenge round performance.  Division 2 coders faced similar difficulties, with only 10 coders passing systests on the hard problem.

                                        </p>
                                        <font size="+2"><b>MedianOfMedians</b></font>&#160;
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505568" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />
                                        Used as: Division 2 - Level 1:
                                        <blockquote>
                                            <table cellspacing="2">
                                                <tr>
                                                    <td style="background: #eee;" class="bodyText">
                                                        <b>Value</b>
                                                    </td>
                                                    <td style="background: #eee;" class="bodyText">250</td>
                                                </tr>
                                                <tr>
                                                    <td style="background: #eee;" class="bodyText">
                                                        <b>Submission Rate</b>
                                                    </td>
                                                    <td style="background: #eee;" class="bodyText">204 / 227  (89.87%) </td>
                                                </tr>
                                                <tr>
                                                    <td style="background: #eee;" class="bodyText">
                                                        <b>Success Rate</b>
                                                    </td>
                                                    <td style="background: #eee;" class="bodyText">175 / 204  (85.78%)</td>
                                                </tr>
                                                <tr>
                                                    <td style="background: #eee;" class="bodyText">
                                                        <b>High Score</b>
                                                    </td>
                                                    <td style="background: #eee;" class="bodyText">
                                                        <b>koder</b> for 247.71 points
                                                    </td>
                                                </tr>
                                            </table>
                                        </blockquote>
                                        <p>
                                            The most straightforward way to solve this problem involved sorting each of the rows given.  Extracting the second element from each of these sorted rows will produce a new list of 3 elements.  Sorting this list, and taking the second elment will produce the result.  Coders need not convert the given input to integer values until the very end, since sorting the characters will produce the same results.</p>

                                        <font size="+2"><b>PQNumbers</b></font>&#160;
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505568" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

                                        Used as: Division 2 - Level 2:
                                        <blockquote>
                                            <table cellspacing="2">
                                                <tr>
                                                    <td style="background: #eee;" class="bodyText">
                                                        <b>Value</b>
                                                    </td>
                                                    <td style="background: #eee;" class="bodyText">500</td>
                                                </tr>
                                                <tr>
                                                    <td style="background: #eee;" class="bodyText">
                                                        <b>Submission Rate</b>
                                                    </td>
                                                    <td style="background: #eee;" class="bodyText">115 / 227  (50.66%) </td>
                                                </tr>
                                                <tr>
                                                    <td style="background: #eee;" class="bodyText">
                                                        <b>Success Rate</b>
                                                    </td>
                                                    <td style="background: #eee;" class="bodyText">52 / 115  (45.22%)</td>
                                                </tr>
                                                <tr>
                                                    <td style="background: #eee;" class="bodyText">
                                                        <b>High Score</b>
                                                    </td>
                                                    <td style="background: #eee;" class="bodyText">
                                                        <b>sh_maestro</b> for 444.07 points
                                                    </td>
                                                </tr>
                                            </table>
                                        </blockquote>
                                        <p>

                                            Given 2 numbers we are going to consider the possible values generated by multiplying powers of them together.  In other words, given numbers p and q we are going to consider values of the form p^k * q^j.  Since we are guaranteed that all necessary values will be no greater than 1 million, we can loop through all possible exponents of p and q, and store all of the products, ignoring any values that are greater than 1 million.  All of the generated values can be thrown into a sorted set structure whereby, the nth largest value is easily extracted.
                                        </p>
                                        <font size="+2"><b>ViscoverExpress</b></font>&#160;
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505568" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

                                        Used as: Division 2 - Level 3:
                                        <blockquote>
                                            <table cellspacing="2">
                                                <tr>
                                                    <td style="background: #eee;" class="bodyText">
                                                        <b>Value</b>
                                                    </td>
                                                    <td style="background: #eee;" class="bodyText">1000</td>
                                                </tr>
                                                <tr>
                                                    <td style="background: #eee;" class="bodyText">
                                                        <b>Submission Rate</b>
                                                    </td>
                                                    <td style="background: #eee;" class="bodyText">26 / 227  (11.45%) </td>
                                                </tr>
                                                <tr>
                                                    <td style="background: #eee;" class="bodyText">
                                                        <b>Success Rate</b>
                                                    </td>
                                                    <td style="background: #eee;" class="bodyText">10 / 26 (38.46%)</td>
                                                </tr>
                                                <tr>
                                                    <td style="background: #eee;" class="bodyText">
                                                        <b>High Score</b>
                                                    </td>
                                                    <td style="background: #eee;" class="bodyText">
                                                        <b>omasoud</b> for 543.91 points
                                                    </td>
                                                </tr>
                                            </table>
                                        </blockquote>
                                    <p>

                                    </p>
                                    Used as: Division 1 - Level 2:
                                    <blockquote>
                                        <table cellspacing="2">
                                            <tr>
                                                <td style="background: #eee;" class="bodyText">
                                                    <b>Value</b>
                                                </td>
                                                <td style="background: #eee;" class="bodyText">450</td>
                                            </tr>
                                            <tr>
                                                <td style="background: #eee;" class="bodyText">
                                                    <b>Submission Rate</b>
                                                </td>
                                                <td style="background: #eee;" class="bodyText">114 / 132  (86.36%) </td>
                                            </tr>
                                            <tr>
                                                <td style="background: #eee;" class="bodyText">
                                                    <b>Success Rate</b>
                                                </td>
                                                <td style="background: #eee;" class="bodyText">76 / 114 (66.67%)</td>
                                            </tr>
                                            <tr>
                                                <td style="background: #eee;" class="bodyText">
                                                    <b>High Score</b>
                                                </td>
                                                <td style="background: #eee;" class="bodyText">
                                                    <b>Yarin</b> for 424.08 points
                                                </td>
                                            </tr>
                                        </table>
                                    </blockquote>
                                    <p>

                                        An intuitive way to solve this problem is to first write a "numberCheck" method.  This function takes a string of 16 digits and return true or false depending on whether the value checked out.  Such a method loops through the string, summing up the digits (multiplying by 2 where necessary).  If the resulting sum is 0 mod 10 return true.  Once this helper method is written, the main function can try to generate all possible errors, detecting which ones produce valid numbers.  The "at most 1 incorrect digit" error can be produced by replacing each number with any possible digit.  The transposition errors can be produced by trying every swap.

                                    </p>
                                    <font size="+2"><b>Rendezvous</b></font>&#160;
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505568" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

                                    Used as: Division 1 - Level 1:
                                    <blockquote>
                                        <table cellspacing="2">
                                            <tr>
                                                <td style="background: #eee;" class="bodyText">
                                                    <b>Value</b>
                                                </td>
                                                <td style="background: #eee;" class="bodyText">300</td>
                                            </tr>
                                            <tr>
                                                <td style="background: #eee;" class="bodyText">
                                                    <b>Submission Rate</b>
                                                </td>
                                                <td style="background: #eee;" class="bodyText">120 / 132  (90.91%) </td>
                                            </tr>
                                            <tr>
                                                <td style="background: #eee;" class="bodyText">
                                                    <b>Success Rate</b>
                                                </td>
                                                <td style="background: #eee;" class="bodyText">81 / 120 (67.50%)</td>
                                            </tr>
                                            <tr>
                                                <td style="background: #eee;" class="bodyText">
                                                    <b>High Score</b>
                                                </td>
                                                <td style="background: #eee;" class="bodyText">
                                                    <b>antimatter</b> for 295.07 points
                                                </td>
                                            </tr>
                                        </table>
                                    </blockquote>
                                    <p>

                                        Solving this problem basically comes down to solving a system of equations.  The two pieces start at (0,0) and (x,y).  They change position by &lt;DX,DY&gt; and &lt;dx,dy&gt; respectively each turn.  To find the first place they could meet we must solve the equations: t*DX = x+t*dx  and t*DY = y+t*dy  where t is the turn number.  Solving for DX and DY in these equations we get: DX = x/t + dx and DY = y/t + dy  where t!=0.  A hint was given that we only need check a finite range of positions to rule out all possibilities.  Looping through all t values will quickly find the result.  Alternate methods which loop over DX and DY values can work as well.

                                    </p>
                                    <font size="+2"><b>TextileDetective</b></font>&#160;
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505568" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

                                    Used as: Division 1 - Level 3:
                                    <blockquote>
                                        <table cellspacing="2">
                                            <tr>
                                                <td style="background: #eee;" class="bodyText">
                                                    <b>Value</b>
                                                </td>
                                                <td style="background: #eee;" class="bodyText">1000</td>
                                            </tr>
                                            <tr>
                                                <td style="background: #eee;" class="bodyText">
                                                    <b>Submission Rate</b>
                                                </td>
                                                <td style="background: #eee;" class="bodyText">21 / 132  (15.91%) </td>
                                            </tr>
                                            <tr>
                                                <td style="background: #eee;" class="bodyText">
                                                    <b>Success Rate</b>
                                                </td>
                                                <td style="background: #eee;" class="bodyText">2 / 21 (9.52%)</td>
                                            </tr>
                                            <tr>
                                                <td style="background: #eee;" class="bodyText">
                                                    <b>High Score</b>
                                                </td>
                                                <td style="background: #eee;" class="bodyText">
                                                    <b>schveiguy</b> for 629.15 points
                                                </td>
                                            </tr>
                                        </table>
                                    </blockquote>
                                    <p>

                                        This problem, although relatively easy in nature, had many tricks and cases increasing its difficulty tremendously.  When a problem breaks into numerous cases, it no longer becomes easy to envision an entire solution.  Handling each case in seclusion simplifies matters, but how does one define these cases, and are they separable?  Both are questions not so easily answered.</p>
                                    <p>
                                        The first issue to be dealt with in this problem is the color of the weft thread.  Once chosen, other pieces fall into place.  Many methods exist, but the simplest is probably looping through all possible colors.  If one turns out infeasible, just continue, and try the next.  Given the color of the weft thread, we can determine the color of each warp thread.  One square at a time, we loop through the fabric determining which columns should be raised, and which lowered in each row.  During this process, we verify that each row and column has at least one raised and one lowered color as the problem states.  If everything checks out we are nearly done.  One case remains: warp threads that share the same color as the weft thread.  We will call columns with this condition weft columns.  If all columns are weft columns (a fabric of a single color) we will still need 2 harnesses to drive the machine.  If only some are weft columns but every row has been accounted for (every row contains at least 1 raised or lowered harness at some point) all of these weft columns can be attached to preexistant harnesses.  Finally, if there are rows that still require a raised or lowered harness at some point, the extra weft columns can fill this gap adding 1 to the total number of required harnesses.  Having considered all cases (there are alot) the result produced is the correct number of harnesses.  </p>
                                    <p>
                                        In summary, we first choose a weft thread color, then we determined the weft and non-weft columns.  Using this information we can determined the lowered and raised status of each square in the weft columns.  If certain rows still do not meet the 1 lowered 1 raised criteria, the weft columns can fill that gap, otherwise we are done.  The only other hitch, is that certain invalid setups must be checked.  For example, a column with 3 different colors must produce a return value of -1.
                                    </p>

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

