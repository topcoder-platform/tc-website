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
						   <%if(rsr.getIntItem("round_id") == 13793) {%>
                             href="/longcontest/?module=ViewReg&amp;<%=Constants.ROUND_ID%>=${row.map['round_id']}">Register</a>
						   <%} else { %>
							 href="/longcontest/?module=ViewReg&amp;<%=Constants.ROUND_ID%>=${row.map['round_id']}">Register/Submit</a>
						   <%}%>
                        <%--<div class="bigButton" style="width: 100px;">Register</div>--%>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
</c:if>    

<div class="sectionHeader">Competition Overview</div>

<%-- EXPERIMENTAL SERIES --%>
<%if(rsr.getIntItem("round_id") == 13793 || rsr.getIntItem("round_id") == 13796 || rsr.getIntItem("round_id") == 13797 || rsr.getIntItem("round_id") == 13798
     || rsr.getIntItem("round_id") == 13799 || rsr.getIntItem("round_id") == 13800 || rsr.getIntItem("round_id") == 13801 ) {%>
<p align="justify">
This is the first of a series of Experimental Marathon Matches that TopCoder is running in coordination with Harvard Business School.  
The structure and rules for these events are a departure from anything that TopCoder has run in the past, in that we are exploring the 
effects of changes in how individuals collaborate and share information about approaches and code.
<br><br>
The competitions each will involve solving a computational biology problem.  This first problem is related to genomics. 
We believe that the TopCoder community may have an interesting take on these problems and could potentially come up with breakthroughs 
that benefit science in general.  We will of course also make sure that the writers of the algorithms that win get both cash prizes and 
if we uncover something publishable to get credit in a research paper.
<br><br>
This Experimental Marathon Match event has a total of <b>$6,000 in prizes</b>! 
In addition, there will be three 2009 TCO trips to Las Vegas being given away as prizes for performance in this Experimental Marathon event.
<br><br>
In this Experimental Marathon Match, members who register for the event will automatically assigned into one of 3 groups:
<br><br>
<ul>

<li>
<b>Group A</b> - <i>Traditional Marathon Match</i> - Individuals in this group will be assigned to work on the problem individually - 
i.e. no information sharing at all. Winners will be declared based on the best performing code according to the problem's statement.
</li>

<li>
<b>Group B</b> - <i>Traditional + Sharing</i> - In this group individuals will initially compete individually in a first phase of competition lasting one week.  In a second phase, 
they will be in the information sharing mode, where all the entries that they submit will be viewable to all those in the same group/treatment.  
From that point on they are encouraged to openly discuss their code and their ideas in their group's forum.  While sharing, participants will still submit 
individually but they will be asked to give credit to individuals from which they have borrowed or incorporated code or ideas. 
</li>

<li>
<b>Group C</b> - <i>Sharing</i> - Individuals in this group will be sharing code and ideas during the entire length of the competition.  
In both phases, participants will submit individually but they will be asked to give credit to individuals from which they have borrowed or 
incorporated code or ideas. We will declare winners for best performing code and have a shared pool prize which will go to individuals who were credited by others.
</li>
</ul>
<br>
Participants in all groups may submit code written in any of the following languages: Java, C++, C#.NET, VB.NET, or Python.
<br>
All Groups will be isolated from one another so that there are no spillovers of information, discussions, or code amongst the groups.  
Our hope is to learn more about which processes are most effective.
<br><br>
<a href="http://www.topcoder.com/longcontest/?module=ViewReg&rd=13793">Register to be assigned to one of the three groups here.</a>
<br><br>
Keep in mind that there is no actual problem statement associated with the "registration" round.  Once the registration period closes on April 13, 2009,
you will automatically be assigned to a competition round that corresponds with the group to which you have been assigned.  We ask that you register only 
if you plan to make a reasonable effort at participation in the competition round that begins on April 13, 2009 and will last for two weeks.

Once registration is closed, and prior to the start of the competition, you will receive an email with your Group/Treatment 
assignment - you will be assigned based on your Marathon Match rating.  
<br><br>
Harvard's Professor Lakhani has been active in the forums discussing this Experimental Marathon Series.  
His handle is <a href="http://www.topcoder.com/tc?module=MemberProfile&cr=22681631">karimlakhani</a> and you can find 
<a href="http://forums.topcoder.com/?module=Thread&threadID=637060&start=0">further discussion here</a> in the TopCoder forum discussions. 
<br><br>
Please check out the rules link below for more detail.
</p>
<%}%>

