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
				
				           DataAccessInt dai = new DataAccess(
                                    dataRequest.getProperty(Constants.DB_KEY, Query.TRANSACTIONAL));
                    Map dataMap = null;
                    dataMap = dai.getData(dataRequest);
					
					ResultSetContainer rsc = (ResultSetContainer)dataMap.get("srm_demo_new_part_aging_all");

long zerotwo_total = 0;
long threeseven_total = 0;
long eightfourteen_total = 0;
long fifteenthirty_total = 0;
long thirtyonesixty_total = 0;
long sixtyoneninety_total = 0;
long ninetyplus_total = 0;
long total = 0;
long row_total =0;
%>	





<table width="100%" class="srmFrame">
<tr><td colspan="9" class="srmQuestion">ALL</td></tr>
<tr>
<td class="bodyText"><strong>Refferal Type</strong></td>
<td class="bodyText"><strong>0-2 days</strong></td>
<td class="bodyText"><strong>3-7 days</strong></td>
<td class="bodyText"><strong>8-14 days</strong></td>
<td class="bodyText"><strong>15-30 days</strong></td>
<td class="bodyText"><strong>31-60 days</strong></td>
<td class="bodyText"><strong>61-90 days</strong></td>
<td class="bodyText"><strong>90+ days</strong></td>
<td class="bodyText"><strong>Total</strong></td>
</tr>

<%boolean even=false;%>
  <rsc:iterator list="<%=rsc%>" id="Row" >
<tr>
  <td class="<%=even?"srmTableEven":"srmTableOdd"%>" ><rsc:item name='<%="referral_desc"%>' row="<%=Row%>"/></td>
  <td class="<%=even?"srmTableEven":"srmTableOdd"%>" ><rsc:item name='<%="zerotwo"%>' row="<%=Row%>"/></td>
  <td class="<%=even?"srmTableEven":"srmTableOdd"%>" ><rsc:item name='<%="threeseven"%>' row="<%=Row%>"/></td>
  <td class="<%=even?"srmTableEven":"srmTableOdd"%>" ><rsc:item name='<%="eightfourteen"%>' row="<%=Row%>"/></td>
  <td class="<%=even?"srmTableEven":"srmTableOdd"%>" ><rsc:item name='<%="fifteenthirty"%>' row="<%=Row%>"/></td>
  <td class="<%=even?"srmTableEven":"srmTableOdd"%>" ><rsc:item name='<%="thirtyonesixty"%>' row="<%=Row%>"/></td>
  <td class="<%=even?"srmTableEven":"srmTableOdd"%>" ><rsc:item name='<%="sixtyoneninety"%>' row="<%=Row%>"/></td>
  <td class="<%=even?"srmTableEven":"srmTableOdd"%>" ><rsc:item name='<%="ninetyplus"%>' row="<%=Row%>"/></td>
<% 
row_total =  Long.parseLong(Row.getItem("zerotwo").toString()) + Long.parseLong(Row.getItem("threeseven").toString()) + Long.parseLong(Row.getItem("eightfourteen").toString()) + Long.parseLong(Row.getItem("fifteenthirty").toString()) + Long.parseLong(Row.getItem("thirtyonesixty").toString()) + Long.parseLong(Row.getItem("sixtyoneninety").toString()) + Long.parseLong(Row.getItem("ninetyplus").toString());
zerotwo_total = zerotwo_total + Long.parseLong(Row.getItem("zerotwo").toString());
threeseven_total = threeseven_total + Long.parseLong(Row.getItem("threeseven").toString());
eightfourteen_total = eightfourteen_total + Long.parseLong(Row.getItem("eightfourteen").toString());
fifteenthirty_total = fifteenthirty_total + Long.parseLong(Row.getItem("fifteenthirty").toString());
thirtyonesixty_total = thirtyonesixty_total + Long.parseLong(Row.getItem("thirtyonesixty").toString());
sixtyoneninety_total = sixtyoneninety_total + Long.parseLong(Row.getItem("sixtyoneninety").toString());
ninetyplus_total = ninetyplus_total + Long.parseLong(Row.getItem("ninetyplus").toString());
%>
  <td class="<%=even?"srmTableEven":"srmTableOdd"%>" ><%= row_total %></td>
</tr>
<%even=!even;%>
</rsc:iterator>
<% total =  zerotwo_total + threeseven_total + eightfourteen_total + fifteenthirty_total + thirtyonesixty_total + sixtyoneninety_total + ninetyplus_total; %>
<tr>
  <td class="<%=even?"srmTableEven":"srmTableOdd"%>" ><strong>Totals:</strong></td>
  <td class="<%=even?"srmTableEven":"srmTableOdd"%>" ><strong><%=zerotwo_total%></strong></td>
  <td class="<%=even?"srmTableEven":"srmTableOdd"%>" ><strong><%=threeseven_total%></strong></td>
  <td class="<%=even?"srmTableEven":"srmTableOdd"%>" ><strong><%=eightfourteen_total%></strong></td>
  <td class="<%=even?"srmTableEven":"srmTableOdd"%>" ><strong><%=fifteenthirty_total%></strong></td>
  <td class="<%=even?"srmTableEven":"srmTableOdd"%>" ><strong><%=thirtyonesixty_total%></strong></td>
  <td class="<%=even?"srmTableEven":"srmTableOdd"%>" ><strong><%=sixtyoneninety_total%></strong></td>
  <td class="<%=even?"srmTableEven":"srmTableOdd"%>" ><strong><%=ninetyplus_total%></strong></td>
  <td class="<%=even?"srmTableEven":"srmTableOdd"%>" ><strong><%= total %></strong></td>
</tr>
</table>
  