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
        <jsp:param name="tabLev1" value="resultsInd"/>
        <jsp:param name="tabLev2" value=""/>
        <jsp:param name="tabLev3" value=""/>
        </jsp:include>

        <div class="contentSpacer">
          <h2>Individual Results</h2>

<table cellspacing="0" cellpadding="0" class="stat" style="width: 100%">
<thead>
    <tr>
        <td class="title" colspan="8">
        Individual Results
        </td>
    </tr>
    <tr>
        <td class="header">
        Handle
        </td>
        <td class="header">
        Team
        </td>
        <td class="headerC">
        Region
        </td>
        <td class="headerC" nowrap="nowrap">
        Round 1
        </td>
        <td class="headerC" nowrap="nowrap">
        Round 2
        </td>
        <td class="headerC" nowrap="nowrap">
        Round 3
        </td>
        <td class="headerC">
        Semifinals
        </td>
        <td class="headerC">
        Finals
        </td>
    </tr>
</thead>
<tbody>
    <tr class="light">
        <td class="value">
        <tc-webtag:handle coderId="144400" context="hs_algorithm" />
        </td>
        <td class="value">
        Saint-Petersburg Phys-Math Lyceum #30
        </td>
        <td class="valueC">
        Gamma
        </td>
        <td class="valueC">
        advanced
        </td>
        <td class="valueC">
        &nbsp;
        </td>
        <td class="valueC">
        &nbsp;
        </td>
        <td class="valueC">
        &nbsp;
        </td>
        <td class="valueC">
        &nbsp;
        </td>
    </tr>
    <tr class="dark">
        <td class="value">
        <tc-webtag:handle coderId="144400" context="hs_algorithm" />
        </td>
        <td class="value">
        Saint-Petersburg Phys-Math Lyceum #30
        </td>
        <td class="valueC">
        Gamma
        </td>
        <td class="valueC">
        <span class="bigRed">eliminated</span>
        </td>
        <td class="valueC">
        &nbsp;
        </td>
        <td class="valueC">
        &nbsp;
        </td>
        <td class="valueC">
        &nbsp;
        </td>
        <td class="valueC">
        &nbsp;
        </td>
    </tr>
</tbody>
</table>

        </div>
        <div class="footer">
            Copyright &#169; 2000-2006, TopCoder, Inc. All rights reserved.
        </div>
        <img src="/i/tournament/tchs07/contentS.png" alt="contentS" style="display: block;"/>
    </div>
</div>

</body> 
</html>

