<%@ page import="com.topcoder.web.email.servlet.*, com.topcoder.web.email.bean.*" %>
<%@ page errorPage="../error.jsp" %>
<jsp:include page="../js/validate-js.jsp" />
<jsp:useBean id="EmailTemplate" scope="session" class="com.topcoder.web.email.bean.EmailTemplateForm" />


<SCRIPT Language="javascript"> <!--

function validate()
{
	msg = checkEmpty('Name', document.forms.frmTemplate.name.value);
	if (msg != "") {
		alert(msg);
		frmTemplate.name.select();
		return false;
	}
	msg = checkEmpty('Template body', document.forms.frmTemplate.template.value);
	if (msg != "") {
		alert(msg);
		frmTemplate.template.select();
		return false;
	}

	frmTemplate.submit();
}

//--> </SCRIPT>



	<%@ taglib uri="email-taglib.tld" prefix="email"%>

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
	Name: <input type="text" size=40 maxlength=100 name="name" value="<jsp:getProperty name="EmailTemplate" property="name"/>"/>
	</p>
        <p class="bodyText">
	Group:
	<email:groupSelect name="group"
	groupMap="<%=TemplateTask.getTemplateGroupMap()%>"
	selectedValue="<%=EmailTemplate.getGroup()%>"/>
	</p>
        <p class="bodyText">
	Template:<br>
	<textarea name="template" cols="80" rows="20"><jsp:getProperty name="EmailTemplate" property="template" /></textarea>
        </p>;
