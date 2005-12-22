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
<tc-webtag:forumLink forumID="505556" message="Discuss this match" /></div>
<span class="bodySubtitle">SRM 129</span><br>Tuesday, January 14, 2003
<br><br>

<H1> 
The Problems 
</H1> 

<font size="+2"><b>Revenue</b></font>&#160;
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505556" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

Used as: Division-II, Level 1:

<blockquote>
<table cellspacing="2">
<tr><td class="bodyText" style="background: #eee;"><b>Value</b></td><td class="bodyText" style="background: #eee;">250</td></tr>
<tr><td class="bodyText" style="background: #eee;"><b>Submission Rate</b></td><td class="bodyText" style="background: #eee;">75 / 175  (42.86%) </td></tr>
<tr><td class="bodyText" style="background: #eee;"><b>Success Rate</b></td><td class="bodyText" style="background: #eee;">58 / 75  (77.33%)</td></tr>
<tr><td class="bodyText" style="background: #eee;"><b>High Score</b></td><td class="bodyText" style="background: #eee;"><b>Yi Zhang</b> for 244.56 points</td></tr>
</table>
</blockquote>

<P>Reference implementation: <i>see below</i></P>

<h4>Implementation</h4>

<p>The hardest part of the problem is maybe to understand the formulas. We want to maximize the product <i>p</i> * <i>q</i>, where <i>p</i> = <i>a</i> - <i>b</i> * <i>q</i> and <i>p</i> and <i>q</i> must both be non-negative integers. As usual with Div-II level 1 problems, it's enough to test all valid values of <i>p</i> and <i>q</i>, calculate the product, and check if it's better than the previous best known result. It's more natural to have <i>q</i> as the loop index, as for every integer <i>q</i> we get an integer <i>p</i> from the given formula. We must also not forget the tiebreaker - if we find that <i>p</i> * <i>q</i> is the same as some previous best result, we should select the highest <i>p</i>.</p>

<font size="+2"><b>Circles</b></font>&#160;
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505556" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

Used as: Division-II, Level 2:

<blockquote>
<table cellspacing="2">
<tr><td class="bodyText" style="background: #eee;"><b>Value</b></td><td class="bodyText" style="background: #eee;">550</td></tr>
<tr><td class="bodyText" style="background: #eee;"><b>Submission Rate</b></td><td class="bodyText" style="background: #eee;">69 / 175  (39.43%) </td></tr>
<tr><td class="bodyText" style="background: #eee;"><b>Success Rate</b></td><td class="bodyText" style="background: #eee;">37 / 69  (53.62%)</td></tr>
<tr><td class="bodyText" style="background: #eee;"><b>High Score</b></td><td class="bodyText" style="background: #eee;"><b>Karshikinpa</b> for 502.96 points</td></tr>
</table>
</blockquote>

<P>Reference implementation: <i>see below</i></P>

<h4>Implementation</h4>

<p>The easiest way to <i>not</i> screw this one up is to avoid using the less-than and greater-than operators when comparing the points. The only essential check we need is to determine whether two points are equal (i.e. the angles are the same). This is the case if, and only if, the difference between the two angles is a multiple of 360. That is, if the difference modulo 360 is 0.</p>

<p>Having realized that, all we have to do is walk around the circle, increasing the current position with 1 until we've reached the end. After every increase, loop through all points and check if we stand at any of them using the equality check mentioned above. If we find out that we stand at a point, append the name of the point to a list of visited points (an initially empty string). We never have to worry about including the same point several times since we will never walk around the circle more than one revolution.</p>

<p>Most of the failed submissions seems to be related to people adjusting the angles so they are between 0 and 359 inclusive, but then failing the wrap-around during the actual walk. Another pitfall is that doing a simple <i>x</i> % 360 will not work because if <i>x</i> is negative, <i>x</i> % 360 is also negative (or 0). This can be worked around by doing something like ((<i>x</i> % 360) + 360) % 360, but that's a bit ugly...</p>

<font size="+2"><b>Multiplier</b></font>&#160;
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505556" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

Used as: Division-II, Level 3:

