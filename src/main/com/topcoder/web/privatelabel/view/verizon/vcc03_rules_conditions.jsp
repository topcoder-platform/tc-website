<%@ page contentType="text/html; charset=ISO-8859-1" %>
<%@ page import="com.topcoder.web.privatelabel.Constants,
                 com.topcoder.shared.dataAccess.resultSet.ResultSetContainer" %>
<%@ taglib uri="/tc-webtags.tld" prefix="tc-webtag" %>
<jsp:usebean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request" />
<jsp:usebean id="regInfo" class="com.topcoder.web.privatelabel.model.SimpleRegInfo" scope="session" />
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder | Private Label Registration</title>

<jsp:include page="../script.jsp" />

</head>

<body>
<table  width="100%" border="0" cellspacing="0" cellpadding="0" class="bodyText">

   <tr>

<!-- Verizon logo-->
      <td width="147" bgcolor="#000000" rowspan="2" colspan="3" valign="top"><img src="/i/events/verizon2003/logo_black_147.gif" width="147" height="141" border="0"/></td>

<!-- Top Nav-->
      <td width="100%" bgcolor="#000000" colspan="2"><img src="/i/clear.gif" width="100%" height="40" border="0"/></td>
   </tr>

   <tr>
<!-- Top Ad -->
      <td width="100%" bgcolor="#CC0001" colspan="2" align="left">
         <table width="100%" border="0" cellspacing="0" cellpadding="0" class="bodyText">
            <tr>
               <td width="100%"><img src="/i/events/verizon2003/vcc03_logo.gif" width="550" height="101" border="0"/></td>
               <td align="right" valign="middle"><img src="/i/events/verizon2003/pbtc.gif" width="146" height="34" border="0"/></td>
            </tr>
          </table>
      </td>
   </tr>
   
   <tr>
<!-- Top Bar -->
      <td width="147" bgcolor="#000000" colspan="3"><img src="/i/clear.gif" width="147" height="20" border="0"/></td>
      <td width="100%" bgcolor="#000000" colspan="2"><img src="/i/clear.gif" width="100%" height="20" border="0"/></td>
   </tr>
   
   <tr>
<!-- Left Column-->
      <td width="10" bgcolor="#666666"><img src="/i/clear.gif" width="10" height="1"/></td>
      <td valign="top" bgcolor="#666666">
         <table  border="0" cellspacing="0" cellpadding="0" class="bodyText">
            <tr><td bgcolor="#666666" valign="top"><img src="/i/clear.gif" width="127" height="10" border="0"/></td></tr>
            <tr><td>      
                     <jsp:include page="verizonLinks.jsp" >
                        <jsp:param name="selectedTab" value="rules"/>
                        <jsp:param name="selectedSubtab" value="conditions"/>
                     </jsp:include>
            </tr>
            <tr><td class="bodyText" bgcolor="#ffffff"><img src="/i/events/verizon2003/vcc03_right.gif" width="127" height="300" border="0"/></td></tr>
         </table><br />
       </td>
      <td width="10" bgcolor="#666666"><img src="/i/clear.gif" width="10" height="1" border="0"/></td>
       
<!-- Gutter Begins -->
        <td width="15"><img src="/i/clear.gif" width="15" height="1" border="0"/></td>
<!-- Gutter Ends -->

