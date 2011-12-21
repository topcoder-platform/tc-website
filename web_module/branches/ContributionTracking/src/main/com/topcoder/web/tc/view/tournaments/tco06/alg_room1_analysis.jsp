<%@  page language="java"  %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<jsp:include page="/script.jsp" />

<title>2006 TopCoder Open - Computer Programming Tournament</title>
<link type="text/css" rel="stylesheet" href="/css/TCO06style.css"/>
<link type="text/css" rel="stylesheet" href="/css/coders.css"/>
</head>
<body>

<!-- Tab barlinks-->
<jsp:include page="links.jsp" >
<jsp:param name="tabLev1" value="algorithm"/>
<jsp:param name="tabLev2" value="summary"/>
<jsp:param name="tabLev3" value="room1"/>
</jsp:include>

<table width="100%" border=0 cellpadding=0 cellspacing=0>
<!-- Body-->
   <tr valign=top>
      <td valign=top align=center>
      <div class="bodySpacer">
            
<div class="leadPhoto">
<p align="center"><span class="bodyText" align="center"><a href="/tc?module=Static&d1=tournaments&d2=tco06&d3=photos">See more photos!</a></span></p>
<img src="/i/tournament/tco06/onsite_photos/shot_room1.jpg" alt="" class="photoFrameBig" /><br>
</div>

<p style="vertical-align:top;">
<span class="bigTitle">cyfra wins Room 1</span>
<br><br>
<img src="/i/m/lbackstrom_big.jpg" alt="" width="55" height="61" border="0" hspace="6" vspace="1" align="left" class="myStatsPhoto"/><br />
<tc-webtag:forumLink forumID="505961" message="Discuss this match" /><br>
Wednesday, May 3, 2006<br>
Introduction by <tc-webtag:handle coderId="159052" context="algorithm"/>
<br><br>
The TCO kicked off this morning in sunny Las Vegas.  With more
competitors from more countries and more spectators than ever before
This year's TCO promises to be a thrilling event.
<br><br>
The round started with all but one of the competitors opening the easy
problem.  OpenGL was first to submit, but he found a flaw in his
solution and eventually resubmitted.  Petr submitted second, 13
points ahead of krijgertje.  The easy proved difficulty for most
though, and after 25 minutes, only half of the competitors had
submitted it, but the other half were all still working hard on it.
As the seconds ticked by, the easies rolled slowly in, and after 40
minutes all but 3 of the competitors had submitted it.  Petr was the
first to submit the second problem, with a little over 40 minutes left
to go.  krijgertje was next to submit the medium problem, but he had
to resubmit, putting him over 2 challenges behind Petr, but giving him
enough points to stay in second until the end.  At the end of the
coding phase, all but one of the competitors had submitted the easy
problem, and 10 of the 16 competitors had submitted the medium.  Petr
had a comfortable lead, and seemed sure to advance as long as his two
submissions held up.  krijgertje, on the other hand, was less than one
challenge ahead of cyfra and Egor in third and fourth places.
<br><br>
The challenge phase started off slow, with a couple of unsuccessful
challenge in the first few minutes.  With two minutes to go though,
Petr successfully challenged krijgertje, expanding his lead.  Shortly
later, SnapDragon successfully challenged OpenGL, moving him into
third place, with cyfra holding on in second.
<br><br>
System tests were not kind to the competitors and only cyfra had two
submissions survive for the win.  Petr's medium fell, but his fast
easy problem was enough to get him into the finals (by 0.25 points).
SnapDragon, bladerunner, Ying, and grotmol, the only other competitors
with positive points, advance to the wildcard round.
</p>

<h1>ThirstyGroup </h1>
by <tc-webtag:handle coderId="7390467" context="algorithm"/>
<br><br>
Regardless of which glass we choose, the amount of water each glass gets doesn't change. We need to find the glass which will get us the most water in the end.
<br><br>
Simulating the entire party can take a billion time units, so we need to think of something better. Assume that we have an infinite supply of water available. Suppose we evaluate the situation at time index T. The problem statement describes the participants as greedy i.e. everyone attempts to gather as much water as possible. But this enables us to calculate the exact amount of water everyone got by time T and the overall water used. The exact formula for the i-th person is <tt>ceil(T / (capacities[i]+1)) * capacities[i]</tt>, which can be written as <tt>(T+capacities[i]) / (capacities[i]+1) * capacities[i]</tt>, when division truncates.
<br><br>
The next thing to note is that the total amount of water used is a nondecreasing function of T. This allows us to use binary search to find the last time index at which the amount of water used is no more than the amount of water available. Earlier we assumed that the supply of water was infinite and everyone could always fully refill their glass. This is not the case, but our binary search will calculate the last time index for which the assumption holds.
<br><br>
What's left is to distribute the remaining water. A bit of insight tells us that all the remaining water will be taken in an instant (otherwise, our binary search would have returned a later time index). But the only ones to get water will be those whose glasses are empty at time T, which the division remainder operator will happily tell us: the condition is <tt>T mod (capacities[i]+1) == 0</tt>. We now know how much water each glass gets and which one to choose
<br><br>



