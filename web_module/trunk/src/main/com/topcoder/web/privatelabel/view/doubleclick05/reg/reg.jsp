<%@ page contentType="text/html; charset=ISO-8859-1" %>
<%@ page import="com.topcoder.web.privatelabel.Constants,
                 com.topcoder.shared.dataAccess.resultSet.ResultSetContainer" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib uri="/privatelabel.tld" prefix="pl" %>
<jsp:usebean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request" />
<jsp:usebean id="regInfo" class="com.topcoder.web.privatelabel.model.FullRegInfo" scope="session" />
<jsp:usebean id="questionList" class="java.util.List" scope="request" />
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>

<title>DoubleClick</title>

<jsp:include page="../../script.jsp" />
<jsp:include page="../../nocache.jsp"/>

<link type="text/css" rel="stylesheet" href="/css/doubleclick.css"/>

</head>
<body align="center">

<jsp:include page="../links.jsp" >
    <jsp:param name="tabLev1" value="internal"/>
   <jsp:param name="tabLev2" value="registration"/>
</jsp:include>
<script language="javascript">
var assignmentArray = new Array();
assignmentArray[1] = 26 // 'Beijing'
assignmentArray[2] = 26 // 'Birmingham'
assignmentArray[3] = 27 // 'Broomfield'
assignmentArray[4] = 24 // 'Chicago'
assignmentArray[5] = 26 // 'Dublin'
assignmentArray[6] = 26 // 'Dusseldorf'
assignmentArray[7] = 26 // 'Frankfurt'
assignmentArray[8] = 26 // 'Hong Kong'
assignmentArray[9] = 26 // 'Levallois (Paris)'
assignmentArray[10] = 26 // 'London'
assignmentArray[11] = 26 // 'Madrid'
assignmentArray[12] = 26 // 'Morrisville'
assignmentArray[13] = 25 // 'New York'
assignmentArray[14] = 27 // 'San Diego'
assignmentArray[15] = 27 // 'San Mateo'
assignmentArray[16] = 24 // 'Schaumberg'
assignmentArray[17] = 26 // 'Seoul'
assignmentArray[18] = 26 // 'Sydney'
assignmentArray[19] = 26 // 'Teddington'
assignmentArray[20] = 27 // 'Thornton'
assignmentArray[21] = 26 // 'Tokyo'
assignmentArray[22] = 24 // 'Toronto'
assignmentArray[23] = 28 // 'Other'

function changeField() {
    var newVal = assignmentArray[document.regForm.demog_1[document.regForm.demog_1.selectedIndex].value];
    for(var i =0; i < document.regForm.demog_1.length; i++) {
        if(document.regForm.demog_2[i].value == newVal) {
            document.regForm.demog_2[i].selected = true;
            return;
        }
    }
}

