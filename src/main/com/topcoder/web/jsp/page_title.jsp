<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@  page
  contentType="text/html"
%>
<%@ page import="com.topcoder.web.common.StringUtils"%>

<%
  String image = StringUtils.checkNull ( request.getParameter("image") );
%>

<table cellspacing="0" cellpadding="0" class="pageTitleTable">
    <tr>
        <td width="100%" class="pageTitle">


            <c:choose>
                <c:when test="${isNewStyle}">
                    <%=imageName%>
                </c:when>
                <c:otherwise>
                    <img border="0" src="/i/header_<%=image%>.gif" alt="<%=image%>"/>
                </c:otherwise>
            </c:choose>



        </td>
        <td align="right" class="pageSubtitle">&#160;<%=StringUtils.checkNull(request.getParameter("title"))%></td>
    </tr>
</table>

