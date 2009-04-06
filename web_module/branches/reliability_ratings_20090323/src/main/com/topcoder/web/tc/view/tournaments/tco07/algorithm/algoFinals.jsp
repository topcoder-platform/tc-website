<%@ page contentType="text/html;charset=utf-8" %> 
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>2007 TopCoder Open - Computer Programming Tournament</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <link type="text/css" rel="stylesheet" href="/css/tournaments/tco07.css"/>
    <link type="text/css" rel="stylesheet" href="/css/coders.css"/>
    <jsp:include page="../../script.jsp" />
</head>
<body>

<div align="center" style="background: transparent;">
    <div id="content">

        <jsp:include page="../header.jsp" />

        <table cellpadding="0" cellspacing="0" id="spacer">
        <tbody>
            <tr>
                <td id="navSpacer">

                    <jsp:include page="../nav.jsp" >
                    <jsp:param name="tabLev1" value="algorithm"/>
                    <jsp:param name="tabLev2" value="summary"/>
                    <jsp:param name="tabLev3" value="finals"/>
                    </jsp:include>

                </td>
                <td id="bodySpacer" width="100%">
                    <div id="pageBody">

                                     <h1><span>Jan_Kuipers is the new Algorithm Champion</span></h1>

                        <img src="/i/m/Olexiy_big2.jpg" alt="" width="55" height="61" border="0" hspace="6" vspace="1" align="left" class="myStatsPhoto"/><br />
<A HREF="http://forums.topcoder.com/?module=ThreadList&amp;forumID=514958">Discuss this match</A><br>
Friday, June 29, 2007<br>
Introduction by <a href="/tc?module=MemberProfile&amp;cr=303644&amp;tab=alg" class="coderTextRed">Olexiy</a>

<img style="float:right; width:200px; 350px; padding-left:10px;" src="/i/tournament/tco07/algo.jpg">
<br><br>
<p>
<p>
<tc-webtag:handle coderId="309453" context="algorithm"/> is the Algorithm Champion of the 2007 TopCoder Open. Check out <tc-webtag:handle coderId="10574855" context="algorithm"/>'s <a href="/tc?module=Static&d1=tournaments&d2=tco07&d3=blogs&d4=Petr09">analysis</a> on this year's finals.
Congratulations!
</p>
<p><span style="font-size:14px; font-weight:bold;">DayTrader</span></p>
<p>by <tc-webtag:handle coderId="287269" context="algorithm"/></p>
<p>
There are two important points to realize about this problem:
</p>
<ol>
<li>At any time, you either want to have all of your money in stock A, all of your money in stock B, or not invested at all.</li> <li>The only times you would buy or sell a stock are when either stock price changes slope (the times listed in the input arrays).</i> </ol> <p> Given a sorted combined list of the times in the input arrays, you can calculate by what factor you can increase your money in each interval independently.
For each interval, if the slopes are both negative you would hold on to all your money (a factor of 1.0).
If either stock is positive, you pick the stock with the greater slope and compute the factor as the ending price of the chosen stock divided by its starting price.
If the interval is bounded on either end by the other stock changing price, and you are not explicitly given your chosen stock's price at the beginning and/or end of the interval, you just need to compute it by linear interpolation.
</p>
<p>
Your final profit is $1000 times the product of the factors for each interval, minus your $1000 initial investment.
</p>







<p><span style="font-size:14px; font-weight:bold;">Rafting</span></p>
<p>by <tc-webtag:handle coderId="308953" context="algorithm"/></p>

