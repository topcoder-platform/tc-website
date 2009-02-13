<%@  page
  language="java"
  import="java.util.*,
          com.topcoder.common.web.data.report.Constants,
          com.topcoder.shared.dataAccess.DataAccessConstants,
          com.topcoder.common.web.data.report.Query,
		  com.topcoder.shared.dataAccess.*,
		  com.topcoder.shared.dataAccess.resultSet.*,
		  com.topcoder.shared.util.TCContext
		  "

%>
<%@ taglib uri="/WEB-INF/rsc-taglib.tld" prefix="rsc" %>
<%
                com.topcoder.shared.dataAccess.Request dataRequest = new com.topcoder.shared.dataAccess.Request();
				dataRequest.setContentHandle("srm_demo_last_match");
				dataRequest.setProperty("rd", request.getParameter("rd")==null?"4445":request.getParameter("rd"));
				
				           DataAccessInt dai = new DataAccess(
                                    dataRequest.getProperty(Constants.DB_KEY, Query.TRANSACTIONAL));
                    Map dataMap = null;
                    dataMap = dai.getData(dataRequest);
					
					ResultSetContainer rsc = (ResultSetContainer)dataMap.get("srm_demo_last_match");
					
					
			%>	
<table width="100%" class="srmFrame">
<tr><td colspan="2" class="srmQuestion">Repeat Participant Aging</td></tr>
<tr>
<td class="bodyText"><strong>(days since last rated match before this one)</strong></td>
<td class="bodyText"><strong>Count</strong></td>
</tr>

<tr>
<td class="srmTableEven">1 to 7 days</td>
<td class="srmTableEven"><%= rsc.getItem(0,"onetoseven") %></td>
</tr>
<tr>
<td class="srmTableOdd">8 to 14 days</td>
<td class="srmTableOdd"><%= rsc.getItem(0,"eighttofourteen") %></td>
</tr>
<tr>
<td class="srmTableEven">15 to 30 days</td>
<td class="srmTableEven"><%= rsc.getItem(0,"fifteentothirty") %></td>
</tr>
<tr>
<td class="srmTableOdd">31 to 60 days</td>
<td class="srmTableOdd"><%= rsc.getItem(0,"thirtyonetosixty") %></td>
</tr>
<tr>
<td class="srmTableEven">61 to 90 days</td>
<td class="srmTableEven"><%= rsc.getItem(0,"sixtyonetoninety") %></td>
</tr>
<tr>
<td class="srmTableOdd">more than 90 days</td>
<td class="srmTableOdd"><%= rsc.getItem(0,"ninetyplus") %></td>
</tr>
</table>
