<%@ page import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer"%>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<% ResultSetContainer nextSRM= (ResultSetContainer)request.getAttribute("Next_SRM");%>

<A href="#"><strong><rsc:item set="<%=nextSRM%>" name="contest_name"/></strong></A><br/>
Tuesday, December 30<br/>
Register: <rsc:item set="<%=nextSRM%>" name="registration_start" format="hh:mma"/> ET<br/>
Compete: <rsc:item set="<%=nextSRM%>" name="coding_start" format="hh:mma"/> ET
