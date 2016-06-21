<%@ page
  language="java"
  import="com.topcoder.shared.dataAccess.*,com.topcoder.shared.dataAccess.resultSet.*,
          java.util.Map"
%>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%
    ResultSetContainer rsc = (ResultSetContainer)
            ((Map)request.getAttribute("QUERY_RESPONSE")).get("State_Avg_Rating");
%>

<HTML>
 <HEAD>
   <TITLE>TopCoder Statistics - Top Ranked States</TITLE>
<jsp:include page="/script.jsp"/>
<jsp:include page="/style.jsp">
<jsp:param name="key" value="tc_main"/>
</jsp:include>

 </HEAD>
 <BODY>
   <jsp:include page="../top.jsp" />
   <TABLE WIDTH="100%" BORDER="0" CELLPADDING="0" CELLSPACING="0">
     <TR>
       <TD WIDTH="180" VALIGN="top" class="alignTop">
<jsp:include page="../includes/global_left.jsp">
<jsp:param name="node" value="top_rated_algo"/>
</jsp:include>
       </TD>
       <TD WIDTH="10" VALIGN="top" class="alignTop"><IMG src="/i/clear.gif" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
       <TD CLASS="bodyText" WIDTH="100%" VALIGN="top" class="alignTop"><IMG SRC="/i/clear.gif" WIDTH="240" HEIGHT="1" VSPACE="5" BORDER="0"><BR/>
         <!-- BEGIN BODY -->
         <TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" WIDTH="100%">
           <TR>
             <TD WIDTH="11" HEIGHT="26" ALIGN="left" VALIGN="bottom" class="alignBottom"><IMG WIDTH="11" HEIGHT="26" BORDER="0" SRC="/i/steelblue_top_left1.gif"></TD>
             <TD VALIGN="bottom" class="alignBottom" WIDTH="180" ALIGN="left"><IMG WIDTH="180" HEIGHT="26" BORDER="0" SRC="/i/header_statistics.gif"></TD>
             <TD CLASS="bodyTextBold" VALIGN="middle" WIDTH="100%">
               &#160;<SPAN CLASS="bodySubhead">&#160;&#160;State Rankings&#160;&#160;</SPAN>
             </TD>
             <TD VALIGN="top" class="alignTop" WIDTH="10" ALIGN="right"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="26" BORDER="0"></TD>
           </TR>
         </TABLE>
         <TABLE BORDER="0" CELLSPACING="0" CELLPADDING="10" BGCOLOR="#001B35" WIDTH="100%" class="paddingTable">
           <TR>
             <TD VALIGN="top" class="alignTop" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="240" HEIGHT="1" BORDER="0"/><BR>

               <TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#001B35" WIDTH="100%">
                 <TR>
                   <TD COLSPAN="6"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="5" BORDER="0"></TD>
                 </TR>
                 <TR>
                   <TD COLSPAN="6"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="5" BORDER="0"></TD>
                 </TR>
                 <TR>
                   <TD CLASS="statText" HEIGHT="16" COLSPAN="6" ALIGN="center">
                     In order for a state to be ranked, it must have at least 10 rated members.
                   </TD>
                 </TR>
                 <TR>
                   <TD COLSPAN="6"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
                 </TR>
                 <TR>
                   <TD BACKGROUND="/i/steel_bluebv_bg.gif" VALIGN="middle" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
                   <TD BACKGROUND="/i/steel_bluebv_bg.gif" CLASS="statText" VALIGN="middle" WIDTH="20%" HEIGHT="18">Rank</TD>
                   <TD BACKGROUND="/i/steel_bluebv_bg.gif" CLASS="statText" VALIGN="middle" ALIGN="left" WIDTH="34%">Name</TD>
                   <TD BACKGROUND="/i/steel_bluebv_bg.gif" CLASS="statText" VALIGN="middle" ALIGN="left" WIDTH="14%"># Rated</TD>
                   <TD BACKGROUND="/i/steel_bluebv_bg.gif" CLASS="statText" VALIGN="middle" ALIGN="right" WIDTH="20%">Avg. Rating</TD>
                   <TD BACKGROUND="/i/steel_bluebv_bg.gif" VALIGN="top" class="alignTop" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
                 </TR>
                 <TR>
                   <TD COLSPAN="6"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
                 </TR>
                 <rsc:iterator list="<%=rsc%>" id="resultRow">
                   <TR>
                     <TD VALIGN="middle" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
                     <TD CLASS="statText" HEIGHT="13"><rsc:item name="rank" row="<%=resultRow%>"/></TD>
                     <TD CLASS="statText" HEIGHT="13" ALIGN="left"><rsc:item name="name" row="<%=resultRow%>"/></TD>
                     <TD CLASS="statText" HEIGHT="13" ALIGN="left"><rsc:item name="rated_count" row="<%=resultRow%>"/></TD>
                     <TD CLASS="statText" HEIGHT="13" ALIGN="right"><rsc:item name="avg_rating" row="<%=resultRow%>"/></TD>
                     <TD VALIGN="top" class="alignTop" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
                   </TR>
                 </rsc:iterator>
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
             <TD VALIGN="top" class="alignTop" BGCOLOR="#001B35" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="10" BORDER="0"/></TD>
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


