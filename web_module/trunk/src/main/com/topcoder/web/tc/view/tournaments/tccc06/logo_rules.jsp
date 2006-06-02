<%@ page import="java.io.InputStream"%>
<%@ page import="com.topcoder.web.tc.Constants"%>
<%@ page import="java.net.URL"%>
<%@ page language="java"  %>
<jsp:useBean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request" />
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<title>2006 TopCoder Collegiate Challenge - Logo Design Contest</title>
<jsp:include page="/script.jsp"/>
<jsp:include page="/style.jsp">
<jsp:param name="key" value="tc_main"/>
</jsp:include>

<style type="text/css">
.pageSpacer
{
   width: 510px;
   padding: 15px 0px 10px 0px;
   text-align: left;
}
.logoBox {
   text-align: center;
}

</style>

</head>

<body>

<jsp:include page="../../top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">
<!-- Left Column Begins-->
        <td width="180"><jsp:include page="/includes/global_left.jsp">
<jsp:param name="node" value="topcoder_tournaments"/>
</jsp:include>
</td>
<!-- Left Column Ends -->

<!-- Gutter Begins -->
        <td width="15"><img src="/i/clear.gif" width="15" height="1" border="0"/></td>
<!-- Gutter Ends -->

<!-- Center Column Begins -->
         <td class="bodyText" width="100%" align="center">

         <div class="pageSpacer">

            <div class="logoBox"><img src="/i/tournament/tccc06/logo_logo.gif" alt="TCCC06 Logo Contest" border="0"/></div><br>
            <div align="center">
            <jsp:include page="logo_links.jsp" >
            <jsp:param name="selectedTab" value="rules"/>
            </jsp:include>
            </div>

            <br><br>
