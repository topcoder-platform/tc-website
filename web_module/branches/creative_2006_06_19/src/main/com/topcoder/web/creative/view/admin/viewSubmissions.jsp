<%@ page import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer" %>
<%@ page contentType="text/html;charset=utf-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<% ResultSetContainer submissions = (ResultSetContainer) request.getAttribute("submissions");%>


<html>
<head>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>TopCoder FX</title>
    <jsp:include page="../style.jsp">
        <jsp:param name="key" value="tc_creative"/>
    </jsp:include>

</head>

<body>

<jsp:include page="../creativeTop.jsp">
    <jsp:param name="section" value="default"/>
</jsp:include>

<jsp:include page="adminLeft.jsp">
    <jsp:param name="node" value="home"/>
</jsp:include>

<div class="contentOuter">
    <div class="contentInner">

        <h1>Contest List</h1>

        <%-- without this div, the table inside stretches way outside the window, only in IE of course --%>
        <div class="tableHolder">
            <table class="stat" cellpadding="0" cellspacing="0" style="width:100%">
                <tbody>
                    <tr>
                        <td class="title" colspan="7">Submissions for ${contest.name}</td>
                    </tr>
                    <tr>
                        <td class="headerC"></td>
                        <td class="header">Submitter</td>
                        <td class="headerC">Submission</td>
                        <td class="headerC">Submit Date</td>
                        <td class="headerC">Review Date</td>
                        <td class="headerC">Reviewer</td>
                        <td class="headerC">Status</td>
                    </tr>
                    <rsc:iterator list="<%=submissions%>" id="resultRow">

                        <tr class="light">
                            <td class="valueC">
                                details
                            </td>
                            <td class="valueC">
                                <rsc:item name="submitter_handle" row="<%=resultRow%>"/>
                            </td>
                            <td class="valueC">
                                <rsc:item name="original_file_name" row="<%=resultRow%>"/>
                            </td>
                            <td class="valueC">
                                <rsc:item name="submit_date" row="<%=resultRow%>"/>
                            </td>
                            <td class="valueC">
                                <rsc:item name="review_date" row="<%=resultRow%>"/>
                            </td>
                            <td class="valueC">
                                <rsc:item name="reviewer_handle" row="<%=resultRow%>"/>
                            </td>
                            <td class="valueC">
                                <rsc:item name="review_status_desc" row="<%=resultRow%>"/>
                            </td>
                        </tr>
                    </rsc:iterator>

                </tbody>
            </table>
        </div>

        <jsp:include page="../creativeFoot.jsp"/>
    </div>
</div>
</body>
</html>
<td class="headerC">Review Date</td>