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
    <jsp:include page="../script.jsp" />
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
                    <jsp:param name="tabLev1" value="overview"/>
                    <jsp:param name="tabLev2" value="onsiteevents"/>
                    <jsp:param name="tabLev3" value="blogs"/>
                    </jsp:include>

                </td>
                <td id="bodySpacer" width="100%">
                    <div id="pageBody">
                        <h1><span>Navigating space in a fishbowl - 06.27.07 3:00 PM EDT</span></h1>
                        
                        <div style="float:right;">
                            <tc-webtag:forumLink forumID="516303" message="Discuss" />
                        </div>
                    
                        <img src="/i/m/jmzero_big.jpg" alt="" width="55" height="61" border="0" hspace="6" vspace="1" align="left" class="myStatsPhoto"/><br />
                        By&#160;<tc-webtag:handle coderId="15498334" context="algorithm"/><br />
                        <span class="smallText"><em>TopCoder Member</em></span>
                        <br clear="all" />
                        
                        <br>
                        <p>It's Wednesday morning, and competition has begun in earnest.  The first algorithm semifinal round is underway, and the very first problem was enough to stump me.  I got a good explanation from <tc-webtag:handle coderId="8547850" context="algorithm"/>.  Then I got him to give it to me again, this time talking slowly and using puppets.  I'm confident now that, given time, I could implement an incorrect solution.  The medium problem is one that's a little easier to grasp, but a small nightmare in implementation.  It involves evaluating poker hands, and it's very easy to mess up one of the many types of hands - I expect a vigorous challenge phase.</p>  

                        <p>The atmosphere here is electric, with a lot of knowledgeable spectators digesting the problems and making predictions on which solutions will pass muster.  I find it very interesting to hear the different competitors views on the problems and different solutions.  It's like some kind of second-hand omniscience.  I'd do much better in SRMs if I could confer with <tc-webtag:handle coderId="8357090" context="algorithm"/> or <tc-webtag:handle coderId="10428762" context="algorithm"/> on every little thing. </p>
                        
                        <p>This morning also sees the beginning of the marathon competition.  The problem involves piloting a spaceship in 2-D space through a series of waypoints.  This is made more complicated by a number of planets on the map which serve as deadly obstacles as well as gravity wells affecting navigation.  TopCoder has set up a human-piloted version of this problem that allows spectators to make like Wesley Crusher and test out their Picard manoeuvers.</p>
                        
                        <p>Humans don't really have the dexterity or computational power to get an optimal solution, but I've seen some creative techniques - including one person just setting up shop for a while in a gravitational deadspot.  He figured it'd be safer there, and with all of the spaceship traffic in the neighborhood it'd be a good place to open a fueling station.  Quite often, though, the result of human navigation is decidedly non-optimal.</p>
                        
                        <div align=center><img src="/i/tournament/tco07/blogs/jmzero02Spacecrash.jpg" /></div><br />
                        
                        <p>The problem description includes a fair bit of simulation code, and so far the competitors seem to be digesting the problem statement, getting their testing arrangement set up, and doing research.  As they compile, we're able to see test runs for their programs as well as their scores.  At about 2 hours in, there's been only been a couple full submissions (<tc-webtag:handle coderId="21932422" context="marathon"/> and <tc-webtag:handle coderId="9987185" context="marathon"/>) and on competitors screens we're seeing more reading than typing. TopCoder has allowed competitors a variety of reference materials, and the competitors seem to be making good use of them.</p>  
                        
                        <div align=center><img src="/i/tournament/tco07/blogs/jmzero02Wiki.jpg" /></div><br />
                        
                        <p>As solutions progress now, we're seeing more testing with the visualizer.  Below we see <tc-webtag:handle coderId="15803924" context="marathon"/>'s .invasion force, which is about to .crash into .earth:</p>
                        
                        <div align=center><img src="/i/tournament/tco07/blogs/jmzero02Invader.jpg" /></div><br />
                        
                        <p>My previous concern that the competitors would be distracted by the lack of distractions turns out to have been unfounded.  The layout of the competition area means that their raised platform is kind of a fishbowl (in terms of people looking in), and it also means that they're subject to hearing about all of the developments in the algorithm competition (which tend to involve a lot of cheering).  Still, all competitors seem to be making good progress and it will be very interesting to see who wins out.</p> 
                        
                        <div align="center"><img src="/i/tournament/tco07/blogs/jmzero02Fishbowl.jpg" /></div><br />
                        
                        <p>I'm off now to the UBS sponsor presentation.  Up next will be the second algorithm semifinal and the results of the marathon match.  Good luck to those of you playing along!</p>
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