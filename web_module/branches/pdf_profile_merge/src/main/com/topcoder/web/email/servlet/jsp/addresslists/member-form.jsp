<%@ page import="com.topcoder.web.email.servlet.*" %>
<%@ page errorPage="../error.jsp" %>
<jsp:useBean id="AddressList" scope="session" class="com.topcoder.web.email.bean.AddressListForm" />
<jsp:useBean id="MemberData" scope="session" class="com.topcoder.web.email.bean.MemberData" />

<%@ taglib uri="/email-taglib.tld" prefix="email"%>
	<jsp:useBean id="Error" scope="request" class="java.util.ArrayList" />

        <p class="bodyText">
	<font color=#ff0000>
	<ul>
	<email:iterator id="errorMessage" collection="<%=Error%>">
		<li><%=errorMessage%>
	</email:iterator>
	</ul>
	</font>
        </p>

	<input type="hidden" name="<%=EmailConstants.TASK%>" value="<%=EmailConstants.ADDRESSLIST_TASK%>">

	<table cellpadding=2>
		<email:memberDataFieldValueIterator id="fieldValue" fields="<%=AddressList.getFields()%>" memberData="<%=MemberData%>">
			<tr>
			<td class="bodyText"><%=fieldValue.getField()%>: </td>
			<td class="bodyText"><input type="text" size="30" name="<%=EmailConstants.FIELD_PREFIX%><%=fieldValue.getField()%>" value="<%=fieldValue.getValue()%>"></td>
			</tr>
		</email:memberDataFieldValueIterator>
	</table>