<ol>
<li>First of all, solve the following subproblem. 
Let's we are given a non-empty subset of sites S, and a pair of sites a and b of subset S. We want to find the minimal time the man needs to visit all sites of S, leaving his raft only once. And it being known that he visits a first, and b - last. Let's assume that the man comes ashore at the point with coordinate x. Then let f<sub>S,a,b</sub>(x)  be a minimal time of overland route meeting the above conditions. Intuitively obvious that this is a convex function. We can formally proof this fact by not very difficult analysis of precise formulas. 
Let's try to calculate f<sub>S,a,b</sub>(x). Clearly, that the man reaches site b from site a, having visited all sites of subset S (yep, the traveling salesman problem). Assume that we already know the time for that part of the trip. It appears from this, that we can find the raft's position at the moment when the man is at the b site. Let coordinate of this point be x<sub>b</sub>. Further the man needs a way to reach any river's point at the same time with his raft. If we take a distance from x<sub>b</sub> to the place of a meeting we get quadratic equation in one unknown (distance from x<sub>b</sub> to that tryst). 
The complexity of finding f<sub>S,a,b</sub>(x) is O(1). Using a ternary search algorithm we find 
min<sub>x</sub>{f<sub>S,a,b</sub>(x)}. Moreover we can easily define a point where the man comes ashore and the point where he comes back on it.</li>
<li>Now let's solve the main problem. 
The man way contains parts where he leaves the raft and on each of such part he visits some subset of sites with the fixed first and last sites (a and b). For every such part the correspondent raft's segment of a way (without the man) is assigned. In the optimal solution every such segment corresponds to an optimal segment for given (S, a, b) defined above (in item 1). Let's assume that is not truth. Start to shift the segment to the segment from item 1 (S, a, b). Due to function convexity the value begins decrease that cannot be. Thus it either coincides or touches another segment that is the meaningless action (why one needs to visit the raft for a moment?).</li>
<li>Thus let's iterate thought all possible set partitions, for the sites set. For each subset in a partition let's choose a and b sites and find the correspondent optimal segments (see item 1). If they are not intersect let's update the answer with the sum of minimal values of min<sub>x</sub>{f<sub>S,a,b</sub>(x)}.</li>
</ol>

<p><span style="font-size:14px; font-weight:bold;">RepeatingFreeStrings</span></p>
<p>by <tc-webtag:handle coderId="308953" context="algorithm"/></p>

<p>Let Z[i] be a quantity of all binary, repeating free strings of length i:
Z[1] = 2, Z[2] = 2, Z[3] = 4, Z[4] = 6, Z[5] = 12, ...</p>

<p>We should proof that Z[2*n + 1] = 2*Z[2*n] (odd case), and Z[2*n] = 2*Z[2*n-1] - Z[n] (even case).</p>

<p>In the odd case: let's consider the odd string that has some prefix which is equal to a suffix. Let its length be L. If L > n then another shorter prefix with the same property exists, and so on.</p>

<p>This is an example:<br />
If there is a prefix-suffix matching with length 3 (n = 2) then a prefix-suffix matching with length 1 exists too.</p>
<pre>01010                =>   01010
    01010                           01010
</pre>

<p>Thus, if the odd string is not a repeating free it contains a prefix (with length <= n) equals to a suffix. But it means that if we delete the middle character from the string, the resulting string will be non-repeating free too. Obviously that the inverse fact is also correct. If we insert  0 or 1 in the middle of any, even repeating free string, the result will be repeating free too. 
Therefore, Z[2*n+1]=2*Z[2*n].</p>

<p>In the even case: similarly, if the even string is not repeating free, it has a prefix with length not greater than n and equals to a suffix. Thus we can insert 0 or 1 on the left hand of the middle character in the odd repeating free string. In the most cases the result will be repeating free too. For example, we had XXXYXXX, after inserting the character Z we get XXXZYXXX.</p> 

<p>One exception is the resulting string, consisting of two equal halves (XXXZ == YXXX). This exception takes place in Z[n] cases (there are 2^n such strings, but in 2^n-Z[n] of those cases the previous odd-length string has a prefix/suffix with length less than n). So, Z[2*n] = 2*Z[2*n-1]-Z[n].</p>

<p>All these approaches help us to create a function which returns a quantity of repeating free strings matching for the given pattern (it consists of '0', '1' and '?').
For example (odd case): count('?1?0?') = 2*count('?10?'), count('1?100') = count('1?00'). 
In the even case, we should intersect the left and the right parts of the pattern, and subtract from the result the count(X), where X is an intersection.</p>

<p>To find k-th lexicographical string we should fill the pattern from the left to right and analyze the correspondent quantities. </p>
<p></p>
<br /><br />
                    </div>
                </td>
            </tr>
        </table>


        <jsp:include page="../footer.jsp" />
    </div>
</div>

</body>

</html>
