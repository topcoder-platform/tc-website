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
                    <jsp:param name="tabLev1" value="marathon"/>
                    <jsp:param name="tabLev2" value="summary"/>
                    <jsp:param name="tabLev3" value=""/>
                    </jsp:include>

                </td>
                <td id="bodySpacer" width="100%">
                    <div id="pageBody">

                        <h1><span>Mojito1 is the Marathon Match Champion</span></h1>
                        <div style="float:right;">
                            <A HREF="http://forums.topcoder.com/?module=ThreadList&amp;forumID=516304">Discuss this</A><br>
                        </div>

<img src="/i/m/lbackstrom_big.jpg" alt="" width="55" height="61" border="0" hspace="6" vspace="1" align="left" class="myStatsPhoto"/><br />
Friday, June 29, 2007<br>
Introduction by <tc-webtag:handle coderId="159052" context="marathon_match"/>

<br /><br />
<img style="float:right; width:200px; 350px; padding-left:10px;" src="/i/tournament/tco07/marathon.jpg">
<br><br>
<p>To get here, competitors had to write programs to measure the density of mountains, play poker, find diseased trees in a forest, and route robots in a warehouse.  For each of these contests, competitors had one or two weeks to think about and test their approaches.  Eight competitors emerged from a field of 911 and routed their robots better than the rest, to take top spots in the final online round.<br/>
<br/>

Onsite the marathon turned into more of a medium distance run, as weeks were reduced to eight hours.  But, for many of these top competitors, time pressure was nothing new, as a number of them were also top competitors in algorithm problems.<br/>
<br/>

At the early hour of 9AM, competitors showed up to spend 8 of the next 9 hours on stage, working on what would prove to be a very difficult problem, worthy of an onsite finals.  <br/>
<br/>

The problem turned out to be conceptually simple: you control a spaceship in a universe with a number of stationary planets.  Each of the planets exerts its gravity on your ship, pulling it this way and that.  Your task is to navigate to a number of waypoints by using your thrusters, while not crashing into any of the planets.<br/>
<br/>

However, it was anything but simple to create a solution.  Despite their best efforts, most people were still hitting almost as many planets as waypoints at the noon lunch break.  After lunch things the competition started to really swing into high gear.  mojito1 made a strong submission and moved to the top of the pack, often hitting all of the waypoints.  The other competitors made steady improvements through the rest of the afternoon, but mojito1 stayed on top all the way to the end as his ship just got better and better.  By the end of the day, the exhausted competitors were spending more time controlling the game manually (an activity that proved popular for the spectators also) than coding.<br/>
<br/>

At the end of the competition, <tc-webtag:handle coderId="10600282" context="marathon_match"/> was on top, followed by <tc-webtag:handle coderId="9987185" context="marathon_match"/> and <tc-webtag:handle coderId="261024" context="marathon_match"/>. However, the gap between competitors was very small, and everyone knew that the 50 provisional tests were far from decisive.  However, from watching the submissions in action, <tc-webtag:handle coderId="10600282" context="marathon_match"/> certainly looked best, and on the larger test set his lead held up, giving him the win -- and the $15,000 prize -- at the first ever TCO Marathon Match.
</p>

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
