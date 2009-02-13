<%@  page
  language="java"
  import="java.util.*,
          com.topcoder.web.codinginterface.longcontest.*,
          com.topcoder.shared.dataAccess.resultSet.*"

%>
<%@ taglib uri="/WEB-INF/rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="/WEB-INF/tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%
    Map m = null;
    ResultSetContainer.ResultSetRow p;
    m = (Map)request.getAttribute(Constants.LONG_CONTEST_INDEX_KEY);
    ResultSetContainer problems = (ResultSetContainer)m.get("long_problems");
%>


<table>
<tr><td>Contest</td><td>Problem Name</td>
<td></td><td></td><td>Start time</td><td>End time</td></tr>
<rsc:iterator list="<%=problems%>" id="resultRow">
<tr><td>
<rsc:item name="name" row="<%=resultRow%>"/></A>
</td><td>
<A href="longcontest?module=ViewProblem&<%=Constants.COMPONENT_ID%>=<rsc:item name="component_id" row="<%=resultRow%>"/>&<%=Constants.ROUND_ID%>=<rsc:item name="round_id" row="<%=resultRow%>"/>">
<rsc:item name="class_name" row="<%=resultRow%>"/></A>
</td><td>
<%if(!resultRow.getBooleanItem("over") || resultRow.getBooleanItem("practice")){%>
<A href="longcontest?module=Submit&<%=Constants.COMPONENT_ID%>=<rsc:item name="component_id" row="<%=resultRow%>"/>&<%=Constants.ROUND_ID%>=<rsc:item name="round_id" row="<%=resultRow%>"/>&<%=Constants.CONTEST_ID%>=<rsc:item name="contest_id" row="<%=resultRow%>"/>">
Submit</a>
<%}%>
</td><td>
<A href="longcontest?module=ComponentScores&<%=Constants.COMPONENT_ID%>=<rsc:item name="component_id" row="<%=resultRow%>"/>&<%=Constants.ROUND_ID%>=<rsc:item name="round_id" row="<%=resultRow%>"/>">
Standings</a>
</td><td>
<rsc:item name="start_time" row="<%=resultRow%>"/>
</td><td>
<%if(!resultRow.getBooleanItem("practice")){%>
<rsc:item name="end_time" row="<%=resultRow%>"/>
<%}%>
</td></tr>
</rsc:iterator>
</table>


