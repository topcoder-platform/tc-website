   <%@ page contentType="text/html;charset=utf-8" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
<title>TopCoder</title>
<jsp:include page="../script.jsp" />
<jsp:include page="../style.jsp">
<jsp:param name="key" value="tc_stats"/>
</jsp:include>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
</head>

<body>

<jsp:include page="../top.jsp">
    <jsp:param name="level1" value="long"/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
<tr valign="top">
<%-- Left Column Begins--%>
<td width="180">
         <jsp:include page="../includes/global_left.jsp">
            <jsp:param name="node" value="long_editorials"/>
         </jsp:include>
</td>
<%-- Left Column Ends --%>

<%-- Center Column Begins --%>
<TD CLASS="statTableSpacer" WIDTH="100%" VALIGN="top">
<div align="center">
   <div class="bodyText" style="width: 100%; text-align: left;">

    <jsp:include page="../page_title.jsp">
        <jsp:param name="image" value="long_comps_topcoder"/>
        <jsp:param name="title" value="Match Editorials"/>
    </jsp:include>

<div style="float: right;" align="right"><A href="/longcontest/?module=Static&d1=match_editorials&d2=archive">Archive</A><br>
<tc-webtag:forumLink forumID="506088" message="Discuss this match" />
</div>

<span class="bodySubtitle">Marathon Match 4</span><br>08.09.2006 - 08.16.2006
<br><br>

by <tc-webtag:handle coderId="159052" /><br>
<span class="smallText"><em>TopCoder Member</em></span>

<br><br><br>
<span class="bodySubtitle"><A href="/longcontest/?module=ViewProblemStatement&compid=5941&rd=10088">BattleshipGame</A></span>
<br><br>

Most of us have played the classic game of Battleship.  I'd always viewed
it as mostly a game of luck but, while the element of luck can't be denied,
this competition proved that some strategies are much better than others.
<br>
<br>
Of course, this game was also a bit more complicated than regular
Battleship, since it allowed multiple shots in one turn.  This meant that a
good solution would need to  do a good job of interpreting the
results of the previous shots, and then pick where to fire next.<br>
<br>
For the first part, most solutions tried to infer as much information as
possible about the possible locations of each of the ships.
The board was small enough that a simple approach was fast enough to give
good results: iterate over all possible locations where each ship could be,
and for each location check to see if that location is consistent with the
outcomes of the shots fired so far.<br>
<br> 
This gives us quite a bit of information about the locations of the ships,
but of course it doesn't always make all possible inferences.  A slightly
better approximation could be made by iterating over all locations for all
pairs of ships, or all triples of ships, etc.  Of course, the more types of
inferences one tries to make, the longer and more complicated things get.
Furthermore, there are diminishing returns as one tries to make more
complicated inferences.  In practice, most competitors did nothing more
complex than looking at one ship at a time, and then marking locations as
used if there was only one possible location for a ship.<br><br>
Once one has a good idea of where ships are, the next thing is to figure
out where to shoot.  Again, a simple strategy worked well: find the spots
most likely to have ships, and shoot them.  To find the spots that likely
have ships, we can look at all the possible locations for each ship, and
compute a probability for each square on the grid.  So, if a ship could be
in 1 of 10 positions, the probability for each of those locations is 0.1,
and each cell covered by each of those positions gets 0.1.  We add up over
all positions, so some cells, which are covered by multiple positions will
have probability greater than 0.1.<br>
<br>
This gives us probabilities for every cell, for every  ship, and from that
we can compute the probabilities for just the cells: <br>
<tt>1 - (1-p<sub>1</sub>) (1-p<sub>2</sub>) (1-p<sub>3</sub>) ...
</tt><br>
Then, we can just pick the highest probability cells.<br>
<br>

This simple solution (keep track of possible ship locations, fire at high
probability spots) gives us a pretty good score, but to win we need to do a
little bit more.  There are lots of little tweaks we can make to both
stages to get marginal improvement, but it turned out that the key to the
winner's solution was to just add a bit of randomness in the shooting
stage.  After computing the probabilities for each cell, this solution
didn't just shoot at the k locations with the highest probability (where k
is the maximum number of shots).  Instead, it added a little bit of
randomness to the probabilities, and then picked the top k.<br><br>
While this doesn't seem like it should make a big difference at first, it
has a few nice properties.  First off, the randomness helps us break ties
randomly, so we don't end up doing something like breaking ties by grid
location.  More importantly, however, it prevents us from wasting too many
shots on a high probability area that doesn't pan out.  The probabilities
we've generated are highly correlated to the probabilities of the cells
adjacent to them: high probability cells will probably have high
probability cells next to them.  By adding a bit of randomness, we are
slightly less likely to put all our eggs in one basket.  There are probably
other strategies that would have the same benefits, but adding just a
little bit of randomness turned out to be good enough to win.
<br><br>
   </div>
</div>
</td>

<%-- Right Column Begins --%>
<td width="170">
    <jsp:include page="../public_right.jsp">
        <jsp:param name="level1" value="default"/>
    </jsp:include>
</td>
<%-- Right Column Ends --%>

<td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
</tr>
</table>

<jsp:include page="../foot.jsp"/>
</body>
</html>