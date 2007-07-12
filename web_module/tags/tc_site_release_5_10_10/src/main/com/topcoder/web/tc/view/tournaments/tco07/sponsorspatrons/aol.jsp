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
    <jsp:include page="../../script.jsp" />
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
                    <jsp:param name="tabLev2" value="sponsors"/>
                    <jsp:param name="tabLev3" value="aol"/>
                    </jsp:include>

                </td>
                <td id="bodySpacer" width="100%">
                    <div id="pageBody">
                        <div style="float: right;">
                        <h2 style="border-bottom: 1px solid #999999;">Chat Session Transcripts</h2>
                        <strong>
                        <A href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco07&amp;d3=sponsorspatrons&amp;d4=aolChat20070220">SRM 340</A><br />
                        <A href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco07&amp;d3=sponsorspatrons&amp;d4=aolChat20070314">SRM 342</A><br />
                        <A href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco07&amp;d3=sponsorspatrons&amp;d4=aolChat20070418">SRM 345</A>
                        </strong>
                        <h2 style="border-bottom: 1px solid #999999; margin-top: 10px;">AOL Products & Services</h2>
                        <strong>
                        <A href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco07&amp;d3=sponsorspatrons&amp;d4=aolBoxely">Boxely</A><br />
                        </strong>
                        </div>

                        <div style="margin-bottom: 20px;"><a target="_blank" href="<tc-webtag:linkTracking link='http://dev.aol.com' refer='TCO07_AOL_PAGES' />"><img src="/i/tournament/tco07/aol_logo.png" alt="AOL" border="0" /></a></div>
                        <p>
                        AOL is pleased to welcome you, the world's leading programmers and designers, to the 2007 TopCoder Open. We are proud to again partner with TopCoder, a prestigious organization that exemplifies and shares our commitment to innovation and creativity.
                        </p>
                        <p>
                        AOL is a global Web services company that operates some of the most popular Web destinations and offers a comprehensive suite of free software and services. AOL also provides a range of resources and support for third-party developers. Available at <a target="_blank" href="<tc-webtag:linkTracking link='http://dev.aol.com' refer='TCO07_AOL_PAGES' />">dev.aol.com</a>, the AOL Developer Network provides the developer community with access to AOL's technology platform, open APIs, and design tools.
                        </p>
                        <p>
                        Do you want millions of people to use your code? AOL is looking for top programming talent. If you are seeking new career opportunities and want to help shape the next generation of Web applications, AOL wants to hear from you. Check out our <a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco07&amp;d3=sponsorspatrons&amp;d4=aolOpps">current opportunities</a>.
                        </p>
                        <p>
                        AOL and its subsidiaries have operations in the United States, Canada, Europe, and Asia.
                        </p>
                        <p>
                        * The TopCoder Open is sponsored by TopCoder, Inc. AOL LLC is not responsible for any aspect of the tournament.                           
                        </p>
                        <p><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco07&amp;d3=sponsorspatrons&amp;d4=aolOpps" class="button" style="width: 120px;">Current Opportunities</a></p>
                    </div>
                </td>
            </tr>
        </table>


        <jsp:include page="../footer.jsp" />
    </div>
</div>

</body>

</html>