<%if(rsr.getIntItem("round_id") == 10834) {%>
<p align="justify">
    This Marathon Match has some new rules and terms.  Please make sure to read
    the rules carefully before competing.  By submitting a solution in this match,
    you are agreeing to license it under the GNU Public License, Version 2.0.
</p>
<%}%>

<%if(rsr.getIntItem("round_id") == 10862 || rsr.getIntItem("round_id") == 13754 || rsr.getIntItem("round_id") == 13772 || rsr.getIntItem("round_id") == 13934 || rsr.getIntItem("round_id") == 13953 ) {%>
<p align="justify">
    This Marathon Match has some different rules and terms.  Please make sure to read
    the rules carefully before competing.  <b>You must be eligible to compete in the match 
    as defined in the rules and by winning a prize you agree to transfer ownership of
    your submission to TopCoder.</b>
</p>
<%}%>

<%if(rsr.getIntItem("round_id") == 13569 ||  rsr.getIntItem("round_id") == 13570 || rsr.getIntItem("round_id") == 13679 || rsr.getIntItem("round_id") == 13680 || rsr.getIntItem("round_id") == 13681 ) {%>
<p align="justify">
    This Marathon Match is an encryption match. Use a known encryption method like DES, Substitution cipher, or Cryptography, 
	to decipher the problem, and you can be a part of the $5,000 prize purse. 
	The top five highest scorers will receive prizes with the first place winner receiving $2,500.
</p>
<%}%>

<%if(rsr.getIntItem("round_id") == 13754 || rsr.getIntItem("round_id") == 13934 || rsr.getIntItem("round_id") == 13953) {%>
<p align="justify">
    This Marathon Match is a money match that has a <b>$5,000 prize purse</b>! The top five highest scorers 
	will receive prizes with the first place winner receiving $2,500!
</p>
<%}%>

<%if(rsr.getIntItem("round_id") == 13772 ) {%>
<p align="justify">
    This Marathon Match is a money match that has a <b>$10,000 prize purse</b>! The top five highest scorers 
	will receive prizes with the first place winner receiving $5,000!
</p>
<%}%>


