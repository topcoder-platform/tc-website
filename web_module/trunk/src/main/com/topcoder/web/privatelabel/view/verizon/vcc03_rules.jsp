<%@ page contentType="text/html; charset=ISO-8859-1" %>
<%@ page import="com.topcoder.web.privatelabel.Constants,
                 com.topcoder.shared.dataAccess.resultSet.ResultSetContainer" %>
<%@ taglib uri="/tc-webtags.tld" prefix="tc-webtag" %>
<jsp:usebean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request" />
<jsp:usebean id="regInfo" class="com.topcoder.web.privatelabel.model.SimpleRegInfo" scope="session" />
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
<title>Verizon Coding Challenge Powered by TopCoder - Rules</title>

<jsp:include page="../script.jsp" />

<script language="JavaScript" type="text/javascript" src="/js/verizon.js"></script>

</head>

<body bgcolor="#FFFFFF" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" class="background">

<table border="0" cellspacing="0" cellpadding="0" class="black"  width="100%">
   <tr>

 <!-- Verizon logo-->
        <td width="147" valign="top"><a href="http://www.verizon.com/"><img src="/i/events/verizon2003/logo_black_147x41.gif" width="147" height="37" alt="Verizon" border="0"></a></td>
        <td class="red"><a name="top"><img alt="" src="/images/spacer.gif" width="1" height="37"></a></td>
        <td valign="top" class="black" width="440"><img src="/i/events/verizon2003/vcc03_logo_secondary.gif" width="440" height="37" alt="Verizon Coding Challenge" border="0"></td>
        <td class="red"><img alt="" src="/images/spacer.gif" width="1" height="37"></td>
        <td valign="top" class="black" width="99%"><img src="/i/events/verizon2003/pbtc_secondary.gif" width="134" height="37" alt="Contest Powered by TopCoder" border="0"></td>
    </tr>

<!-- Top Ad -->
    <tr>
      <td class="red" height="1" colspan="5"><img alt="" src="/images/spacer.gif" width="10" height="1"></td>
   </tr>

<table width="740" border="0" cellspacing="0" cellpadding="0">
    <tr>

<!-- Left Column Begins -->
        <td valign="top" width="146">
            <table width="146" border="0" cellpadding="0" cellspacing="0">
                <tr>
                    <td width="146" class="white" align="center"><img src="/i/events/verizon2003/ps_banner.jpg" width="146" height="61" border="0" alt="Verizon Coding Challenge">

                        <jsp:include page="verizon_links_secondary.jsp" />

                    </td>
                </tr>
            </table>
        </td>
<!-- Left Column Ends -->

<!-- Gutter Begins -->
        <td width="14"><img src="/i/clear.gif" width="14" height="1" border="0"/></td>
<!-- Gutter Ends -->

<!-- Center Column -->
        <td valign="top" width="579"><img src="/i/clear.gif" width="574" height="10" border="0"/><br />
            <table width="427" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">
                    <td width="427" class="bodyCopy">

