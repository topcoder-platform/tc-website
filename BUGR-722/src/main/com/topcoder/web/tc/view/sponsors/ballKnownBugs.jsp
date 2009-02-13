<%@ page contentType="text/html;charset=utf-8" %> 
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
    <title>TopCoder</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <jsp:include page="../script.jsp" />
    <jsp:include page="../style.jsp">
    <jsp:param name="key" value="tc_stats"/>
    </jsp:include>
</head>
<body>

<jsp:include page="../top.jsp" >
<jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
<tbody>
    <tr valign="top">
<%-- Left Column Begins--%>
        <td width="180">
            <jsp:include page="../includes/global_left.jsp">
                <jsp:param name="node" value=""/>
            </jsp:include>
        </td>
<%-- Left Column Ends --%>

<%-- Center Column Begins --%>
        <td width="100%" align="center" class="bodyColumn">
            <div class="fixedWidthBody">
            
<div align="center" style="padding-bottom: 10px; border-bottom: 1px solid #999999;">
    <A href="http://www.theball.com/"><img src="/i/sponsor/theball.png" alt="The Ball" /></A>
    <br><strong>
    <A href="/tc?module=ViewBallBugSubmit" class="bcLink">Report a bug</A>
    | Known bugs
    </strong>
</div>

<table cellspacing="0" cellpadding="0" class="stat" style="width: 100%; margin: 20px 0px 40px 0px;">
<thead>
    <tr>
        <td class="title" colspan="4">
        Known bugs
        </td>
    </tr>
</thead>
<tbody>
    <tr>
        <td class="header" width="40%">
            Bug
        </td>
        <td class="header" width="60%">
            How to reproduce bug
        </td>
        <td class="headerC">
            Submitter
        </td>
        <td class="headerC">
            Date
        </td>
    </tr>
    <% boolean even = false; %>
    <tr class="<%=even?"dark":"light"%>">
        <td class="value">
            Awkward Plugin UI Navigation
        </td>
        <td class="value">
1. Log into plugin (IE or FF)
<br>2. Go to any key or ball site
<br>3. Click on trailer for any game on that site
<br>4. Brainteaser* to be solved appears
<br>5. Click on any tab on the Plugin menu bar:
"Unlocked Sites", "Upcoming Domains", 
"Leaderboard"
<br>6. Brainteaser screen is lost - accessible only 
by right-clicking and using "Back" button
<br>* Note this problem is generic i.e. applies to 
any target, not just the brainteaser
        </td>
        <td class="valueC">
            <tc-webtag:handle coderId="153650" />
        </td>
        <td class="valueC">
            04.04.2007
        </td>
    </tr>
    <% even = !even;%>
    <tr class="<%=even?"dark":"light"%>">
        <td class="value">
            Player Cannot Edit Profile
        </td>
        <td class="value">
            Player profile is not editable, except by Game Administrator
        </td>
        <td class="valueC">
            <tc-webtag:handle coderId="153650" />
        </td>
        <td class="valueC">
            04.04.2007
        </td>
    </tr>
    <% even = !even;%>
    <tr class="<%=even?"dark":"light"%>">
        <td class="value">
            Sponsor Cannot Edit Profile
        </td>
        <td class="value">
            Sponsor profile is not editable, except by Game Administrator
        </td>
        <td class="valueC">
            <tc-webtag:handle coderId="153650" />
        </td>
        <td class="valueC">
            04.04.2007
        </td>
    </tr>
    <% even = !even;%>
    <tr class="<%=even?"dark":"light"%>">
        <td class="value">
            Clicking on Backbutton loses states
        </td>
        <td class="value">
            During player or sponsor registration, clicking on the back-button results in an error
        </td>
        <td class="valueC">
            <tc-webtag:handle coderId="153650" />
        </td>
        <td class="valueC">
            04.04.2007
        </td>
    </tr>
</tbody>
</table>

<%-- sample row
    <% even = !even;%>
    <tr class="<%=even?"dark":"light"%>">
        <td class="value">
            
        </td>
        <td class="value">
            
        </td>
        <td class="valueC">
            <tc-webtag:handle coderId="" />
        </td>
        <td class="valueC">
            
        </td>
    </tr>
--%>


            </div>
        </td>
<%-- Center Column Ends --%>
        
<%-- Right Column Begins --%>
        <td width="170">
            <jsp:include page="../public_right.jsp">
                <jsp:param name="level1" value="default"/>
            </jsp:include>
        </td>
<%-- Right Column Ends --%>
        
    </tr>
    </tbody>
</table>

<jsp:include page="../foot.jsp" />
</body>
</html>