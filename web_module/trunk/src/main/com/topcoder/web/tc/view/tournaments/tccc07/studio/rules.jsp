<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page import="com.topcoder.web.common.model.EventType" %>
<%@ page contentType="text/html;charset=utf-8" %> 
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>2007 TopCoder Collegiate Challenge - Computer Programming Tournament</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link type="image/x-icon" rel="shortcut icon" target="_blank" href="/i/favicon.ico"/>
    <link type="text/css" rel="stylesheet" target="_blank" href="/css/tournaments/tccc07.css"/>
    <link type="text/css" rel="stylesheet" target="_blank" href="/css/coders.css"/>
    <jsp:include page="../../script.jsp" />
</head>
<body>

<div align="center" style="background: transparent;">
    <div id="containAll">
    <div id="content">

        <jsp:include page="../nav.jsp" >
        <jsp:param name="tabLev1" value="<%=EventType.STUDIO_TOURNAMENT_ID%>"/>
        <jsp:param name="tabLev2" value="rules"/>
        <jsp:param name="tabLev3" value=""/>
        </jsp:include>

            <div id="pageBody">
                <h1><span>Studio Design Competition Official Rules and Regulations</span></h1>
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

                <p>The 2007 TopCoder Collegiate Challenge Studio Design Competition ("SDC") will take place between July 23 and November 2, 2007, and is part of the 2007 TopCoder Collegiate Challenge ("Tournament"). It will consist of seven (7) weeks of online competition and one (1) onsite final round, being the Championship Round. The prize purse for the SDC is $30,000 in cash. The eight (8) competitors with the highest cumulative placement scores at the conclusion of the online rounds of competition will advance to the onsite Championship Round, to be held at the Contemporary Resort at Walt Disney World in Orlando, Florida, USA on November 1, 2007.</p>
                
                <a name="eligibility"></a>
                <h2>Eligibility</h2>
                <p>TopCoder Studio members meeting the following criteria are eligible to compete in the SDC:</p>
                    <ul>
                        <li>Must be at least 18 years of age as of July 23, 2007; AND</li>
                        <li>Must currently be eligible for participation in TopCoder Studio projects (i.e. not suspended from TopCoder); AND</li>

                        <li>Must be matriculated full-time at an accredited college or university at some point between July 23, 2007 and November 3, 2007.</li>
                    </ul>
                <p>TopCoder Studio members who are 18 years of age or older as of July 23, 2007 are eligible to win cash prizes, unless otherwise prohibited. The SDC is void in the Quebec province of Canada, and elsewhere where prohibited by applicable law. Residents of Cuba, Iran, Iraq, North Korea, Sudan, or Syria are ineligible to receive cash prizes and are ineligible to attend the onsite final round of competition as competitors.</p>
                <p>Employees of TopCoder, Inc. and of all Tournament sponsors, regardless of commitment date as sponsor, including any companies involved in the production (including prize suppliers), implementation and distribution of the SDC or the Tournament and their advertising or promotion agencies, parent companies, service providers, agents, officers, subsidiaries or affiliates, or any other persons or entities directly associated with the SDC or the Tournament and members of the immediate families and/or persons living in the same household as such persons, are ineligible to participate in the SDC. If a competitor's employer signs up as a sponsor of the Tournament on or after July 23, 2007, then that competitor will be disqualified from participating further in the Tournament. TopCoder Studio members who are performing internships for any Tournament sponsor between July 23 and November 2, 2007 are also ineligible to participate.</p>
                <p>Those competitors who are eligible to compete in any of the four Tournament competitions will be permitted to participate in any/all of them online. However, in the event a competitor becomes a finalist in more than one competition and the onsite competition times overlap, the competitor must choose only one competition to participate in as a finalist by September 28, 2007.</p>
                
                <a name="registration"></a>
                <h2>Registration</h2>

                <p>Registration for the SDC will open at 9:00 AM EDT on Monday, July 23, 2007, and will close at 5:00 PM EDT on Friday, August 28, 2007. In order to be eligible to compete in the SDC, competitors must register separately for the SDC. There is no limit to the number of competitors in the tournament; however each competitor may only register once.</p>
                
                <a name="placement"></a>
                <h2>Placement Scoring</h2>
                <p>Studio contests that are eligible for points towards the SDC will be identified on the Studio website during the week of July 23, 2007. Scoring in the SDC is determined by the placement of the top seven (7) submissions in each eligible contest by an SDC competitor.</p>
                <p> A competitor's score is determined by the placement of each competitor's submissions. The placement of the competitor's submissions is determined by the score awarded for a particular design. For example, if 3 submissions were received for a contest and the scores were 93, 89, and 71, the competitor receiving the score of 93 would be in 1st place and would receive 17 points.</p>
                <p> Competitors must be registered for the SDC to be eligible for tournament placement points. Placement points will be awarded to SDC competitors in Studio contests that are part of the online SDC competition as follows: </p>
                <ul>
                  <li> 1st Place - 17 points </li>
                  <li> 2nd Place - 15 points </li>
                  <li> 3rd Place - 12 points </li>
                  <li> 4th Place - 10 points </li>
                  <li> 5th Place - 7 points </li>
                  <li> 6th Place - 5 points </li>
                  <li> 7th Place - 4 points </li>
                  <li>8th Place (and lower) - 0 points </li>
                </ul>
                
                <h2>Open Competition Explanation</h2>
                <p>Both Studio members who have not registered for the SDC and SDC-registered competitors will be allowed to enter any Studio design contest. 