<blockquote>
<table cellspacing="2">
<tr><td class="bodyText" style="background: #eee;"><b>Value</b></td><td class="bodyText" style="background: #eee;">1050</td></tr>
<tr><td class="bodyText" style="background: #eee;"><b>Submission Rate</b></td><td class="bodyText" style="background: #eee;">46 / 175  (26.29%) </td></tr>
<tr><td class="bodyText" style="background: #eee;"><b>Success Rate</b></td><td class="bodyText" style="background: #eee;">24 / 46  (52.17%)</td></tr>
<tr><td class="bodyText" style="background: #eee;"><b>High Score</b></td><td class="bodyText" style="background: #eee;"><b>Yi Zhang</b> for 963.20 points</td></tr>
</table>
</blockquote>

Used as: Division-I, Level 1:

<blockquote>
<table cellspacing="2">
<tr><td class="bodyText" style="background: #eee;"><b>Value</b></td><td class="bodyText" style="background: #eee;">300</td></tr>
<tr><td class="bodyText" style="background: #eee;"><b>Submission Rate</b></td><td class="bodyText" style="background: #eee;">75 / 100  (75.00%) </td></tr>
<tr><td class="bodyText" style="background: #eee;"><b>Success Rate</b></td><td class="bodyText" style="background: #eee;">73 / 75  (97.33%)</td></tr>
<tr><td class="bodyText" style="background: #eee;"><b>High Score</b></td><td class="bodyText" style="background: #eee;"><b>ZorbaTHut</b> for 293.33 points</td></tr>
</table>
</blockquote>

<P>Reference implementation: <i>see below</i></P>

<h4>Implementation</h4>

<p>Given an amount, and in what sector the amount is spent, we should determine the total amount of money that is spent again. This is a recursive process, so it's natural to think of a recursive solution. We are assured that the recursion will terminate because not all money are "recycled". The number of recursive calls will not be too many, because for every call at least some money will not be reused, so the complexity is O(N).</p>

<p>If not for the fact that the initial amount should <i>not</i> be counted, the actual implementation could have been a recursive solution in one line, something rarely seen.</p>

<font size="+2"><b>LeanTo</b></font>&#160;
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505556" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

Used as: Division-I, Level 2:

<blockquote>
<table cellspacing="2">
<tr><td class="bodyText" style="background: #eee;"><b>Value</b></td><td class="bodyText" style="background: #eee;">600</td></tr>
<tr><td class="bodyText" style="background: #eee;"><b>Submission Rate</b></td><td class="bodyText" style="background: #eee;">37 / 100  (37.00%) </td></tr>
<tr><td class="bodyText" style="background: #eee;"><b>Success Rate</b></td><td class="bodyText" style="background: #eee;">15 / 37  (40.54%)</td></tr>
<tr><td class="bodyText" style="background: #eee;"><b>High Score</b></td><td class="bodyText" style="background: #eee;"><b>Yarin</b> for 569.87 points</td></tr>
</table>
</blockquote>

<P>Reference implementation: <i>see below</i></P>

<h4>Implementation</h4>

<p>This is a geometry problem that can be solved algebraically; however that will include solving some tricky equations requiring more math knowledge than I possess. But the problem statement kindly stated the intended approach: binary search.
A lower limit of the height is, of course, 0, and an upper limit is storageRoof.
By iteratively selecting the midpoint between the lower and upper limit, finding out  whether it's too high or too low, we adjust the endpoints accordingly. We should repeat this process until the precision becomes good enough. A small trick here is to just repeat the process a fixed number of times, say 1000. After that, the range, which was originally at most 30000, is 30000*2<sup>-1000</sup>, a <i>very</i> small number.</p>

<p>To determine whether the height is too low or too high, we use Pythagoras formula and the formula for similar triangles:</p>

<pre>
                         /|  -|
                        / |   |
    storageRoof        /  |   |
               \      /   |   |
                \/\  /    |   |
                /   /|    |   |-----extHt
               /   / |-x  |   |
                \ /__|____|  -|

                  |__||___|
                   |   |
                   y  livingWidth
</pre>

<p>x is the height that we binary search. In the figure above, the following two formulas are valid:</p>

<pre>
(1) y = sqrt(storageRoof*storageRoof-x*x)
(2) x/y = extHt/(y+livingWidth)
</pre>

<p>If x is less than the correct height (there is only one unique answer), the left hand side of (2) will be less than the right hand side. If so, we set the lower limit for the binary search to x, otherwise we change the upper limit.</p>

