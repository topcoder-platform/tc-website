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
  