Only SDC-registered competitors will earn placement points. Studio members who are not registered for the SDC will still earn traditional placement and prizes. Because of the mixed competitor pool, an example of tournament placement and points is provided here.</p>

 <table cellpadding="0" cellspacing="0" class="stat" width="100%"> 
      <tbody> 
       <tr>
                    <td class="header">Competitor Status</td>
                    <td class="header">Review Score</td>
                    <td class="header">Prize Placement</td>
                    <td class="header">Tournament Placement</td>
                    <td class="header">Tournament Points</td>
        </tr>
                  <tr class="light">
                    <td class="value">Non-SDC competitor</td>
                    <td class="valueC">98</td>
                    <td class="valueC">1st Place</td>
                    <td class="valueC">&nbsp;</td>
                    <td class="valueC">&nbsp;</td>
                  </tr>
                  <tr class="dark">
                    <td class="value">SDC competitor</td>
                    <td class="valueC">92</td>
                    <td class="valueC">2nd Place </td>
                    <td class="valueC">1st Place</td>
                    <td class="valueC">17</td>
                  </tr>
                  <tr class="light">
                    <td class="value">SDC competitor</td>
                    <td class="valueC">87</td>
                    <td class="valueC">3rd Place </td>
                    <td class="valueC">2nd Place </td>
                    <td class="valueC">15 </td>
                  </tr>
                  <tr class="dark">
                    <td class="value">Non-SDC competitor </td>
                    <td class="valueC">86 </td>
                    <td class="valueC">4th Place </td>
                    <td class="valueC">&nbsp; </td>
                    <td class="valueC">&nbsp; </td>
                  </tr>
                  <tr class="light">
                    <td class="value">Non-SDC competitor </td>
                    <td class="valueC">84 </td>
                    <td class="valueC">5th Place </td>
                    <td class="valueC">&nbsp; </td>
                    <td class="valueC">&nbsp; </td>
                  </tr>
                  <tr class="dark">
                    <td class="value">SDC competitor </td>
                    <td class="valueC">83 </td>
                    <td class="valueC">6th Place </td>
                    <td class="valueC">3rd Place </td>
                    <td class="valueC">12 </td>
                  </tr>
                  <tr class="light">
                    <td class="value">SDC competitor </td>
                    <td class="valueC">82 </td>
                    <td class="valueC">7th Place </td>
                    <td class="valueC">4th Place </td>
                    <td class="valueC">10</td>
                  </tr>
                  <tr class="dark">
                    <td class="value">SDC competitor</td>
                    <td class="valueC">80 </td>
                    <td class="valueC">8th Place </td>
                    <td class="valueC">5th Place </td>
                    <td class="valueC">7</td>
                  </tr>
                  <tr class="light">
                    <td class="valueC">Non-SDC competitor </td>
                    <td class="valueC">79 </td>
                    <td class="valueC">9th Place </td>
                    <td class="valueC">&nbsp; </td>
                    <td class="valueC">&nbsp;</td>
                  </tr>
                  <tr class="dark">
                    <td class="value">SDC competitor </td>
                    <td class="valueC">78 </td>
                    <td class="valueC">10th Place </td>
                    <td class="valueC">6th Place </td>
                    <td class="valueC">5 </td>
                  </tr>
                  <tr class="light">
                    <td class="value">SDC competitor </td>
                    <td class="valueC">76 </td>
                    <td class="valueC">11th Place</td>
                    <td class="valueC">7th Place </td>
                    <td class="valueC">4 </td>
                  </tr>
