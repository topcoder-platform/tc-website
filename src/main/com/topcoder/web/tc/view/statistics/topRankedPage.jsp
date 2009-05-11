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
    if(paramStr.equals("top_conceptors"))
    {
        title+="conceptors";
        header+="Conceptors";
        nodeVal="top_rated_conceptors";
    }
    else if(paramStr.equals("top_specificators"))
    {
        title+="specificators";
        header+="Specificators";
        nodeVal="top_rated_specificators";
    }
    else if(paramStr.equals("top_architects"))
    {
        title+="architects";
        header+="Architects";
        nodeVal="top_rated_architects";
    }
    else if(paramStr.equals("top_assemblers"))
    {
        title+="assemblers";
        header+="Assemblers";
        nodeVal="top_rated_assemblers";
    }
    else if(paramStr.equals("top_testers"))
    {
        title+="testers";
        header+="Testers";
        nodeVal="top_rated_testers";
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


<br><br>
The <strong><%=title%></strong> that have competed in the last 180 days:
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
         <TD CLASS="value"><tc-webtag:handle coderId='<%=resultRow.getLongItem("coder_id")%>' context="design" /></TD>
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