<span class="bodySubtitle">Official Contest Rules - 2006 TopCoder Collegiate Challenge <br>Logo Design Contest</span>
<br><br>
<b>NO PURCHASE NECESSARY TO ENTER OR WIN. VOID WHERE PROHIBITED.</b>
<br><br>
<b>OVERVIEW</b><br>
TopCoder, Inc. will be conducting a contest for its members prior to the 2006 TopCoder Collegiate Challenge (TCCC06). As a result of this contest, one logo will be selected as the base for the TCCC06 tournament logo. 
<br><br>
<b>ELIGIBILITY</b><br>
To be eligible for the contest, you must be:
<br>
<ul>
<li>18 years of age or older; and</li>
<li>A registered member of TopCoder in good standing.</li>
</ul>
Employees of TopCoder, Inc., their affiliated companies, advertising and promotion agencies and immediate family members of each are not eligible. Employees of any TCCC06 sponsoring company are allowed to compete in the 2006 TopCoder Collegiate Challenge Logo Design Contest. All federal, state and local laws and regulations apply. Void where prohibited. 
<br><br>
<b>TO ENTER</b><br>
If not already a member, <A href="/reg/">register</A> electronically for TopCoder. Once registered at TopCoder, click <a href="/tc?module=tccc06LogoTerms">here</A> to submit your designs.  The logos must be in EPS (Encapsulated PostScript) format and must be submitted by 5:00 PM EDT (GMT -4) on Friday, June 23, 2006.  Submissions received after 5:00 PM EDT on Friday, June 23, 2006 or by any other method will not be considered. 
<br><br>
<span class="BigRed">TopCoder will only accept the first three (3) designs submitted by each registrant.</span>
<br><br>
The logo must adhere to the following strict guidelines*. Any deviation from these guidelines will result in disqualification of a design. That design WILL count as one of your three submissions. 
<br><br>
* If you have not yet submitted 3 designs and one of your submissions is disqualified, you may use one of your remaining submissions to send a valid version of that disqualified submission. If you have already submitted 3 designs, you will not be allowed to submit a replacement for any submission that was disqualified. 
<br><br>
<b>Content:</b>
<br>
<ul>
<li>The logo <span class="bigRed">MUST</span> include the title of the tournament: "2006 TopCoder&#174; Collegiate Challenge"</li>
<li>"TopCoder" <span class="bigRed">MUST</span> be written as one word with (roughly) equal distance between each letter</li>
<li>"TopCoder" <span class="bigRed">MUST</span> be written as either "TopCoder" or "TOPCODER"</li>
<li>"Collegiate Challenge" <span class="bigRed">MUST</span> be written as either "Collegiate Challenge" or "COLLEGIATE CHALLENGE"</li>
</ul>
<br>
<b>File format:</b> Your submission <span class="bigRed">MUST</span> be a .GIF, .JPG, .PNG, or .BMP 
<br><br>
<b>Image size:</b> Your submissions should be 300 pixels wide. If one of your submissions is not 300 pixels wide, we will shrink/expand it to the correct size. 
<br><br>
<b>Colors:</b>
<br>
<div align="center"><img src="/i/tournament/tccc06/logo_colors.gif" alt="" border="0"/></div>
<ul>
<li>The main colors for the TCCC06 will be RGB: A0DA1E and 117575 and your submission <span class="bigRed">MUST</span> use these colors. White, black and grays can be used as compliments. Other colors can be used, but may detract from the "focus" of the two required colors.</li>
<li>While gradients (gradual color changes) may look appealing in your logo, they can often be a problem in print (t-shirts, tournament programs, etc.) and might keep your submission from being considered as a finalist.</li>
</ul>
<br>
<b>Font:</b> All fonts are acceptable, with the exception of Bank Gothic or anything in the Bank Gothic family. 
<br><br>
<b>Theme:</b> There is no formally stated theme for the TCCC06 Logo Design Contest. 
<br><br>
<b>SELECTION OF WINNER</b><br>
Up to ten (10) designs will be chosen by TopCoder and presented to the TopCoder community for a vote. The voting will begin at 10:00 AM EDT (GMT -4) on Wednesday, June 28, 2006 and will end at 5:00 PM EDT (GMT -4) on Wednesday, July 5, 2006. TopCoder will use the Schulze Method to determine the winner based on the voting by the TopCoder community. 
<br><br>
The TopCoder community will be asked to rank the ten (10) logos from 1 to 10 (1 being the most favorite and 10 being the least favorite).  
<br><br>
For an explanation of the Schulze method, see <A href="http://en.wikipedia.org/wiki/Schulze_method">http://en.wikipedia.org/wiki/Schulze_method</A>. In the event of a tie when voting is complete, TopCoder will choose between the tied submissions and the prize money will be distributed equally among the tied competitors. 
<br><br>
<b>PRIZES</b><br>
The contest will award cash prizes totaling $5,000 to up to 5 competitors. Any and all applicable taxes on prizes are the sole responsibility of the prizewinner. Prizes will be distributed as follows:
<br><br>

