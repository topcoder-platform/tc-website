<%@ page
  language="java"
  import="com.topcoder.shared.dataAccess.resultSet.*"

%>
<%@ page import="java.util.Map"%>

<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<% ResultSetContainer results = (ResultSetContainer)((Map)request.getAttribute("resultMap")).get("coder_achievements"); %>

<HTML>
 <HEAD>
   <TITLE>TopCoder Statistics</TITLE>
   <LINK REL="stylesheet" TYPE="text/css" HREF="/css/style.css"/>
   <LINK REL="stylesheet" TYPE="text/css" HREF="/css/coders.css"/>
   <LINK REL="stylesheet" TYPE="text/css" HREF="/css/stats.css"/>
   <jsp:include page="baseHRef.jsp" />
   <jsp:include page="../script.jsp" />
 </HEAD>
 <BODY>
   <jsp:include page="../top.jsp" />
   <table WIDTH="100%" border="0" CELLPADDING="0" CELLSPACING="0">
     <tr>
       <td WIDTH="180" VALIGN="top">
            <jsp:include page="../includes/global_left.jsp">
                <jsp:param name="level1" value="statistics"/>
                <jsp:param name="level2" value="ratings_history"/>
            </jsp:include>
       </TD>
<!-- Center Column Begins -->
<td class="statTableSpacer" width="100%" valign="top">

<jsp:include page="../page_title.jsp" >
<jsp:param name="image" value="statistics_w"/>
<jsp:param name="title" value="Coder Achievements"/>
</jsp:include>

<span class="bigHandle">Coder:&#160;<tc-webtag:handle coderId='<%=pageContext.getAttribute("coder_id").toString() %>' /></span>
<br>
<span class="bodySubtitle">Statistics&#160;>&#160;</span><br>


<table cellpadding="0" cellspacing="0" border="0" width="100%" class="statTableHolder">
   <tr>
      <td>
      <table cellpadding="0" cellspacing="0" border="0" width="100%" class="statTable">
         <tr><td class="tableTitle" colspan="6">Coder Achievements</td></tr>
         <tr>
            <td CLASS="tableHeader">Date</td>
            <td CLASS="tableHeader">Description</td>
         </tr>
      <%boolean even = true;%>
      <rsc:iterator list="<%=results%>" id="resultRow">
         <tr>
            <td class="<%=even?"statLt":"statDk"%>"><rsc:item name="achievement_date" row="<%=resultRow%>" format="MM.dd.yyyy"/></TD>
            <td class="<%=even?"statLt":"statDk"%>"><rsc:item name="description" row="<%=resultRow%>"/></TD>
         </tr>
      <%even=!even;%>
      </rsc:iterator>

      </TABLE>
      </TD>
   </tr>
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