<%@ page import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer"%>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<% ResultSetContainer nextSRM= (ResultSetContainer)request.getAttribute("Next_SRM");%>

<A href="#"><strong><rsc:item set="<%=nextSRM%>" name="contest_name"/></strong></A><br/>
<rsc:item set="<%=nextSRM%>" name="registration_start" format="E, M d"/><br/>
Register: <rsc:item set="<%=nextSRM%>" name="registration_start" format="h:mma"/> ET<br/>
Compete: <rsc:item set="<%=nextSRM%>" name="coding_start" format="h:mma"/> ET
