
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
          com.topcoder.web.common.TCRequestFactory,
          com.topcoder.web.common.security.WebAuthentication,
          com.topcoder.web.common.security.BasicAuthentication,
          com.topcoder.web.common.security.SessionPersistor,
          com.topcoder.security.admin.PrincipalMgrRemote,
          com.topcoder.security.TCSubject,
          com.topcoder.web.common.SessionInfo,
          com.topcoder.shared.util.ApplicationServer"

%>
<%@ taglib uri="/WEB-INF/rsc-taglib.tld" prefix="rsc" %>
<%
    TCRequest tcRequest = TCRequestFactory.createRequest(request);
    WebAuthentication authentication = new BasicAuthentication(new SessionPersistor(tcRequest.getSession()), tcRequest, response, BasicAuthentication.MAIN_SITE);
    PrincipalMgrRemote pmgr = (PrincipalMgrRemote) com.topcoder.web.common.security.Constants.createEJB(PrincipalMgrRemote.class);
    TCSubject user = pmgr.getUserSubject(authentication.getActiveUser().getId());
    SessionInfo info = new SessionInfo(tcRequest, authentication, user.getPrincipals());
    if (!info.isAdmin()) {
        %> you don't have permssion to view this page <%
        return;
    }


                com.topcoder.shared.dataAccess.Request dataRequest = new com.topcoder.shared.dataAccess.Request();
				dataRequest.setContentHandle("srm_demo_part");
				dataRequest.setProperty("rd", request.getParameter("rd")==null?"4445":request.getParameter("rd"));
								
				           DataAccessInt dai = new CachedDataAccess(
                                    dataRequest.getProperty(Constants.DB_KEY, Query.TRANSACTIONAL));
                    Map dataMap = null;
                    dataMap = dai.getData(dataRequest);
					
					ResultSetContainer rsc = (ResultSetContainer)dataMap.get("srm_demo_part_total");
					
			%>	
			
			
<%
long total = 0;
long total_coders = 0;
double coder_percent = 0;
String coder_percent_stg;
%>

<table width="100%" class="srmFrame">
<tr><td colspan="3" class="srmQuestion">Total Participation Histogram</td></tr>
<tr>
<td class="bodyText"><strong>Number of Rated Matches</strong></td>
<td class="bodyText"><strong>Coders</strong></td>
<td class="bodyText"><strong>Percent</strong></td>
</tr>
<rsc:iterator list="<%=rsc%>" id="Row" >
<% total_coders += Long.parseLong(Row.getItem("num_coders").toString()); %>
</rsc:iterator>
<%boolean even=false;%>
  <rsc:iterator list="<%=rsc%>" id="Row" >
  <tr>
<td class="<%=even?"srmTableEven":"srmTableOdd"%>" ><rsc:item name='<%="num_ratings"%>' row="<%=Row%>"/></td>
<% total = total + Long.parseLong(Row.getItem("num_coders").toString()); %>
<td class="<%=even?"srmTableEven":"srmTableOdd"%>" ><rsc:item name='<%="num_coders"%>' row="<%=Row%>"/></td>
<td class="<%=even?"srmTableEven":"srmTableOdd"%>" >
<% 
DecimalFormat df = new DecimalFormat("0.00");
coder_percent = (float)total / total_coders*100;
coder_percent_stg = df.format(coder_percent);
df = null;
%>
<%=coder_percent_stg%>%
</td>
</tr><%even=!even;%>
  </rsc:iterator>

</table>
