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
		  java.math.BigInteger,
		  java.text.NumberFormat
		  "

%>
<%@ taglib uri="/WEB-INF/rsc-taglib.tld" prefix="rsc" %>
<%
                com.topcoder.shared.dataAccess.Request dataRequest = new com.topcoder.shared.dataAccess.Request();
				dataRequest.setContentHandle("srm_demo_part_by_region");
				dataRequest.setProperty("rd", request.getParameter("rd")==null?"4445":request.getParameter("rd"));
				           DataAccessInt dai = new DataAccess(
                                    dataRequest.getProperty(Constants.DB_KEY, Query.TRANSACTIONAL));
                    Map dataMap = null;
                    dataMap = dai.getData(dataRequest);
					ResultSetContainer rsc = (ResultSetContainer)dataMap.get("srm_demo_part_by_region");
long total_coders;
long new_coders;
%>	
<table width="100%" class="srmFrame">
<tr><td colspan="4" class="srmQuestion">U.S. Participation by Region</td></tr>
<tr>
<td class="bodyText"><strong>Region</strong></td>
<td class="bodyText"><strong>All</strong></td>
<td class="bodyText"><strong>New</strong></td>
<td class="bodyText"><strong>% New</strong></td>
</tr>
<%!
private String getPercent (long subs, long succ)
{
	double ret2 = 0;
	if (succ == 0)
   {
   	ret2 = (double)succ;
   	}
   else
    {
	ret2 = (double)succ / subs;
	}
	NumberFormat df = NumberFormat.getPercentInstance();	
   	df.setMinimumFractionDigits(2);
   	df.setMaximumFractionDigits(2);
   	return df.format(ret2);
}
%>
<%boolean even=false;%>
  <rsc:iterator list="<%=rsc%>" id="Row" >
<tr>
  <td class="<%=even?"srmTableEven":"srmTableOdd"%>" ><rsc:item name='<%="region_name"%>' row="<%=Row%>" format="h:mm a"/></td>
  <td class="<%=even?"srmTableEven":"srmTableOdd"%>" ><rsc:item name='<%="total"%>' row="<%=Row%>"/></td>
  <td class="<%=even?"srmTableEven":"srmTableOdd"%>" ><rsc:item name='<%="new"%>' row="<%=Row%>"/></td>
<% total_coders = Long.parseLong(Row.getItem("total").toString());
new_coders = Long.parseLong(Row.getItem("new").toString()); %>
  <td class="<%=even?"srmTableEven":"srmTableOdd"%>" ><%= getPercent(total_coders, new_coders) %></td>
</tr><%even=!even;%>
</rsc:iterator>
</table>
  