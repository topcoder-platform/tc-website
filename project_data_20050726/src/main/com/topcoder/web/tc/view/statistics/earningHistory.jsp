<%@ page 
  language="java"
  import="com.topcoder.shared.dataAccess.*,com.topcoder.shared.dataAccess.resultSet.*"

%>

<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="/tc-webtags.tld" prefix="tc-webtag" %>

<HTML>
 <HEAD>
   <TITLE>TopCoder Statistics</TITLE>
   <LINK REL="stylesheet" TYPE="text/css" HREF="/css/style.css"/>
   <LINK REL="stylesheet" TYPE="text/css" HREF="/css/coders.css"/>
   <LINK REL="stylesheet" TYPE="text/css" HREF="/css/stats.css"/>
   <jsp:include page="../script.jsp" />
 </HEAD>
 <BODY>
   <jsp:include page="../top.jsp" />
   <TABLE WIDTH="100%" BORDER="0" CELLPADDING="0" CELLSPACING="0">
     <TR>
       <TD WIDTH="180" VALIGN="top">
            <jsp:include page="../includes/global_left.jsp">
                <jsp:param name="level1" value="statistics"/>
                <jsp:param name="level2" value="earnings_history"/>
            </jsp:include>
       </TD>
<!-- Center Column Begins -->
<td class="statTableSpacer" width="100%" valign="top">

<jsp:include page="../page_title.jsp" >
<jsp:param name="image" value="statistics_w"/>
<jsp:param name="title" value="Algorithm Earnings History"/>
</jsp:include>

<span class="bigHandle">Coder:&#160;<tc-webtag:handle coderId='<%=request.getParameter("cr")%>' context="algorithm"/></span>
<br>
<span class="bodySubtitle">Algorithm Statistics&#160;>&#160;</span><br>
<span class="bc">
<A HREF="/tc?module=MemberProfile&cr=<%=request.getParameter("cr")%>" class="bcLink">Member Profile</A>
&#160;|&#160;<A HREF='/stat?c=ratings_history&cr=<%=request.getParameter("cr")%>' class="bcLink">Rating History</A>
<%--
&#160;|&#160;<A HREF="JavaScript:getGraph('/graph?c=rating_history_graph&amp;cr=<%=request.getParameter("cr")%>','800','600', 'history')" class="bcLink">Rating History Graph</A>
--%>
&#160;|&#160;<A HREF="JavaScript:getGraph('/graph?c=rating_distribution_graph','600','400', 'distribution')" class="bcLink">Rating Distribution Graph</A>
&#160;|&#160;Earnings History
</span>

<bean:define id="nameColor" name="CODER_COLORS" scope="application" toScope="page"/>
<bean:define name="QUERY_RESPONSE" id="queryEntries" type="java.util.Map" scope="request"/>

<% 
Request srb = (Request) request.getAttribute("REQUEST_BEAN");
pageContext.setAttribute("coder_id", srb.getProperty("cr","0000"));
ResultSetContainer rsc = (ResultSetContainer) queryEntries.get("Basic_Coder_Information");
boolean bEmpty = (rsc == null || rsc.size()!=1);
if (!bEmpty) {
  ResultSetContainer.ResultSetRow rsr = rsc.getRow(0);
  pageContext.setAttribute("resultRow", rsr);
%>

    <bean:define id="coderrank" name="resultRow" property='<%= "item[" + 1 /*"coder_score"*/ + "]" %>'/>      
<% 
} //end if not empty
ResultSetContainer rsc2 = (ResultSetContainer) queryEntries.get("Earnings_History");
pageContext.setAttribute("resultSet", rsc2);

//calculate scrolling information
//1. pick apart parms
String sStartRow=srb.getProperty("sr","1");
pageContext.setAttribute("sr", sStartRow);
String sEndRow = srb.getProperty("er",Integer.toString(rsc2.size()));
pageContext.setAttribute("er", sEndRow);
String sNumRow = srb.getProperty("nr",Integer.toString(rsc2.size()));
pageContext.setAttribute("nr", sNumRow);

//2. calculate next scroll
int iTemp = Integer.parseInt(sEndRow)+1;
pageContext.setAttribute("next_sr", Integer.toString(iTemp));
iTemp += Integer.parseInt(sNumRow)-1;
pageContext.setAttribute("next_er", Integer.toString(iTemp));

