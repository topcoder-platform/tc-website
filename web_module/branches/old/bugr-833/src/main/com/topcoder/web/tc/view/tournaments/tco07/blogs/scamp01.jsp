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
                        <h1><span>Presentation: How the TopCoder process handles QA - 06.27.07 6:30 PM EDT</span></h1>
                        
                        <div style="float:right;">
                            <tc-webtag:forumLink forumID="516303" message="Discuss" />
                        </div>
                    
                        <img src="/i/m/nophoto.jpg" alt="" width="55" height="61" border="0" hspace="6" vspace="1" align="left" class="myStatsPhoto"/><br />
                        By&#160;<tc-webtag:handle coderId="279551" context="algorithm"/><br />
                        <span class="smallText"><em>TopCoder Member</em></span>
                        <br clear="all" />
                        
                        <br>
                        <p>In a presentation at the TCO today, I discussed some of the common QA problems that are cited against the use of reusable components.  These objections include:</p>  

                        <ul>
                            <li>Lack of access to commercial component source code.</li>
                            <li>Components are not readily testable.</li>
                            <li>Difficult to use and interpret tests from component vendors.</li>
                            <li>Concern that components were not developed for a specific operating environment; and that developing a component test bed for all possible environments is too costly and time consuming.</li>
                        </ul>
                        
                        <p>TopCoder address all these questions by integrating testing into everything we do. One of the newer highlights is "scamp@home," a software system that will take advantage of participants diverse environments to test components. Scamp@home distributes component tests to participating computers, across the entire range of available environments, hardware, character sets, and so on.</p>
                        
                        <p>To learn more, check out <a href="/pdfs/tournaments/scamp_presentation.ppt">the presentation</a> [PPT - 945kb ].</p>
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