<%@ page import="com.topcoder.web.codinginterface.techassess.Constants,
                 com.topcoder.web.common.BaseServlet,
                 com.topcoder.web.common.SessionInfo"%>
<%
    String tabLev1 = request.getParameter("tabLev1")==null?"":request.getParameter("tabLev1");
%>

<jsp:useBean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request" />

<%
    System.out.println("path: " + ((SessionInfo)request.getAttribute(BaseServlet.SESSION_INFO_KEY)).getServletPath());
%>


<table cellspacing=0 cellpadding=0 class=tabTable>
   <tr>
      <td class=logoBox rowspan=2><img src="/i/corp/screening/clientLogo.gif" alt=""/></td>
      <%-- colspan must equal # of tabs --%>
      <td class=titleBar colspan=4><img src="/i/corp/screening/pbtcLogo.gif" alt=""/></td>
      <td class=tabBarEnd align=right rowspan=2><img src="/i/corp/screening/tabBarEnd.gif" alt=""/></td>
   </tr>
   <tr>
      <td class=tabBar><a href="/mockup/directions.jsp"><img src="/i/corp/screening/mainTab.gif" alt=""/></a></td>
      <td class=tabBar><a href="/mockup/help.jsp"><img src="/i/corp/screening/helpTab.gif" alt=""/></a></td>
      <td class=tabBar><a href="<jsp:getProperty name="sessionInfo" property="servletPath"/>?<%=Constants.MODULE%>=<%=Constants.RP_LOGOUT%>"><img src="/i/corp/screening/logoutTab.gif" alt=""/></a></td>
   </tr>
</table>
