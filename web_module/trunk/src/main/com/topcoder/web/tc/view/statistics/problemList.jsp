<%@ page
  language="java"
  import="com.topcoder.shared.dataAccess.*,com.topcoder.shared.dataAccess.resultSet.*,
          java.util.Map,
          com.topcoder.web.tc.Constants,
          com.topcoder.web.common.StringUtils"
%>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<% ResultSetContainer rsc = (ResultSetContainer) ((Map)request.getAttribute("resultMap")).get("problem_list"); %>
<jsp:useBean id="sessionInfo" scope="request" class="com.topcoder.web.common.SessionInfo"/>
<script language="JavaScript"><!--
  function next() {
    document.problemListForm.<%=DataAccessConstants.START_RANK%>.value=<%=rsc.getStartRow()+Constants.PROBLEM_ARCHIVE_SCROLL_SIZE%>;
    document.problemListForm.<%=DataAccessConstants.END_RANK%>.value=<%=rsc.getEndRow()+Constants.PROBLEM_ARCHIVE_SCROLL_SIZE%>;
    document.problemListForm.<%=DataAccessConstants.SORT_COLUMN%>.value='<%=request.getParameter(DataAccessConstants.SORT_COLUMN)%>';
    document.problemListForm.<%=DataAccessConstants.SORT_DIRECTION%>.value='<%=request.getParameter(DataAccessConstants.SORT_DIRECTION)%>';
    document.problemListForm.submit();
  }
  function previous() {
    document.problemListForm.<%=DataAccessConstants.START_RANK%>.value=<%=rsc.getStartRow()-Constants.PROBLEM_ARCHIVE_SCROLL_SIZE%>;
    document.problemListForm.<%=DataAccessConstants.END_RANK%>.value=<%=rsc.getEndRow()-Constants.PROBLEM_ARCHIVE_SCROLL_SIZE%>;
    document.problemListForm.<%=DataAccessConstants.SORT_COLUMN%>.value='<%=request.getParameter(DataAccessConstants.SORT_COLUMN)%>';
    document.problemListForm.<%=DataAccessConstants.SORT_DIRECTION%>.value='<%=request.getParameter(DataAccessConstants.SORT_DIRECTION)%>';
    document.problemListForm.submit();
  }
//--></script>