<!-- Overview -->
                        <img src="../images/spacer.gif" width="425" height="4" alt><br/>
                        <a href="#contest" class="sidebarHeadLink">About the Contest</a>&nbsp;&nbsp;|&nbsp;&nbsp;
                        <a href="#prizes" class="sidebarHeadLink">About the Prizes</a>&nbsp;&nbsp;|&nbsp;&nbsp;
                        <a href="#conditions" class="sidebarHeadLink">Conditions of Participation</a>&nbsp;&nbsp;|&nbsp;&nbsp;
                        <a href="#other" class="sidebarHeadLink">Other</a>

                        <h2 class="pgTitle">Official Rules and Regulations</h2>
            
                        <h3><font color="#CC0000">No purchase necessary to enter or win</font></h3>

                        <p><strong>Overview of the Contest:</strong><br/>
                        The 2003 Verizon Coding Challenge is being offered by Verizon Communications ("Verizon") and TopCoder, Inc. ("TopCoder"). 
                        Verizon is using the results of the Contest to identify possible employees for their Chennai VDSI center.  The Contest will take place 
                        between October 27 and November 7, 2003.  It begins with a 6-day online registration, after which up to 500 eligible individuals 
                        will be invited to compete in the Contest. The Contest consists of two (2) online elimination rounds and one (1) onsite final round.  
                        All participants who compete in Round #1 will receive a Verizon Coding Challenge t-shirt.  In addition, Verizon will award 110,000 
                        INR (Indian Rupees) in cash prizes to the top 4 finalists in the Contest.</p>
                        
                        <p><strong>Eligibility:</strong><br/>
                        The Verizon Coding Challenge is open only to citizens and lawful permanent residents of India residing in Chennai who are 18 years of age
                         or older. In addition, contestants must have an undergraduate degree and be employed in a technical profession as of October 27.</p>

                        <p>Employees of Verizon and TopCoder, and those involved in the development, production, implementation and distribution of this Contest 
                        and their advertising or promotional agencies, parent companies, agents, directors, subsidiaries or affiliates, or immediate family members 
                        of such persons, are ineligible to enter the Contest.</p>
                        
                        <p><strong>Registration:</strong><br/>
                        Registration will open on October 27, 2003 and will close on October 30, 2003.  Registration is unlimited, however only the first 500 eligible 
                        individuals to register and activate their registration will be invited to compete.  Official invitations to eligible contestants will be emailed on 
                        October 31, 2003.  Individuals are permitted to register only once for the Contest.</p>
                        
                        <p><strong>The Competition Field:</strong><br/>
                        A total of 500 individuals will be invited to compete in Round #1.  The top 250 scorers will advance to Round #2.  The top 25 scorers from Round #2 
                        will advance to Round #3 (the Championship Round), which will be held onsite at Verizon's Chennai VDSI facility on November 7, 2003.</p>
                        
                        <table border="0" cellpadding="5" cellspacing="2" class="sidebarBox" align="center">
                            <tr>
                                <td width="50%" class="sidebarTitle">Round</td>
                                <td width="50%" class="sidebarTitle" align="right">Date and Time*(IST)</td>
                            </tr>

                            <tr>
                                <td width="50%" class="sidebarText">Round #1</td>
                                <td width="50%" class="sidebarText" align="right">Friday, October 31, 2003 at 7:00PM</td>
                            </tr>

                            <tr>
                                <td width="50%" class="sidebarText">Round #2</td>
                                <td width="50%" class="sidebarText" align="right">Monday, November 3, 2003 at 7:00Pm</td>
                            </tr>

                            <tr>
                                <td width="50%" class="sidebarText">Round #3 - Championship</td>
                                <td width="50%" class="sidebarText" align="right">Friday, November 7, 2003 at 6:00PM</td>
                            </tr>


                            <tr>
                                <td colspan="2" class="sidebarText">*NOTE: In the event a Round must be cancelled for any reason, the "raindate" will be the 
                                following day at the same time.</td>
                            </tr>
                        </table>

                        
                        <p><a name="contest"><br/></a></p>

