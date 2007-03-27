<%@ page contentType="text/html;charset=utf-8" %> 
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
            
<%-- SAMPLE TABLE --%>
<table cellspacing="0" cellpadding="0" class="stat" style="width: 100%; margin-bottom: 40px;">
<thead>
    <tr>
        <td class="title" colspan="2">
        Report a bug
        </td>
    </tr>
</thead>
<tbody>
    <tr class="light">
        <td class="value" nowrap="nowrap" style="border-top: none; vertical-align: middle;">
            Bug description:
        </td>
        <td class="value" style="border-top: none;">
            <textarea name="" rows="6" cols="40"></textarea>
        </td>
    </tr>
    <tr class="light">
        <td class="value" nowrap="nowrap" style="border-top: none; vertical-align: middle;">
            How to reproduce bug:
        </td>
        <td class="value" style="border-top: none;">
            <textarea name="" rows="6" cols="40"></textarea>
        </td>
    </tr>
    <tr class="light">
        <td class="valueC" colspan="2" style="border-top: none;">
            <button name="submit" value="submit" type="submit" style="margin-top: 10px;">Submit</button>
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