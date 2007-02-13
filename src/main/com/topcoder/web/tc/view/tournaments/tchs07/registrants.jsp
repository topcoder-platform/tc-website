<%@ page contentType="text/html;charset=utf-8" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html> 
<head> 
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/> 
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/> 
    <link type="text/css" rel="stylesheet" class="bodyText_link" href="/css/coders.css"/>
    <link type="text/css" rel="stylesheet" class="bodyText_link" href="/css/tchs07.css"/>
    <title>TopCoder High School 2007</title> 
</head>
<body>

<div align="center" style="background: transparent;">
    <div class="content">
        <img src="/i/tournament/tchs07/contentN.png" alt="contentN" style="display: block;" />

        <jsp:include page="links.jsp" >
        <jsp:param name="tabLev1" value="registrants"/>
        <jsp:param name="tabLev2" value=""/>
        <jsp:param name="tabLev3" value=""/>
        </jsp:include>

        <div class="contentSpacer">
          <h2>Registrants</h2>
          
<div align="center">
<table cellpadding="0" cellspacing="0" class="stat" style="width:400px; margin-bottom: 100px;">
<thead>
    <tr><td class="title" colspan="3">Registrants: 123</td></tr>
    <tr>
        <td class="headerC">
            <A href="sortbyrank">Rank</A>
        </td>
        <td class="header" width="100%">
            <A href="sortbyhandle">Handle</A>
        </td>
        <td class="headerR">
            <A href="sortbyrating">Rating</A>
        </td>
    </tr>
</thead>
<tbody>
    <tr class="light">
        <td class="valueC">
        1
        </td>
        <td class="value">
        <tc-webtag:handle coderId="12005484" context="hs_algorithm"/>
        </td>
        <td class="valueR">
        1234
        </td>
    </tr>
    <tr class="dark">
        <td class="valueC">
        2
        </td>
        <td class="value">
        <tc-webtag:handle coderId="12005484" context="hs_algorithm"/>
        </td>
        <td class="valueR">
        1234
        </td>
    </tr>
</tbody>
</table>
</div>


        </div>
        <div class="footer">
            Copyright &#169; 2000-2006, TopCoder, Inc. All rights reserved.
        </div>
        <img src="/i/tournament/tchs07/contentS.png" alt="contentS" style="display: block;"/>
    </div>
</div>

</body> 
</html>

