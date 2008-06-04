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
                        <h1><span>An interview with myself - 06.29.07 8:00 PM EDT</span></h1>
                        
                        <div style="float:right;">
                            <tc-webtag:forumLink forumID="516303" message="Discuss" />
                        </div>
                    
                        <img src="/i/m/polgara_big2.jpg" alt="" width="55" height="61" border="0" hspace="6" vspace="1" align="left" class="myStatsPhoto"/><br />
                        By&#160;<tc-webtag:handle coderId="153650" context="algorithm"/><br />
                        <span class="smallText"><em>TopCoder Member</em></span>
                        <br clear="all" />
                        
                        <br>
                        <p>Sarah: I&rsquo;m here in the arena with polgara who is our resident side-line reporter for the TCO webcast. Tell me polgara, what&rsquo;s the best part of your job?</p>
                        <p><tc-webtag:handle coderId="153650"/>: Hearing voices in my head. I wear an earpiece through the entire webcast that allows me to listen in on to Jeremy, Ken and John and make sure that they are not making fun of me behind my back (literally and figuratively)</p>
                        <p>Sarah: In retrospect, what would have you done differently?</p>
                        <p><tc-webtag:handle coderId="153650"/>: Ensure that there was time to interview Jessica Williams about the Studio competition. As one of the two new competitions, it would have been great to have learned some more about the competitions &ndash; what they did wrong, and all of the many things that they did right.</p>
                        <p>Sarah: Did you get taller or did the <tc-webtag:handle coderId="7267401"/> get shorter?</p>
                        <p><tc-webtag:handle coderId="153650"/>: We made a strategic decision that I would interview <tc-webtag:handle coderId="7267401"/> <em>sitting down</em> this time, to avoid the Abbott and Costello like appearance at the TCCC 06 webcast.</p>
                        <p>Sarah: We saw you on-screen talking about the ball (<a href="http://www.theball.com" target="_blank">www.theball.com</a>). Tell us some more about that.</p>
                        <p><tc-webtag:handle coderId="153650"/>: Well the ball is an online scavenger hunt where players hunt on sponsoring websites for clues to find a ball. When a player finds the ball, he or she is given one final puzzle to solve within a specific time limit &ndash; if the player is successful, they win cash prizes.</p>
                        <p>Sarah: And we hear there was a special &ldquo;live&rdquo; version of the Ball at this year&rsquo;s TCO. How did that go?</p>
                        <p><tc-webtag:handle coderId="153650"/>: We tried to follow the same rules of the online game by providing players with a list of questions, the answers to which could be obtained at sponsor booths. Players completing all of their questions correctly moved on to the final round, where they worked in teams to solve a special Ball jigsaw puzzle. Congratulations to Team Poland (<tc-webtag:handle coderId="8355516" context="algorithm"/>, <tc-webtag:handle coderId="10019533" context="algorithm"/>, <tc-webtag:handle coderId="8472826" context="algorithm"/>) and winning the handsome TCO &lsquo;07 Ball Trophy.</p>
                        <p>Sarah: All right, thanks Sarah &ndash; it&rsquo;s back to you Jeremy.</p>
                        <p>&nbsp; </p>
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