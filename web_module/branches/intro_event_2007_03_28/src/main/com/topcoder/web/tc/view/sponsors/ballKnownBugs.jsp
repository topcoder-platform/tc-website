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
        <td width="100%" align="left" class="bodyColumn">
            
<div align="pagingBox">

</div>
<%-- SAMPLE TABLE --%>
<table cellspacing="0" cellpadding="0" class="stat" style="width: 100%; margin-bottom: 40px;">
<thead>
    <tr>
        <td class="title" colspan="4">
        Known bugs
        </td>
    </tr>
</thead>
<tbody>
    <tr>
        <td class="header">
            Bug
        </td>
        <td class="header">
            How to reproduce bug
        </td>
        <td class="headerC">
            Submitter
        </td>
        <td class="headerC">
            Date
        </td>
    </tr>
    <tr class="light">
        <td class="value">
            Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin convallis scelerisque leo. Maecenas cursus nonummy felis. Integer sit amet nibh et magna semper molestie. Praesent ultricies venenatis justo. Nullam congue mauris. In sed justo. Quisque fringilla lacus a turpis. Nunc lobortis porta ante.
        </td>
        <td class="value">
            Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin convallis scelerisque leo. Maecenas cursus nonummy felis. Integer sit amet nibh et magna semper molestie. Praesent ultricies venenatis justo. Nullam congue mauris. In sed justo. Quisque fringilla lacus a turpis. Nunc lobortis porta ante.
        </td>
        <td class="valueC">
            <tc-webtag:handle coderId="7340263" />
        </td>
        <td class="valueC">
            <strong>03.26.2007</strong><br>12:34 EDT
        </td>
    </tr>
    <tr class="dark">
        <td class="value">
            Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin convallis scelerisque leo. Maecenas cursus nonummy felis. Integer sit amet nibh et magna semper molestie. Praesent ultricies venenatis justo. Nullam congue mauris. In sed justo. Quisque fringilla lacus a turpis. Nunc lobortis porta ante.
        </td>
        <td class="value">
            Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin convallis scelerisque leo. Maecenas cursus nonummy felis. Integer sit amet nibh et magna semper molestie. Praesent ultricies venenatis justo. Nullam congue mauris. In sed justo. Quisque fringilla lacus a turpis. Nunc lobortis porta ante.
        </td>
        <td class="valueC">
            <tc-webtag:handle coderId="7340263" />
        </td>
        <td class="valueC">
            <strong>03.26.2007</strong><br>12:34 EDT
        </td>
    </tr>
</tbody>
</table>


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