
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
		  "
%>
<%@ taglib uri="/WEB-INF/rsc-taglib.tld" prefix="rsc" %>
<%
                com.topcoder.shared.dataAccess.Request dataRequest = new com.topcoder.shared.dataAccess.Request();
				dataRequest.setContentHandle("srm_demo_total_part");
				dataRequest.setProperty("rd", request.getParameter("rd")==null?"4445":request.getParameter("rd"));
				           DataAccessInt dai = new DataAccess(
                                    dataRequest.getProperty(Constants.DB_KEY, Query.TRANSACTIONAL));
                    Map dataMap = null;
                    dataMap = dai.getData(dataRequest);
					ResultSetContainer rsc = (ResultSetContainer)dataMap.get("srm_demo_total_part");

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
</tr><rsc:iterator list="<%=rsc%>" id="Row" ><% total_coders += Long.parseLong(Row.getItem("num_coders").toString()); %></rsc:iterator><%boolean even=false;%><rsc:iterator list="<%=rsc%>" id="Row" >
<tr>
  <td class="<%=even?"srmTableEven":"srmTableOdd"%>" ><rsc:item name='<%="num_ratings"%>' row="<%=Row%>"/></td><% total = total + Long.parseLong(Row.getItem("num_coders").toString()); %>
  <td class="<%=even?"srmTableEven":"srmTableOdd"%>" ><rsc:item name='<%="num_coders"%>' row="<%=Row%>"/></td>
  <td class="<%=even?"srmTableEven":"srmTableOdd"%>" ><% DecimalFormat df = new DecimalFormat("0.00");
coder_percent = (float)total / total_coders*100;
coder_percent_stg = df.format(coder_percent);
df = null;%><%=coder_percent_stg%>%
</td>
</tr><%even=!even;%></rsc:iterator>
</table>
