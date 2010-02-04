<%--
  - Author: isv
  - Version: 1.1
  - Copyright (C) 2004 - 2010 TopCoder Inc., All Rights Reserved.
  -
  - Description: This page provides the web form for generating the payments for completed component projects.
  -
  - Version 1.1 (Miscellaneous TC Improvements Release Assembly) changes: added callback and added AJAX request
  - processor for project_id input field to cause the client input field to be pre-populated based on provided
  - project ID.
--%>
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
        <script type="text/javascript" src="/js/taconite-client.js"></script>
        <script type="text/javascript" src="/js/taconite-parser.js"></script>
        <script type="text/javascript">
            var currentProjectId = '';
            function setClient(client) {
                document.paymentForm.<%=PactsConstants.PROJECT_CLIENT%>.value = client;
                if (client == '') {
                    showAjaxStatusMessage('No client was found for the specified project ID');
                } else {
                    showAjaxStatusMessage('');
                }
            }
            function resolveClient(input) {
                var newId = input.value;
                if (newId != currentProjectId) {
                    currentProjectId = newId;
                    showAjaxStatusMessage("Resolving client for the specified project ID...");
                    var ajaxRequest
                        = new AjaxRequest('/PactsInternalServlet?module=GetClientByProject&project_id=' + input.value);
                    ajaxRequest.sendRequest();
                }
            }
            function clearNode(node) {
                while (node.firstChild) {
                    node.removeChild(node.firstChild);
                }
            }
            function showAjaxStatusMessage(message) {
                var ajaxCallStatusTD = document.getElementById("ajaxCallStatus");
                clearNode(ajaxCallStatusTD);
                if (message == '') {
                    ajaxCallStatusTD.style.display = 'none';
                } else {
                    ajaxCallStatusTD.appendChild(document.createTextNode(message));
                    ajaxCallStatusTD.style.display = 'block';
                }
            }
        </script>
    </head>
    <body>
        <h1>PACTS</h1>
        <h2 align="center">Generate Software Contest Payments</h2>
        <center>
            <form name="paymentForm" id="paymentForm" action="<%=PactsConstants.INTERNAL_SERVLET_URL%>" method="post">
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
                        <td id="ajaxCallStatus" style="display:none;" colspan="3"></td>
                    </tr>
                    <tr>
                        <td align="center">
                            Project Id: <input id="projectIdInput"
                                               type="text" name="<%=PactsConstants.PROJECT_ID%>" maxlength="10"
                                               size="10" value="<%=projID%>" onblur="resolveClient(this);"/>
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
                                    <strong>Development Support (Component Development Only)</strong>
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
                                    <strong>Review Board (Component Design Only)</strong>
                                </td></tr>
                                <tr align="left"><td>
                                    <tc-webtag:chkBox name="<%=GenerateComponentPayments.APPLY_REVIEWER_WITHHOLDING_ID %>"/>Apply Reviewer Withholding                                 
                                </td></tr>
				<%--
                                <tr align="left"><td>
                                    <tc-webtag:chkBox name="<%=GenerateComponentPayments.PAY_RBOARD_BONUS_ID %>"/>Pay Review Board Bonus
                                </td></tr>
				--%>
                            </table>                                 
                        </td>
                    </tr>
                    <tr>
                        <td align="center" colspan="3">
                            <a href="JavaScript:document.paymentForm.submit();">Generate Software Contest Payments</a><br/>
                        </td>
                    </tr>
                </table>
                <div id='runJS'></div>
            </form>
        </center>
        <jsp:include page="InternalFooter.jsp" flush="true" />
        <script type="text/javascript">                         
            resolveClient(document.getElementById("projectIdInput"));
        </script>
    </body>
</html>
