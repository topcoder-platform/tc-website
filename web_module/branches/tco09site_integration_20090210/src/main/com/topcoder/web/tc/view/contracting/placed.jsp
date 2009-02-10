<%@ page import="com.topcoder.shared.dataAccess.*,com.topcoder.shared.dataAccess.resultSet.*,
                 com.topcoder.web.tc.Constants" %>

<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
 <% ResultSetContainer list = (ResultSetContainer)request.getAttribute("list"); %>
 
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Employment Opportunities</title>
<jsp:include page="/script.jsp" />
<jsp:include page="/style.jsp">
  <jsp:param name="key" value="tc_stats"/>
</jsp:include>

</head>

<body>

<jsp:include page="../top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">
<!-- Left Column Begins-->
        <td width="180">            <jsp:include page="../includes/global_left.jsp">
                <jsp:param name="node" value="employment_opps"/>
            </jsp:include>
</td>
<!-- Left Column Ends -->

<!-- Center Column Begins -->
        <td class="cardCell" width="100%" align="center">

        <div class="myTCBody">
        <jsp:include page="../page_title.jsp" >
            <jsp:param name="image" value="employmentOpps"/>
            <jsp:param name="title" value="&#160;"/>
        </jsp:include>

         The following members recently got placed by TopCoder Employment Opportunities.

<br><br>
<table class="stat" cellpadding="0" cellspacing="0" width="100%">
   <tr>
      <td class="title" colspan="6">Recently Placed TopCoder Members</td>
   </tr>
   <tr>
      <td class="header">Date</td>
      <td class="header">Member</td>
      <td class="headerR">Compensation</td>
      <td class="header">Industry</td>
      <td class="header">State</td>
      <td class="header">Country</td>
   </tr>
   <%boolean even = false;%>
   <rsc:iterator list="<%=list%>" id="resultRow">
   
   <tr class="<%=(even ? "dark" : "light")%>">
      <td class="value"><rsc:item name="placement_date" format="MM/dd/yyyy" row="<%=resultRow%>"/></td>
      <td class="value"><tc-webtag:ratingColor rating='<%=resultRow.getIntItem("member_rating")%>'><rsc:item name="rating_color" row="<%=resultRow%>"/></tc-webtag:ratingColor></td>
      <td class="valueR"><rsc:item name="compensation" row="<%=resultRow%>"/></td>
      <td class="value"><rsc:item name="industry" row="<%=resultRow%>"/></td>
      <td class="value"><rsc:item name="state" row="<%=resultRow%>"/></td>
      <td class="value"><rsc:item name="country_name" row="<%=resultRow%>"/></td>
   </tr>
   <%even = !even;%>
   </rsc:iterator>
</table>

        <p><br></p>
        </td>
<!-- Center Column Ends -->

<!-- Right Column Begins -->
         <td width="170">
            <jsp:include page="../public_right.jsp">
               <jsp:param name="level1" value="employmentOpps"/>
            </jsp:include>
         </td>
<!-- Right Column Ends -->

    </tr>
</table>

<jsp:include page="../foot.jsp" />

</body>

</html>
