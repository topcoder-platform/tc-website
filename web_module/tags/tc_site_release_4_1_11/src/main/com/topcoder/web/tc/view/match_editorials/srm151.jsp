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
<tc-webtag:forumLink forumID="505587" message="Discuss this match" /></div>
<span class="bodySubtitle">SRM 151</span><br>Tuesday, June 17, 2003
<br><br>

<span class="bigTitle">Match summary</span>

                        <p>
                        The two matches prior to SRM 151 saw very few submissions on both the division one medium and hard problems, but this time the coders in both divisions submitted merrily.
                        In division one, newcomers <b>aneubeck</b> (2nd place) and <b>tomek</b> (4th place) pushed hard, but it was for the &quot;oldster&quot; <b>radeye</b> to take the top spot.
                        It is notable that bilingual <b>tomek</b> submitted in both C++ and Java, an event rarely seen with the top finishers.
                        <b>noah</b> won division two finishing only 9 points ahead of <b>JWizard</b>. First timer <b>m00tz</b> finished third and was the only first timer to hit the yellow rating category.
                        </p>

<H1> The Problems </H1> 

                        <font size="+2"><b>PrefixCode</b></font>&#160;
                        <A href="http://forums.topcoder.com/?module=ThreadList&forumID=505587" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

                        Used as: Division-II - Level 1:
                        <blockquote>
                        <table cellspacing="2">
                        <tr><td style="background: #eee;" class="bodyText"><b>Value</b></td><td style="background: #eee;" class="bodyText">250</td></tr>
                        <tr><td style="background: #eee;" class="bodyText"><b>Submission Rate</b></td><td style="background: #eee;" class="bodyText">177 / 213  (83.10%)</td></tr>
                        <tr><td style="background: #eee;" class="bodyText"><b>Success Rate</b></td><td style="background: #eee;" class="bodyText">109 / 177 (61.58%)</td></tr>
                        <tr><td style="background: #eee;" class="bodyText"><b>High Score</b></td><td style="background: #eee;" class="bodyText"><b>farsight</b> for 248.08 points</td></tr>
                        </table>
                        </blockquote>

                        <p>
                        Surprisingly many submissions on this problem failed, mainly because not the lowest index of a prefix was returned, but any index of a word
                        that had a prefix.<br/>
                        <br/>
                        Simply consider the words in the given order and for each word, check if it is the prefix of another word.
                        </p>

                        <p>
                        <pre>
                        <b>Java</b>

                        public String isOne(String[] words)
                        {
                            for (int i=0; i&lt;words.length; i++)
                                for (int j=0; j&lt;words.length; j++)
                                    if (i != j &amp;&amp; words[j].startsWith(words[i]))
                                        return "No, " + i;
                            return "Yes";
                        }
                        </pre>
                        </p>

                        <br/>

                        <font size="+2"><b>Birthday</b></font>&#160;
                        <A href="http://forums.topcoder.com/?module=ThreadList&forumID=505587" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

                        Used as: Division-II - Level 2:
                        <blockquote>
                        <table cellspacing="2">
                        <tr><td style="background: #eee;" class="bodyText"><b>Value</b></td><td style="background: #eee;" class="bodyText">500</td></tr>
                        <tr><td style="background: #eee;" class="bodyText"><b>Submission Rate</b></td><td style="background: #eee;" class="bodyText">161 / 213  (75.59%)</td></tr>
                        <tr><td style="background: #eee;" class="bodyText"><b>Success Rate</b></td><td style="background: #eee;" class="bodyText">73 / 161 (45.34%)</td></tr>
                        <tr><td style="background: #eee;" class="bodyText"><b>High Score</b></td><td style="background: #eee;" class="bodyText"><b>Ceranith</b> for 486.64 points</td></tr>
                        </table>
                        </blockquote>

                        <p>
                        There are several possibilities for solving this one.
                        One of the possibilities is the following:
                        Extract the day and the month from the current date and from all birthdays.
                        In a loop, first check if the current day coincides with any of the
                        birthdays. If so, return that day. If not, set the current date to
                        the following day (paying attention to the start of a new month/year).<br/>
                        <br/>
                        The shorter and less error-prone solution is to sort the birthdays, unmodified, as strings (in ascending order). Go through the sorted birthdays until the first birthday
                        that occurs on or after the current date is found and return it. If no such
                        birthday is found, all given birthdays occur before the current date (looking
                        at a fixed year), so return the first birthday in the sorted list, which
                        is the first birthday occurring when a new year begins.
                        </p>

                        <p></p>
                        <pre>
                        <b>C++</b>

                        string getNext(string date, vector&lt;string&gt; birthdays)
                        {
                            sort(birthdays.begin(), birthdays.end());
                                for (int i=0; i&lt;(int)birthdays.size(); i++)
                                    if (birthdays[i].substr(0, 5) &gt;= date)
                                        return birthdays[i].substr(0, 5);
                            return birthdays[0].substr(0, 5);
                        }

                        </pre>
                        <p></p>

                        <br/>

                        <font size="+2"><b>MergeSort</b></font>&#160;
                        <A href="http://forums.topcoder.com/?module=ThreadList&forumID=505587" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

                        Used as: Division-II - Level 3:
                        <blockquote>
                        <table cellspacing="2">
                        <tr><td style="background: #eee;" class="bodyText"><b>Value</b></td><td style="background: #eee;" class="bodyText">1000</td></tr>
                        <tr><td style="background: #eee;" class="bodyText"><b>Submission Rate</b></td><td style="background: #eee;" class="bodyText">75/ 213  (35.21%)</td></tr>
                        <tr><td style="background: #eee;" class="bodyText"><b>Success Rate</b></td><td style="background: #eee;" class="bodyText">45 / 75 (60.00%)</td></tr>
                        <tr><td style="background: #eee;" class="bodyText"><b>High Score</b></td><td style="background: #eee;" class="bodyText"><b>m00tz</b> for 893.29 points</td></tr>
                        </table>
                        </blockquote>
                        Used as: Division-I - Level 2:
                        <blockquote>
                        <table cellspacing="2">
                        <tr><td style="background: #eee;" class="bodyText"><b>Value</b></td><td style="background: #eee;" class="bodyText">500</td></tr>
                        <tr><td style="background: #eee;" class="bodyText"><b>Submission Rate</b></td><td style="background: #eee;" class="bodyText">140 / 145  (96.55%)</td></tr>
                        <tr><td style="background: #eee;" class="bodyText"><b>Success Rate</b></td><td style="background: #eee;" class="bodyText"> 109 / 140 (77.86%)</td></tr>
                        <tr><td style="background: #eee;" class="bodyText"><b>High Score</b></td><td style="background: #eee;" class="bodyText"><b>Yarin</b> for 481.98 points</td></tr>
                        </table>
                        </blockquote>

                        <p>
                        Implement the MergeSort algorithm as described, run it on the input,
                        and count the number of comparisons made.
                        </p>

                        <p>
                        <pre>
                        <b>C++</b>

                        int howManyComparisons(vector&lt;int&gt; a)
                        {
                            return mergeSort(a);
                        }
                        int mergeSort(vector&lt;int&gt;&amp; a)
                        {
                            if (a.size() &lt;= 1)
                                return 0;
                            int k = a.size() / 2;
                            vector&lt;int&gt; b = vector&lt;int&gt;(a.begin(), a.begin()+k);
                            vector&lt;int&gt; c = vector&lt;int&gt;(a.begin()+k, a.end());
                            int cb = mergeSort(b);
                            int cc = mergeSort(c);
                            return cb + cc + merge(a, b, c);
                        }
                        int merge(vector&lt;int&gt;&amp; a, vector&lt;int&gt;&amp; b, vector&lt;int&gt;&amp; c)
                        {
                            unsigned ai = 0, bi = 0, ci = 0, comps = 0;
                            while (bi != b.size() &amp;&amp; ci != c.size() &amp;&amp; ++comps)
                                if (b[bi] == c[ci])
                                {
                                    a[ai++] = b[bi++];
                                    a[ai++] = c[ci++];
                                }
                                else
                                    if (b[bi] &lt; c[ci])
                                        a[ai++] = b[bi++];
                                    else
                                        a[ai++] = c[ci++];
                            while (bi != b.size())
                                a[ai++] = b[bi++];
                            while (ci != c.size())
                                a[ai++] = c[ci++];
                            return comps;
                        }
                        </pre>
                        </p>

                        <font size="+2"><b>Archimedes</b></font>&#160;
                        <A href="http://forums.topcoder.com/?module=ThreadList&forumID=505587" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

                        Used as: Division-I - Level 1:
                        <blockquote>
                        <table cellspacing="2">
                        <tr><td style="background: #eee;" class="bodyText"><b>Value</b></td><td style="background: #eee;" class="bodyText">250</td></tr>
                        <tr><td style="background: #eee;" class="bodyText"><b>Submission Rate</b></td><td style="background: #eee;" class="bodyText">129 / 145 (88.97%)</td></tr>
                        <tr><td style="background: #eee;" class="bodyText"><b>Success Rate</b></td><td style="background: #eee;" class="bodyText">122 / 129 (94.57%)</td></tr>
                        <tr><td style="background: #eee;" class="bodyText"><b>High Score</b></td><td style="background: #eee;" class="bodyText"><b>antimatter</b> for 248.78 points</td></tr>
                        </table>
                        </blockquote>

                        <p>
                        <img src="http://www.topcoder.com/contest/problem/Archimedes/srm151_archimedes.gif" width="200" height="200" alt="Archimedes" border="0" style="float:left;margin:10px"/>
                        The solution to this problem may be the shortest a TopCoder problem has ever seen.
                        However, there is some basic geometry to be done before the return statement can be written.<br/>
                        <br/>
                        Taking the perimeter of a n-sided regular polygon <nobr>(n * d, d: sidelength)</nobr> inscribed into a circle as
                        an approximation for the perimeter of that circle <nobr>( 2 * Pi * r )</nobr> we get
                        <nobr>n * d = 2 * appr_Pi * r</nobr> &#160; &lt;=&gt; &#160; <nobr><b> appr_Pi = n * d / (2 * r)</b></nobr>.<br/>
                        <br/>
                        To calculate the length of a side from the polygon, take a look at the image on the left:
                        For the little right triangle we get
                        <nobr>sin <i>alpha</i> = (d/2) / r</nobr> with <nobr><i>alpha</i> = 2 * Pi / (2 * n) = Pi / n</nobr> (in radian).
                        Inserting <nobr><b>d = 2 * r * sin (Pi / n)</b></nobr> into the approximation we get
                        <nobr>appr_Pi = n * 2 * r * sin (Pi / n) / (2 * r)</nobr> &#160; &lt;=&gt; &#160; <nobr><b>appr_Pi = n * sin (Pi / n)</b></nobr>.
                        </p>

                        <p style="clear:left">
                        <pre>
                        <b>Java</b>

                        public double approximatePi(int numSides)
                        {
                            return numSides * Math.sin(Math.PI / numSides);
                        }
                        </pre>
                        </p>

                        <br/>

                        <font size="+2"><b>Gauss</b></font>&#160;
                        <A href="http://forums.topcoder.com/?module=ThreadList&forumID=505587" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

                        Used as: Division-I - Level 3:
                        <blockquote>
                        <table cellspacing="2">
                        <tr><td style="background: #eee;" class="bodyText"><b>Value</b></td><td style="background: #eee;" class="bodyText">1000</td></tr>
                        <tr><td style="background: #eee;" class="bodyText"><b>Submission Rate</b></td><td style="background: #eee;" class="bodyText">72 / 145  (49.66%) </td></tr>
                        <tr><td style="background: #eee;" class="bodyText"><b>Success Rate</b></td><td style="background: #eee;" class="bodyText">43 / 72 (59.72%)</td></tr>
                        <tr><td style="background: #eee;" class="bodyText"><b>High Score</b></td><td style="background: #eee;" class="bodyText"><b>radeye</b> for 939.97 points</td></tr>
                        </table>
                        </blockquote>

                        <p>
                        What came to my mind first is the following
                        (it is too slow on the given constraints, but the technique
                        may be useful for other problems):
                        Start with lower = 1, upper = 1 and sum = 1 (sum is
                        supposed to be the sum of all numbers from lower to upper). Do a loop
                        while upper &lt;= target/2 + 1:
                        If sum equals target, add [lower, upper] to the solution.
                        If sum &lt;= target expand the interval (upper++ and sum += upper),
                        and if sum &gt; target shorten the interval (sum -= lower and lower++).
                        This way all intervals can be found but the running time is
                        linear in target, which is too much since target can be as high as
                        100.000.000.000.<br/>
                        <br/>
                        First, observe that the maximum number of numbers added to get target occurs
                        in the case where adding starts from 1. Assume that target is the sum of the
                        numbers from 1 to n for some n: <nobr>target = n*(n+1) / 2</nobr> &#160; =&gt; &#160;
                        <nobr>n = -0.5 + sqrt(0.25+2*target)</nobr>.
                        Second, observe that for a given number of numbers to be added there can be only one or no solution at all.<br/>

                        So target can potentially be the sum of anywhere from 2 to n consecutive numbers. A single check as to whether target is
                        the sum of m numbers (2 &lt;= m &lt;= n) can be done in constant time, also yielding the numbers to be added.
                        Consider the cases where m is odd and m is even for an example, n = 30:
                        <pre>
                        n = 30   m = 5   4 5 6 7 8   n / m = 6     n % m = 0
                        n = 30   m = 4   6 7 8 9     n / m = 7.5   n % m = m/2
                        </pre>
                        If m is odd and n/m is integral, n/m is the number in the middle of the numbers that add up to target.
                        If n/m is not integral, there is no solution for m. (Informally, n/m is the 'average weight' of the numbers
                        that need to be added; take n/m and (m-1)/2 numbers to the left
                        and to the right of n/m, respectively.)<br/>
                        If m is even, n/m must be x.5 for a solution to exist (for some integer x). The solution is the next m/2 integral
                        numbers less than and greater than n/m, respectively.
                        (Again informally, n/m is the 'average weight' of the numbers that need to be added,
                        and if n/m = x.5 each 'pair' of numbers from the left and the right of n/m has this average weight.) The complexity is O(sqrt(target)).
                        </p>

                        <p>
                        <pre>
                        <b>Java</b>

                        public String[] whichSums(String target)
                        {
                            java.util.Vector v = new java.util.Vector();
                            long t = Long.parseLong(target);
                            int n = (int)(Math.sqrt(0.25+2*t) - 0.5);
                            for (int i=n; i&gt;=2; i--)
                            {
                                if (i % 2 == 1 &amp;&amp; t % i == 0)
                                    v.add("[" + (t/i-i/2) + ", " + (t/i+i/2) + "]");
                                if (i % 2 == 0 &amp;&amp; t % i == i/2)
                                    v.add("[" + (t/i-i/2+1) + ", " + (t/i+i/2) + "]");
                            }
                            return (String[])v.toArray(new String[0]);
                        }
                        </pre>
                        </p>

                        <p>
                        The number of ways to represent n as the sum of consecutive positive numbers is equal to the number of odd divisors of n.
                        Try to prove it yourself or take a look at the proof at the end of this
                        <a href="http://www.mathematik.uni-bielefeld.de/~sillke/PUZZLES/sum-consecutive" target="_blank">old newsgroup post</a>
                        and read more at the
                        <a href="http://www.research.att.com/cgi-bin/access.cgi/as/njas/sequences/eisA.cgi?Anum=A001227" target="_blank">On-Line Encyclopedia of Integer Sequences</a>.
                        </p>

<p>
<img src="/i/m/wernie_mug.gif" alt="" width="55" height="61" border="0" hspace="6" vspace="1" align="left" class="myStatsPhoto"/><br />
By&#160;<tc-webtag:handle coderId="307638" context="algorithm"/><br />
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

