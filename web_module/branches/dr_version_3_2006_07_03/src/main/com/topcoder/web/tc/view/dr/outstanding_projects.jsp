<%@ page
  language="java"
  import="com.topcoder.shared.util.ApplicationServer,
         com.topcoder.shared.dataAccess.resultSet.*,
         com.topcoder.shared.dataAccess.*,
         com.topcoder.web.common.BaseServlet,
         com.topcoder.web.tc.Constants,
         com.topcoder.web.common.model.SoftwareComponent" %>
<jsp:useBean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request" />
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

<STYLE TYPE="text/css">
.popper{display:block; margin: 0px auto 0px auto;}
#container{text-align: center;position: relative;margin: 0px;padding: 0px;}
.popUp
{
font-size: 10px;
text-align: center;
background-color: #FFFFCC;
visibility: hidden;
margin: 10px;
padding: 3px;
position: absolute;
white-space: nowrap;
border: solid 1px black;
z-index: 1;
}
</STYLE>
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
  ResultSetContainer rsc2 = (ResultSetContainer) request.getAttribute(Constants.HISTORY_LIST_KEY);
  String type = (String)request.getAttribute(Constants.TYPE_KEY);
  String phaseId = (String)request.getParameter(Constants.PHASE_ID);
  String coderId = (String)request.getParameter(Constants.CODER_ID);
%>

<% if(phaseId.equals(String.valueOf(SoftwareComponent.DEV_PHASE))){ %>
    <jsp:include page="../page_title.jsp" >
    <jsp:param name="image" value="statistics_w"/>
    <jsp:param name="title" value="Component Development Competition History"/>
    </jsp:include>
<% } else { %>
    <jsp:include page="../page_title.jsp" >
    <jsp:param name="image" value="statistics_w"/>
    <jsp:param name="title" value="Component Design Competition History"/>
    </jsp:include>
<% } %>

<span class="bigHandle">Coder:&#160;<tc-webtag:handle coderId='<%=coderId%>' context='<%=type%>'/></span>
    <br>
    <% if(phaseId.equals(String.valueOf(SoftwareComponent.DEV_PHASE))){ %>
        <span class="bodySubtitle">Development Statistics&#160;>&#160;</span><br>
    <% } else { %>
        <span class="bodySubtitle">Design Statistics&#160;>&#160;</span><br>
    <% } %>
    <span class="bc">
    <A HREF="/tc?module=MemberProfile&cr=<%=coderId%>" class="bcLink">Member Profile</A>
    &#160;|&#160;Competition History
</span>


              <table class="stat" cellpadding="0" cellspacing="0" width="100%">
                 <tr><td class="title" colspan="10">
                 <% if(phaseId.equals(String.valueOf(SoftwareComponent.DEV_PHASE))){%>
                    Development
                 <% } else { %>
                    Design
                 <% } %>
                 Competition History
                 </td></tr>
                 <tr>
                    <TD CLASS="header"><a href="<%=sessionInfo.getServletPath()%>?<tc-webtag:sort column="3" includeParams="true"/>">Date</a></TD>
                    <TD CLASS="header" WIDTH="37%"><a href="<%=sessionInfo.getServletPath()%>?<tc-webtag:sort column="4" includeParams="true"/>">Contest</a></TD>
                    <TD CLASS="headerC" WIDTH="9%"><a href="<%=sessionInfo.getServletPath()%>?<tc-webtag:sort column="12" includeParams="true"/>">Submissions</a></TD>
                    <TD CLASS="headerC" WIDTH="9%"><a href="<%=sessionInfo.getServletPath()%>?<tc-webtag:sort column="6" includeParams="true"/>">Points</a></TD>
                    <TD CLASS="headerR" WIDTH="9%" align="right">&#160;</TD>
                 </tr>
                 <%boolean even = false;%>
                 <rsc:iterator list="<%=rsc2%>" id="resultRow">
                 <tr class="<%=even?"dark":"light"%>">
                    <TD class="value"><rsc:item name="posting_date" row="<%=resultRow%>" format="MM.dd.yy"/></TD>
                    <TD class="value">
                        <% if (resultRow.getItem("component_id").getResultData() != null && resultRow.getIntItem("viewable_category_ind") == 1) { %>
                            <A HREF="http://<%=ApplicationServer.SOFTWARE_SERVER_NAME%>/catalog/c_component.jsp?comp=<rsc:item name="component_id" row="<%=resultRow%>"/>" CLASS="statLink">
                                <rsc:item name="component_name" row="<%=resultRow%>"/>
                            </A>
                        <% } else { %>
                            <rsc:item name="component_name" row="<%=resultRow%>"/>
                        <% } %>
                    </TD>
                    <TD class="valueC"><rsc:item name="num_valid_submissions" row="<%=resultRow%>"/></TD>
                    <TD class="valueC"><rsc:item name="outstanding_points" row="<%=resultRow%>"/></TD>
                    <TD class="valueR" nowrap="nowrap">
                        <% if (resultRow.getItem("project_id").getResultData() != null) { %>
                            <A HREF="/tc?module=CompContestDetails&pj=<rsc:item name="project_id" row="<%=resultRow%>"/>" CLASS="statLink">
                                Contest Details
                            </A>
                        <% } %>
                    </TD>
                 </tr>
                 <%even=!even;%>
                 </rsc:iterator>
              </TABLE>
          </FORM>

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
