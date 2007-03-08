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
                    <jsp:param name="tabLev3" value="ubs"/>
                    </jsp:include>

                </td>
                <td id="bodySpacer" width="100%">
                    <div id="pageBody">
                        <div style="margin-bottom: 20px;"><a target="_blank" href="<tc-webtag:linkTracking link='http://www.ubs.com' refer='TCO07_UBS_PAGES' />"><img src="/i/tournament/tco07/ubs_logo.png" alt="UBS" border="0" /></a></div>
<p>
By clicking "Submit" below you will be releasing your TopCoder contact and statistical information to UBS and you will be giving UBS permission to contact you about their current job opportunities.
</p>
<p>
<A href="/tc?module=JobHit&jid=377&jt=1">Submit</A>
<br><br><br><br><br><br>
</p>
                    </div>
                </td>
            </tr>
        </table>


        <jsp:include page="../footer.jsp" />
    </div>
</div>

</body>

</html>
