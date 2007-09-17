<%@ page import="com.topcoder.web.common.tag.ListSelectTag" %> 

<%
    java.util.List paymentMethods = new java.util.ArrayList();
    paymentMethods.add(new ListSelectTag.Option("Visa", "Visa"));
    paymentMethods.add(new ListSelectTag.Option("MC", "Master Card"));
    paymentMethods.add(new ListSelectTag.Option("AMEX", "American Express"));
    paymentMethods.add(new ListSelectTag.Option("Discover", "Discover"));

%>