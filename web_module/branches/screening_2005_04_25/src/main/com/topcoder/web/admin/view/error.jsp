<%@ page import="com.topcoder.web.common.BaseServlet"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/REC-html40/loose.dtd">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" >
<jsp:include page="top.jsp"/>

<jsp:include page="left.jsp"/>

<%=(String)request.getAttribute(BaseServlet.MESSAGE_KEY)%>