<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page contentType="text/html;charset=utf-8" %> 
<%@ page import="com.topcoder.web.common.model.EventType" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>2007 TopCoder Collegiate Challenge - Computer Programming Tournament</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <link type="text/css" rel="stylesheet" href="/css/tournaments/tccc07.css"/>
    <link type="text/css" rel="stylesheet" href="/css/coders.css"/>
    <jsp:include page="../../script.jsp" />
</head>
<body>

<div align="center" style="background: transparent;">
    <div id="containAll">
    <div id="content">

        <jsp:include page="../nav.jsp" >
        <jsp:param name="tabLev1" value="<%=EventType.ALGORITHM_TOURNAMENT_ID%>"/>
        <jsp:param name="tabLev2" value="summary"/>
        <jsp:param name="tabLev3" value="finals"/>
        </jsp:include>
        
        <div id="pageBody">
            <h1><span>Petr is the new Algorithm Champion!</span></h1>
            <p><img src="/i/m/Olexiy_big2.jpg" alt="" width="55" height="61" border="0" hspace="6" vspace="1" align="left" class="myStatsPhoto"/><br />
            <A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=518018">Discuss this match</A><br />Friday, November 2, 2007<br />Introduction by <tc-webtag:handle coderId="303644" context="algorithm"/></p>
            <p style="float:right; width:200px; 350px; margin-left:10px;"><img src="/i/tournament/tccc07/algo.jpg"></p>
            <br /><br />
            
            <p><strong><tc-webtag:handle coderId="10574855" context="algorithm" darkBG="true" /> finished strongly as the winner of the 2007 TopCoder Collegiate Challenge Algorithm competition, taking home the top prize of $25,000. <tc-webtag:handle coderId="9906197" context="algorithm" darkBG="true" /> came in second, and <tc-webtag:handle coderId="7390224" context="algorithm" darkBG="true" /> took home the third.</strong></p>


            
<br /><br />
<p>by <tc-webtag:handle coderId="7485898" context="algorithm"/></p>

<h2>RandomRide</h2>

<p>
This problem can be solved by a simple emulation of the movement process. Nevertheless, the solution contains two tricky parts. Firstly, for each moment of time we need to know which road should be chosen for each flip (or flips) result. Secondly, we should somehow realize that we will never get back home. 
</p>
<p>
The first problem can be resolved  by storing the map in a proper way. The easiest way to do this is to store for each intersection all its neighbors in a clockwise order. Using this information we can easily determine the type of the intersection (three-roads or four-roads) and an appropriate road for the flip (or flips) result. 
</p>
<p>
The second problem is not a problem at all if we trust the statement <i>"if we ride for a rather long time, we will never get back home"</i>. Let's show that this statement is true and will find a better approximation for the "rather long time" part. Each moment of time is characterized by a current intersection, a current directing and a current shift in the <b>flips</b>. Multiplying the quantities of distinct values for each of the listed parameters we will get that 15*4*50 = 3000 steps (at most 4 flips each step) are enough to report the infinite ride. 
</p>
<p>You can take someone's solution as a reference.</p>

<h2>Factorer</h2>

<p>
First of all, we need to solve a "<b>a</b>x^2 + <b>b</b>x + <b>c</b> = 0" equation. As we know from the algebra course the solutions for it are (-<b>b</b>-sqrt(<i>det</i>))/(2*<b>a</b>) and (-<b>b</b>+sqrt(<i>det</i>))/(2*<b>a</b>), where <i>det</i> is equal to <b>b</b>*<b>b</b>-4*<b>a</b>*<b>c</b>. If the solutions are <i>x1</i> and <i>x2</i>, the desired factorization is <b>a</b>(x-<i>x1</i>)(x-<i>x2</i>). The only task that remains is to move the <b>a</b> coefficient inside the brackets in order to make all parameters be integers and choose the best result according to the tie-breaking rules.
</p>
<p>
Let's look at the <i>det</i> value. If it is not a perfect square, 
we can not factorize the polynomial because <i>x1</i> and <i>x2</i> will be irrational.
Otherwise <i>x1</i> and <i>x2</i> are rational, i.e. can be presented in a form of a 
proper fractions <i>p1</i>/<i>q1</i> and <i>p2</i>/<i>q2</i>, respectively (where p1, p2, q1 and q2 are all integers). 
So, to get an integer factorization we must multiply the expression in the first brackets by <i>q1</i> and the expression in the second brackets by <i>q2</i>.
</p>
<p>
The last thing left is to find where to place the remaining part of <b>a</b> coefficient
 (it is now equal to a1 = <b>a</b> / <i>(q1 * q2)</i>) inside the brackets in order to achieve the best result according to the tie-breaking rules. 
Since we want the coefficient in the first brackets to be as big as possible, there
are exactly two options left. 
We choose one of the brackets to be the first one in the final factorization,
multiply both numbers inside it by a1, multiply it by -1 when needed (to make the first coefficient to be positive)
and compare the two results. The best of those should be formatted and returned.
</p>


<h2>FactoryEmulation</h2>

<p>
First of all, let's assume that we want to fill all orders. This assumption will make us try all possible subsets of the given <b>orders</b> and choose one with the maximum profit. Let's also assume that orders are sorted by the <i>time</i> parameter.
</p>
<p>
Each second we are either increasing <i>productivity</i> ('I' second) or producing goods ('P' second). Increasing <i>productivity</i> is good for perspective, producing goods is good for current needs. We will fulfill orders step-by-step starting with the earliest one. 
</p>
<p>
Initially, all seconds are 'I' seconds. If an order at time T arrives and there are not enough of goods for it, the best way to obtain the required amount of goods is converting some 'I' seconds right before time T into 'P' seconds. So, we convert each latest 'I' second preceding T into 'P' second until it is enough of goods to fulfill the order. 
</p>
<p>
It is not very hard to show that the described algorithm is correct. But it has a defect - it is too slow to get into the time limit. The solution is to perform batch updates from 'I' seconds into 'P' seconds instead of updating them one-by-one. The idea is to estimate the required amount of such updates using the number of missing goods.
</p>


            
            

        </div>
    </div>
    <jsp:include page="../footer.jsp" />
    </div>
</div>
</body>
</html>