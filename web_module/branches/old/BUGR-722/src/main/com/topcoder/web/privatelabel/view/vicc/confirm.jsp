<%@ page import="com.topcoder.web.privatelabel.Constants" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<%@ page language="java" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib uri="privatelabel.tld" prefix="pl" %>
<jsp:useBean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request"/>
<jsp:useBean id="regInfo" class="com.topcoder.web.privatelabel.model.FullRegInfo" scope="session"/>
<% List responseList = (List) request.getAttribute("responseList");%>
<% Map questionMap = (Map) request.getAttribute("questionMap");%>

<html>
<head>
    <jsp:include page="/script.jsp"/>

    <title>VeriSign Code Fest, Powered by TopCoder</title>
    <link type="text/css" rel="stylesheet" href="/css/vicc.css"/>
</head>

<body>

<!-- Tab barlinks-->
<jsp:include page="links.jsp">
    <jsp:param name="tabLev2" value="registration"/>
    <jsp:param name="tabLev3" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
<!-- Body-->
<tr valign="top">
<td valign="top" align="center">
    <div class="bodySpacer">

        <span class="bigTitle">Registration</span>
        <br/><br/>

        Confirm your Registration Information:<br/><br/>

        <form action="<jsp:getProperty name="sessionInfo" property="secureAbsoluteServletPath"/>" method="POST" name="regForm">
            <table>
                <input type="hidden" name="<%=Constants.MODULE_KEY%>" value="<%=Constants.VICC_REG_SUBMIT%>"/>
                <input type="hidden" name="<%=Constants.COMPANY_ID%>" value="<jsp:getProperty name="regInfo" property="companyId"/>"/>
                <input type="hidden" name="<%=Constants.EVENT_ID%>" value="<jsp:getProperty name="regInfo" property="eventId"/>"/>

                <tr>
                    <td align="center" colspan="2" class="bodyText">
                        <a href="<jsp:getProperty name="sessionInfo" property="servletPath"/>?<%=Constants.MODULE_KEY%>=<%=Constants.VERISIGN_06_REG_MAIN%>&<%=Constants.COMPANY_ID%>=<jsp:getProperty name="regInfo" property="companyId"/>&amp;<%=Constants.EVENT_ID%>=<jsp:getProperty name="regInfo" property="eventId"/>">edit</a>
                    </td>
                </tr>
                <tr>
                    <td class="bodyText" align="right">
                        Handle
                    </td>
                    <td class="bodyText">
                        <jsp:getProperty name="regInfo" property="handle"/>
                    </td>
                </tr>

                <tr>
                    <td class="bodyText" align="right">
                        Given Name
                    </td>
                    <td class="bodyText">
                        <jsp:getProperty name="regInfo" property="firstName"/>
                    </td>
                </tr>

                <tr>
                    <td class="bodyText" align="right">
                        Surname
                    </td>
                    <td class="bodyText">
                        <jsp:getProperty name="regInfo" property="lastName"/>
                    </td>
                </tr>

                <tr>
                    <td class="bodyText" align="right">
                        Email Address
                    </td>
                    <td class="bodyText">
                        <jsp:getProperty name="regInfo" property="email"/>
                    </td>
                </tr>

                <tr>
                    <td class="bodyText" align="right">
                        Confirm Email Address
                    </td>
                    <td class="bodyText">
                        <jsp:getProperty name="regInfo" property="emailConfirm"/>
                    </td>
                </tr>


                <pl:responseIterator id="resp" list="<%=responseList%>">
                    <tr>
                        <td class="bodyText" align="right">
                            <pl:demographicQuestionText questions="<%=questionMap%>" response="<%=resp%>"/>
                        </td>
                        <td class="bodyText">
                            <pl:demographicAnswerText questions="<%=questionMap%>" response="<%=resp%>"/>
                        </td>
                    </tr>
                </pl:responseIterator>

                <tr>
                    <td colspan="2" align="center" class="bodyText">
                        <p align="center"><a href="javascript: document.regForm.submit();">Submit</a></p>
                    </td>
                </tr>
            </table>

        </form>


        <br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>

        <br/><br/>
    </div>

</td>


<!-- Right Column-->
<td width="180" align="right" style="padding: 0px 15px 0px 0px;">
    <jsp:include page="right.jsp"/>

</td>

</tr>

</table>

<jsp:include page="/foot.jsp"/>

</body>

</html>