<!-- About the Contest -->
                        <h2 class="pgTitle"><a href="#top">
                        <img src="/i/events/verizon2003/button_backtotop.gif" alt="back to top" width="83" height="23" border="0" align="right"></a>About the Contest</h2>
            
                        <p><strong>Online Elimination Rounds</strong><br/>
                        Everyone who competes in Round #1 must log in to the TopCoder Competition Arena no later than ten minutes prior to the start 
                        of the online round.  <strong><em>All start times will be communicated in IST.</em></strong>  If a coder does not participate, for any reason, in an 
                        online round he/she has advanced to, it will be treated as an automatic loss in that round of competition, and that coder will be 
                        disqualified from the Contest. </p>
                        
                        <p>All competitors who have been invited to compete will be randomly assigned to specific rooms, with up to 10 people in each 
                        room.  TopCoder will determine all room assignments prior to the start of each online round. </p>
            
                      <p><strong>Scoring and Advancing During Online Rounds</strong><br/>
                        After each round of competition, the top scorers will be identified and will advance to the next round.  Coder advancement in 
                        all rounds is determined by comparing the total point values from all three phases of the round (see Competition Round Structure) 
                        for each coder. In order to advance, a coder must finish each round with a greater-than-zero (i.e, positive) point total. The structure of the 
                        online rounds is as follows:</p>
                        
                        <p><strong>Round #1</strong>
                        <ul><li>Up to 500 coders will compete in Round #1 and up to 250 will advance.  The 250 highest scoring competitors will advance 
                        to Round #2.  Each coder must have positive points to advance, so if there are less than 250 competitors who score positive points, 
                        only those competitors with a positive point total will advance.  </li></ul></p>
                                       
                        <p><strong>Round #2</strong>
                        <ul><li>Up to 250 coders will compete and up to 25 will advance.  The 25 highest scoring competitors will advance to Round #3.  
                        Each coder must have positive points to advance, so if there are less than 25 competitors who score positive points, only those 
                        competitors with a positive point total will advance.</li></ul></p>
               
                          <p><strong>Round #3</strong>
                        <ul><li>Up to 25 coders will compete in the Championship Round being held onsite at Verizon's Chennai facility.  Each finalist 
                        is responsible for arriving at Verizon's facility to compete.</li></ul></p>
            
                        <p><strong>NOTE:</strong>  In the event of a tie for any advancing position, the tie will be resolved in the following manner:</p>
                        <ul>
                           <li>Total points acquired (higher is better) during the previous rounds of the Contest.</li>
                           <li>If a tie still remains, all tied coders will advance to the next round</li>
                        </ul>
                        
                        <p>The handles of the winners of each round of competition will be published on TopCoder's website at <A href="http://www.topcoder.com/verizon">www.topcoder.com/verizon</A> 
                        within twelve (12) hours of the completion of the round.  In addition, each winner will be sent an email within twelve (12) hours of the completion of 
                        each round confirming his/her advancement to the next round of competition.</p>
                        
                        
                        
                        <p><strong>Competition Round Structure</strong><br/>
                        Each online and onsite round of competition consists of three phases: the Coding Phase, Challenge Phase, and System Testing Phase. 
                        (Note: the format of these competition rounds is similar to the format of TopCoder's Single Round Matches.)</p>
            
                        <ul>
                            <li><strong>The Coding Phase</strong> is a timed event lasting 75 minutes where all contestants are presented with the same 
                            three questions representing three levels of complexity and, accordingly, three levels of point earnings potential. Points for a 
                            problem are awarded upon submission of any solution that successfully compiles and are calculated on the total time elapsed 
                            from the time the problem was opened to the time it was submitted.</li>

                            <li><strong>The Challenge Phase</strong> is a timed event lasting 15 minutes wherein each competitor has a chance to challenge 
                            the functionality of other competitors' code. A successful challenge will result in a loss of the original problem submission points 
                            by the defendant, and a 50-point reward for the challenger.  Unsuccessful challengers will incur a point reduction of 50 points 
                            as a penalty, applied against their total score in that round of competition. </li>

                            <li><strong>The System Testing Phase</strong> is applied to all submitted code that has not already been successfully challenged. 
                            If the TopCoder System Test finds code that is flawed, the author of that code submission will lose all of the points that were 
                            originally earned for that code submission. The automated tester will apply a set of inputs, expecting the output from the code 
                            submission to be correct. If the output from a coder's submission does not match the expected output, the submission is considered 
                            flawed. The same set of input/output test cases will be applied to all code submissions for a given problem. All successful challenges 
                            from the Challenge Phase will be added to the sets of inputs for the System Testing Phase.</li>
                        </ul>

                        <p><strong>Onsite Championship Round</strong><br/>
                        The 25 advancers from Round #2 must travel to Verizon's Chennai VDSI facility to compete in the Championship Round of the Contest. 
                        Each finalist will be notified via email that he/she has advanced to the onsite final. Each finalist must confirm his/her attendance in 
                        the Championship Round by Wednesday, November 5th at 9:00pm Eastern Time.  If a contestant does not confirm his/her attendance in 
                        the Championship Round by said date, he/she will forfeit eligibility to receive a prize, and his/her spot in the Contest will be given to 
                        the next highest scorer from Round #2.  All finalists must arrive at Verizon's Chennai VDSI offices no later than 5:00pm India Time on 
                        Friday, November 7, 2003.  If a contestant who has confirmed his/her attendance in the Championship Round does not arrive at Verizon's 
                        offices by this time, he/she will forfeit eligibility to receive any prize. If a contestant is unable to attend the onsite rounds, he/she will 
                        forfeit eligibility to receive a prize, and his/her spot in the Contest will be given to the next highest scorer from Round #2.</p>

                        <p>Verizon and TopCoder will NOT provide travel arrangements for each finalist.  All expenses to attend the onsite finals are the 
                        responsibility of the finalist.</p>

                        <p>TopCoder will determine the room assignments for the Championship Round prior to the start of the Championship Round. </p>
            
                        <p>The Championship Round will be a single round of 25 coders. First, second, third and fourth place in the Championship Round 
                        are determined by comparing the total points of each coder, with the highest point value placing first. The winner of the Championship 
                        Round will be the coder with the highest point total for the round. In the event of a tie in the Championship Round, the tie will be 
                        resolved in the following manner (in order):</p>
                        
                        <ul>
                            <li>Total points acquired (higher is better) during Rounds #1 and #2</li>
                            <li>If a tie still remains in the Championship Round, then the prize money will be distributed equally amongst the tied coders</li>
                        </ul>
                        
                        <p><a name="prizes"><br/></a></p>

<!-- About the Prizes -->
                        <h2 class="pgTitle"><a href="#top"><img src="/i/events/verizon2003/button_backtotop.gif" alt="back to top" width="83" height="23" border="0" align="right"></a>About the Prizes</h2>
            
                        <p>All participants who compete in Round #1 will receive a Verizon Coding Challenge t-shirt.  In addition, the top four scorers in the 
                        Championship Round will receive cash prizes.  Any and all applicable taxes on prizes are the sole responsibility of the prizewinner.  
                        Prizes will be distributed as follows:</p>
            
                        <table border="0" cellpadding="5" cellspacing="2" class="sidebarBox" align="center">
   
                            <tr>
                                <td width="50%" class="sidebarTitle">Competitor(s)</td>
                                <td width="50%" class="sidebarTitle" align="right">Prize</td>
                            </tr>
                            
                            <tr>
                                <td width="50%" class="sidebarText"><strong>1st place finisher* - Tournament&nbsp;Champion</strong></td>
                                <td width="50%" class="sidebarText" align="right"><strong>50,000 INR</strong></td>
                            </tr>
                            
                            <tr>
                                <td width="50%" class="sidebarText">2nd place finisher* in the Championship&nbsp;Round</td>
                                <td width="50%" class="sidebarText" align="right">30,000 INR</td>
                            </tr>
                            
                            <tr>
                                <td width="50%" class="sidebarText">3rd place finisher* in the Championship&nbsp;Round</td>
                                <td width="50%" class="sidebarText" align="right">20,000 INR</td>
                            </tr>

                            <tr>
                                <td width="50%" class="sidebarText">4th place finisher* in the Championship&nbsp;Round</td>
                                <td width="50%" class="sidebarText" align="right">10,000 INR</td>
                            </tr>

                            <tr>
                                <td width="50%" class="sidebarText">Up to 500 competitors who compete in Round #1</td>
                                <td width="50%" class="sidebarText" align="right">Verizon Coding Challenge t-shirt</td>
                            </tr>


                            <tr>
                                <td colspan="2" class="sidebarText"><strong>* Prize will be awarded at the conclusion of the Championship Round. 
                                    Winner must be present at the onsite rounds to receive prize.</strong></td>
                            </tr>
                        </table>

     
                        <p><a name="conditions"><br/></a></p>

<!-- Conditions of Participation -->
                        <h2 class="pgTitle"><a href="#top"><img src="/i/events/verizon2003/button_backtotop.gif" alt="back to top" width="83" height="23" border="0" align="right"></a>Conditions of Participation</h2>
            
                        <p>By participating in the Contest, you agree to be bound by these rules and to all decisions of Verizon and TopCoder, which are final, binding 
                        and conclusive in all matters, and no correspondence in respect of the Contest or the decision of Verizon and TopCoder shall be entertained.</p>

                        <p><font color="#CC0000">Contestants must not cheat. All ideas for any code and/or challenge submitted must be original and of the contestant's alone.  The Contestants 
                        shall not use any third party material including intellectual property. No third party material, other than what is provided to contestants 
                        within the TopCoder competition arena, will be available during the Championship Round.</font></p>

                        <p>Winners in each round of competition will be those competitors who win the most points in their respective rooms. All decisions relating to the 
                        viability of submissions, the ranking of submissions and all other matters pertaining to the Contest shall be within the sole discretion of TopCoder 
                        or its designee and shall be final and binding in all respects.</p>

                        <p>Prizewinners will be announced upon completion of the Championship Round.  Any prizewinner claiming a cash prize must complete the following 
                        documents onsite before claiming the prize (Verizon will provide the prizewinners with these documents upon conclusion of the Championship Round):</p>

                        <ul><li>Affidavit of Eligibility and Liability and Publicity Release </li>
                        <li>Applicable tax form</li></ul>

                        <p>Prizes to the 4 finalists will be presented onsite upon receipt of the documents identified above.  All t-shirts will be sent to first 500 eligible competitors 
                        by post.  Verizon shall not be responsible for any postal delay or non-delivery of prizes.  Undeliverable prizes will not be awarded.  Prizes are not transferable.</p>

                        <p>As a condition of participation in the Contest, all information provided by you in the registration must be comprehensive, accurate and up-to-date. Verizon and/or 
                        TopCoder may require you to complete an additional registration form to register for the Contest. In order to be eligible to participate in the Contest, you must have 
                        completed all registration formalities prescribed by Verizon and TopCoder.  Incomplete or corrupted registration forms will not be accepted.</p>

                        <p>As a condition of winning and redeeming a cash prize, winners will be required to complete and provide to Verizon a completed (i) Affidavit of Eligibility and 
                        Liability and Publicity Release (the "Affidavit"), and (ii) any applicable tax forms.  In completing the Affidavit, a winner (i) confirms his/her eligibility, (ii) 
                        represents and warrants that he/she has not cheated; that the idea for the code and/or challenge submitted is his/hers alone, (iii) verifies the accuracy of the 
                        information submitted in the Verizon Coding Challenge registration process, (iv) authorizes TopCoder and Verizon to publicize the Contest results, (v) agrees to 
                        sign any applicable forms required by tax authorities, (vi) licenses to TopCoder and Verizon rights to all information submitted during the Contest(including rights 
                        to source code and other executables), and (vii) releases TopCoder and Verizon from liability arising out of any prize won. Verizon may require contestants to complete 
                        tax forms as applicable for tax reporting purposes. </p>

                        <p>If prize notification is returned as undeliverable, or if the winner fails to return the Affidavit or the applicable tax form, the winner will be disqualified and 
                        the prize money won by the disqualified winner will be forfeited. Providing false information in the registration process or in the required forms described in this 
                        paragraph will disqualify a winner from the Contest ab intio.</p>

                    <p>By participating in the Contest and redeeming a prize, a winner releases and agrees to hold harmless Verizon and TopCoder, their affiliates, subsidiaries, 
                    advertising and promotion agencies, sponsors, and prize suppliers, and all of their respective directors, officers, employees, representatives and agents, from 
                    and against any and all liability for any loss, property damage or damage to person, including without limitation, death and injury, due in whole or in part, 
                    directly or indirectly, from or arising out of participation in this Contest, or participation in any Contest -related activity, or the receipt, use or misuse of a 
                    prize. Verizon and TopCoder specifically disclaim all liability associated with, and make no warranties with regard to any prize given.</p>

                    <p>In addition, all prizewinners agree to cooperate with Verizon and TopCoder's publicity efforts, without any compensation. This includes the agreement to use their 
                    name, handle, address (city and state) and likeness for publicity purposes, where legal, for this or similar future tournaments, and to use the statements made by, or 
                    attributed to, the winners relating to Verizon and TopCoder and any and all rights to said use, without any compensation.  </p>

                    <p>Verizon and TopCoder reserve the right, in their sole discretion, to revoke any and all privileges associated with competing in this Contest, including to reject 
                    the registration of any person without assigning any reason for the same; to take any other action they may deem appropriate, against competitors suspected or 
                    found guilty of cheating, tampering with the entry process, the operation of the Web site, or the Contest process, or otherwise being in violation of the rules. 
                    Verizon and TopCoder reserve the right to cancel, terminate or modify the Contest if it is not capable of completion as planned for any reason, including infection 
                    by computer virus, bugs, tampering, unauthorized intervention or technical failures of any sort.</p>
                    
                    <p>Winners of each round will be sent an email within twelve (12) hours of the completion of each round confirming his/her advancement to the next round of the 
                    Contest.  However Verizon or TopCoder shall not be responsible for non-receipt of such e-mail by the contestant.</p>
                    
                     <p><a name="other"><br/></a></p>

<!-- Other -->
                        <h2 class="pgTitle"><a href="#top"><img src="/i/events/verizon2003/button_backtotop.gif" alt="back to top" width="83" height="23" border="0" align="right"></a>Other</h2>
                        
                        
                        <p>Verizon/TopCoder reserve the right to suspend or cancel the Contest at any time prior to or during the Contest without assigning any reason for the same.</p>

                        <p>Verizon/TopCoder reserve the right to change/modify any round of the Contest. In such event the Contestants will be given prior reasonable notice/information 
                        of any such change.</p>

                        <p>Verizon or TopCoder assume no responsibility for any error, omission, interruption, deletion, defect, delay in operation or transmission, communications line, 
                        unauthorised access to or alteration of entries (including codes submitted by the contestants during the Contest).</p>

                        <p>Verizon or TopCoder shall not be responsible for any problems or technical malfunction of any network, computer on-line systems, servers or service providers, 
                        computer equipment, software, failure of any e-mail or entry to be received by TopCoder/Verizon on account of technical problems or any problem on the internet 
                        or at the designated website or any combination of them, including injury or damage to any contestant's or any other person's computer (including hardware/software) 
                        related to or resulting from participation or downloading any material during the Contest. </p>

                        <p>The Contest is being held by Verizon to evaluate potential employment candidates only.  There are no guarantees or assurances that you will hired by Verizon, or 
                        that you will even be considered for employment, if you compete in the Contest.  </p>

                        <p>CAUTION: any attempt to deliberately damage the web site or the information on the web site, or to otherwise undermine the legitimate operation of the Contest, 
                        may be a violation of civil and criminal laws and should such attempt be made, whether successful or not, Verizon/TopCoder reserve the right to seek damages to the 
                        fullest extent permitted by law.</p>

                        <p>The Contest is void in whole or in part where prohibited by law.</p>

                        <p>This Contest is brought to you by <A href="http://www.topcoder.com/" class="bodyText">TopCoder, Inc.</A>, 703 Hebron Avenue, Glastonbury, CT 06033 and 
                        Verizon Data Services India Private Limited at No 1208, 'D' Wing, Tidel Park Limited, 4, Canal Bank Road, Taramani, Chennai-600 113.</p>


                        <p><img src="/i/clear.gif" width="427" height="20" border="0"/></p>
                    </td>
                    
<!-- Gutter Begins -->
                    <td width="14"><img src="/i/clear.gif" width="14" height="1" border="0"/></td>
<!-- Gutter Ends -->

<!-- Right Column Begins -->
    <jsp:include page="verizon_right.jsp" />
<!-- Right Column Ends -->

                </tr>
            </table>
        </td>
   </tr>
</table>

<!-- Footer Begins -->
    <jsp:include page="verizon_foot.jsp" />
<!-- Footer Ends -->

</body>
</html>
