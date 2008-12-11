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
                        <h1><span>It's competition day already! - 06.27.07 6:00 PM EDT</span></h1>
                        
                        <div style="float:right;">
                            <tc-webtag:forumLink forumID="516303" message="Discuss" />
                        </div>
                    
                        <img src="/i/m/jmpld40_big.jpg" alt="" width="55" height="61" border="0" hspace="6" vspace="1" align="left" class="myStatsPhoto"/><br />
                        By&#160;<tc-webtag:handle coderId="14999860" context="algorithm"/><br />
                        <span class="smallText"><em>TopCoder Member</em></span>
                        <br clear="all" />
                        
                        <br>
                        <p>It's competition day already!  I can't believe how fast things have gone and despite my desire to want to blog a bit, I have no time whatsoever!  It's amazing how fast these events go!  We've been setting up since Sunday morning at 8AM and I've been working on this event since we booked it in June of 2006.  By the time you fly to Las Vegas, start setting up, it goes by so fast!</p>  

                        <p>Sunday set up went very well.  We had a lot of staff members pulling their weight getting stuff done.  We were able to be done with all set up early on Tuesday.</p>  
                        
                        <p>It was so fun to meet all the competitors last night at the welcome reception.  Some of my favorites:</p>
                        
                        <p><tc-webtag:handle coderId="21101272" context="development"/> - we just got a flight for him 2 days ago!  It's amazing the trials and tribulations some of the competitors go through to get here.</p>
                        
                        <p><tc-webtag:handle coderId="7390467" context="algorithm"/> - so nice and always with a welcoming smile.</p>
                        
                        <p><tc-webtag:handle coderId="10428762" context="algorithm"/> with wife Caryn - Such pleasant people.  I'm so fortunate to be able to meet them.  Especially since now I'll be sure to have a friend in 
                        South Africa if I ever want to visit!</p>
                        
                        <p><tc-webtag:handle coderId="10028010" context="design"/> - always so happy to see me and always so grateful for the events.</p>
                        
                        <p>And I have to say it's so awesome to be able to meet <tc-webtag:handle coderId="7545675"/>, <tc-webtag:handle coderId="22251193"/>, <tc-webtag:handle coderId="16061362"/>, <tc-webtag:handle coderId="14810373"/>, and <tc-webtag:handle coderId="14882871"/> (our Argentina office).  And of course the rest of the TC staff that I work with every day but never get to work with in person.</p>
                        
                        <p>But I must admit, the best part of my job is being at these events, running around and feeling like I have a friend from countries all over the world.  It's a pleasure to be in the company of such great people!</p>
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