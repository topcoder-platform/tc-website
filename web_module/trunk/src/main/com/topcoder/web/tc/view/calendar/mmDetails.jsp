<%@ page import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer" %>
<%@ page import="com.topcoder.web.common.StringUtils" %>
<%@ page import="com.topcoder.web.tc.Constants" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.util.Arrays" %>
<%@ page contentType="text/html;charset=utf-8" %>

<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%

    ResultSetContainer.ResultSetRow rsr = (ResultSetContainer.ResultSetRow) (((ResultSetContainer) request.getAttribute("rsc")).get(0));
    String time = StringUtils.checkNull((String) request.getAttribute("time"));
	long roundId = rsr.getLongItem("round_id");
	
	long[] experimentalRounds = {13793, 13796, 13797, 13798, 13799, 13800, 13801, 13992};
	Arrays.sort(experimentalRounds);
	
	long[] eligibilityRounds = {13754, 13772, 13793, 13796, 13797, 13798, 13799, 13800, 13801, 13934, 13953, 13992};
	Arrays.sort(eligibilityRounds);
	
	long[] nsaRounds = {14176, 14196, 14207, 14208};
	Arrays.sort(nsaRounds);
	                                                         
	long[] ntlRounds = {14481, 14570, 15087};
	Arrays.sort(ntlRounds);
	

%>
<c:set var="row" value="<%=rsr%>" />
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" 
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html>

<head>
    <title>TopCoder</title>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
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
        <jsp:param name="title" value="Challenge Details"/>
    </jsp:include>

<%if(roundId == 13992 ) {%>

	<%-- BRANDING --%>
	<div align="center">
	<h2>The NASA-TopCoder Challenge</h2>
	</div>

	<%-- BRANDING --%>
	<div align="center">
	<img src="http://www.topcoder.com/i/srm/srm_banner/nasa_banner.jpg" alt="Sponsor" border="0">
	</div>
	
<%} else if (Arrays.binarySearch(nsaRounds, roundId)>=0) { %>

	<%-- BRANDING --%>
	<div align="center">
	<h2>The NSA Marathon Match Event Series</h2>
	</div>

	<%-- BRANDING --%>
	<div align="center">
	<a href="http://www.topcoder.com/tc?module=LinkTracking&amp;link=http://www.topcoder.com/tc?module=Static%26d1=sponsors%26d2=NSAOverview&amp;refer=details">
		<img src="http://www.topcoder.com/i/sponsor/nsa/mm-banner-NSA.png" alt="NSA Marathon Match Events" border="0">
	</a>
	</div>
	
<%} else if (Arrays.binarySearch(ntlRounds, roundId)>=0) { %>

	<%-- BRANDING --%>
	<div align="center">
	<h2>The NASA Tournament Lab Marathon Match Event Series</h2>
	</div>

	<%-- BRANDING --%>
	<div align="center">
	<a href="http://www.topcoder.com/tc?module=LinkTracking&amp;link=http://www.topcoder.com/home/ntl&amp;refer=details">
		<img src="http://www.topcoder.com/i/sponsor/nasa/ntl_patch.png" alt="NASA Tournament Lab" border="0">
	</a>
	</div>
	
<%} else { %>
	<%-- BRANDING --%>
		<c:if test="${row.map['mm_image_path']!=null}">
		<div style="padding: 0px 0px 0px 5px; float: right;">
			<img src="${row.map['mm_image_path']}" alt="Sponsor" border="0">
		</div>
		</c:if>

	<%-- BRANDING --%>
	<h2>${row.map['contest_name']} &gt; ${row.map['round_name']}</h2>

<%} %>



    <c:set value="<%=new Date()%>" var="currentDate"/>
