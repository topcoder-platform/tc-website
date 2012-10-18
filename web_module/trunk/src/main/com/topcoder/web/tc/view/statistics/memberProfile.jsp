<%--
  - Author: TCSDEVELOPER, pulky, pvmagacho, TCSASSEMBLER
  - Version: 1.4
  - Copyright (C) 2004 - 2012 TopCoder Inc., All Rights Reserved.
  -
  - Description: This page displays the member profile page.
  -
  - Version 1.1 (Testing Competition Split Release Assembly 1.0) changes: Updated Application Testing to Test Suites.
  - Version 1.2 (BUG#TCCC-3216) changes: Member photo is now retrieved from informixoltp database.
  - Version 1.3 (BUG#TCCC-3348) changes: Update link for no photo image. Pops up window to submit new photo.
  - Version 1.4 (Release Assembly - TopCoder Software Profile Update v1.0) changes: Update to match new prototype.
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
    <script type="text/javascript" src="/js/jquery-ui-1.8.11.custom.min.js"></script>
    <script type="text/javascript" src="/js/jquery.form.js"></script>
    <script type="text/javascript" src="/js/jquery.Jcrop.js"></script>
    <script type="text/javascript" src="/js/photo.js"></script> 
    <script type="text/javascript" src="/js/my.js"></script>
    <script type="text/javascript" src="/js/scripts.js" ></script>
    <script type="text/javascript" src="/js/badge-tooltips.js"></script> 
    <script type="text/javascript" src="/js/popup.js"></script>
    <script type="text/javascript" src="/js/badgeBase.js"></script>
    
    <link type="text/css" rel="stylesheet" href="/css/tc/reset.css" media="screen" />
    <link type="text/css" rel="stylesheet" href="/css/jquery-ui-1.8.11.custom.css" media="screen" />
    <link type="text/css" rel="stylesheet" href="/css/tc/screen.css" media="screen" />
    <link type="text/css" rel="stylesheet" href="/css/jquery.Jcrop.css" />
    <link type="text/css" rel="stylesheet" href="/css/photo.css" />
    <link type="text/css" rel="stylesheet" href="/css/profileBadges.css" />
    
    <script type="text/javascript">
        var previewPath = <%= request.getParameter("previewPath") == null ? null : "\'"  + request.getParameter("previewPath") + "\'" %>;
        var originalFile = <%= request.getParameter("originalFileName") == null ? null : "\'"  + request.getParameter("originalFileName") + "\'" %>;
        
        $(document).ready(function(){
            var categoryName = 'progress meters development';
            var groupBadgeDiv = $('.groupBadgeDiv');
            var singleBadgeDiv = $('.footer-badges');
            var badges = $('.hidenBadgesDiv');
            
            renderGroupBadges(categoryName, groupBadgeDiv, singleBadgeDiv, badges);
        });
    </script>

</head>
<body>
 
<jsp:include page="../top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0" style="height: 1130px;">
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
            </jsp:include>

            <% ResultSetContainer rscCoderData = (ResultSetContainer) ((Map)request.getAttribute("resultMap")).get("Coder_Data");
                ResultSetContainer achievementsData = (ResultSetContainer) ((Map)request.getAttribute("resultMap")).get("software_achievements");
                boolean registeredHS = ((Boolean)request.getAttribute("registeredHS")).booleanValue();
                boolean memberContactEnabled = ((Boolean)request.getAttribute("memberContactEnabled")).booleanValue();
                boolean isInCopilotPool = ((Boolean)request.getAttribute("isInCopilotPool")).booleanValue();
                boolean hidePayments = ((Boolean)request.getAttribute("hidePayments")).booleanValue();
            %>

            <% if(rscCoderData.size() == 0) {%>
                This member has not yet been rated in a competition.
            <% } else { %>

            <br />
            <div class="profileColumn">
                <div class="main">
                    <table class="profileTable">
                        <tr>
                            <td>
                                <div id="briefText" class="briefText">
                                    <div class="contentText">
                                        <% if(!"".equals(StringUtils.checkNull(rscCoderData.getStringItem(0,"quote")))) {%>
                                            <div class="userText">
                                                "<%=StringUtils.htmlEncode(rscCoderData.getStringItem(0, "quote"))%>"  
                                            </div>
                                        <%}%>
                                        <!--End starUl-->
                                        <div id="rightLink" class="rightLink">
                                            <% if (rscCoderData.getIntItem(0, "has_achievements")>0 || achievementsData.size() > 0) { %>
                                                <a href='/tc?module=SimpleStats&c=coder_achievements&d1=statistics&d2=coderAchievements&cr=<%=rscCoderData.getStringItem(0, "coder_id")%>' class="achievements">Achievements</a>
                                            <% } %>
                                            
                                            <% if(isInCopilotPool) { %>
                                                <a href='/tc?module=ViewCopilotProfile&pid=<%=rscCoderData.getStringItem(0, "coder_id")%>'  class="copilotProfile">Copilot Profile</a>
                                            <% } %>
                                            
                                            <a href='http://<%=ApplicationServer.FORUMS_SERVER_NAME%>/?module=History&userID=<%=rscCoderData.getStringItem(0, "coder_id")%>' id="forumPostHistory" class="forumPostHistory">Forum Post History</a>
                                            
                                            <% if(memberContactEnabled) { %>
                                                <a href='/tc?module=MemberContact&th=<%=rscCoderData.getStringItem(0, "handle")%>' class="sendAMessage">Send A Message</a>
                                            <% } %>
                                        </div>
                                        <!--End rightLink-->                      
                                    </div>
                                    <!--End contentText-->
                                    <span class="corner tl"></span>
                                    <span class="corner bl"></span>  
                                    <span class="right-arrow"></span>                         
                                </div>
                                <!--End briefText-->
                            
                                <jsp:include page="memberProfileTabs.jsp" />
                
                                <%
                                    String tab = (String)request.getAttribute("tab");
                                    if(tab.equals("alg")) {
                                %>
                                <jsp:include page="memberProfileTabAlg.jsp" />
                                <% } else if(tab.equals("hs")) { %>
                                <jsp:include page="memberProfileTabHS.jsp" />
                                <% } else if(tab.equals("concept")) { %> 
                                <jsp:include page="memberProfileTabTrack.jsp">
                                   <jsp:param name="track" value="Conceptualization"/>
                                   <jsp:param name="competition_type" value="concept"/>
                                   <jsp:param name="phase_id" value="<%= WebConstants.PHASE_CONCEPTUALIZATION %>"/>
                                </jsp:include>
                                <% } else if(tab.equals("spec")) { %> 
                                <jsp:include page="memberProfileTabTrack.jsp">
                                   <jsp:param name="track" value="Specification"/>
                                   <jsp:param name="competition_type" value="spec"/>
                                   <jsp:param name="phase_id" value="<%= WebConstants.PHASE_SPECIFICATION %>"/>
                                </jsp:include>
                                <% } else if(tab.equals("arch")) { %> 
                                <jsp:include page="memberProfileTabTrack.jsp">
                                   <jsp:param name="track" value="Architecture"/>
                                   <jsp:param name="competition_type" value="arch"/>
                                   <jsp:param name="phase_id" value="<%= WebConstants.PHASE_ARCHITECTURE %>"/>
                                </jsp:include>
                                <% } else if(tab.equals("des")) { %>
                                <jsp:include page="memberProfileTabDes.jsp" />
                                <% } else if(tab.equals("dev")) { %>
                                <jsp:include page="memberProfileTabDev.jsp" />
                                <% } else if(tab.equals("assembly")) { %> 
                                <jsp:include page="memberProfileTabTrack.jsp">
                                   <jsp:param name="track" value="Assembly"/>
                                   <jsp:param name="competition_type" value="assembly"/>
                                   <jsp:param name="phase_id" value="<%= WebConstants.PHASE_ASSEMBLY %>"/>
                                </jsp:include>
                                <% } else if(tab.equals("test")) { %> 
                                <jsp:include page="memberProfileTabTrack.jsp">
                                   <jsp:param name="track" value="Test Suites"/>
                                   <jsp:param name="competition_type" value="test"/>
                                   <jsp:param name="phase_id" value="<%= WebConstants.PHASE_TEST_SUITES %>"/>
                                </jsp:include>
                                <% } else if(tab.equals("test_scenarios")) { %>
                                <jsp:include page="memberProfileTabTrack.jsp">
                                   <jsp:param name="track" value="Test Scenarios"/>
                                   <jsp:param name="competition_type" value="test_scenarios"/>
                                   <jsp:param name="phase_id" value="<%= WebConstants.PHASE_TEST_SCENARIOS %>"/>
                                </jsp:include>
                                <% } else if(tab.equals("ui_prototype")) { %>
                                <jsp:include page="memberProfileTabTrack.jsp">
                                   <jsp:param name="track" value="UI Prototype"/>
                                   <jsp:param name="competition_type" value="ui_prototype"/>
                                   <jsp:param name="phase_id" value="<%= WebConstants.PHASE_UI_PROTOTYPE %>"/>
                                </jsp:include>
                                <% } else if(tab.equals("ria_build")) { %>
                                <jsp:include page="memberProfileTabTrack.jsp">
                                   <jsp:param name="track" value="RIA Builds"/>
                                   <jsp:param name="competition_type" value="ria_build"/>
                                   <jsp:param name="phase_id" value="<%= WebConstants.PHASE_RIA_BUILD %>"/>
                                </jsp:include>
                                <% } else if(tab.equals("content_creation")) { %>                                        
                                <jsp:include page="memberProfileTabTrack.jsp">
                                   <jsp:param name="track" value="Content Creation"/>
                                   <jsp:param name="competition_type" value="content_creation"/>
                                   <jsp:param name="phase_id" value="<%= WebConstants.PHASE_CONTENT_CREATION %>"/>
                                </jsp:include>
                                <% } else if(tab.equals("reporting")) { %>
                                <jsp:include page="memberProfileTabTrack.jsp">
                                   <jsp:param name="track" value="Reporting"/>
                                   <jsp:param name="competition_type" value="reporting"/>
                                   <jsp:param name="phase_id" value="<%= WebConstants.PHASE_REPORTING %>"/>
                                </jsp:include>
                                <% } else if(tab.equals("long")) { %>
                                <jsp:include page="memberProfileTabLong.jsp" />                                        
                                <% } %>
                            </td>
                            
                            <td>
                                <div class="betweentd"></div>
                            </td>
                            
                            <td>
                                <div class="rightMain">
                                    <div class="rightModule">
                                        <c:choose>
                                            <c:when test="${userImage!=null}">
                                                <div class="foto memberPhoto" style="background: url('${pathImage}') no-repeat scroll center center transparent;"></div>
                                            </c:when>
                                            <c:otherwise>
                                                <a href="javascript:;" id="submitPhotoLink">
                                                    <div class="foto memberPhoto" style="background: url('/i/m/nophoto_login.gif') no-repeat scroll center center transparent;"></div>
                                                </a>
                                            </c:otherwise>
                                        </c:choose>
                                        <span class="corner tl"></span>
                                        <span class="corner tr"></span> 
                                        <span class="corner bl"></span>
                                        <span class="corner br"></span> 
                                    </div>
                                    <!--End rightModule-->
                                    <h3 class="titleText"><tc-webtags:handle coderId='<%=rscCoderData.getStringItem(0, "coder_id")%>'/></h3>
                                    <div>
                                        <table style="width:100%;">
                                            <tr><td>
                                                <ul class="information">
                                                    <li><strong>Member Since</strong><span><rsc:item name="member_since" set="<%=rscCoderData%>" format="MM.dd.yyyy"/></span></li>
                                                    
                                                    <% if (rscCoderData.getItem(0, "country_name").getResultData()!=null) { %>
                                                        <li><strong>Country</strong><span class="countryIcon" style='background: url("/i/country/<rsc:item name="country_code" set="<%=rscCoderData%>"/>.png") no-repeat scroll right 5px transparent;'><rsc:item name="country_name" set="<%=rscCoderData%>"/></span></li>
                                                    <% } %>
                                                    
                                                    <% if (rscCoderData.getStringItem(0,"school_name")!=null) { %>
                                                    <li><strong>School</strong><span><rsc:item name="school_name" set="<%=rscCoderData%>"/></span></li>
                                                    <% }%>
                                                    
                                                    <% if (!registeredHS || (rscCoderData.getStringItem(0, "rating") != null) || (rscCoderData.getStringItem(0, "design_rating") != null) || (rscCoderData.getStringItem(0, "development_rating") != null)) { %>
                                                        <% if(!hidePayments) { %>
                                                            <li><strong>Total Earnings</strong><span><rsc:item name="overall_earnings" set="<%=rscCoderData%>" format="$#,##0.00"/></span></li>
                                                        <% } %>
                                                    <% } %>
                                                    
                                                </ul>
                                            </td></tr>
                                        </table>
                                        <div class="badgeborder2"></div>
                                        <div class="hidenBadgesDiv hide">
                                            <% if (achievementsData.size() > 0) {%>
                                                <rsc:iterator list="<%=achievementsData%>" id="resultRow">
                                                    <div class="quoteBadgesItem">
                                                        <input type="hidden" class="achievementId" value='<rsc:item name="id" row="<%=resultRow%>"/>'></input>
                                                        <input type="hidden" class="achievementName" value='<rsc:item name="name" row="<%=resultRow%>"/>'></input>
                                                        <input type="hidden" class="achievementDesc" value='<rsc:item name="desc" row="<%=resultRow%>"/>'></input>
                                                        <input type="hidden" class="achievementDate" value='<rsc:item name="creation_date" row="<%=resultRow%>"/>'></input>
                                                    </div>
                                                </rsc:iterator>
                                            <%}%>                                                
                                        </div>
                                        <div class="achiv groupBadgeDiv">
                                            <div class="clear-float"></div>
                                        </div>
                                        <div class="clear-float"></div>
                                        <div class="footer-badges">
                                        </div>
                                    </div>
                                </div>
                            </td>
                        </tr>
                    </table>
                </div>
                <!--End main-->  
            </div>
            <!--End profileColumn-->
            <br>

            <% }%>
        </td>
        <td style="width:180px">
            <div style="width:180px"></div>
        </td>
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
                    Please upload your photo in JPG or PNG format. For best quality, upload a 400X400 pixel image. Drag your mouse over your photo to crop it (optional) and then view the final results above. If you are happy with the results, click "upload" below.</div>
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
