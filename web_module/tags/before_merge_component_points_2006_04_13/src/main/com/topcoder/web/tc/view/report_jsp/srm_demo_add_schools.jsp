
<%@  page
  language="java"
  import="java.util.*,
          com.topcoder.common.web.data.report.Constants,
          com.topcoder.shared.dataAccess.DataAccessConstants,
          com.topcoder.common.web.data.report.Query,
		  com.topcoder.shared.dataAccess.*,
		  com.topcoder.shared.dataAccess.resultSet.*,
		  com.topcoder.shared.util.TCContext,
		  java.text.DecimalFormat,
		  java.math.BigInteger
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
				dataRequest.setContentHandle("srm_demo_add");
				dataRequest.setProperty("rd", request.getParameter("rd")==null?"4445":request.getParameter("rd"));

				           DataAccessInt dai = new CachedDataAccess(
                                    dataRequest.getProperty(Constants.DB_KEY, Query.TRANSACTIONAL));
                    Map dataMap = null;
                    dataMap = dai.getData(dataRequest);

					ResultSetContainer rsc = (ResultSetContainer)dataMap.get("srm_demo_add_schools");

String avg_rating_stg;
			%>
<table width="100%" class="srmFrame">
  <tr>
    <td colspan="3" class="srmQuestion">School Represented (students)</td>
  </tr>
  <tr>
    <td class="bodyText"><strong>School</strong></td>
    <td class="bodyText"><strong>Coders</strong></td>
    <td class="bodyText"><strong>Avg Rating</strong></td>
  </tr>
  <%boolean even=false;%>
  <rsc:iterator list="<%=rsc%>" id="Row" >
    <tr>
      <td class="<%=even?"srmTableEven":"srmTableOdd"%>" ><rsc:item name='<%="school_name"%>' row="<%=Row%>"/></td>
      <td class="<%=even?"srmTableEven":"srmTableOdd"%>" ><rsc:item name='<%="cnt"%>' row="<%=Row%>"/></td>
      <td align = right class="<%=even?"srmTableEven":"srmTableOdd"%>" >
      <% DecimalFormat df = new DecimalFormat("0.00");
        avg_rating_stg = df.format(Float.parseFloat(Row.getItem("avg_rating").toString()));
        df = null;%>
      <%= avg_rating_stg %></td>
    </tr>
    <%even=!even;%>
  </rsc:iterator>
</table>