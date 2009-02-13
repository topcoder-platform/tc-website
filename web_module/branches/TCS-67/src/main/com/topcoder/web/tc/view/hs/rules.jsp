<%@ page contentType="text/html;charset=utf-8" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer" %>
<%@ page language="java" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>TopCoder High School Competitions</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>

    <jsp:include page="/script.jsp"/>
    <jsp:include page="/style.jsp">
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
                <jsp:param name="node" value="hs_overview"/>
            </jsp:include>
        </td>
<%-- Left Column Ends --%>

<%-- Center Column Begins --%>
        <td width="100%" align="center" class="bodyColumn">
            <div class="fixedWidthBody">
                <div align="center">
                    <img src="/i/hs/banner.jpg" alt="TopCoder High School" border="0">
                </div>

                    <span class="title">2009 TopCoder High School Season</span>
                    <br><br>
          <span class="bigRed">No purchase necessary to enter or win.  Void where prohibited.</span>
          <h3>Overview of the Tournament</h3>
          The 2009 TopCoder High School Season (TCHS09) will take place between June 9, 2008 and January 24, 2009. The prize purse for this competition will be scholarships and other prizes. The finals will be held on January 24, 2009.
          <br><br>
          <h3>Eligibility</h3>
          TopCoder members meeting the following criteria are eligible to compete in TCHS09:
          <ul>
            <li>Must be at least 13 years of age; AND</li>
            <li>Must be no older than 20 years of age on January 24, 2009; AND</li>
            <li>Must be pursuing a secondary (non university) education at some point during the season*</li>
          </ul>
<p>
*The season will run between June 9, 2008 and January 24 2009. </p>

TopCoder members who are between 13 and 20 years of age (inclusive) on January 12, 2009 are eligible to win scholarships and prizes, unless otherwise prohibited. TCHS09 is void in the Quebec province of Canada, and elsewhere where prohibited by applicable law. Residents of Cuba, Iran, North Korea, Sudan, or Syria are ineligible to receive cash and other prizes.<br />
<br />
Employees of TopCoder, Inc. and of all official tournament sponsors, regardless of commitment date as sponsor, including any companies involved in the production (including prize suppliers), implementation and distribution of this tournament and their advertising or promotion agencies, parent companies, service providers, agents, officers, subsidiaries or affiliates, or any other persons or entities directly associated with the tournament and members of the immediate families (parent, child, sibling, and spouse of each) and/or persons living in the same household as such persons, are ineligible to enter the tournament. TopCoder members who are performing internships for any official tournament sponsor between January 12, 2009 and January 24, 2009 are also ineligible to compete. <br /><br />

<h3>Registration</h3>
Stay tuned for more information regarding registration for TCHS09. 
<br /><br />

<h3>Competition Round Structure</h3>
Each round of competition consists of three phases: Coding Phase, Challenge Phase, and System Testing Phase. (Note: The format of these competition rounds is similar to the format of TopCoder High School Single Round Matches. The rules in place for TCHS Single Round Matches as of January 12, 2008 will also apply to all rounds of TCHS09.) 
<br /><br />
The Coding Phase is a timed event where all contestants are presented with the same three questions representing three levels of complexity and, accordingly, three levels of point earnings potential. Points for a problem are awarded upon submission of any solution that successfully compiles and are calculated on the total time elapsed from the time the problem was opened until the time it was submitted. 
<br /><br />
The Challenge Phase is a timed event wherein each competitor has a chance to challenge the functionality of other competitors' code. A successful challenge will result in a loss of the original problem submission points by the defendant, and a 50-point reward for the challenger. Unsuccessful challengers will incur a point reduction of 25 points as a penalty, applied against their total score in that round of competition. 
<br /><br />
The System Testing Phase is applied to all submitted code that has not already been successfully challenged. If the TopCoder System Test finds code that is flawed, the author of that code submission will lose all of the points that were originally earned for that code submission. The automated tester will apply a set of inputs, expecting the output from the code submission to be correct. If the output from a coder's submission does not match the expected output, the submission is considered flawed. The same set of input/output test cases will be applied to all code submissions for a given problem. All successful challenges from the Challenge Phase will be added to the sets of inputs for the System Testing Phase. 
<br /><br />



