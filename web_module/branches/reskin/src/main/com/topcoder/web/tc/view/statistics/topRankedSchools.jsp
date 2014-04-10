<%@ page
  language="java"
  import="com.topcoder.shared.dataAccess.*,com.topcoder.shared.dataAccess.resultSet.*"

%>

<%@ taglib uri="http://jakarta.apache.org/struts/tags-bean" prefix="bean" %>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-logic" prefix="logic" %>
<HTML>
 <HEAD>
   <TITLE>TopCoder Statistics - Top Ranked Schools</TITLE>
<jsp:include page="/script.jsp" />
<jsp:include page="/style.jsp">
<jsp:param name="key" value="tc_stats"/>
</jsp:include>

 </HEAD>
 <BODY>
   <jsp:include page="../top.jsp" />
   <TABLE WIDTH="100%" BORDER="0" CELLPADDING="0" CELLSPACING="0">
     <TR>
       <TD WIDTH="180" VALIGN="top" class="alignTop">
         <jsp:include page="/includes/global_left.jsp">
            <jsp:param name="node" value="top_rated_algo"/>
         </jsp:include>
       </TD>
       <TD WIDTH="10" VALIGN="top" class="alignTop"><IMG src="/i/clear.gif" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
       <TD CLASS="bodyText" WIDTH="100%" VALIGN="top" class="alignTop"><IMG SRC="/i/clear.gif" WIDTH="240" HEIGHT="1" VSPACE="5" BORDER="0"><BR/>

         <!-- BEGIN BODY -->
<% //common code that pulls out the request bean.
Request srb = (Request) request.getAttribute("REQUEST_BEAN");
%>
         <TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" WIDTH="100%">
           <TR>
             <TD WIDTH="11" HEIGHT="26" ALIGN="left" VALIGN="bottom" class="alignBottom"><IMG WIDTH="11" HEIGHT="26" BORDER="0" SRC="/i/steelblue_top_left1.gif"></TD>
             <TD VALIGN="bottom" class="alignBottom" WIDTH="180" ALIGN="left"><IMG WIDTH="180" HEIGHT="26" BORDER="0" SRC="/i/header_statistics.gif"></TD>
             <TD CLASS="bodyTextBold" VALIGN="middle" WIDTH="100%">
               &#160;<SPAN CLASS="bodySubhead">&#160;&#160;School Rankings&#160;&#160;</SPAN>
             </TD>
             <TD VALIGN="top" class="alignTop" WIDTH="10" ALIGN="right"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="26" BORDER="0"></TD>
           </TR>
         </TABLE>
         <TABLE BORDER="0" CELLSPACING="0" CELLPADDING="10" BGCOLOR="#001B35" WIDTH="100%"  class="paddingTable">
           <TR>
             <TD VALIGN="top" class="alignTop" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="240" HEIGHT="1" BORDER="0"/><BR>
 <bean:define id="nameColor" name="CODER_COLORS" scope="application" toScope="page"/>

<bean:define name="QUERY_RESPONSE" id="queryEntries" type="java.util.Map" scope="request"/>