<h1>Postman</h1>
by <tc-webtag:handle coderId="309453" context="algorithm"/>
<br><br>
The easy part is parsing the input and splitting it in two sets: the
odd house numbers and the even ones. Let's say these two sets have
N<sub>1</sub> and N<sub>2</sub> elements, and are given by the numbers
num<sub>1</sub>[1]...num<sub>1</sub>[N<sub>1</sub>] and
num<sub>2</sub>[1]...num<sub>2</sub>[N<sub>2</sub>]. We assume these
two arrays to be sorted.
<br><br>
We start in front of house number 1 and have to walk our way to
the increasing numbers. The first observation is that it never helps
to deliver a letter to a house on one side of the road if there are
still houses to deliver to on the same side with both smaller and
larger numbers. So to start off with, we can deliver the letters on both
sides in increasing order. Only in the end, delivering the last
letter first and then walking back, can be useful.
<br><br>
This increasing order in which the letters can be delivered
immediately smells like a dynamic programming approach, which indeed
is the right way to solve it. If we call
best<sub>i</sub>[n<sub>1</sub>,n<sub>2</sub>] the best time to deliver all
letters up to n<sub>1</sub> on side one and up to n<sub>2</sub> on
side two, with the last letter being delivered on side i (so that we
are in front of house number num<sub>i</sub>[n<sub>i</sub>]), we can express
this best time recursively. The relation for best<sub>1</sub> is:
<br><br>
best<sub>1</sub>[n<sub>1</sub>,n<sub>2</sub>] = min
(best<sub>1</sub>[n<sub>1</sub>-1,n<sub>2</sub>] +
distance(n<sub>1</sub>-1,n<sub>1</sub>), 
best<sub>2</sub>[n<sub>1</sub>-1,n<sub>2</sub>] +
distance(n<sub>2</sub>,n<sub>1</sub>) + crosstime).
<br><br>
The intuition behind this recursion should be clear. A similar
equation with some ones and twos interchanged holds for
best<sub>2</sub>. To obtain the final answer one subtlety arises as
already mentioned: after delivering every letter on one side, it can
be quicker to walk to the end of the other side, deliver there, and
then walk back. The final answer therefore is either
best<sub>1</sub>[N<sub>1</sub>,N<sub>2</sub>],
best<sub>2</sub>[N<sub>1</sub>,N<sub>2</sub>], the minimum of the
following expressions (with n<sub>2</sub> being the free parameter)
<br><br>
best<sub>1</sub>[N<sub>1</sub>,n<sub>2</sub>] + crosstime 
+ distance(N<sub>1</sub>,N<sub>2</sub>) 
+ distance(N<sub>2</sub>,n<sub>2</sub>+1)
<br><br>
or the similar expression for best<sub>2</sub>. The minimal one is the
final answer.



<h1>SymmetricalTree</h1>
by <tc-webtag:handle coderId="7485898" context="algorithm"/>
<br><br>
To solve the main problem let's solve the following subproblem. For
two given nodes of the tree v1 and v2 let's find the best in terms of
the problem common string representation B[v1, v2], i.e. such first
lexicographically representation which is obtained for both nodes by
removing the least number of child nodes. This can be done using
dynamic programming. Let's introduce A1[v1, v2, s1, s2], where s1 is
any subset of children of the node v1, s2 is any subset of children of
the node v2, and A1 is the best common string representation of nodes
v1 and v2, if it is allowed to take only children from s1 and s2
correspondingly. Let's define A[v1, v2, s1, s2] equal to A1[v1, v2,
s1, s2] without leading '1' and last '0'.
So, B[v1, v2] = '1' + A[v1, v2, all children of v1, all children of
v2] + '0'. To find A[v1, v2, s1, s2] let's iterate the last child node
i1 in s1 and i2 in s2. In this case A[v1, v2, s1, s2] = A[v1, v2,
s1-i1, s2-i2] + B[i1, i2].
Now back to the main problem. For the root node let's iterate through
all possible first c1 and last c2 children of the root in the result
tree. In this case the answer will be B[c1, c2] + answer for the
problem without nodes c1 and c2 + reversed B[c1, c2]. From all such
answers choose the best. In such a way we reduced the dimension of the
problem. If the root node has only one child left, the answer will be
the answer for this node with '1' and '0' attached correspondingly. If
the root node has two children we can try to delete one of them and
get the previous case.
        </div>
      </td>
        
         
<!-- Right Column-->
        <td width=170 align=right>
            <jsp:include page="right.jsp">
            <jsp:param name="level1" value="all"/>
            </jsp:include>
         </td>
      
   </tr>
   
</table>
   
   


<jsp:include page="../../foot.jsp" />

</body>

</html>