<table width="250" border="0" align="center" cellpadding="6" cellspacing="2" class="sidebarBox">
<tr>
<td class="sidebarTitle" width="175">Competitor(s)</td>
<td class="sidebarTitle" width="75">Prizes</td>
</tr>
<tr>
<td class="sidebarText"><b>1st place finisher -<br>Logo Design Champion</b></td>
<td class="sidebarText"><b>$3,000</b></td>
</tr>
<tr>
<td class="sidebarText"><b>2nd place finisher</b></td>
<td class="sidebarText"><b>$1,250</b></td>
</tr>
<tr>
<td class="sidebarText"><b>3rd place finisher</b></td>
<td class="sidebarText"><b>$250</b></td>
</tr>
<tr>
<td class="sidebarText"><b>4th place finisher</b></td>
<td class="sidebarText"><b>$250</b></td>
</tr>
<tr>
<td class="sidebarText"><b>5th place finisher</b></td>
<td class="sidebarText"><b>$250</b></td>
</tr>
</table>
<br>
The winning design as voted on by the TopCoder community will be used as a base for the 2006 TopCoder Collegiate Challenge tournament logo.
<br><br>
<b>GENERAL CONDITIONS</b><br>
By participating in the contest, participants agree to be bound by these rules and to any and all subsequent changes and decisions of TopCoder, which are final, binding and conclusive in all matters. 
<br><br>
<span class="bigRed">Contestants must not cheat. Contestants must abide by the TopCoder Terms of Use. All logo design submissions must be fully designed by the person submitting them solely for the purposes of this competition.</span>
<br><br>
By participating in the contest and redeeming a prize, participants acknowledge and agree that if TopCoder selects their design as one to be voted on by the TopCoder community, the submitters of the top five (5) designs that receive the most votes will receive a monetary award. As consideration for the monetary award, participants agree to irrevocably and unconditionally transfer and assign to TopCoder all rights to all designs and information submitted during the contest, and agree to execute and deliver such documents, certificates, assignments and other writings, and take such other actions as may be necessary or desirable to vest in TopCoder the ownership rights granted to TopCoder hereunder. For any submissions that TopCoder gains ownership of, TopCoder retains the right to change the designs to better fit with the overall tournament plan. All participants who submit designs as part of this contest agree to grant TopCoder a perpetual, non-expiring, royalty-free license to display the submissions on the TopCoder website. TopCoder will not gain ownership of this material. 
<br><br>
By participating in the contest and redeeming a prize, participants release and agree to hold harmless TopCoder, its affiliates, subsidiaries, advertising and promotion agencies, sponsors, and prize suppliers, and all of their respective directors, officers, employees, representatives and agents, from and against any and all liability for any loss, property damage or damage to person, including without limitation, death and injury, due in whole or in part, directly or indirectly, from or arising out of participation in the contest, or participation in any contest-related activity, or the receipt, use or misuse of the prize. TopCoder specifically disclaims all liability associated with, and makes no warranties with regard to, any prize given. 
<br><br>
TopCoder reserves the right, in its sole discretion, to revoke any and all privileges associated with competing in the contest, and to take any other action it deems appropriate, for no reason or any reason whatsoever, including if TopCoder suspects competitors of cheating, tampering with the entry process, the operation of the Web site, or the contest process, or otherwise being in violation of the rules. TopCoder reserves the right to cancel, terminate or modify the contest if it is not capable of completion as planned for any reason, including infection by computer virus, bugs, tampering, unauthorized intervention or technical failures of any sort. 
<br><br>
<b>OTHER</b><br>
The contest is void in whole or in part where prohibited by law. This contest is brought to you by TopCoder, Inc. (<A href="http://www.topcoder.com/">http://www.topcoder.com/</A>) 703 Hebron Avenue, Glastonbury, CT 06033.
<br><br>



    <%--
        URL termsURL = new URL(sessionInfo.getAbsoluteServletPath()+"?module=Terms&"+ Constants.TERMS_OF_USE_ID+"="+Constants.TCO06_LOGO_TERMS_ID);
        InputStream is = termsURL.openStream();
        int count = is.available();
        while (count > 0) {
            for (int i=0; i<count; i++) {
                out.write(is.read());
            }
            count = is.available();
        }
        is.close();
    --%>

         </div>

         <p><br/></p>
         </td>
<!-- Center Column Ends -->

<!-- Gutter -->
         <td width="15"><img src="/i/clear.gif" width="15" height="1" border="0"></td>
<!-- Gutter Ends -->

<!-- Right Column Begins -->
         <td width="170">
            <jsp:include page="../../public_right.jsp">
               <jsp:param name="level1" value="privatelabel"/>
            </jsp:include>
         </td>
<!-- Right Column Ends -->

<!-- Gutter -->
         <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<!-- Gutter Ends -->
    </tr>
</table>

<jsp:include page="../../foot.jsp" />

</body>

</html>