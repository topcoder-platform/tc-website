<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@  page
  language="java"
  import="java.util.*,
          com.topcoder.common.web.data.report.Constants,
          com.topcoder.shared.dataAccess.DataAccessConstants,
          com.topcoder.common.web.data.report.Query,
		  com.topcoder.shared.dataAccess.*,
		  com.topcoder.shared.dataAccess.resultSet.*,
		  com.topcoder.shared.util.TCContext
          ,
          com.topcoder.web.common.TCRequest,
          com.topcoder.web.common.HttpObjectFactory,
          com.topcoder.web.common.TCResponse,
          com.topcoder.web.common.security.WebAuthentication,
          com.topcoder.web.common.security.BasicAuthentication,
          com.topcoder.web.common.security.SessionPersistor,
          com.topcoder.security.admin.PrincipalMgrRemote,
          com.topcoder.security.TCSubject,
          com.topcoder.web.common.SessionInfo"

%>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%
    TCRequest tcRequest = HttpObjectFactory.createRequest(request);
    TCResponse tcResponse = HttpObjectFactory.createResponse(response);
    WebAuthentication authentication = new BasicAuthentication(new SessionPersistor(tcRequest.getSession()),
            tcRequest, tcResponse, BasicAuthentication.MAIN_SITE);
    PrincipalMgrRemote pmgr = (PrincipalMgrRemote) com.topcoder.web.common.security.Constants.createEJB(PrincipalMgrRemote.class);
    TCSubject user = pmgr.getUserSubject(authentication.getActiveUser().getId());
    SessionInfo info = new SessionInfo(tcRequest, authentication, user.getPrincipals());
    if (!info.isAdmin()) {
        %> you don't have permssion to view this page <%
        return;
    }

                com.topcoder.shared.dataAccess.Request dataRequest = new com.topcoder.shared.dataAccess.Request();
				dataRequest.setContentHandle("srm_demographic");
				dataRequest.setProperty("rd", request.getParameter("rd")==null?"4445":request.getParameter("rd"));

				           DataAccessInt dai = new CachedDataAccess(dataRequest.getProperty(Constants.DB_KEY, Query.TRANSACTIONAL));
                    Map dataMap = null;
                    dataMap = dai.getData(dataRequest);

					ResultSetContainer rsc = (ResultSetContainer)dataMap.get("srm_demo_logged_in");


			%>





<table width="100%" class="srmFrame">
<tr><td colspan="2" class="srmQuestion">People Logged In</td></tr>
<tr>
<td class="bodyText"><strong>Time</strong></td>
<td class="bodyText"><strong>Number Logged In</strong></td>
</tr>

<%boolean even=false;%>
  <rsc:iterator list="<%=rsc%>" id="Row" >
<tr>
  <td class="<%=even?"srmTableEven":"srmTableOdd"%>" ><rsc:item name='<%="(expression)"%>' row="<%=Row%>"/></td>
  <td class="<%=even?"srmTableEven":"srmTableOdd"%>" ><rsc:item name='<%="num_logged_in"%>' row="<%=Row%>"/></td>
</tr><%even=!even;%>
</rsc:iterator>
</table>
