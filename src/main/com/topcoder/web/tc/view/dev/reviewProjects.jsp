<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<%@ page import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer"%>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<% ResultSetContainer projectList = (ResultSetContainer)request.getAttribute("projectList");%>
<head>
<title>Programming Contests, Software Development, and Employment Services at TopCoder</title>

<jsp:include page="../script.jsp" />

</head>

<body>

<jsp:include page="../top.jsp" >
    <jsp:param name="level1" value="development"/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">
<!-- Left Column Begins-->
        <td width="180">
            <jsp:include page="../includes/global_left.jsp">
                <jsp:param name="level1" value="development"/>
                <jsp:param name="level2" value=""/>
            </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Gutter Begins -->
        <td width="15"><img src="/i/clear.gif" width="15" height="1" border="0"/></td>
<!-- Gutter Ends -->

<!-- Center Column Begins -->
        <td width="100%" align="center">
            <img src="/i/clear.gif" alt="" width="1" height="15" border="0" /><br/>


            <table border="0" cellspacing="3" cellpadding="0" width="530">
                <tr>
                    <td class="bodyText">Component Name</td>
                    <td class="bodyText">Catalog</td>
                    <td class="bodyText">Phase</td>
                    <td class="bodyText"># of Submissions</td>
                    <td class="bodyText">Review Start</td>
                    <td class="bodyText">Review End</td>
                    <td class="bodyText"># Review Positions Available</td>
                </tr>

                <rsc:iterator list="<%=projectList%>" id="resultRow">
                    <tr>
                        <td class="bodyText"><rsc:item row="<%=resultRow%>" name="component_name"/></td>
                        <td class="bodyText"><rsc:item row="<%=resultRow%>" name="catalog"/></td>
                        <td class="bodyText"><rsc:item row="<%=resultRow%>" name="phase_desc"/></td>
                        <td class="bodyText"><rsc:item row="<%=resultRow%>" name="submission_count"/></td>
                        <td class="bodyText"><rsc:item row="<%=resultRow%>" name="review_start" format="MM.dd.yyyy"/></td>
                        <td class="bodyText"><rsc:item row="<%=resultRow%>" name="review_end" format="MM.dd.yyyy"/></td>
                        <td class="bodyText"><rsc:item row="<%=resultRow%>" name="available_spots"/></td>
                    </tr>
                </rsc:iterator>

            </table>



        </td>
<!-- Center Column Ends -->

<!-- Gutter -->
         <td width="15"><img src="/i/clear.gif" width="15" height="1" border="0"></td>
<!-- Gutter Ends -->

<!-- Right Column Begins -->
         <td width="180">
            <jsp:include page="right.jsp"/>
         </td>
<!-- Right Column Ends -->

<!-- Gutter -->
         <td width="2"><img src="/i/clear.gif" width="2" height="1" border="0"></td>
<!-- Gutter Ends -->

    </tr>
</table>

<jsp:include page="../foot.jsp" />

</body>

</html>