<h3>Conditions of Participation</h3>
By participating in the tournament, you agree to be bound by these rules and to all decisions of TopCoder, which are final, binding and conclusive in all matters. 
<br /><br />
<span class="bigRed">Competitors must not cheat. All ideas for code and/or challenges submitted must be the competitor's alone. TopCoder uses the word "cheat" to mean collaboration of any sort - including, but not limited to, working with another competitor, submitting code that was not fully authored by you, and using resources, software, etc. that are not allowed in TopCoder competitions, the Algorithm Competition, and/or the Tournament. TopCoder reserves the right, in its sole discretion, to remove any competitor from the Algorithm Competition whom it suspects of cheating.</span> 
<br /><br />
All decisions relating to the viability of submissions, the ranking of submissions and all other matters pertaining to the tournament shall be within the sole discretion of TopCoder or its designee and shall be final and binding in all respects. 


<br /><br />
All participatory prizes will be sent via the United States Postal Service. Unclaimed or undeliverable participatory prizes will be forfeited. Competitors who do not submit the required information listed above by the applicable deadlines will forfeit their participatory prize. 
<br /><br />
As a condition of participation in the tournament, all information provided by you in your TopCoder High School member profile must be comprehensive, accurate and up-to-date. TopCoder may require you to complete an additional registration form to register for the tournament. In order to be eligible to participate in the tournament, you must have completed any and all registration forms required by TopCoder. 
<br /><br />
As a condition of winning and redeeming a prize, certain contestants will be required to submit a completed, (i) Affidavit of Eligibility and Liability and Publicity Release, (ii) IRS Form W-9 or W-8BEN, as appropriate if one is not already on file with TopCoder.  In completing the Affidavit of Eligibility and Liability and Publicity Release, a prize winner (a) confirms his/her eligibility, (b) represents and warrants that he/she has not cheated; that the idea for the code and/or challenge submitted is his/hers alone, (c) verifies the accuracy of the demographic information submitted to, and contained in, the TopCoder High School member profile, (d) authorizes TopCoder to publicize the tournament's results, (e) agrees to sign any applicable forms required by tax authorities, (f) licenses to TopCoder rights to all information submitted during the tournament (including rights to source code and other executables), and (g) releases TopCoder from liability arising out of any prize won. TopCoder requires contestants to complete the Form W-9 or W-8BEN for tax reporting purposes. If prize notification is returned as undeliverable, or if the prize winner fails to return the, Affidavit, W-9 or W-8BEN , as specified, the prize winner will be disqualified and the prize won by the disqualified prize winner will be forfeited. Providing false information in the registration process or in the required forms described in this paragraph will disqualify a prize winner. 
<br /><br />
By participating in a tournament and redeeming a prize, a winner releases and agrees to hold harmless TopCoder, its affiliates, subsidiaries, advertising and promotion agencies, sponsors, and prize suppliers, and all of their respective directors, officers, employees, representatives and agents, from and against any and all liability for any loss, property damage or damage to person, including without limitation, death and injury, due in whole or in part, directly or indirectly, from or arising out of participation in this tournament, or participation in any tournament-related activity, or the receipt, use or misuse of a prize. TopCoder specifically disclaims all liability associated with, and makes no warranties with regard to, any prize given. 
<br /><br />
In addition, all prizewinners agree to cooperate with TopCoder's publicity efforts, without further compensation. This includes the agreement to use their name, handle, address (city and state) and likeness for publicity purposes, where legal, for this or similar future tournaments, and to use the statements made by, or attributed to, the winners relating to TopCoder and any and all rights to said use, without further compensation. Furthermore, all prizewinners agree to promptly notify TopCoder if a third-party, including tournament sponsors, contacts the prizewinner regarding employment opportunities and/or media interest/interview as a result of the prizewinner's participation in the tournament. 
<br /><br />
TopCoder reserves the right, in its sole discretion, to revoke any and all privileges associated with competing in this tournament, and to take any other action it deems appropriate, for no reason or any reason whatsoever, including if TopCoder suspects competitors of cheating, tampering with the entry process, the operation of the Web site, or the tournament process, or otherwise being in violation of the rules. TopCoder reserves the right to cancel, terminate or modify the tournament if it is not capable of completion as planned for any reason, including infection by computer virus, bugs, tampering, unauthorized intervention or technical failures of any sort. 
<br /><br />

<h3>Other</h3>
The tournament is void in whole or in part where prohibited by law.
<br /><br />
A list of tournament winners by coder handles will be available on the web site at <a href="/tc">http://www.topcoder.com/tc</a>, and will be displayed for at least 3 months after the end of the tournament. 
<br /><br />
This tournament is brought to you by TopCoder, Inc. (<a href="/">http://www.topcoder.com/</a>) 95 Glastonbury Blvd, Glastonbury, CT 06033.
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