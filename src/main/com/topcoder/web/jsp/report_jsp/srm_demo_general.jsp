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

					
                    

<jsp:include page="css.jsp" />
<jsp:include page="../script.jsp" />


<html>
  <head>
    <title>TopCoder SRM Reports</title>
  </head>
  <body>
  <table>
  <tr valign="top">
  <td width="10%"><jsp:include page="srm_nav.jsp" /></td><td colspan="3"></td>
  </tr>
  <tr>
  <td>&nbsp;</td><td colspan="3"><jsp:include page="srm_chooser.jsp" ><jsp:param name="link" value="srm_demo_general"/></jsp:include></td>
  </tr>
  
  <tr valign="top">
    <tr valign="top">
      <td>&nbsp;</td>
      <td><jsp:include page="srm_demo_part_by_country.jsp" /></td>
      <td rowspan="8">&nbsp;</td>
      <td rowspan="8"><jsp:include page="srm_demo_total_part.jsp" /></td>
    </tr>
	
    <tr valign="top">
      <td>&nbsp;</td>
      <td><jsp:include page="srm_demo_logged_in.jsp" /></td>
	</tr>
	
	<tr valign="top">
      <td>&nbsp;</td>
      <td><jsp:include page="srm_demo_time_online.jsp" /></td>
	</tr>
	
	<tr valign="top">
      <td>&nbsp;</td>
      <td><jsp:include page="srm_demo_last_match.jsp" /></td>
	</tr>
		<tr valign="top">
      <td>&nbsp;</td>
      <td>New Participation Aging (days between registration and this match for new participants)</td>
	</tr>
		<tr valign="top">
      <td>&nbsp;</td>
      <td><jsp:include page="srm_demo_new_part_aging_stud.jsp" /></td>
	</tr>
	</tr>
		<tr valign="top">
      <td>&nbsp;</td>
      <td><jsp:include page="srm_demo_new_part_aging_pro.jsp" /></td>
	</tr>
	</tr>
		<tr valign="top">
      <td>&nbsp;</td>
      <td><jsp:include page="srm_demo_new_part_aging_all.jsp" /></td>
	</tr>
  </tr>
  </table>

 



  </body>
</html>
