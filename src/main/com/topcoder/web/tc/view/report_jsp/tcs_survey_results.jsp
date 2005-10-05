<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<%@ page import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer,
                 com.topcoder.shared.dataAccess.resultSet.ResultSetContainer.ResultSetRow,
                 com.topcoder.web.tc.Constants,
                 com.topcoder.shared.util.ApplicationServer,
                 com.topcoder.web.common.StringUtils,
                 com.topcoder.web.tc.Constants,
                 java.util.Iterator"%>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<jsp:useBean id="sessionInfo" scope="request" class="com.topcoder.web.common.SessionInfo"/>
<% ResultSetContainer results = (ResultSetContainer)request.getAttribute("results"); %>
<% ResultSetContainer resultsFreeform = (ResultSetContainer)request.getAttribute("resultsFreeform"); %>
<% String componentName = (String)request.getAttribute("componentName"); %>
<% String currQ = ""; %>
<% int qNum = 0; %>
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
<%-- Left Column Begins--%>
        <td width="180">
            <jsp:include page="../includes/global_left.jsp">
                <jsp:param name="level1" value="development"/>
                <jsp:param name="level2" value="components"/>
            </jsp:include>
        </td>
<%-- Left Column Ends --%>

<%-- Gutter Begins --%>
        <td width="15"><img src="/i/clear.gif" width="15" height="1" border="0"/></td>
<%-- Gutter Ends --%>

<%-- Center Column Begins --%>
        <td width="100%" align="center">

            <img src="/i/clear.gif" alt="" width="1" height="20" border="0"/><br/>

<%-- Title --%>

            <table cellspacing="0" class="formFrame" align="center" width="530">
                <tr>
                    <td class="projectTitles" nowrap="nowrap">
                        Survey Results - 
                        <%  if (componentName != null) { %>
                            <%=componentName%>
                        <%  } else { %>
                            All Projects
                        <% } %>
                    </td>
                </tr>
                <tr>
                    <td class="projectHeaders" align="left">Overview</td>
                </tr>
            </table>

<%-- Overview --%>
                        <p>
                        <%  Iterator itResults = results.iterator();
                            while (itResults.hasNext()) {
                                ResultSetRow row = (ResultSetRow)itResults.next(); %>
                                <%  if (!currQ.equals(row.getStringItem("question_text"))) {
                                        if (qNum != 0) { %></table><% } %>
                                    <%  currQ = row.getStringItem("question_text"); qNum++; %>
                                        <table class="bodyText" cellspacing="0" cellpadding="0" border="0" width="530">
                                            <tr>
                                                <td class="bodyText" colspan=2><%=currQ%></td>
                                            </tr>
                                <%  } %>
                                <tr>
                                    <td class="bodyText"><%=row.getStringItem("answer_text")%></td>
                                    <td class="bodyText"><%=row.getIntItem("cnt")%></td>
                                </tr>
                        <%  } %>
                        <%  if (results.getRowCount() > 0) { %></table><% } %>
                        </p>
                        
<%-- Freeform Responses --%>
            <table cellspacing="0" class="formFrame" align="center" width="530">
                <tr>
                    <td class="projectHeaders" align="left">Freeform Responses</td>
                </tr>
            </table>
            
            <p>
            <table border="0" cellspacing="0" cellpadding="0" align="center" width="530">
                <tr valign="top">
                    <td class="bodyText">
						<%  currQ = ""; 
						    qNum = 0; %>
						<p class="noSpListTitle">
						<%  Iterator itResultsFreeform = resultsFreeform.iterator();
						    while (itResultsFreeform.hasNext()) {
						        ResultSetRow row = (ResultSetRow)itResultsFreeform.next(); %>
						        <%  if (!currQ.equals(row.getStringItem("question_text"))) {
						                if (qNum != 0) { %></ul><% } %>
						            <%  currQ = row.getStringItem("question_text"); qNum++; %>
						                <%=currQ%><ul class="noSpList">     
						        <%  } %>
						        <%  String responseText = StringUtils.checkNull(row.getStringItem("response_text"));
						            if (!responseText.equals("")) { %>
						                <li><%=responseText%></li>
						        <%  } %>
						<%  } %>
						<%  if (resultsFreeform.getRowCount() > 0) { %></ul><% } %>
						</p>
                    </td>
                </tr>
            </table>
            </p>
            
            <p>
            Choose a project:<br/>
            <form name="form1" method="post" action="<jsp:getProperty name="sessionInfo" property="servletPath"/>">
                <select size="1" name="<%=Constants.PROJECT_ID%>" id="<%=Constants.PROJECT_ID%>">
                        <option value="" selected>All Projects</option>
                </select>
                <input type="hidden" name="module" value="TCSSurveyResults">
                <input name="Search" value="Search" type="submit" alt="Search" onclick="">
            </form>
            </p>

            <p><br/></p>
        </td>
<%-- Center Column Ends --%>

<%-- Gutter --%>
         <td width="15"><img src="/i/clear.gif" width="15" height="1" border="0"></td>
<%-- Gutter Ends --%>

<%-- Right Column Begins --%>
         <td width="180">
            <jsp:include page="right.jsp"/>
         </td>
<%-- Right Column Ends --%>

<%-- Gutter --%>
         <td width="2"><img src="/i/clear.gif" width="2" height="1" border="0"></td>
<%-- Gutter Ends --%>

    </tr>
</table>

<jsp:include page="../foot.jsp" />

</body>

</html>

