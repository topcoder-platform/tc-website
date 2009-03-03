<%--
 * Copyright (C) 2004 - 2009 TopCoder Inc., All Rights Reserved.  
 *
 * This JSP shows architecture track description page.
 *
 * Author TCSDEVELOPER
 * Version 1.0
 * Since 2009 TopCoder Open Site Integration
--%>

<%@ page language="java" %>
<%@ page import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer,
                 com.topcoder.web.tc.model.UserContestDetail,
                 java.util.List,
                 java.util.Map" %>

<%@ page contentType="text/html;charset=utf-8" %> 
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<% ResultSetContainer rscContest = (ResultSetContainer) ((Map) request.getAttribute("resultMap")).get("contest_details");
   List lst = (List) request.getAttribute("results");
   boolean isComplete = true;
   String tab = "design";
%>
        
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<title>TCO 09 : Online Competitions</title>

<!-- Meta Tags -->
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<!-- External CSS -->
<link rel="stylesheet" href="css/tournaments/tco09.css" media="all" type="text/css" />

<!-- External JavaScripts -->
<script type="text/javascript" src="/js/tournaments/tco09/jquery-1.2.6.js"></script>
<script type="text/javascript" src="/js/tournaments/tco09/jquery.backgroundPosition.js"></script>
<script type="text/javascript" src="/js/tournaments/tco09/scripts.js"></script>
<script type="text/javascript" src="/js/arena.js"></script> 
</head>

<body id="page">

    <div id="wrapper">
        <div id="wrapperInner">
            <div id="wrapperContent">
                
                <div id="wrapperContentInner">
                
                    <jsp:include page="../header.jsp"/>
                    
                    <jsp:include page="../mainNav.jsp" >
                        <jsp:param name="mainTab" value="online"/>
                    </jsp:include>
                    
                    <div id="content">
                            <div class="contentTopLeft"><div class="contentTopRight">
                                <div class="contentTopInner"></div>
                            </div></div>
                            
                            <div id="contentInner" class="contentInner">
                            
                                <div id="contentInnerInner">

                                    <div class="bottomArea">
                                        <div class="bottomLeft"><div class="bottomRight">
                                            
                                            <jsp:include page="../secondaryNav.jsp" >
                                                <jsp:param name="mainTab" value="online"/>
                                                <jsp:param name="secondaryTab" value="architecture"/>
                                            </jsp:include>

                                            <jsp:include page="../tertiaryNav.jsp" >
                                                <jsp:param name="mainTab" value="online"/>
                                                <jsp:param name="secondaryTab" value="architecture"/>
                                                <jsp:param name="tertiaryTab" value="leaderboard"/>
                                            </jsp:include>
                                            
                                            <div class="bottomAreaContent">
                                                
                                                <div class="mainContent">
                                                    <div id="mainContentInner">
                                                        <div>   
                                                            <div class="pageContent">
                                                                <h2 class="title"> Architecture Competition Leaderboard</h2>
                                                                <h2><rsc:item name="contest_name" row="<%=rscContest.getRow(0)%>"/> -
                                                                <a href="/tco08?module=ContestProjects&amp;eid=${event_id}&amp;ct=<rsc:item name="contest_id" row="<%=rscContest.getRow(0)%>"/>">View
                                                                Components</a></h2>
                                                                
																<div><p>
																	<table class="data" width="100%" cellpadding="0" cellspacing="0">
                                                                        <tr><th colspan="6"><rsc:item name="contest_name" row="<%=rscContest.getRow(0)%>"/></th></tr>
                                                                        <tr>
                                                                            <th class="first">Handle</th>
                                                                            <th>Placement Points</th>
                                                                            <th>Complete Projects</th>
                                                                            <th>Projects<br />In Progess</th>
                                                                            <th>Projects Submitted</th>
                                                                            <th class="last">Results</th>
                                                                        </tr>
                    <%for (int i = 0; i < lst.size(); i++) { %>
                    <tr>
                        <% UserContestDetail result = (UserContestDetail) lst.get(i); %>
                        <th class="first">
                            <tc-webtag:handle context='<%=tab%>' coderId='<%=result.getUserID()%>' darkBG='true' />
                            <% if (result.getIncomplete() > 0) {
                                isComplete = false;%>*<% } %></th>
                        <th><%=result.getPoints()%>
                        </th>
                        <th><%=result.getComplete()%>
                        </th>
                        <th><%=result.getIncomplete()%>
                        </th>
                        <th><%=result.getSubmissionCount()%>
                        </th>
                        <th class="last">
                            <a href="/tco08?module=MemberResults&amp;eid=${event_id}&amp;ct=<rsc:item name="contest_id" row="<%=rscContest.getRow(0)%>" />&amp;cr=<%=result.getUserID()%>">results</a>
                        </th>
                    </tr>
                    <% }%>
																	</table></p>
																	                <br /><br />
                <%if (!isComplete) {%>
                * Contains results from projects still in progress, results subject to change
                <br /><br />
                <% } %>

																</div>
                                                            </div>
                                                        </div>
                                                        
                                                    </div><!-- End #mainContentInner -->
                                                    
                                                </div><!-- End #mainContent --> 
                                                <jsp:include page="../sponsors.jsp"/>
                                                
                                            </div><!-- End .bottomAreaContent -->
                                        
                                        </div></div>
                                    </div><!-- End .bottomArea -->
                                    
                                </div><!-- End #contentInnerInner -->
                            
                            </div><!-- End #contentInner -->
                            
                            <div class="contentBottomLeft"><div class="contentBottomRight">
                                <div class="contentTopInner"></div>
                            </div></div>
                            
                    </div><!-- End #content -->
                
                </div><!-- End #wrapperContentInner -->
                
            </div>
        </div><!-- End #wrapperInner -->
    </div><!-- End #wrapper -->

<jsp:include page="../footer.jsp"/>
</body>
</html>
