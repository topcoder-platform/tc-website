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
<style type="text/css">
		.probWTitle
		{ font-size:16px; font-weight:bold; padding:10px 0px 0px 0px; }
		
		div.requirements
		{ position:relative; width:500px; }
		div.requirements div.reqList
		{ position:relative; padding-bottom:20px; float:left; width:500px; }
		div.requirements div.reqList p.reqTitle
		{ font-weight:bold; margin:0px 0px 0px 0px; }
		div.requirements div.reqList ul.reqListShift
		{ padding:0px 0px 0px 20px; margin:0px 0px 0px 0px; }
	</style>
</head>
<body>
<jsp:include page="../top.jsp" >
<jsp:param name="level1" value=""/>
</jsp:include>
<table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tbody>
        <tr valign="top">
            <%-- Left Column Begins--%>
            <td width="180"><jsp:include page="/includes/global_left.jsp">
                <jsp:param name="node" value="m_competitions"/>
                </jsp:include>
            </td>
            <%-- Left Column Ends --%>
            <%-- Center Column Begins --%>
            <td width="100%" align="center" class="bodyColumn"><div class="fixedWidthBody">
                    <p><span class="probWTitle">Write problems for TopCoder</span><br />
                        So you've taken your best shot at some of TopCoder's algorithm problems, and you've got some ideas for interesting problems you'd like to see in competition. What's next? Here's what it takes to write problems for TopCoder:</p>
                    <div class="requirements">
                        <div class="reqList">
                            <p class="reqTitle">Minimum requirements:</p>
                            <ul class="reqListShift">
                                <li>18+ years old</li>
                                <li>TopCoder Algorithm rating of at least 1500</li>
                                <li>Competed in at least 20 rated TopCoder events</li>
                            </ul>
                        </div>
                        <div class="reqList">
                            <p class="reqTitle">Tips for writers:</p>
                            <ul class="reqListShift">
                                <li>Try to write your problems in such way that they work together as a problem set.</li>
                                <li>You can write any type of contest that you'd like, including a High School match or an SRM.</li>
                                <li>You can submit problems as often (or as rarely) as you like – submitting a problem does not commit you to any regular writing schedule.</li>
                                <li>You may not participate in any contest in which problems you wrote are being used.</li>
                                <li>You will also have the opportunity to write the Match Editorial for the contest in which your problems were used (though writing the editorial is not obligatory). Payment for editorial writing is in addition to the payment for problem writing.</li>
                            </ul>
                        </div>
                        <div class="reqList">To proceed, go to the <a href="http://www.topcoder.com/contest/mpsqas/launch.html" target="_blank">MPSQAS applet</a>, login with your TopCoder handle and password,  and select Applications / Problem Writer Application. Detailed instructions will be sent to your after your application has been approved.</div>
                        <div class="reqList">
                            <p class="reqTitle">Payment:</p>
                            <ul class="reqListShift">
                                <li>Problem set: $750</li>
                                <li>Individual problem: $100 - $200, depending on difficulty level</li>
                                <li>SRM or tournament editorial: $100</li>
                                <li>HS editorial: $50</li>
                            </ul>
                        </div>
                    </div>
                </div></td>
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