<%
ResultSetContainer rsc = (ResultSetContainer) queryEntries.get("School_Avg_Rating");
pageContext.setAttribute("resultSet", rsc);
%>
               <div align="center" class="statText">
                  <A href="/tc?module=AlgoRank" class="gMetal">Competitors</A> | 
                  Schools | 
                  <A href="/stat?c=country_avg_rating" class="gMetal">Countries</A>
               </div>
               <br><br>
               <TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#001B35" WIDTH="100%">
                 <TR>
                   <TD COLSPAN="6"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="5" BORDER="0"></TD>
                 </TR>
                 <TR>
                   <TD COLSPAN="6"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="5" BORDER="0"></TD>
                 </TR>
                 <TR>
                   <TD CLASS="statText" HEIGHT="16" COLSPAN="6" ALIGN="center">
                     To find out more about this page, click <A href="javascript:openWin('/tc?module=Static&d1=statistics&d2=info&d3=topSchools','schoolrankinfo', 500,500)" class="statTextBig"><img src="/i/icon_help_blue.gif" alt="?" width="15" height="11" border="0" /></A>
                   </TD>
                 </TR>
                 <TR>
                   <TD COLSPAN="6"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
                 </TR>
                 <TR>
                   <TD BACKGROUND="/i/steel_bluebv_bg.gif" VALIGN="middle" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
                   <TD BACKGROUND="/i/steel_bluebv_bg.gif" CLASS="statText" VALIGN="middle" WIDTH="10%" HEIGHT="12">Rank</TD>
                   <TD BACKGROUND="/i/steel_bluebv_bg.gif" CLASS="statText" VALIGN="middle" ALIGN="left" WIDTH="34%">Name</TD>
                   <TD BACKGROUND="/i/steel_bluebv_bg.gif" CLASS="statText" VALIGN="middle" ALIGN="left" WIDTH="12%">Country</TD>
                   <TD BACKGROUND="/i/steel_bluebv_bg.gif" CLASS="statText" VALIGN="middle" ALIGN="left" WIDTH="12%">Member Count</TD>
                   <TD BACKGROUND="/i/steel_bluebv_bg.gif" CLASS="statText" VALIGN="middle" ALIGN="right" WIDTH="20%">Rating</TD>
                   <TD BACKGROUND="/i/steel_bluebv_bg.gif" VALIGN="top" class="alignTop" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
                 </TR>
                 <TR>
                   <TD COLSPAN="6"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
                 </TR>
                 <logic:iterate name="resultSet" id="resultRow" type="ResultSetContainer.ResultSetRow">
                   <TR>
                     <TD VALIGN="middle" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
                     <TD CLASS="statText" HEIGHT="13"><bean:write name="resultRow" property='<%= "item[" + 6 /* rank */ + "]" %>'/></TD>
                     <TD CLASS="statText" HEIGHT="13" ALIGN="left"><bean:write name="resultRow" property='<%= "item[" + 4 /* name */ + "]" %>'/></TD>
					 <TD CLASS="statText" HEIGHT="13" ALIGN="left"><bean:write name="resultRow" property='<%= "item[" + 5 /* country */ + "]" %>'/></TD>
					 <TD CLASS="statText" HEIGHT="13" ALIGN="left"><bean:write name="resultRow" property='<%= "item[" + 2 /* rated count */ + "]" %>'/></TD>
                     <TD CLASS="statText" HEIGHT="13" ALIGN="right"><bean:write name="resultRow" property='<%= "item[" + 1 /* avg. rating */ + "]" %>'/></TD>
                     <TD VALIGN="top" class="alignTop" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
                   </TR>
                 </logic:iterate>
                 <TR>
                   <TD COLSPAN="6"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="5" BORDER="0"></TD>
                 </TR>
                 <TR>
                   <TD BACKGROUND="/i/steel_blue_bg.gif" CLASS="statText" HEIGHT="16" COLSPAN="6" ALIGN="center">
                   </TD>
                 </TR>
                 <TR>
                   <TD COLSPAN="6" VALIGN="middle"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="10" BORDER="0"></TD>
                 </TR>
                 <TR>
                   <TD COLSPAN="6" ALIGN="center" CLASS="statText">
                   </TD>
                 </TR>
                 <TR>
                   <TD COLSPAN="6" VALIGN="middle"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="10" BORDER="0"></TD>
                 </TR>
               </TABLE>
             </TD>
           </TR>
           <TR>
             <TD WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="10" BORDER="0"/></TD>
           </TR>
         </TABLE>

         <p><br></p>

         <!-- END BODY -->
       </TD>
       <TD WIDTH="10"><IMG SRC="/i/clear.gif" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
       <TD WIDTH="180" VALIGN="top" class="alignTop"><IMG SRC="/i/clear.gif" WIDTH="180" HEIGHT="1" BORDER="0">
         <jsp:include page="../public_right.jsp" />
       </TD>
    <!-- Gutter -->
    <TD WIDTH="10"><IMG SRC="/i/clear.gif" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
    <!-- Gutter Ends -->
     </TR>
   </TABLE>
   <jsp:include page="../foot.jsp" />
 </BODY>
</HTML>


