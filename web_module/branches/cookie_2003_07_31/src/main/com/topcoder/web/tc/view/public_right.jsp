<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<%
    String level1 = request.getParameter("level1")==null?"":request.getParameter("level1");
    String level2 = request.getParameter("level2")==null?"":request.getParameter("level2");
%>

            <img alt="" width="170" height="10" src="/i/spacer.gif" border="0"><br>

<!-- Review Board begins -->
<% if (request.getServletPath().indexOf("review_board")>-1) { %>
                        
            <jsp:include page="calendar.jsp"/>
            <img alt="" width="1" height="10" src="/i/spacer.gif" border="0"><br>
            <a href="http://<%=ApplicationServer.SERVER_NAME%>/?t=tournaments&c=tco03_overview"><img src="/i/promos/tco03/promo_2003_open.gif" alt="2003 TopCoder Open" width="170" height="195" border="0"></a><br>
            <img alt="" width="1" height="10" src="/i/spacer.gif" border="0"><br>
                        
<!-- Review Board ends -->

    <% } else { %>
    
                &nbsp;

    <% } %>
 
