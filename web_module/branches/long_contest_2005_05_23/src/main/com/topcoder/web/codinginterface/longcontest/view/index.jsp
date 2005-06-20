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
<rsc:iterator list="<%=problems%>" id="resultRow">
<tr><td>
<A href="/longcontest/longcontest?module=Submit&<%=Constants.COMPONENT_ID%>=<rsc:item name="component_id" row="<%=resultRow%>"/>&<%=Constants.ROUND_ID%>=<rsc:item name="round_id" row="<%=resultRow%>"/>&<%=Constants.CONTEST_ID%>=<rsc:item name="contest_id" row="<%=resultRow%>"/>">
<rsc:item name="class_name" row="<%=resultRow%>"/></a>
</td><td>
<rsc:item name="end_date" row="<%=resultRow%>"/>
</td></tr>
</rsc:iterator>
</table>


