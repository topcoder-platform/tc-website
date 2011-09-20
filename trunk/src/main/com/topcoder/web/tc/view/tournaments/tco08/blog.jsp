<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page contentType="text/html;charset=utf-8" %> 
<%@ page import="com.topcoder.web.common.model.EventType" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>The 2008 TopCoder&reg; Open - Get ready for the Ultimate TopCoder Event!</title>
<link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
<link type="text/css" rel="stylesheet" href="/css/tournaments/tco08.css"/>
<link type="text/css" rel="stylesheet" href="/css/coders.css"/>
<script language="JavaScript" type="text/javascript" src="/js/arena.js"></script>
<script language="JavaScript" type="text/javascript" src="/js/arena.js"></script>
<%--
<style type="text/css">
iframe{
 width: 615px;
 height: 750px;
 border: 1px solid #ED1C24;
 background: transparent;
}
</style>
--%>
</head>
<body id="page_sub">

<div id="wrapper">

    <jsp:include page="nav.jsp" >
    <jsp:param name="tabLev1" value="overview"/>
    <jsp:param name="tabLev2" value="onsiteevents"/>
    <jsp:param name="tabLev3" value="blog"/>
    </jsp:include>


        
        
        <h2>The Official Blog of the 2008 TopCoder Open</h2>
        
        <div class="sub_content">
            <p align="right"><tc-webtag:forumLink forumID="517604" message="Discuss this" /></p>
            <%--
            <iframe src="http://tco08blog.aol.com/<c:out value="${param['myframe']}" default="" escapeXml="true"/>" marginheight="0" marginwidth="0"></iframe>
            --%>
            <p align="right"><strong><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco08&amp;d3=blog2">Next Page</a> &gt;</strong></p>
            
            <h3>Wrapping Up</h3>
            <p>Posted May 20th 2008 3:54AM by <tc-webtag:handle coderId="21464956" darkBG="true" /></p>
            <p>The dust has settled, the champions are crowned, and the competitors have scattered back to all 4 corners of the Earth. But there's one more post to make, albeit a little late.</p>
            <p>Although I was initially attracted to TC by the programming contests, to me it's the community which is TC's biggest asset. Members from across the globe, united by their passion for competion and interaction with like-minded people from many countries, cultures and languages. And of course, it's largely due to my involvement in the community that a decidedly average-ranked coder like me ever got to attend the TCO... though seeing it in person only makes me want to return even more, as a competitor.</p>
            <p>It was quite representative of the event that once the outsized cheques were dispersed, TC members quietly settled back down to chat and play games... almost as if this was the main part of the event. Perhaps it was.</p>
            <p align="center"><img src="/i/tournament/tco08/blogPics/image140.jpg" alt="image140.jpg" style="width:275px; height:206px; border:#ffffff 1px solid;" /> <img src="/i/tournament/tco08/blogPics/image141.jpg" alt="image141.jpg" style="width:275px; height:206; border:#ffffff 1px solid;" /></p>
            <p>I thought members who have never been able to attend a tournament would also like to see what happens to the TC arena after the final award is presented. Wth amazing rapidity, the seasoned TC veterans, most likely exhausted from a very long week, make one final push...</p>
            <p align="center"><img src="/i/tournament/tco08/blogPics/image135.jpg" alt="image135.jpg" style="width:500px; height:375px; border:#ffffff 1px solid;" /><br /><br /><img src="/i/tournament/tco08/blogPics/image137.jpg" alt="image137.jpg" style="width:500px; height:375px; border:#ffffff 1px solid;" /><br /><br /><img src="/i/tournament/tco08/blogPics/image139.jpg" alt="image139.jpg" style="width:500px; height:375px; border:#ffffff 1px solid;" /><br /><br /><img src="/i/tournament/tco08/blogPics/image138b.jpg" alt="image138b.jpg" style="width:500px; height:667px; border:#ffffff 1px solid;" /><br /><br /><img src="/i/tournament/tco08/blogPics/image136b.jpg" alt="image136b.jpg" style="width:500px; height:667px; border:#ffffff 1px solid;" /></p>
            <p>I had a peek into the room on Friday. In the midst of piles of stacked chairs and tables, a few TC members could still be found, playing cards, chatting, and of course using the free wi-fi connection!</p>
            <p>But now it's over... bar a few people no doubt still recovering from jet lag. However I'm sure from TC's point of view, it's probably almost time to start organising the next one! You never know, with a lot of hard work and luck, I might see you there!</p>
            <p>Signing off...</p>
            <p><img src="/i/tournament/tco08/blogPics/d000hg.png" alt="d000hg.png" style="width:132px; height:194px; border:#ffffff 1px solid;" /></p>
            <p><tc-webtag:handle coderId="21464956" darkBG="true" /></p>
            <br />
            
            <h3>Post Tournament Analysis</h3>
            <p>Posted May 16th 2008 6:33PM by <strong>Denis Horgan</strong></p>
            <p align="center"><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco08&amp;d3=studio&amp;d4=summary"><img src="/i/tournament/tco08/studio.jpg" alt="studio.jpg" style="width:100px; height:175px; border:#ffffff 1px solid;" /></a> <a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco08&amp;d3=marathon&amp;d4=summary"><img src="/i/tournament/tco08/marathon.jpg" alt="marathon.jpg" style="width:100px; height:175px; border:#ffffff 1px solid;" /></a> <a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco08&amp;d3=algorithm&amp;d4=algoFinals"><img src="/i/tournament/tco08/algo.jpg" alt="algo.jpg" style="width:100px; height:175px; border:#ffffff 1px solid;" /></a> <a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco08&amp;d3=component&amp;d4=desSummary"><img src="/i/tournament/tco08/compDes.jpg" alt="compDes.jpg" style="width:100px; height:175px; border:#ffffff 1px solid;" /></a> <a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco08&amp;d3=component&amp;d4=devSummary"><img src="/i/tournament/tco08/compDev.jpg" alt="compDev.jpg" style="width:100px; height:175px; border:#ffffff 1px solid;" /></a></p>
            <p align="center">Check out the Match Summaries from each of the five TCO final tracks...</p>
            <p align="center"><strong><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco08&amp;d3=studio&amp;d4=summary">oninkxronda is the new Studio Champion!</a></strong></p>
            <p align="center"><strong><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco08&amp;d3=marathon&amp;d4=summary">Psyho is the new Marathon Champion!</a></strong></p>
            <p align="center"><strong><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco08&amp;d3=algorithm&amp;d4=algoFinals">tomek is the new Algorithm Champion!</a></strong></p>
            <p align="center"><strong><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco08&amp;d3=component&amp;d4=desSummary">Pops is the new Component Design Champion!</a></strong></p>
            <p align="center"><strong><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco08&amp;d3=component&amp;d4=devSummary">romanoTC is the new Component Development Champion!</a></strong></p>
            <p align="center"><strong><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco08&amp;d3=movies">ALL TCO '08 VIDEO REPORTS</a></strong></p>
            <br />
            
            <h3>Play with the TCO App!!</h3>
            <p>Posted May 15th 2008 11:59PM by <strong>Denis Horgan</strong></p>
            <p>For the first time, the Studio, Component Design and Component Development all worked together at the TCO to design and develop a working application at the end of the three days. Now it's available for you to play with, so have fun with <a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco08&amp;d3=distance">"TopCoder Distance"</a>.</p>
            <p>(I'd write a whole thing here explaining what it is and how it works, but to be honest, I'm just too tired :) , but we'll be putting this up on the member home page when we get home from Vegas - Thank you, and hope you enjoyed the TCO Blog coverage!)</p>
            <p>Feel free to discuss the app in the <tc-webtag:forumLink forumID="244237" message="forums" />.</p>
            <br />
            
            <h3>TC Channel: Wrapping up the 2008 TCO</h3>
            <p>Posted May 15th 2008 9:50PM by <strong>Denis Horgan</strong></p>
            <div align="center"><embed width="320" hspace="7" height="280" allowscriptaccess="always" wmode="transparent" type="application/x-shockwave-flash" src="http://www.topcoder.com/flash/media/video_4x3.swf?app=tcchannel&amp;clip=tco08_25"></embed></div>
            <br /><br />
            
            <h3>TC Channel: And the Algorithm champion is...</h3>
            <p>Posted May 15th 2008 8:12PM by <strong>Denis Horgan</strong></p>
            <div align="center"><embed width="320" hspace="7" height="280" allowscriptaccess="always" wmode="transparent" type="application/x-shockwave-flash" src="http://www.topcoder.com/flash/media/video_4x3.swf?app=tcchannel&amp;clip=tco08_24"></embed></div>
            <br /><br />
            
            <h3>TCO Algorithm final: play-by-play</h3>
            <p>Posted May 15th 2008 4:18PM by <tc-webtag:handle coderId="21464956" darkBG="true" /></p>
            <p>The final was probably the most exciting match... results are announced in just about an hour but it's hard to call between <tc-webtag:handle coderId="10574855" darkBG="true" />, <tc-webtag:handle coderId="8355516" darkBG="true" /> and <tc-webtag:handle coderId="144400" darkBG="true" />. If you missed the match, you can find my real-time report on it in the forms <a href="http://<%=ApplicationServer.FORUMS_SERVER_NAME%>/?module=Thread&amp;threadID=613611&amp;start=0">here</a></p>
            <br />
            
            <h3>Studio Round 2 &amp; 3 Recap</h3>
            <p>Posted May 15th 2008 3:06PM by <tc-webtag:handle coderId="22656806" darkBG="true" /></p>
            <p>The last two rounds of Studio were amazing. The competitors were given the challenge for Round Two just before they started and everyone was quickly making notes, highlighting important areas of the Spec and just generally preparing for the rapid 2-hour round. The finalists were tasked with designing a splash screen for Lending Tree. Only 15 minutes into the round, concepts were flying onto the screens. We had some account problems with istockphoto, so we made a quick decision to allow the competitors to submit either comp images or downloaded artwork. This round was definitely more hectic for both the finalists and the admins. After the round ended, everyone took a quick break and then we had a brief overview before Round Three.</p>
            <p>Round Three was our sponsor raffle project for Lilly. The finalists had some time before competition day to speak with Lilly about their company and the goals for this design. About half-way through the round, you could see a swarm of yellow shirts (the Lilly folks) gathered around the kiosks chatting about the stock art choices and the branding treatments. It was very rewarding to see them so excited about the results.</p>
            <p>I had to smile when I saw some of the guys were chatting with each other in the finalist forums just before the round ended. They planned to go play poker, and I hope luck was with them. The submissions are up on the Studio site for all three rounds, <a target="_blank" href="http://<%=ApplicationServer.STUDIO_SERVER_NAME%>/?module=ViewPastContests">so be sure to check them out</a>!</p>
            <p>It's been a very exciting tournament for Studio and I can't wait for next year.</p>
            <p><strong>Here are the winning placements for each round:</strong></p>
            <ul>
                <li><a target="_blank" href="http://<%=ApplicationServer.STUDIO_SERVER_NAME%>/?module=ViewContestResults&amp;ct=2232">Round One Placements - 50% of total score</a></li>
                <li><a target="_blank" href="http://<%=ApplicationServer.STUDIO_SERVER_NAME%>/?module=ViewContestResults&amp;ct=2236">Round Two Placements - 25% of total score</a></li>
                <li><a target="_blank" href="http://<%=ApplicationServer.STUDIO_SERVER_NAME%>/?module=ViewContestResults&amp;ct=2235">Round Three Placements - 25% of total score</a></li>
            </ul>
            <p><strong>And here are the final placements for each designer:</strong></p>
            <ul>
                <li>Champion: <tc-webtag:handle coderId="22418135" darkBG="true" /></li>
                <li>2nd Place: <tc-webtag:handle coderId="22682305" darkBG="true" /></li>
                <li>3rd Place: <tc-webtag:handle coderId="22076237" darkBG="true" /></li>
                <li>4th Place: <tc-webtag:handle coderId="22689218" darkBG="true" /></li>
                <li>5th Place: <tc-webtag:handle coderId="22673857" darkBG="true" /></li>
                <li>6th Place: <tc-webtag:handle coderId="22690288" darkBG="true" /></li>
                <li>7th Place: <tc-webtag:handle coderId="22673573" darkBG="true" /></li>
                <li>8th Place: <tc-webtag:handle coderId="13298470" darkBG="true" /></li>
                <li>9th Place: <tc-webtag:handle coderId="22673098" darkBG="true" /></li>
                <li>10th Place: <tc-webtag:handle coderId="22666646" darkBG="true" /></li>
                <li>11th Place: <tc-webtag:handle coderId="22658469" darkBG="true" /></li>
                <li>12th Place: <tc-webtag:handle coderId="15006955" darkBG="true" /></li>
            </ul>
            <br /><br />
            
            <h3>TC Channel: End of Challenge Phase</h3>
            <p>Posted May 15th 2008 2:56PM by <strong>Denis Horgan</strong></p>
            <div align="center"><embed width="320" hspace="7" height="280" src="http://www.topcoder.com/flash/media/video_4x3.swf?app=tcchannel&amp;clip=tco08_23" type="application/x-shockwave-flash" wmode="transparent" allowscriptaccess="always"></embed></div>
            <br /><br />
            
            <h3>TC Channel: End of Coding Phase</h3>
            <p>Posted May 15th 2008 2:53PM by <strong>Denis Horgan</strong></p>
            <div align="center"><embed width="320" hspace="7" height="280" src="http://www.topcoder.com/flash/media/video_4x3.swf?app=tcchannel&amp;clip=tco08_22" type="application/x-shockwave-flash" wmode="transparent" allowscriptaccess="always"></embed></div>
            <br /><br />
            
            <h3>TC Channel: Here we Go</h3>
            <p>Posted May 15th 2008 1:21PM by <strong>Denis Horgan</strong></p>
            <div align="center"><embed width="320" hspace="7" height="280" src="http://www.topcoder.com/flash/media/video_4x3.swf?app=tcchannel&amp;clip=tco08_21" type="application/x-shockwave-flash" wmode="transparent" allowscriptaccess="always"></embed></div>
            <br /><br />
            
            <h3>Meet the Algo Finalists</h3>
            <p>Posted May 15th 2008 1:20PM by <strong>Denis Horgan</strong></p>
            <div align="center"><embed width="320" hspace="7" height="280" src="http://www.topcoder.com/flash/media/video_4x3.swf?app=tcchannel&amp;clip=tco08_20" type="application/x-shockwave-flash" wmode="transparent" allowscriptaccess="always"></embed></div>
            <br /><br />
            
            <h3>Wednesday Night - Fun and Games</h3>
            <p>Posted May 15th 2008 12:27PM by <tc-webtag:handle coderId="21464956" darkBG="true" /></p>
            <p>I think the other guys have given pretty good coverage on the development and studio contests, so I'm free to concentrate on other things. The main event of the day had to be the Poker tournament, which kicked off shortly after dinner. The prize: a pretty nice set of poker chips, made much nicer since they were exclusively TC branded. Second and third places would also tke prizes in the form of TC "goody bags".</p>
            <p align="center"><img src="/i/tournament/tco08/blogPics/image120.jpg" alt="image120.jpg" style="width:400px; height:300px; border:#ffffff 1px solid;" /><br /><em>Tables set up in preparation</em></p>
            <p>The tournament began around 7pm, with over 60 players (I think there were 7 tables of 8 and one of 9). The game was no limit Texas Holdem, as might be predicted since this is the most popular form of poker in the wold right now.</p>
            <p>I took part as an enthusiastic amateur, on a tale including <tc-webtag:handle coderId="251074" darkBG="true" /> and <tc-webtag:handle coderId="263396" darkBG="true" />. Unfortunately, I hadn't done my research and failed to realise <tc-webtag:handle coderId="263396" darkBG="true" /> is a seasoned player. I went out after about 40 minutes when I tried to take him on... I was glad at least to see him on the final table.</p>
            <p align="center"><img src="/i/tournament/tco08/blogPics/image122.jpg" alt="image122.jpg" style="width:400px; height:300px; border:#ffffff 1px solid;" /><br /><em>The final table, shortly after <tc-webtag:handle coderId="119676" darkBG="true" /> was knocked out.</em></p>
            <p>The final table was exciting to watch. We had something like 10 all-in rounds in a row at one point. <tc-webtag:handle coderId="10481120" darkBG="true" /> emerged as the star player, the guy just couldn't lose. He'd bet all-in nd people would fold, or they'd call and the community cards would invariably favor him. <tc-webtag:handle coderId="119676" darkBG="true" /> was dealt a pair of kings, but the last card gave <tc-webtag:handle coderId="10481120" darkBG="true" /> a pair of aces... that was just one example of many.</p>
            <p align="center"><img src="/i/tournament/tco08/blogPics/image125.jpg" alt="image125.jpg" style="width:400px; height:300px; border:#ffffff 1px solid;" /><br /><em>The crowd in disbelief as <tc-webtag:handle coderId="10481120" darkBG="true" /> gets another great hand from nowhere.</em></p>
            <p>The final 3 were <tc-webtag:handle coderId="263396" darkBG="true" />, <tc-webtag:handle coderId="10481120" darkBG="true" />, and <tc-webtag:handle coderId="261024" darkBG="true" />'s girlfriend (who I think was the only lady taking part)</p>
            <p align="center"><img src="/i/tournament/tco08/blogPics/image123.jpg" alt="image123.jpg" style="width:400px; height:300px; border:#ffffff 1px solid;" /><br /><em><tc-webtag:handle coderId="263396" darkBG="true" /> tries to take on <tc-webtag:handle coderId="10481120" darkBG="true" />... but the cards just weren't with him</em></p>
            <p><tc-webtag:handle coderId="263396" darkBG="true" /> went out first, leaving <tc-webtag:handle coderId="10481120" darkBG="true" /> with about a million chips, and <tc-webtag:handle coderId="261024" darkBG="true" />'s girlfriend with about 7! She was really great, binging the table to life for a few minutes in spite of overwhelming odds. However, she was eventually knocked out.</p>
            <p align="center"><img src="/i/tournament/tco08/blogPics/image126.jpg" alt="image126.jpg" style="width:400px; height:300px; border:#ffffff 1px solid;" /><br /><em>The worthy winner...</em></p>
            <p>However then there was another twist... it turns out <tc-webtag:handle coderId="10481120" darkBG="true" /> works for TC and is ineligible for the prize... which then goes to the 2nd place!</p>
            <p align="center"><img src="/i/tournament/tco08/blogPics/image130.jpg" alt="image130.jpg" style="width:400px; height:300px; border:#ffffff 1px solid;" /><br /><em>The official and unofficial winners!</em></p>
            <br />
            
            <h3>TC Channel: Preparing for the Finals</h3>
            <p>Posted May 15th 2008 12:30AM by <strong>Denis Horgan</strong></p>
            <div align="center"><embed width="320" hspace="7" height="280" src="http://www.topcoder.com/flash/media/video_4x3.swf?app=tcchannel&amp;clip=tco08_19" type="application/x-shockwave-flash" wmode="transparent" allowscriptaccess="always"></embed></div>
            <br />
            <p>Sarah speaks with <tc-webtag:handle coderId="282560" darkBG="true" /> on the eve of the Algo Finals.</p>
            <br />
            
            <h3>Wednesday night...</h3>
            <p>Posted May 14th 2008 11:04PM by <tc-webtag:handle coderId="282560" darkBG="true" /></p>
            <p>..and we just finished the dress rehearsal for the final event. We're still waiting on Component Development scores, but the rest is in the can. Good luck to the Algo competitors tomorrow, and I hope everyone enjoys the Final Awards ceremony!</p>
            <br />
            
            <h3>TC Channel: Component Dev Finals are Over</h3>
            <p>Posted May 14th 2008 10:55PM by <strong>Denis Horgan</strong></p>
            <div align="center"><embed width="320" hspace="7" height="280" src="http://www.topcoder.com/flash/media/video_4x3.swf?app=tcchannel&amp;clip=tco08_17" type="application/x-shockwave-flash" wmode="transparent" allowscriptaccess="always"></embed></div>
            <br />
            <p>Sarah speaks with <tc-webtag:handle coderId="156859" darkBG="true" /> about the Component Development finals.</p>
            <br />
            
            <br />
            <p align="right"><strong><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco08&amp;d3=blog2">Next Page</a> &gt;</strong></p>
        
        </div><%-- .sub_content --%>
        
    </div><%-- #content --%>

<jsp:include page="footer.jsp" />

</div><%-- #wrapper --%>

</body>
</html>
