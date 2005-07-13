<%@  page
  language="java"
  import="com.topcoder.common.web.data.Navigation,
  com.topcoder.common.web.data.CoderRegistration
  ,com.topcoder.common.web.util.Conversion,
          com.topcoder.web.common.model.CoderSessionInfo"%>

<%
try {
  Navigation n = (Navigation) session.getAttribute("navigation");
  CoderSessionInfo info = n.getSessionInfo();
    %>
     <A CLASS="<%=Conversion.checkNull(request.getParameter("class"))%>" HREF="mailto:memberphotos@topcoder.com?subject=<%=info.getActivationCode()%>%20|%20[%20<%=info.getHandle()%>%20]%20|%20<%=info.getUserId()%>%20<%=info.hasImage()?"RE":""%>SUBMIT%20IMAGE:%20PLEASE%20DO%20NOT%20CHANGE%20SUBJECT"> Click here to <%=info.hasImage()?"re":""%>send your photo</A>
    <%
} catch ( Exception e ) {
  e.printStackTrace();
}
%>
