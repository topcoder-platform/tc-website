<%@ page contentType="text/html; charset=ISO-8859-1" %>
<%@ page import="com.topcoder.web.privatelabel.Constants,
                 com.topcoder.shared.dataAccess.resultSet.ResultSetContainer,
                 java.util.List" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib uri="privatelabel.tld" prefix="pl" %>
<jsp:useBean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request" />
<jsp:useBean id="regInfo" class="com.topcoder.web.privatelabel.model.FullRegInfo" scope="session" />
<% List questionList = (List)request.getAttribute("questionList");%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>

<title>DoubleClick</title>

<jsp:include page="../../script.jsp" />
<jsp:include page="../../nocache.jsp"/>

<link type="text/css" rel="stylesheet" href="/css/doubleclick.css"/>

</head>
<body align="center">

<% if (regInfo.getCoderType()==Constants.STUDENT) {%>
    <jsp:include page="../links.jsp" >
        <jsp:param name="tabLev1" value="collegiate"/>
       <jsp:param name="tabLev2" value="registration"/>
    </jsp:include>
<% } else { %>
    <jsp:include page="../links.jsp" >
        <jsp:param name="tabLev1" value="internal"/>
       <jsp:param name="tabLev2" value="registration"/>
    </jsp:include>
<% } %>

<table width="750" align="center" valign="top" cellpadding="0" cellspacing="0">
	<tr>
		<td class="dc_headerPic">
	      <img src="/i/events/doubleclick/image1.gif" border="0" width="163" height="180"/>
	  	</td>
		<td class="dc_bodyText">
         <p class="pageTitle">Registration</p>

        <form action="<jsp:getProperty name="sessionInfo" property="servletPath"/>" method="POST" name="regForm">
            <input type="hidden" name="<%=Constants.MODULE_KEY%>" value="<%=Constants.DC_REG_CONFIRM%>"/>
            <input type="hidden" name="<%=Constants.COMPANY_ID%>" value="<jsp:getProperty name="regInfo" property="CompanyId"/>"/>
            <input type="hidden" name="<%=Constants.EVENT_ID%>" value="<jsp:getProperty name="regInfo" property="EventId"/>"/>

             <table width="100%" cellpadding="0" cellspacing="3">
                <pl:questionIterator id="question" list="<%=questionList%>">
                    <tr>
                        <td class="dc_errorText" colspan="2">
                            <tc-webtag:errorIterator id="err" name="<%=Constants.DEMOG_PREFIX+question.getId()%>"><%=err%><br/></tc-webtag:errorIterator>
                        </td>
                    </tr>
                    <tr>
                        <td class="dc_regTableQuestion">
                            <%=question.getText()%>
                        </td>
                        <td class="dc_regTableAnswer">
                            <pl:demographicInput question="<%=question%>"/>
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