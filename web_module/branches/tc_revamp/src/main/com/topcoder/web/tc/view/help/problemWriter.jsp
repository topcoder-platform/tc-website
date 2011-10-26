<%@ page import="com.topcoder.web.common.WebConstants"%>
<%@ page contentType="text/html;charset=utf-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>TopCoder</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <jsp:include page="../script.jsp" />
    <jsp:include page="../style.jsp">
    <jsp:param name="key" value="tc_stats"/>
    </jsp:include>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <% String node = request.getParameter(WebConstants.LEFT_NAV_KEY);
        if (node!=null&&!(node.equals("algo_write")||node.equals("hs_write"))) {
            node = null;
        }
    %>
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
                <jsp:include page="/includes/global_left.jsp">
                    <jsp:param name="node" value="<%=node==null?"":node%>"/>
                </jsp:include>
            </td>
            <%-- Left Column Ends --%>
            <%-- Center Column Begins --%>
            <td width="100%" align="center" class="bodyColumn">
                <div class="fixedWidthBody">

<jsp:include page="/page_title.jsp" >
   <jsp:param name="image" value="support"/>
   <jsp:param name="title" value="Write Problems for Topcoder"/>
</jsp:include>

<h2>Write problems for TopCoder</h2>
<p>
So you've taken your best shot at some of TopCoder's algorithm problems, and you've got some ideas for interesting problems you'd like to see in competition. What's next? Here's what it takes to write problems for TopCoder:</p>
</p>
<h3>Minimum requirements:</h3>

<ul>
<li>18+ years old</li>
<li>TopCoder Algorithm rating of at least 1500</li>
<li>Competed in at least 20 rated TopCoder events</li>
</ul>

<h3>Tips for writers:</h3>

<ul>
<li>Try to write your problems in such way that they work together as a problem set.</li>
<li>You can write any type of contest that you'd like, including a High School match or an SRM.</li>
<li>You can submit problems as often (or as rarely) as you like - submitting a problem does not commit you to any regular writing schedule.</li>
<li>You may not participate in any contest in which problems you wrote are being used.</li>
<li>You will also have the opportunity to write the Match Editorial for the contest in which your problems were used (though writing the editorial is not obligatory). Payment for editorial writing is in addition to the payment for problem writing.</li>
</ul>

<p>
To proceed, go to the <a href="/contest/mpsqas/launch.html" target="_blank">MPSQAS applet</a>, login with your TopCoder handle and password,  and select Applications / Problem Writer Application. Detailed instructions will be sent to your after your application has been approved.
</p>

<h3>Payment:</h3>

<ul>
<li>Problem set: $750</li>
<li>Individual problem: $100 - $200, depending on difficulty level</li>
<li>SRM or tournament editorial: $100</li>
<li>HS editorial: $50</li>
</ul>


                </div>
            </td>
            <%-- Center Column Ends --%>
            <%-- Right Column Begins --%>
            <td width="170"><jsp:include page="../public_right.jsp">
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
