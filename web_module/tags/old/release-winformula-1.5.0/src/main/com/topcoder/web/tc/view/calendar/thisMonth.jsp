<%@ page import="java.util.Date"%>
<%@ page import="java.text.SimpleDateFormat"%>

<%--

NOTE TO GD PEOPLE - This code believe is going to figure out the right page to show here so that you don't have to
copy it over anymore.

--%>


<jsp:forward page="<%=new SimpleDateFormat(\"MMM_yy\").format(new Date()).toLowerCase()+\".jsp\"%>"/>