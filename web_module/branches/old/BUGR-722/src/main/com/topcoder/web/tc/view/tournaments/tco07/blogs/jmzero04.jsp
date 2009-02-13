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
                        <h1><span>Blue Steel and a short Marathon - 06.28.07 10:30 AM EDT</span></h1>
                        
                        <div style="float:right;">
                            <tc-webtag:forumLink forumID="516303" message="Discuss" />
                        </div>
                    
                        <img src="/i/m/jmzero_big.jpg" alt="" width="55" height="61" border="0" hspace="6" vspace="1" align="left" class="myStatsPhoto"/><br />
                        By&#160;<tc-webtag:handle coderId="15498334" context="algorithm"/><br />
                        <span class="smallText"><em>TopCoder Member</em></span>
                        <br clear="all" />
                        
                        <br>
                        <p>On Wednesday night TopCoder treated us to a dinner and show at the "<a href="http://www.excalibur.com/entertainment/tournament_of_kings.aspx" target="_blank">Tournament of Kings</a>." Jousting, fireworks, and hand-to-hand combat to the death proved to be welcome relaxation after the stress of TopCoder competition.  At the event, the TopCoder section was assigned to cheer for Spain, though I think some of the competitors sympathies may have drifted more towards cheering for the Russian champion.  I particularly noticed <tc-webtag:handle coderId="11829284" context="algorithm"/> seemed a bit unwilling to cheer on our fated-to-lose-anyway Spaniard.</p>

                        <div align=center><img alt="Tournament Scores" src="/i/tournament/tco07/blogs/jmzero04tournament.png"></div><br />
                        
                        <p>I'm sorry I was unable to get an actual photo of the event, but they said there was no picture-taking allowed and I didn't want an argument with the gigantic man standing in front of us in tight black pants.  Not only did he clearly have the strength to crush a contraband camera with his eyebrows, but he had the breeze-tossed blond hair and permanent "blue steel" expression of a man who'd done battle with many a romance-novel villain.  No, I'm sorry but my camera was staying well out of sight.</p> 
                        
                        <p>But while I can't show it to you, the show was great.  I was particularly impressed by the "human tower" acrobatic work; I have no idea how one man can be strong enough to support the weight of 8 others and still be agile enough to do a difficult tumbling run (on a dirt surface, no less). I also appreciated the effort that must go into presenting live jousting.  Real unpredictable animals, splintering lances, and a live audience must make for a nerve-wracking performance.</p>
                        
                        <p>Back to the competition front, below are the marathon standings just before the end of competition:</p>
                        
                        <div align=center><img alt="Marathon Scores" src="/i/tournament/tco07/blogs/jmzero04marathon.jpg"></div><br />
                        
                        <p>Here <tc-webtag:handle coderId="10600282" context="marathon"/> is enjoying a slight lead - but the nature of marathon scoring is such that his victory is far from certain.  In some past matches, preliminary and final scoring have shown only a fleeting resemblance - so  for the other competitors there's still plenty of room to hope.  Leaving the competition area, early favorite <tc-webtag:handle coderId="21932422" context="marathon"/> commented that this "just wasn't [his] problem - maybe in a week, but not in 8 hours".  All of the competitors I caught up with noted the difficulty of the problem and the challenges of addressing it in such a short timespan (short for a marathon problem at least).  Regardless of the eventual winner, my impression was that the first marathon competition was a smashing success, and I think this impression was shared by the many spectators who watched or who tried their hand at piloting a ship themselves.</p>

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