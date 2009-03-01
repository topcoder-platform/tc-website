<%--
 * Copyright (C) 2004 - 2009 TopCoder Inc., All Rights Reserved.  
 *
 * This JSP shows design track leaderboard page.
 *
 * Author TCSDEVELOPER
 * Version 1.0
 * Since 2009 TopCoder Open Site Integration
--%>
<%@ page language="java" %>
<%@ page import="com.topcoder.web.common.model.EventType,
                 com.topcoder.shared.dataAccess.resultSet.ResultSetContainer,
                 com.topcoder.web.tc.model.UserContestDetail,
                 java.util.List,
                 java.util.Map" %>
<%@ page contentType="text/html;charset=utf-8" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
        
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<title>TCO 09 : Online Competitions</title>

<!-- Meta Tags -->
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<!-- External CSS -->
<link rel="stylesheet" href="css/tournaments/tco09.css" media="all" type="text/css" />
<!--[if IE 6]>
<link rel="stylesheet" type="text/css" media="screen" href="css/screen-ie6.css" />
<![endif]-->

<!-- External JavaScripts -->
<script type="text/javascript" src="/js/tournaments/tco09/jquery-1.2.6.js"></script>
<script type="text/javascript" src="/js/tournaments/tco09/jquery.backgroundPosition.js"></script>
<script type="text/javascript" src="/js/tournaments/tco09/scripts.js"></script>
<script type="text/javascript" src="/js/arena.js"></script> 
<style type="text/css">
<!--
.style2 {color: #FF0000}
-->
</style>
</head>

<body id="page">

    <div id="wrapper">
        <div id="wrapperInner">
            <div id="wrapperContent">
                
                <div id="wrapperContentInner">
                
                    <jsp:include page="../../header.jsp"/>
                    
                    <jsp:include page="../../mainNav.jsp" >
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
                                            
                                            <jsp:include page="../../secondaryNav.jsp" >
                                                <jsp:param name="mainTab" value="online"/>
                                                <jsp:param name="secondaryTab" value="design"/>
                                            </jsp:include>

                                            <jsp:include page="../../tertiaryNav.jsp" >
                                                <jsp:param name="mainTab" value="online"/>
                                                <jsp:param name="secondaryTab" value="design"/>
                                                <jsp:param name="tertiaryTab" value="leaderboard"/>
                                            </jsp:include>
                                            
                                            <div class="bottomAreaContent">
                                            
<% ResultSetContainer rscContest = (ResultSetContainer) ((Map) request.getAttribute("resultMap")).get("contest_details"); %>
<% List lst = (List) request.getAttribute("results");%>
<% boolean isComplete = true; %>

                    <h2><rsc:item name="contest_name" row="<%=rscContest.getRow(0)%>"/></h2>

                <table cellpadding="0" cellspacing="0" class="stat" style="width: 100%;">
                <thead>
                    <tr><th colspan="6"><rsc:item name="contest_name" row="<%=rscContest.getRow(0)%>"/></th></tr>
                    <tr>
                        <th class="header">Handle</th>
                        <th class="headerC">Placement Points</th>
                        <th class="headerC">Complete Projects</th>
                        <th class="headerC" nowrap="nowrap">Projects<br />In Progess</th>
                        <th class="headerC">Projects Submitted</th>
                        <th class="headerC">Results</th>
                    </tr>
                </thead>
                
                    <%for (int i = 0; i < lst.size(); i++) { %>
                    <tr class="<%=(i%2==0 ? "light" : "dark")%>">
                        <% UserContestDetail result = (UserContestDetail) lst.get(i); %>
                        <td class="value" nowrap="nowrap">
                            <tc-webtag:handle context='<%=tab%>' coderId='<%=result.getUserID()%>' darkBG='true' />
                            <% if (result.getIncomplete() > 0) {
                                isComplete = false;%>*<% } %></td>
                        <td class="valueC"><%=result.getPoints()%>
                        </td>
                        <td class="valueC"><%=result.getComplete()%>
                        </td>
                        <td class="valueC"><%=result.getIncomplete()%>
                        </td>
                        <td class="valueC"><%=result.getSubmissionCount()%>
                        </td>
                        <td class="valueC">
                            <a href="/tco08?module=MemberResults&amp;eid=${event_id}&amp;ct=<rsc:item name="contest_id" row="<%=rscContest.getRow(0)%>" />&amp;cr=<%=result.getUserID()%>">results</a>
                        </td>
                    </tr>
                    <% }%>

                </table>
                <br /><br />
                <%if (!isComplete) {%>
                * Contains results from projects still in progress, results subject to change
                <br /><br />
                <% } %>


    </div><%-- #content --%>

<jsp:include page="../footer.jsp" />

</div><%-- #wrapper --%>

</body>
</html>