<%@ page import="com.topcoder.web.common.model.EventType" %>
<%@ page contentType="text/html;charset=utf-8" %> 
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>2007 TopCoder Collegiate Challenge - Computer Programming Tournament</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <link type="text/css" rel="stylesheet" href="/css/tournaments/tccc07.css"/>
    <link type="text/css" rel="stylesheet" href="/css/coders.css"/>
    <jsp:include page="../../script.jsp" />
</head>
<body>

<div align="center" style="background: transparent;">
    <div id="content">

        <jsp:include page="../nav.jsp" >
        <jsp:param name="tabLev1" value="<%=EventType.STUDIO_TOURNAMENT_ID%>"/>
        <jsp:param name="tabLev2" value="rules"/>
        <jsp:param name="tabLev3" value=""/>
        </jsp:include>

            <div id="pageBodyOutside">
            <div id="pageBody">
                <div id="h1Border">&nbsp;</div>
                <h1><span>Studio Design Competition Official Rules and Regulations</span></h1>
                <div id="h1Border">&nbsp;</div>
                <p>
                    <a href="#eligibility">Eligibility</a>&nbsp;&nbsp;|&nbsp;&nbsp;
                    <a href="#registration">Registration</a>&nbsp;&nbsp;|&nbsp;&nbsp;
                    <a href="#placement">Placement Scoring </a>&nbsp;&nbsp;|&nbsp;&nbsp;
                    <a href="#schedule">Schedule</a>&nbsp;&nbsp;|&nbsp;&nbsp;
                    <a href="#scoring">Scoring and Advancing</a>&nbsp;&nbsp;|&nbsp;&nbsp;
                    <a href="#prizes">Prizes</a>&nbsp;&nbsp;|&nbsp;&nbsp;
                    <a href="#conditions">Conditions</a>
                </p>
                <p><span class="bigRed">No purchase necessary to enter or win. Void where prohibited.</span></p>
                </p>
                
                <h2>Overview of the Tournament</h2>
                <p>The 2007 TopCoder Collegiate Challenge Studio Design Competition ("SDC") will take place between July 23 and November 2, 2007, and is part of the 2007 TopCoder Collegiate Challenge ("Tournament"). It will consist of eight (8) weeks of online competition and one (1) onsite final round, being the Championship round. The prize purse for the SDC is $30,000 in cash. The eight (8) competitors with the highest cumulative placement scores after the online rounds of competition will advance to the onsite Championship round, being held at the Contemporary Resort at Walt Disneyworld in Orlando, Florida, USA on November 1, 2007.</p>
                
                <a name="eligibility"></a>
                <h2>Eligibility</h2>
                <p>TopCoder Studio members meeting the following criteria are eligible to compete in the SDC:</p>
                    <ul>
                        <li>Must be at least 18 years of age as of July 23, 2007; AND</li>
                        <li>Must currently be eligible for participation in TopCoder Studio projects (i.e. not suspended from TopCoder); AND</li>
                        <li>Must be matriculated full-time at an accredited college or university.</li>
                    </ul>
                <p>TopCoder Studio members who are 18 years of age or older as of July 23, 2007 are eligible to win cash prizes, unless otherwise prohibited. The SDC is void in the Quebec province of Canada, and elsewhere where prohibited by applicable law. Residents of Cuba, Iran, North Korea, Sudan, or Syria are ineligible to receive cash prizes and are ineligible to attend the onsite final round of competition as competitors.</p>
                <p>Employees of TopCoder, Inc. and of all Tournament sponsors, regardless of commitment date as sponsor, including any companies involved in the production (including prize suppliers), implementation and distribution of the SDC or the Tournament and their advertising or promotion agencies, parent companies, service providers, agents, officers, subsidiaries or affiliates, or any other persons or entities directly associated with the SDC or the Tournament and members of the immediate families and/or persons living in the same household as such persons, are ineligible to participate in the SDC. If a competitor's employer signs up as a sponsor of the Tournament on or after July 23, 2007, then that competitor will be disqualified from participating further in the Tournament. TopCoder members who are performing internships for any Tournament sponsor between July 23 and November 2, 2007 are also ineligible to participate.</p>
                <p>Those competitors who are eligible to compete in any of the four tournament competitions will be permitted to participate in any/all of them online. However, in the event a competitor becomes a finalist in more than one competition and the onsite competition times overlap, the competitor must choose only one competition to participate in as a finalist by September 28, 2007.</p>
                
                <a name="registration"></a>
                <h2>Registration</h2>
                <p>Registration for the SDC will open at 9:00 AM EST on Monday, July 23, 2007, and will close at 5:00 PM EDT on Friday, August 24, 2007. In order to be eligible to compete in the SDC, competitors must register separately for the SDC. There is no limit to the number of competitors in the tournament; however each competitor may only register once.</p>
                
                <a name="placement"></a>
                <h2>Placement Scoring</h2>
                <p>Studio contests that are eligible for points towards the SDC will be identified on the Studio website starting July 30, 2007. Scoring in the SDC is determined by the placement of the top four (4) submissions in each eligible contest by an SDC competitor. Placement is determined based on one or more of the following criteria:</p>
                    <ul>
                        <li>Client and/or TopCoder chooses the winner at their discretion with no community involvement.</li>
                        <li>Client and/or TopCoder asks finalists to revise designs, then chooses the winner with no community involvement.</li>
                        <li>Client and/or TopCoder selects the finalists, which are put out to a community vote to determine a winner.</li>
                    </ul>
                <p>All contest submissions are put out to a community vote to determine a winner.</p>
                <p>You must be registered to compete in the SDC to be eligible for tournament placement points.  Placement points will be awarded to SDC competitors in Studio contests that are part of the online SDC competition round as follows:<br />
                1st Place - 10 Points<br />
                2nd Place - 7 Points<br />
                3rd Place - 5 points<br />
                4th Place - 4 Points<br />
                Below 4th Place - 0 Points</p>
                
                <h2>Open Competition Explanation</h2>
                <p>Both Studio members who have not registered for the SDC and SDC-registered competitors will be allowed to enter any Studio design contest. Because of the mixed competitor pool, it is possible that SDC-registered members may not place in the top four (4) of any given Studio contest, in which case no placement points will be awarded to the SDC-registered competitors who did not place in the top four (4).<br />Example:</p>
                <table cellpadding="0" cellspacing="0" class="stat" width="100%"> 
                    <tbody> 
                        <tr> 
                            <td class="header" colspan="3">Contest #1 Placement Determined by the Client:</td> 
                        </tr> 
                        <tr class="light"> 
                            <td class="value">1st Place</td> 
                            <td class="value">Non-SDC competitor</td> 
                            <td class="value">no placement score given</td> 
                        </tr> 
                        <tr class="dark"> 
                            <td class="value">2nd Place</td> 
                            <td class="value">SDC Competitor</td> 
                            <td class="value">placement score 7 points</td> 
                        </tr> 
                        <tr class="light"> 
                            <td class="value">3rd Place</td> 
                            <td class="value">Non-SDC competitor</td> 
                            <td class="value">no placement score given</td> 
                        </tr> 
                        <tr class="dark"> 
                            <td class="value">4th Place</td> 
                            <td class="value">SDC Competitor</td> 
                            <td class="value">placement score 4 points</td> 
                        </tr> 
                        <tr class="light"> 
                            <td class="value">5th Place</td> 
                            <td class="value">Non-SDC competitor</td> 
                            <td class="value">no placement score given</td> 
                        </tr> 
                    </tbody> 
                </table>
                <br />

                <a name="schedule"></a>
                <h2>Schedule</h2>
                <p>The Studio competitions will have eight (8) weeks of online competition and one (1) onsite Championship round. Each competitor participating in an online round must submit his/her design submission for any contest by the submission deadline.</p>
                <table cellpadding="0" cellspacing="0" class="stat" width="100%"> 
                    <tbody> 
                        <tr> 
                            <td class="title" colspan="5">Schedule</td> 
                        </tr> 
                        <tr> 
                            <td class="header">&nbsp;</td> 
                            <td class="header">Start Date</td> 
                            <td class="header">Start Time</td> 
                            <td class="header">End Date</td> 
                            <td class="header">End Time</td>
                        </tr> 
                        <tr class="light"> 
                            <td class="value">SDC Registration</td> 
                            <td class="value">July 23, 2007</td> 
                            <td class="value">9:00 AM EDT<br />(GMT/UTC -4)</td> 
                            <td class="value">August 24, 2007</td> 
                            <td class="value">5:00 PM EDT<br />(GMT/UTC -4)</td>
                        </tr> 
                        <tr class="dark"> 
                            <td class="value">Online Competition</td> 
                            <td class="value">July 30, 2007</td> 
                            <td class="value">9:00 AM EDT<br />(GMT/UTC -4)</td> 
                            <td class="value">September 14, 2007</td>
                            <td class="value">6:00 PM EDT<br />(GMT/UTC -4)
                        </tr> 
                        <tr class="light"> 
                            <td class="value">Onsite Competition</td> 
                            <td class="value">November 1, 2007</td> 
                            <td class="value">9:00 AM PDT<br />(GMT/UTC -4)</td> 
                            <td class="value">November 1, 2007</td>
                            <td class="value">5:00 PM EDT<br />(GMT/UTC -4)</td>
                        </tr>
                    </tbody> 
                </table>
                <br />
                
                <a name="scoring"></a>
                <h2>Scoring and Advancing</h2>
                <p>During the eight (8) weeks of online competition, eligible competitors can submit designs for as many contests as they like. Submissions will be screened against the Spec Doc by the Contest Administrator and either passed or failed depending on whether all of the requirements of the Spec Doc are met. Competitors can resubmit any fixes to their failed designs before the submission deadline. ALL SUBMISSIONS MUST BE RECEIVED ACCORDING TO THE SUBMISSION DEADLINE TO BE CONSIDERED A VIABLE ENTRY. THERE ARE NO EXCEPTIONS. There is no elimination of competitors during the online competition.</p>
                <p>After the submission phase for a contest is over, placements will be determined. The six (6) highest individual placement scores that each contestant receives for his/her submissions throughout the eight (8) weeks of competition will be added together for a cumulative placement score. If a competitor does not have at least six (6) placement scores, then the existing scores will be added for a cumulative placement score.  A maximum of eight (8) competitors with the highest cumulative placement score will advance to the onsite Championship round.</p>
                <p>Example:<br />
                Contestant enters three SDC eligible Studio design contests during the online competition, earning the following placement scores:<br />
                Contest #1 - placement 2; placement score 7<br />
                Contest #2 - placement 3; placement score 5<br />
                Contest #3 - placement 3; placement score 5</p>
                <p>Cumulative placement score: 7 + 5 + 5 = 17</p>
                <p>In the event of a tie between eligible competitors to determine advancement to the Championship round, the tie will be resolved in the following manner:</p>
                    <ol>
                        <li>The competitor with the most higher-placed submissions among those submissions used to develop the cumulative placement score shall advance.</li>
                        <li>If a tie still remains, then the competitors will enter into a Rapid Design Contest (see below) and the winner shall advance.</li>
                        <li>If a tie still remains, then all tied competitors will advance to the Championship round.</li>
                    </ol>
                    
                <h2>Rapid Design Contest</h2>
                <p>The Rapid Design Contest will only include the competitors who are tied as stated above. This contest will consist of designing a mock (graphical representation) of a fictitious web site's main page. The tied competitors will submit only one design for this contest. The designs must pass the Studio screening process. Once submissions are received, they will be presented to the community for a vote. The winner of the Rapid Design Contest will be the winner of the community vote and  will advance to the Championship round. The results of the vote are final.</p>
                <p>If necessary, the schedule for the Rapid Design Contest is as follows:<br />
                Submission Phase: May 1 - May 4, 2007<br />
                Voting Phase: May 7 - May 11, 2007<br />
                Winner Announced: May 11, 2007</p>

                <h2>Onsite Championship Round</h2>
                <h3>Important Information</h3>
                <p style="font-weight:bold;">Travel Confirmation</p>
                <p>A maximum of eight (8) competitors from the eight (8) weeks of online competition will travel to the Contemporary Resort on Tuesday, October 30, 2007 to compete in the finals of the SDC held on Thursday, November 1. All competitors must arrive at the Contemporary Resort no later than 2:00 PM EDT on Tuesday, October 30, 2007.</p>
                <p>All competitors must confirm their attendance at the onsite Championship no later than 5:00 PM EDT (UTC/GMT -4) on Friday, September 28, 2007, and must have acquired any necessary travel visas and know for certain that they can travel to the United States.  If a competitor is required to travel from outside the United States, it is necessary for the competitor to show proof of a visa and/or passport by 5:00 PM EDT (UTC/GMT -4) on Friday, September 28, 2007. Competitors may email a copy of their documents to Jessie D'Amato Ford at jford@topcoder.com. Competitors who fail to meet this requirement will be replaced as an onsite finalist.</p>
                <p style="font-weight:bold;">Visa Assistance</p>
                <p>TopCoder will issue visa invitation letters at the request of international competitors who require one to obtain a travel visa to enter the United States. All competitors who pass screening on at least two designs will receive a request form to fill out if they require a letter. As soon as a competitor fills out the form in its entirety, their letter will be mailed. Competitors have until :00 PM EDT (GMT/UTC -4) on Friday, September 14, 2007 to request a letter. Visas can take a significant amount of time to obtain in certain countries; therefore, for those competitors who need a letter, it is in their best interest to request one well before the deadline. The cost of obtaining a visa is the sole responsibility of the competitor. Other than providing the visa invitation letter upon request, TopCoder will not assist you in the process of obtaining a travel visa. See more information about <a href="/tc?module=Static&d1=tournaments&d2=tccc07&d3=getVisa" alt="Get travel visas">travel visas</a>.</p>
                <p style="font-weight:bold;">Travel Details</p>
                <p>TopCoder will provide air travel arrangements for each competitor. The flight will be reserved by and paid for by TopCoder and will be for arrival on October 30, 2007 and departure on November 4, 2007.TopCoder will pay for each competitor's airfare up to $1,500, though we reserve the right to make exceptions to the maximum amount based on individual circumstances. Extended flights and/or hotel room nights requested by a competitor that result in additional costs will be the responsibility of the competitor.</p>
                <p>Ground transportation to and from the Orlando International Airport will be provided for you by TopCoder by Disney Magical Express, as well as hotel accommodations and certain meals for each competitor. All other expenses are the responsibility of the competitor. TopCoder will not provide travel or lodging accommodations for guests of the competitor.</p>
                <p style="font-weight:bold;">Onsite Championship Round</p>
                <p>Each competitor will compete on the same design challenge, which will be announced on Tuesday, October 30, 2007 during the Welcome Reception. Competitors will receive an overview packet at the Welcome Reception describing their challenge, which begins Thursday, November 1, 2007 at 9:00 AM EDT in the Competition Arena.</p>
                <p>Competitors will have one (1) day to complete and submit their final design. During the competition, competitors will also have a brief feedback period with the judges. Judges will give the competitors their initial impressions of the competitor's design. Competitors will have time to incorporate this feedback into their design as they work toward finalizing their submission.</p>
                <p>Finalists must use the workstation provided by TopCoder during the Championship round. This workstation will contain the following:</p>
                    <ul>
                        <li>A PC running Windows XP</li>
                        <li>Adobe Illustrator and Adobe Photoshop installed</li>
                        <li>The open-source graphic programs GIMP and InkScape</li>
                        <li>A sketchpad, pencils and pencil sharpener</li>
                        <li>Limited Internet access to the following sites only:</li>
                            <ol>
                                <li>iStockPhoto.com: Each finalist will have an account with $20 credit available for stock photos</li>
                                <li>ColorBlender.com</li>
                            </ol>
                        <li>Finalists may bring the following:</li>
                            <ol>
                                <li>Their own keyboard</li>
                                <li>Up to two (2) design reference books, such as color guides, typography references, etc. However, template books (or books containing any template ideas) may NOT be used.</li>
                            </ol>
                    </ul>
                <p>Competitors may not bring any other materials (including flash disks, magazines, or sketches). Keyboards must be given to the technical team at least one (1) hour before the Championship round begins and reference materials must be evaluated by TopCoder at least 30 minutes before the Championship round begins. TopCoder reserves the right, at any point in the Championship round, to confiscate any reference materials it deems inappropriate for any reason whatsoever. The winner of the SDC will be determined at the discretion of the Judges.</p>

                <a name="prizes"></a>
                <h2>About the Prizes</h2>
                <p>All competitors who submit designs that pass screening for at least two (2) SDC design contests during the online competition will receive a prize. The SDC will award a maximum of $30,000 in cash prizes. Any and all applicable taxes on prizes are the sole responsibility of the prizewinner.</p>
                <table cellpadding="0" cellspacing="0" class="stat" width="100%"> 
                    <tbody> 
                        <tr> 
                            <td class="title" colspan="2">Prizes*</td> 
                        </tr> 
                        <tr> 
                            <td class="header">Competitor(s)</td> 
                            <td class="header">Design Prize</td> 
                        </tr> 
                        <tr class="light"> 
                            <td class="value" style="font-weight:bold;">1st place finisher* in the Championship Round</td> 
                            <td class="value" style="font-weight:bold;">$15,000</td> 
                        </tr> 
                        <tr class="dark"> 
                            <td class="value">2nd place finisher* in the Championship Round</td> 
                            <td class="value">$7,200</td>
                        </tr> 
                        <tr class="light"> 
                            <td class="value">3rd place finisher* in the Championship Round</td> 
                            <td class="value">$3,600</td>
                        </tr> 
                        <tr class="dark"> 
                            <td class="value">4th place finisher* in the Championship Round</td> 
                            <td class="value">$1,800</td>
                        </tr> 
                        <tr class="light"> 
                            <td class="value">5th place finishers* in the Championship Round</td> 
                            <td class="value">$600</td>
                        </tr>
                        <tr class="dark"> 
                            <td class="value">6th place finishers* in the Championship Round</td> 
                            <td class="value">$600</td>
                        </tr> 
                        <tr class="light"> 
                            <td class="value">7th place finishers* in the Championship Round</td> 
                            <td class="value">$600</td>
                        </tr> 
                        <tr class="dark"> 
                            <td class="value">8th place finishers* in the Championship Round</td> 
                            <td class="value">$600</td>
                        </tr> 
                        <tr class="light"> 
                            <td class="value">Online participants who pass screening for at least two design contests</td> 
                            <td class="value">Limited edition 2007 TopCoder Open t-shirt</td>
                        </tr>
                        <tr class="dark"> 
                            <td class="value" colspan="2">*Prize will be awarded after the conclusion of the Championship Round. Winner must be present to receive prize.<br /><br />In addition to the prizes mentioned above, all onsite finalists will receive a one-day Disney Park Hopper pass to use at the event on Saturday, November 3, 2007.</td> 
                        </tr> 
                    </tbody> 
                </table>
                <br />
                <p>In order for onsite finalists to receive their cash prize, they must first complete all SDC-related work for all online rounds and the Championship Round.</p>
                
                <a name="conditions"></a>
                <h2>Conditions of Participation</h2>
                <p>By participating in the SDC and the Tournament, you agree to be bound by these rules and to all decisions of TopCoder, which are final, binding and conclusive in all matters. Also, by participating in the SDC and the Tournament, you consent to providing certain information to the title sponsor. Such information shall include the information contained in your TopCoder member profile, as well as your competition statistics.</p>
                <p><span class="bigRed">Competitors must not cheat. All ideas for code and/or challenge submitted must be the competitor's alone. TopCoder uses the word "cheat" to mean collaboration of any sort - including, but not limited to, working with another competitor, submitting code that was not fully authored by you, and using resources, software, etc. that are not allowed in TopCoder competitions. TopCoder reserves the right, in its sole discretion, to remove any competitor from the SDC and/or the Tournament whom it suspects has cheated.</span></p>
                <p>All decisions relating to the viability of submissions, the ranking of submissions and all other matters pertaining to the SDC and the Tournament are within the sole discretion of TopCoder and are final and binding in all respects.</p>
                <p>As a condition of participation in the SDC and the Tournament, all information provided by you in your TopCoder member profile must be accurate and up-to-date. TopCoder may require you to complete an additional registration form to register for the SDC and/or the Tournament. In order to be eligible to participate in the SDC, you must have completed any and all registration forms required by TopCoder.</p>
                <p>Competitors who advance to the onsite Championship Round must complete the following items and submit them to TopCoder by 5:00 PM EDT on Friday, September 28, 2007:</p>
                    <ul>
                        <li>Confirmation of attendance/proof of travel documents - Please email <a href="mailto:jdamato@topcoder.com?subject=Confirmation of Attendance/Proof of Travel Documents">Jessie D'Amato Ford</a> to confirm your attendance onsite. If you require a passport and/or visa to visit the United States, you must show proof of your documents via a scanned copy of the necessary documents.</li>
                        <li>Please submit a head shot by emailing <a href="mailto:memberphotos@topcoder.com">memberphotos@topcoder.com</a>, if we do not have one on file for you.</li>
                        <li>Please ensure your most up-to-date information is listed in your TopCoder profile in the event we need to mail your plane tickets or contact you via telephone.</li>
                        <li>Competitor Questionnaire - the questions and responses may be published in the 2007 TopCoder Collegiate Challenge program</li>
                        <li>Travel form - provides TopCoder with the appropriate travel information for your trip to the onsite tournament rounds</li>
                        <li>Affidavit of Eligibility and Liability and Publicity Release - TopCoder must receive the original copy of a notarized affidavit unless a notarized affidavit is already on file with TopCoder. The document must be postmarked by September 28, 2007, and must be sent in such a manner that it will arrive at TopCoder no later than October 26, 2007.</li>
                            <ol>
                                <li>If TopCoder already has a notarized affidavit and a tax form on file for a contestant, that contestant may affirm the affidavit online.</li>
                            </ol>
                        <li>Applicable tax form (unless one is already on file with TopCoder)</li>
                        <li>Letter from your college/university on official stationary that states you are/were a full time student between July 23, 2007 and November 3, 2007 OR a photocopy of your International Student Identity Card (ISIC) that shows you are/were a full time student between the dates July 23, 2007 and November 3, 2007 If sending a letter, it must be written in English and signed by an official university staff member. If sending a photocopy of your ISIC, it must list the name of your college or university. If the card is not in English, you must provide a translation to English with the photocopy. Necessary documents must be sent directly to TopCoder, Inc., Attn: Jessie D'Amato Ford, 703 Hebron Avenue, Glastonbury, CT, 06033, USA.</li>
                    </ul>
                <p>A competitors who fails to submit the above items on time will not advance to the onsite Championship round and will be replaced by  the competitor with the next highest cumulative placement points.</p>
                <p>All prizes (cash prizes and participatory prizes) will be sent within 60 days of the completion of the Championship Round. Unclaimed or undeliverable prizes will be forfeited. Competitors who do not submit the required information by the applicable deadlines forfeit their prizes.</p>
                <p>As a condition of winning and redeeming a cash prize, competitors will be required to submit a completed (i) Competitor Questionnaire, (ii) Affidavit of Eligibility and Liability and Publicity Release, (iii) IRS Form W-9 or W-8BEN, as appropriate if one is not already on file with TopCoder, and (iv) Travel Form. In completing the Affidavit of Eligibility and Liability and Publicity Release, a cash prize winner (a) confirms his/her eligibility, (b) represents and warrants that he/she has not cheated, (c) verifies the accuracy of the competitor's demographic information in the TopCoder member database, (d) authorizes TopCoder to publicize the SDC's results, (e) agrees to sign any applicable forms required by tax authorities, (f) licenses to TopCoder rights to all information submitted during the SDC and the Tournament (including rights to source code and other executables), and (g) releases TopCoder from liability arising out of any prize won. TopCoder requires competitors to complete the Form W-9 or W-8BEN for tax reporting purposes.</p>
                <p>By participating in the SDC and the Tournament and redeeming a prize, a competitor releases and agrees to hold harmless TopCoder, its affiliates, subsidiaries, advertising and promotion agencies, sponsors, and prize suppliers, and all of their respective directors, officers, employees, representatives and agents, from and against any and all liability for any loss, property damage or damage to person, including without limitation, death and injury, due in whole or in part, directly or indirectly, from or arising out of participation in the SDC and the Tournament, or participation in any SDC or Tournament-related activity, or the receipt, use or misuse of a prize. TopCoder specifically disclaims all liability associated with, and makes no warranties with regard to, any prize given.</p>
                <p>In addition, all prizewinners agree to cooperate with TopCoder's publicity efforts, without further compensation. This includes the agreement to use their name, handle, address (city and state) and likeness for publicity purposes, where legal, for this or similar events in the future, and to use the statements made by, or attributed to, the winners relating to TopCoder and any and all rights to said use, without further compensation. Furthermore, all prizewinners agree to promptly notify TopCoder if a third-party, including any SDC or Tournament sponsor, contacts the prizewinner regarding employment opportunities and/or media interest as a result of the prizewinner's participation in the SDC or the Tournament.</p>
                <p>TopCoder reserves the right, in its sole discretion, to revoke any and all privileges associated with competing in the SDC and the Tournament, and to take any other action it deems appropriate, for no reason or any reason whatsoever, including if TopCoder suspects competitors of cheating, tampering with the entry process, the operation of the Web site, or the competition process, or otherwise being in violation of the rules. TopCoder reserves the right to cancel, terminate or modify the SDC and/or the Tournament if it is not capable of completion as planned for any reason, including infection by computer virus, bugs, tampering, unauthorized intervention or technical failures of any sort, or for any other reason.</p>
                
                <h2>Other</h2>
                <p>The SDC and the Tournament are void in whole or in part where prohibited by law. A list of SDC and Tournament winners by handles will be available on the web site at <a href="/tc">http://www.topcoder.com/tc</a>, and will be displayed for at least 3 months after the completion of the SDC and the Tournament.</p>
                <p>The SDC and the Tournament are brought to you by TopCoder, Inc. (<a href="/">http://www.topcoder.com/</a>) 703 Hebron Avenue, Glastonbury, CT 06033.</p>


            </div>
            </div>
        <jsp:include page="../footer.jsp" />
    </div>
</div>

</body>

</html>