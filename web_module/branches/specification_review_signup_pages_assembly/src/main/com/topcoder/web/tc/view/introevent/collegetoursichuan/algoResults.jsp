<%@ page import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<% ResultSetContainer results = (ResultSetContainer) request.getAttribute("results");%>
<html>
<head>
    <title>TopCoder College Tour</title>

    <jsp:include page="/script.jsp"/>
    <jsp:include page="/style.jsp">
        <jsp:param name="key" value="tc_stats"/>
    </jsp:include>

</head>

<body>

<jsp:include page="../../top.jsp">
    <jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr valign="top">
        <!-- Left Column Begins-->
        <td width="180">
            <jsp:include page="/includes/global_left.jsp">
                <jsp:param name="node" value="m_competitions"/>
            </jsp:include>
        </td>
        <!-- Left Column Ends -->

        <!-- Center Column Begins -->
        <td width="100%" align="center" class="bodyColumn">
            <div class="fixedWidthBody">

                <jsp:include page="../../page_title.jsp">
                    <jsp:param name="image" value="college_tour"/>
                    <jsp:param name="title" value="results"/>
                </jsp:include>


                <div align="center">
                    <tc-webtag:sponsorImage image="image" alt="College Logo" border="0"/>
                </div>

                <jsp:include page="topMenu.jsp">
                    <jsp:param name="active" value="algo_results"/>
                </jsp:include>

                <div align="center">
                    <table cellpadding="0" cellspacing="0" class="stat" width="100%">
                        <tbody>
                            <tr>
                                <td class="title" colspan="2">Results</td>
                            </tr>
                            <tr>
                                <td class="header">Handle</td>
                                <td class="headerR">Score</td>
                            </tr>
                            <%boolean even = false;%>

                            <rsc:iterator list="<%=results%>" id="resultRow">
                                <tr class="<%=(even ? "dark" : "light")%>">
                                    <td class="value">
                                        <tc-webtag:handle coderId="${resultRow.map['coder_id']}" context="algorithm"/>
                                    </td>
                                    <td class="valueR">
                                        <rsc:item name="point_total" row="<%=resultRow%>" format="0.00"/>
                                    </td>
                                </tr>
                                <% even=!even;%>
                            </rsc:iterator>
                        </tbody>
                    </table>
                </div>

            </div>


        </td>
        <!-- Center Column Ends -->

        <!-- Right Column Begins -->
        <td width="170">
            <jsp:include page="../../public_right.jsp">
                <jsp:param name="level1" value="privatelabel"/>
            </jsp:include>
        </td>
        <!-- Right Column Ends -->

        <!-- Gutter -->
        <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
        <!-- Gutter Ends -->
    </tr>
</table>

<jsp:include page="../../foot.jsp"/>

</body>

</html>