<!-- Center Column -->
      <td class="bodyText" valign="top">
            <img src="/i/clear.gif" width="100%" height="10" border="0"/><br />
            <h2>Conditions of Participation</h2>
            
            <p>By participating in the tournament, you agree to be bound by these rules and to all decisions of TopCoder, which 
            are final, binding and conclusive in all matters.</p>

            <h3><font color="#CC0000">Contestants must not cheat. All ideas for any code and/or challenge submitted must be 
            the contestant's alone.</font></h3>

            <p>Winners in each round of competition will be those competitors who win the most points in their respective rooms. 
            All decisions relating to the viability of submissions, the ranking of submissions and all other matters pertaining to 
            the tournament shall be within the sole discretion of TopCoder or its designee and shall be final and binding in all 
            respects.</p>

            <p>Prizewinners will be announced upon completion of the Championship Round.  Any prizewinner claiming a cash 
            prize must complete the following documents onsite before claiming the prize (Verizon will provide the prizewinners 
            with these documents upon conclusion of the Championship Round):</p>
                
            <ul>
                <li>Affidavit of Eligibility and Liability and Publicity Release </li>
                <li>Applicable tax form</li>
            </ul>

            <p>Prizes will be presented onsite upon receipt of the documents identified above.  All t-shirts will be sent to 
            competitors.  Unclaimed or undeliverable prizes will not be awarded.</p>

            <p>As a condition of participation in the tournament, all information provided by you in the registration must be 
            comprehensive, accurate and up-to-date. Verizon and/or TopCoder may require you to complete an additional 
            registration form to register for the tournament. In order to be eligible to participate in the tournament, you must 
            have completed any and all registration forms required by Verizon and TopCoder.</p>

            <p>As a condition of winning and redeeming a cash prize, winners will be required to complete and provide to Verizon 
            a completed (i) Affidavit of Eligibility and Liability and Publicity Release (the "Affidavit"), and (ii) IRS Form W-9
             or W-8BEN, as appropriate.  In completing the Affidavit, a winner (i) confirms his/her eligibility, (ii) represents 
             and warrants that he/she has not cheated; that the idea for the code and/or challenge submitted is his/hers alone, 
             (iii) verifies the accuracy of the information submitted in the Verizon Coding Challenge registration process, (iv) 
             authorizes TopCoder and Verizon to publicize the tournament's results, (v) agrees to sign any applicable forms 
             required by tax authorities, (vi) licenses to TopCoder and Verizon rights to all information submitted during the 
             tournament (including rights to source code and other executables), and (vii) releases TopCoder and Verizon from 
             liability arising out of any prize won. Verizon requires contestants to complete Form W-9 or W-8BEN, as 
             applicable, for tax reporting purposes. </p>
             
             <p>If prize notification is returned as undeliverable, or if the winner fails to return the Affidavit or the applicable 
             tax form, the winner will be disqualified and the prize money won by the disqualified winner will be forfeited. 
             Providing false information in the registration process or in the required forms described in this paragraph will 
             disqualify a winner.</p>

            <p>By participating in a tournament and redeeming a prize, a winner releases and agrees to hold harmless Verizon 
            and TopCoder, their affiliates, subsidiaries, advertising and promotion agencies, sponsors, and prize suppliers, 
            and all of their respective directors, officers, employees, representatives and agents, from and against any and all 
            liability for any loss, property damage or damage to person, including without limitation, death and injury, due in 
            whole or in part, directly or indirectly, from or arising out of participation in this tournament, or participation 
            in any tournament-related activity, or the receipt, use or misuse of a prize. Verizon and TopCoder specifically 
            disclaims all liability associated with, and makes no warranties with regard to, any prize given.</p>

            <p>In addition, all prizewinners agree to cooperate with Verizon and TopCoder's publicity efforts, without further 
            compensation. This includes the agreement to use their name, handle, address (city and state) and likeness for 
            publicity purposes, where legal, for this or similar future tournaments, and to use the statements made by, or 
            attributed to, the winners relating to Verizon and TopCoder and any and all rights to said use, without further 
            compensation.</p>

            <p>Verizon and TopCoder reserve the right, in their sole discretion, to revoke any and all privileges associated 
            with competing in this tournament, and to take any other action it deems appropriate, for no reason or any reason 
            whatsoever, including if TopCoder suspects competitors of cheating, tampering with the entry process, the operation 
            of the Web site, or the tournament process, or otherwise being in violation of the rules. Verizon and TopCoder 
            reserve the right to cancel, terminate or modify the tournament if it is not capable of completion as planned for any 
            reason, including infection by computer virus, bugs, tampering, unauthorized intervention or technical failures of 
            any sort.</p>
            
            <p> The tournament is void in whole or in part where prohibited by law.</p>
            
            <p>This tournament is brought to you by <A class="bodyText"><xsl:attribute name="HREF">/</xsl:attribute>TopCoder, Inc. (http://www.topcoder.com/)</A> 
            703 Hebron Avenue, Glastonbury, CT 06033 and <A class="bodyText"><xsl:attribute name="HREF">http://www.verizon.com</xsl:attribute>Verizon Communications Inc. (http://www.verizon.com)</A> 1095 Avenue of the Americas, New York, 
            New York 10036.</p>
         
            <p><br /></p>
      </td>
   </tr>
</table>

<!-- Footer Begins -->
<jsp:include page="verizon_foot.jsp" />
<!-- Footer Ends -->

</body>
</html>