<%@ page
  language="java"
  import="com.topcoder.shared.util.ApplicationServer,
         com.topcoder.shared.dataAccess.resultSet.*,
         com.topcoder.shared.dataAccess.*,
         com.topcoder.web.common.BaseServlet,
         com.topcoder.web.tc.Constants" %>
%>
<jsp:useBean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request" />
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
    <script type="text/javascript">
        function submitEnter(e) {
            var keycode;
            if (window.event) keycode = window.event.keyCode;
            else if (e) keycode = e.which;
            else return true;
            if (keycode == 13) {
             document.rookieBoardForm.submit();
             return false;
            } else return true;
          }
          function next() {
            var myForm = document.rookieBoardForm;
            myForm.<%=DataAccessConstants.START_RANK%>.value=parseInt(myForm.<%=DataAccessConstants.START_RANK%>.value)+parseInt(myForm.<%=DataAccessConstants.NUMBER_RECORDS%>.value);
            myForm.<%=DataAccessConstants.SORT_COLUMN%>.value='<%=request.getParameter(DataAccessConstants.SORT_COLUMN)==null?"":request.getParameter(DataAccessConstants.SORT_COLUMN)%>';
            myForm.<%=DataAccessConstants.SORT_DIRECTION%>.value='<%=request.getParameter(DataAccessConstants.SORT_DIRECTION)==null?"":request.getParameter(DataAccessConstants.SORT_DIRECTION)%>';
            myForm.submit();
          }
          function previous() {
            var myForm = document.rookieBoardForm;
            myForm.<%=DataAccessConstants.START_RANK%>.value=parseInt(myForm.<%=DataAccessConstants.START_RANK%>.value)-parseInt(myForm.<%=DataAccessConstants.NUMBER_RECORDS%>.value);
            myForm.<%=DataAccessConstants.SORT_COLUMN%>.value='<%=request.getParameter(DataAccessConstants.SORT_COLUMN)==null?"":request.getParameter(DataAccessConstants.SORT_COLUMN)%>';
            myForm.<%=DataAccessConstants.SORT_DIRECTION%>.value='<%=request.getParameter(DataAccessConstants.SORT_DIRECTION)==null?"":request.getParameter(DataAccessConstants.SORT_DIRECTION)%>';
            myForm.submit();
          }
    </script>
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
  String nextpage = (String)request.getAttribute(BaseServlet.NEXT_PAGE_KEY);
  if(nextpage==null) nextpage = request.getParameter(BaseServlet.NEXT_PAGE_KEY);
  if(nextpage==null) nextpage = request.getHeader("Referer");
  if(nextpage==null) nextpage = "http://"+request.getServerName();
  ResultSetContainer rsc2 = (ResultSetContainer) request.getAttribute(Constants.CODER_LIST_KEY);
  String type = (String)request.getAttribute(Constants.TYPE_KEY);
  String phaseId = (String)request.getParameter(Constants.PHASE_ID);
  String coderId = (String)request.getParameter("cr");
%>

<% if(phaseId.equals("113")){ %>
    <jsp:include page="../page_title.jsp" >
    <jsp:param name="image" value="statistics_w"/>
    <jsp:param name="title" value="Component Development Points History"/>
    </jsp:include>
<% } else { %>
    <jsp:include page="../page_title.jsp" >
    <jsp:param name="image" value="statistics_w"/>
    <jsp:param name="title" value="Component Design Points History"/>
    </jsp:include>
<% } %>

<span class="bigHandle">Coder:&#160;<tc-webtag:handle coderId='<%=coderId%>' context='<%=type%>'/></span>
    <br>
    <% if(phaseId.equals("113")){ %>
        <span class="bodySubtitle">Development Statistics&#160;>&#160;</span><br>
    <% } else { %>
        <span class="bodySubtitle">Design Statistics&#160;>&#160;</span><br>
    <% } %>
    <span class="bc">
    <A HREF="/tc?module=MemberProfile&cr=<%= pageContext.getAttribute("coder_id") %>" class="bcLink">Member Profile</A>
    &#160;|&#160;<A HREF="/stat?c=tcs_ratings_history&amp;<%=Constants.PHASE_ID%>=<%=phaseId%>&cr=<%=coderId%>" CLASS="bcLink">Rating History</A>
    &#160;|&#160;<A HREF="/stat?c=earnings_history&cr=<%=coderId%>" class="bcLink">Earnings History</A>
    &#160;|&#160;Points History
