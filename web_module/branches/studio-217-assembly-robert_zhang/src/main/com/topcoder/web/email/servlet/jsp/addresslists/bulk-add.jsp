<%@ page import="com.topcoder.web.email.servlet.*" %>
<%@ page errorPage="../error.jsp" %>
<%@ taglib uri="email-taglib.tld" prefix="email"%>
<jsp:useBean id="AddressList" scope="session" class="com.topcoder.web.email.bean.AddressListForm" />

<html>
<head>
	<title>Mailing list members</title>
</head>
<body>

<jsp:include page="../header.jsp" />
<jsp:include page="../js/task-js.jsp" />

<p class="bodyTextBig"><b>Bulk member entry</b></p>
<p class="bodyText">
	<jsp:useBean id="Error" scope="request" class="java.util.ArrayList" />

	<font color=#ff0000>
	<ul>
	<email:iterator id="errorMessage" collection="<%=Error%>">
		<li><%=errorMessage%>
	</email:iterator>
	</ul>
	</font>
</p>

<form action="<%=response.encodeURL(EmailConstants.ALIAS)%>" method="post" >
	<input type="hidden" name="<%=EmailConstants.TASK%>" value="<%=EmailConstants.ADDRESSLIST_TASK%>">
	<input type="hidden" name="<%=EmailConstants.STEP%>" value="<%=EmailConstants.ADDRESSLIST_BULK_ADD%>">
        <p class="bodyText">
	Please enter one member per line.  Each value should be separated by a single 'space'.<br>
	Values should be entered in the following order (from left to right):<br>
	<email:memberDataFieldValueIterator id="fieldValue" fields="<%=AddressList.getFields()%>">
		[<%=fieldValue.getField()%>]&nbsp;
	</email:memberDataFieldValueIterator>
	</p>
	<textarea name="bulk" cols="80" rows="20"><%=(String)request.getAttribute(EmailConstants.INVALID_ROWS)%></textarea>
	<p>
	<input type="submit" value="add">

</form>
<p>
<a href="javascript:taskSubmit('<%=EmailConstants.ADDRESSLIST_TASK%>', '<%=EmailConstants.ADDRESSLIST_SHOW_ADD_MEMBER%>', '');">
[individual entry mode]
</a>
<p>
<a href="javascript:taskSubmit('<%=EmailConstants.ADDRESSLIST_TASK%>', '<%=EmailConstants.ADDRESSLIST_LIST%>', '');">
[done]</a>
<p>
<hr/>

<jsp:include page="member-list.jsp" />

<p>

<jsp:include page="../footer.jsp" />



</body>
</html>
