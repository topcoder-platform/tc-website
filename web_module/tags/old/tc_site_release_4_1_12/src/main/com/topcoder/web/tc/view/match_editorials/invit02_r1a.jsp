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
<tc-webtag:forumLink forumID="505533" message="Discuss this match" /></div>
<span class="bodySubtitle">2002 TopCoder Invitational<br>Online Round #1, Part 1</span><BR/>Thursday, October 10, 2002
<br><br>

<H1> The Problems </H1> 

<font size="+2"><b>Lexer</b></font>&#160;
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505533" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />
 
Used as: Level 1<BR/>
<blockquote>
    <table cellspacing="2">
   <tr>
        <td style="background: #eee;" class="bodyText" colspan="2">
          <b>Div-I</b>
        </td>
      </tr>
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>Value</b>
        </td>
        <td style="background: #eee;" class="bodyText">300 points</td>
      </tr>
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>Submission Rate</b>
        </td>
        <td style="background: #eee;" class="bodyText">294/310 (94.84%) 
</td>
      </tr>
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>Success Rate</b>
        </td>
        <td style="background: #eee;" class="bodyText">264/294 (89.80%) 
</td>
      </tr>
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>High Score</b>
        </td>
        <td style="background: #eee;" class="bodyText">
          <b>radeye</b> for 293.51  points
                </td>
      </tr>
    </table>
    </blockquote>
<P><B>Implementation</B><BR/>
This is a straight-forward problem to solve, simply following the directions given. Java and C# users can use the startsWith method of their string class to see if the remaining letters correspond to a particular token. C++ users can use strncmp or the substr method to do the same. It's then a matter of picking the longest token that matches (if any) and adding it to a list. For Java and C# users, the toArray method of ArrayList is quite useful. </P>

<P>Mistakes seemed primarily to result from not following directions. </P>

 

<font size="+2"><b>UGroupOrder</b></font>&#160;
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505533" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />
 
Used as: Level 2<BR/>
 <blockquote>
    <table cellspacing="2">
   <tr>
        <td style="background: #eee;" class="bodyText" colspan="2">
          <b>Div-I</b>
        </td>
      </tr>
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>Value</b>
        </td>
        <td style="background: #eee;" class="bodyText">450 points</td>
      </tr>
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>Submission Rate</b>
        </td>
        <td style="background: #eee;" class="bodyText">249/310 (80.33%)
</td>
      </tr>
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>Success Rate</b>
        </td>
        <td style="background: #eee;" class="bodyText">195/249 (78.31%) 
</td>
      </tr>
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>High Score</b>
        </td>
        <td style="background: #eee;" class="bodyText">
          <b>reid</b> for 443.58   points
                </td>
      </tr>
    </table>
  </blockquote>
<P><B>Implementation</B><BR/>
On the surface, this appears to be one of those difficult number theory problems. But in fact a naive solution using obvious methods is sufficient. 
</P>
<P>The first task is being able to find all relatively prime integers that are between 0 and N exclusive. Relatively prime can be alternatively defined as two numbers that have a greatest common divisor of 1. Thus one can use the well-known Euclidean algorithm to filter out the numbers that are relatively prime to N. </P>

<P>Next we need to find the order of each relatively prime number. The hint given in the problem statement regarding (a*b) mod N = (a mod N)*(b mod N) was really unnecessary, as N is extremely small, giving no risk of overflow. One can simply multiply an accumulator by the number that is relatively prime to N, then find its value modulo N, and repeat this until 1 is obtained. 
</P>

<P>Since this was a problem with a very small domain of possible inputs, it's reasonable to iterate through all possible inputs in one's testing. This way one can be sure that no strange answers are generated and no arithmetic errors occur. 
</P>
 

<font size="+2"><b>Wireless</b></font>&#160;
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505533" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />
 
Used as: Level 3<BR/>
 <blockquote>
    <table cellspacing="2">
   <tr>
        <td style="background: #eee;" class="bodyText" colspan="2">
          <b>Div-I</b>
        </td>
      </tr>
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>Value</b>
        </td>
        <td style="background: #eee;" class="bodyText">900 points</td>
      </tr>
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>Submission Rate</b>
        </td>
        <td style="background: #eee;" class="bodyText">52/310 (16.78%)
</td>
      </tr>
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>Success Rate</b>
        </td>
        <td style="background: #eee;" class="bodyText">13/52 (25.00%) 
</td>
      </tr>
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>High Score</b>
        </td>
        <td style="background: #eee;" class="bodyText">
          <b>John Dethridge</b> for 449.65  points
                </td>
      </tr>
    </table>
  </blockquote> 
<P><B>Implementation</B><BR/>
The method of solving this problem is to iterate through all possible "interesting" values of t >= 0 (representing time). One could implement a fancy method of determining that both roaming nodes are moving away from all static nodes, thus concluding that distances will always increase from that time on, but that's unnecessary work and requires dealing with a bunch of special cases. It's easier to simply iterate through time up to some point where the two roaming nodes will necessarily have to be moving out of range of all static nodes. Since the nodes are required to move along an axis, we know that at most 20000 + range seconds need to pass before both nodes will have left the system. It is very reasonable to compute minimal distances between the two roaming nodes for 50000 different times. 
</P>
<P>So now all that is left is computing the minimal distance for two roaming nodes at a particular point in time. To do this, we iterate through all the possible combinations of endpoints that are in range of the two roaming nodes. We then just need to compute the minimal distance between those two endpoints in the static network. 
</P>
<P>Since this is a static network, we can precompute these distances before iterating over time. This is a simple application of an all-pairs-shortest-paths algorithm, such as Floyd's algorithm. The static nodes represent a graph, where there are edges between any pair of nodes that are within range of each other, with weight corresponding to Euclidean distance. 
</P><BR/>

<p>
<img src="/i/m/Logan_mug.gif" alt="" width="55" height="61" border="0" hspace="6" vspace="1" align="left" class="myStatsPhoto"/><br />
By&#160;<tc-webtag:handle coderId="112902" context="algorithm"/><br />
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

