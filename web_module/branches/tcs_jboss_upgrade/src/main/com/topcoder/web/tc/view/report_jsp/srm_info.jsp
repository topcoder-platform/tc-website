<%@  page
  language="java"
  import="java.util.*,
          com.topcoder.common.web.data.report.Constants,
          com.topcoder.shared.dataAccess.DataAccessConstants,
          com.topcoder.common.web.data.report.Query,
		  com.topcoder.shared.dataAccess.*,
		  com.topcoder.shared.dataAccess.resultSet.*,
		  com.topcoder.shared.util.TCContext,
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


	String round = request.getParameter("rd");

    com.topcoder.shared.dataAccess.Request dataRequest = new com.topcoder.shared.dataAccess.Request();
	dataRequest.setContentHandle("srm_match_info");
	dataRequest.setProperty("rd", round);
	DataAccessInt dai = new CachedDataAccess(
    dataRequest.getProperty(Constants.DB_KEY, Query.TRANSACTIONAL));
    Map dataMap = null;
    dataMap = dai.getData(dataRequest);
	ResultSetContainer rsc = (ResultSetContainer)dataMap.get("srm_match_info");



%>
<table>
  <tr>
    <td class=sectionTitle><%= rsc.getItem(0,"contest_name") %> on <%= rsc.getItem(0,"contest_date") %></td>
  </tr>
</table>
