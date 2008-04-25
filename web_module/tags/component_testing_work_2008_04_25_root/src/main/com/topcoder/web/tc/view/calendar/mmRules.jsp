<%@ page contentType="text/html;charset=utf-8" %>
<%@ page language="java" %>
<%@ page import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer" %>
<%@ page import="com.topcoder.web.tc.Constants" %>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
    ResultSetContainer.ResultSetRow rsr = (ResultSetContainer.ResultSetRow) (((ResultSetContainer) request.getAttribute("rsc")).get(0));
    int round_id = rsr.getIntItem("round_id");

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

        <h3>Official Rules & Regulations</h3>

        <p align="justify">
        No purchase necessary to enter or win.
        </p>

        <div class="sectionHeader">About the Competition</div>

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
            which is the
            earliest time that any member will be given
            access to the problem statement.
        </p>
        <p align="justify">
            <strong>Upon Entering a Marathon Match</strong><br />
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
            4 hours.  Additionally, if a competitor has a pending submission on the 
            testing queue it must finish testing before they may submit again.
        </p>
        <p align="justify">
            Clicking the Test Examples button will immediately compile and place your 
            submission on a queue for automated testing of just the example test cases. 
            Detailed feedback will be made available when the tests are complete, 
            including processing time, score, and any output from the program. 
            Competitors may submit test examples once every 30 minutes. The competitor's 
            rank and overall score will not be updated.
        </p>

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
	<%}%>
	<p align="justify">
	   
	</p>

        <div class="sectionHeader">Conditions of Participation</div>

        <p align="justify">
        By participating in the competition round, you agree to be bound by these rules and to all decisions
        of TopCoder,
        which are final, binding and conclusive in all matters.
        </p>

        <%if(rsr.getIntItem("round_id") == 10834) {%>
        <p align="justify">
            By participating in this Competition, you agree to license any code you 
            submit in this Competition under the GNU General Public License as 
            published by the Free Software Foundation, Version 2.0 to all other
            competitors participating in this Competition (the terms and conditions
            of the license may be found at 
            <a href="http://www.opensource.org/licenses/gpl-license.php">http://www.opensource.org/licenses/gpl-license.php</a>.
        </p>
        <%}%>
	
	<%if(rsr.getIntItem("round_id") == 10930) {%>
	<p align="justify">
	Competitors must not cheat; all ideas for any code submitted must be the contestant's alone.  Competitors must use their own independently developed code, and shall not copy or include code from any other party, including publicly available "open source" code that is or may be subject to licensing restrictions.
	</p>
	<%} else { %>
        <p align="justify">
        Contestants must not cheat; all ideas for any code submitted must be the contestant's alone.
        </p>
	<% } %>

        <p align="justify">
        The winner in each Marathon Match will be the competitor that scores the most points across all
        competitors who participate in that match. All decisions relating to the viability of submissions,
        the ranking of submissions and all other matters pertaining to the competition shall be within the
        sole discretion of TopCoder or its designee and shall be final and binding in all respects.
        </p>

        <p align="justify">
        By participating in a Marathon Match, a winner releases and agrees to hold harmless TopCoder, its
        affiliates, subsidiaries, sponsors, advertising and promotion agencies, and prize suppliers, and all
        of their respective directors, officers, employees, representatives and agents, from and against any
        and all liability for any loss, property damage or damage to person, including without limitation,
        death and injury, due in whole or in part, directly or indirectly, from or arising out of
        participation in this Marathon Match, or participation in any competition-related activity, or the
        receipt, use or misuse of a prize.
        </p>

        <p align="justify">
        TopCoder, in its sole discretion, reserves the right to disqualify any person tampering with the
        entry process, the operation of the Web site, the competition process, or is otherwise in violation
        of the rules. TopCoder reserves the right to cancel, terminate or modify the competition if it is
        not capable of completion as planned for any reason, including infection by computer virus, bugs,
        tampering, unauthorized intervention or technical failures of any sort.
        </p>
        
        <p align="justify">
        TopCoder does not require assignment of winning submissions in this competition.
        </p>

        <div class="sectionHeader">Eligibility</div>

	<%if(rsr.getIntItem("round_id") == 10930) {%>
	<p align="justify">
	The competition is open to all members who are at least 18 years of age.  Competitors must be either (i) a U.S. citizen, (ii) a lawful permanent resident of the U.S., (iii) a temporary resident, asylee, refugee of the U.S., or have a lawfully issued work authorization card permitting unrestricted employment in the U.S., or (iv) a non-U.S. resident authorized to perform services as an independent contractor.
	</p>
	<%} else { %>
        <p align="justify">
        The competition is open to all members who are at least 13 years of age.
        </p>
	<%}%>
        <p align="justify">
        All competitors must be registered members of TopCoder, and must have agreed to the rules on this
        page prior to
        participating in this competition between the
        <rsc:item name="coding_start_time" row="<%=rsr%>" format="MM.dd.yyyy hh:mm a z"/>
        to
        <rsc:item name="coding_end_time" row="<%=rsr%>" format="MM.dd.yyyy hh:mm a z"/>
        competition submission deadline.
        </p>

	<%if(rsr.getIntItem("round_id") == 10930) {%>
	<p align="justify">
	Competitors must abide by the Terms of Use of TopCoder's website at www.topcoder.com.
	</p>
	<%}%>

        <p align="justify">
        Employees of TopCoder and those involved in the development, production (including prize suppliers
        and sponsors), implementation and distribution of this tournament and their advertising or promotion
        agencies, parent companies, service providers, agents, officers, subsidiaries or affiliates, or any
        other persons or entities directly associated with the competition and members of the immediate
        families and/or persons living in the same household as such persons, are ineligible to enter the
        competition.
        </p>

	<%if(rsr.getIntItem("round_id") == 10930) {%>
	<div class="sectionHeader">Ownership and Rights</div>
	<p align="justify">
	You hereby acknowledge and agree that TopCoder owns, solely and exclusively, all right, title and interest, including all intellectual property rights, in and to the information posted on TopCoder's website(s).  If TopCoder compensates you for your submission, then you agree to irrevocably and unconditionally transfer and assign to TopCoder all right, title and interest you have, may have or acquire in, such submission, and you agree to execute and deliver such documents, certificates, assignments and other writings, and take such other actions as may be necessary or desirable to vest in TopCoder the ownership rights granted to TopCoder hereunder.  If TopCoder does not compensate you for your submission, then you retain any and all rights to ownership of such material submitted to TopCoder.  TopCoder will not gain ownership of this material.  However, by submitting any submission or any other material to TopCoder, you hereby grant a perpetual, royalty-free, irrevocable, non-exclusive right and license to TopCoder to use, reproduce and publish such documents, materials or source code for commercial and/or non-commercial use. 
	</p>
	<p align="justify">You further agree that any and all works of authorship created, authored or developed by you hereunder which TopCoder compensates you for shall be deemed to be "works made for hire" within the meaning of the United States Copyright Law and, as such, all rights therein including copyright shall belong solely and exclusively to TopCoder from the time of their creation.  To the extent any such work of authorship may not be deemed to be a work made for hire, you agree to, and do hereby, irrevocably and unconditionally transfer and assign to TopCoder all right, title and interest including copyright in and to such work. 
	</p>
	<p align="justify">You agree that if TopCoder is unable because of your unavailability, or for any other reason, to secure your signature to apply for or to pursue any application for any United States or foreign patents, mask work, copyright or trademark registrations covering the assignments to TopCoder above, then you hereby irrevocably designate and appoint TopCoder and its duly authorized officers and agents as your agent and attorney in fact, to act for and in your behalf and stead to execute and file any such applications and to do all other lawfully permitted acts to further the prosecution and issuance of patents, copyright, mask work and trademark registrations thereon with the same legal force and effect as if executed by your authorized agent.
	</p>
	<p align="justify">Nothing in these rules and regulations shall be construed as granting you any right or license under any intellectual property right of TopCoder (including any rights TopCoder may have in any patents, copyrights, trademarks, service marks or any trade secrets), by implication, estoppel or otherwise, except as expressly set forth herein.
	</p>

	<div class="sectionHeader">Confidential Information</div>

	<p align="justify">You acknowledge the confidential and proprietary nature of the information you obtain from TopCoder regarding design specifications and functionality and/or development solutions, including, but not limited to, scope documents and source code.  You also acknowledge the confidential and proprietary nature of the information contained in the project postings and in the customer and developer forums on TopCoder's website(s).  You also agree (i) to hold such information in confidence and to take all reasonable precautions to protect such confidential information (including, without limitation, all precautions you may employ with respect to your own confidential materials), (ii) not to divulge any such confidential information to any third person; and (iii) not to make any use whatsoever of such confidential information except as expressly authorized in these Terms. 
	</p>

	<div class="sectionHeader">Indemnification and Release</div>

	<p align="justify">By submitting design documents and/or source code in response to projects posted on TopCoder's website(s) and/or otherwise participating in forum and newsgroup discussions on TopCoder's customer and developer forums, you agree to indemnify TopCoder and any parent, subsidiary or affiliated entities, TopCoder's officers and employees, and officers and employees of any parent, subsidiary or affiliated entities and hold them harmless from any and all claims and expenses, including attorney's fees, arising from your use of TopCoder's website(s) and/or the materials gained from TopCoder's website(s) or directly from TopCoder, including any material (including third party material) that you post on TopCoder's website(s) or in any news forums and any services or products available through TopCoder's website(s). In addition, you hereby release TopCoder and any parent, subsidiary or affiliated entities, TopCoder's officers and employees, and officers and employees of any parent, subsidiary or affiliated entities from any and all claims, demands, debts, obligations, damages (actual or consequential), costs, and expenses of any kind or nature whatsoever, whether known or unknown, suspected or unsuspected, disclosed or undisclosed, that you may have against them arising out of or in any way related to such disputes and/or to any services or products available at TopCoder's website(s). You hereby agree to waive all laws that may limit the efficacy of such releases. 
	</p>

	<div class="sectionHeader">DISCLAIMER</div>

	<p align="justify">THE MATERIALS AND SERVICES ON TOPCODER'S WEBSITE(S) ARE PROVIDED "AS IS" AND WITHOUT WARRANTIES OF ANY KIND EITHER EXPRESS OR IMPLIED. TO THE FULLEST EXTENT PERMISSIBLE PURSUANT TO APPLICABLE LAW, TOPCODER DISCLAIMS ALL WARRANTIES, EXPRESS OR IMPLIED, INCLUDING, BUT NOT LIMITED TO, IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE. TOPCODER DOES NOT WARRANT THAT THE FUNCTIONS CONTAINED IN THE MATERIALS WILL BE UNINTERRUPTED OR ERROR-FREE, THAT DEFECTS WILL BE CORRECTED, OR THAT TOPCODER'S WEBSITE(S) OR THE SERVER(S) THAT MAKES TOPCODER'S WEBSITE(S) AVAILABLE OR ANY ADVERTISED OR HYPERLINKED SITE ARE FREE OF VIRUSES OR OTHER HARMFUL COMPONENTS OR THAT TOPCODER'S WEBSITE(S), SERVER(S), ADVERTISED OR HYPERLINKED SITES WILL BE ACCESSIBLE AT ALL TIMES. TOPCODER DOES NOT WARRANT THAT SUCH ERRORS, DEFECTS OR INTERRUPTIONS IN SERVICE WILL NOT AFFECT THE RESULTS OF ITS COMPETITIONS AND SOFTWARE DEVELOPMENT PROCESS, AND TOPCODER DISCLAIMS ANY RESPONSIBILITY FOR REDUCED PERFORMANCE OR INOPERABILTIY IN COMPETITIONS OR IN SOFTWARE DEVELOPMENT DUE TO SUCH PROBLEMS. TOPCODER DOES NOT WARRANT OR MAKE ANY REPRESENTATIONS REGARDING THE USE OR THE RESULTS OF ITS WEBSITE(S) WITH RESPECT TO CORRECTNESS, ACCURACY, RELIABILITY OR OTHERWISE. YOU ASSUME THE ENTIRE COST OF ALL NECESSARY SERVICING, REPAIR OR CORRECTION. TO THE EXTENT THAT APPLICABLE LAW MAY NOT ALLOW THE EXCLUSION OF IMPLIED WARRANTIES, THE ABOVE EXCLUSIONS MAY NOT APPLY TO YOU. 
	</p>
	<p align="justify">Documents, graphics and other materials appearing at TopCoder's website(s) may include technical inaccuracies, typographical errors, and out-of-date information and use of such documents, graphics or other materials is at your own risk. 
	</p>

	<div class="sectionHeader">LIMITATION OF LIABILITY</div>

	<p align="justify">TO THE FULLEST EXTENT PERMISSIBLE PURSUANT TO APPLICABLE LAW, TOPCODER SHALL NOT BE LIABLE FOR ANY DAMAGES (INCLUDING, BUT NOT LIMITED TO, DIRECT, INDIRECT, INCIDENTAL, SPECIAL OR CONSEQUENTIAL DAMAGES), INCLUDING, BUT NOT LIMITED TO, DAMAGES FOR LOSS OF WINNINGS, DATA OR OTHER DAMAGE TO ANY OTHER INTANGIBLE PROPERTY, EVEN IF TOPCODER HAS BEEN ADVISED OF THE POSSIBILITY OF SUCH DAMAGES, RESULTING FROM (i) THE USE OR INABILITY TO USE ITS WEBSITE(S), (ii) THE POSTING OF INFORMATION TO, OR THE RECEIPT OF INFORMATION FROM, ITS WEBSITE(S), (iii) THE DISCLOSURE OF, UNAUTHORIZED ACCESS TO OR ALTERATION OF ANY TRANSMISSION OR DATA, (iv) THE STATEMENTS OR CONDUCT OF ANY THIRD PARTY OR (v) ANY OTHER MATTER RELATING TO TOPCODER.
	</p>

	<div class="sectionHeader">Choice of Law and Forum</div>

	<p align="justify">These Terms are governed by the laws of the Commonwealth of Massachusetts. You hereby agree to submit to the exclusive jurisdiction of the courts of the Commonwealth of Massachusetts. To the extent that applicable laws have mandatory application to these Terms or give you the right to bring action in any other courts, the above limitations may not apply to you. Use of TopCoder's website(s) and participation in projects posted on TopCoder's website(s) are unauthorized in any jurisdiction that does not give full effect to all provisions of these Terms. 
	</p>

	<div class="sectionHeader">Severability and Enforceability</div>

	<p align="justify">If any provision or portion of these rules and regulations are held illegal, invalid, or unenforceable, in whole or in part, it shall be modified to the minimum extent necessary to correct any deficiencies or replaced with a provision which is as close as is legally permissible to the provision found invalid or unenforceable and shall not affect the legality, validity or enforceability of any other provisions or portions of these Terms. 
	</p>

	<div class="sectionHeader">Termination/Exclusion</div>

	<p align="justify">TopCoder reserves the right, in its sole discretion, to revoke any and all privileges associated with accessing and/or participating in the projects posted on its website(s), and to take any other action it deems appropriate including but not limited to terminating or suspending your use of www.topcoder.com and/or www.topcodersoftware.com for no reason or any reason whatsoever, including improper use of its website(s) or failure to comply with these Terms or the Terms of Use of TopCoder's websites, which are incorporated herein by reference. 
	</p>
	<%}%>

        <div class="sectionHeader">Other</div>
        
        <p align="justify">
        The competition is void in whole or in part where prohibited by law.
        </p>
        
        <p align="justify">
        A winners list of coder handles for all competitions will be available on the web site at http://www.topcoder.com
        displayed for at least 3 months after the end of the competition.
        </p>

	<%if(rsr.getIntItem("round_id") == 10930) {%>
	<p align="justify">TopCoder may assign, novate or subcontract any or all of its rights and obligations under these rules and regulations at any time.
	</p>
	<%}%>
        
        <p align="justify">
        This tournament is brought to you by TopCoder, Inc., 95 Glastonbury Blvd, Glastonbury, CT 06033.
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