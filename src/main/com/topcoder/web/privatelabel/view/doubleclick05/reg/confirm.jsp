<%@ page contentType="text/html; charset=ISO-8859-1" %>
<%@ page import="com.topcoder.web.privatelabel.Constants,
                 com.topcoder.shared.dataAccess.resultSet.ResultSetContainer" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib uri="privatelabel.tld" prefix="pl" %>
<jsp:usebean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request" />
<jsp:usebean id="regInfo" class="com.topcoder.web.privatelabel.model.FullRegInfo" scope="session" />
<jsp:usebean id="responseList" class="java.util.List" scope="request" />
<jsp:usebean id="questionMap" class="java.util.Map" scope="request" />
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

<table width="750" align="center" valign="top" cellpadding="0" cellspacing="0">
	<tr>
		<td class="dc_headerPic">
	      <img src="/i/events/doubleclick/image1.gif" border="0" width="163" height="180"/>
	  	</td>
		<td class="dc_bodyText">
         <p class="pageTitle">Registration</p>

        <form action="<jsp:getProperty name="sessionInfo" property="ServletPath"/>" method="POST" name="regForm">
            <input type="hidden" name="<%=Constants.MODULE_KEY%>" value="<%=Constants.DC05_REG_SUBMIT%>"/>
            <input type="hidden" name="<%=Constants.COMPANY_ID%>" value="<jsp:getProperty name="regInfo" property="CompanyId"/>"/>
            <input type="hidden" name="<%=Constants.EVENT_ID%>" value="<jsp:getProperty name="regInfo" property="EventId"/>"/>

             <table width="100%" cellpadding="0" cellspacing="3">
                <tr>
                     <td class="dc_regTableQuestion"><b>Personal</b></td>
                    <td class="dc_regTableAnswer">
                        <a class="bodyText_link" href="<jsp:getProperty name="sessionInfo" property="ServletPath"/>?<%=Constants.MODULE_KEY%>=<%=Constants.DC05_REG_MAIN%>&<%=Constants.COMPANY_ID%>=<jsp:getProperty name="regInfo" property="CompanyId"/>&eid=1">edit<a/>
                    </td>
                </tr>
                <tr>
                    <td class="dc_regTableQuestion">Handle</td>
                    <td class="dc_regTableAnswer"><jsp:getProperty name="regInfo" property="Handle"/></td>
                </tr>

                <tr>
                    <td class="dc_regTableQuestion">First Name</td>
                    <td class="dc_regTableAnswer"><jsp:getProperty name="regInfo" property="FirstName"/></td>
                </tr>

                <tr>
                    <td class="dc_regTableQuestion">Last Name</td>
                    <td class="dc_regTableAnswer"><jsp:getProperty name="regInfo" property="LastName"/></td>
                </tr>

                <tr>
                    <td class="dc_regTableQuestion">Password</td>
                    <td class="dc_regTableAnswer">********</td>
                </tr>

                <tr>
                    <td class="dc_regTableQuestion">Confirm Password</td>
                    <td class="dc_regTableAnswer">********</td>
                </tr>

                <tr>
                    <td class="dc_regTableQuestion">Email Address</td>
                    <td class="dc_regTableAnswer"><jsp:getProperty name="regInfo" property="Email"/></td>
                </tr>
                
                <pl:responseIterator id="resp" list="<%=responseList%>">
                    <tr>
                        <td class="dc_regTableQuestion">
                            <pl:demographicQuestionText questions="<%=questionMap%>" response="<%=resp%>"/>
                        </td>
                        <td class="dc_regTableAnswer">
                            <pl:demographicAnswerText questions="<%=questionMap%>" response="<%=resp%>"/>
                        </td>
                    </tr>
                </pl:responseIterator>

                <tr>
                   <td class="dc_regTableQuestion"></td>
                   <td class="dc_regTableAnswer"><a class="bodyText_link" href="javascript: document.regForm.submit();">Submit</a>
                   </td>
                </tr>

             </table>
             
             <p><br/></p>


        </form>
		</td>
	</tr>
</table>

<jsp:include page="../foot.jsp" />

</body>
</html>