<%@ page
  language="java"
  import="com.topcoder.shared.dataAccess.*,com.topcoder.shared.dataAccess.resultSet.*,com.topcoder.shared.util.ApplicationServer"

%>
<%@ page import="com.topcoder.web.tc.Constants"%>

<%@ taglib uri="struts-bean.tld" prefix="bean" %>
<%@ taglib uri="struts-logic.tld" prefix="logic" %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>

<HTML>
<HEAD>
<TITLE>TopCoder Statistics</TITLE>
<jsp:include page="/style.jsp">
<jsp:param name="key" value="tc_stats"/>
</jsp:include>
<jsp:include page="baseHRef.jsp" />
<jsp:include page="../script.jsp" />
</HEAD>
<BODY>
   <jsp:include page="../top.jsp" />

<TABLE WIDTH="100%" BORDER="0" CELLPADDING="0" CELLSPACING="0">
    <TR valign="top">

        <TD WIDTH="180">
<!-- Left nav begins -->
         <jsp:include page="/includes/global_left.jsp">
            <jsp:param name="node" value="m_competitor_stats"/>
         </jsp:include>
<!-- Left nav ends -->
        </TD>

<!-- Center Column Begins -->
<td class="statTableSpacer" width="100%" valign="top">

<%
Request srb = (Request) request.getAttribute("REQUEST_BEAN");
pageContext.setAttribute("coder_id", srb.getProperty("cr","0000"));
%>

<% if(srb.getProperty(Constants.PHASE_ID).equals("113")){ %>
<jsp:include page="../page_title.jsp" >
<jsp:param name="image" value="statistics_w"/>
<jsp:param name="title" value="Component Development Earnings History"/>
</jsp:include>
<% } else { %>
<jsp:include page="../page_title.jsp" >
<jsp:param name="image" value="statistics_w"/>
<jsp:param name="title" value="Component Design Earnings History"/>
</jsp:include>
<% } %>

<% if(srb.getProperty(Constants.PHASE_ID).equals("113")){ %>

<span class="bigHandle">Coder:&#160;<tc-webtag:handle coderId='<%=pageContext.getAttribute("coder_id").toString() %>' context="development"/></span>
<br>
<span class="bodySubtitle">Development Statistics&#160;>&#160;</span><br>
<span class="bc">
<A HREF="/tc?module=MemberProfile&cr=<%= pageContext.getAttribute("coder_id") %>" class="bcLink">Member Profile</A>
&#160;|&#160;<A HREF="/stat?c=tcs_ratings_history&amp;<%=Constants.PHASE_ID%>=113&cr=<%= pageContext.getAttribute("coder_id") %>" CLASS="bcLink">Rating History</A>
&#160;|&#160;Earnings History
</span>

<% } else { %>

<span class="bigHandle">Coder:&#160;<tc-webtag:handle coderId='<%=pageContext.getAttribute("coder_id").toString() %>' context="design"/></span>
<br>
<span class="bodySubtitle">Design Statistics&#160;>&#160;</span><br>
<span class="bc">
<A HREF="/tc?module=MemberProfile&cr=<%= pageContext.getAttribute("coder_id") %>" class="bcLink">Member Profile</A>
&#160;|&#160;<A HREF="/stat?c=tcs_ratings_history&amp;<%=Constants.PHASE_ID%>=112&&cr=<%= pageContext.getAttribute("coder_id") %>" CLASS="bcLink">Rating History</A>
&#160;|&#160;Earnings History
</span>

<% } %>


<bean:define id="nameColor" name="CODER_COLORS" scope="application" toScope="page"/>
<bean:define name="QUERY_RESPONSE" id="queryEntries" type="java.util.Map" scope="request"/>


