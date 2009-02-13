<%@ page
         contentType="text/html; charset=ISO-8859-1"
         import="com.topcoder.web.common.BaseServlet"
         autoFlush="false"
         buffer="64kb"
%>
<%--<%@ taglib uri="/tc-webtags.tld" prefix="tc-webtag" %>--%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<jsp:include page="top.jsp"/>

<jsp:include page="left.jsp"/>

<%=(String)request.getAttribute(BaseServlet.MESSAGE_KEY)%>