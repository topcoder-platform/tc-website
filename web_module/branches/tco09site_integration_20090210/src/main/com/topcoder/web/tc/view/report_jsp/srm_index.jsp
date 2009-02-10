<%@ page import="com.topcoder.shared.dataAccess.DataAccessInt,
                 com.topcoder.web.common.CachedDataAccess,
                 com.topcoder.common.web.data.report.Constants,
                 java.util.Map,
                 com.topcoder.shared.dataAccess.resultSet.ResultSetContainer,
                 com.topcoder.common.web.data.report.Query"%>
<%@  page
  language="java"%>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<% String round = request.getParameter("rd");
	    if (round==null) {
        com.topcoder.shared.dataAccess.Request dataRequest = new com.topcoder.shared.dataAccess.Request();
                        dataRequest.setContentHandle("most_recent_srm");

                                   DataAccessInt dai = new CachedDataAccess(
                                            dataRequest.getProperty(Constants.DB_KEY, Query.WAREHOUSE));
                            Map dataMap = null;
                            dataMap = dai.getData(dataRequest);

                            ResultSetContainer rsc1 = (ResultSetContainer)dataMap.get("Most_Recent_SRM");
        round = rsc1.getStringItem(0, "round_id");
    } %>



<jsp:include page="css.jsp" />
<jsp:include page="../script.jsp" />


<html>
  <head>
    <title>TopCoder SRM Reports</title>
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
  </head>
  <body>
  <table>
    <tr valign="top">
      <td width="170"><jsp:include page="srm_nav.jsp" >
	    <jsp:param name="rd" value="<%=round%>"/>
		  </jsp:include>
	  </td>
	  <td colspan="3">
	  <table>
	    <tr>
		  <td><jsp:include page="srm_info.jsp" >
		  <jsp:param name="rd" value="<%=round%>"/>
		  </jsp:include>
		  </td>
		</tr>
	    <tr>
		  <td><jsp:include page="srm_chooser.jsp" >
		  <jsp:param name="link" value="srm_index"/>
		  <jsp:param name="rd" value="<%=round%>"/>
		  </jsp:include></td>
		</tr>
		<tr>
		  <td><jsp:include page="srm_survey.jsp" >
		   <jsp:param name="rd" value="<%=round%>"/>
		    </jsp:include>
		  </td>
		</tr>
	  </table>
	</tr>
  </table>
</body>
</html>
