<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ taglib uri="/rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="/tc.tld" prefix="tc" %>
<%@ taglib uri="/tc-webtags.tld" prefix="tc-webtag" %>
<jsp:useBean id="problemRatingQuestions" scope="request" class="java.util.List" />
<jsp:useBean id="sessionInfo" scope="request" class="com.topcoder.web.common.SessionInfo"/>
<html>
<head>
<title>TopCoder Problem Rating Questions - <%= request.getAttribute("problemName") %></title>
<jsp:include page="../script.jsp"/>
</head>
<body>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr valign="top">

<!-- Gutter Begins -->
        <td width="10"><img src="/i/clear.gif" width="10" height="1"></td>
<!-- Gutter Ends -->

<!-- Center Column Begins -->
<td class="bodyText" WIDTH="100%"><img src="/i/clear.gif" width="400" height="1" vspace="5" border="0"><br>
        <jsp:include page="../body_top.jsp" >
           <jsp:param name="image" value="problem_rating"/>
           <jsp:param name="image1" value="white"/>
           <jsp:param name="title" value=""/>
        </jsp:include>

<p class="header">Problem:&nbsp;<%= request.getAttribute("problemName") %></p>
<tc-webtag:errorIterator id="err" name="problemRating"><%=err%><br/></tc-webtag:errorIterator>
<form name="ratings" action="<jsp:getProperty name="sessionInfo" property="ServletPath"/>" method="GET">
<input type="hidden" name="module" value="SubmitRatings">
<input type="hidden" name="pid" value="<%= request.getParameter("pid") %>">
    <table BORDER="0" CELLSPACING="1" CELLPADDING="5" WIDTH="100%">
        <tr><td class="bodyTextBig">Question</td>
            <td class="bodyTextBig">Description</td>
            <% for(int i = 1; i<=10; i++){ %>
                <td class="bodyTextBig" align="center">
                    <%=i%>
                </td>
            <% } %>
        </tr>
        <tc:problemRatingIterator list="<%=problemRatingQuestions%>" id="quest">
        <tr>
            <td class="bodyText">
                <jsp:getProperty name="quest" property="question"/>
            </td>
            <td class="bodyText" width="100%"><jsp:getProperty name="quest" property="questionDesc"/></td>
            <tc:counter min="1" max="10" inc="1" id="rating">
            <td valign="top">
                <% boolean checked = rating.equals(request.getParameter("q"+quest.getID())); %>
                <input type="radio" name="q<jsp:getProperty name="quest" property="ID"/>" value="<%= rating %>" <%=checked?"CHECKED":""%>>
            </td>
            </tc:counter>
        </tr>
        </tc:problemRatingIterator>
        <tr><td colspan="2"></td>
        <td align="center" colspan="10" nowrap>
            <a href="javascript:document.ratings.submit()"><img src="/i/submit.gif" width="60" height="18" border="0"></a>
            <img src="/i/clear.gif" width="10" height="18" border="0">
            <% if (request.getAttribute("showResults")!=null&&request.getAttribute("showResults").equals("true")) { %>
                <a href="/tc?module=ProblemRatingResults&pid=<%= request.getParameter("pid") %>"><img src="/i/results.gif" width="60" height="18" border="0"></a>
            <% } %>
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
