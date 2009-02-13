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
                        <h1><span>Groups of blue men  - 06.29.07 11:45 AM EDT</span></h1>
                        
                        <div style="float:right;">
                            <tc-webtag:forumLink forumID="516303" message="Discuss" />
                        </div>
                    
                        <img src="/i/m/jmzero_big.jpg" alt="" width="55" height="61" border="0" hspace="6" vspace="1" align="left" class="myStatsPhoto"/><br />
                        By&#160;<tc-webtag:handle coderId="15498334" context="algorithm"/><br />
                        <span class="smallText"><em>TopCoder Member</em></span>
                        <br clear="all" />
                        
                        <br>
                        <p>On Thursday night, <a href="http://dev.aol.com/" target="_blank">AOL</a> treated TopCoders to a meal at the Venetian and a show at the <a href="http://www.blueman.com/" target="_blank">Blue Man Group</a>.  I'm afraid that once again cameras were prohibited, and I'm further afraid that text isn't quite the medium to describe this particular show.  There was lights and tubes and paper and noise.  They banged on things.  The performing men were high in blueness, with a tendancy to stare at things.  This may not sound terribly entertaining - you'll just have to trust me despite the failure of written language here.  The show was a great mix of humor and wonder, and was received enthusiastically by the TopCoder crowd.  Did I mention about the blueness?</p>

                        <div align="center"><img src="/i/tournament/tco07/blogs/jmzero07blue.png"></div><br />
                        
                        <p>I noticed during the show that there doesn't appear to be blue women.  While I'm not an expert in genetics, I suppose their offspring are thus likely to be <a href="http://www.topcoder.com/tc?module=MemberProfile&cr=272072">somewhat-less-blue men</a>.
                        
                        <p>In any case, I've been very impressed throughout the event with the generosity and friendliness of the sponsors who make the event possible.  Since the opening ceremony, sponsor representatives have been busy giving out food and drink, distributing prizes and loot, and running side events.  In particular, I've spent some time chatting with the AOL reps.  They're making great efforts to connect with developers on some of their new projects, and I'd certainly say they came to the right place in terms of meeting promising young programmers.</p>
                        
                        <div align="center"><img src="/i/tournament/tco07/blogs/jmzero07poker.jpg"></div><br />
                        
                        <p><a href="http://www.topcoder.com/tc?module=Static&d1=tournaments&d2=tco07&d3=sponsorspatrons&d4=drw">DRW Trading Group</a> helped organize this year's traditional poker game, and <tc-webtag:handle coderId="15117368" context="algorithm"/> claimed the honor of victory this time out. This is no small feat considering the sheer mass of brains at the table, though I'm sure he would have preferred to have made further progress in the algorithm tournament.  His exit from round 2 is a sobering example of the exacting demands of the algorithm competition.  Just one missed "&" character that should have connected his function's return value to a memo array - a typing omission - made the difference between a successful medium with working memoization and a befuddling timeout.  The attendant swing in score made the difference between 1st and 8th place, and thus between jumping straight to the finals and an early exit.  The algorithm competition can be a game of inches - but for high schooler <tc-webtag:handle coderId="15117368" context="algorithm"/> it's unlikely to be his last shot at the touchdown.</p>
                        
                        <p>I'll sign off for now with a shot of <tc-webtag:handle coderId="14999860"/>, who seems to be trailed by a quantity of men everywhere she goes lately.  While the action here was apparently a bit too intense for my camera, it's clear that the new perfume is working out.  Those commercials don't lie!</p>
                        
                        <div align="center"><img src="/i/tournament/tco07/blogs/jmzero07chase.jpg"></div><br />
                        
                        <p></p>

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