<%
ResultSetContainer rsc = (ResultSetContainer) queryEntries.get("Basic_Coder_Information");
boolean bEmpty = (rsc == null || rsc.size()!=1);
if (!bEmpty) {
  ResultSetContainer.ResultSetRow rsr = rsc.getRow(0);
  pageContext.setAttribute("resultRow", rsr);
%>

      <bean:define id="coderrank" name="resultRow" property='<%= "item[" + 1 /*"coder_score"*/ + "]" %>'/>
<%
} //end if not empty
ResultSetContainer rsc2 = (ResultSetContainer) queryEntries.get("component_earnings");
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
String sSortUrl = "/stat?c=component_history&amp;"+Constants.PHASE_ID+"="+srb.getProperty(Constants.PHASE_ID)+ "&cr="+srb.getProperty("cr")+"&sq=component_history";
%>

<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="3" WIDTH="100%">
<% if (!bEmpty) { %>
   <% if (rsc2.croppedDataBefore() ||  rsc2.croppedDataAfter()) { %>
      <div class="pagingBox">
      <% if (rsc2.croppedDataBefore()) { %>
         <a href="/stat?c=component_history&amp;<%=Constants.PHASE_ID%>=<%=srb.getProperty(Constants.PHASE_ID)%>&cr=<%=pageContext.getAttribute("coder_id").toString() %>&sr=<%=pageContext.getAttribute("prev_sr").toString() %>&er=<%=pageContext.getAttribute("prev_er").toString() %>&nr=<%=pageContext.getAttribute("nr").toString() %><%=sortString%>" class="bcLink">&lt;&lt; previous</a>
      <% } else { %>
         &lt;&lt; previous
      <% } %>
         &nbsp;|&nbsp;
      <% if (rsc2.croppedDataAfter()) { %>
         <a href="/stat?c=component_history&amp;<%=Constants.PHASE_ID%>=<%=srb.getProperty(Constants.PHASE_ID)%>&cr=<%=pageContext.getAttribute("coder_id").toString() %>&sr=<%=pageContext.getAttribute("next_sr").toString() %>&er=<%=pageContext.getAttribute("next_er").toString() %>&nr=<%=pageContext.getAttribute("nr").toString() %><%=sortString%>" class="bcLink">next &gt;&gt;</a>
      <% } else { %>
         next &gt;&gt;
      <% } %>
   <% } else { %>
      <div class="pagingBox">&#160;</div>
   <% } %>

<table cellpadding="0" cellspacing="0" border="0" width="100%" class="statTableHolder">
   <tr>
      <td>
      <table cellpadding="0" cellspacing="0" border="0" width="100%" class="statTable">
         <tr><td class="tableTitle" colspan="6">
         <% if(srb.getProperty(Constants.PHASE_ID).equals("113")){%>
         Development
         <% } else { %>
         Design
         <% } %>
         Earnings History
         </td></tr>
         <tr>
            <TD CLASS="tableHeader"><a href="<%=sSortUrl%>&sc=3&sd=<%= "3".equals(srb.getProperty("sc")) && srb.getProperty("sd","desc").equals("desc") ?"asc":"desc"%>">Date</a></TD>
            <TD CLASS="tableHeader" width="40%"><a href="<%=sSortUrl%>&sc=4&sd=<%= "4".equals(srb.getProperty("sc")) && srb.getProperty("sd","desc").equals("desc") ?"asc":"desc"%>">Project / Event</a></TD>
            <TD CLASS="tableHeader" width="15%" align="right"><a href="<%=sSortUrl%>&sc=9&sd=<%= "9".equals(srb.getProperty("sc")) && srb.getProperty("sd","desc").equals("desc") ?"asc":"desc"%>">Place</a></TD>
            <TD CLASS="tableHeader" width="15%" align="right"><a href="<%=sSortUrl%>&sc=8&sd=<%= "8".equals(srb.getProperty("sc")) && srb.getProperty("sd","desc").equals("desc") ?"asc":"desc"%>">Score</a></TD>
            <TD CLASS="tableHeader" width="15%" align="right"><a href="<%=sSortUrl%>&sc=6&sd=<%= "6".equals(srb.getProperty("sc")) && srb.getProperty("sd","desc").equals("desc") ?"asc":"desc"%>">Amount</a></TD>
            <TD CLASS="tableHeader" WIDTH="15%" align="right">&#160;</TD>
         </tr>
         <%boolean even = true;%>
         <logic:iterate name="resultSet" id="resultRow2" type="ResultSetContainer.ResultSetRow">
         <tr>
            <TD class="<%=even?"statLt":"statDk"%>"><bean:write format="MM.dd.yy" name="resultRow2" property='<%= "item[" + 3 /* event date */ + "].resultData" %>'/></TD>
            <% if (resultRow2.getIntItem("component_id")!=-1) { %>
            <TD class="<%=even?"statLt":"statDk"%>">
                <% if (resultRow2.getIntItem("viewable") ==1) { %>
                <A HREF="http://<%=ApplicationServer.SOFTWARE_SERVER_NAME%>/catalog/c_component.jsp?comp=<bean:write name="resultRow2" property='<%= "item[" + 2 /* round id */ + "]" %>'/>" CLASS="statLink">
                    <bean:write name="resultRow2" property='<%= "item[" + 4 /* contest name */ + "]" %>'/>
                </A>
                <% } else {%>
                <bean:write name="resultRow2" property='<%= "item[" + 4 /* contest name */ + "]" %>'/>
                <% } %>
            </TD>
            <% } else { %>
            <TD class="<%=even?"statLt":"statDk"%>"><bean:write name="resultRow2" property='<%= "item[" + 4 /* contest name */ + "]" %>'/></TD>
            <% } %>
            <TD class="<%=even?"statLt":"statDk"%>" align="right"><bean:write name="resultRow2" property='<%= "item[" + 5 /* place */ + "]" %>'/></TD>
            <TD class="<%=even?"statLt":"statDk"%>" align="right"><bean:write format="0.00" name="resultRow2" property='<%= "item[" + 8 /* score */ + "]" %>'/></TD>
            <TD class="<%=even?"statLt":"statDk"%>" align="right">$&nbsp;<bean:write format="0.00" name="resultRow2" property='<%= "item[" + 6 /* money */ + "].resultData" %>'/></TD>
            <TD class="<%=even?"statLt":"statDk"%>" align="right"><% if (resultRow2.getStringItem("project_id")!=null) { %><A href="/tc?module=CompContestDetails&pj=<rsc:item name="project_id" row="<%=resultRow2%>"/>" class="statLink">Contest Details</A><% } %></TD>
         </tr>
         <%even=!even;%>
         </logic:iterate>

       <% } else { %>


         <TR>
            <TD COLSPAN="7" class="bcLink">This member has no component history.</TD>
         </TR>
         <% } %>
      </TABLE>
      </TD>
   </TR>
