<%--
  - Author: TCSDEVELOPER, pulky, pvmagacho
  - Version: 1.3
  - Copyright (C) 2004 - 2011 TopCoder Inc., All Rights Reserved.
  -
  - Description: This page displays the member profile page.
  -
  - Version 1.1 (Testing Competition Split Release Assembly 1.0) changes: Updated Application Testing to Test Suites.
  - Version 1.2 (BUG#TCCC-3216) changes: Member photo is now retrieved from informixoltp database.
  - Version 1.3 (BUG#TCCC-3348) changes: Update link for no photo image. Pops up window to submit new photo.
--%>
<%@  page language="java"
    import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer,com.topcoder.shared.util.ApplicationServer,
          com.topcoder.web.common.StringUtils, com.topcoder.web.common.WebConstants"%>

<%@ page import="java.util.Map"%>
<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<%@ page import="javax.servlet.http.HttpServletRequest"%>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=utf-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>TopCoder Member Profile</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>

    <jsp:include page="/script.jsp"/>
    <jsp:include page="/style.jsp">
        <jsp:param name="key" value="tc_stats"/>
    </jsp:include>

    
    <script type="text/javascript" src="/js/jquery-1.4.1.min.js"></script>
    <script type="text/javascript" src="/js/jquery.form.js"></script>
    <script type="text/javascript" src="/js/jquery.Jcrop.js"></script>
    <script type="text/javascript" src="/js/photo.js"></script> 
    
    <link type="text/css" href="/css/jquery.Jcrop.css" rel="stylesheet"/>
    <link type="text/css" href="/css/photo.css" rel="stylesheet"/>
    
    <script type="text/javascript">
        var previewPath = <%= request.getParameter("previewPath") == null ? null : "\'"  + request.getParameter("previewPath") + "\'" %>;
        var originalFile = <%= request.getParameter("originalFileName") == null ? null : "\'"  + request.getParameter("originalFileName") + "\'" %>;
    </script>


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
            <jsp:param name="node" value="m_competitions"/>
         </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Center Column Begins -->
<TD CLASS="statTableSpacer" WIDTH="100%" VALIGN="top">

<jsp:include page="../page_title.jsp" >
<jsp:param name="image" value="statistics_w"/>
<jsp:param name="title" value="Member Profile"/>
</jsp:include>


<% ResultSetContainer rscCoderData = (ResultSetContainer) ((Map)request.getAttribute("resultMap")).get("Coder_Data");
  boolean registeredHS = ((Boolean)request.getAttribute("registeredHS")).booleanValue();
  boolean memberContactEnabled = ((Boolean)request.getAttribute("memberContactEnabled")).booleanValue();
  boolean hidePayments = ((Boolean)request.getAttribute("hidePayments")).booleanValue();
%>

<% if(rscCoderData.size() == 0) {%>
This member has not yet been rated in a competition.
<% } else { %>
<table cellpadding="0" cellspacing="0" border="0" width="100%" class="statTableHolder">
   <tr><td class="tableTitle" colspan="3">&#160;</td></tr>
   <tr>
      <td class="photoCell">
      <c:choose>
		  <c:when test="${userImage!=null}">
			<img src="${pathImage}" name="image_path" alt="" class="memberPhoto" />
		  </c:when>
		  <c:otherwise>
			<a href="javascript:;" id="submitPhotoLink">
				<img src="/i/m/nophoto_login.gif" name="image_path" alt="" class="memberPhoto"/>
			</a>
		  </c:otherwise>
      </c:choose>
      </td>
      <td valign="top">
         <table cellpadding="0" cellspacing="0" border="0" class="statTable">
            <tr><td class="handleCell" colspan="2">
                <tc-webtags:handle coderId='<%=rscCoderData.getStringItem(0, "coder_id")%>'/></td></tr>
            <tr><td class="cat" nowrap="nowrap">Algorithm Rating:</td><td class="stat" align="right">
            <%if(rscCoderData.getStringItem(0, "rating") != null && rscCoderData.getIntItem(0, "rating") != 0) {%>
                <tc-webtags:ratingColor rating='<%=rscCoderData.getIntItem(0, "rating")%>'>
                <rsc:item name="rating" set="<%=rscCoderData%>" format="####"/></tc-webtags:ratingColor>
            <%} else {%>
                not rated
            <%}%>
            </td></tr>
<% if (registeredHS) { %>
            <tr><td class="cat" nowrap="nowrap">High School Rating:</td><td class="stat" align="right">
            <%if(rscCoderData.getStringItem(0, "hs_rating") != null && rscCoderData.getIntItem(0, "hs_rating") != 0) {%>
                <tc-webtags:ratingColor rating='<%=rscCoderData.getIntItem(0, "hs_rating")%>'>
                <rsc:item name="hs_rating" set="<%=rscCoderData%>" format="####"/></tc-webtags:ratingColor>
            <%} else {%>
                not rated
            <%}%>
            </td></tr>
<% } %>
            <tr><td class="cat" nowrap="nowrap">Conceptualization Rating:</td><td class="stat" align="right">
            <%if(rscCoderData.getStringItem(0, "concept_rating") != null) {%>
                <tc-webtags:ratingColor rating='<%=rscCoderData.getIntItem(0, "concept_rating")%>'>
                <rsc:item name="concept_rating" set="<%=rscCoderData%>" format="####"/></tc-webtags:ratingColor>
            <%} else {%>
                not rated
            <%}%>
            </td></tr>
            <tr><td class="cat" nowrap="nowrap">Specification Rating:</td><td class="stat" align="right">
            <%if(rscCoderData.getStringItem(0, "spec_rating") != null) {%>
                <tc-webtags:ratingColor rating='<%=rscCoderData.getIntItem(0, "spec_rating")%>'>
                <rsc:item name="spec_rating" set="<%=rscCoderData%>" format="####"/></tc-webtags:ratingColor>
            <%} else {%>
                not rated
            <%}%>
            </td></tr>
            <tr><td class="cat" nowrap="nowrap">Architecture Rating:</td><td class="stat" align="right">
            <%if(rscCoderData.getStringItem(0, "arch_rating") != null) {%>
                <tc-webtags:ratingColor rating='<%=rscCoderData.getIntItem(0, "arch_rating")%>'>
                <rsc:item name="arch_rating" set="<%=rscCoderData%>" format="####"/></tc-webtags:ratingColor>
            <%} else {%>
                not rated
            <%}%>
            </td></tr>
            <tr><td class="cat" nowrap="nowrap">Design Rating:</td><td class="stat" align="right">
            <%if(rscCoderData.getStringItem(0, "design_rating") != null) {%>
                <tc-webtags:ratingColor rating='<%=rscCoderData.getIntItem(0, "design_rating")%>'>
                <rsc:item name="design_rating" set="<%=rscCoderData%>" format="####"/></tc-webtags:ratingColor>
            <%} else {%>
                not rated
            <%}%>
            </td></tr>
            <tr><td class="cat" nowrap="nowrap">Development Rating:</td><td class="stat" align="right">
            <%if(rscCoderData.getStringItem(0, "development_rating") != null) {%>
                <tc-webtags:ratingColor rating='<%=rscCoderData.getIntItem(0, "development_rating")%>'>
                <rsc:item name="development_rating" set="<%=rscCoderData%>" format="####"/>
                </tc-webtags:ratingColor>
            <%} else {%>
                not rated
            <%}%>
            </td></tr>
            <tr><td class="cat" nowrap="nowrap">Assembly Rating:</td><td class="stat" align="right">
            <%if(rscCoderData.getStringItem(0, "assembly_rating") != null) {%>
                <tc-webtags:ratingColor rating='<%=rscCoderData.getIntItem(0, "assembly_rating")%>'>
                <rsc:item name="assembly_rating" set="<%=rscCoderData%>" format="####"/></tc-webtags:ratingColor>
            <%} else {%>
                not rated
            <%}%>
            </td></tr>
            <tr><td class="cat" nowrap="nowrap">Test Suites Rating:</td><td class="stat" align="right">
            <%if(rscCoderData.getStringItem(0, "test_rating") != null) {%>
                <tc-webtags:ratingColor rating='<%=rscCoderData.getIntItem(0, "test_rating")%>'>
                <rsc:item name="test_rating" set="<%=rscCoderData%>" format="####"/></tc-webtags:ratingColor>
            <%} else {%>
                not rated
            <%}%>
            </td></tr>
            <tr><td class="cat" nowrap="nowrap">Test Scenarios Rating:</td><td class="stat" align="right">
            <%if(rscCoderData.getStringItem(0, "test_scenarios_rating") != null) {%>
                <tc-webtags:ratingColor rating='<%=rscCoderData.getIntItem(0, "test_scenarios_rating")%>'>
                <rsc:item name="test_scenarios_rating" set="<%=rscCoderData%>" format="####"/></tc-webtags:ratingColor>
            <%} else {%>
                not rated
            <%}%>
            </td></tr>
            <tr><td class="cat" nowrap="nowrap">UI Prototype Rating:</td><td class="stat" align="right">
            <%if(rscCoderData.getStringItem(0, "ui_prototype_rating") != null) {%>
                <tc-webtags:ratingColor rating='<%=rscCoderData.getIntItem(0, "ui_prototype_rating")%>'>
                <rsc:item name="ui_prototype_rating" set="<%=rscCoderData%>" format="####"/></tc-webtags:ratingColor>
            <%} else {%>
                not rated
            <%}%>
            </td></tr>
            <tr><td class="cat" nowrap="nowrap">RIA Build Rating:</td><td class="stat" align="right">
            <%if(rscCoderData.getStringItem(0, "ria_build_rating") != null) {%>
                <tc-webtags:ratingColor rating='<%=rscCoderData.getIntItem(0, "ria_build_rating")%>'>
                <rsc:item name="ria_build_rating" set="<%=rscCoderData%>" format="####"/></tc-webtags:ratingColor>
            <%} else {%>
                not rated
            <%}%>
            </td></tr>	    	    	    
            <tr><td class="cat" nowrap="nowrap">Marathon Matches Rating:</td><td class="stat" align="right">
            <%if(rscCoderData.getStringItem(0, "mm_rating") != null) {%>
                <tc-webtags:ratingColor rating='<%=rscCoderData.getIntItem(0, "mm_rating")%>'>
                <rsc:item name="mm_rating" set="<%=rscCoderData%>" format="####"/>
                </tc-webtags:ratingColor>
            <%} else {%>
                not rated
            <%}%>
            </td></tr>
            <tr><td class="cat" colspan="2">&#160;</td></tr>
<% if (!registeredHS || (rscCoderData.getStringItem(0, "rating") != null) || (rscCoderData.getStringItem(0, "design_rating") != null) || (rscCoderData.getStringItem(0, "development_rating") != null)) { %>
            <% if(!hidePayments) { %>
            <tr><td class="cat" nowrap="nowrap">Total Earnings:</td><td class="stat" align="right">
                <% if (rscCoderData.getItem(0, "overall_earnings").getResultData() == null || rscCoderData.getDoubleItem(0, "overall_earnings") > 0) { %>
                <A href="/tc?module=PaymentSummary&cr=<%=rscCoderData.getStringItem(0, "coder_id")%>">
                <% } %>
                    <rsc:item name="overall_earnings" set="<%=rscCoderData%>" format="$#,##0.00"/>
                <% if (rscCoderData.getItem(0, "overall_earnings").getResultData() == null || rscCoderData.getDoubleItem(0, "overall_earnings") > 0) { %>
                </A>
                <% } %>
                </td></tr>
            <% } %>
<% } %>
            <tr><td class="cat" nowrap="nowrap">Member Since:</td><td class="stat" align="right">
            <rsc:item name="member_since" set="<%=rscCoderData%>" format="MM.dd.yyyy"/></td></tr>
             <% if (rscCoderData.getItem(0, "country_name").getResultData()!=null) { %>
            <tr><td class="cat">Country:</td><td class="stat" align="right"><div style="width: 100px;">
            <rsc:item name="country_name" set="<%=rscCoderData%>"/></div></td></tr>
             <% } %>
            <% if (rscCoderData.getStringItem(0,"school_name")!=null) { %>
            <tr><td class="cat">School:</td><td class="stat" align="right">
            <rsc:item name="school_name" set="<%=rscCoderData%>"/></td></tr>
            <% }%>
            <tr><td class="cat" colspan="2">
            <% if(memberContactEnabled) { %>
                <A href="/tc?module=MemberContact&th=<%=rscCoderData.getStringItem(0, "handle")%>">[Send a message]</A><br>
            <% } %>
            <A href="http://<%=ApplicationServer.FORUMS_SERVER_NAME%>/?module=History&userID=<%=rscCoderData.getStringItem(0, "coder_id")%>">[Forum post history]</A><br>
             <% if (rscCoderData.getIntItem(0, "has_achievements")>0) { %>
             <A href="/tc?module=SimpleStats&c=coder_achievements&d1=statistics&d2=coderAchievements&cr=<%=rscCoderData.getStringItem(0, "coder_id")%>">[Achievements]</A>
             <% } %>
            </td></tr>
         </table>
      </td>
      <td class="quoteCell">
        <% if(!"".equals(StringUtils.checkNull(rscCoderData.getStringItem(0,"quote")))) {%>
        <div class="quoteBox"><span class="quoteTitle">Quote:</span><br><br>
        <div align="center">"<%=StringUtils.htmlEncode(rscCoderData.getStringItem(0, "quote"))%>"</div></div>
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
<% } else if(tab.equals("hs")) { %>
<jsp:include page="memberProfileTabs.jsp" />
<jsp:include page="memberProfileTabHS.jsp" />
<% } else if(tab.equals("concept")) { %> <!-- Member Profile Enhancment -->
<jsp:include page="memberProfileTabs.jsp" />
<jsp:include page="memberProfileTabTrack.jsp">
   <jsp:param name="track" value="Conceptualization"/>
   <jsp:param name="competition_type" value="concept"/>
   <jsp:param name="phase_id" value="<%= WebConstants.PHASE_CONCEPTUALIZATION %>"/>
</jsp:include>
<% } else if(tab.equals("spec")) { %> <!-- Member Profile Enhancment -->
<jsp:include page="memberProfileTabs.jsp" />
<jsp:include page="memberProfileTabTrack.jsp">
   <jsp:param name="track" value="Specification"/>
   <jsp:param name="competition_type" value="spec"/>
   <jsp:param name="phase_id" value="<%= WebConstants.PHASE_SPECIFICATION %>"/>
</jsp:include>
<% } else if(tab.equals("arch")) { %> <!-- Member Profile Enhancment -->
<jsp:include page="memberProfileTabs.jsp" />
<jsp:include page="memberProfileTabTrack.jsp">
   <jsp:param name="track" value="Architecture"/>
   <jsp:param name="competition_type" value="arch"/>
   <jsp:param name="phase_id" value="<%= WebConstants.PHASE_ARCHITECTURE %>"/>
</jsp:include>
<% } else if(tab.equals("des")) { %>
<jsp:include page="memberProfileTabs.jsp" />
<jsp:include page="memberProfileTabDes.jsp" />
<% } else if(tab.equals("dev")) { %>
<jsp:include page="memberProfileTabs.jsp" />
<jsp:include page="memberProfileTabDev.jsp" />
<% } else if(tab.equals("assembly")) { %> <!-- Member Profile Enhancment -->
<jsp:include page="memberProfileTabs.jsp" />
<jsp:include page="memberProfileTabTrack.jsp">
   <jsp:param name="track" value="Assembly"/>
   <jsp:param name="competition_type" value="assembly"/>
   <jsp:param name="phase_id" value="<%= WebConstants.PHASE_ASSEMBLY %>"/>
</jsp:include>
<% } else if(tab.equals("test")) { %> <!-- Member Profile Enhancment -->
<jsp:include page="memberProfileTabs.jsp" />
<jsp:include page="memberProfileTabTrack.jsp">
   <jsp:param name="track" value="Test Suites"/>
   <jsp:param name="competition_type" value="test"/>
   <jsp:param name="phase_id" value="<%= WebConstants.PHASE_TEST_SUITES %>"/>
</jsp:include>
<% } else if(tab.equals("test_scenarios")) { %>
<jsp:include page="memberProfileTabs.jsp" />
<jsp:include page="memberProfileTabTrack.jsp">
   <jsp:param name="track" value="Test Scenarios"/>
   <jsp:param name="competition_type" value="test_scenarios"/>
   <jsp:param name="phase_id" value="<%= WebConstants.PHASE_TEST_SCENARIOS %>"/>
</jsp:include>
<% } else if(tab.equals("ui_prototype")) { %>
<jsp:include page="memberProfileTabs.jsp" />
<jsp:include page="memberProfileTabTrack.jsp">
   <jsp:param name="track" value="UI Prototype"/>
   <jsp:param name="competition_type" value="ui_prototype"/>
   <jsp:param name="phase_id" value="<%= WebConstants.PHASE_UI_PROTOTYPE %>"/>
</jsp:include>
<% } else if(tab.equals("ria_build")) { %>
<jsp:include page="memberProfileTabs.jsp" />
<jsp:include page="memberProfileTabTrack.jsp">
   <jsp:param name="track" value="RIA Builds"/>
   <jsp:param name="competition_type" value="ria_build"/>
   <jsp:param name="phase_id" value="<%= WebConstants.PHASE_RIA_BUILD %>"/>
</jsp:include>
<% } else if(tab.equals("long")) { %>
<jsp:include page="memberProfileTabs.jsp" />
<jsp:include page="memberProfileTabLong.jsp" />
<% }%>
<% }%>
        </td>
<!-- Center Column Ends -->

<!-- Right Column Begins -->
        <!--  <td width="185">
            <jsp:include page="../public_right.jsp">
               <jsp:param name="level1" value="privatelabel"/>
            </jsp:include>
         </td> -->
<!-- Right Column Ends -->

<!-- Gutter -->
     <!--     <td width="5"><img src="/i/clear.gif" width="5" height="1" border="0"></td> -->
<!-- Gutter Ends -->
    </tr>
</table>

<jsp:include page="../foot.jsp" />

<div class="photoPopup popupUploadPhoto transparent hide">
    <div class="popupWindow">
        <div class="title">UPLOAD YOUR PHOTO</div>
        
        <div class="content" id="uploadDiv">
            <div id="photoUploadLeft">
                <div class="locateInput">
                    <div class="inner"></div>
                </div>
             
                <form action="photo?module=upload&photoAction=preview" method="post" enctype="multipart/form-data" id="photoUploadForm">
                    <a href="javascript:;" class="btn1 btnBrowse">
                        <span class="rightSide">
                            <span class="inner">
                                Browse 
                                <span class="file-wrapper">
                                <input type="file" name="photoFile" id="inputFile" />
                                </span>                     
                            </span>                                           	 	
                        </span>
                    </a>
                </form>
                
                <div id="uploadImage">
                    <p>Uploaded Image</p>
                </div>
            </div>
            <div id="photoUploadRight">
                <div id="previewDiv">
                    <img src="i/previewPhoto.jpg" alt="" />		
                </div>
            
                <div class="alert">
                    Browse Photo should be in *.JPG format file which is the width is 126 pixel and the height is 140 pixel.
                </div>
				<div>
                    <a class="link" href="http://topcoder.com/home/help/?p=866">Photo Policy</a>
                </div>
                <a href="javascript:;" class="btn1 btnCancel">
                    <span class="rightSide">
                        <span class="inner">
                            Cancel                                               
                        </span>                                           	 	
                    </span>                                         
                </a>				
                <a href="javascript:;" class="btn1 red btnUpload">
                    <span class="rightSide">
                        <span class="inner">
                            Upload                                               
                        </span>                                           	 	
                    </span>                                         
                </a>
                <form action="photo?module=upload&photoAction=commit" method="post" id="submitPhotoForum">
                    <input type="hidden" name="previewPath"></input>
                    <input type="hidden" name="lx"></input>
                    <input type="hidden" name="ly"></input>
                    <input type="hidden" name="rx"></input>
                    <input type="hidden" name="ry"></input>
                    <input type="hidden" name="picWidth"></input>
                    <input type="hidden" name="picHeight"></input>
                </form>
            </div>
        </div>
    </div>
</div>

</body>

</html>
