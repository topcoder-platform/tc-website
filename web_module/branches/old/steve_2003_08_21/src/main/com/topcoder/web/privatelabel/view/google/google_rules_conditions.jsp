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

<!-- TCO Header -->

<a name="top_page"></a>
<table  width="100%" border="0" cellspacing="0" cellpadding="0" class="bodyText">
   <tr>

<!-- Gutter Begins -->
        <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"/></td>
<!-- Gutter Ends -->

        <td align="center"><img src="/i/events/google2003/Logo_50wht.gif" width="163" height="74" border="0"/></td>

         <td width="100%" align="center" colspan="3">
            <object 
            type="application/x-shockwave-flash"
            data="/i/events/google2003/google3.swf"
            width="100%"
            height="125"
            border="0">           
            <param name="movie" value="/i/events/google2003/google3.swf" />
            <param name="quality" value="high" />
            <param name="salign" value="t">
            </object>
      </td>
   </tr>    
   <tr>

<!-- Gutter Begins -->
        <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"/></td>
<!-- Gutter Ends -->

<!-- Left Column Begins-->
         <td valign="top">
         <p><img src="/i/clear.gif" width="180" height="10" border="0"/><br />
         <img src="/i/tournament/vcc03/vcc03_right.gif" width="180" height="400" border="0"/><br />
         <img src="/i/clear.gif" width="180" height="40" border="0"/>
         </p>
         </td>         
<!-- Left Column Ends -->

<!-- Gutter Begins -->
        <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"/></td>
<!-- Gutter Ends -->

<!-- Center Column Begins-->
         <td class="bodyText" valign="top">
         <table  align="center" border="0" cellspacing="0" cellpadding="0" class="bodyText">
            <tr><td colpsn="9"><img src="/i/clear.gif" width="10" height="10"></td></tr>
            <tr>
               <td width=15>&nbsp;</td>
               <td id=1 bgcolor=#efefef align=center width=95 nowrap onClick="return c('www.google.com/imghp','wi',event);" style=cursor:pointer;cursor:hand;><a href="/pl/?&module=Static&d1=google&d2=google_overview"><font size=-1>Overview</font></a></td>
               <td width=15>&nbsp;</td>
               <td id=1 bgcolor=#efefef align=center width=95 nowrap onClick="return c('www.google.com/imghp','wi',event);" style=cursor:pointer;cursor:hand;><a href="/pl/?&module=Static&d1=google&d2=google_sched"><font size=-1>Schedule</font></a></td>
               <td width=15>&nbsp;</td>
               <td id=0 bgcolor=#3366cc align=center width=95 nowrap><font color=#ffffff size=-1><b>Rules</b></font></td>
               <td width=15>&nbsp;</td>
               <td id=1 bgcolor=#efefef align=center width=95 nowrap onClick="return c('www.google.com/imghp','wi',event);" style=cursor:pointer;cursor:hand;><a href="/pl/?&module=Static&d1=google&d2=google_registration"><font size=-1>Register Now</font></a></td>
               <td width=15>&nbsp;</td>
            </tr>
         </table>

<jsp:include page="googleSublinks.jsp" >
   <jsp:param name="selectedList" value="rules"/>
   <jsp:param name="selectedTab" value="conditions"/>