</TABLE>

   <% if (rsc2.croppedDataBefore() ||  rsc2.croppedDataAfter()) { %>
      <div class="pagingBox">
      <% if (rsc2.croppedDataBefore()) { %>
         <a href="/stat?c=component_history&amp;<%=Constants.PHASE_ID%>=<%=srb.getProperty(Constants.PHASE_ID)%>&cr=<%=pageContext.getAttribute("coder_id").toString() %>&sr=<%=pageContext.getAttribute("prev_sr").toString() %>&er=<%=pageContext.getAttribute("prev_er").toString() %>&nr=<%=pageContext.getAttribute("nr").toString() %><%=sortString%>" class="bcLink">&lt;&lt; previous</a>
      <% } else { %>
         &lt;&lt; previous
      <% } %>
         &nbsp;|&nbsp;
      <% if (rsc2.croppedDataAfter()) { %>
         <a href="/stat?c=component_history&amp;<%=Constants.PHASE_ID%>=<%=srb.getProperty(Constants.PHASE_ID)%>&cr=<%=pageContext.getAttribute("coder_id").toString() %>&sr=<%=pageContext.getAttribute("next_sr").toString() %>&er=<%=pageContext.getAttribute("next_er").toString() %>&nr=<%=pageContext.getAttribute("nr").toString() %><%=sortString%>" class="bcLink">next &gt;&gt;</a>
      <% } else { %>
         next &gt;&gt;
      <% } %>
   <% } else { %>
      <div class="pagingBox">&#160;</div>
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
