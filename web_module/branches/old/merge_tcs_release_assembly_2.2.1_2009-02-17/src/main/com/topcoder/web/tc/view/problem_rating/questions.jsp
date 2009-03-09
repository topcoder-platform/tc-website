<%@ page import="java.util.List"%>
<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<% List problemRatingQuestions = (List)request.getAttribute("problemRatingQuestions");%>
<jsp:useBean id="sessionInfo" scope="request" class="com.topcoder.web.common.SessionInfo"/>
<html>
<head>
<title>TopCoder Problem Rating Questions - <%= request.getAttribute("problemName") %></title>
<jsp:include page="/script.jsp"/>
<jsp:include page="/style.jsp">
<jsp:param name="key" value="tc_main"/>
</jsp:include>
</head>
<body>

<table width="100%" border="0" cellpadding="0" cellspacing="0" class="bodyText">
    <tr valign="top">

<!-- Gutter Begins -->
        <td width="10"><img src="/i/clear.gif" width="10" height="1"></td>
<!-- Gutter Ends -->

<!-- Center Column Begins -->
<td class="bodyText" WIDTH="100%">
   <img src="/i/clear.gif" width="500" height="1" vspace="5" border="0"><br>
        <jsp:include page="../body_top.jsp" >
           <jsp:param name="image" value="problem_rating"/>
           <jsp:param name="image1" value="white"/>
           <jsp:param name="title" value=""/>
        </jsp:include><br/>
    <img src="/i/clear.gif" width="500" height="1" vspace="5" border="0"><br/>

<tc-webtag:errorIterator id="err" name="problemRating"><%=err%><br/></tc-webtag:errorIterator>
<form name="ratings" action="<jsp:getProperty name="sessionInfo" property="servletPath"/>" method="GET">
<input type="hidden" name="module" value="SubmitRatings">
<input type="hidden" name="pid" value="<%= request.getParameter("pid") %>">
    <table BORDER="0" CELLSPACING="0" CELLPADDING="6" WIDTH="500" align="center" class="sidebarBox">
        <tr><td class="testTableTitleSmall" valign="top" align="center" colspan="11"><font size="3">Problem:&nbsp;<%= request.getAttribute("problemName") %></font</td></tr>
        <tr><td class="sidebarTitle" valign="top">Question</td>
            <% for(int i = 1; i<=10; i++){ %>
                <td class="sidebarTitle" align="center" valign="top">
                    <%=i%>
                </td>
            <% } %>
        </tr>
        <tc:problemRatingIterator list="<%=problemRatingQuestions%>" id="quest">
        <tr>
            <td class="sidebarText" valign="top">
                <b><jsp:getProperty name="quest" property="question"/>:</b><br/>
                <jsp:getProperty name="quest" property="questionDesc"/></td>
            <tc:counter min="1" max="10" inc="1" id="rating">
            <td valign="top" class="sidebarText">
                <% boolean checked = rating.equals(request.getParameter("q"+quest.getID())); %>
                <input type="radio" name="q<jsp:getProperty name="quest" property="ID"/>" value="<%= rating %>" <%=checked?"CHECKED":""%>>
            </td>
            </tc:counter>
        </tr>
        </tc:problemRatingIterator>
        <tr>
        <td align="center" colspan="11" nowrap class="sidebarTitle" valign="top">
            <% if (request.getAttribute("showResults")!=null&&request.getAttribute("showResults").equals("true")) { %>
                <a href="/tc?module=ProblemRatingResults&pid=<%= request.getParameter("pid") %>"><img src="/i/results.gif" width="60" height="18" border="0"></a>
            <% } %>
            <img src="/i/clear.gif" width="10" height="18" border="0">
            <a href="javascript:document.ratings.submit()"><img src="/i/submit.gif" width="60" height="18" border="0"></a>
        </td>
        </tr>
      </table>
      </form>
      </td>
<!-- Center Column Ends -->

<!-- Gutter -->
      <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<!-- Gutter Ends -->

    </tr>
</table>
</body>
</html>
