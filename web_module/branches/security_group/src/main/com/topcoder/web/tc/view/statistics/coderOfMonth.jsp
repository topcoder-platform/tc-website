<%@ page import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer,
                 java.util.Map"%>
<%@ page import="com.topcoder.web.tc.Constants"%>
<%@ page import="com.topcoder.web.common.tag.HandleTag"%>
<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Statistics</title>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<jsp:include page="/style.jsp">
  <jsp:param name="key" value="tc_main"/>
</jsp:include>
<% ResultSetContainer results = (ResultSetContainer)((Map)request.getAttribute("resultMap")).get("com_history"); %>

    <%
       int type = Integer.parseInt((String)request.getAttribute(Constants.ACHIEVEMENT_TYPE_ID));
        String node="";
        String pageTitle="";
        String handleFlag="";
        boolean ccom=false;
       switch(type) {
        case Constants.ACHIEVEMENT_TYPE_ALGO_COM:
            node="algo_com";
            pageTitle="Algorithm ";
            handleFlag= HandleTag.ALGORITHM;
            break;
           case Constants.ACHIEVEMENT_TYPE_DEV_COM:
               node="dev_com";
               pageTitle="Development ";
               handleFlag= HandleTag.DEVELOPMENT;
               break;
           case Constants.ACHIEVEMENT_TYPE_DESIGN_COM:
               node="des_com";
               pageTitle="Design ";
               handleFlag= HandleTag.DESIGN;
               break;
           case Constants.ACHIEVEMENT_TYPE_COM:
               node="m_com";
               ccom=true;
               break;

    }



        %>

</head>

<body>

<jsp:include page="../top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">
<!-- Left Column Begins-->
      <td width="180">
         <%--or "des_com" or "dev_com"--%>
         <jsp:include page="/includes/global_left.jsp">
            <jsp:param name="node" value="<%=node%>"/>
         </jsp:include>
      </td>
<!-- Left Column Ends -->

<!-- Center Column Begins -->
      <td width="100%" valign="top" align="center">

<div class="fixedWidthBody">

<jsp:include page="../page_title.jsp" >
<jsp:param name="image" value="statistics_w"/>
<jsp:param name="title" value="Coder of the Month Archive"/>
</jsp:include>

<table class="stat" cellpadding="0" cellspacing="0" width="250" style="float: left; margin-right: 15px; margin-bottom: 200px;">
   <tr>
      <td class="title" colspan="2"><%=pageTitle%>Coder of the Month</td>
   </tr>
   <tr>
      <td class="header">Handle</td>
      <td class="headerR">Month</td>
   </tr>
   <% boolean even = false; %>
   <rsc:iterator list="<%=results%>" id="resultRow">
       <tr class="<%=even?"dark":"light"%>">
          <td class="value"><tc-webtag:handle coderId='<%=resultRow.getLongItem("coder_id")%>' context="<%=handleFlag%>"/></td>
          <td class="valueR"><rsc:item name="achievement_date" row="<%=resultRow%>" format="MM/yyyy"/></td>
       </tr>
       <% even = !even;%>
   </rsc:iterator>
</table>

<span class="bodyText">
<span class="title"><%=pageTitle%> Coder<br>of the Month</span>
<br><br>
TopCoder reserves the title of Coder of the Month for any member who has had an outstanding month of competition. These members may have had an exceptionally high rating increase for the month, earned a large amount of winnings, or has had an impressive winning streak.
<br><br>
    <% if (!ccom) {%>
View the <A href="/tc?module=COMHistory&amp;<%=Constants.ACHIEVEMENT_TYPE_ID%>=<%=Constants.ACHIEVEMENT_TYPE_COM%>">Classic Coder of the Month Archive</A>
    <% } else {%>
    Note: As of April, 2006 TopCoder has stopped awarding Coder of the Month and split the distinction up into Algorithm, Design and Development Coders of the Month.
    <% } %>
</span>

</div>
        </td>
<!-- Center Column Ends -->

<!-- Right Column Begins -->
         <td width="170">
            <jsp:include page="../public_right.jsp">
               <jsp:param name="level1" value="privatelabel"/>
            </jsp:include>
         </td>
<!-- Right Column Ends -->

<!-- Gutter -->
         <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<!-- Gutter Ends -->
    </tr>
</table>

<jsp:include page="../foot.jsp" />

</body>

</html>