</table>
                <br />

                <a name="schedule"></a>
                <h2>Schedule</h2>
                <p>The Studio competitions will have seven (7) weeks of online competition and one (1) onsite Championship Round. Each competitor participating in an online round must submit his/her design submission for any contest by the submission deadline.</p>
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
                            <td class="value">9:00 AM</td> 
                            <td class="value">August 28, 2007</td> 
                            <td class="value">5:00 PM</td>
                        </tr> 
                        <tr class="dark"> 
                            <td class="value">Online Competition</td> 
                            <td class="value">July 23, 2007</td> 
                            <td class="value">9:00 AM</td> 
                            <td class="value">September 11, 2007</td>

                          <td class="value">6:00 PM</tr> 
                        <tr class="light"> 
                            <td class="value">Onsite Competition</td> 
                            <td class="value">November 1, 2007</td> 
                            <td class="value">9:00 AM</td> 
                            <td class="value">November 1, 2007</td>
                            <td class="value">5:00 PM</td>

                        </tr>
                    <tr class="dark"><td class="value" colspan="5">*Times listed in Eastern Daylight Time (UTC/GMT -4).</td></tr>

                    </tbody> 
                </table>
                <br />
                
                <a name="scoring"></a>
                <h2>Scoring and Advancing</h2>
                <p>During the seven (7) weeks of online competition, eligible competitors can submit designs for as many contests as they like. Submissions will be screened against the Spec Doc by the Contest Administrator and either passed or failed depending on whether all of the requirements of the Spec Doc are met. 


IMPORTANT: Screening will not take place during the submission phase and competitors will not have the opportunity to resubmit revisions to a failed submission.</p>
                <p>ALL SUBMISSIONS MUST BE RECEIVED ACCORDING TO THE SUBMISSION DEADLINE TO BE CONSIDERED A VIABLE ENTRY. THERE ARE NO EXCEPTIONS. There is no elimination of competitors during the online competition.</p>
                <p>After the submission phase for a contest is over, 


submissions will be screened and then moved into Online Review. Reviewers will score each passing submission and the final scores will determine placement.