//3. now calculate previous scroll
iTemp = Math.max(1,Integer.parseInt(sStartRow)-1);
pageContext.setAttribute("prev_er", Integer.toString(iTemp));
iTemp = Math.max(1,(iTemp-Integer.parseInt(sNumRow)+1));
pageContext.setAttribute("prev_sr", Integer.toString(iTemp));

String sortString = "";
if (srb.getProperty("sq")!=null){
  sortString="&sq=" + srb.getProperty("sq");
  sortString+="&sc=" + srb.getProperty("sc");
  sortString+="&sd=" + srb.getProperty("sd", "desc");  
}
String sSortUrl = "/stat?c=earnings_history&cr="+srb.getProperty("cr")+"&sq=Earnings_History";
%>

<% if (!bEmpty) { %>  
   <% if (rsc2.croppedDataBefore() ||  rsc2.croppedDataAfter()) { %>
   <div class="pagingBox">
      <% if (rsc2.croppedDataBefore()) { %>
      <a href="/stat?c=earnings_history&cr=<%=pageContext.getAttribute("coder_id").toString() %>&sr=<%=pageContext.getAttribute("prev_sr").toString() %>&er=<%=pageContext.getAttribute("prev_er").toString() %>&nr=<%=pageContext.getAttribute("nr").toString() %><%=sortString%>" class="bcLink">&lt;&lt; previous</a>   
      <% } else { %>
      &lt;&lt; previous  
      <% } %>
      &nbsp;|&nbsp;
      <% if (rsc2.croppedDataAfter()) { %>
          <a href="/stat?c=earnings_history&cr=<%=pageContext.getAttribute("coder_id").toString() %>&sr=<%=pageContext.getAttribute("next_sr").toString() %>&er=<%=pageContext.getAttribute("next_er").toString() %>&nr=<%=pageContext.getAttribute("nr").toString() %><%=sortString%>" class="bcLink">next &gt;&gt;</a>
      <% } else { %>
           next &gt;&gt;           
      <% } %>
   </div>
   <% } else { %>
   <div class="pagingBox">&#160;</div>
   <% } %>

<table cellpadding="0" cellspacing="0" border="0" width="100%" class="statTableHolder">
   <tr>
      <td>               
      <table cellpadding="0" cellspacing="0" border="0" width="100%" class="statTable">
         <tr><td class="tableTitle" colspan="6">Algorithm Earnings History</td></tr>
         <tr>
            <TD CLASS="tableHeader"><a href="<%=sSortUrl%>&sc=3&sd=<%= "3".equals(srb.getProperty("sc")) && srb.getProperty("sd","desc").equals("desc") ?"asc":"desc"%>">Date</a></TD>  
            <TD CLASS="tableHeader" WIDTH="50%"><a href="<%=sSortUrl%>&sc=4&sd=<%= "4".equals(srb.getProperty("sc")) && srb.getProperty("sd","desc").equals("desc") ?"asc":"desc"%>">Contest</a></TD>
            <TD CLASS="tableHeader" WIDTH="30%" WIDTH="18%"><a href="<%=sSortUrl%>&sc=1&sd=<%= "1".equals(srb.getProperty("sc")) && srb.getProperty("sd","desc").equals("desc") ?"asc":"desc"%>">Round</a></TD>
            <TD CLASS="tableHeader" WIDTH="5%" ALIGN="right"><a href="<%=sSortUrl%>&sc=5&sd=<%= "5".equals(srb.getProperty("sc")) && srb.getProperty("sd","desc").equals("desc") ?"asc":"desc"%>">Position</a></TD>
            <TD CLASS="tableHeader" WIDTH="5%" ALIGN="right"><a href="<%=sSortUrl%>&sc=6&sd=<%= "6".equals(srb.getProperty("sc")) && srb.getProperty("sd","desc").equals("desc") ?"asc":"desc"%>">Amount</a></TD>      
            <TD CLASS="tableHeader" WIDTH="10%" ALIGN="right" nowrap="nowrap"><a href="<%=sSortUrl%>&sc=8&sd=<%= "8".equals(srb.getProperty("sc")) && srb.getProperty("sd","desc").equals("desc") ?"asc":"desc"%>">Payment Type</a></TD>      
         </tr>
      <%boolean even = true;%>
      <logic:iterate name="resultSet" id="resultRow2" type="ResultSetContainer.ResultSetRow">
         <tr>
            <TD class="<%=even?"statLt":"statDk"%>"><bean:write format="MM.dd.yy" name="resultRow2" property='<%= "item[" + 3 /* event date */ + "].resultData" %>'/></TD>
            <TD class="<%=even?"statLt":"statDk"%>"><A HREF="/stat?c=coder_room_stats&cr=<%=pageContext.getAttribute("coder_id").toString() %>&rd=<bean:write name="resultRow2" property='<%= "item[" + 0 /* round id */ + "]" %>'/>&rm=<bean:write name="resultRow2" property='<%= "item[" + 7 /* room id */ + "]" %>'/>" class="statLink"><bean:write name="resultRow2" property='<%= "item[" + 4 /* contest name */ + "]" %>'/></A></TD>
            <TD class="<%=even?"statLt":"statDk"%>"><A HREF="/stat?c=coder_room_stats&cr=<%=pageContext.getAttribute("coder_id").toString() %>&rd=<bean:write name="resultRow2" property='<%= "item[" + 0 /* round id */ + "]" %>'/>&rm=<bean:write name="resultRow2" property='<%= "item[" + 7 /* room id */ + "]" %>'/>" class="statLink"><bean:write name="resultRow2" property='<%= "item[" + 1 /* round name */ + "]" %>'/></A></TD>
            <TD class="<%=even?"statLt":"statDk"%>" ALIGN="right"><bean:write name="resultRow2" property='<%= "item[" + 5 /* finish place */ + "]" %>'/></TD>
            <TD class="<%=even?"statLt":"statDk"%>" ALIGN="right">$&nbsp;<bean:write format="0.00" name="resultRow2" property='<%= "item[" + 6 /* money */ + "].resultData" %>'/></TD>
            <TD class="<%=even?"statLt":"statDk"%>" ALIGN="right" nowrap="nowrap"><bean:write name="resultRow2" property='<%= "item[" + 8 /* payment_type_desc */ + "].resultData" %>'/></TD>
         </tr>
      <%even=!even;%>
      </logic:iterate>
      </TABLE>
      </TD>
   </TR>
</TABLE>
<% } else { %>
   This member has no earnings history.
<% } %>

