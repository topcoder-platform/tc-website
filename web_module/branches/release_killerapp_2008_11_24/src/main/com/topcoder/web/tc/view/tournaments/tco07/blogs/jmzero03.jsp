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
                        <h1><span>Studio sketchbook showcase showdown - 06.27.07 7:30 PM EDT</span></h1>
                        
                        <div style="float:right;">
                            <tc-webtag:forumLink forumID="516303" message="Discuss" />
                        </div>
                    
                        <img src="/i/m/jmzero_big.jpg" alt="" width="55" height="61" border="0" hspace="6" vspace="1" align="left" class="myStatsPhoto"/><br />
                        By&#160;<tc-webtag:handle coderId="15498334" context="algorithm"/><br />
                        <span class="smallText"><em>TopCoder Member</em></span>
                        <br clear="all" />
                        
                        <br>
                        <p>The marathon match is coming to a head, and if you haven't already checked out the visualization and videos, I suggest you head over to the forums and grab the <a href="http://forums.topcoder.com/?module=Thread&threadID=580133&start=0&mc=13">videos</a> and the <a href="http://forums.topcoder.com/?module=Thread&threadID=580125&start=0&mc=7">visualizer</a> itself.  There's some entertaining successes and failures, and the problem is fun to try out as a human (though devilishly difficult).  Here's <tc-webtag:handle coderId="8357090" context="algorithm"/> sending yet another new crop of space-travellers to a fiery doom.  Hopefully he's done grieving their loss by the time his algorithm round starts.</p>

                        <div align=center><img src="/i/tournament/tco07/blogs/jmzero03misofspace.jpg"></div><br />
                        
                        <p>I've talked to a number of people about suggested strategies for the space problem - and while there were a few exotic ideas bandied about, most people agreed this problem should be treated as a search.  The basic idea is to try a number of possible combinations of thrust and direction, use the simulation code given to see where they get you, and refine the best ideas.  The complicated nature of the simulation means it becomes very complex to search far into the future in this way, but the approach is definitely strong.  The competitors have found a number of variations in strategy, but at this point it's still very unclear who will grace the final podium.</p>
                        
                        <p>Tomorrow we'll get to see the Studio competition (which revolves around redesign of the Studio website).  The competitors are excited, and I'm excited to see what they come up with.  As a preview, I asked each of the competitors to do a little sketch.  To be clear, the competitors' days are very busy, so all of these sketches were done in a very, very short amount of time.</p>
                        
                        <div align=center><img src="/i/tournament/tco07/blogs/jmzero03tricia_tija.jpg"></div><br />
                        
                        <p><tc-webtag:handle coderId="22673857"/> drew a convincing likeness of me, though I'll note that the giant eye on my torso has been exaggerated somewhat.</p>
                        
                        <div align=center><img src="/i/tournament/tco07/blogs/jmzero03amiune.jpg"></div><br />
                        
                        <p>This picture by <tc-webtag:handle coderId="13358674"/> gave me a bit of a pause.  You see, <tc-webtag:handle coderId="21196141"/> gave us two guidelines about our blog posts: "no exposed navels", and "more incriminating photos of Spiderman."  But if you're seeing this, I guess one exposed navel has snuck through. <sup>1</sup></p>
                        
                        <div align=center><img src="/i/tournament/tco07/blogs/jmzero03oton.jpg"></div><br />
                        
                        <p>Here's a challenge, put your finger on your monitor, touching this guy's little belly.  Now try not to laugh.  Nice work, <tc-webtag:handle coderId="22076237"/>.</p>
                        
                        <div align=center><img src="/i/tournament/tco07/blogs/jmzero03fmx.jpg"></div><br />
                        
                        <p><tc-webtag:handle coderId="20781137"/> demonstrates his skills and his frustration via an editorial cartoon on culinary injustice.</p>
                        
                        <div align=center><img src="/i/tournament/tco07/blogs/jmzero03yiming.jpg"></div><br />
                        
                        <p><tc-webtag:handle coderId="10481546"/> really took this task and ran with it, producing the tidy little sketch above.</p>
                        
                        <div align=center><img src="/i/tournament/tco07/blogs/jmzero03maraqja.jpg"></div><br />
                        
                        <p>I'm going to go ahead and declare this sketch, by <tc-webtag:handle coderId="15006955"/>, my favorite.  It's the essence of simplicity, and perhaps that might be a hint for winning design strategy.</p>
                        
                        <p>Thanks to the studio competitors for letting us have a little glimpse at their talents and personalities - I'm looking forward to the competition tomorrow.</p>
                        
                        <br /><br />
                        
                        <p><sup>1</sup> <em>[Editor's note: I did no such thing.]</em></p>

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