<c:if test="${row.map['coding_end_time'] > currentDate && row.map['coding_start_time'] < currentDate}">

    <div align="center">
        <table style="margin-top: 20px; margin-bottom: 20px;" cellpadding="0" cellspacing="0">
            <tbody>
                <tr>
                    <td style="padding: 0px 5px 10px 0px;" align="center" width="50%">
                        <a class="bigButton" style="width: 130px;"
						   <% if (Arrays.binarySearch(experimentalRounds, roundId)>=0) { %>
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

<% if (roundId == 15761) { %>
<p align="justify">
<i>This challenge is brought to you by: NASA's Center of Excellence for Collaborative Innovation and Harvard Business School in association with the Institute of Quantitative Social Sciences.</i>
</p>
<% } %>

<div class="sectionHeader">Competition Overview</div>

<%-- EXPERIMENTAL SERIES --%>
<% if (Arrays.binarySearch(experimentalRounds, roundId)>=0) { %>

<p align="justify">
This is the second of a series of Experimental Marathon Matches that TopCoder is running in coordination with Professor 
Karim Lakhani of Harvard Business School and Professor Kevin Boudreau of London Business School/MLab. The structure and 
rules for these events are a departure from anything that TopCoder has run in the past, in that we are exploring the effects of 
collaboration and information sharing during competition.
<br><br>
The second Experimental Marathon Match will include an algorithm problem provided by the Integrated Medical Model Team at NASA . 
In this challenge programmers will be asked to help NASA optimize a space flight medical kit  for astronauts. We believe that the 
TopCoder community may have an interesting take on this problem and could potentially come up with a breakthrough that will help 
NASA explore our universe.  
<br><br>
This Experimental Marathon Match event has over <b>$25,000</b> in prizes! In addition, 10 participants will get <b>VIP access</b> 
to one of the few remaining NASA shuttle launches and all contestants who actively participate will receive a limited edition, 
personalized <b>TopCoder/NASA T-shirt</b>.
<br><br>
In this Experimental Marathon Match, members who register for the event will be assigned to a Group, and within the Group 
will compete in sets of 20 individuals.  The total prize for each set will be $1,000.  In one Group, contestants will 
compete as members of teams of 5 against 3 other teams and in the other Group, contestants will compete individually against 
19 other individuals. 
<br><br>
<ul>

<li>
<b>Group A</b> - <i>Traditional Marathon Match</i> - Individuals in this group will be assigned to work on the problem individually 
- i.e. no information sharing at all. Winners in each set of 20 competitors will be declared based on the best performing 
code according to the problem statement's scoring forumla. 
</li>

<li>
<b>Group B</b> - <i>Teams</i> - Individuals in this group will be split into sets of 4 Rooms of 5 individuals, with Rooms 
competing against the other designated Rooms to win the $1000 prize.  Room members will allowed to share code and ideas during 
the entire length of the competition. Winners will be chosen based on the best score for each room.  The Room score is equal to the 
highest individual score in the Room.  Prizes will be allocated among the Contestants in the winning Room according to their 
contribution, as judged by the others in their Room.    
</li>

</ul>
<br>
Participants in all groups may submit code written in any of the following languages: Java, C++, C#.NET, VB.NET, or Python.
All sets of 20 will be isolated from one another so that there are no spillovers of information, discussions, or code amongst the groups. 
In addition, each team will be placed into a private competition with their own forum and standings information.  Competitors will need
to use the web-based interface for participating in the competition - no experimental rounds will be accessible from within the TopCoder Arena.
<br><br>
Keep in mind that there is no actual problem statement associated with the "registration" round.  
<br><br>
<b>After the registration period closes on October 28th, 2009, we may ask you some brief questions to help us us determine the groupings of 20. 
The email with the link to the brief questions will come from TopCoder and we request that you respond to it within 12 hours.</b>
<br><br>
<b>We ask that 
you register only if you plan to dedicate significant effort and time to this competition</b> that begins on November 4, 2009 and 
will last for ten days, and you are willing to complete the contribution list (if applicable) and the Post-Competition Survey following the 
competition. In addition, the number of available spaces for competitors is limited and we will only allow 480 competitors into 
the competition with preference given to competitors who have demonstrated a high likelihood of participating in challenges after 
they register.  Once registration is closed, and prior to the start of the competition, you will receive an email with your Group 
and Room assignment. 
<br><br>
Harvard's Professor Lakhani has been active in the forums discussing this Experimental Marathon Series. His handle is 
<a href="http://www.topcoder.com/tc?module=MemberProfile&cr=22681631">karimlakhani</a> 
and you can find further discussion here in the TopCoder 
<a href="http://forums.topcoder.com/?module=Thread&threadID=653101">forum discussions</a>. 
<br><br>
Please check out the rules link below for more detail.
<br><br>
<h3 align="center">
<a href="http://www.topcoder.com/longcontest/?module=ViewReg&rd=13992">Register to be assigned to a competition group</a>
</h3>
<br><br>

<div class="sectionHeader">Prize Structure</div>

		Cash prizes, an Invitation to View a NASA Launch, and T-shirts will be awarded as follows: 
		<br><br>

		<table class="bodyText" cellspacing="0" cellpadding="0" border="1">
			<tr>
				<td class="bodyText" align="center"><b>Group</b></td>
				<td class="bodyText" align="center"><b>Summary</b></td>
				<td class="bodyText" align="center"><b>Prizes</b></td>
			</tr>
			<tr>
				<td class="bodyText" nowrap="nowrap" align="left" valign="top">Group A <br>(Traditional Format)</td>
				<td class="bodyText" align="left" valign="top">Performance Prizes will be awarded in each Room to the highest individually scoring competitors</td>
				<td class="bodyText" align="left" valign="top">
					
					$500 to highest scoring submission.<br>
					$200 to the second highest scoring submission.<br>
					$125 to the third highest scoring submission.<br>
					$100 to the fourth highest scoring submission.<br>
					$75 to the fifth highest scoring submission.<br>
					<br>
					NASA Launch Invitation:  Each of the 5 individuals in Group A with the highest scores will be eligible 
					to receive an invitation from NASA to view a NASA launch as described above.
					<br><br>
					T-Shirts: All Contestants who are assigned to a Room and who actively participate are eligible to receive 
					a challenge T-shirt.
					<br><br>
					All prizes are contingent upon fully completing a survey from TopCoder and our academic research partners.
					<br>

				</td>

			</tr>
			<tr>
				<td class="bodyText" nowrap="nowrap" align="left" valign="top">Group B <br>(Team Format)</td>
				<td class="bodyText" align="left" valign="top">Performance Prizes will be awarded to members of the winning teams based on team member feedback</td>
				<td class="bodyText" align="left" valign="top">
					
					A total of $1,000 will be divided among the members of the highest-scoring Room group according to the contribution 
					list submitted by the members of the Group. <br><br>

					NASA Launch Invitation: Each of the 5 members of the highest-scoring Room team, if actively engaged in the competition,  
					will be eligible to receive an invitation from NASA to view a NASA launch as described above.
					<br><br>
					T-Shirts: All Contestants who are assigned to a Room and who actively participate are eligible to receive a challenge T-shirt.
					<br><br>
					All prizes are contingent upon fully completing a survey from TopCoder and our academic research partners.
					<br>
					
				</td>

			</tr>

		</table>
		<br><br>
		In addition, one $1,000 cash prize will be awarded to either the individual in Group A or the Room in Group B with the highest score.  
		If this prize is awarded to a Room in Group B it will be divided according to the contribution lists for that Room. 
		<br><br>
		Contestants must be active participants in order to be eligible to receive any prize.  In both Groups A and B, active 
		participation means working on the problem and submitting a reasonable attempt at a solution, including all required 
		parts (e.g., solution description, contribution list in Group B), responding to any email inquiries, and completing all 
		competition-related surveys, including the Post-Competition Survey.  In Group B, active participation includes providing 
		a contribution list as requested (including the final contribution list) whether or not a Contestants has submitted code 
		during the competition, and may include, instead of code submission, productive participation in the Room forums.

</p>
<%}%>

<%if(roundId == 10834) {%>
<p align="justify">
    This Marathon Match has some new rules and terms.  Please make sure to read
    the rules carefully before competing.  By submitting a solution in this match,
    you are agreeing to license it under the GNU Public License, Version 2.0.
</p>
<%}%>

<%if(roundId == 10862 || roundId == 13754 || roundId == 13772 || roundId == 13934 || roundId == 13953 ) {%>
<p align="justify">
    This Marathon Match has some different rules and terms.  Please make sure to read
    the rules carefully before competing.  <b>You must be eligible to compete in the match 
    as defined in the rules and by winning a prize you agree to transfer ownership of
    your submission to TopCoder.</b>
</p>
<%}%>

<%if(roundId == 14525 || roundId == 14584 || roundId == 15024 || roundId == 15075 || roundId == 15023 || 
     roundId == 15034 || roundId == 15038 || roundId == 15076 || roundId == 15077 || roundId == 15078
     || roundId == 15080 || roundId == 15103 || roundId == 15120 || roundId == 15130 || roundId == 15189
     || roundId == 15201 || roundId == 15202 || roundId == 15322 || roundId == 15327 || roundId == 15398
     || roundId == 15458 || roundId == 15520 || roundId == 15589 || roundId == 15611 || roundId == 15618
     || roundId == 15630 || roundId == 15637 || roundId == 15678 || roundId == 15761 || roundId == 15765
     || roundId == 15876 || roundId == 15879 || roundId == 15948) {%>
<p align="justify">
    <b>Please note that this event is being run for a TopCoder customer.  By winning a prize in this event you agree to transfer ownership of
    your submission to TopCoder.
<p>
<p align="justify">
This is a summary with highlights of the challenge details. Please make sure to read
    all of the rules carefully before competing.
</p>
<p>You must be eligible to compete in the match as defined in the rules.</b>
</p>
<%}%>


<%if(roundId == 13569 ||  roundId == 13570 || roundId == 13679 || roundId == 13680 || roundId == 13681 ) {%>
<p align="justify">
    This Marathon Match is an encryption match. Use a known encryption method like DES, Substitution cipher, or Cryptography, 
	to decipher the problem, and you can be a part of the $5,000 prize purse. 
	The top five highest scorers will receive prizes with the first place winner receiving $2,500.
</p>
<%}%>

<%if(roundId == 13754 || roundId == 13934 || roundId == 13953) {%>
<p align="justify">
    This Marathon Match is a money match that has a <b>$5,000 prize purse</b>! The top five highest scorers 
	will receive prizes with the first place winner receiving $2,500!
</p>
<%}%>

<%if(roundId == 13772 || roundId == 14525 || roundId == 14584 || roundId == 15024 || roundId == 15075 || roundId == 15023 || 
     roundId == 15034 || roundId == 15038 || roundId == 15076 || roundId == 15078 || roundId == 15103 || roundId == 15120 ||
     roundId == 15189 || roundId == 15322 || roundId == 15458 || roundId == 15618 || roundId == 15637 || roundId == 15948) {%>
<p align="justify">
    This Marathon Match is a money match that has a <b>$10,000 prize purse</b>! The top five highest scorers 
	will receive prizes with the first place winner receiving $5,000!
</p>
<%}%>

<% if (roundId == 15678) { %>
<p align="justify">
This Marathon Match is a money match that has a <b>$6,000 prize purse</b>! The first and second place winners will receive $4,000
and $2,000, respectively!
</p>
<% } %>

<% if (roundId == 15611) { %>
<p align="justify">
This Marathon Match is a money match that has a <b>$10,000 prize purse</b>! The top four highest scorers
will receive prizes with the first place winner receiving $4,000!
</p>
<p>
The match will be followed with an <a href="http://apps.topcoder.com/forums/?module=Thread&threadID=786874&start=0">additional submission phase</a>
which offers up to <b>$6,000 in prizes</b>!
</p>
<% } %>

<% if (roundId == 15761) { %>
<p align="justify">
This Marathon Match is a money match that has a <b>$25,000 prize purse</b>! The top five highest
scorers will receive prizes with the first place winner receiving $12,000!
</p>
<% } %>

<% if (roundId == 15765) { %>
<p align="justify">
This Marathon Match is a money match that has a <b>$15,000 prize purse</b>! The top four highest
scorers will receive prizes with the first place winner receiving $7,000!
</p>
<% } %>

<% if (roundId == 15876) { %>
<p align="justify">
This Marathon Match is a money match that has a <b>$5,000 prize purse</b>! The top three highest
scorers will receive prizes with the first place winner receiving $3,000!
</p>
<% } %>

<% if (roundId == 15879) { %>
<p align="justify">
This Marathon Match is a money match that has a <b>$7,000 prize purse</b>! The top four highest
scorers will receive prizes with the first place winner receiving $3,500!
</p>
<% } %>


<%if (roundId == 15520) {%>
<p align="justify">
This Marathon Match is a money match that has a <b>$30,000 prize purse</b>! The top ten highest scorers
will receive prizes with the first place winner receiving $10,000!
</p>
<%}%>

<%if (roundId == 15201 || roundId == 15202 || roundId == 15327) {%>
    This Marathon Match is a money match that has a <b>$5,000 prize purse</b>! The top five highest scorers 
	will receive prizes with the first place winner receiving $2,500!
<%}%>

<%if(roundId == 15077 || roundId == 15130) {%>
<p align="justify">
    This Marathon Match is a money match that has a <b>$7,500 prize purse</b>! The top five highest scorers 
	will receive prizes with the first place winner receiving $3,750!
</p>
<p align="justify">
The 10 highest scorers in the Marathon Match will be allowed to participate in the extra submission phase which will have <b>$2,500 in
total prize money</b>.
</p>
<%}%>

<%if (roundId == 15080 || roundId == 15398 || roundId == 15589) 
{%>
<p align="justify">
    This Marathon Match is a money match that has a <b>$1,000 prize purse</b>! The top two highest scorers 
	will receive prizes with the first place winner receiving $700!
</p>
<%}%>

<%-- LIMIT THE REMAINING COPY TO ONLY NON-EXPERIMENTAL ROUNDS --%>
<%if (Arrays.binarySearch(experimentalRounds, roundId)<0) { %>

<%if(roundId == 13772 ) {%>
<p align="justify">
    In TopCoder Marathon Match events, the system will be testing submissions for optimization according to the scoring criteria 
    outlined in the problem statement that is associated with this event.	
    Each event may have a different scoring mechanism. 
    Competitors will have to understand the scoring mechanism in order to effectively compete.  
    <br>
    <b>Participants may submit code written in the following language: C++ </b>
</p>
<%}else if(roundId == 15023 || roundId == 15322 || roundId == 15458 || roundId == 15630 || roundId == 15637 || roundId == 15761 || roundId == 15765) {%>
<p align="justify">
    In TopCoder Marathon Match events, the system will be testing submissions for optimization according to the scoring criteria 
    outlined in the problem statement that is associated with this event.	
    Each event may have a different scoring mechanism. 
    Competitors will have to understand the scoring mechanism in order to effectively compete.  
    <br><br>
    <b>Participants may submit code written in the following languages: Java, C++, C#.NET, or VB.NET. </b>
</p>
<%} else { %>
<p align="justify">
    In TopCoder Marathon Match events, the system will be testing submissions for optimization according to the scoring criteria 
    outlined in the problem statement that is associated with this event.	
    Each event may have a different scoring mechanism. 
    Competitors will have to understand the scoring mechanism in order to effectively compete.
    <% if (roundId == 15948) { %>
	Participants may submit code written in one of the following languages: Java, C++. 
    <% } else if (roundId == 15130 || roundId == 15611) { %>
    <br><br>
    Participants may submit only code written in C++.
<% if (roundId == 15611) { %>
The <a href="http://apps.topcoder.com/forums/?module=Thread&threadID=786874&start=0">additional submission phase</a> also
allows code submissions in Java, C# and VB.NET.
<% } %>
	<% } else { %>
	Participants may submit code written in one of the following languages: Java, C++, C#.NET, VB.NET, or Python. 
	<% } %>
</p>
<% } %>


<p align="justify">
<% if (roundId == 13953 ) {%>
    Once the submission phase of a Marathon Match has ended, final testing will run 
	and may take several days to complete.  Upon completion of final testing, 
    the final results will become available in the Marathon Match Archive on the web site. 
    Competitors will be able to see the test case details, other competitors' submissions, and all final results.
	<br>
    <b>Ratings will NOT be adjusted as a result of participation in this competition.</b>
<%} else { %>
    Once the submission phase of a Marathon Match has ended, final testing will run 
	and may take several days to complete.  Upon completion of final testing, 
    the final results will become available in the Marathon Match Archive on the web site. 
    Competitors will be able to see the test case details, other competitors' submissions, and all final results.
    For rated events, the ratings will be adjusted once results are final.
<%} %>
</p>
<p align="justify">
    For more details on the Marathon Match format, <a href="/longcontest/?module=Static&d1=instructions">click here</a>
</p>

<%if (roundId == 15630) {%>
<div class="sectionHeader">Prizes</div>
<p>This Marathon Match has a $15,000 total prize purse! $3,000 of them are awarded as two sets of milestone prizes.</p>
<p>The first set of milestone prizes is awarded as follows: we take all solutions submitted no later than 1 week after the start of the match (1 PM, April 22; only last submission from each member) and evaluate them on all system test cases. The 3 highest scored submissions are milestone winners.</p>
<p>The second set of milestone prizes is awarded in the same fashion, but the deadline is 2 weeks after the start of the match (1 PM, April 29). Both sets of milestone prizes use the following prize distribution:</p>
<pre>
1st place -- $750
2nd place -- $500
3rd place -- $250
</pre>
<p><i>Since milestone results (and even the handles of milestone winners) reveal some information about system test cases, we will announce them only after the end of the match.</i></p>
<p></p>
<p>The final prize of $12,000 are awarded to 5 highest scoring submissions as follows:</p>
<pre>
1st place -- $6,000
2nd place -- $2,400
3rd place -- $1,800
4th place -- $1,200
5th place -- $600
</pre>
<p>In case of any ties, the corresponding prize money are distributed equally among all tied competitors. The date/time of submission does not matter.</p>
<%}%>


<%if(roundId == 10834) {%>                                                   
<div class="sectionHeader">Prizes</div>
    There will be $5000 in total prize money.  The first and second highest scoring
    submissions in each of the five languages supported will receive $750 and $250,
    respectively.
<p align="justify">
</p>
<%}%>

<%-- NASA NTL SERIES --%>
<% if (Arrays.binarySearch(ntlRounds, roundId)>=0) { %>
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

<%if(roundId == 10930) {%>
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
<%if(roundId == 13754 || roundId == 13934 || roundId == 13953 ) {%>
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

<% if (Arrays.binarySearch(nsaRounds, roundId)>=0) { %>
	<div class="sectionHeader">Prizes</div>
    <p align="justify">There will be up to $3000 in total prize money awarded to the five (5) highest scoring members 
	  who are citizens of the United States.</p>

	<table class="bodyText" cellspacing="0" cellpadding="0" border="0" width="175">
		<tr>
			<td class="bodyText" nowrap="nowrap">1st</td><td class="bodyText" align="right">$1500</td>
		</tr>
		<tr>
			<td class="bodyText" nowrap="nowrap">2nd</td><td class="bodyText" align="right">$750</td>
		</tr>
		<tr>
			<td class="bodyText" nowrap="nowrap">3rd</td><td class="bodyText" align="right">$400</td>
		</tr>
		<tr>
			<td class="bodyText" nowrap="nowrap">4th</td><td class="bodyText" align="right">$250</td>
		</tr>
		<tr>
			<td class="bodyText" nowrap="nowrap">5th</td><td class="bodyText" align="right">$100</td>
		</tr>
	</table>

	<br>
    
<p align="justify">
    
</p>
<%}%>


<%if(roundId == 13772 || roundId == 14525 || roundId == 14584 || roundId == 15024 || roundId == 15075 || roundId == 15023 || 
     roundId == 15034 || roundId == 15038 || roundId == 15076 || roundId == 15078 || roundId == 15103 || roundId == 15120 ||
     roundId == 15189 || roundId == 15322 || roundId == 15458 || roundId == 15618 || roundId == 15637 || roundId == 15948) {%>
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
    
<p align="justify">
    
</p>
<%}%>

<% if (roundId == 15611) { %>
<div class="sectionHeader">Prizes</div>
    <p align="justify">The Marathon Match has $10,000 in total prize money.  The 4 highest scorers in this round will receive compensation for their submissions as follows:</p>

<table class="bodyText" cellspacing="0" cellpadding="0" border="0" width="175">
    <tr>
        <td class="bodyText" nowrap="nowrap">1st</td><td class="bodyText" align="right">$4,000</td>
    </tr>
    <tr>
        <td class="bodyText" nowrap="nowrap">2nd</td><td class="bodyText" align="right">$3,000</td>
    </tr>
    <tr>
        <td class="bodyText" nowrap="nowrap">3rd</td><td class="bodyText" align="right">$2,000</td>
    </tr>
    <tr>
        <td class="bodyText" nowrap="nowrap">4th</td><td class="bodyText" align="right">$1,000</td>
    </tr>
</table>

<p align="justify">In order to be eligible for these prizes, your code submission must be written in C++ and must be made before 9 AM, April 22, 2013.</p>

<p align="justify">The <a href="http://apps.topcoder.com/forums/?module=Thread&threadID=786874&start=0">additional submission phase</a> has up to $6,000
in total prize money:
<ul>
<li>All submissions with the final score of at least 800,000 are eligible for a combined prize purse of $1,000. If there are several such submissions, the prize will be divided evenly among them.</li>
<li>All submissions with the final score of at least 850,000 are eligible for a combined prize purse of $2,000. If there are several such submissions, the prize will be divided evenly among them.</li>
<li>All submissions with the final score of at least 900,000 are eligible for a combined prize purse of $3,000. If there are several such submissions, the prize will be divided evenly among them.</li>
</ul>
</p>  

<p align="justify">
TopCoder may *offer* to purchase submissions that did not win any prize if the client is interested in using them.
</p>
    
<p align="justify">
</p>
<% } %>

<% if (roundId == 15876) { %>
<div class="sectionHeader">Prizes</div>
    <p align="justify">The prize purse for this challenge is 5,000 USD! The 3 highest scorers in this round will receive compensation for their submissions as follows:</p>
<table class="bodyText" cellspacing="0" cellpadding="0" border="0" width="175">
    <tr>
        <td class="bodyText" nowrap="nowrap">1st</td><td class="bodyText" align="right" nowrap="nowrap">$3,000</td>
    </tr>
    <tr>
        <td class="bodyText" nowrap="nowrap">2nd</td><td class="bodyText" align="right" nowrap="nowrap">$1,500</td>
    </tr>
    <tr>
        <td class="bodyText" nowrap="nowrap">3rd</td><td class="bodyText" align="right" nowrap="nowrap">$500</td>
    </tr>
</table>
<p align="justify">
</p>
<% } %>

<% if (roundId == 15879) { %>
<div class="sectionHeader">Prizes</div>
    <p align="justify">The prize purse for this challenge is 7,000 USD! The 4 highest scorers in this round will receive compensation for their submissions as follows:</p>
<table class="bodyText" cellspacing="0" cellpadding="0" border="0" width="175">
    <tr>
        <td class="bodyText" nowrap="nowrap">1st</td><td class="bodyText" align="right" nowrap="nowrap">$3,500</td>
    </tr>
    <tr>
        <td class="bodyText" nowrap="nowrap">2nd</td><td class="bodyText" align="right" nowrap="nowrap">$2,000</td>
    </tr>
    <tr>
        <td class="bodyText" nowrap="nowrap">3rd</td><td class="bodyText" align="right" nowrap="nowrap">$1,000</td>
    </tr>
    <tr>
        <td class="bodyText" nowrap="nowrap">3rd</td><td class="bodyText" align="right" nowrap="nowrap">$500</td>
    </tr>
</table>
<p align="justify">
</p>
<% } %>


<% if (roundId == 15765) { %>
<div class="sectionHeader">Prizes</div>
    <p align="justify">The prize purse for this challenge is 15,000 USD and a trip to the 2013 TopCoder Open in Washington, DC! The 4 highest scorers in this round will receive compensation for their submissions as follows:</p>
<table class="bodyText" cellspacing="0" cellpadding="0" border="0" width="175">
    <tr>
        <td class="bodyText" nowrap="nowrap">1st</td><td class="bodyText" align="right" nowrap="nowrap">$7,000 and a trip to the 2013 TopCoder Open</td>
    </tr>
    <tr>
        <td class="bodyText" nowrap="nowrap">2nd</td><td class="bodyText" align="right" nowrap="nowrap">$4,000</td>
    </tr>
    <tr>
        <td class="bodyText" nowrap="nowrap">3rd</td><td class="bodyText" align="right" nowrap="nowrap">$2,000</td>
    </tr>
    <tr>
        <td class="bodyText" nowrap="nowrap">4th</td><td class="bodyText" align="right" nowrap="nowrap">$1,000</td>
    </tr>
</table>

<p align="justify">
TopCoder may *offer* to purchase submissions that did not win any prize if the client is interested in using them.
</p>

<p align="justify">
Additionally, there are two $700 USD and $300 USD prizes for unusual and perspective ideas. Only contestants with 5th and lower final scores are eligible for these prizes. The ideas must be described and submitted in a text document. You do not need to implement your idea (though if it is incorporated into your marathon match final submission, it can be a plus). The submission phase for ideas is separate from the marathon match and will open once the match is over. Additional details will be communicated at the match forum. Evaluation of ideas is subjective, but the main evaluation criteria for the winning ideas is: can (and how much) the Top-4 marathon match algorithms benefit from this idea? TopCoder reserves the right not to award this prize if no ideas are considered to be useful enough.
</p>
<% } %>


<% if (roundId == 15761) { %>
<div class="sectionHeader">Prizes</div>
    <p align="justify">The Marathon Match has $25,000 in total prize money.  The 5 highest scorers in this round will receive compensation for their submissions as follows:</p>
<table class="bodyText" cellspacing="0" cellpadding="0" border="0" width="175">
    <tr>
        <td class="bodyText" nowrap="nowrap">1st</td><td class="bodyText" align="right">$12,000</td>
    </tr>
    <tr>
        <td class="bodyText" nowrap="nowrap">2nd</td><td class="bodyText" align="right">$6,000</td>
    </tr>
    <tr>
        <td class="bodyText" nowrap="nowrap">3rd</td><td class="bodyText" align="right">$3,000</td>
    </tr>
    <tr>
        <td class="bodyText" nowrap="nowrap">4th</td><td class="bodyText" align="right">$2,000</td>
    </tr>
    <tr>
        <td class="bodyText" nowrap="nowrap">5th</td><td class="bodyText" align="right">$1,000</td>
    </tr>
</table>

<p align="justify">
TopCoder may *offer* to purchase submissions that did not win any prize if the client is interested in using them.
</p>

<p align="justify">
Additionally, there is a $1,000 USD prize for an unusual and perspective idea. Only contestants with 6th and lower final scores are eligible for this prize. The idea must be described and submitted in a text document. You do not need to implement your idea (though if it is incorporated into your marathon match final submission, it can be a plus). The submission phase for ideas is separate from the marathon match and will open once the match is over. Additional details will be communicated at the match forum. Evaluation of ideas is subjective, but the main evaluation criteria for the winning idea is: can (and how much) the Top-5 marathon match algorithms benefit from this idea? TopCoder reserves the right not to award this prize if no ideas are considered to be useful enough.
</p>

<% } %>

<%if (roundId == 15520) {%>
<div class="sectionHeader">Prizes</div>
    <p align="justify">There is a total $30,000 USD cash prize purse for this challenge, 100 T-shirts, 5 stickers that have flown in space
and 5 letters of recommendation. $25,000 USD is allocated for the final prizes and $5,000 are allocated for checkpoint prizes. The contestants with
the 10 highest non-zero final scores will be awarded the following prizes.</p>

<table class="bodyText" cellspacing="0" cellpadding="0" border="0" width="175">
    <tr>
        <td class="bodyText" nowrap="nowrap">1st</td><td class="bodyText" align="right">$10,000</td>
    </tr>
    <tr>
        <td class="bodyText" nowrap="nowrap">2nd</td><td class="bodyText" align="right">$5,000</td>
    </tr>
    <tr>
        <td class="bodyText" nowrap="nowrap">3rd</td><td class="bodyText" align="right">$3,000</td>
    </tr>
    <tr>
        <td class="bodyText" nowrap="nowrap">4th</td><td class="bodyText" align="right">$1,750</td>
    </tr>
    <tr>
        <td class="bodyText" nowrap="nowrap">5th</td><td class="bodyText" align="right">$1,500</td>
    </tr>
    <tr>
        <td class="bodyText" nowrap="nowrap">6th</td><td class="bodyText" align="right">$1,250</td>
    </tr>
    <tr>
        <td class="bodyText" nowrap="nowrap">7th</td><td class="bodyText" align="right">$1,000</td>
    </tr>
    <tr>
        <td class="bodyText" nowrap="nowrap">8th</td><td class="bodyText" align="right">$750</td>
    </tr>
    <tr>
        <td class="bodyText" nowrap="nowrap">9th</td><td class="bodyText" align="right">$500</td>
    </tr>
    <tr>
        <td class="bodyText" nowrap="nowrap">10th</td><td class="bodyText" align="right">$250</td>
    </tr>
</table>

<p align="justify">One week after the start of the challenge the first set of checkpoint prizes will be selected. The contestants with the top 4 highest
provisional scores (on the leader board) at that time will receive the prizes listed below. Then two weeks after the start of the challenge, the second
set of checkpoint prizes will be selected for the contestants with the 4 highest provisional scores at that time.
See below for the exact date and time for the selection of the checkpoint winners. </p>

<table class="bodyText" cellspacing="0" cellpadding="0" border="0" width="275">
    <tr>
        <td class="bodyText" nowrap="nowrap">&nbsp;</td><td class="bodyText" align="right"><b>Week 1</b></td><td class="bodyText" align="right"><b>Week 2</b></td>
    </tr>
    <tr>
        <td class="bodyText" nowrap="nowrap">1st</td><td class="bodyText" align="right">$1,000</td><td class="bodyText" align="right">$1,000</td>
    </tr>
    <tr>
        <td class="bodyText" nowrap="nowrap">2nd</td><td class="bodyText" align="right">$750</td><td class="bodyText" align="right">$750</td>
    </tr>
    <tr>
        <td class="bodyText" nowrap="nowrap">3rd</td><td class="bodyText" align="right">$500</td><td class="bodyText" align="right">$500</td>
    </tr>
    <tr>
        <td class="bodyText" nowrap="nowrap">4th</td><td class="bodyText" align="right">$250</td><td class="bodyText" align="right">$250</td>
    </tr>
</table>

<p align="justify">Each of the contestants with one of the top 100 final non-zero scores will win a NTL ISS Longeron T-Shirt.</p>

<p align="justify">There will also be final bonus prizes for the top 5 final finishers. The
1st, 2nd, 3rd, 4th, and 5th place final winners will receive stickers from NASA <b>which have actually orbited the Earth</b>.
These stickers were flown on Space Shuttle Endeavour, on mission STS-134, May 16, 2011. TopCoder will also provide a letter of reference for
each of the 1st, 2nd, 3rd, 4th, and 5th place final winners describing their performance in the challenge.
These could be used to aid your job search, for applying for entry into a school or even for your astronaut application.</p>

<p align="justify"> If there are ties for any of the non-cash prizes, the tie will be broken by selecting the earliest submissions. In the event of a tie for a cash prize, the associated prize money will be divided evenly between the tied contestants.</p>

<p align="justify">Before the challenge, this problem was extensively tested by an experienced marathon competitor (but for a shorter time period
than the actual challenge). The tester's pre-challenge solution will be submitted at the start of the challenge (using the handle "mm_tester") and
will not be modified throughout the challenge. This will make the tester's provisional score visible throughout the match. The tester will be eligible
for the final prizes based on his initial submission, but not the tester is eligible for the checkpoint prizes.
The tester's identity will not be revealed until the challenge is over.</p>
<%}%>

<%if(roundId == 15201 || roundId == 15202 || roundId == 15327) {%>
<div class="sectionHeader">Prizes</div>
    <p align="justify">There will be $5,000 in total prize money.  The 5 highest scorers in this round will receive compensation for their submissions as follows:</p>

<table class="bodyText" cellspacing="0" cellpadding="0" border="0" width="175">
    <tr>
        <td class="bodyText" nowrap="nowrap">1st</td><td class="bodyText" align="right">$2,500</td>
    </tr>
    <tr>
        <td class="bodyText" nowrap="nowrap">2nd</td><td class="bodyText" align="right">$1,000</td>
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
    

<p align="justify">
    
</p>
    
<p align="justify">
    
</p>
<%}%>

<%if(roundId == 15077 || roundId == 15130) {%>
<div class="sectionHeader">Prizes</div>
    <p align="justify">There will be $7,500 in total prize money.  The 5 highest scorers in this round will receive compensation for their submissions as follows:</p>

<table class="bodyText" cellspacing="0" cellpadding="0" border="0" width="175">
    <tr>
        <td class="bodyText" nowrap="nowrap">1st</td><td class="bodyText" align="right">$3,750</td>
    </tr>
    <tr>
        <td class="bodyText" nowrap="nowrap">2nd</td><td class="bodyText" align="right">$1,500</td>
    </tr>
    <tr>
        <td class="bodyText" nowrap="nowrap">3rd</td><td class="bodyText" align="right">$1,125</td>
    </tr>
    <tr>
        <td class="bodyText" nowrap="nowrap">4th</td><td class="bodyText" align="right">$750</td>
    </tr>
    <tr>
        <td class="bodyText" nowrap="nowrap">5th</td><td class="bodyText" align="right">$375</td>
    </tr>
</table>

<p align="justify">The 10 highest scorers in the round will be allowed to participate in the extra submission phase which will have $2,500 in
total prize money. The detailed rules of this phase will be posted to the marathon match forum.</p>
<%}%>

<%if (roundId == 15080 || roundId == 15398 || roundId == 15589) {%>
<div class="sectionHeader">Prizes</div>
    <p align="justify">There will be $1,000 in total prize money.  The 2 highest scorers in this round will receive compensation
    for their submissions as follows:</p>

<table class="bodyText" cellspacing="0" cellpadding="0" border="0" width="175">
    <tr>
        <td class="bodyText" nowrap="nowrap">1st</td><td class="bodyText" align="right">$700</td>
    </tr>
    <tr>
        <td class="bodyText" nowrap="nowrap">2nd</td><td class="bodyText" align="right">$300</td>
    </tr>
</table>

<p align="justify">
    
</p>
<%}%>


<%if(roundId == 14584 ) {%>
<p align="justify">
    <b>There will be an additional bonus prize purse of $5,000 for novel approaches to this particular problem.  All competitors who meet the eligibility critera of the 
	Marathon Match and who submit a one to two-page description of their algorithm and how it meets the requirements of a novel approach will be 
	eligible for an award of a portion of the bonus prize purse.  Please review the discussion forum for this marathon match for more information on the bonus prize requirements.</b>
</p>
<%}%>



<%-- END IF FOR LIMIT ON EXPERIMENTAL SERIES --%>
<%}%>

<% if (Arrays.binarySearch(eligibilityRounds, roundId)>=0) { %>
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
			<li>You must be authorized to perform services in the country from which you are located while participating 
			in the competition as an independent contractor. (Note: In most cases you will not
            need to do anything to become authorized)</li>

		</ul>
	</p>
<%} else if (Arrays.binarySearch(nsaRounds, roundId)>=0) { %>
	<div class="sectionHeader">Eligibility</div>
	<p align="justify">
		The competition is open to all members who are at least 18 years of age who are U.S. citizens. 
		<br><br>
		You are not eligible for this Competition if you are on the Specially Designated National list 
		promulgated and amended, from time to time, by the United States Department of the Treasury. 
		<br>
	</p>
<%}%>

<% if (Arrays.binarySearch(experimentalRounds, roundId)>=0) { %>
  <div class="sectionHeader">Registration Timeline</div>
<%} else { %>
  <div class="sectionHeader">Timeline</div>
<%}%>

<div align="center" style="margin: 20px;">
    <table cellpadding="0" cellspacing="0" style="width: 180px;">
        <tbody>
            <tr>
                <td align="center" colspan="2" style="border-bottom: 1px solid #999999;">
				   
				   <% if (Arrays.binarySearch(experimentalRounds, roundId)>=0) { %>
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
            <% if (roundId == 15520) { %>
            <tr>
                <td width="100%" align="left">
                    <strong>1st checkpoint:</strong>
                </td>
                <td align="center" nowrap="nowrap">
		<b>01.23.2013</b></br>
		13:00 EST</td>
            </tr>
            <tr>
                <td width="100%" align="left">
                    <strong>2nd checkpoint:</strong>
                </td>
                <td align="center" nowrap="nowrap">
		<b>01.30.2013</b></br>
		13:00 EST</td>
            </tr>
            <% } %>
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
