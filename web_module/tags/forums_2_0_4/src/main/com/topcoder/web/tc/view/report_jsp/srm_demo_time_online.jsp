<%@  page
  language="java"
  import="java.util.*,
          com.topcoder.common.web.data.report.Constants,
          com.topcoder.shared.dataAccess.DataAccessConstants,
          com.topcoder.common.web.data.report.Query,
		  com.topcoder.shared.dataAccess.*,
		  com.topcoder.shared.dataAccess.resultSet.*,
		  com.topcoder.shared.util.TCContext,
          com.topcoder.web.common.security.WebAuthentication,
          com.topcoder.web.common.security.BasicAuthentication,
          com.topcoder.web.common.security.SessionPersistor,
          com.topcoder.security.admin.PrincipalMgrRemote,
          com.topcoder.security.TCSubject"

%>
<%@ page import="com.topcoder.web.common.*" %>
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
    dataRequest.setContentHandle("srm_demo_time_online");
    dataRequest.setProperty("rd", request.getParameter("rd") == null ? "4445" : request.getParameter("rd"));

    DataAccessInt dai = new com.topcoder.web.common.CachedDataAccess(
            dataRequest.getProperty(Constants.DB_KEY, Query.TRANSACTIONAL));
    Map dataMap = null;
    dataMap = dai.getData(dataRequest);

    ResultSetContainer rsc = (ResultSetContainer) dataMap.get("srm_demo_time_online");


%>
<table width="100%" class="srmFrame">
<tr><td colspan="2" class="srmQuestion">Competitor Time Online</td></tr>
<tr>
<td class="bodyText"><strong>Time</strong></td>
<td class="bodyText"><strong>Number Logged In</strong></td>
</tr>
<tr>
  <td class="srmTableEven">0-1 Hours</td>
  <td class="srmTableEven" ><%= rsc.getItem(0,"one_hour") %></td>
</tr>
<tr>
  <td class="srmTableOdd">1-2 Hours</td>
  <td class="srmTableOdd" ><%= rsc.getItem(0,"two_hours") %></td>
</tr>
<tr>
  <td class="srmTableEven">2-3 Hours</td>
  <td class="srmTableEven" ><%= rsc.getItem(0,"three_hours") %></td>
</tr>
<tr>
  <td class="srmTableOdd">3-4 Hours</td>
  <td class="srmTableOdd" ><%= rsc.getItem(0,"four_hours") %></td>
</tr>
<tr>
  <td class="srmTableEven">4-5 Hours</td>
  <td class="srmTableEven" ><%= rsc.getItem(0,"five_hours") %></td>
</tr>
<tr>
  <td class="srmTableOdd">5+ Hours</td>
  <td class="srmTableOdd" ><%= rsc.getItem(0,"five_plus") %></td>
</tr>

</table>
