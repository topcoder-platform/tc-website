<%@ page import="com.topcoder.apps.review.projecttracker.*" %> 
<%@ page import="javax.rmi.*" %>
<%@ page import="java.util.*" %>
<%@ page import="javax.ejb.*" %>
<%@ page import="javax.naming.*" %>


<%
            Context homeBindings = new InitialContext();
            ProjectTrackerHome ptHome = (ProjectTrackerHome) PortableRemoteObject.narrow(
                    homeBindings.lookup(ProjectTrackerHome.EJB_REF_NAME),
                    ProjectTrackerHome.class);
            ProjectTracker pt = ptHome.create();
            long uid = Long.parseLong(request.getParameter("uid"));
            long pid = Long.parseLong(request.getParameter("pid"));
            pt.userInquiry (uid,pid);
%>
It may have worked...
