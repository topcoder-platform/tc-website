<%@ page language="java" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<% int projectTypeId = ((Integer) request.getAttribute(Constants.PROJECT_TYPE_ID)).intValue(); %>
<html>
<%@ page import="com.topcoder.web.tc.Constants"%>
<%@ page import="com.topcoder.web.tc.controller.request.development.Base"%>
<head>
    <title>TopCoder - Message</title>
    <jsp:include page="/script.jsp"/>
    <jsp:include page="/style.jsp">
      <jsp:param name="key" value="tc_stats"/>
    </jsp:include>

    <LINK REL="stylesheet" TYPE="text/css" HREF="/css/stats.css"/>
</head>

<body>

<jsp:include page="../top.jsp">
    <jsp:param name="level1" value="development"/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr valign="top">
        <!-- Left Column Begins-->
        <td width="180">
               <%                 
                    switch (projectTypeId) {
                        case Base.COMPONENT_DESIGN_PROJECT_TYPE:%>
                            <jsp:include page="/includes/global_left.jsp">
                                <jsp:param name="node" value="des_compete"/>
                            </jsp:include>
                <%      break;
                        case Base.COMPONENT_DEVELOPMENT_PROJECT_TYPE: %>
                            <jsp:include page="/includes/global_left.jsp">
                                <jsp:param name="node" value="dev_compete"/>
                            </jsp:include>
                <%      break;
                        case Base.ASSEMBLY_PROJECT_TYPE: %>
                            <jsp:include page="/includes/global_left.jsp">
                                <jsp:param name="node" value="assembly_compete"/>
                            </jsp:include>
                <%      break;
                        case Base.ARCHITECTURE_PROJECT_TYPE: %>
                            <jsp:include page="/includes/global_left.jsp">
                                <jsp:param name="node" value="architecture_compete"/>
                            </jsp:include>
                <%      break;
                    }
                %>
        </td>
        <!-- Left Column Ends -->

        <!-- Gutter Begins -->
        <td width="15"><img src="/i/clear.gif" width="15" height="1" border="0"/></td>
        <!-- Gutter Ends -->

        <!-- Center Column Begins -->
        <td width="100%" align="center" class="bodyText">
               <%                 
                    switch (projectTypeId) {
                        case Base.COMPONENT_DESIGN_PROJECT_TYPE:%>
                			<jsp:include page="/page_title.jsp">
                                <jsp:param name="image" value="comp_design"/>
                			    <jsp:param name="title" value="Active Contests"/>
                			</jsp:include>
                <%      break;
                        case Base.COMPONENT_DEVELOPMENT_PROJECT_TYPE: %>
                			<jsp:include page="/page_title.jsp">
                                <jsp:param name="image" value="comp_development"/>
                			    <jsp:param name="title" value="Active Contests"/>
                			</jsp:include>
                <%      break;
                        case Base.ASSEMBLY_PROJECT_TYPE: %>
                			<jsp:include page="/page_title.jsp">
                                <jsp:param name="image" value="assembly"/>
                			    <jsp:param name="title" value="Active Contests"/>
                			</jsp:include>
                <%      break;
                        case Base.ARCHITECTURE_PROJECT_TYPE: %>
                            <jsp:include page="/page_title.jsp">
                                <jsp:param name="image" value="architecture"/>
                                <jsp:param name="title" value="Active Contests"/>
                            </jsp:include>
                <%      break;

                    }
                %>                


            <p>
                <strong>You have successfully registered for this contest.</strong>
               <br><br>
                View current <a href="/tc?module=ViewRegistrants&amp;pj=<%=request.getAttribute(Constants.PROJECT_ID)%>">contest registrants</a>
            </p>

        </td>
        <!-- Center Column Ends -->

        <!-- Gutter -->
        <td width="15"><img src="/i/clear.gif" width="15" height="1" border="0"></td>
        <!-- Gutter Ends -->

        <!-- Right Column Begins -->
        <td width="180">
            <jsp:include page="../public_right.jsp">
        <jsp:param name="level1" value="default"/>
    </jsp:include>

        </td>
        <!-- Right Column Ends -->

        <!-- Gutter -->
        <td width="2"><img src="/i/clear.gif" width="2" height="1" border="0"></td>
        <!-- Gutter Ends -->

    </tr>
</table>

<jsp:include page="../foot.jsp"/>

</body>

</html>


