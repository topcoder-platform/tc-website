<%@ page import="com.topcoder.web.privatelabel.Constants,
                 com.topcoder.shared.dataAccess.resultSet.ResultSetContainer"%><!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ taglib uri="/tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib uri="/privatelabel.tld" prefix="pl" %>
<jsp:usebean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request" />
<jsp:usebean id="regInfo" class="com.topcoder.web.privatelabel.model.ResumeRegInfo" scope="session" />
<jsp:usebean id="responseList" class="java.util.List" scope="request" />
<jsp:usebean id="questionMap" class="java.util.Map" scope="request" />
<html>
<head>
<link type="text/css" rel="stylesheet" class="bodyText_link" href="/css/style.css"/>
<link type="text/css" rel="stylesheet" class="bodyText_link" href="/css/gicj05.css"/>
<title>Google India Code Jam 2005, Powered by TopCoder</title>
</head>
<body>


<table border=0 width=100% cellpadding=0 cellspacing=0>
	<tr>
		<td width="49%">&#160;</td>
		<td align=center>
			<table border=0 width=100% cellpadding=0 cellspacing=0>
				<tr>
					<td width="49%"></td>
					<td valign=bottom align=center><img border=0 src="/i/events/gicj05/gicj05_logo.gif" alt="Google India Code Jam logo"></td>
					<td width="49%"></td>
				</tr>
			</table>
		</td>
		<td width="49%"></td>
	</tr>
	<tr>
		<td width="49%">&#160;</td>
		<td>
			<div class=greenBigBox>

			<!-- Tab bar links-->
			<div align=center>
			<jsp:include page="links.jsp" >
			<jsp:param name="selectedTab" value="registration"/>
			</jsp:include>
			</div>

			<br/><br/>

			<span class=bigTitle>Registration</span>
			<span valign=top>
			<jsp:include page="right_reg.jsp" />
			</span>

			<br/><br/>
            <table width="100%" cellpadding="0" cellspacing="5" class="bodyText" align="center" >
        	<form action="<jsp:getProperty name="sessionInfo" property="ServletPath"/>" method="POST" name="regForm">
            <input type="hidden" name="<%=Constants.MODULE_KEY%>" value="<%=Constants.GOOGLE_INDIA_05_REG_SUBMIT%>"/>
            <input type="hidden" name="<%=Constants.COMPANY_ID%>" value="<jsp:getProperty name="regInfo" property="CompanyId"/>"/>
            <input type="hidden" name="<%=Constants.EVENT_ID%>" value="<jsp:getProperty name="regInfo" property="EventId"/>"/>

            <tr>
                 <td align="right" width="50%"><b>Personal</b>
                 </td>
                <td align="left" width="50%">
                    <a href="<jsp:getProperty name="sessionInfo" property="ServletPath"/>?<%=Constants.MODULE_KEY%>=<%=Constants.GOOGLE_INDIA_05_REG_MAIN%>&<%=Constants.COMPANY_ID%>=<jsp:getProperty name="regInfo" property="CompanyId"/>">edit<a/>
                </td>
            </tr>
            <tr>
                <td align="right" nowrap>
                    Handle
                </td>
                <td align="left">
                    <jsp:getProperty name="regInfo" property="Handle"/>
                </td>
            </tr>

            <tr>
                <td align="right" nowrap>
                    First Name
                </td>
                <td align="left">
                    <jsp:getProperty name="regInfo" property="FirstName"/>
                </td>
            </tr>

            <tr>
                <td align="right" nowrap>
                    Last Name
                </td>
                <td align="left">
                    <jsp:getProperty name="regInfo" property="LastName"/>
                </td>
            </tr>

            <tr>
                <td align="right" nowrap>
                    Email Address
                </td>
                <td align="left">
                    <jsp:getProperty name="regInfo" property="Email"/>
                </td>
            </tr>

            <tr>
                <td align="right" nowrap>
                    Confirm Email Address
                </td>
                <td align="left">
                    <jsp:getProperty name="regInfo" property="EmailConfirm"/>
                </td>
            </tr>

            <tr>
                <td align="right" nowrap>
                    Address 1
                </td>
                <td align="left">
                    <jsp:getProperty name="regInfo" property="Address1"/>
                </td>
            </tr>

            <tr>
                <td align="right" nowrap>
                    Address 2
                </td>
                <td align="left">
                    <jsp:getProperty name="regInfo" property="Address2"/>
                </td>
            </tr>

            <tr>
                <td align="right" nowrap>
                    Address 3
                </td>
                <td align="left">
                    <jsp:getProperty name="regInfo" property="Address3"/>
                </td>
            </tr>

            <tr>
                <td align="right" nowrap>
                    City
                </td>
                <td align="left">
                    <jsp:getProperty name="regInfo" property="City"/>
                </td>
            </tr>

            <tr>
                <td align="right" nowrap>
                    Province
                </td>
                <td align="left">
                    <jsp:getProperty name="regInfo" property="Province"/>
                </td>
            </tr>

            <tr>
                <td align="right" nowrap>
                    PIN/Zip Code
                </td>
                <td align="left">
                    <jsp:getProperty name="regInfo" property="Zip"/>
                </td>
            </tr>

            <tr>
                <td align="right" nowrap>
                    Country
                </td>
                <td align="left">
                    <jsp:getProperty name="regInfo" property="CountryName"/>
                </td>
            </tr>
            <tr>
                <td align="right"><b>Demographics</b>
                </td>
                <td align="left">
                    <a href="<jsp:getProperty name="sessionInfo" property="ServletPath"/>?<%=Constants.MODULE_KEY%>=<%=Constants.GOOGLE_INDIA_05_REG_DEMOG%>&<%=Constants.COMPANY_ID%>=<jsp:getProperty name="regInfo" property="CompanyId"/>">edit<a/>
                </td>
            </tr>
            <tr>
                <td colspan="2" align="center">

                </td>
            </tr>

            <tr>
                <td align="right" nowrap>
                    Student/Professional
                </td>
                <td align="left">
                    <%=regInfo.isStudent()?"Student":"Professional"%>
                </td>
            </tr>

            <pl:responseIterator id="resp" list="<%=responseList%>">
                <tr>
                    <td align="right" nowrap>
                        <pl:demographicQuestionText questions="<%=questionMap%>" response="<%=resp%>"/>
                    </td>
                    <td align="left">
                        <pl:demographicAnswerText questions="<%=questionMap%>" response="<%=resp%>"/>
                    </td>
                </tr>
            </pl:responseIterator>

            <tr>
                            <td align="right" nowrap>Resume</td>
                            <td align="left"><jsp:getProperty name="regInfo" property="UploadStatus"/></td>
                        </tr>
            <tr>
               <td colspan="2" align="center">
                  <p align="center"><a href="javascript: document.regForm.submit();">Submit</a></p>
               </td>
            </tr>

         </form>
         </table>

			<br/><br/>
			<br/><br/>
			To find out more detailed information about the Google India Code Jam 2005, including a list of the prizes, please read the <a href="/pl/?&module=Static&d1=gicj05&d2=rules">Terms and Conditions</a>.
			</div>
		</td>
		<td width="49%">&#160;</td>
	<tr>
</table>
<jsp:include page="foot.jsp" />
</body>
</html>

