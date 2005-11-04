<%@  page language="java"
    import="com.topcoder.shared.dataAccess.*,com.topcoder.shared.dataAccess.resultSet.*,
          java.util.Map"%>

<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtags" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Member Profile</title>
<LINK REL="stylesheet" TYPE="text/css" HREF="/css/style.css"/>
<LINK REL="stylesheet" TYPE="text/css" HREF="/css/coders.css"/>
<LINK REL="stylesheet" TYPE="text/css" HREF="/css/stats.css"/>
</head>
<body>

<jsp:include page="../top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">
<!-- Left Column Begins-->
        <td width="180">
            <jsp:include page="/includes/global_left.jsp">
                <jsp:param name="level1" value="statistics"/>
                <jsp:param name="level2" value="member_profile"/>
            </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Center Column Begins -->
<TD CLASS="statTableSpacer" WIDTH="100%" VALIGN="top">

<jsp:include page="../page_title.jsp" >
<jsp:param name="image" value="statistics_w"/>
<jsp:param name="title" value="Member Profile"/>
</jsp:include>


<% ResultSetContainer rscCoderData = (ResultSetContainer) ((Map)request.getAttribute("resultMap")).get("Coder_Data"); %>

<% if(rscCoderData.size() == 0) {%>
This member has not yet been rated in a competition.
<% } else { %>
<table cellpadding="0" cellspacing="0" border="0" width="100%" class="statTableHolder">
   <tr><td class="tableTitle" colspan="3">&#160;</td></tr>
   <tr>
      <td class="photoCell">
   <%if( rscCoderData.getItem(0,"has_image").toString().equals("1")) { %>
      <IMG SRC='<rsc:item name="image_path" set="<%=rscCoderData%>"/>' class="memberPhoto" />
   <% } else { %>
      <A HREF="<%="/tc?&module=Login&message=You must log in to submit your photo.&nextpage=https://"+request.getServerName()+"/Registration"%>"><IMG SRC="/i/m/nophoto_login.gif" class="memberPhoto"/></A>
   <% } %>
      </td>
      <td valign="top">
         <table cellpadding="0" cellspacing="0" border="0" class="statTable">
            <tr><td class="handleCell" colspan="2"><tc-webtags:handle coderId='<%=rscCoderData.getStringItem(0, "coder_id")%>'/></td></tr>
            <tr><td class="cat" nowrap="nowrap">Algorithm Rating:</td><td class="stat" align="right">
            <%if(rscCoderData.getIntItem(0, "rating") != 0) {%>
                <tc-webtags:ratingColor rating='<%=rscCoderData.getIntItem(0, "rating")%>'><rsc:item name="rating" set="<%=rscCoderData%>" format="####"/></tc-webtags:ratingColor>
            <%} else {%>
                not rated
            <%}%>
            </td></tr>
            <tr><td class="cat" nowrap="nowrap">Design Rating:</td><td class="stat" align="right">
            <%if(rscCoderData.getStringItem(0, "design_rating") != null) {%>
                <tc-webtags:ratingColor rating='<%=rscCoderData.getIntItem(0, "design_rating")%>'><rsc:item name="design_rating" set="<%=rscCoderData%>" format="####"/></tc-webtags:ratingColor>
            <%} else {%>
                not rated
            <%}%>
            </td></tr>
            <tr><td class="cat" nowrap="nowrap">Development Rating:</td><td class="stat" align="right">
            <%if(rscCoderData.getStringItem(0, "development_rating") != null) {%>
                <tc-webtags:ratingColor rating='<%=rscCoderData.getIntItem(0, "development_rating")%>'><rsc:item name="development_rating" set="<%=rscCoderData%>" format="####"/></tc-webtags:ratingColor>
            <%} else {%>
                not rated
            <%}%>
            </td></tr>
            <tr><td class="cat" colspan="2">&#160;</td></tr>
            <tr><td class="cat" nowrap="nowrap">Total Earnings:</td><td class="stat" align="right"><rsc:item name="overall_earnings" set="<%=rscCoderData%>" format="$#,##0.00"/></td></tr>
            <tr><td class="cat" nowrap="nowrap">Software Royalties:</td><td class="stat" align="right"><rsc:item name="royalties" set="<%=rscCoderData%>" format="$#,##0.00" ifNull="$0.00"/></td></tr>
            <tr><td class="cat" nowrap="nowrap">Member Since:</td><td class="stat" align="right"><rsc:item name="member_since" set="<%=rscCoderData%>" format="MM.dd.yyyy"/></td></tr>
            <tr><td class="cat">Country:</td><td class="stat" align="right"><rsc:item name="country_name" set="<%=rscCoderData%>"/></td></tr>
            <% if (rscCoderData.getStringItem(0,"school_name")!=null) { %>
            <tr><td class="cat">School:</td><td class="stat" align="right"><rsc:item name="school_name" set="<%=rscCoderData%>"/></td></tr>
            <% }%>
             <% if (rscCoderData.getIntItem(0, "has_achievements")>0) { %>
             <tr><td class="cat" colspan="2"><A href="/tc?module=SimpleStats&c=coder_achievements&d1=statistics&d2=coderAchievements&cr=<%=rscCoderData.getStringItem(0, "coder_id")%>">Achievements</A></td>
             <% } %>
            <tr><td class="cat" colspan="2"><A href="http://<%=ApplicationServer.FORUMS_SERVER_NAME%>/?module=History&userID=<%=rscCoderData.getStringItem(0, "coder_id")%>">[Forum post history]</A></td>
         </table>
      </td>
      <td class="quoteCell">
        <% if(!rscCoderData.getStringItem(0,"quote").equals("")) {%>
        <div class="quoteBox"><span class="quoteTitle">Quote:</span><br><br><div align="center">"<rsc:item name="quote" set="<%=rscCoderData%>"/>"</div></div>
        <%}%>
      </td>
   <tr>
</table>

<br>
<!-- Tab barlinks-->
<%
    String tab = (String)request.getAttribute("tab");
    if(tab.equals("")) {
%>
        This member has not been rated in any events.
<%    } else if(tab.equals("alg")) {%>
<jsp:include page="memberProfileTabs.jsp" />
<jsp:include page="memberProfileTabAlg.jsp" />
<% } else if(tab.equals("des")) { %>
<jsp:include page="memberProfileTabs.jsp" />
<jsp:include page="memberProfileTabDes.jsp" />
<% } else if(tab.equals("dev")) { %>
<jsp:include page="memberProfileTabs.jsp" />
<jsp:include page="memberProfileTabDev.jsp" />
<% }%>
<% }%>
        </td>
<!-- Center Column Ends -->

<!-- Right Column Begins -->
         <td width="170">
            <jsp:include page="../public_right.jsp">
               <jsp:param name="level1" value="privatelabel"/>
            </jsp:include>
         </td>
<!-- Right Column Ends -->

<!-- Gutter -->
         <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<!-- Gutter Ends -->
    </tr>
</table>

<jsp:include page="../foot.jsp" />

</body>

</html>
