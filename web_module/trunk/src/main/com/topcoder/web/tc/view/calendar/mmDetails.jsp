<%@ page import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer" %>
<%@ page import="com.topcoder.web.common.StringUtils" %>
<%@ page import="com.topcoder.web.tc.Constants" %>
<%@ page import="java.util.Date" %>
<%@ page contentType="text/html;charset=utf-8" %>

<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%

    ResultSetContainer.ResultSetRow rsr = (ResultSetContainer.ResultSetRow) (((ResultSetContainer) request.getAttribute("rsc")).get(0));
    String time = StringUtils.checkNull((String) request.getAttribute("time"));
%>
<c:set var="row" value="<%=rsr%>" />
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" 
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html>

<head>
    <title>TopCoder</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <jsp:include page="../script.jsp" />
    <jsp:include page="../style.jsp">
        <jsp:param name="key" value="tc_stats"/>
    </jsp:include>
</head>

<body>

<jsp:include page="../top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
<tbody>
    <tr valign="top">
<%-- Left Column Begins--%>
        <td width="180">
            <jsp:include page="../includes/global_left.jsp">
                <jsp:param name="node" value="m_long_contests"/>
            </jsp:include>
        </td>
<%-- Left Column Ends --%>

<%-- Center Column Begins --%>
        <td width="100%" align="center" class="bodyColumn">
            <div class="fixedWidthBody">

    <jsp:include page="../page_title.jsp">
        <jsp:param name="image" value="long_comps_topcoder"/>
        <jsp:param name="title" value="Contest Details"/>
    </jsp:include>

<%-- BRANDING --%>
    <c:if test="${row.map['mm_image_path']!=null}">
    <div style="padding: 0px 0px 0px 5px; float: right;">
        <img src="${row.map['mm_image_path']}" alt="Sponsor" border="0">
    </div>
    </c:if>

<%-- BRANDING --%>
<h2>${row.map['contest_name']} &gt; ${row.map['round_name']}</h2>


    <c:set value="<%=new Date()%>" var="currentDate"/>
<c:if test="${row.map['coding_end_time'] > currentDate && row.map['coding_start_time'] < currentDate}">

    <div align="center">
        <table style="margin-top: 20px; margin-bottom: 20px;" cellpadding="0" cellspacing="0">
            <tbody>
                <tr>
                    <td style="padding: 0px 5px 10px 0px;" align="center" width="50%">
                        <a class="bigButton" style="width: 130px;"
                           href="/longcontest/?module=ViewReg&amp;<%=Constants.ROUND_ID%>=${row.map['round_id']}">Register/Submit</a>
                        <%--<div class="bigButton" style="width: 100px;">Register</div>--%>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
</c:if>    

<div class="sectionHeader">Competition Overview</div>

<%if(rsr.getIntItem("round_id") == 10834) {%>
<p align="justify">
    This Marathon Match has some new rules and terms.  Please make sure to read
    the rules carefully before competing.  By submitting a solution in this match,
    you are agreeing to license it under the GNU Public License, Version 2.0.
</p>
<%}%>
<%if(rsr.getIntItem("round_id") == 10862 ) {%>
<p align="justify">
    This Marathon Match has some new rules and terms.  Please make sure to read
    the rules carefully before competing.  You must be eligible to compete in the match 
    as defined in the rules and by winning a prize you agree to transfer ownership of
    your submission to TopCoder.
</p>
<%}%>

<p align="justify">
    Unlike traditional algorithm competitions, the system is not necessarily testing for correctness. 
    In Marathon Matches, the scoring mechanism may be different for each problem. 
    A description of the scoring mechanism will be provided in the problem statement. 
    Competitors will have to understand the scoring mechanism in order to effectively compete.  
    Participants may submit code written in one of the following languages: Java, C++, C#.NET, VB.NET, or Python. 
</p>
<p align="justify">
    Once the submission phase of a Marathon Match has ended, 
    the final results will become available by clicking the Results link. 
    Competitors will be able to see the test cases, other competitors' submissions, and results.
    Once the results are final, ratings will be adjusted.
</p>
<p align="justify">
    For more details on the Marathon Match format, <a href="/longcontest/?module=Static&d1=instructions">click here</a>
</p>

<%if(rsr.getIntItem("round_id") == 10834) {%>
<div class="sectionHeader">Prizes</div>
    There will be $5000 in total prize money.  The first and second highest scoring
    submissions in each of the five languages supported will receive $750 and $250,
    respectively.
<p align="justify">
    
</p>
<%}%>
<%if(rsr.getIntItem("round_id") == 10930) {%>
<div class="sectionHeader">Prizes</div>
    <p align="justify">There will be $15000 in total prize money.  The 10 highest scorers in the round will receive prizes as follows:</p>

<table class="bodyText" cellspacing="0" cellpadding="0" border="0" width="175">
    <tr>
        <td class="bodyText" nowrap="nowrap">1st</td><td class="bodyText" align="right">$7000</td>
    </tr>
    <tr>
        <td class="bodyText" nowrap="nowrap">2nd</td><td class="bodyText" align="right">$3000</td>
    </tr>
    <tr>
        <td class="bodyText" nowrap="nowrap">3rd</td><td class="bodyText" align="right">$2000</td>
    </tr>
    <tr>
        <td class="bodyText" nowrap="nowrap">4th</td><td class="bodyText" align="right">$1000</td>
    </tr>
    <tr>
        <td class="bodyText" nowrap="nowrap">5th-6th</td><td class="bodyText" align="right">$500</td>
    </tr>
    <tr>
        <td class="bodyText" nowrap="nowrap">7th-10th</td><td class="bodyText" align="right">$250</td>
    </tr>
</table>
    
<p align="justify">
    
</p>
<%}%>
<div class="sectionHeader">Timeline</div>

<div align="center" style="margin: 20px;">
    <table cellpadding="0" cellspacing="0" style="width: 180px;">
        <tbody>
            <tr>
                <td align="center" colspan="2" style="border-bottom: 1px solid #999999;">
                    <strong>Registration &amp; Submission</strong>
                </td>
            </tr>
            <tr>
                <td width="100%" align="left">
                    <strong>Opens:</strong>
                </td>
                <td align="center" nowrap="nowrap">
                    <rsc:item name="reg_start_time" row="<%=rsr%>" format="'<strong>'MM.dd.yyyy'</strong><br />'HH:mm z"/>
                </td>
            </tr>
            <tr>
                <td align="left">
                    <strong>Closes:</strong>
                </td>
                <td align="center" nowrap="nowrap">
                    <rsc:item name="reg_end_time" row="<%=rsr%>" format="'<strong>'MM.dd.yyyy'</strong><br />'HH:mm z"/>
                </td>
            </tr>
        </tbody>
    </table>
</div>

<h2 align="center">
    <a href="?<%=Constants.MODULE_KEY%>=MatchRules&amp;<%=Constants.ROUND_ID%>=${row.map['round_id']}" class="bcLink">Rules & Regulations</a>
</h2>



            </div>
        </td>
<%-- Center Column Ends --%>
        
<%-- Right Column Begins --%>
        <td width="170">
            <jsp:include page="../public_right.jsp">
                <jsp:param name="level1" value="default"/>
            </jsp:include>
        </td>
<%-- Right Column Ends --%>
        
    </tr>
</tbody>
</table>

<jsp:include page="../foot.jsp" />

</body>

</html>