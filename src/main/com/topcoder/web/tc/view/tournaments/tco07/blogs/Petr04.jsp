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
                        <h1><span>A look at the Component Design finals - 06.28.07 2:00 AM EDT</span></h1>
                    
                        <div style="float:right;">
                            <tc-webtag:forumLink forumID="516303" message="Discuss" />
                        </div>

                        <img src="/i/m/Petr_big.jpg" alt="" width="55" height="61" border="0" hspace="6" vspace="1" align="left" class="myStatsPhoto"/><br />
                        By&#160;<tc-webtag:handle coderId="10574855" context="algorithm"/><br />
                        <span class="smallText"><em>TopCoder Member</em></span>
                        <br clear="all" />
                        
                        <br>
                    
                        <p>Wednesday was also the appeal day for the first component in Software
                        Design and Development. I will focus on the design competition, as I've managed
                        to get some amusing information about it from <tc-webtag:handle coderId="287614" context="design"/>.</p>
                        
                        <p>The component that the designers were battling around today was <a href="http://forums.topcoder.com/?module=Category&categoryID=2252">File Delivery</a>,
                        which was a particularly big and difficult one. The competitors were given little
                        time (an hour and a half) to appeal their scoreboards, and it was surprising
                        for me to meet <tc-webtag:handle coderId="287614" context="design"/> walking around and doing nothing. Why didn't
                        he join the contest?</p>
                        
                        <p>The answer is that Michael didn't even submit this component! As the wagers
                        make it possible for one component to constitute only a tenth of the final score,
                        he has chosen not to spend his time and energy on this tedious component.
                        He was easily notable on the scoreboard because of his unique zero score, however,
                        four other contestants followed in his steps by submitting incomplete
                        designs and scoring between 50 and 60.</p>
                        
                        <p>The only three who really fought for the
                        win today were <tc-webtag:handle coderId="10028010" context="design"/>, <tc-webtag:handle coderId="152342" context="design"/> and <tc-webtag:handle coderId="275640" context="design"/> (listed in the
                        order of decreasing score before appeals). Before the 
                        start of the appeals, they were all within a couple of points, so anything
                        could happen. And a big change didn't time out, as <tc-webtag:handle coderId="152342" context="design"/> has overtaken
                        <tc-webtag:handle coderId="10028010" context="design"/> for the win by finally appealing his first mark from <tc-webtag:handle coderId="10348862" context="design"/>
                        from 3 to 4 (they've agreed that added authorization is a good enhancement).</p>
                        
                        <p><tc-webtag:handle coderId="287614" context="design"/> has confirmed that not trying to be the best in all three
                        components is a common practice for this TCO. With the components being really
                        tough, and the ongoing DR and development support duties added to them,
                        it was hard to keep up.</p>                              
                        
                        <br />
                        
                        <p>As we see, the competitors in three out of four tracks were thrown into
                        the action today. To give them a chance to relax, TopCoder has booked
                        the entire "Spain" seat block at the <a href="http://www.excalibur.com/entertainment/tournament_of_kings.aspx" target="_blank">Tournament of Kings</a> show in the Excalibur.
                        The show itself might or might not be enjoyable for the contestants, but
                        still the idea of changing the atmosphere was very good.</p>
                        
                        <p>The competitions continue tomorrow, as the algorithmists get to compete
                        in the third semifinal (see live text coverage at <a href="http://petr.mitrichev.ru/r3.html" target="_blank">petr.mitrichev.ru/r3.html</a>
                        tomorrow) and in the wildcard round, the component designers and developers
                        appeal their second component, and the Studio contestants start their fight. 
                        Such a tough schedule will be again smoothed by an evening performance,
                        the <a href="http://www.venetian.com/BMG.aspx" target="_blank">Blue Man Group</a> at the Venetian. Good night!</p>

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