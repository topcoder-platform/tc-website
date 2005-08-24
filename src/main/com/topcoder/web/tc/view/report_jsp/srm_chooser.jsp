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

          ,
          com.topcoder.web.common.SessionInfo,
          com.topcoder.security.TCSubject,
          com.topcoder.security.admin.PrincipalMgrRemote,
          com.topcoder.web.common.security.BasicAuthentication,
          com.topcoder.web.common.security.SessionPersistor,
          com.topcoder.web.common.security.WebAuthentication,
          com.topcoder.web.common.HttpObjectFactory,
          com.topcoder.web.common.TCResponse,
          com.topcoder.web.common.TCRequest"

%>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%


                com.topcoder.shared.dataAccess.Request dataRequest = new com.topcoder.shared.dataAccess.Request();
				dataRequest.setContentHandle("srm_drop_down");
				           DataAccessInt dai = new CachedDataAccess(
                                    dataRequest.getProperty(Constants.DB_KEY, Query.TRANSACTIONAL));
                    Map dataMap = null;
                    dataMap = dai.getData(dataRequest);

					ResultSetContainer rsc = (ResultSetContainer)dataMap.get("srm_qry_chooser");
					String link=request.getParameter("link")==null?"srm_index":request.getParameter("link");
			%>




<table width="100%">
<tr><td>
<select name="round" onChange="goTo(this)">
	<option value='#'>Select SRM to view...</option>
		<rsc:iterator list="<%=rsc%>" id="Row" >
				<option value='<%=link%>.jsp?rd=<rsc:item name="id" row='<%=Row%>'/>'>
		<rsc:item name="contest_name" row='<%=Row%>'/></option>
	</rsc:iterator>
 </select></td>

 </tr>
  </table>