<%-- LIMIT THE REMAINING COPY FOR THE EXPERIMENTAL SERIES --%>
<%if(rsr.getIntItem("round_id") != 13793 && rsr.getIntItem("round_id") != 13796 && rsr.getIntItem("round_id") != 13797 && rsr.getIntItem("round_id") != 13798
      && rsr.getIntItem("round_id") != 13799 && rsr.getIntItem("round_id") != 13800 && rsr.getIntItem("round_id") != 13801 ) {%>

<%if(rsr.getIntItem("round_id") == 13772 ) {%>
<p align="justify">
    Unlike traditional algorithm competitions, the system is not necessarily testing for correctness. 
    In Marathon Matches, the scoring mechanism may be different for each problem. 
    A description of the scoring mechanism will be provided in the problem statement. 
    Competitors will have to understand the scoring mechanism in order to effectively compete.  
    <b>Participants may submit code written in the following language: C++ </b>
</p>
<%} else { %>
<p align="justify">
    Unlike traditional algorithm competitions, the system is not necessarily testing for correctness. 
    In Marathon Matches, the scoring mechanism may be different for each problem. 
    A description of the scoring mechanism will be provided in the problem statement. 
    Competitors will have to understand the scoring mechanism in order to effectively compete.  
    Participants may submit code written in one of the following languages: Java, C++, C#.NET, VB.NET, or Python. 
</p>
<% } %>


<p align="justify">
<%if(rsr.getIntItem("round_id") == 13953 ) {%>
    Once the submission phase of a Marathon Match has ended, 
    the final results will become available by clicking the Results link. 
    Competitors will be able to see the test cases, other competitors' submissions, and results.
    <b>Ratings will NOT be adjusted as a result of participation in this competition.</b>
<%} else { %>
    Once the submission phase of a Marathon Match has ended, 
    the final results will become available by clicking the Results link. 
    Competitors will be able to see the test cases, other competitors' submissions, and results.
    Once the results are final, ratings will be adjusted.
<%} %>
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
<%if(rsr.getIntItem("round_id") == 13754 || rsr.getIntItem("round_id") == 13934 || rsr.getIntItem("round_id") == 13953 ) {%>
<div class="sectionHeader">Prizes</div>
    <p align="justify">There will be $5000 in total prize money.  The 5 highest scorers in this round will receive compensation for their submissions as follows:</p>

<table class="bodyText" cellspacing="0" cellpadding="0" border="0" width="175">
    <tr>
        <td class="bodyText" nowrap="nowrap">1st</td><td class="bodyText" align="right">$2500</td>
    </tr>
    <tr>
        <td class="bodyText" nowrap="nowrap">2nd</td><td class="bodyText" align="right">$1000</td>
    </tr>
    <tr>
        <td class="bodyText" nowrap="nowrap">3rd</td><td class="bodyText" align="right">$750</td>
    </tr>
    <tr>
        <td class="bodyText" nowrap="nowrap">4th</td><td class="bodyText" align="right">$500</td>
    </tr>
    <tr>
        <td class="bodyText" nowrap="nowrap">5th</td><td class="bodyText" align="right">$250</td>
    </tr>
</table>
<br>
<b>* NOTE:</b> All prize winners are required to submit to TopCoder a one-page description, explaining their winning 
submission, within one week of the announcment of the winners in order to receive their prize.
    
<p align="justify">
    
</p>
<%}%>

<%if(rsr.getIntItem("round_id") == 13772) {%>
<div class="sectionHeader">Prizes</div>
    <p align="justify">There will be $10,000 in total prize money.  The 5 highest scorers in this round will receive compensation for their submissions as follows:</p>

<table class="bodyText" cellspacing="0" cellpadding="0" border="0" width="175">
    <tr>
        <td class="bodyText" nowrap="nowrap">1st</td><td class="bodyText" align="right">$5,000</td>
    </tr>
    <tr>
        <td class="bodyText" nowrap="nowrap">2nd</td><td class="bodyText" align="right">$2,000</td>
    </tr>
    <tr>
        <td class="bodyText" nowrap="nowrap">3rd</td><td class="bodyText" align="right">$1,500</td>
    </tr>
    <tr>
        <td class="bodyText" nowrap="nowrap">4th</td><td class="bodyText" align="right">$1,000</td>
    </tr>
    <tr>
        <td class="bodyText" nowrap="nowrap">5th</td><td class="bodyText" align="right">$500</td>
    </tr>
</table>
    
<p align="justify">
    
</p>
<%}%>

<%-- END IF FOR LIMIT ON EXPERIMENTAL SERIES --%>
<%}%>

<%if(rsr.getIntItem("round_id") == 13754 || rsr.getIntItem("round_id") == 13772 || rsr.getIntItem("round_id") == 13793 || rsr.getIntItem("round_id") == 13796 || rsr.getIntItem("round_id") == 13797 || rsr.getIntItem("round_id") == 13798 
     || rsr.getIntItem("round_id") == 13799 || rsr.getIntItem("round_id") == 13800 || rsr.getIntItem("round_id") == 13801 || rsr.getIntItem("round_id") == 13934 || rsr.getIntItem("round_id") == 13953) {%>
<div class="sectionHeader">Eligibility</div>
  <p align="justify">
    You must be a TopCoder member, at least 18 years of age, meeting all of the membership requirements. In addition,
    you must fit into one of the following categories.
    <br><br>
    If you reside in the United States, you must be either:
    <ul>

        <li>A US Citizen</li>
        <li>A Lawful Permanent Resident of the US</li>
        <li>A temporary resident, asylee, refugee of the U.S., or have a lawfully issued work authorization card
            permitting unrestricted employment in the U.S.</li>
    </ul>
    If you do not reside in the United States:
    <ul>
        <li>You must be authorized to perform services as an independent contractor. (Note: In most cases you will not
            need to do anything to become authorized)</li>

    </ul>
  </p>
<%}%>

<%if(rsr.getIntItem("round_id") == 13793) {%>
  <div class="sectionHeader">Registration Timeline</div>
<%} else { %>
  <div class="sectionHeader">Timeline</div>
<%}%>

<div align="center" style="margin: 20px;">
    <table cellpadding="0" cellspacing="0" style="width: 180px;">
        <tbody>
            <tr>
                <td align="center" colspan="2" style="border-bottom: 1px solid #999999;">
				   <%if(rsr.getIntItem("round_id") == 13793) {%>
                     <strong>Registration</strong>
                   <%} else { %>
                     <strong>Registration &amp; Submission</strong>
                    <%}%>
                    
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
