<%@ page import="com.topcoder.web.email.servlet.*, com.topcoder.web.email.bean.*" %>
<%@ page errorPage="../error.jsp" %>
<jsp:include page="../js/validate-js.jsp" />
<jsp:useBean id="AddressList" scope="session" class="com.topcoder.web.email.bean.AddressListForm" />

<SCRIPT Language="javascript"> <!--

function validate()
{
	msg = checkEmpty('Name', document.forms.frmList.name.value);
	if (msg != "") {
		alert(msg);
		frmList.name.select();
		return false;
	}

	frmList.submit();
}

//--> </SCRIPT>

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

	<p class="bodyText">
	Name: <input type="text" size=40 maxlength=100 name="name" value="<jsp:getProperty name="AddressList" property="name"/>"/>
	</p>
	<p class="bodyText">
	Group:
	<email:groupSelect name="group"
	groupMap="<%=AddressListTask.getAddressListGroupMap()%>"
	selectedValue="<%=AddressList.getGroup()%>"/>
	</p>
	<p class="bodyText">
	Member data fields:
	</p>
	<table>
	<email:memberDataFieldNameIterator id="fieldValue" fields="<%=AddressList.getFields()%>" maxNumFields="<%=EmailConstants.ADDRESSLIST_NUM_FIELDS%>">
		<tr>
		<td class="bodyText">Field: 
		</td>
		<td class="bodyText"><input type="text" size="30" name="<%=fieldValue.getField()%>" value="<%=fieldValue.getValue()%>">
		</td>
		</tr>
	</email:memberDataFieldNameIterator>
	</table>