<p>The answer should then be rounded appropriately. As a C++ coder, this is no problem as sprintf automatically rounds correctly. The only thing you have to watch out for is that if the answer is less than 1, the output should start with the decimal point and not a zero.</p>

<font size="+2"><b>StripMine</b></font>&#160;
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505556" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

Used as: Division-I, Level 3:

<blockquote>
<table cellspacing="2">
<tr><td class="bodyText" style="background: #eee;"><b>Value</b></td><td class="bodyText" style="background: #eee;">950</td></tr>
<tr><td class="bodyText" style="background: #eee;"><b>Submission Rate</b></td><td class="bodyText" style="background: #eee;">17 / 100  (17.00%) </td></tr>
<tr><td class="bodyText" style="background: #eee;"><b>Success Rate</b></td><td class="bodyText" style="background: #eee;">7 / 17  (41.18%)</td></tr>
<tr><td class="bodyText" style="background: #eee;"><b>High Score</b></td><td class="bodyText" style="background: #eee;"><b>Yarin</b> for 750.72 points</td></tr>
</table>
</blockquote>

<P>Reference implementation: <i>see below</i></P>

<h4>Implementation</h4>

<p>The trick here is to realize that to decide the optimal digging depth at a certain column, we are only dependent on three parameters: the current column, the depth we dug at the last column (this sets a valid range for the current column) and how many more squares we may excavate. It's not necessary to know the depth of even more previous columns.</p>

<p>We can define a recursive function based on this, all according to the style explained by <b>radeye</b> in his excellent feature article about functional programming, and then evaluate the function using dynamic programming (caching the results) so it doesn't grow exponential. Given the three parameters, the function should return the maximum amount we can earn by digging this column and the remaining columns under the given constraints.</p>

<p>To evaluate the function, we test all valid digging depths for the current column (and make sure we can excavate this many more squares!) based on the previous column. On the first column and last column, the only valid digging depths is 0 to 3, inclusive, otherwise we loop from the last columns depth - 3 to the last columns depth + 3 (inclusive). For each of these heights, we sum up the earnings of this column (can be precalced for every column) and add with the result of the recursive call that takes care of the remaining columns.</p>

<p>Personally I think it's easiest (fastest!) to implement a recursive solution with caching, which is what I did in the actual contest, but afterwards I often change it to an iterative solution. The only difference is that the iterative solution evaluates the recursive function in the correct order, starting at the "bottom" and going up. An iterative solution is usually both faster and cleaner. The reference implementation below is an iterative solution; for a recursive solution, see my submission in the actual contest.</p>


<h1>Reference Implementations</h1>

<font size="+2"><b>Revenue</b></font>
<pre>
<b>class</b> Revenue {
    <b>public</b>:
    <b>int</b> bestPrice(<b>int</b> a, <b>int</b> b) {
        <b>int</b> best=0,bestp=0;
        <b>for</b>(<b>int</b> q=0;q&lt;=a;q++) {
            <b>int</b> p=a-b*q;
            <b>if</b> (p&lt;=0) <b>continue</b>;
            <b>if</b> (p*q&gt;best || (p*q==best &amp;&amp; p&gt;bestp)) {
                best=p*q;
                bestp=p;
            }
        }
        <b>return</b> bestp;
    }
};
</pre>

<font size="+2"><b>Circles</b></font><BR/>

<pre>
<b>#include</b> &lt;string&gt;
<b>#include</b> &lt;vector&gt;

<b>using</b> <b>namespace</b> std;

<b>class</b> Circles {
    <b>public</b>:
    string visit(<b>int</b> start, <b>int</b> finish, vector &lt;<b>int</b>&gt; points) {
        string visited="";
        <b>while</b> ((start-finish)%360) {
            <b>for</b>(<b>int</b> i=0;i&lt;points.size();i++)
                <b>if</b> (!((points[i]-start)%360))
                    visited+=<b>char</b>('A'+i);
            start++;
        }
        <b>return</b> visited;
    }
};
</pre>

<font size="+2"><b>Multiplier</b></font><BR/>

<pre>
<b>#include</b> &lt;vector&gt;

<b>using</b> <b>namespace</b> std;

