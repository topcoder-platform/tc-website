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
                        <h1><span>Algorithm Finals: Jan_Kuipers wins! - 06.29.07 6:30 PM EDT</span></h1>
                    
                        <div style="float:right;">
                            <tc-webtag:forumLink forumID="516303" message="Discuss" />
                        </div>

                        <img src="/i/m/Petr_big.jpg" alt="" width="55" height="61" border="0" hspace="6" vspace="1" align="left" class="myStatsPhoto"/><br />
                        By&#160;<tc-webtag:handle coderId="10574855" context="algorithm"/><br />
                        <span class="smallText"><em>TopCoder Member</em></span>
                        <br clear="all" />
                        
                        <br>
                    
                        <p>4:07 - 23 minutes before the round starts.</p>

                        <p>4:08 - <tc-webtag:handle coderId="21822659" context="algorithm"/> has already completed his setup and is walking around nervously. There's an interesting story about his participation in this TCO - it turns out that he is at the military training camp this month, and had to request an officer approval to get here.</p>
                        
                        <p>4:10 - speaking of the odds... Well, <tc-webtag:handle coderId="251074" context="algorithm"/> is the person performing best lately.</p>
                        
                        <p>4:11 - and no, I don't watch the webcast, so I can be a little out of discussion today.</p>
                        
                        <p>4:12 - 1 african, 1 asian and 6 europeans today.</p>
                        
                        <p>4:15 - speaking of the component competition, if anyone is interested, <tc-webtag:handle coderId="152342" context="design"/> has won the third component as well in the design. A last-minute change brought hefeng to the first place in development, so he's probably going to win given he was first in two components.</p>
                        
                        <p>4:16 - as we have only 8 participants today, probably it's not so bad an idea to introduce them.</p>
                        
                        <p>4:17 - <tc-webtag:handle coderId="309453" context="algorithm"/> from the Netherlands. He's studying at Utrecht University, and is an experienced TopCoder with 129 matches. He's not at his maximum rating now, but he's at a big rise.</p>
                        
                        <p>4:19 - <tc-webtag:handle coderId="8355516" context="algorithm"/> from Poland. I believe he's a PhD student at Warsaw University. The champion of TCO 05. He has the longest hair of all the finalists.</p>
                        
                        <p>4:21 - <tc-webtag:handle coderId="21822659" context="algorithm"/> from Russia. See my '<a href="http://www.topcoder.com/tc?module=Static&d1=features&d2=061807">Meet Team Russia</a>' article.</p>
                        
                        <p>4:22 - <tc-webtag:handle coderId="14886245" context="algorithm"/> from Poland. He's a highschooler, and has attended the TCHS tournament, scoring highest in the final round (but not winning the tournament).</p>
                        
                        <p>4:23 - <tc-webtag:handle coderId="251074" context="algorithm"/> from South Africa. The "Awards" section of his <a href="http://people.cs.uct.ac.za/~bmerry/cv.pdf">resume</a> is awesome.</p>
                        
                        <p>4:24 - <tc-webtag:handle coderId="21971539" context="algorithm"/> from Russia. See my 'meet team Russia' article.</p>
                        
                        <p>4:25 - <tc-webtag:handle coderId="7446789" context="algorithm"/> from Korea. He's by far at the best point of his career now.</p>
                        
                        <p>4:26 - and <tc-webtag:handle coderId="144400" context="algorithm"/>.</p>
                        
                        <p>4:27 - the competitors have been introduced to the public and are invited onstage.</p>
                        
                        <p>4:28 - will we be able to watch the contest in the Arena?.. It seems no.</p>
                        
                        <p>4:31 - the contest has started, and has appeared in the Arena. All 8 competitors start with the easy problem.</p>
                        
                        <p>4:32 - the problem seems to be very straightforward - one should always own the shares that rise the fastest.</p>
                        
                        <p>4:34 - <tc-webtag:handle coderId="269554" context="algorithm"/>
                        , the tester of the round, says the two other problems are "one hard and one super hard imho".</p>
                        
                        <p>4:37 - probably the easy is not that easy. Calculating the point where the 'optimal' share changes is not that easy. Some binary search is needed. Or some equation.</p>
                        
                        <p>4:40 - <tc-webtag:handle coderId="309453" context="algorithm"/> and <tc-webtag:handle coderId="7446789" context="algorithm"/> submit the easy. <tc-webtag:handle coderId="309453" context="algorithm"/> only switches at the slope change points, and <tc-webtag:handle coderId="7446789" context="algorithm"/> only at the integer time points. Is that OK?</p>
                        
                        <p>4:43 - I think I can prove that switching only at slope changes is OK. The points where the change would be profitable are found by solving f'(x)/f(x)=g'(x)/g(x), where f(x) and g(x) are the share price functions. We get b/(a+bx)=d/(c+dx), or bc+bdx=ad+bdx, or bc=ad - that doesn't depend on x.</p>
                        
                        <p>4:45 - <tc-webtag:handle coderId="144400" context="algorithm"/>, <tc-webtag:handle coderId="251074" context="algorithm"/> and <tc-webtag:handle coderId="14886245" context="algorithm"/> have submitted the easy.</p>
                        
                        <p>4:48 - <tc-webtag:handle coderId="309453" context="algorithm"/> went for the hard, all others opened the medium.</p>
                        
                        <p>4:51 - <tc-webtag:handle coderId="21971539" context="algorithm"/> submits the easy.</p>
                        
                        <p>4:52 - and so does <tc-webtag:handle coderId="8355516" context="algorithm"/>. <tc-webtag:handle coderId="21971539" context="algorithm"/> went for the hard.</p>
                        
                        <p>4:55 - <tc-webtag:handle coderId="21822659" context="algorithm"/> submits the easy, too. There'll probably be a long gap before the next submit.</p>
                        
                        <p>5:02 - about the medium problem solution: first, suppose we are only allowed to leave the raft once. Then, we should iterate over all possible orderings of visited sites, and then for each ordering to find the best point to leave the raft. To do that, we can apply binary search: in the optimal solution, the angles at which we leave and return to the river should be equal (this is proved similar to the laws of light traveling), so we binary search over the function 'leaving angle minus returning angle').</p>
                        
                        <p>5:05 - and it seems like we can then do a DP on the subset of the sites visited. This seems to be not obviously correct because the periods when we are off the raft might overlap, however, I have a feeling that in that cases we can obtain an even better solution by not returning to the raft in between.</p>
                        <p>5:02 - about the medium problem solution: first, suppose we are only allowed to leave the raft once. Then, we should iterate over all possible orderings of visited sites, and then for each ordering to find the best point to leave the raft. To do that, we can apply binary search: in the optimal solution, the angles at which we leave and return to the river should be equal (this is proved similar to the laws of light traveling), so we binary search over the function 'leaving angle minus returning angle').</p>
                        <p>5:05 - and it seems like we can then do a DP on the subset of the sites visited. This seems to be not obviously correct because the periods when we are off the raft might overlap, however, I have a feeling that in that cases we can obtain an even better solution by not returning to the raft in between.</p>
                        <p>5:16 - sorry for not updating frequently, I'm trying to think about the problems. Meanwhile, we have 3 compiles on the medium and 2 on the hard.</p>
                        <p>5:18 - <tc-webtag:handle coderId="21971539" context="algorithm"/> seems to know some idea for the hard, at least his solution seems quite conscious.</p>
                        <p>5:20 - and he does submit!</p>
                        <p>5:22 - <tc-webtag:handle coderId="21971539" context="algorithm"/> has tested his solution thoroughly, and it works lightning fast. He seems to be sure in his solution. Can we understand it? Meanwhile, he moves to the medium.</p>
                        <p>5:29 - sorry, TV duties.</p>
                        <p>5:29 - <tc-webtag:handle coderId="144400" context="algorithm"/> submits the medium! Let's read it.</p>
                        <p>5:33 - he seems to iterate over all possible scenarios of the form 'go there, then there, then return to the raft, then there, ..." That's logical. However, can he evaluate each scenario correctly? It seems that he does independent binary search for different trips off the raft, just as we have suggested. This solution may well pass.</p>
                        <p>5:37 - his lastPos variable probably indicates that the segments were treated as dependent earlier, but later he decided to drop that as the value assigned to lastPos is never used.</p>
                        <p>5:41 - in fact, I'm pretty sure about <tc-webtag:handle coderId="21971539" context="algorithm"/>'s solution, as the maxtest is fairly obvious, and its runs in time, and as for the correctness, he has seemingly tested it to find all the strings of small length, so that should be ok, too. And also, there's no point in switching to the medium in such situation if you're not absolutely sure.</p>
                        <p>5:43 - as for how his solution works, the idea is: once we have fixed the first half (or more) of the string, it becomes easy to count the number of appropriate second halves: we just check that it doesn't end with each prefix of length &lt;=n/2, i.e., subtract some powers of two from some power of two. Then, we iterate over the possible first halves, and when we found the required first half, we start increasing it by one character until we get the full string.</p>
                        <p>5:48 - actually, n=50 might not be the worst case as the first half will consist of almost all zeroes. Let's hope he tested it for several different n's and k=2 billion.</p>
                        <p>5:51 - <tc-webtag:handle coderId="251074" context="algorithm"/> submits the medium.	</p>
                        <p>5:51 - I expect <tc-webtag:handle coderId="21971539" context="algorithm"/>'s solution to be tested quite a lot during the challenge phase, however, it may not be challenged with the 'proper' worst cases.</p>
                        <p>5:54 - <tc-webtag:handle coderId="8357090" context="algorithm"/> predicts <tc-webtag:handle coderId="144400" context="algorithm"/> getting second place with only the easy and a challenge on <tc-webtag:handle coderId="251074" context="algorithm"/>'s 500.</p>
                        <p>5:55 - the coding is over. There's not much to be seen in the challenge phase, but that's still very important.</p>
                        <p>5:59 - in fact, I expect very fast challenges on the 500.</p>
                        <p>6:04 - -25 for <tc-webtag:handle coderId="144400" context="algorithm"/> on <tc-webtag:handle coderId="21971539" context="algorithm"/>'s 1000. <tc-webtag:handle coderId="251074" context="algorithm"/> reads <tc-webtag:handle coderId="144400" context="algorithm"/>'s 500, <tc-webtag:handle coderId="309453" context="algorithm"/> decided to walk away.</p>
                        <p>6:07 - and <tc-webtag:handle coderId="21822659" context="algorithm"/> kills <tc-webtag:handle coderId="21971539" context="algorithm"/>'s 1000. Too bad.</p>
                        <p>6:08 - <tc-webtag:handle coderId="8355516" context="algorithm"/> kills <tc-webtag:handle coderId="251074" context="algorithm"/>'s 500. <tc-webtag:handle coderId="309453" context="algorithm"/>' chances are increasing.</p>
                        <p>6:11 - <tc-webtag:handle coderId="21971539" context="algorithm"/>'s solution failed with WA, not TL. Some bug.</p>
                        <p>6:22 - <tc-webtag:handle coderId="21971539" context="algorithm"/>'s solution doesn't work for n=7. Meanwhile, they have announced the results of the Studio competition - <tc-webtag:handle coderId="10481546"/> won - so probably there's not much wait left.</p>
                        <p>6:25 - Marathon matches: <tc-webtag:handle coderId="10600282" context="marathon"/>, <tc-webtag:handle coderId="9987185" context="marathon"/>, <tc-webtag:handle coderId="261024" context="marathon"/>, <tc-webtag:handle coderId="7459326" context="marathon"/>.</p>
                        <p>6:26 - Development: <tc-webtag:handle coderId="15214882" context="development"/>, <tc-webtag:handle coderId="9998760" context="development"/>, <tc-webtag:handle coderId="7210680" context="development"/>.</p>
                        <p>6:28 - Design: <tc-webtag:handle coderId="152342" context="design"/>, <tc-webtag:handle coderId="22651514" context="design"/>, <tc-webtag:handle coderId="10028010" context="design"/>, <tc-webtag:handle coderId="275640" context="design"/>.</p>
                        <p>6:30 - Algorithm: all the easys stand, <tc-webtag:handle coderId="144400" context="algorithm"/>'s medium fails. <tc-webtag:handle coderId="309453" context="algorithm"/>!!! Go Netherlands :) again :)</p>
                        <p>6:45 - <tc-webtag:handle coderId="21971539" context="algorithm"/>'s bug seems to be: "int wwend = ww &amp; ((1 &lt;&lt; (pref - p)) - 1);" should be "int wwend = ww &amp; ((1 &lt;&lt; p) - 1);".</p>
                        <p>6:57 - after fixing that bug, the solution passed systests in the practice room.</p>
                        <p>7:10 - and <tc-webtag:handle coderId="144400" context="algorithm"/>'s solution for the 500 passes after uncommenting the line "if(chosenPoints[p].x - exd1 &lt; lastPos) return 1e100;"</p>
                        <p>7:11 - that was a lucky day for <tc-webtag:handle coderId="309453" context="algorithm"/>.</p>

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