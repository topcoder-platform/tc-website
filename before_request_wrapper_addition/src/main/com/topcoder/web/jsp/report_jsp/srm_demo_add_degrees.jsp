
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
				dataRequest.setContentHandle("srm_demo_add");
				dataRequest.setProperty("rd", request.getParameter("rd")==null?"4445":request.getParameter("rd"));
								
				           DataAccessInt dai = new DataAccess(
                                    dataRequest.getProperty(Constants.DB_KEY, Query.TRANSACTIONAL));
                    Map dataMap = null;
                    dataMap = dai.getData(dataRequest);
					
					ResultSetContainer rsc = (ResultSetContainer)dataMap.get("srm_demo_add_degrees");
String avg_rating_stg;
%>	
<table width="100%" class="srmFrame">	
  <tr>
    <td colspan="3" class="srmQuestion">School Degrees (students)</td>
	</tr>
  <tr>
    <td class="bodyText"><strong>Degree Level</strong></td>
    <td class="bodyText"><strong>Grad Year</strong></td>
    <td class="bodyText"><strong>Coders</strong></td>
  </tr>
  <%boolean even=false;%>
  <rsc:iterator list="<%=rsc%>" id="Row" >
    <tr>
      <td class="<%=even?"srmTableEven":"srmTableOdd"%>" ><rsc:item name='<%="degree"%>' row="<%=Row%>"/></td>
      <td class="<%=even?"srmTableEven":"srmTableOdd"%>" ><rsc:item name='<%="year"%>' row="<%=Row%>"/></td>
      <td align = right class="<%=even?"srmTableEven":"srmTableOdd"%>" ><rsc:item name='<%="cnt"%>' row="<%=Row%>"/></td>
    </tr>
    <%even=!even;%>
  </rsc:iterator>
</table>