<HTML>
 <HEAD>
   <TITLE>TopCoder Statistics - Problem Archive</TITLE>
   <LINK REL="stylesheet" TYPE="text/css" HREF="/css/style.css"/>
   <LINK REL="stylesheet" TYPE="text/css" HREF="/css/coders.css"/>
   <jsp:include page="../script.jsp" />

 </HEAD>
 <BODY>
   <jsp:include page="../top.jsp" />
   <TABLE WIDTH="100%" BORDER="0" CELLPADDING="0" CELLSPACING="0">
     <TR>
       <TD WIDTH="180" VALIGN="top">
            <jsp:include page="../includes/global_left.jsp">
                <jsp:param name="level1" value="statistics"/>
            </jsp:include>
       </TD>
       <TD WIDTH="10" VALIGN="top"><IMG src="/i/clear.gif" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
       <TD CLASS="bodyText" WIDTH="100%" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="240" HEIGHT="1" VSPACE="5" BORDER="0"><BR/>
         <!-- BEGIN BODY -->
         <TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" WIDTH="100%">
           <TR>
             <TD WIDTH="11" HEIGHT="26" ALIGN="left" VALIGN="bottom"><IMG WIDTH="11" HEIGHT="26" BORDER="0" SRC="/i/steelblue_top_left1.gif"></TD>
             <TD VALIGN="bottom" WIDTH="180" ALIGN="left"><IMG WIDTH="180" HEIGHT="26" BORDER="0" SRC="/i/header_statistics.gif"></TD>
             <TD CLASS="bodyTextBold" VALIGN="middle" WIDTH="100%">
               &#160;<SPAN CLASS="bodySubhead">&#160;&#160;Problem Archive&#160;&#160;</SPAN>
             </TD>
             <TD VALIGN="top" WIDTH="10" ALIGN="right"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="26" BORDER="0"></TD>
           </TR>
         </TABLE>
         <TABLE BORDER="0" CELLSPACING="0" CELLPADDING="10" BGCOLOR="#001B35" WIDTH="100%">
           <TR>
             <TD VALIGN="top" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="240" HEIGHT="1" BORDER="0"/><BR>


              <form name="problemListForm" method="get">
               <input type="hidden" name="module" value="ProblemArchive"/>
               <input type="hidden" name="<%=DataAccessConstants.START_RANK%>" value=""/>
               <input type="hidden" name="<%=DataAccessConstants.END_RANK%>" value=""/>
               <input type="hidden" name="<%=DataAccessConstants.SORT_COLUMN%>" value=""/>
               <input type="hidden" name="<%=DataAccessConstants.SORT_DIRECTION%>" value=""/>
               <TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#001B35" WIDTH="100%">
                 <TR>
                   <TD colspan="10" class="statText"><%=(rsc.croppedDataBefore()?"<a href=\"Javascript:previous()\" class=\"statText\">&lt;&lt; prev</a>":"&lt;&lt; prev")%>
                    | <%=(rsc.croppedDataAfter()?"<a href=\"Javascript:next()\" class=\"statText\">next &gt;&gt;</a>":"next &gt;&gt;")%></TD>
                 </TR>
                 <TR>
                   <TD BACKGROUND="/i/steel_bluebv_bg.gif" VALIGN="middle" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
                   <TD BACKGROUND="/i/steel_bluebv_bg.gif" CLASS="statText" VALIGN="middle" WIDTH="13%" HEIGHT="18"><a href="<%=sessionInfo.getServletPath()+"?"+Constants.MODULE_KEY+"=ProblemArchive"%><tc:sort column="0"/>" class="statText"><b>Problem&nbsp;Name</b></a></TD>
                   <TD BACKGROUND="/i/steel_bluebv_bg.gif" CLASS="statText" VALIGN="middle" ALIGN="left" WIDTH="15%"><a href="<%=sessionInfo.getServletPath()+"?"+Constants.MODULE_KEY+"=ProblemArchive"%><tc:sort column="1"/>" class="statText"><b>Contest</b></a></TD>
                   <TD BACKGROUND="/i/steel_bluebv_bg.gif" CLASS="statText" VALIGN="middle" ALIGN="left" WIDTH="10%"><a href="<%=sessionInfo.getServletPath()+"?"+Constants.MODULE_KEY+"=ProblemArchive"%><tc:sort column="2"/>" class="statText"><b>Date</b></a></TD>
                   <TD BACKGROUND="/i/steel_bluebv_bg.gif" CLASS="statText" VALIGN="middle" ALIGN="right" WIDTH="5%"><a href="<%=sessionInfo.getServletPath()+"?"+Constants.MODULE_KEY+"=ProblemArchive"%><tc:sort column="4" ascColumn="8" descColumn="9"/>" class="statText"><b>Div.&nbsp;1&nbsp;Level</b></a></TD>
                   <TD BACKGROUND="/i/steel_bluebv_bg.gif" CLASS="statText" VALIGN="middle" ALIGN="right" WIDTH="10%"><a href="<%=sessionInfo.getServletPath()+"?"+Constants.MODULE_KEY+"=ProblemArchive"%><tc:sort column="5" ascColumn="10" descColumn="11"/>" class="statText"><b>Div.&nbsp;2&nbsp;Level</b></a></TD>
                   <TD BACKGROUND="/i/steel_bluebv_bg.gif" CLASS="statText" VALIGN="middle" ALIGN="right" WIDTH="15%"><a href="<%=sessionInfo.getServletPath()+"?"+Constants.MODULE_KEY+"=ProblemArchive"%><tc:sort column="6" ascColumn="12" descColumn="13"/>" class="statText"><b>Div.&nbsp;1&nbsp;Success&nbsp;Rate</b></a></TD>
                   <TD BACKGROUND="/i/steel_bluebv_bg.gif" CLASS="statText" VALIGN="middle" ALIGN="right" WIDTH="15%"><a href="<%=sessionInfo.getServletPath()+"?"+Constants.MODULE_KEY+"=ProblemArchive"%><tc:sort column="7" ascColumn="14" descColumn="15"/>" class="statText"><b>Div.&nbsp;2&nbsp;Success&nbsp;Rate</b></a></TD>
                   <TD BACKGROUND="/i/steel_bluebv_bg.gif" CLASS="statText" VALIGN="middle" WIDTH="5%" HEIGHT="18"></TD>
                   <TD BACKGROUND="/i/steel_bluebv_bg.gif" VALIGN="top" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
                 </TR>
                 <TR>
                   <TD colspan="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
                 </TR>
                 <rsc:iterator list="<%=rsc%>" id="resultRow">
                   <TR>
                     <TD VALIGN="middle" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
                     <TD CLASS="statText" HEIGHT="13"><A HREF="/stat?c=problem_statement&pm=<rsc:item name="problem_id" row="<%=resultRow%>"/>&rd=<rsc:item name="round_id" row="<%=resultRow%>"/>" class="statText"><rsc:item name="problem_name" row="<%=resultRow%>"/></A></TD>
                     <TD CLASS="statText" HEIGHT="13" ALIGN="left" NOWRAP="on"><A HREF="/stat?c=round_overview&rd=<rsc:item name="round_id" row="<%=resultRow%>"/>" class="statText"><rsc:item name="contest_name" row="<%=resultRow%>"/></A></TD>
                     <TD CLASS="statText" HEIGHT="13" ALIGN="left"><rsc:item name="contest_date" row="<%=resultRow%>" format="MM.dd.yyyy"/></TD>
                     <TD CLASS="statText" HEIGHT="13" ALIGN="right"><rsc:item name="div1_level" row="<%=resultRow%>"/></TD>
                     <TD CLASS="statText" HEIGHT="13" ALIGN="right"><rsc:item name="div2_level" row="<%=resultRow%>"/></TD>
                     <TD CLASS="statText" HEIGHT="13" ALIGN="right"><rsc:item name="div1_success" row="<%=resultRow%>" format="0.00%"/></TD>
                     <TD CLASS="statText" HEIGHT="13" ALIGN="right"><rsc:item name="div2_success" row="<%=resultRow%>" format="0.00%"/></TD>
                     <TD CLASS="statText" HEIGHT="13" ALIGN="right"><A HREF="/tc?module=ProblemDetail&rd=<rsc:item name="round_id" row="<%=resultRow%>"/>&pm=<rsc:item name="problem_id" row="<%=resultRow%>"/>" class="statText">details</A></TD>
                     <TD VALIGN="top" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
                   </TR>
                 </rsc:iterator>
                 <TR>
                   <TD colspan="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="5" BORDER="0"></TD>
                 </TR>
                 <TR>
                   <TD BACKGROUND="/i/steel_blue_bg.gif" CLASS="statText" HEIGHT="16" colspan="10" ALIGN="center">
                   </TD>
                 </TR>
                 <TR>
                   <TD colspan="10" class="statText"><%=(rsc.croppedDataBefore()?"<a href=\"Javascript:previous()\" class=\"statText\">&lt;&lt; prev</a>":"&lt;&lt; prev")%>
                    | <%=(rsc.croppedDataAfter()?"<a href=\"Javascript:next()\" class=\"statText\">next &gt;&gt;</a>":"next &gt;&gt;")%></TD>
                 </TR>

                 <TR>
                   <TD colspan="10" VALIGN="middle"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="10" BORDER="0"></TD>
                 </TR>
                 <TR>
                   <TD colspan="10" ALIGN="center" CLASS="statText">
                   </TD>
                 </TR>
                 <TR>
                   <TD colspan="10" VALIGN="middle"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="10" BORDER="0"></TD>
                 </TR>
               </TABLE>
              </form>
             </TD>
           </TR>
           <TR>
             <TD VALIGN="top" BGCOLOR="#001B35" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="10" BORDER="0"/></TD>
           </TR>
         </TABLE>

         <p><br></p>

         <!-- END BODY -->
       </TD>
       <TD WIDTH="10"><IMG SRC="/i/clear.gif" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
       <TD WIDTH="180" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="180" HEIGHT="1" BORDER="0">
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


