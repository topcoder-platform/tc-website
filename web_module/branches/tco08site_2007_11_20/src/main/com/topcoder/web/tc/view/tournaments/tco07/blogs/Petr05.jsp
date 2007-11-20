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
                        <h1><span>Algorithm Semifinal Room #3 - 06.28.07 2:00 PM EDT</span></h1>
                    
                        <div style="float:right;">
                            <tc-webtag:forumLink forumID="516303" message="Discuss" />
                        </div>

                        <img src="/i/m/Petr_big.jpg" alt="" width="55" height="61" border="0" hspace="6" vspace="1" align="left" class="myStatsPhoto"/><br />
                        By&#160;<tc-webtag:handle coderId="10574855" context="algorithm"/><br />
                        <span class="smallText"><em>TopCoder Member</em></span>
                        <br clear="all" />
                        
                        <br>
                    
                        <p>9:40 - 19 minutes before the match, the competitors are already on the stage, and most are preparing their template code.</p>

                        <p>9:41 - they might be trying to hide the disappointment with not the very best breakfast :)</p>
                        
                        <p>9:47 - the spectators start to gather in the Arena, too. There are 47 people in the room already.</p>
                        
                        <p>9:49 - make that 58.</p>
                        
                        <p>9:51 - <tc-webtag:handle coderId="7485898" context="algorithm"/> has noticed quite unusual scores for the problems: 275, 450, 1000. Like the total unpredictableness of this round wasn't enough.</p>
                        
                        <p>9:54 - Eight Russians today, including 4 SPb IFMOers.</p>
                        
                        <p>9:55 - they're lining up the contestants again.</p>
                        
                        <p>9:56 - the second semifinal champion <tc-webtag:handle coderId="21822659" context="algorithm"/> is offering his expert advice today.</p>
                        
                        <p>9:59 - 91.</p>
                        
                        <p>10:03 - the easy seems to be a greedy problem - we should always do the jobs that have the most time remaining. Although this requires a bit of accuracy to implement.</p>
                        
                        <p>10:07 - <tc-webtag:handle coderId="15881985" context="algorithm"/> has submitted the easy. His solution is even more simple than greedy - he's doing binary search on the answer, then just checking that all the tasks limited to the first x seconds give at least x*k processor time. Marvellous!</p>
                        
                        <p>10:10 - <tc-webtag:handle coderId="272072" context="algorithm"/>, <tc-webtag:handle coderId="9927526" context="algorithm"/> and <tc-webtag:handle coderId="21971539" context="algorithm"/> have submitted the easy, too.</p>
                        
                        <p>10:10 - the 450 problem seems to be quite simple DP - what is the maximal achieveable lcm when using the powers of first k prime numbers, and having the cost of s.</p>
                        
                        <p>10:13 - <tc-webtag:handle coderId="2058177" context="algorithm"/>, <tc-webtag:handle coderId="7462740" context="algorithm"/> and <tc-webtag:handle coderId="11829284" context="algorithm"/> submit.</p>
                        
                        <p>10:14 - however, determining the maximal required cost might be a little tricky.</p>
                        
                        <p>10:16 - and here goes <tc-webtag:handle coderId="251074" context="algorithm"/>.</p>
                        
                        <p>10:17 - still nobody has opened the hard problem. The spectators are getting anxious to see it.</p>
                        
                        <p>10:21 - <tc-webtag:handle coderId="7485898" context="algorithm"/> didn't use that DP, he is doing "what is the minimal possible sum to get lcm r with n first numbers". The state space is bigger, but it seems like that works, too.</p>
                        
                        <p>10:23 - <tc-webtag:handle coderId="7485898" context="algorithm"/> and <tc-webtag:handle coderId="8547850" context="algorithm"/> have submitted the 450.</p>
                        
                        <p>10:25 - <tc-webtag:handle coderId="8547850" context="algorithm"/> seems to be using the DP I suggested.</p>
                        
                        <p>10:29 - not sure if <tc-webtag:handle coderId="8547850" context="algorithm"/>'s checking the numbers up to 37 is enough. LCM(1,2,..,37)=5342931457063200>10^15, but does that guarantee that no larger numbers will be required?</p>
                        
                        <p>10:31 - <tc-webtag:handle coderId="293874" context="algorithm"/> and <tc-webtag:handle coderId="10428762" context="algorithm"/> submit the 275, <tc-webtag:handle coderId="21971539" context="algorithm"/> resubmits it. Let's read the hard problem.</p>
                        
                        <p>10:35 - <tc-webtag:handle coderId="9927526" context="algorithm"/> and <tc-webtag:handle coderId="8547850" context="algorithm"/> have two problems submitted already.</p>
                        
                        <p>10:35 - <tc-webtag:handle coderId="22653720" context="algorithm"/> provided a testcase that seems to require number 59 in the medium: 2^7 3^3 5^2 7 11 13 17 19 23 29 and 10^15. To quote him: "10^15 / (lcm of that numbers) = 53.xxx, and single number 59 will be enough." So <tc-webtag:handle coderId="8547850" context="algorithm"/>'s (resubmitted) code and <tc-webtag:handle coderId="7485898" context="algorithm"/>'s code are wrong.</p>
                        
                        <p>10:39 - <tc-webtag:handle coderId="251074" context="algorithm"/>, <tc-webtag:handle coderId="15881985" context="algorithm"/> and <tc-webtag:handle coderId="11829284" context="algorithm"/> submit the medium, too.</p>
                        
                        <p>10:39 - the hard seems to be doable today. As <tc-webtag:handle coderId="10481120" context="algorithm"/> has noticed, there're no more than 3^10 reachable boards, and thus one should only accurately do the game analysis.</p>
                        
                        <p>10:46 - <tc-webtag:handle coderId="7462740" context="algorithm"/> submits the medium, too. He's using the primes up to 59, that passes the worst currently known testcase, put probably there are worse ones?</p>
                        
                        <p>10:47 - <tc-webtag:handle coderId="7485898" context="algorithm"/> submits the easy. Now 7 people have the first two, 5 people have only the first, and 4 still lack submissions.</p>
                        
                        <p>10:51 - <tc-webtag:handle coderId="251074" context="algorithm"/> has memoization commented out in his 450. Was that intentional?</p>
                        
                        <p>10:54 - half an hour left. Waiting for the 1000 submissions to pour in. Generally, the round flow seems to be quite standard.</p>
                        
                        <p>10:56 - still no luck for <tc-webtag:handle coderId="22653720" context="algorithm"/> with inventing a tougher testcase in the Arena.</p>
                        
                        <p>10:58 - I believe memoization might not be really necessary here, so <tc-webtag:handle coderId="251074" context="algorithm"/> should be safe.</p>
                        
                        <p>11:02 - finally a testcase seemingly requiring 61 from <tc-webtag:handle coderId="22653720" context="algorithm"/>. Too bad for <tc-webtag:handle coderId="7462740" context="algorithm"/>.</p>
                        
                        <p>11:03 - <tc-webtag:handle coderId="7459080" context="algorithm"/> has noted that "initial LCM of <tc-webtag:handle coderId="251074" context="algorithm"/>'s solution might overflow". Seems so. Will this round end up also having most people with only one problem?</p>
                        
                        <p>11:05 - a 67 testcase exists as well.</p>
                        
                        <p>11:07 - <tc-webtag:handle coderId="22641345" context="algorithm"/> and <tc-webtag:handle coderId="15511417" context="algorithm"/> submit their mediums after about 20 minutes of no submits.</p>
                        
                        <p>11:08 - 11 people have compiled the hard.</p>
                        
                        <p>11:09 - <tc-webtag:handle coderId="2058177" context="algorithm"/> submits the medium.</p>
                        
                        <p>11:11 - and even the 14-th placed <tc-webtag:handle coderId="21971539" context="algorithm"/> could become first if he submits the 1000. Pretty close race.</p>
                        
                        <p>11:14 - finally a submission from <tc-webtag:handle coderId="8433628" context="algorithm"/>.</p>
                        
                        <p>11:14 - all the coders trying to do the 1000 might make it difficult for them to challenge 450s, and challenging 450s might turn out to be a better strategy here.</p>
                        
                        <p>11:16 - <tc-webtag:handle coderId="251074" context="algorithm"/> and <tc-webtag:handle coderId="21971539" context="algorithm"/> submit the hard, and gain the top two spots. <tc-webtag:handle coderId="251074" context="algorithm"/> will even remain first without his 450.</p>
                        
                        <p>11:16 - and he gets a chance to find his bug and resubmit now.</p>
                        
                        <p>11:17 - finally a submission from yava, no more zero scores.</p>
                        
                        <p>11:22 - any last-second drastic changes adrift?..</p>
                        
                        <p>11:22 - as <tc-webtag:handle coderId="8357090" context="algorithm"/> has noticed, <tc-webtag:handle coderId="272072" context="algorithm"/>'s chances on advancing to the wildcard with his score of 260 on the easy are quite good.</p>
                        
                        <p>11:24 - <tc-webtag:handle coderId="8547850" context="algorithm"/> submits the hard to regain second place.</p>
                        
                        <p>11:25 - <tc-webtag:handle coderId="7485898" context="algorithm"/> resubmits the medium, but changes the limit from 50 to 40. Wrong way.</p>
                        
                        <p>11:25 - the coding is over.</p>
                        
                        <p>11:29 - <tc-webtag:handle coderId="21971539" context="algorithm"/> still didn't open the medium. Is he planning not to challenge it?</p>
                        
                        <p>11:29 - challenge phase starts!</p>
                        
                        <p>11:30 - <tc-webtag:handle coderId="15881985" context="algorithm"/>'s 450 is down, as is <tc-webtag:handle coderId="8547850" context="algorithm"/>'s 1000. <tc-webtag:handle coderId="11829284" context="algorithm"/>'s 450 is down, too.</p>
                        
                        <p>11:30 - <tc-webtag:handle coderId="7485898" context="algorithm"/>'s 450 is down. The two remaining 1000s survived several challenges.</p>
                        
                        <p>11:32 - <tc-webtag:handle coderId="15511417" context="algorithm"/>'s 450 is down.</p>
                        
                        <p>11:33 - <tc-webtag:handle coderId="251074" context="algorithm"/>'s 450 is down. At least that was expected.</p>
                        
                        <p>11:34 - <tc-webtag:handle coderId="8547850" context="algorithm"/>'s 450 is down, too.</p>
                        
                        <p>11:35 - <tc-webtag:handle coderId="20208899" context="algorithm"/>'s 450 is down, too. +150 for <tc-webtag:handle coderId="293874" context="algorithm"/>.</p>
                        
                        <p>11:36 - <tc-webtag:handle coderId="22641345" context="algorithm"/> and <tc-webtag:handle coderId="2058177" context="algorithm"/> lose their mediums, too. Will any 450 stand?</p>
                        
                        <p>11:40 - <tc-webtag:handle coderId="21971539" context="algorithm"/> has challenged <tc-webtag:handle coderId="15881985" context="algorithm"/>'s 250 in the last seconds. I expect some more 250s to fail during the systest. <tc-webtag:handle coderId="21971539" context="algorithm"/> says it was a precision issue.</p>
                        
                        <p>11:44 - the systests are in.</p>
                        
                        <p>11:45 - no passing submits for the bottom 7, ok for 250 for the 9th.</p>
                        
                        <p>11:46 - <tc-webtag:handle coderId="251074" context="algorithm"/> and <tc-webtag:handle coderId="21971539" context="algorithm"/> in the finals, <tc-webtag:handle coderId="7462740" context="algorithm"/>, <tc-webtag:handle coderId="9927526" context="algorithm"/>, <tc-webtag:handle coderId="293874" context="algorithm"/> and <tc-webtag:handle coderId="272072" context="algorithm"/> in the wildcard.</p>
                        <p>11:55 - easy and hard for the finalists, easy and medium for the first two wildcarders, and only easy for 3 more people. Quite good distribution, although there're only 9 positive scores, and 2 of those only because of challenges.</p>
                        <p>11:58 - <tc-webtag:handle coderId="7462740" context="algorithm"/>'s wrong solution wasn't caught by the systests, but that made no difference as he would be in the wildcard anyway.</p>
                        <p> 11:59 - join us today at 4:00 PM PDT at <a href="http://petr.mitrichev.ru/r4.html" target="_blank">petr.mitrichev.ru/r4.html</a> for the live coverage of the wildcard round.</p>
                        <p>12:04 - it turns out that <tc-webtag:handle coderId="11829284" context="algorithm"/>'s and <tc-webtag:handle coderId="15881985" context="algorithm"/>'s 250s (and probably some more) have failed due to floating-point precision issues. Long story short, when finding a zero point of a monotonic function by binary search, and when that function is zero on a whole segment, one should use EPS to find the rightmost zero (as was required in this problem). Doing binary search without any EPS will yield you to some zero point, but not the rightmost one.</p>

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