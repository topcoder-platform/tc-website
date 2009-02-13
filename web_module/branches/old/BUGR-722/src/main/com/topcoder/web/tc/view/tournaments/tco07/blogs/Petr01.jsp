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
                        <h1><span>Welcome to night #1 - 06.27.07 1:30 AM EDT</span></h1>
                    
                        <div style="float:right;">
                            <tc-webtag:forumLink forumID="516303" message="Discuss" />
                        </div>

                        <img src="/i/m/Petr_big.jpg" alt="" width="55" height="61" border="0" hspace="6" vspace="1" align="left" class="myStatsPhoto"/><br />
                        By&#160;<tc-webtag:handle coderId="10574855" context="algorithm"/><br />
                        <span class="smallText"><em>TopCoder Member</em></span>
                        <br clear="all" />
                        
                        <br>
                    
                        <p>Here comes the first Las Vegas TCO evening, brought to you by AOL :)
                        While some of the competitors still took their time to enjoy viewing the
                        surrounding landmarks (from the left: <tc-webtag:handle coderId="15881985" context="algorithm"/>, <tc-webtag:handle coderId="19721111" context="algorithm"/>, <tc-webtag:handle coderId="7485898" context="algorithm"/>),</p>
                        
                        <div align="center"><img src="/i/tournament/tco07/blogs/Petr01-01.jpg" width="480px" height="360px" /></div><br />
                        
                        <p>most of the people involved have gathered in the Montego room at 7:00 pm
                        to greet the opening of the 2007 TopCoder Open. I've managed to discuss
                        the contest expectations with several of them.</p>
                        
                        <p><tc-webtag:handle coderId="152342" context="design"/> has given an inside preview of the component competition.
                        Sergey (being a component design finalist himself) outlines <tc-webtag:handle coderId="7210680" context="development"/> as
                        a clear favorite in the component development competition, despite the presence
                        of the TCCC06 champion <tc-webtag:handle coderId="9998760" context="algorithm"/> and 5 other strong contestants. That's a pretty
                        interesting statement, as no European has managed to claim the
                        development prize in a TopCoder event since <tc-webtag:handle coderId="7389864" context="algorithm"/>'s win in the TCCC04,
                        and the last three events were topped by Asians and few expect them
                        to forfeit that tradition.</p>
                        
                        <p>When speaking about the design side, <tc-webtag:handle coderId="152342" context="design"/> admitted that he
                        has put a lot of effort into the finals components (despite having to care about
                        his family: he has arrived at the TCO with his wife and their little daughter). 
                        TCO05 and TCCC06 component design champion <tc-webtag:handle coderId="293874" context="algorithm"/> confirms 
                        that Sergey is on his way for the win. Sergey himself perceives
                        <tc-webtag:handle coderId="22651514" context="design"/> to be his main opponent in the game.</p>
                        
                        <p>Meanwhile, the algorithm rounds carry a lot less
                        determination on the results or even on the final round participants. With
                        the first two semifinal rooms having <tc-webtag:handle coderId="144400" context="algorithm"/> and <tc-webtag:handle coderId="19849563" context="algorithm"/> as (arguably) major
                        favorites, the third room remains totally unchartable. <tc-webtag:handle coderId="272072" context="algorithm"/>, the
                        top seed, has not been performing great lately, and he was beaten for the 
                        4th place in the ratings by his Room 3 competitor <tc-webtag:handle coderId="251074" context="algorithm"/>. Bruce
                        has agreed to unveil his expectations on the Room 3 winner: "me!", he said. The
                        room also features two TCO 06 finalists, <tc-webtag:handle coderId="7462740" context="algorithm"/> and <tc-webtag:handle coderId="11829284" context="algorithm"/>, and
                        they are definitely not going to miss the action.</p>
                        
                        <p>Marathoneer <tc-webtag:handle coderId="261024" context="marathon"/> was quite definite on the most important
                        result of his track: "It'll be fun!", he said, as no one still knows
                        what it really will be like tomorrow. The organizers started to publish
                        some information about it, however, as it was announced today that
                        the tomorrow Marathon Match will take place in the renewed Competition Arena.
                        Studio competitors were also not left clueless:
                        they will be redesigning the <a href="http://studio.topcoder.com" target="_blank">studio.topcoder.com</a> website on Thursday.</p>
                        
                        <p>Join us tomorrow in the Competition Arena for the Marathon and Algorithm battles,
                        as well as the Component Design and Development appeals start!</p>

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