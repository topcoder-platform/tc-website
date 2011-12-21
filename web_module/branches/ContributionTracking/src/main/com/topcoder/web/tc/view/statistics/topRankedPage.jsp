<%--
  - Author: TCSDEVELOPER, pulky
  - Version: 1.1
  - Copyright (C) 2004 - 2009 TopCoder Inc., All Rights Reserved.
  -
  - Description: This page displays the top ranked page.
  -
  - Version 1.1 (Testing Competition Split Release Assembly 1.0) changes: Updated Application Testing to Test Suites.
--%>
<%@ page import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer,
                 java.util.Map"%>

<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%
    String paramStr=request.getParameter("c");
    ResultSetContainer rsc = (ResultSetContainer)
            ((Map)request.getAttribute("QUERY_RESPONSE")).get(paramStr);
    String title="top rated ";
    String header="TopCoder Statistics - Top Ranked ";
    String nodeVal="top_rated_des";
    String ctxt="design";
    if(paramStr.equals("top_conceptors"))
    {
        title+="conceptors";
        header+="Conceptors";
        nodeVal="top_rated_conceptors";
        ctxt="conceptualization";
    }
    else if(paramStr.equals("top_specificators"))
    {
        title+="specificators";
        header+="Specificators";
        nodeVal="top_rated_specificators";
        ctxt="specification";
    }
    else if(paramStr.equals("top_architects"))
    {
        title+="architects";
        header+="Architects";
        nodeVal="top_rated_architects";
        ctxt="architecture";
    }
    else if(paramStr.equals("top_assemblers"))
    {
        title+="assemblers";
        header+="Assemblers";
        nodeVal="top_rated_assemblers";
        ctxt="assembly";
    }
    else if(paramStr.equals("top_testers"))
    {
        title+="testers";
        header+="Testers";
        nodeVal="top_rated_testers";
        ctxt="test_suites";
    }
%>

<HTML>
 <HEAD>
   <TITLE><%=header%></TITLE>
<jsp:include page="/script.jsp"/>
<jsp:include page="/style.jsp">
  <jsp:param name="key" value="tc_stats"/>
</jsp:include>

 </HEAD>
 <body>

   <jsp:include page="/top.jsp" />
   <TABLE WIDTH="100%" BORDER="0" CELLPADDING="0" CELLSPACING="0">
     <TR valign="top">
        <TD WIDTH="180">
<!-- Left nav begins -->
         <jsp:include page="/includes/global_left.jsp">
            <jsp:param name="node" value="<%=nodeVal%>"/>
         </jsp:include>
<!-- Left nav ends -->
        </TD>

<!-- Center Column Begins -->
<td width="100%" align="center" class="bodyColumn">

<div class="fixedWidthBody">
<jsp:include page="/page_title.jsp" >
<jsp:param name="image" value="statistics_w"/>
<jsp:param name="title" value="<%=header%>"/>
</jsp:include>


<A href="/tc?&ph=112&module=LeaderBoard" class="bcLink">Design Cup Series Leaderboard</a><br>
<A href="/tc?&ph=113&module=LeaderBoard" class="bcLink">Development Cup Series Leaderboard</a><br>
<A href="/tc?module=RookieBoard&ph=112" class="bcLink">Design Cup Series ROTY Leaderboard</a><br>
<A href="/tc?module=RookieBoard&ph=113" class="bcLink">Development Cup Series ROTY Leaderboard</a>

<br><br>

   <div align="center">

   <table class="stat" cellpadding="0" cellspacing="0" width="500">
      <tr>
         <td class="title" colspan="3"><%=header%></td>
      </tr>
      <tr>
         <td class="headerC">
            Rank
         </td>
         <td class="header" width="100%">
            Handle
         </td>
         <td class="headerR">
            Rating
         </td>
      </tr>
      <%boolean even = false;%>
      <rsc:iterator list="<%=rsc%>" id="resultRow">
      <tr class="<%=even?"dark":"light"%>">
         <TD CLASS="valueC"><rsc:item name="rank" row="<%=resultRow%>"/></TD>
         <TD CLASS="value"><tc-webtag:handle coderId='<%=resultRow.getLongItem("coder_id")%>' context="<%=ctxt%>" /></TD>
         <TD CLASS="valueR"><rsc:item name="rating" row="<%=resultRow%>" format="#"/></TD>
      </TR>
      <%even=!even;%>
      </rsc:iterator>
   </table>

   </div>
</div>
       </TD>
       <td WIDTH="180" VALIGN="top">
         <jsp:include page="/public_right.jsp" >
             <jsp:param name="level1" value="profile"/>
         </jsp:include>
       </TD>
    <!-- Gutter -->
    <td WIDTH="10"><IMG SRC="/i/clear.gif" WIDTH="10" HEIGHT="1" border="0"/></TD>
    <!-- Gutter Ends -->
     </tr>
   </TABLE>
   <jsp:include page="/foot.jsp" />
 </BODY>
</HTML>