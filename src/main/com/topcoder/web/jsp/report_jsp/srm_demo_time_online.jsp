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
		  "

%>
<%@ taglib uri="/WEB-INF/rsc-taglib.tld" prefix="rsc" %>
<%
                com.topcoder.shared.dataAccess.Request dataRequest = new com.topcoder.shared.dataAccess.Request();
				dataRequest.setContentHandle("srm_demographic");
				dataRequest.setProperty("rd", request.getParameter("rd")==null?"4445":request.getParameter("rd"));
				
				           DataAccessInt dai = new DataAccess((javax.sql.DataSource)
                            TCContext.getInitial().lookup(
                                    dataRequest.getProperty(Constants.DB_KEY, Query.TRANSACTIONAL)));
                    Map dataMap = null;
                    dataMap = dai.getData(dataRequest);
					
					ResultSetContainer rsc = (ResultSetContainer)dataMap.get("srm_demo_time_online");
					
					
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
  