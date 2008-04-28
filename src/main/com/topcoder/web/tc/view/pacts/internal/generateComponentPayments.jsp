<%@ page import="com.topcoder.web.tc.controller.legacy.pacts.common.PactsConstants,
  				com.topcoder.web.tc.controller.legacy.pacts.controller.request.internal.GenerateComponentPayments,
				 com.topcoder.shared.dataAccess.resultSet.ResultSetContainer,
				 com.topcoder.web.common.StringUtils" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<%@ taglib uri="pacts.tld" prefix="pacts" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%
	ResultSetContainer statusList = (ResultSetContainer)
		request.getAttribute(PactsConstants.PROJECT_TERMINATION_STATUS_LIST);
	String projID = StringUtils.checkNull((String)request.getParameter(PactsConstants.PROJECT_ID)).trim();
	String projTermStatus = StringUtils.checkNull((String)request.getParameter(PactsConstants.PROJECT_TERMINATION_STATUS)).trim();
	String client = StringUtils.checkNull((String)request.getParameter(PactsConstants.PROJECT_CLIENT)).trim();
	String coder = StringUtils.checkNull((String)request.getParameter("coder")).trim();
	String devSupportProjectId = StringUtils.checkNull((String)request.getParameter(GenerateComponentPayments.DEV_SUPPORT_PROJECT_ID)).trim();
%>
<html>
    <head>
        <title>PACTS</title>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" >
    </head>
    <body>
        <h1>PACTS</h1>
        <h2 align="center">Generate Component Payments</h2>
        <center>
            <form name="paymentForm" action="<%=PactsConstants.INTERNAL_SERVLET_URL%>" method="post">
                <input type="hidden" name="<%=PactsConstants.MODULE_KEY%>" value="GenerateComponentPayments"/>
                <table border="1" cellpadding="5" cellspacing="0">
                    <tr>
                    	<td colspan="3" align="left">
                    		<%	int errCount = 0; %>
                    		<tc-webtag:errorIterator id="err" name="<%=PactsConstants.PROJECT_ID%>">
                    			<%	String errStr = (String)err; %>
                    			<% 	if (errCount > 0) { %><br><% } %>
                    			<% 	if (errStr.indexOf("Error:") != -1) { %>
                    					<font color="red"><%=errStr%></font>
                    			<% 	} else if (errStr.indexOf("Success:") != -1) { %>
                    					<font color="green"><%=errStr%>
                    					<c:if test="${not empty requestScope.payment_id}">
                    						(<a href="${pacts:viewPayments(requestScope.payment_id)}">view</a>)
                    					</c:if>
                    					</font>
                    					        
                    					
                    			<% 	} %>
                    			<% 	if (err!=null && !err.equals("")) { errCount++; } %>
                    		</tc-webtag:errorIterator>
                    		<tc-webtag:errorIterator id="err" name="<%=PactsConstants.PROJECT_TERMINATION_STATUS%>">
                    			<%	String errStr = (String)err; %>
                    			<% 	if (errCount > 0) { %><br><% } %>
                    				<font color="red"><%=errStr%></font>
                    			<% 	if (errStr!=null && !errStr.equals("")) { errCount++; } %>
                    		</tc-webtag:errorIterator>
                            <tc-webtag:errorIterator id="err" name="dev_support_error"><font color="red"><%=err%></font></tc-webtag:errorIterator>
                    	</td>
                    </tr>
                    <tr>
                        <td align="center">
                            Project Id: <input type="text" name="<%=PactsConstants.PROJECT_ID%>" maxlength="10" size="10" value="<%=projID%>"/>
                        </td>
                        <td align="center">
                            Status: <tc-webtag:rscSelect name="<%=PactsConstants.PROJECT_TERMINATION_STATUS%>" list='<%=statusList%>' fieldText="name" fieldValue="project_status_id" selectedValue="<%=projTermStatus%>"/>
                        </td>
                        <td align="center">
                            Client: <input type="text" name="<%=PactsConstants.PROJECT_CLIENT%>" maxlength="100" size="25" value="<%=client%>"/>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3" align="center">
                            <table border="0" cellpadding="3" cellspacing="0">
                            <tr>
                                <td colspan="2" align="center">
                                    <strong>Development Support</strong>
                                </td>
                           </tr>
                           <tr>
                                <td>
                                    <strong>Design Project</strong>
                                </td>         
                                <td>               
                                    <strong>Coder</strong>
                                 </td>
                            </tr>
                            <tr>
                                <td><tc-webtag:radioButton name="<%=GenerateComponentPayments.DEV_SUPPORT_PROJECT %>" value="auto"/>automatic</td>                                 
                                 <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td><tc-webtag:radioButton name="<%=GenerateComponentPayments.DEV_SUPPORT_PROJECT %>" value="none"/>none</td>
                                <td><tc-webtag:radioButton name="<%=GenerateComponentPayments.IS_DEV_SUPPORT_BY_DESIGNER %>" value="designer"/>the designer</td>
                            </tr>
                            <tr>
                                <td><tc-webtag:radioButton name="<%= GenerateComponentPayments.DEV_SUPPORT_PROJECT %>" value="other"/>project id: 
                                    <input type="text" name="<%= GenerateComponentPayments.DEV_SUPPORT_PROJECT_ID %>" maxlength="20" size="10" value="<%=devSupportProjectId%>"/>
                                </td> 
                                <td><tc-webtag:radioButton name="<%= GenerateComponentPayments.IS_DEV_SUPPORT_BY_DESIGNER %>" value="other"/>coder:
                                     <input type="text" name="coder" maxlength="20" size="10" value="<%=coder%>"/>
                                </td>
                            </tr>   
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3" align="center">
                            <table border="0" cellpadding="3" cellspacing="0">
                                <tr align="center"><td>
                                    <strong>Review Board</strong>
                                </td></tr>
                                <tr align="left"><td>
                                    <tc-webtag:chkBox name="<%=GenerateComponentPayments.APPLY_REVIEWER_WITHHOLDING_ID %>"/>Apply Reviewer Withholding                                 
                                </td></tr>
                                <tr align="left"><td>
                                    <tc-webtag:chkBox name="<%=GenerateComponentPayments.PAY_RBOARD_BONUS_ID %>"/>Pay Review Board Bonus
                                </td></tr>
                            </table>                                 
                        </td>
                    </tr>
                    <tr>
                        <td align="center" colspan="3">
                            <a href="JavaScript:document.paymentForm.submit();">Generate Component Payments</a><br/>
                        </td>
                    </tr>
                </table>
            </form>
        </center>
        <jsp:include page="InternalFooter.jsp" flush="true" />
    </body>
</html>