<b>class</b> Multiplier {
    <b>public</b>:

    <i>// a&gt;0: this is amount spent on goods</i><BR/>
    <i>// a&lt;0: this is amount spent on services (negated)</i><BR/>
    <b>int</b> doit(<b>int</b> a, vector &lt;<b>int</b>&gt; &amp;p)
    {
        <b>return</b> a&gt;0?
            a+doit(a*p[0]/100,p)+doit(-a*p[1]/100,p):
            a&lt;0?-a+doit(-a*p[2]/100,p)+doit(a*p[3]/100,p):
            0;
    }

    <b>int</b> spending(<b>int</b> amount, vector &lt;<b>int</b>&gt; percent)
    {
        <b>return</b> doit(amount,percent)-amount;
    }
};
</pre>

<font size="+2"><b>LeanTo</b></font><BR/>

<pre>

<b>#include</b> &lt;cmath&gt;
<b>#include</b> &lt;string&gt;

<b>using</b> <b>namespace</b> std;

<b>class</b> LeanTo {
    <b>public</b>:
    string height(<b>int</b> extHt, <b>int</b> livingWidth, <b>int</b> storageRoof) {
        <b>double</b> lo=0.0,hi=storageRoof,c,x;
        <b>for</b>(<b>int</b> i=0;i&lt;1000;i++) {
            x=(lo+hi)/2.0;
            c=sqrt(storageRoof*storageRoof-x*x);
            (x/c&lt;extHt/(c+livingWidth)?lo:hi)=x;
        }
        <b>char</b> s[10];
        spr<b>int</b>f(s,"%0.4lf",x);
        <b>return</b> s+(s[0]=='0');
    }
};
</pre>

<font size="+2"><b>StripMine</b></font><BR/>

<pre>
<b>#include</b> &lt;string&gt;
<b>#include</b> &lt;vector&gt;

<b>using</b> <b>namespace</b> std;

<b>class</b> StripMine {
    <b>public</b>:
    <b>int</b> maxProfit(<b>int</b> limit, vector &lt;string&gt; report) {
        <b>int</b> depth=report.size(),width=report[0].size();

        <i>// First calculate the profit of digging a</i><BR/>
        <i>// certain depth at a certain column</i><BR/>
        <b>int</b> dig[depth+1][width];
        <b>for</b>(<b>int</b> i=0;i&lt;width;i++) {
            dig[0][i]=0;
            <b>for</b>(<b>int</b> j=0;j&lt;depth;j++)
                dig[j+1][i]=dig[j][i]+<b>int</b>(report[j][i]-'A')-3;
        }

        <i>// Then calculate the max profit using induction over the remaining</i><BR/>
        <i>// columns, the height of the next column and the number of more</i><BR/>
        <i>// squares we can excavate</i>
        <b>int</b> tbl[width+1][depth+1][limit+1];

        <b>for</b>(<b>int</b> i=width;i&gt;=0;i--)
            <b>for</b>(<b>int</b> j=0;j&lt;=depth;j++)
                <b>for</b>(<b>int</b> k=0;k&lt;=limit;k++) {
                    <i>// Last column (i-1) was at depth j and</i><BR/>
                    <i>// we have k more squares to excavate</i><BR/>
                    <b>if</b> (i==width) {
                        tbl[i][j][k]=j&gt;3?-1000000:0;
                        <b>continue</b>;
                    }
                    <b>int</b> best=-1000000;                    
                    <b>for</b>(<b>int</b> h=0;h&lt;=depth;h++) {
                        <i>// Dig at height h in this column</i>
                        <b>if</b> (h&gt;k) <b>break</b>; <i><BR/>// Can't dig this much</i><BR/>
                        <b>if</b> (abs(h-j)&gt;3) <b>continue</b>; <i>// Too steep</i><BR/>
                        <b>int</b> v=tbl[i+1][h][k-h]+dig[h][i];
                        best&gt;?=v;
                    }
                    tbl[i][j][k]=best;
                }
        <b>return</b> tbl[0][0][limit];
    }
};
</pre>


<p>
<img src="/i/m/Yarin_mug.gif" alt="" width="55" height="61" border="0" hspace="6" vspace="1" align="left" class="myStatsPhoto"/><br />
By&#160;<tc-webtag:handle coderId="269554" context="algorithm"/><br />
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
