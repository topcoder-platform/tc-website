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
                        <h1><span>The wildcard round: Now with 50% more Batman references - 06.29.07 10:30 AM EDT</span></h1>
                        
                        <div style="float:right;">
                            <tc-webtag:forumLink forumID="516303" message="Discuss" />
                        </div>
                    
                        <img src="/i/m/jmzero_big.jpg" alt="" width="55" height="61" border="0" hspace="6" vspace="1" align="left" class="myStatsPhoto"/><br />
                        By&#160;<tc-webtag:handle coderId="15498334" context="algorithm"/><br />
                        <span class="smallText"><em>TopCoder Member</em></span>
                        <br clear="all" />
                        
                        <br>
                        <p><i>I understand that, through my own failings, this is to be published long after you know the results of the wildcard round (I've had some problems with my e-mail, and this entry ended up being sent late).  Luckily, while proper news has a certain shelflife, a crumby report such as this one will be precisely as useful days later as it was when it was written.  That is to say it will continue to be not very useful at all.)</i></p>

                        <p>The wildcard round has a history of being extremely competitive, often sporting a list of competitors that looks more like it's the final itself.  This year this is especially true.  <tc-webtag:handle coderId="144400" context="algorithm"/> and <tc-webtag:handle coderId="272072" context="algorithm"/> might be the most recognizable names in the round, but the entire field is strikingly well qualified.  <i>(As the round is already over in your timeline, I've excised a longer discussion of the participants, as well as my predictions)</i>.</p>
                         
                        <p>Before each algorithm round, it's fascinating to watch competitors get their template code in order.  Some competitors type out algorithms like maxflow, tidbits like GCD and LCM routines, or long lists of macros.  Others write only a few headers and then get a little last minute practice.  Whatever is prepared must be done blind, as the problems aren't available during this time.  It's like getting ready to storm a castle without knowing what kind of defense you'll meet.  The limited time means you can't be like Batman and put everything in your utility belt.  If the castle has a man pouring boiling oil, you'll be happy if you brought a proper Bat-umbrella.  If there's alligators, you're hoping you brought your Bat-alligator-repellant.  But that won't help with archers.[<i>For the purposes of this thought experiment, we can assume that Batman has <a href="http://www.dcindexes.com/database/story-details.php?storyid=7437" target="_blank">traveled back in time</a>.]</i></p>
                        
                        <div align="center"><img src="/i/tournament/tco07/blogs/jmzero06castle3.png"></div><br />
                        
                        <p>In this case, there was a moat full of ninjas: the "easy" was an awkward problem involving multiplying power series.  All of the competitors were able to deal with this eventuality, eventually, but <tc-webtag:handle coderId="7446789" context="algorithm"/> was the only one who brought in a fraction class - and this meant he was able to dispatch the problem 12 points faster than his nearest competitor.</p>
                        
                        <p>I thought the 550 (the medium problem) in this round was particularly enjoyable.  The problem involves folding a piece of paper a number of times, either lengthwise or widthwise, along different lines (so that you need not be doubling the whole sheet each time).  In the end, the question was "How thick is the paper at its thickest point?"  The smarter competitors made a small realization that I found to be an engaging, if small, mental exercise.  While the paper is folded both length-wise and width-wise, we don't need to worry about the interaction of vertical and horizontal folds.  Rather, we can consider just the vertical folds (and the thickest section created with just those folds), then calculate the result of just the horizontal folds - and multiply those two results to find the thickest section overall.  If you're not convinced, try imagining the folding and where you'll find the thickest point.</p>
                        
                        <p>While this realization helps, it's a small part of the overall solution - which still requires a fair bit of awkward code to simulate the folding process in one direction.  The simulation, in turn, is made more difficult by how large the possible dimensions of the paper could be (up to 100000 by 100000 units).  Having a large area of paper means we can't simply track how thick each square unit of paper is - there's simply too many units to remember the thickness at each point.  Instead, we divide the paper into sections based on where it is folded and track the thickness of whole sections at a time.  This saves us memory, but makes the solution more complicated to write.  <i>(In the end, only two competitors' solutions were successful, though many were submitted.)</i></p>   
                        
                        <p>At the end of the coding phase, <tc-webtag:handle coderId="272072" context="algorithm"/> and <tc-webtag:handle coderId="144400" context="algorithm"/> were far out ahead having submitted on all three problems.  However, as was the case with previous rounds this was hardly the end of the story.  The challenge phase saw quite a bit of action, with <tc-webtag:handle coderId="7446789" context="algorithm"/> netting 100 points on 3/5 successful challenges, while <tc-webtag:handle coderId="144400" context="algorithm"/> spent 50 points chasing easy problems in vain.  More critical were the points lost by those challenged - only two medium solutions survived this phase.</p>
                        
                        <p>At the onsite rounds, system test results are announced very soon after the contest with a neat visualization.  Starting at the competitor with the least points, system tests are run, each solution is marked as passed or failed, and the order is updated.  It works kind of like a flood, with water levels slowly rising and individual solutions forced to sink or swim.  While some solutions have the look of a well designed, seaworthy ship, the nature of the competition means that many solutions end up a little more haphazard.  Not so much a ship but a raft.  A raft made of gingerbread and candy canes.  </p>
                        
                        <div align="center"><img src="/i/tournament/tco07/blogs/jmzero06gravy3.png"></div><br />
                        
                        <p>While one can hope that the little marshmallow peep on board survives, it's hard not to feel scared for the little guy.  In this round, we saw a number of rather rickety looking solutions (including on the hard problem) in the last few minutes.  And indeed, the cruel wave of system tests managed to sink the majority of submissions.  As the storm abated, <tc-webtag:handle coderId="144400" context="algorithm"/>'s easy and hard problems had foundered and he was left clinging to his 550 point life preserver (where he wrote a brilliant solution in only 15 minutes).  While <tc-webtag:handle coderId="7446789" context="algorithm"/> had been somewhat slower on his problems, this was of little consequence as both his easy and medium were successful (not to mention his small fortune in challenge points).  His elated victory celebration was perhaps the best we've seen thus far.  It was clear this wasn't an expected victory, and I wish him luck in the final.</p>

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