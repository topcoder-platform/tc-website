<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page contentType="text/html;charset=utf-8" %> 
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>The 2008 TopCoder&reg; Open - Get ready for the Ultimate TopCoder Event!</title>
<link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
<link type="text/css" rel="stylesheet" href="/css/tournaments/tco08.css"/>
<link type="text/css" rel="stylesheet" href="/css/coders.css"/>
<script language="JavaScript" type="text/javascript" src="/js/arena.js"></script>
</head>
<body id="page_sub">

<div id="wrapper">

    <jsp:include page="nav.jsp" >
    <jsp:param name="tabLev1" value="overview"/>
    <jsp:param name="tabLev2" value="onsiteevents"/>
    <jsp:param name="tabLev3" value="movies"/>
    </jsp:include>


        
        
        <h2>Movies</h2>

                <div align="center">
                <table cellpadding="5" cellspacing="0">
                <tbody>
                    <tr>
                        <td align="center" valign="top">
                            <a href="/tc?module=Static&d1=tournaments&d2=tco08&d3=movieStream&clip=tco08_1&title=TC%20Channel%20from%20the%20TCO"><img src="/i/tournament/tco08/movies/tco08_1.jpg" alt="TC Channel" /></a>
                            <br /><A href="/tc?module=Static&d1=tournaments&d2=tco08&d3=movieStream&clip=tco08_1&title=TC%20Channel%20from%20the%20TCO">TC Channel from the TCO</A>
                        </td>
                    </tr>
                </tbody>
                </table>
                </div>    

    </div><%-- #content --%>

<jsp:include page="footer.jsp" />

</div><%-- #wrapper --%>

</body>
</html>
