<%@  page
  language="java"
  import="com.topcoder.common.web.data.Navigation,
  com.topcoder.common.web.data.CoderRegistration
  ,com.topcoder.common.web.util.Conversion"%>

<%
try {
  Navigation n = (Navigation) session.getAttribute("navigation");
  if ( n.getUser().getUserTypeDetails().containsKey("Coder") ) { 
    CoderRegistration coderReg = (CoderRegistration) n.getUser().getUserTypeDetails().get("Coder");
    %>
     <A CLASS="<%=Conversion.checkNull(request.getParameter("class"))%>" HREF="mailto:memberphotos@topcoder.com?subject=<%=coderReg.getActivationCode()%> | [ <%=n.getUser().getHandle()%> ] | <%=n.getUser().getUserId()%> <%=coderReg.getHasImage()?"RE":""%>SUBMIT IMAGE: PLEASE DO NOT CHANGE SUBJECT"> Click here to <%=coderReg.getHasImage()?"re":""%>send your photo</A>
    <%
  }
} catch ( Exception e ) {
  e.printStackTrace();
}
%>