</span>


<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="3" WIDTH="100%">
    <div class="pagingBox">
        <% if (rsc2.croppedDataBefore() ||  rsc2.croppedDataAfter()) { %>
            <%=(rsc2.croppedDataBefore()?"<a href=\"Javascript:previous()\" class=\"statText\">&lt;&lt; prev</a>":"&lt;&lt; prev")%>
            | <%=(rsc2.croppedDataAfter()?"<a href=\"Javascript:next()\" class=\"statText\">next &gt;&gt;</a>":"next &gt;&gt;")%>
        <% } else { %>
            &#160;
        <% } %>
    </div> 

<table cellpadding="0" cellspacing="0" border="0" width="100%" class="statTableHolder">
   <tr>
      <td>
      <table cellpadding="0" cellspacing="0" border="0" width="100%" class="statTable">
         <tr><td class="tableTitle" colspan="6">
         <% if(phaseId.equals("113")){%>
            Development
         <% } else { %>
            Design
         <% } %>
         Points History
         </td></tr>
         <tr>
            <TD CLASS="tableHeader"><a href="<%=sessionInfo.getServletPath()%>?<tc-webtag:sort column="3" includeParams="true"/>">Date</a></TD>
            <TD CLASS="tableHeader"><a href="<%=sessionInfo.getServletPath()%>?<tc-webtag:sort column="3" includeParams="true"/>">Project</a></TD>
            <TD CLASS="tableHeader"><a href="<%=sessionInfo.getServletPath()%>?<tc-webtag:sort column="3" includeParams="true"/>">Submissions</a></TD>
            <TD CLASS="tableHeader"><a href="<%=sessionInfo.getServletPath()%>?<tc-webtag:sort column="3" includeParams="true"/>">Placed</a></TD>
            <TD CLASS="tableHeader"><a href="<%=sessionInfo.getServletPath()%>?<tc-webtag:sort column="3" includeParams="true"/>">Points</a></TD>
            <TD CLASS="tableHeader" WIDTH="15%" align="right">&#160;</TD>
         </tr>
         <%boolean even = true;%>
         <rsc:iterator list="<%=rsc2%>" id="resultRow">
         <tr>
            <TD class="<%=even?"statLt":"statDk"%>"><rsc:item name="posting_date" row="<%=resultRow%>"/></TD>
            <TD class="<%=even?"statLt":"statDk"%>">
                <A HREF="http://<%=ApplicationServer.SOFTWARE_SERVER_NAME%>/catalog/c_component.jsp?comp=<rsc:item name="component_id" row="<%=resultRow%>"/> CLASS="statLink">
                    <rsc:item name="component_id" row="<%=resultRow%>"/>
                </A>
            </TD>
            <TD class="<%=even?"statLt":"statDk"%>"><rsc:item name="num_submissions_passed_review" row="<%=resultRow%>"/></TD>
            <TD class="<%=even?"statLt":"statDk"%>"><rsc:item name="placed" row="<%=resultRow%>"/></TD>
            <TD class="<%=even?"statLt":"statDk"%>"><rsc:item name="points_awarded" row="<%=resultRow%>"/></TD>
            <TD class="<%=even?"statLt":"statDk"%>">
                <A HREF="/tc?module=CompContestDetails&pj=<rsc:item name="project_id" row="<%=resultRow%>"/> CLASS="statLink">
                    Contest Details
                </A>
            </TD>
         </tr>
         <%even=!even;%>
         </rsc:iterator>
      </TABLE>
      </TD>
   </TR>
</TABLE>


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
