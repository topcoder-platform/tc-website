<%@  page
  language="java"
  import="com.topcoder.common.web.data.Navigation,
  com.topcoder.common.web.data.CoderRegistration
  ,com.topcoder.common.web.util.Conversion,
          com.topcoder.web.tc.model.CoderSessionInfo"%>

<%
try {
  Navigation n = (Navigation) session.getAttribute("navigation");
  CoderSessionInfo info = n.getSessionInfo();
    %>
     <A CLASS="<%=Conversion.checkNull(request.getParameter("class"))%>" HREF="mailto:memberphotos@topcoder.com?subject=<%=info.getActivationCode()%> | [ <%=info.getHandle()%> ] | <%=info.getUserId()%> <%=info.hasImage()?"RE":""%>SUBMIT IMAGE: PLEASE DO NOT CHANGE SUBJECT"> Click here to <%=info.hasImage()?"re":""%>send your photo</A>
    <%
} catch ( Exception e ) {
  e.printStackTrace();
}
%>