<% if (!bEmpty) { %>  
   <% if (rsc2.croppedDataBefore() ||  rsc2.croppedDataAfter()) { %>
   <div class="pagingBox">
      <% if (rsc2.croppedDataBefore()) { %>
      <a href="/stat?c=earnings_history&cr=<%=pageContext.getAttribute("coder_id").toString() %>&sr=<%=pageContext.getAttribute("prev_sr").toString() %>&er=<%=pageContext.getAttribute("prev_er").toString() %>&nr=<%=pageContext.getAttribute("nr").toString() %><%=sortString%>" class="bcLink">&lt;&lt; previous</a>   
      <% } else { %>
      &lt;&lt; previous  
      <% } %>
      &nbsp;|&nbsp;
      <% if (rsc2.croppedDataAfter()) { %>
          <a href="/stat?c=earnings_history&cr=<%=pageContext.getAttribute("coder_id").toString() %>&sr=<%=pageContext.getAttribute("next_sr").toString() %>&er=<%=pageContext.getAttribute("next_er").toString() %>&nr=<%=pageContext.getAttribute("nr").toString() %><%=sortString%>" class="bcLink">next &gt;&gt;</a>
      <% } else { %>
           next &gt;&gt;           
      <% } %>
   </div>
   <% } %>
<% } %>
         
         <p><br></p>

<!-- END BODY -->

       </TD>
       <td WIDTH="180" VALIGN="top">
         <jsp:include page="../public_right.jsp" >
             <jsp:param name="level1" value="profile"/>
         </jsp:include>
       </TD>
    <!-- Gutter -->
    <td WIDTH="10"><IMG SRC="/i/clear.gif" WIDTH="10" HEIGHT="1" border="0"/></TD>
    <!-- Gutter Ends -->
     </tr>
   </TABLE>
   <jsp:include page="../foot.jsp" />
 </BODY>
</HTML>