</jsp:include>
       
            <h2>Conditions of Participation</h2>
            
            <p>By participating in the tournament, you agree to be bound by these rules and to all decisions of TopCoder, which 
            are final, binding and conclusive in all matters.</p>

            <h3><font color="#CC0000">Contestants must not cheat. All ideas for any code and/or challenge submitted must be 
            the contestant's alone.</font></h3>

            <p>Winners in each round of competition will be those competitors who win the most points in their respective rooms. 
            All decisions relating to the viability of submissions, the ranking of submissions and all other matters pertaining to the 
            tournament shall be within the sole discretion of TopCoder or its designee and shall be final and binding in all respects.</p>

            <p>Prizewinners will be announced upon completion of the Championship Round.  Any prizewinner claiming a cash 
            prize must complete the following documents onsite before claiming the prize (Google will provide the prizewinners 
            with these documents upon conclusion of the Championship Round):</p>

            <ul>
            <li>Affidavit of Eligibility and Liability and Publicity Release </li>
            <li>Applicable tax form</li>
            </ul>

            <p>Prizes will be presented onsite upon receipt of the documents identified above.  All t-shirts will be sent to competitors 
            using the address given during registration.  Unclaimed or undeliverable prizes will not be awarded.</p>

            <p>As a condition of participation in the tournament, all information provided by you in the registration must be 
            comprehensive, accurate and up-to-date. Google and/or TopCoder may require you to complete an additional registration 
            form to register for the tournament. In order to be eligible to participate in the tournament, you must have completed any 
            and all registration forms required by Google and TopCoder.</p>

            <p>As a condition of winning and redeeming a cash prize, winners will be required to complete and provide to Google a 
            completed (i) Affidavit of Eligibility and Liability and Publicity Release (the “Affidavit”), and (ii) IRS Form W-9 or 
            W-8BEN, as appropriate.  In completing the Affidavit, a winner (i) confirms his/her eligibility, (ii) represents and 
            warrants that he/she has not cheated; that the idea for the code and/or challenge submitted is his/hers alone, (iii) verifies 
            the accuracy of the information submitted in the Google Extreme Challenge registration process, (iv) authorizes TopCoder 
            and Google to publicize the tournament's results, (v) agrees to sign any applicable forms required by tax authorities, (vi) 
            licenses to TopCoder and Google rights to all information submitted during the tournament (including rights to source code 
            and other executables), and (vii) releases TopCoder and Google from liability arising out of any prize won. Google requires 
            contestants to complete Form W-9 or W-8BEN, as applicable, for tax reporting purposes.</p>

            <p>If prize notification is returned as undeliverable, or if the winner fails to return the Affidavit or the applicable tax form, 
            the winner will be disqualified and the prize money won by the disqualified winner will be forfeited. Providing false information 
            in the registration process or in the required forms described in this paragraph will disqualify a winner.</p>

            <p>By participating in a tournament and redeeming a prize, a winner releases and agrees to hold harmless Google and TopCoder, 
            their affiliates, subsidiaries, advertising and promotion agencies, sponsors, and prize suppliers, and all of their respective 
            directors, officers, employees, representatives and agents, from and against any and all liability for any loss, property damage 
            or damage to person, including without limitation, death and injury, due in whole or in part, directly or indirectly, from or 
            arising out of participation in this tournament, or participation in any tournament-related activity, or the receipt, use or misuse 
            of a prize. Google and TopCoder specifically disclaim all liability associated with, and make no warranties with regard to, any 
            prize given.</p>

            <p>In addition, all prizewinners agree to cooperate with Google’s and TopCoder's publicity efforts, without further compensation. 
            This includes the agreement to use their name, handle, address (city and state) and likeness for publicity purposes, where legal, 
            for this or similar future tournaments, and to use the statements made by, or attributed to, the winners relating to Google and 
            TopCoder and any and all rights to said use, without further compensation.</p>

            <p>Google and TopCoder reserve the right, in their sole discretion, to revoke any and all privileges associated with competing in 
            this tournament, and to take any other action it deems appropriate, for no reason or any reason whatsoever, including if TopCoder 
            suspects competitors of cheating, tampering with the entry process, the operation of the Web site, or the tournament process, or 
            otherwise being in violation of the rules. Google and TopCoder reserve the right to cancel, terminate or modify the tournament if it 
            is not capable of completion as planned for any reason, including infection by computer virus, bugs, tampering, unauthorized 
            intervention or technical failures of any sort.</p>
            
            <p><br /></p>
                        
        </td>
<!-- Center Column Ends -->

<!-- Gutter Begins -->
        <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"/></td>
<!-- Gutter Ends -->
    </tr>
</table>

<!-- Footer Begins -->
<jsp:include page="google_foot.jsp" />
<!-- Footer Ends -->

</body>
</html>