<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@  page
  contentType="text/html"
%>
<%@ page import="com.topcoder.web.common.StringUtils"%>

<%
  String image = StringUtils.checkNull ( request.getParameter("image") );
  String imageName = (Character.toUpperCase(image.charAt(0)) + image.substring(1)).trim();

  if(imageName.equalsIgnoreCase("Long_comps_topcoder")) {
      imageName = "Marathon Match";
  } else if(imageName.equalsIgnoreCase("Statistics_w")) {
      imageName = "Statistics";
  } else if(imageName.equalsIgnoreCase("algo_tut")) {
      imageName = "Algorithm Tutorials";
  } else if(imageName.equalsIgnoreCase("soft_tut")) {
      imageName = "Software Tutorials";
  } else if(imageName.equalsIgnoreCase("mm_tut")) {
      imageName = "Marathon Match Tutorials";
  } else if(imageName.toLowerCase().indexOf("digital_run") != -1) {
      imageName = "Digital Run";
  }

%>

<table cellspacing="0" cellpadding="0" class="pageTitleTable">
    <tr>
        <td width="100%" class="pageTitle">


            <c:choose>
                <c:when test="${not empty isNewStyle && isNewStyle}">
                    <%--<%=imageName%>--%>
                    <img border="0" src="/i/header_<%=image%>.gif" alt="<%=image%>"/>
                </c:when>
                <c:otherwise>
                    <img border="0" src="/i/header_<%=image%>.gif" alt="<%=image%>"/>
                </c:otherwise>
            </c:choose>


        </td>
        <td align="right" class="pageSubtitle">&#160;<%=StringUtils.checkNull(request.getParameter("title"))%></td>
    </tr>
</table>

