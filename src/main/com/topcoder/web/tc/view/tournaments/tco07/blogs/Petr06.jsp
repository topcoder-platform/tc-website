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
                        <h1><span>DRW tunes in to the TCO spirit - 06.28.07 6:00 PM EDT</span></h1>
                    
                        <div style="float:right;">
                            <tc-webtag:forumLink forumID="516303" message="Discuss" />
                        </div>

                        <img src="/i/m/Petr_big.jpg" alt="" width="55" height="61" border="0" hspace="6" vspace="1" align="left" class="myStatsPhoto"/><br />
                        By&#160;<tc-webtag:handle coderId="10574855" context="algorithm"/><br />
                        <span class="smallText"><em>TopCoder Member</em></span>
                        <br clear="all" />
                        
                        <br>
                    
                        <p>The DRW presentation has become another highlight today, at least judging
                        by the finalists' reports. It is not a big secret that sponsor presentations
                        sometimes get a little boring and 'business-like', and <a href="/tc?module=Static&d1=tournaments&d2=tco07&d3=sponsorspatrons&d4=drw">DRW</a> has managed to
                        avoid that mistake completely. <tc-webtag:handle coderId="11829284" context="algorithm"/> has named the absence of a single
                        PowerPoint slide as the compelling indicator of the entire DRW attitude.
                        DRW has employed a demo trading application to say what others would have
                        said using long, long phrases. And they were rewarded by the finalists
                        taking real interest in the presentation -- about fifty questions were asked
                        and answered providing some interesting discussion about DRW's work.</p>
                        
                        <p>The DRW booth has also attracted a lot of attention, as DRW people provided
                        the competitors with a Wii videogame, and have organized a long-awaited poker 
                        tournament today.</p>
                        
                        <p><div align=center><img src="/i/tournament/tco07/onsitePhotos/038.jpg"></div><br /></p>
                        
                        <p>Together with the successful presentation, that means
                        DRW people have managed to tune right into the spirit of the TCO - 
                        the spirit of competition and fun. Good job! We're hoping to see DRW
                        sponsoring future TopCoder tournaments. :)</p>

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