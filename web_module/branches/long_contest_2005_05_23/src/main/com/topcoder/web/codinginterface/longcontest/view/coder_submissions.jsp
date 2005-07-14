<%@  page
  language="java"
  import="java.util.*,
          java.text.SimpleDateFormat,
          com.topcoder.web.codinginterface.longcontest.*,
          com.topcoder.shared.dataAccess.resultSet.*"

%>
<%@ taglib uri="/WEB-INF/rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="/WEB-INF/tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%
    Map m = null;
    ResultSetContainer.ResultSetRow p;
    m = (Map)request.getAttribute(Constants.LONG_CONTEST_CODER_SUBMISSIONS_KEY);
    ResultSetContainer submissions = (ResultSetContainer)m.get("long_coder_submissions");
    ResultSetContainer tmp = (ResultSetContainer)m.get("long_contest_over");
    boolean over = tmp.getBooleanItem(0,0);
    SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy HH:mm:ss");
%>


<table>
<rsc:iterator list="<%=submissions%>" id="resultRow">
<tr><td>
<rsc:item name="submission_number" row="<%=resultRow%>"/>
</td><td>
<% if(over){ %>
<A href="/longcontest/longcontest?module=ViewCode&<%=Constants.COMPONENT_ID%>=<rsc:item name="component_id" row="<%=resultRow%>"/>&<%=Constants.ROUND_ID%>=<rsc:item name="round_id" row="<%=resultRow%>"/>&<%=Constants.CODER_ID%>=<rsc:item name="coder_id" row="<%=resultRow%>"/>&<%=Constants.SUBMISSION_NUMBER%>=<rsc:item name="submission_number" row="<%=resultRow%>"/>">
<%}%>
<%=sdf.format(new Date(resultRow.getLongItem("submit_time")))%>
<% if(over){ %>
</A>
<%}%>
</td><td>
<rsc:item name="submission_points" row="<%=resultRow%>"/>
</td></tr>
</rsc:iterator>
</table>


