<%@ page import="com.topcoder.shared.util.ApplicationServer" %>
<%@ page contentType="text/html;charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-logic" prefix="logic" %>
<%@ page
        language="java"
        import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer,
                com.topcoder.shared.dataAccess.resultSet.ResultSetContainer.ResultSetRow,
                com.topcoder.web.winformula.algorithm.CodingConstants,
                java.util.Date"
        %>
<%@ page import="com.topcoder.web.common.StringUtils" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.HashMap" %>



<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
    <title>ESPN Winning Formula Challenge :: Powered by TopCoder - Submit</title>
    <%-- Meta Tags --%>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <jsp:include page="/style.jsp">
        <jsp:param name="key" value="tc_winformula"/>
    </jsp:include>
    <jsp:include page="/script.jsp"/>
</head>

<body>
    <div id="wrapper">
    <%-- Wrapper --%>

        <jsp:include page="/nav.jsp">
        <jsp:param name="tabLev1" value="manage" />
        <jsp:param name="tabLev2" value="" />
        <jsp:param name="tabLev3" value="" />
        </jsp:include>
        
        <div id="container">
        <%-- Container --%>
        <div id="main-content">
        <%-- Main Content --%>

<% ResultSetContainer submissions = (ResultSetContainer) request.getAttribute("submissions");%>
    <SCRIPT type="text/javascript">
        function submit(module) {
            document.adminForm.<%=CodingConstants.MODULE%> = module;
            document.adminForm.submit();
        }
        function checkall(check) {
            for (i = 0; i < document.adminForm.elements.length; i++) {
                if (document.adminForm.elements[i].type == "checkbox") {
                    document.adminForm.elements[i].checked = (check == true);
                }
            }
        }
    </SCRIPT>
    <jsp:useBean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request"/>
    <form action="<jsp:getProperty name="sessionInfo" property="servletPath"/>" method="POST" name="adminForm">
        <tc-webtag:hiddenInput name="<%=CodingConstants.MODULE%>" value="AdminForceSubmit"/>
        <%
            if (!submissions.isEmpty()) {
        %>
            <tc-webtag:hiddenInput name="<%=CodingConstants.ROUND_ID%>" value="<%=submissions.getStringItem(0, "round_id")%>"/>
        <%
            }
        %>

        <table cellpadding="0" cellspacing="0" border="0" width="100%" class="statTableHolder">

            <tr><td><a href="${pageContext.request.contextPath}/?<%=CodingConstants.MODULE%>=Static&d1=adminMenu">Back to the Long Contest Admin Home</a></td></tr>

            <tr>
                <td>
                    <table cellpadding="0" cellspacing="0" border="0" width="100%" class="statTable">
                        <tr><td class="statLt" colspan="6"><a href="javascript:checkall(true);">check all</a> |
                            <a href="javascript:checkall(false);">uncheck all</a> |
                            <a href="javascript:document.adminForm.submit();">submit</a></td></tr>
                        <tr>
                            <td class="tableHeader" width="5%"></td>
                            <td class="tableHeader" width="15%">
                                <A href="<jsp:getProperty name="sessionInfo" property="servletPath"/>?<%=CodingConstants.MODULE%>=ViewAdminForceSubmit<tc-webtag:sort column="<%=submissions.getColumnIndex("handle_lower")%>" includeParams="true" excludeParams="<%=CodingConstants.MODULE%>"/>">Handle</A>
                            </td>
                            <td class="tableHeader" width="10%">
                                <A href="<jsp:getProperty name="sessionInfo" property="servletPath"/>?<%=CodingConstants.MODULE%>=ViewAdminForceSubmit<tc-webtag:sort column="<%=submissions.getColumnIndex("language_name")%>" includeParams="true" excludeParams="<%=CodingConstants.MODULE%>"/>">Language</A>
                            </td>
                            <td class="tableHeader" width="10%">
                                <A href="<jsp:getProperty name="sessionInfo" property="servletPath"/>?<%=CodingConstants.MODULE%>=ViewAdminForceSubmit<tc-webtag:sort column="<%=submissions.getColumnIndex("submission_number")%>" includeParams="true" excludeParams="<%=CodingConstants.MODULE%>"/>">Submission
                                    Number</A></td>
                            <td class="tableHeader" width="25%">
                                <A href="<jsp:getProperty name="sessionInfo" property="servletPath"/>?<%=CodingConstants.MODULE%>=ViewAdminForceSubmit<tc-webtag:sort column="<%=submissions.getColumnIndex("submission_points")%>" includeParams="true" excludeParams="<%=CodingConstants.MODULE%>"/>">Points</A>
                            </td>
                            <td class="tableHeader" width="35%">
                                <A href="<jsp:getProperty name="sessionInfo" property="servletPath"/>?<%=CodingConstants.MODULE%>=ViewAdminForceSubmit<tc-webtag:sort column="<%=submissions.getColumnIndex("status_desc")%>" includeParams="true" excludeParams="<%=CodingConstants.MODULE%>"/>">Status</A>
                            </td>
                        </tr>
                        <%
                            boolean even = true;
                        %>

                        <rsc:iterator list="<%=submissions%>" id="resultRow">
                            <%
                                StringBuffer name = new StringBuffer(20);
                                                    name.append(CodingConstants.SUBMISSION_PREFIX);
                                                    name.append(resultRow.getLongItem("coder_id"));
                                                    name.append(",");
                                                    name.append(resultRow.getLongItem("component_id"));
                                                    name.append(",");
                                                    name.append(resultRow.getLongItem("round_id"));
                                                    name.append(",");
                                                    name.append(resultRow.getLongItem("contest_id"));
                                                    name.append(",");
                                                    name.append(resultRow.getLongItem("language_id"));
                                                    name.append(",");
                                                    name.append(resultRow.getLongItem("submission_number"));
                            %>
                            <tr>
                                <td class="<%=even?"statLt":"statDk"%>">
                                    <tc-webtag:chkBox name="<%=name.toString()%>"/>
                                </td>
                                <td class="<%=even?"statLt":"statDk"%>">
                                    <tc-webtag:handle context='marathon_match' coderId='<%=resultRow.getLongItem("coder_id")%>'/>
                                </td>
                                <td class="<%=even?"statLt":"statDk"%>">
                                    <rsc:item row="<%=resultRow%>" name="language_name"/>
                                </td>
                                <td class="<%=even?"statLt":"statDk"%>">
                                    <A href="<jsp:getProperty name="sessionInfo" property="servletPath"/>/..?<%=CodingConstants.MODULE%>=ViewProblemSolution&<%=CodingConstants.ROUND_ID%>=<rsc:item name="round_id" row="<%=resultRow%>"/>&<%=CodingConstants.CODER_ID%>=<rsc:item name="coder_id" row="<%=resultRow%>"/>&<%=CodingConstants.SUBMISSION_NUMBER%>=<rsc:item name="submission_number" row="<%=resultRow%>"/>" class="statLink">
                                        <rsc:item row="<%=resultRow%>" name="submission_number"/>
                                    </A>
                                </td>
                                <td class="<%=even?"statLt":"statDk"%>">
                                    <rsc:item row="<%=resultRow%>" name="submission_points"/>
                                </td>
                                <td class="<%=even?"statLt":"statDk"%>">
                                    <rsc:item row="<%=resultRow%>" name="status_desc"/>
                                </td>
                            </tr>
                            <%even = !even;%>
                        </rsc:iterator>
                        <tr><td class="statLt" colspan="6"><a href="javascript:checkall(true);">check all</a> |
                            <a href="javascript:checkall(false);">uncheck all</a> |
                            <a href="javascript:document.adminForm.submit();">submit</a></td></tr>

                    </table>
                </TD>
            </tr>
        </table>

    </form>

        <%-- Main Content --%>
        </div>
        <%-- End Container --%>
        </div>
  
  <div id="footer">
  <%-- Footer --%>
  </div>
        
<%-- End Wrapper --%>        
</div>
</body>
</html>