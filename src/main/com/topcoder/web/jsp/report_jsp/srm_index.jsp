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
  <td width="170"><jsp:include page="srm_nav.jsp" /></td><td colspan="3"><jsp:include page="srm_survey.jsp" /></td>
  </tr>
  <tr>

  <td>&nbsp;</td><td colspan="3"><jsp:include page="srm_chooser.jsp" /></td>
  </tr>
  </table>
  </body>
</html>
