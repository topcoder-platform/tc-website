<%@ page import="com.topcoder.web.codinginterface.techassess.Constants,
                 com.topcoder.web.common.BaseServlet,
                 com.topcoder.web.common.SessionInfo"%>
<%
    String tabLev1 = request.getParameter("tabLev1")==null?"":request.getParameter("tabLev1");
%>

<jsp:useBean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request" />


<table cellspacing=0 cellpadding=0 class=tabTable>
   <tr>
      <td class=logoBox rowspan=2><img src="/i/corp/screening/clientLogo.gif" alt=""/></td>
      <%-- colspan must equal # of tabs --%>
      <% if (tabLev1.equals("login")) { %>
        <td class=titleBar colspan=1><img src="/i/corp/screening/pbtcLogo.gif" alt=""/></td>
      <% } else {%>
        <td class=titleBar colspan=3><img src="/i/corp/screening/pbtcLogo.gif" alt=""/></td>
      <% }%>
      <td class=tabBarEnd align=right rowspan=2><img src="/i/corp/screening/tabBarEnd.gif" alt=""/></td>
   </tr>
   <tr>
   <% if (!tabLev1.equals("login")) { %>
      <td class=tabBar><a href="<jsp:getProperty name="sessionInfo" property="servletPath"/>?<%=Constants.MODULE%>=<%=Constants.RP_INDEX%>"><img src="/i/corp/screening/mainTab.gif" alt=""/></a></td>
   <% } %>
      <td class=tabBar><a href="<jsp:getProperty name="sessionInfo" property="servletPath"/>?<%=Constants.MODULE%>=Static&d1=help&d2=index"><img src="/i/corp/screening/helpTab.gif" alt=""/></a></td>
   <% if (!tabLev1.equals("login")) { %>
      <td class=tabBar><a href="<jsp:getProperty name="sessionInfo" property="servletPath"/>?<%=Constants.MODULE%>=<%=Constants.RP_LOGOUT%>"><img src="/i/corp/screening/logoutTab.gif" alt=""/></a></td>
   <% } %>
   </tr>
</table>
