<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Tournaments</title>

<jsp:include page="/script.jsp" />
<jsp:include page="/style.jsp">
  <jsp:param name="key" value="tc_main"/>
</jsp:include>
<script language="JavaScript">
  function changeImage(image, newImage) {
    document[image].src=newImage;
    return;
  }
</script>
</head>

<body>

<jsp:include page="/top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">
<!-- Left Column Begins-->
        <td width="180">
            <jsp:include page="/includes/global_left.jsp">
                <jsp:param name="node" value="topcoder_tournaments"/>
            </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Center Column Begins -->
<TD class="bodyText" width="100%" valign="top">
<div align="center" style="margin: 0px 10px 0px 10px;">


<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif" WIDTH="100%">
  <TR>
    <TD BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif" VALIGN="top" WIDTH="11"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="1" BORDER="0"/></TD>
    <TD COLSPAN="2" VALIGN="top" BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="240" HEIGHT="1" BORDER="0"/><br>

            <jsp:include page="links.jsp" />
            <jsp:include page="links_rules.jsp" />

  <br><br>
<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" WIDTH="100%">
<TR><TD VALIGN="middle" COLSPAN="3" HEIGHT="16" CLASS="statText"><br>
<DIV CLASS="statTextBig">Conditions of Participation</DIV>
<P>By participating in the tournament, you agree to be bound by these rules and to all decisions of TopCoder, which are final, binding and conclusive in all matters.</P>
<P>Contestants must not cheat. All ideas for any code and/or challenge submitted must be the contestant's alone.</P>
<P>Winners in each round of competition will be those competitors who win the most points in their respective rooms. All decisions relating to the viability of 
submissions, the ranking of submissions and all other matters pertaining to the tournament shall be within the sole discretion of TopCoder or its designee and shall be 
final and binding in all respects.</P>
<P>Prizewinners will be notified via e-mail within 10 days of the completion of the Online Round #4 that they have won a prize. If prizewinners advance to the onsite 
rounds of competition, they will also be forwarded an Affidavit of Eligibility and Liability and Publicity Release to be completed and returned to TopCoder no later than 
Tuesday, November 5th. Prizes will be presented within 60 days of making an eligibility determination. Unclaimed or undeliverable prizes will not be awarded.</P>
<P>As a condition of participation in the tournament, all information provided by you in your TopCoder member profile must be comprehensive, accurate and up-to-date. 
TopCoder may require you to complete an additional registration form to register for the tournament. In order to be eligible to participate in the tournament, you must 
have completed any and all registration forms required by TopCoder.</P>
<P>As a condition of winning and redeeming a prize, winners will be required to return within 5 days of receipt a completed (i) notarized Affidavit of Eligibility and 
Liability and Publicity Release, and (ii) IRS Form W-9 or W-8BEN, as appropriate, if one is not already on file with TopCoder. In completing the Affidavit of Eligibility 
and Liability and Publicity Release, a winner (i) confirms his/her eligibility, (ii) represents and warrants that he/she has not cheated; that the idea for the code and/or 
challenge submitted is his/hers alone, (iii) verifies the accuracy of the demographic information submitted, (iv) authorizes TopCoder to publicize the tournament's results, 
(v) agrees to sign any applicable forms required by tax authorities, (vi) licenses to TopCoder rights to all information submitted during the tournament (including rights to 
source code and other executables), and (vii) releases TopCoder from liability arising out of any prize won. TopCoder requires contestants to complete the Form W-9 or 
W-8BEN for tax reporting purposes. If prize notification is returned as undeliverable, or if the winner fails to return the Affidavit, or the W-9 or W-8BEN, as specified, 
the winner will be disqualified and the prize money won by the disqualified winner will be forfeited. Providing false information in the registration process or in the 
required forms described in this paragraph will disqualify a winner.</P>
<P>By participating in a tournament and redeeming a prize, a winner releases and agrees to hold harmless TopCoder, its affiliates, subsidiaries, advertising and promotion 
agencies, sponsors, and prize suppliers, and all of their respective directors, officers, employees, representatives and agents, from and against any and all liability for 
any loss, property damage or damage to person, including without limitation, death and injury, due in whole or in part, directly or indirectly, from or arising out of 
participation in this tournament, or participation in any tournament-related activity, or the receipt, use or misuse of a prize. TopCoder specifically disclaims all liability 
associated with, and makes no warranties with regard to, any prize given.</P>
<P>In addition, all prizewinners agree to cooperate with TopCoder's publicity efforts, without further compensation. This includes the agreement to use their name, handle, 
address (city and state) and likeness for publicity purposes, where legal, for this or similar future tournaments, and to use the statements made by, or attributed to, the 
winners relating to TopCoder and any and all rights to said use, without further compensation.  Furthermore, all prizewinners agree to promptly notify TopCoder if a third-party 
contacts the prizewinner regarding employment opportunities and/or media interest as a result of the prizewinner's participation in the tournament.</P>
<P>TopCoder reserves the right, in its sole discretion, to revoke any and all privileges associated with competing in this tournament, and to take any other action it deems 
appropriate, for no reason or any reason whatsoever, including if TopCoder suspects competitors of cheating, tampering with the entry process, the operation of the Web site, 
or the tournament process, or otherwise being in violation of the rules. TopCoder reserves the right to cancel, terminate or modify the tournament if it is not capable of 
completion as planned for any reason, including infection by computer virus, bugs, tampering, unauthorized intervention or technical failures of any sort.</P>
<P><B>Other</B></P>
<P>The tournament is void in whole or in part where prohibited by law.</P>
<P>A list of tournament winners by coder handles will be available on the web site at www.topcoder.com, and will be displayed for at least 3 months after the end of the tournament.</P>
<P>This tournament is brought to you by TopCoder, Inc. (www.topcoder.com) 703 Hebron Avenue (now 95 Glastonbury Blvd), Glastonbury, CT 06033.</P>
<br><br>
</TD>
</TR>
</TABLE>



      </TD>
   </TR>
</TABLE>

   <br><br>
</div>
</td>
<!-- Center Column Ends -->

<!-- Right Column Begins -->
         <td width="170">
            <jsp:include page="/public_right.jsp">
               <jsp:param name="level1" value="default"/>
            </jsp:include>
         </td>
<!-- Right Column Ends -->

<!-- Gutter -->
         <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<!-- Gutter Ends -->
    </tr>
</table>

<jsp:include page="/foot.jsp" />

</body>

</html>
