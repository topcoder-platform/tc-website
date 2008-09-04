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
                        <h1><span>My TCO top five - 06.30.07 5:00 PM EDT</span></h1>
                        
                        <div style="float:right;">
                            <tc-webtag:forumLink forumID="516303" message="Discuss" />
                        </div>
                    
                        <img src="/i/m/nophoto.jpg" alt="" width="55" height="61" border="0" hspace="6" vspace="1" align="left" class="myStatsPhoto"/><br />
                        By&#160;<a href="http://studio.topcoder.com/" class="coderTextOrange">jwlms</a><br />
                        <span class="smallText"><em>TopCoder Member</em></span>
                        <br clear="all" />
                        
                        <br>
                        <p>Now that I'm home and recovering from the excitement of the TCO, I thought I would recap some of my thoughts on how the Studio finals went. Here's a top five list of my favorite moments:

                        <p><b>5: <tc-webtag:handle coderId="10481546"/> takes a 10-minute nap at his desk.</b><br> 
                        Well, he probably wasn't sleeping, but he did bury his head in his arms at one point. When I saw this, I realized how much pressure the Studio finalists were under. Perhaps he was organizing his thoughts, or he could have been trying to filter out the distractions surrounding the stage. Either way, I had to fight the urge to get him a pillow.</p>
                        
                        <p><b>4: Meeting the finalists in person.</b><br>
                        As Tuesday night rolled around, I was practicing pronounciations of handles and hoping the Studio finalists looked like their photos so I could pick them out in the crowd. While <tc-webtag:handle coderId="22076237"/> was much taller than I expected, and <tc-webtag:handle coderId="10481546"/> was wearing glasses, I really had no trouble finding everyone Tuesday night at the reception. I was very excited and a little shy when I met each person. My only regret was that I couldn't spend more time with them, really talking about their designs and their impressions of the TCO.</p>
                        
                        <p><b>3: Finally being able to tell the finalists about the challenge!</b><br>
                        The online portion of the Studio TCO round wrapped up at the end of April and the finalists had to wait all this time to find out what they would be designing onsite. There was a lot of leading questions on the forums, trying to get me to drop some hints, but I had to keep it under wraps. What the finalists probably don't know is that I was very excited to spill it, even if my stage presence on Tuesday night was less than enthusiastic (I was nervous!). When I gave the competitors their packets, they were as excited as kids at a carnival. Their enthusiasm really made my night! </p>
                        
                        <p><b>2: Hearing the wide variety of opinions from the spectators.</b><br>
                        I had hoped that Studio would get some attention at the monitor kiosk, but I hadn't expected so many people -- and so many passionate opinions! People were very eager to share their thoughts not only with me, but with each other. Instead of quietly evaluating each design like a piece of art in a gallery, some people were in such hot debate that I actually had to ask them to quiet down so as not to disturb the competitors. Ideas and suggestions were flying; many statements began with, "If this were my design, I would...." I was also surprised to see people continually coming back throughout the day to see how the designs were shaping up. They just couldn't wait to see what the designers would do next.</p>
                        
                        <p><b>1: Watching the designs unfold before my eyes.</b><br>
                        I was absolutely facinated to see how each designer approached the challenge. Some finalists started at the top of their screens and worked their way down, designing the masthead area first, then working on each element until they reached the footer. Other designers "blocked out" the important elements first, showing the whole concept in rough format, and then refining the design as the day progressed. A couple of designers had the main elements in place well before the end of the round and then spent a lot of time fiddling with the placement of navigation buttons or magnifying an element to 1200X the normal size to tweak a pixel here and there. As a designer, I could relate to each approach and constantly asked myself, "How would I approach this if I were competing?" </p>
                        
                        <p>In addition to these moments, I also really enjoyed specnding time with everyone from the Studio panel. A special thanks goes to Blake Walles, Creative Director of <a href="www.bonsaicreativegroup.com/">Bonsai Creative Group</a>, for lending his expertise and real-world design knowledge to this competition. He and <tc-webtag:handle coderId="7346876"/> did a fantastic job of giving quality feedback to the competitors. <tc-webtag:handle coderId="8520396"/>, <tc-webtag:handle coderId="22686775"/> and <tc-webtag:handle coderId="22682880"/> also did a great job with giving direction in their scorecards and notes to the finalists. <tc-webtag:handle coderId="289521"/> and <tc-webtag:handle coderId="22060307"/> did not get to join us during the feedback round, but helped tremendously behind the scenes and kept me laughing.</p>
                        
                        <p>I believe the first Studio onsite finals was a big success and I look forward to the next event!</p>
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