The six (6) highest individual placement scores that each contestant receives for his/her submissions throughout the seven (7) weeks of competition will be added together for a cumulative placement score. If a competitor does not have at least six (6) placement scores, then the existing scores will be added for a cumulative placement score.  A maximum of eight (8) competitors with the highest cumulative placement scores will advance to the onsite Championship Round.</p>

                <p>Example:<br />
                Contestant enters three (3) SDC eligible contests during the online competition, earning the following placement scores:<br />
                Contest #1 - placement 2; placement score 15 <br />
                Contest #2 - placement 3; placement score 12 <br />
                Contest #3 - placement 3; placement score 12 </p>
                <p>Cumulative placement score: 15 + 12 + 12 = 39  </p>
                <p>In the event of a tie of cumulative placement score among the advancers to the Championship Round, the tie will be resolved in the following manner: </p>
                <ol>
                  <li> Highest cumulative review score of the lesser number of submissions used to develop the cumulative placement score for the tied competitors. </li>
                  <li> If a tie still remains, then the highest individual design score of the lesser number of submissions used to develop the cumulative placement score for the tied competitors. </li>
                  <li> If a tie still remains, then all tied competitors will advance to the onsite Championship Round. </li>
                </ol>
                    
                <p> For example: </p>
                  <p>Contestant #1 submits work in 7 SDC competitions, earning the following review and placement scores:</p>
                     <ul>           <li>Submission #1 - score 88.45; placement 2; placement score 15</li>
                                <li>Submission #2 - score 76.33; placement 6; placement score 5</li>
                                <li>Submission #3 - score 82.89; placement 3; placement score 12 </li>
                                <li> Submission #4 &ndash; score 90.34; placement 1; placement score 17 </li>
                                <li> Submission #5 &ndash; score 92.66; placement 2; placement score 15 </li>
                                <li> Submission #6 &ndash; score 77.28; placement 7; placement score 4 </li>
                                <li> Submission #7 &ndash; score 86.19; placement 5; placement score 7 </li></ul>
              
                 <p>Contestant #1's cumulative placement score:<br />
                  15 + 5 + 12 + 17 + 15 + 4 + 7 = 75 </p>
                 <p>Contestant #2 submits work in 5 SDC competitions, earning the following review and placement scores:</p>
            <ul>  
                <li>Submission #1 - score 92.56; placement 2; placement score 15</li>
                <li>Submission #2 - score 80.83; placement 2; placement score 15 </li>
                <li>Submission #3 &ndash; score 88.65; placement 2; placement score 15 </li>
                <li> Submission #4 &ndash; score 81.99; placement 2; placement score 15 </li>
                <li> Submission #5 &ndash; score 95.62; placement 2; placement score 15 </li></ul>
                <p>Contestant #2's cumulative placement score:<br />
                15 + 15 + 15 + 15 + 15 = 75 </p>
                <p>To determine who advances to Championship round, TopCoder will look at the highest cumulative review score of the lesser number of submissions used to develop the cumulative placement score for the tied competitors. </p>
                <p> Contestant #1: 92.66 + 90.34 + 88.45 + 86.19 + 82.89 = 440.53<br>
  Contestant #2: 92.56 + 80.83 + 88.65 + 81.99 + 95.62 = 439.65</p>
                <p>In this example, Contestant #1 would advance to the Championship Round. </p>
                <h2>Onsite Championship Round</h2>

                <h3>Important Information</h3>
                <p style="font-weight:bold;">Travel Confirmation</p>
                <p>A maximum of eight (8) competitors from the seven (7) weeks of online competition will travel to the Contemporary Resort at Walt Disney World on Tuesday, October 30, 2007 to compete in the finals of the SDC held on Thursday, November 1, 2007. All competitors must arrive at the Contemporary Resort no later than 2:00 PM EDT on Tuesday, October 30, 2007.</p>
                <p>All competitors must confirm their attendance at the onsite Championship no later than 5:00 PM EDT (UTC/GMT -4) on Friday, September 28, 2007, and must have acquired any necessary travel visas and know for certain that they can travel to the United States.  If a competitor is required to travel from outside the United States, it is necessary for the competitor to show proof of a visa and/or passport by 5:00 PM EDT (UTC/GMT -4) on Friday, September 28, 2007. Competitors may email a copy of their documents to <a target="_blank" href="mailto:jford@topcoder.com?subject=Confirmation of Attendance/Proof of Travel Documents">Jessie D'Amato Ford</a>. Competitors who fail to meet this requirement will be replaced as an onsite finalist.</p>
                <p style="font-weight:bold;">Visa Assistance</p>
                <p>TopCoder will issue visa invitation letters at the request of international competitors who require one to obtain a travel visa to enter the United States. All competitors who have earned TCCC SDC placement points by September 7, 2007 will receive a request form to fill out if they require a letter. As soon as a competitor fills out the form in its entirety, their letter will be mailed. Competitors have until 5:00 PM EDT (GMT/UTC -4) on Friday, September 14, 2007 to request a letter. Visas can take a significant amount of time to obtain in certain countries; therefore, for those competitors who need a letter, it is in their best interest to request one well before the deadline. The cost of obtaining a visa is the sole responsibility of the competitor. Other than providing the visa invitation letter upon request, TopCoder will not assist competitors in the process of obtaining a travel visa. See more information about <a target="_blank" href="/tc?module=Static&d1=tournaments&d2=tccc07&d3=getVisa" alt="Get travel visas">travel visas</a>.</p>

                <p style="font-weight:bold;">Travel Details</p>
                <p>TopCoder will provide air travel arrangements for each competitor. The flight will be reserved by and paid for by TopCoder and will be for arrival on October 30, 2007 and departure on November 4, 2007. TopCoder will pay for each competitor's airfare up to $1,500, though we reserve the right to make exceptions to the maximum amount based on individual circumstances. Extended flights and/or hotel room nights requested by a competitor that result in additional costs will be the responsibility of the competitor.</p>
                <p>Ground transportation to and from the Orlando International Airport will be provided for each competitor by TopCoder via Disney Magical Express, as well as hotel accommodations and certain meals for each competitor. All other expenses are the responsibility of the competitor. TopCoder will not provide travel or lodging accommodations for guests of the competitor.</p>
                <p style="font-weight:bold;">Onsite Championship Round</p>
                <p>Each competitor will compete on the same design challenge, which will be announced on Tuesday, October 30, 2007 during the Welcome Reception. Competitors will receive an overview packet at the Welcome Reception describing their challenge, which begins Thursday, November 1, 2007 at 9:00 AM EDT in the Competition Arena.</p>
                <p>Competitors will have one (1) day to complete and submit their final design. During the competition, competitors will also have a brief feedback period with the critique panel. The panel will give the competitors their initial impressions of the competitor's design. Competitors will have time to incorporate this feedback into their design as they work toward finalizing their submission.</p>

                <p>Finalists must use the workstation provided by TopCoder during the Championship round. This workstation will contain the following:</p>
                    <ul>
                        <li>A PC running Windows XP</li>
                        <li>Adobe Illustrator and Adobe Photoshop installed</li>
                        <li>The open-source graphic programs GIMP and InkScape</li>
                        <li>A sketchpad, pencils and pencil sharpener</li>

                        <li>Limited Internet access to the following sites only:</li>
                            <ol>
                                <li>iStockPhoto.com: Each finalist will have an account with 26 credits available for stock photos</li>
                                <li>ColorBlender.com</li>
                                <li>TopCoder Studio </li>
                            </ol>
                        <li>Finalists may bring the following:</li>
                            <ol>

                                <li>Their own keyboard</li>
                                <li>Up to two (2) design reference books, such as color guides, typography references, etc. However, template books (or books containing any template ideas) may NOT be used.</li>
                            </ol>
                    </ul>
                <p>Competitors may not bring any other materials (including flash disks, magazines, or sketches). Keyboards must be given to the technical team at least one (1) hour before the Championship round begins and reference materials must be evaluated by TopCoder at least 30 minutes before the Championship round begins. TopCoder reserves the right, at any point in the Championship round, to confiscate any reference materials it deems inappropriate for any reason whatsoever. The winner of the SDC will be determined based on the scores received during the onsite review.</p>

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
                            <td class="value">Limited edition 2007 TopCoder Collegiate Challenge t-shirt</td>
                        </tr>
                        <tr class="dark"> 
                            <td class="value" colspan="2">*Prize will be awarded after the conclusion of the Championship Round. Winner must be present to receive prize. <br /><br />In addition to the prizes mentioned above, all onsite finalists will receive a one-day <a target="_blank" alt="Park Hopper option" target="_blank" href="<tc-webtag:linkTracking link='http://disneyworld.disney.go.com/wdw/tickets/ticketStore?categoryPass=RECOMMENDER&productPass=RECOMMENDER&country=USA' refer='TCCC07_whatToDo' />">Disney Park Hopper pass</a> to use at the event on Saturday, November 3, 2007.</td> 
                        </tr> 
                    </tbody> 
                </table>

                <br />
                <p>In order for onsite finalists to receive their cash prize, they must first complete all SDC-related work for all online rounds and the Championship Round.</p>
                
                <a name="conditions"></a>
                <h2>Conditions of Participation</h2>
                <p>By participating in the SDC and the Tournament, you agree to be bound by these rules and to all decisions of TopCoder, which are final, binding and conclusive in all matters. Also, by participating in the SDC and the Tournament, you consent to providing certain information to the title sponsor. Such information shall include the information contained in your TopCoder member profile, as well as your competition statistics.</p>
                <p><span class="bigRed">Competitors must not cheat. All ideas for designs and concepts submitted must be the competitor's alone. TopCoder uses the word "cheat" to mean collaboration of any sort - including, but not limited to, working with another competitor, submitting a design that was not fully authored by you, and using resources, software, etc. that are not allowed in TopCoder competitions. TopCoder reserves the right, in its sole discretion, to remove any competitor from the SDC and/or the Tournament whom it suspects has cheated.</span></p>
                <p>All decisions relating to the viability of submissions, the ranking of submissions and all other matters pertaining to the SDC and the Tournament are within the sole discretion of TopCoder and are final and binding in all respects.</p>

                <p>As a condition of participation in the SDC and the Tournament, all information provided by you in your TopCoder member profile must be accurate and up-to-date. TopCoder may require you to complete an additional registration form to register for the SDC and/or the Tournament. In order to be eligible to participate in the SDC, you must have completed any and all registration forms required by TopCoder.</p>
                <p>Competitors who advance to the onsite Championship Round must complete the following items and submit them to TopCoder by 5:00 PM EDT on Friday, September 28, 2007:</p>
                    <ul>
                        <li>Confirmation of attendance/proof of travel documents - Please email <a target="_blank" href="mailto:jdamato@topcoder.com?subject=Confirmation of Attendance/Proof of Travel Documents">Jessie D'Amato Ford</a> to confirm your attendance onsite. If you require a passport and/or visa to visit the United States, you must show proof of your documents via a scanned copy of the necessary documents.</li>
                        <li>Please <a target="_blank" href="/tc?module=UserStatic&amp;d1=my_home&amp;d2=submitPhoto">submit a photo</a>, if we do not have one on file for you.</li>

                        <li>Please ensure your most up-to-date information is listed in your TopCoder profile in the event we need to mail your plane tickets or contact you via telephone.</li>
                        <li>Competitor Questionnaire - the questions and responses may be published in the 2007 TopCoder Collegiate Challenge program</li>
                        <li>Travel form - provides TopCoder with the appropriate travel information for your trip to the onsite tournament rounds</li>
                        <li>Affidavit of Eligibility and Liability and Publicity Release - TopCoder must receive the original copy of a notarized affidavit unless a notarized affidavit is already on file with TopCoder. The document must be postmarked by September 28, 2007, and must be sent in such a manner that it will arrive at TopCoder no later than October 26, 2007.</li>
                            <ol>
                                <li>If TopCoder already has a notarized affidavit and a tax form on file for a contestant, that contestant may affirm the affidavit online.</li>

                            </ol>
                        <li>Applicable tax form (unless one is already on file with TopCoder)</li>
                        <li>Letter from your college/university on official stationary that states you are/were a full time student between July 23, 2007 and November 3, 2007 OR a photocopy of your International Student Identity Card (ISIC) that shows you are/were a full time student between the dates July 23, 2007 and November 3, 2007 If sending a letter, it must be written in English and signed by an official university staff member. If sending a photocopy of your ISIC, it must list the name of your college or university. If the card is not in English, you must provide a translation to English with the photocopy. Necessary documents must be sent directly to TopCoder, Inc., Attn: Jessie D'Amato Ford, 703 Hebron Avenue (now 95 Glastonbury Blvd), Glastonbury, CT, 06033, USA.</li>
                    </ul>
                <p>A competitors who fails to submit the above items on time will not advance to the onsite Championship round and will be replaced by  the competitor with the next highest cumulative placement points.</p>
                <p>All prizes (cash prizes and participatory prizes) will be sent within 60 days of the completion of the Championship Round. Unclaimed or undeliverable prizes will be forfeited. Competitors who do not submit the required information by the applicable deadlines forfeit their prizes.</p>
                <p>As a condition of winning and redeeming a cash prize, competitors will be required to submit a completed (i) Competitor Questionnaire, (ii) Affidavit of Eligibility and Liability and Publicity Release, (iii) IRS Form W-9 or W-8BEN, as appropriate if one is not already on file with TopCoder, and (iv) Travel Form. In completing the Affidavit of Eligibility and Liability and Publicity Release, a cash prize winner (a) confirms his/her eligibility, (b) represents and warrants that he/she has not cheated, (c) verifies the accuracy of the competitor's demographic information in the TopCoder member database, (d) authorizes TopCoder to publicize the SDC's results, (e) agrees to sign any applicable forms required by tax authorities, (f) licenses to TopCoder rights to all information submitted during the SDC and the Tournament (including rights to source code and other executables), and (g) releases TopCoder from liability arising out of any prize won. TopCoder requires competitors to complete the Form W-9 or W-8BEN for tax reporting purposes.</p>

                <p>By participating in the SDC and the Tournament and redeeming a prize, a competitor releases and agrees to hold harmless TopCoder, its affiliates, subsidiaries, advertising and promotion agencies, sponsors, and prize suppliers, and all of their respective directors, officers, employees, representatives and agents, from and against any and all liability for any loss, property damage or damage to person, including without limitation, death and injury, due in whole or in part, directly or indirectly, from or arising out of participation in the SDC and the Tournament, or participation in any SDC or Tournament-related activity, or the receipt, use or misuse of a prize. TopCoder specifically disclaims all liability associated with, and makes no warranties with regard to, any prize given.</p>
                <p>In addition, all prizewinners agree to cooperate with TopCoder's publicity efforts, without further compensation. This includes the agreement to use their name, handle, address (city and state) and likeness for publicity purposes, where legal, for this or similar events in the future, and to use the statements made by, or attributed to, the winners relating to TopCoder and any and all rights to said use, without further compensation. Furthermore, all prizewinners agree to promptly notify TopCoder if a third-party, including any SDC or Tournament sponsor, contacts the prizewinner regarding employment opportunities and/or media interest as a result of the prizewinner's participation in the SDC or the Tournament.</p>
                <p>TopCoder reserves the right, in its sole discretion, to revoke any and all privileges associated with competing in the SDC and the Tournament, and to take any other action it deems appropriate, for no reason or any reason whatsoever, including if TopCoder suspects competitors of cheating, tampering with the entry process, the operation of the Web site, or the competition process, or otherwise being in violation of the rules. TopCoder reserves the right to cancel, terminate or modify the SDC and/or the Tournament if it is not capable of completion as planned for any reason, including infection by computer virus, bugs, tampering, unauthorized intervention or technical failures of any sort, or for any other reason.</p>
                
                <h2>Other</h2>
                <p>The SDC and the Tournament are void in whole or in part where prohibited by law. A list of SDC and Tournament winners by handles will be available on the web site at <a target="_blank" href="/tc">http://www.topcoder.com/tc</a>, and will be displayed for at least 3 months after the completion of the SDC and the Tournament.</p>

                <p>The SDC and the Tournament are brought to you by TopCoder, Inc. (<a target="_blank" href="/">http://www.topcoder.com/</a>) 703 Hebron Avenue (now 95 Glastonbury Blvd), Glastonbury, CT 06033.</p>


            </div>
    </div>
    <jsp:include page="../footer.jsp" />
    </div>
</div>
</body>
</html>