</script>
<table width="750" align="center" valign="top" cellpadding="0" cellspacing="0">
	<tr>
		<td class="dc_headerPic">
	      <img src="/i/events/doubleclick/image1.gif" border="0" width="163" height="180"/>
	  	</td>
		<td class="dc_bodyText">
         <p class="pageTitle">Registration</p>
         <p>Registration is open until 6:00 PM on Tuesday, Match 1st, 2005.</p>

        <form action="<jsp:getProperty name="sessionInfo" property="ServletPath"/>" method="POST" name="regForm">
            <input type="hidden" name="<%=Constants.MODULE_KEY%>" value="<%=Constants.DC05_REG_CONFIRM%>"/>
            <input type="hidden" name="<%=Constants.COMPANY_ID%>" value="<jsp:getProperty name="regInfo" property="CompanyId"/>"/>
            <input type="hidden" name="<%=Constants.EVENT_ID%>" value="<jsp:getProperty name="regInfo" property="EventId"/>"/>

             <table width="100%" cellpadding="0" cellspacing="3" border="0">
                <tr>
                   <td class="dc_errorText" colspan="2">
                        <tc-webtag:errorIterator id="err" name="<%=Constants.HANDLE%>"><%=err%><br/></tc-webtag:errorIterator>
                   </td>
                </tr>
                <tr>
                   <td class="dc_regTableQuestion">Handle</td>
                   <td class="dc_regTableAnswer"><tc-webtag:textInput name="<%=Constants.HANDLE%>"  size="15" maxlength="<%=Constants.MAX_HANDLE_LENGTH%>" editable="<%=regInfo.isNew()%>"/></td>
                </tr>
                <tr>
                   <td class="dc_errorText" colspan="2">
                        <tc-webtag:errorIterator id="err" name="<%=Constants.FIRST_NAME%>"><%=err%><br/></tc-webtag:errorIterator>
                   </td>
                </tr>
                <tr>
                   <td class="dc_regTableQuestion">First Name</td>
                   <td class="dc_regTableAnswer"><tc-webtag:textInput name="<%=Constants.FIRST_NAME%>"  size="15" maxlength="50"/>
                </tr>
                <tr>
                   <td class="dc_errorText" colspan="2">
                        <tc-webtag:errorIterator id="err" name="<%=Constants.LAST_NAME%>"><%=err%><br/></tc-webtag:errorIterator>
                   </td>
                </tr>
                <tr>
                   <td class="dc_regTableQuestion">Last Name</td>
                   <td class="dc_regTableAnswer"><tc-webtag:textInput name="<%=Constants.LAST_NAME%>"  size="15" maxlength="50"/>
                </tr>
                <tr>
                   <td class="dc_errorText" colspan="2">
                        <tc-webtag:errorIterator id="err" name="<%=Constants.PASSWORD%>"><%=err%><br/></tc-webtag:errorIterator>
                   </td>
                </tr>
                <tr>
                   <td class="dc_regTableQuestion">Password</td>
                   <td class="dc_regTableAnswer"><tc-webtag:textInput name="<%=Constants.PASSWORD%>"  passw="true" size="15" maxlength="<%=Constants.MAX_PASSWORD_LENGTH%>"/> (<%=Constants.MIN_PASSWORD_LENGTH%> to <%=Constants.MAX_PASSWORD_LENGTH%> characters)
                </tr>
                <tr>
                   <td class="dc_errorText" colspan="2">
                        <tc-webtag:errorIterator id="err" name="<%=Constants.PASSWORD_CONFIRM%>"><%=err%><br/></tc-webtag:errorIterator>
                   </td>
                </tr>
                <tr>
                   <td class="dc_regTableQuestion">Confirm Password</td>
                   <td class="dc_regTableAnswer"><tc-webtag:textInput name="<%=Constants.PASSWORD_CONFIRM%>"  passw="true" size="15" maxlength="<%=Constants.MAX_PASSWORD_LENGTH%>"/>
                </tr>
                <tr>
                   <td class="dc_errorText" colspan="2">
                        <tc-webtag:errorIterator id="err" name="<%=Constants.EMAIL%>"><%=err%><br/></tc-webtag:errorIterator>
                   </td>
                </tr>
                <tr>
                   <td class="dc_regTableQuestion">Email</td>
                   <td class="dc_regTableAnswer"><tc-webtag:textInput name="<%=Constants.EMAIL%>"  size="30" maxlength="<%=Constants.MAX_EMAIL_LENGTH%>"/>
                   </td>
                </tr>

                <pl:questionIterator id="question" list="<%=questionList%>">
                <tr>
                    <td colspan="2" class="dc_errorText" align="center">
                        <tc-webtag:errorIterator id="err" name="<%=Constants.DEMOG_PREFIX+question.getId()%>"><%=err%><br/></tc-webtag:errorIterator>
                    </td>
                </tr>
                <tr>
                    <td class="dc_regTableQuestion">
                        <%=question.getText()%>
                    </td>
                    <td class="dc_regTableAnswer">
                        <%if(question.getId() == 1) {%>
                        <pl:demographicInput question="<%=question%>" onchange="javascript:changeField();"/>
                        <%} else {%>
                        <pl:demographicInput question="<%=question%>" />
                        <% } %>
                    </td>
                </tr>
                </pl:questionIterator>
                
                <tr>
                   <td class="dc_regTableQuestion"></td>
                   <td class="dc_regTableAnswer"><a class="bodyText_link" href="javascript: document.regForm.submit();">Submit</a>
                   </td>
                </tr>

             </table>
        </form>
		</td>
	</tr>
</table>

<jsp:include page="../foot.jsp" />

</body>
</html>