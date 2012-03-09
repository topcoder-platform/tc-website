<%@ page contentType="text/html;charset=utf-8" %>
<%@ page language="java" %>
<%@ page import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer" %>
<%@ page import="com.topcoder.web.tc.Constants" %>
<%@ page import="java.util.Arrays" %>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
    ResultSetContainer.ResultSetRow rsr = (ResultSetContainer.ResultSetRow) (((ResultSetContainer) request.getAttribute("rsc")).get(0));
    int round_id = rsr.getIntItem("round_id");
	
	long[] experimentalRounds = {13793, 13796, 13797, 13798, 13799, 13800, 13801, 13992};
	Arrays.sort(experimentalRounds);
	
	long[] eligibilityRounds = {13754, 13772, 13793, 13796, 13797, 13798, 13799, 13800, 13801, 13934, 13953, 13992};
	Arrays.sort(eligibilityRounds);
	
	long[] nsaRounds = {14176, 14196, 14207, 14208};
	Arrays.sort(nsaRounds);
	
	long[] assignRounds = {13953,13934,13754,13772,13569,13570,13679,13680,13681};
	Arrays.sort(assignRounds);
	
	long[] ntlRounds = {14481, 14570};
	Arrays.sort(nsaRounds);
	
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

        <h3>Official Rules &amp Regulations</h3>

        <p align="justify">
        NO PURCHASE NECESSARY TO ENTER OR WIN, A PURCHASE WILL NOT INCREASE YOUR CHANCE OF WINNING. VOID WHERE PROHIBITED.
        </p>

        <div class="sectionHeader">About the Competition</div>

		<p align="justify">
            <strong>Entering the Competition</strong><br />
			The Competition is brought to you by TopCoder, Inc. The Competition is open to all TopCoder members 
			who meet the criteria described below and who register for the Competition (each, a "Competitor").
        </p>
		
        <p align="justify">
            <strong>When to start the Competition Round</strong><br />
            TopCoder members must register for the competition round. Registration may occur at any time
            from.
            <rsc:item name="reg_start_time" row="<%=rsr%>" format="MM.dd.yyyy hh:mm a z"/>
            to
            <rsc:item name="reg_end_time" row="<%=rsr%>" format="MM.dd.yyyy hh:mm a z"/>
            
            All competitors who have registered for the competition round will immediately be given
            access
            to the competition problem statement for that round. The competition round will begin
            at
            <rsc:item name="coding_start_time" row="<%=rsr%>" format="MM.dd.yyyy hh:mm a z"/>
            which is the earliest time that any member will be given access to the problem statement.
        </p>
        <p align="justify">
            <strong>Submission Requirements</strong><br />
            All competitors registered for a specific Marathon Match will see a Submit option 
            for that event. Clicking the Submit link will take you to a page that will 
            allow you to paste in a solution, select the proper language and either submit 
            (for compilation and testing) or save your code. When the Submit button is 
            selected, the code will be immediately compiled. Any compilation messages 
            or errors will be shown in the Messages Area. If the compilation was 
            successful, the submission will then be placed on a queue for automated testing. 
            Example test cases will not be tested. When your submission has been processed,
            you will receive an email indicating such and your place in the standings will 
            be adjusted accordingly. During the submission phase, overall ranking and 
            provisional score are the only pieces of information that will be made 
            available. A given competitor will only be allowed to submit once every 
            2 hours.  Additionally, if a competitor has a pending submission on the 
            testing queue it must finish testing before they may submit again.
        </p>
        <p align="justify">
            Clicking the Test Examples button will immediately compile and place your 
            submission on a queue for automated testing of just the example test cases. 
            Detailed feedback will be made available when the tests are complete, 
            including processing time, score, and any output from the program. 
            Competitors may submit test examples once every 15 minutes. The competitors 
            rank and overall score will not be updated.
        </p>
		
		<% if (Arrays.binarySearch(ntlRounds, round_id)>=0) { %>
		<p align="justify">
			In order to receive prize money, after the close of the competition you must fully document the derivation 
			of all numeric parameters used in your algorithm. If the solution submitted includes parameters that were obtained 
			from calculations based on the training data set, you will also need to provide the program or technique that you used 
			to generate these training parameters.  This data will be considered a part of your submission.  There is no restriction 
			on the programming language used to generate these training parameters.  Note that parameter documentation and code 
			should not be submitted during the coding phase. If you win a prize, a TopCoder representative will contact you directly 
			in order to collect this data.
			
			In addition, in order to receive prize money, you must submit a one page description of your approach to the problem including an explanation 
			of how your algorithm works.  This document will be collected after the competition has ended.
		</p>
		<% } %>
			
    <%if(rsr.getIntItem("round_id") == 10834) {%>
        <div class="sectionHeader">Prizes</div>
        <p align="justify">
        There will be $5000 in total prize money. The first and second highest 
        scoring submissions in each of the five languages supported will 
        receive $750 and $250, respectively.
        </p>
        <p align="justify">
        In order to be eligible for prizes, a competitor must be a TopCoder 
        member in good standing, at least 18 years of age, and must not be a 
        resident of Cuba, Iran, Iraq, Libya, North Korea, Sudan, Syria, 
        the Quebec province of Canada, or anywhere else where this contest is 
        prohibited by applicable law.
        </p>
    <%}%>
	
    <%if(rsr.getIntItem("round_id") == 13953 || rsr.getIntItem("round_id") == 13934 || rsr.getIntItem("round_id") == 13754  || rsr.getIntItem("round_id") == 13569 || 
	  rsr.getIntItem("round_id") == 13570 || rsr.getIntItem("round_id") == 13679 ||  rsr.getIntItem("round_id") == 13680 || rsr.getIntItem("round_id") == 13681 ) {%>
		<div class="sectionHeader">Prizes</div>
		<p align="justify">There will be up to $5000 in total prize money awarded to the five(5) highest scoring participating members. </p>

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
    <%}%>

    <%if(round_id == 13772 || round_id == 14525 || round_id == 14584 || round_id == 15024 || round_id == 15075 || 
	     round_id == 15023 || round_id == 15034 || round_id == 15038 || round_id == 15076) {%>
		<div class="sectionHeader">Prizes</div>
		<p align="justify">There will be $10,000 in total prize money.  The 5 highest scorers in the round will receive prizes as follows:</p>

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
    <%}%>

    <%if(round_id=15077) {%>
		<div class="sectionHeader">Prizes</div>
		<p align="justify">There will be $7,500 in total prize money.  The 5 highest scorers in the round will receive prizes as follows:</p>

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
			<td class="bodyText" nowrap="nowrap">4th</td><td class="bodyText" align="right">$700</td>
		</tr>
		<tr>
			<td class="bodyText" nowrap="nowrap">5th</td><td class="bodyText" align="right">$350</td>
		</tr>
		</table>

		<p align="justify">The 10 highest scorers in the round will be allowed to participate in the extra submission phase which will have $2,500 in
		total prize money. The detailed rules of this phase will be posted to the marathon match forum.</p>
    <%}%>

	
	<% if (Arrays.binarySearch(nsaRounds, round_id)>=0) { %>
	
		<div class="sectionHeader">Prizes</div>
		<p align="justify">
			There will be up to $3000 in total prize money awarded to the five (5) highest scoring members who
			are citizens of the United States.
		</p>

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
	
	<% } %>
	
	<% if (Arrays.binarySearch(ntlRounds, round_id)>=0) { %>
		<div class="sectionHeader">Prizes</div>
		<p align="justify">There will be up to $10,000 in total prize money awarded to the five (5) highest scoring members:</p>

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
	<% } %>

    <p align="justify">
       
    </p>

    <div class="sectionHeader">Conditions of Participation</div>

	 <p align="justify">
		Competitors agree, represent and certify that no portion of any money awarded in connection with this Competition has been or will 
		be paid, by or on behalf of Competitor, to any person for influencing or attempting to influence an officer or employee of any agency, 
		a Member of the United States Congress, an officer or employee of the United States Congress, or an employee of a Member of the United 
		States Congress in connection with the awarding of any Federal contract, the making of any Federal grant, the making of any Federal loan, 
		the entering into of any cooperative agreement, and the extension, continuation, renewal, amendment, or modification of any Federal contract, 
		grant, loan or cooperative agreement.
    </p>
	
    <p align="justify">
		Competitors must be registered members of TopCoder, and also register for this Competition. By participating in this Competition, 
		you agree to be bound by these Rules and to all decisions of TopCoder, which are final, binding and conclusive in all matters. 
		As a condition of participating in this Competition and by submitting a Submission, each Competitor agrees to permit TopCoder to describe, 
		publicize, and link to your entry (as applicable). Competitors must not cheat; all ideas for Submissions must be solely the Competitor's. 
		Unless otherwise explicitly permitted, Competitors may not collaborate on a Submission or in relation to this Competition in any way. Unless 
		otherwise explicitly permitted, Competitors may not copy or include code from any third party, including "open source" code or other code that 
		is or may be subject to license terms or restrictions. 
    </p>
	
	<p>
	  IN ORDER TO BE ELIGIBLE, YOU WARRANT THAT YOUR SUBMISSION FOR THIS COMPETITION:<br>
       <br>•	Does not include or anticipate the inclusion of any content that is in violation of or infringes third party intellectual 
	   property rights including, but not limited to copyrights, including music copyrights, trademarks, and rights of publicity. 
       <br>•	Is free and clear of all liens, claims, encumbrances or demands of any third parties. 
       <br>•	Does not include or anticipate the inclusion of any unsuitable or offensive content, including nudity, sexually explicit, 
	   disparaging, libelous or other inappropriate content. 
       <br>•	Has not been entered in previous contests, or won previous awards. 
       <br>•	Has not been published or distributed previously in any media. 
       <br>•	Is suitable for a general audience. 
       <br>•	Does not contain any claims that are not and cannot be substantiated or that would be false and/or misleading to a reasonable consumer. 
	</p>

     <p align="justify">		
		By participating in this competition, Competitor warrants that no impediment exists to Competitor's participating in this 
		Competition and that participating in this Competition will not interfere with your performance of, or breach, any other agreement 
		or obligations with any third party, including but not limited to, an employer, if any. 
     </p>

     <p align="justify">
        The winner of the competition will be the competitor that scores the most points across all competitors who participate. All decisions 
		relating to the viability of submissions, the ranking of submissions and all other matters pertaining to the competition shall be within 
		the sole discretion of TopCoder or its designee and shall be final and binding in all respects.
     </p>

     <p align="justify">
        By participating in a Marathon Match, a winner releases and agrees to hold harmless TopCoder, its affiliates, subsidiaries, sponsors, 
		advertising and promotion agencies, and prize suppliers, and all of their respective directors, officers, employees, representatives 
		and agents, from and against any and all liability for any loss, property damage or damage to person, including without limitation, 
		death and injury, due in whole or in part, directly or indirectly, from or arising out of participation in this competition, or 
		participation in any competition-related activity, or the receipt, use or misuse of a prize.
     </p>
	 
	 <p align="justify">
		TopCoder, in its sole discretion, reserves the right to disqualify any person tampering with the entry process, the operation of the 
		Web site, the competition process, or is otherwise in violation of the rules. TopCoder reserves the right at any time to disqualify a 
		Submission from a Competition where, acting in good faith, it believes there are reasonable grounds to warrant disqualification. 
		For example, TopCoder's determination that the Submission does not provide the functionality described or required, or the Submission 
		appears to be purposely designed to circumvent these Rules or the spirit of the Competition would be grounds for disqualification. 
		TopCoder reserves the right to cancel, terminate or modify the competition if it is not capable of completion as planned for any reason, 
		including infection by computer virus, bugs, tampering, unauthorized intervention or technical failures of any sort.        
	 </p>
	
     <p align="justify">
	 
		<% if (Arrays.binarySearch(assignRounds, round_id)>=0 || round_id==14481 || round_id==14525 || round_id == 14584 || 
		       round_id == 15024 || round_id == 15075 || round_id == 15023 || round_id == 15034 || round_id == 15038 || round_id == 15076
		       || round_id == 15077) { %>
		
			As a condition of winning and redeeming a cash prize, Competitors will be required to submit, 
			among other things, a completed TopCoder Competition Assignment Agreement, 
			if one is not already on file with TopCoder, AND a one to two-page description explaining how the algorithm for the winning submission works.

		<%} else { %>

			TopCoder does not require assignment of winning submissions in this competition.

		<%}%>

     </p>

    <div class="sectionHeader">Eligibility</div>

    <%if(rsr.getIntItem("round_id") == 13754  || rsr.getIntItem("round_id") == 13934 || rsr.getIntItem("round_id") == 13772 || 
	     rsr.getIntItem("round_id") == 13569 || rsr.getIntItem("round_id") == 13570 || rsr.getIntItem("round_id") == 13679 ||  
		 rsr.getIntItem("round_id") == 13680 || rsr.getIntItem("round_id") == 13681 || rsr.getIntItem("round_id") == 14525 ||
		 rsr.getIntItem("round_id") == 14584 || rsr.getIntItem("round_id") == 15024 || rsr.getIntItem("round_id") == 15075 ||
		 rsr.getIntItem("round_id") == 15023 || rsr.getIntItem("round_id") == 15034 || round_id == 15038 ||
		 rsr.getIntItem("round_id") == 15076 || rsr.getIntItem("round_id") == 15077) {%>

		<p align="justify">
			This Competition is open to all members of the TopCoder website, who have agreed to the terms thereof, and who are at least 
			18 years of age. Competitors must be:<br>
				<br>(i) a U.S. citizen, 
				<br>(ii) a lawful permanent resident of the U.S., 
				<br>(iii) a temporary resident, asylee, refugee of the U.S., or have a lawfully issued work authorization card permitting unrestricted employment in the U.S., or 
				<br>(iv) a non-U.S. resident authorized in the country in which the member resides while participating in this Competition to perform services as an independent contractor. 
		</p>
				
		<p align="justify">
			A Competitor is not eligible for this Competition if he/she is a resident of the Quebec province of Canada, Iran, Cuba, North Korea, 
			Sudan or Syria. In addition a Competitor is not eligible for this Competition if the Competitor is on the Specially Designated 
			National list promulgated and amended, from time to time, by the United States Department of the Treasury.
		</p>		
		
	<%} else if (Arrays.binarySearch(nsaRounds, round_id)>=0) { %>
	
		<p align="justify">
			The competition is open to all members who are at least 18 years of age who are U.S. citizens.
		</p>
		<p align="justify">
			You are not eligible for this Competition if you are on the Specially Designated National list promulgated and 
			amended, from time to time, by the United States Department of the Treasury. 
		</p>
	
	<%} else if (Arrays.binarySearch(ntlRounds, round_id)>=0) { %>
		<p align="justify">
			This Competition is open to all members of the TopCoder website, who have agreed to the terms thereof, and who are at least 
			18 years of age. Competitors must be:<br>
				<br>(i) a U.S. citizen, 
				<br>(ii) a lawful permanent resident of the U.S., 
				<br>(iii) a temporary resident, asylee, refugee of the U.S., or have a lawfully issued work authorization card permitting unrestricted employment in the U.S., or 
				<br>(iv) a non-U.S. resident authorized in the country in which the member resides while participating in this Competition to perform services as an independent contractor. 
		</p>
				
		<p align="justify">
			A Competitor is not eligible for this Competition if he/she is a resident of the Quebec province of Canada, Iran, Cuba, North Korea, 
			Sudan or Syria. In addition a Competitor is not eligible for this Competition if the Competitor is on the Specially Designated 
			National list promulgated and amended, from time to time, by the United States Department of the Treasury.
		</p>		

		
    <%} else { %>
	
        <p align="justify">
			The competition is open to all members who are at least 13 years of age.
        </p>
		
    <%}%>
	
    <p align="justify">
        All competitors must be registered members of TopCoder, and must have agreed to the rules on this page prior to
        participating in this competition. Competitors must abide by the Terms of Use of TopCoder's website at www.topcoder.com. 
		Violation of the Terms of Use may result in disqualification from this Competition, and/or further consequences as determined 
		in TopCoder's sole discretion. 
    </p>

    <p align="justify">
        Employees of TopCoder and those involved in the development, production (including 
        prize suppliers and sponsors), implementation and distribution of this competition 
        and their advertising or promotion agencies, parent companies, service providers, 
        agents, officers, subsidiaries or affiliates, or any other persons or entities 
        directly associated with the competition and members of the immediate families 
        and/or persons living in the same household as such persons, are ineligible to 
        enter the competition. 
    </p>


    <div class="sectionHeader">Ownership and Rights</div>
    
	<% if (Arrays.binarySearch(assignRounds, round_id)>=0 || round_id==14525 || round_id == 14584 || round_id == 15024 || round_id == 15075 ||
	       round_id == 15023 || round_id == 15034 || round_id == 15038 || round_id == 15076 || round_id == 15077) { %>
		
		<p align="justify">
			You hereby acknowledge and agree that TopCoder owns, solely and exclusively, all right, title and interest, including all intellectual property 
			rights, in and to the information posted on TopCoders website(s). If TopCoder compensates you for your submission, then you agree to irrevocably 
			and unconditionally transfer and assign to TopCoder all right, title and interest you have, may have or acquire in, such submission, and you agree 
			to execute and deliver such documents, certificates, assignments and other writings, and take such other actions as may be necessary or desirable to 
			vest in TopCoder the ownership rights granted to TopCoder hereunder. If TopCoder does not compensate you for your submission, then you retain any and 
			all rights to ownership of such material submitted to TopCoder. TopCoder will not gain ownership of this material. However, by submitting any submission 
			or any other material to TopCoder, you hereby grant a perpetual, royalty-free, irrevocable, non-exclusive right and license to TopCoder to use, reproduce 
			and publish such documents, materials or source code for commercial and/or non-commercial use. 
		</p>
		<p align="justify">
			You further agree that any and all works of authorship created, authored or developed by you hereunder which TopCoder compensates you for shall be deemed 
			to be "works made for hire" within the meaning of the United States Copyright Law and, as such, all rights therein including copyright shall belong solely 
			and exclusively to TopCoder from the time of their creation. To the extent any such work of authorship may not be deemed to be a work made for hire, you 
			agree to, and do hereby, irrevocably and unconditionally transfer and assign to TopCoder all right, title and interest including copyright in and to such work. 
		</p>
		
	<%} else if (Arrays.binarySearch(ntlRounds, round_id)>=0) { %>
	
		<p align="justify">
		All winning submissions shall be assigned to TopCoder.  TopCoder will, in turn, release this software as Open Source software under the 
		NASA Open Source Agreement, which can be found at http://opensource.arc.nasa.gov/page/nosa-software-agreement, and publish these 
		submission on the web site.  If TopCoder compensates you for your submission, then you agree to irrevocably and unconditionally transfer 
		and assign to TopCoder all right, title and interest you have in such submission, and you agree to execute and deliver such documents, 
		certificates, assignments and other writings, and take such other actions as may be necessary or desirable to vest in TopCoder the ownership 
		rights granted to TopCoder hereunder.  For example, winners must complete and submit the TopCoder Assignment version 2.0 or later and 
		complete other required paperwork prior to payment.
		</p>
		
		<p align="justify">
		You retain any and all rights to ownership of non-winning submissions submitted to TopCoder. TopCoder will not gain ownership of this 
		material. However, by submitting any submission or any other material to TopCoder, you hereby grant a perpetual, royalty-free, irrevocable, 
		non-exclusive right and license to TopCoder to use, reproduce and publish such documents, materials or source code for commercial 
		and/or non-commercial use.
		</p>

	<%} else { %>

		<p align="justify">
			You retain any and all rights to ownership of your submissions submitted to TopCoder. 
			TopCoder will not gain ownership of this material. However, by submitting any submission 
			or any other material to TopCoder, you hereby grant a perpetual, royalty-free, irrevocable, non-exclusive right and license to TopCoder to use, reproduce 
			and publish such documents, materials or source code for commercial and/or non-commercial use. 
		</p>
		
	<%}%>
	
    <p align="justify">
		You agree that if TopCoder is unable because of your unavailability, or for any other reason, to secure your signature to apply for 
		or to pursue any application for any United States or foreign patents, mask work, copyright or trademark registrations covering the 
		assignments to TopCoder above, then you hereby irrevocably designate and appoint TopCoder and its duly authorized officers and agents 
		as your agent and attorney in fact, to act for and in your behalf and stead to execute and file any such applications and to do all 
		other lawfully permitted acts to further the prosecution and issuance of patents, copyright, mask work and trademark registrations 
		thereon with the same legal force and effect as if executed by your authorized agent. 
    </p>
    <p align="justify">
		Nothing in this Agreement shall be construed as granting you any right or license under any intellectual property right of TopCoder 
		(including any rights TopCoder may have in any patents, copyrights, trademarks, service marks or any trade secrets), by implication, 
		estoppel or otherwise, except as expressly set forth herein.
    </p>
	
	<p align="justify">
		By submitting source code and/or documentation in response to competitions posted on TopCoder's website(s) and/or otherwise participating 
		in forum and newsgroup discussions on TopCoder's customer and developer forums, you agree to indemnify TopCoder and any parent, subsidiary 
		or affiliated entities, TopCoder's officers and employees, and officers and employees of any parent, subsidiary or affiliated entities and 
		hold them harmless from any and all claims and expenses, including attorney's fees, arising from your use of TopCoder's website(s) and/or 
		the materials gained from TopCoder's website(s) or directly from TopCoder, including any material (including third party material) that 
		you post on TopCoder's website(s) or in any news forums and any services or products available through TopCoder's website(s). In addition, 
		you hereby release TopCoder and any parent, subsidiary or affiliated entities, TopCoder's officers and employees, and officers and employees 
		of any parent, subsidiary or affiliated entities from any and all claims, demands, debts, obligations, damages (actual or consequential), 
		costs, and expenses of any kind or nature whatsoever, whether known or unknown, suspected or unsuspected, disclosed or undisclosed, that you 
		may have against them arising out of or in any way related to such disputes and/or to any services or products available at TopCoder's 
		website(s). You hereby agree to waive all laws that may limit the efficacy of such releases.
	</p>

    <div class="sectionHeader">Indemnification and Release</div>
	<p align="justify">
		By submitting source code and/or documentation in response to competitions posted on TopCoders website(s) and/or otherwise 
		participating in forum and newsgroup discussions on TopCoders customer and developer forums, you agree to indemnify TopCoder 
		and any parent, subsidiary or affiliated entities, TopCoders officers and employees, and officers and employees of any parent, 
		subsidiary or affiliated entities and hold them harmless from any and all claims and expenses, including attorneys fees, arising 
		from your use of TopCoders website(s) and/or the materials gained from TopCoders website(s) or directly from TopCoder, including any 
		material (including third party material) that you post on TopCoders website(s) or in any news forums and any services or products 
		available through TopCoders website(s). In addition, you hereby release TopCoder and any parent, subsidiary or affiliated entities, 
		TopCoders officers and employees, and officers and employees of any parent, subsidiary or affiliated entities from any and all claims, 
		demands, debts, obligations, damages (actual or consequential), costs, and expenses of any kind or nature whatsoever, whether known or 
		unknown, suspected or unsuspected, disclosed or undisclosed, that you may have against them arising out of or in any way related to such 
		disputes and/or to any services or products available at TopCoders website(s). You hereby agree to waive all laws that may limit the 
		efficacy of such releases. 
    </p>

    <div class="sectionHeader">DISCLAIMER</div>
	<p align="justify">
		THE MATERIALS AND SERVICES ON TOPCODERS WEBSITE(S) ARE PROVIDED "AS IS" AND WITHOUT WARRANTIES OF ANY KIND EITHER EXPRESS OR IMPLIED. 
		TO THE FULLEST EXTENT PERMISSIBLE PURSUANT TO APPLICABLE LAW, TOPCODER DISCLAIMS ALL WARRANTIES, EXPRESS OR IMPLIED, INCLUDING, BUT NOT 
		LIMITED TO, IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE. TOPCODER DOES NOT WARRANT THAT THE FUNCTIONS CONTAINED 
		IN THE MATERIALS WILL BE UNINTERRUPTED OR ERROR-FREE, THAT DEFECTS WILL BE CORRECTED, OR THAT TOPCODERS WEBSITE(S) OR THE SERVER(S) THAT MAKES 
		TOPCODERS WEBSITE(S) AVAILABLE OR ANY ADVERTISED OR HYPERLINKED SITE ARE FREE OF VIRUSES OR OTHER HARMFUL COMPONENTS OR THAT TOPCODERS WEBSITE(S), 
		SERVER(S), ADVERTISED OR HYPERLINKED SITES WILL BE ACCESSIBLE AT ALL TIMES. TOPCODER DOES NOT WARRANT THAT SUCH ERRORS, DEFECTS OR INTERRUPTIONS 
		IN SERVICE WILL NOT AFFECT THE RESULTS OF ITS COMPETITIONS AND SOFTWARE DEVELOPMENT PROCESS, AND TOPCODER DISCLAIMS ANY RESPONSIBILITY FOR 
		REDUCED PERFORMANCE OR INOPERABILTIY IN COMPETITIONS OR IN SOFTWARE DEVELOPMENT DUE TO SUCH PROBLEMS. TOPCODER DOES NOT WARRANT OR MAKE ANY 
		REPRESENTATIONS REGARDING THE USE OR THE RESULTS OF ITS WEBSITE(S) WITH RESPECT TO CORRECTNESS, ACCURACY, RELIABILITY OR OTHERWISE. 
		YOU ASSUME THE ENTIRE COST OF ALL NECESSARY SERVICING, REPAIR OR CORRECTION. TO THE EXTENT THAT APPLICABLE LAW MAY NOT ALLOW THE EXCLUSION 
		OF IMPLIED WARRANTIES, THE ABOVE EXCLUSIONS MAY NOT APPLY TO YOU. 
    </p>
    <p align="justify">
		Documents, graphics and other materials appearing at TopCoders website(s) may include technical inaccuracies, typographical errors, and 
		out-of-date information and use of such documents, graphics or other materials is at your own risk. 
    </p>

    <div class="sectionHeader">LIMITATION OF LIABILITY</div>

    <p align="justify">TO THE FULLEST EXTENT PERMISSIBLE PURSUANT TO APPLICABLE LAW, TOPCODER SHALL NOT BE LIABLE FOR ANY DAMAGES (INCLUDING, BUT NOT LIMITED TO, DIRECT, INDIRECT, INCIDENTAL, SPECIAL OR CONSEQUENTIAL DAMAGES), INCLUDING, BUT NOT LIMITED TO, DAMAGES FOR LOSS OF WINNINGS, DATA OR OTHER DAMAGE TO ANY OTHER INTANGIBLE PROPERTY, EVEN IF TOPCODER HAS BEEN ADVISED OF THE POSSIBILITY OF SUCH DAMAGES, RESULTING FROM (i) THE USE OR INABILITY TO USE ITS WEBSITE(S), (ii) THE POSTING OF INFORMATION TO, OR THE RECEIPT OF INFORMATION FROM, ITS WEBSITE(S), (iii) THE DISCLOSURE OF, UNAUTHORIZED ACCESS TO OR ALTERATION OF ANY TRANSMISSION OR DATA, (iv) THE STATEMENTS OR CONDUCT OF ANY THIRD PARTY OR (v) ANY OTHER MATTER RELATING TO TOPCODER. 
    </p>

    <div class="sectionHeader">Choice of Law and Forum</div>

    <p align="justify">
		These Terms are governed by the laws of the State of Connecticut. You hereby agree to submit to the exclusive jurisdiction 
		of the courts of the State of Connecticut. To the extent that applicable laws have mandatory application to these Terms or 
		give you the right to bring action in any other courts, the above limitations may not apply to you. Use of TopCoders website(s) and 
		participation in projects posted on TopCoders website(s) are unauthorized in any jurisdiction that does not give full effect to all 
		provisions of these Terms. 
    </p>

    <div class="sectionHeader">Severability and Enforceability</div>

    <p align="justify">
		If any provision or portion of these rules and regulations are held illegal, invalid, or unenforceable, in whole or in part, 
		it shall be modified to the minimum extent necessary to correct any deficiencies or replaced with a provision which is as close as 
		is legally permissible to the provision found invalid or unenforceable and shall not affect the legality, validity or enforceability 
		of any other provisions or portions of these Terms. 
    </p>

    <div class="sectionHeader">Termination/Exclusion</div>

    <p align="justify">
		TopCoder reserves the right, in its sole discretion, to revoke any and all privileges associated with accessing and/or 
		participating in the projects posted on its website(s), and to take any other action it deems appropriate including but not 
		limited to terminating or suspending your use of www.topcoder.com and/or www.topcodersoftware.com for no reason or any reason 
		whatsoever, including improper use of its website(s) or failure to comply with these Terms or the Terms of Use of TopCoders websites, 
		which are incorporated herein by reference. 
    </p>
    

    <div class="sectionHeader">Other</div>
        
    <p align="justify">
        The competition is void in whole or in part where prohibited by law. 
    </p>
        
    <p align="justify">
        A winners list of coder handles for all competitions will be available on the web site at http://www.topcoder.com
        displayed for at least 3 months after the end of the competition.
    </p>

    <%if(rsr.getIntItem("round_id") == 13953 || rsr.getIntItem("round_id") == 13934 || rsr.getIntItem("round_id") == 13754  || rsr.getIntItem("round_id") == 13772 || rsr.getIntItem("round_id") == 13569 || rsr.getIntItem("round_id") == 13570 || rsr.getIntItem("round_id") == 13679 ||  
	  rsr.getIntItem("round_id") == 13680 || rsr.getIntItem("round_id") == 13681) {%>

		<p align="justify">
			TopCoder may assign, novate or subcontract any or all of its rights and obligations under these rules and regulations at any time.
		</p>

    <%}%>
        
    <p align="justify">
        This competition is brought to you by TopCoder, Inc., 95 Glastonbury Blvd, Glastonbury, CT 06033.
    </p>

    <p align="justify">
    If you have any questions regarding these Terms, contact us at <a href="mailto:service@topcoder.com">service@topcoder.com</a>
    </p>

    <h2 align="center">
        <a href="?<%=Constants.MODULE_KEY%>=MatchDetails&amp;<%=Constants.ROUND_ID%>=${row.map['round_id']}" class="bcLink">Back to Contest Details</a>
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
