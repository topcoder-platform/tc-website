<%@ page import="com.topcoder.web.tc.controller.legacy.pacts.common.*" %>
<%@ page import="javax.naming.*" %>
<%@ page import="javax.rmi.*" %>
<%@ page import="com.topcoder.web.ejb.pacts.*" %>

<%

        Context initial = new InitialContext();
        Object objref = initial.lookup(PactsClientServicesHome.class.getName());
        PactsClientServicesHome home = (PactsClientServicesHome) 
            PortableRemoteObject.narrow(objref, PactsClientServicesHome.class);

        PactsClientServices  ejb = (PactsClientServices) home.create();
        
        ejb.addPayment(new ProblemTestingPayment(7545675, 300, 9998));
        ejb.addPayment(new ProblemTestingPayment(7545675, 400, "private round"));
        ejb.addPayment(new ProblemTestingPayment(7545675, 500, ""));        
        %>        