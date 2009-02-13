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
                        <h1><span>The finals, and final thoughts - 06.29.07 9:30 PM EDT</span></h1>
                        
                        <div style="float:right;">
                            <tc-webtag:forumLink forumID="516303" message="Discuss" />
                        </div>
                    
                        <img src="/i/m/jmzero_big.jpg" alt="" width="55" height="61" border="0" hspace="6" vspace="1" align="left" class="myStatsPhoto"/><br />
                        By&#160;<tc-webtag:handle coderId="15498334" context="algorithm"/><br />
                        <span class="smallText"><em>TopCoder Member</em></span>
                        <br clear="all" />
                        
                        <br>
                        <p>By now I'm sure you're aware of the results for all of the major competitions.  If you were waiting for me to reveal them, well... um, I don't think you were, and I'm going to go with that - so, spoilers ahoy!.</p>

                        <p>I thought the problems for the final round were a lot of fun.  The easy problem was particularly engaging.  Initially the problem seems very simple - simulate your stock value over time, and at each point pick the stock that's rising the fastest.  On the surface, this seems to be a problem I can solve.</p>
                        
                        <p>But then the doubt starts to creep in.  If this is a problem I can solve, what is it doing in the final round of the TCO?  Is there something I'm missing?  Eventually my doubt congealed around an idea - what if there's a situation where it pays to switch stocks between price changes?  This is born of a fairly simple idea: if a stock price goes up one dollar a day, then over time this one dollar a day becomes less and less relatively important.  Assuming the stock starts at $1, the next day it's worth $2.  Wow, you've doubled your money.  But on day 20, your stock is rising from $20 to $21.  That's only a 5% increase.  Supposing the stock started at $300, the change would start off as less dramatic, but over time the change seems to be more consistent.  The difference between $320 and $321 is almost as good as the difference between $300 and $301.</p>
                        
                        <p>There were a few coders who seemed to grasp onto this same doubt at the same time - and indeed many of the contestants seem to have felt some concern that these cases might exist (and thus implemented solutions that would cope with this kind of scenario).  For a while, I was gathered with a number of spectators discussing the issue, with many coders taking both sides of the debate at various times.  Eventually, I think I was the only one remaining who kept faith that a problem case might exist, leading <tc-webtag:handle coderId="10428762" context="algorithm"/> to dub me the pope of my own little religion.</p>
                        
                        <p>Meanwhile, <tc-webtag:handle coderId="309453" context="algorithm"/> apparently never experienced any crisis of faith - and thus was very fast in submitting the straightforward greedy solution for the easy.  This, as you know now, proved to be decisive as no medium or hard solutions ended up passing system tests.  To be clear, the "problem case" is impossible.  While over time two continually rising stocks will converge in terms of growth rate, the "lines" never cross.  For better or worse, as <tc-webtag:handle coderId="272072" context="algorithm"/> noted, in a sense the contest was decided 5 minutes in.</p>
                        
                        <p>While I wish our friendly, affable winner all the joy in the world, I'll admit I was a tad disappointed with how the final played out.  I have a personal preference for somewhat easier problems and more successful submissions.  I like a rout, where many competitors are able to submit several successful problems and where the top competitors demonstrate absolute mastery in bringing wrath and burnination to the countryside.</p>
                        
                        <div align="center"><img src="/i/tournament/tco07/blogs/jmzero09burn.png"></div><br />
                        
                        <p>On the other hand, one thing I did like about this final was that, with the exception of <tc-webtag:handle coderId="144400" context="algorithm"/>'s medium, the solutions failed in challenges rather than system tests.  The challenge phase is exciting, and I know for myself I feel better losing a problem to a challenge (in which the solution lives on as somebody's 50 points) than to a system test (which feels like my problem just arbitrarily disappeared, though it looked fine to me and my competitors).</p>
                        
                        <div align="center"><img src="/i/tournament/tco07/blogs/jmzero09grue.png"></div><br />
                        
                        <p>It's a bit sad to see the contest stage be taken down.  It seems like an eternity since the contest began, but it's been a load of fun.  I'll miss being here, interacting with the great minds and I'll miss the excitement of the competition.  Tonight is the closing reception, and competitors will soon begin dispersing to homes around the world.</p>
                        
                        <div align="center"><img src="/i/tournament/tco07/blogs/jmzero09stage.jpg"></div><br />
                        
                        <p>Perhaps next year I'll be back as a competitor.  Likely not - but I should very much enjoy the prospect of being here again, and the competition has certainly rekindled my desire to improve my skills.  Thanks for reading; I've enjoyed writing these entries and hopefully you've enjoyed reading them.</p>
                        
                        <p>Thanks.</p>

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