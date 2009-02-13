<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<%
    String level1 = request.getParameter("level1")==null?"":request.getParameter("level1");
%>

            <img alt="" width="170" height="10" src="/i/spacer.gif" border="0"><br>

<!-- Review Board begins -->
<% if (level1.equals("review_board")||level1.equals("crpf")) { %>
                        
            <jsp:include page="calendar.jsp"/>
            <img alt="" width="1" height="10" src="/i/spacer.gif" border="0"><br>
            <a href="http://<%=ApplicationServer.SERVER_NAME%>/?t=tournaments&c=tco03_overview"><img src="/i/promos/tco03/promo_2003_open_small.gif" alt="2003 TopCoder Open" width="170" height="117" border="0"></a><br>
            <img alt="" width="1" height="10" src="/i/spacer.gif" border="0"><br>
                        
<!-- Review Board ends -->

    <% } else { %>
    
                &nbsp;

    <% } %>
 
