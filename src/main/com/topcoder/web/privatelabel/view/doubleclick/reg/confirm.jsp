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
   <jsp:param name="tabLev1" value="<%=regInfo.getCoderType()==Constants.STUDENT?"collegiate":"internal"%>"/>
   <jsp:param name="tabLev2" value="registration"/>
</jsp:include>

<div class="dc_bodyTable">
   <div CLASS="dc_headerPic">
      <img src="/i/events/doubleclick/headers/guyNcode.jpg" border="0" width="163" height="180"/>
   </div>

   <div CLASS="dc_bodyText">
         <p class="pageTitle">Registration</p>
         <p>Description of registration goes here</p>

        <form action="<jsp:getProperty name="sessionInfo" property="ServletPath"/>" method="POST" name="regForm">
            <input type="hidden" name="<%=Constants.MODULE_KEY%>" value="<%=Constants.DC_REG_SUBMIT%>"/>
            <input type="hidden" name="<%=Constants.COMPANY_ID%>" value="<jsp:getProperty name="regInfo" property="CompanyId"/>"/>
            <input type="hidden" name="<%=Constants.EVENT_ID%>" value="<jsp:getProperty name="regInfo" property="EventId"/>"/>

             <table width="100%" cellpadding="0" cellspacing="3">
                <tr>
                     <td class="dc_regTableQuestion"><b>Personal</b></td>
                    <td class="dc_regTableAnswer">
                        <a href="<jsp:getProperty name="sessionInfo" property="ServletPath"/>?<%=Constants.MODULE_KEY%>=<%=Constants.GOOGLE_REG_MAIN%>&<%=Constants.COMPANY_ID%>=<jsp:getProperty name="regInfo" property="CompanyId"/>">edit<a/>
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
                    <td class="dc_regTableQuestion">Middle Initial</td>
                    <td class="dc_regTableAnswer"><jsp:getProperty name="regInfo" property="MiddleName"/></td>
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

                <tr>
                    <td class="dc_regTableQuestion">Address1</td>
                    <td class="dc_regTableAnswer"><jsp:getProperty name="regInfo" property="Address1"/></td>
                </tr>

                <tr>
                    <td class="dc_regTableQuestion">Address2</td>
                    <td class="dc_regTableAnswer"><jsp:getProperty name="regInfo" property="Address2"/></td>
                </tr>

                <tr>
                    <td class="dc_regTableQuestion">Address3</td>
                    <td class="dc_regTableAnswer"><jsp:getProperty name="regInfo" property="Address3"/></td>
                </tr>

                <tr>
                    <td class="dc_regTableQuestion">City</td>
                    <td class="dc_regTableAnswer"><jsp:getProperty name="regInfo" property="City"/></td>
                </tr>

                <tr>
                    <td class="dc_regTableQuestion">State</td>
                    <td class="dc_regTableAnswer"><jsp:getProperty name="regInfo" property="StateName"/></td>
                </tr>

                <tr>
                    <td class="dc_regTableQuestion">Zip Code</td>
                    <td class="dc_regTableAnswer"><jsp:getProperty name="regInfo" property="Zip"/></td>
                </tr>

                <tr>
                    <td class="dc_regTableQuestion">Country</td>
                    <td class="dc_regTableAnswer"><jsp:getProperty name="regInfo" property="CountryName"/></td>
                </tr>
                <tr>
                    <td class="dc_regTableQuestion"><b>Demographics</b></td>
                    <td class="dc_regTableAnswer">
                        <a href="<jsp:getProperty name="sessionInfo" property="ServletPath"/>?<%=Constants.MODULE_KEY%>=<%=Constants.GOOGLE_REG_DEMOG%>&<%=Constants.COMPANY_ID%>=<jsp:getProperty name="regInfo" property="CompanyId"/>">edit<a/>
                    </td>
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
                   <td colspan="2" align="center">
                      <p align="center"><a href="javascript: document.regForm.submit();">Submit</a></p>
                   </td>
                </tr>

             </table>
        </form>
   </div>
</div>

<jsp:include page="../foot.jsp" />

</body>
</html>