
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
				dataRequest.setContentHandle("srm_demo_part");
				dataRequest.setProperty("rd", request.getParameter("rd")==null?"4445":request.getParameter("rd"));
								
				           DataAccessInt dai = new DataAccess(
                                    dataRequest.getProperty(Constants.DB_KEY, Query.TRANSACTIONAL));
                    Map dataMap = null;
                    dataMap = dai.getData(dataRequest);
					
					ResultSetContainer rsc = (ResultSetContainer)dataMap.get("srm_demo_part_by_country");
					
			%>	
			
			
<%! 
private String getPercentage (ResultSetContainer total, ResultSetContainer.ResultSetRow val, String col, String col2){
   long tot = Long.parseLong(total.getItem(0,"total").toString());
   long valu = Long.parseLong(val.getItem(col).toString());
   long valu2 = Long.parseLong(val.getItem(col2).toString());
   double ret = (double)valu2 / valu*100;
   DecimalFormat df = new DecimalFormat("0.00");
   return df.format(ret);
   
}
%>
<script language="JavaScript">
<!--
function goTo(selection){
  sel = selection.options[selection.selectedIndex].value;
  if (sel && sel != '#'){
    window.location=sel;
  }
}
// -->
</script>  
	
<table width="100%" class="srmFrame">	
<tr><td colspan="4" class="srmQuestion">Participation Counts (by country)</td></tr>
<tr>
<td class="bodyText"><strong>Country</strong></td>
<td class="bodyText"><strong>Total</strong></td>
<td class="bodyText"><strong>New</strong></td>
<td class="bodyText"><strong>Percent New</strong></td>
</tr>
<%boolean even=false;%>
  <rsc:iterator list="<%=rsc%>" id="Row" >
  <tr>
<td class="<%=even?"srmTableEven":"srmTableOdd"%>" ><rsc:item name='<%="country_name"%>' row="<%=Row%>"/></td>
  <td class="<%=even?"srmTableEven":"srmTableOdd"%>" ><rsc:item name='<%="total"%>' row="<%=Row%>"/></td>
  <td class="<%=even?"srmTableEven":"srmTableOdd"%>" ><rsc:item name='<%="new"%>' row="<%=Row%>"/></td>
   <td class="<%=even?"srmTableEven":"srmTableOdd"%>" ><%=getPercentage(rsc,Row,"total","new")%>%</td>
  </tr><%even=!even;%>
  </rsc:iterator>

</table>
