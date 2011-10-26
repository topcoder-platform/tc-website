<%@ taglib uri="studio.tld" prefix="studio" %>
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
   "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">

<head>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="description" content="Answers to questions on how to start competing in graphic and web design competitions at TopCoder Studio" />
    <meta name="keywords" content="topcoder, studio, graphic competitions, graphic design contests, graphic design, web design, logo, contests, compete, prizes, cash, clients" />
    <title>TopCoder Studio | Member Frequently Asked Questions</title>

     <jsp:include page="../style.jsp">
        <jsp:param name="key" value="tc_studio"/>
    </jsp:include>
    <script src="js/NewStyleHeaderFooter/jquery-1.2.6.min.js" type="text/javascript"></script>
    <script src="js/NewStyleHeaderFooter/jquery.hoverIntent.minified.js" type="text/javascript"></script>
    <script src="js/NewStyleHeaderFooter/scripts.js" type="text/javascript"></script>
    <script type="text/javascript" language="javascript">

    $(document).ready(function(){
    
    
        $("#nav ul li").hoverIntent(function(){
            $(this).children("ul").slideDown("fast");
        }, function() {
            $(this).children("ul").slideUp("fast");
        });
        
        $("#nav ul ul li").hover(function() {
            $(this).parents("#nav ul li").children('a').addClass("active-item");
        }, function() {
            $(this).parents("#nav ul li").children('a').removeClass("active-item");
        });
    
    
    });
    </script>
</head>

<body>
    <div id="page-wrap">
        <div align="center">
            <jsp:include page="../top.jsp">
                <jsp:param name="section" value="howitworks" />
            </jsp:include>
        <br />
        <!-- container -->
        <div id="container">
            <div id="wrapper">
    
            <!-- content -->
            <div id="content">
                <div class="contentTop">
                    <div class="contentMiddle">

                        
                        <div style="padding: 10px 0;">
                          <a href="${sessionInfo.servletPath}?module=Static&amp;d1=support&amp;d2=getStarted">Overview</a>
                        | <a href="${sessionInfo.servletPath}?module=Static&amp;d1=support&amp;d2=whyJoin">Why Join</a>
                        | <a href="${sessionInfo.servletPath}?module=Static&amp;d1=support&amp;d2=memberRefferalProgram">Member Referral Program</a>
                        | New Member FAQs
                        | <a href="${sessionInfo.servletPath}?module=Static&amp;d1=support&amp;d2=startingACompetition">Starting a Competition</a>
                        </div>
        
                        <h1>New Member FAQs</h1>
                        
                        <!-- Q1-->
                        <h3>Overview</h3>
                        <p>
                        <a href="#QA_1-1">What kind of competitions will I find here?</strong></a><br />
                        <a href="#QA_1-2">Who are the clients?</strong></a><br />
                        <a href="#QA_1-3">How much are the prize purses?</strong></a><br />
                        <a href="#QA_1-4">Is it true that you hold live tournaments?</strong></a><br />
                        <a href="#QA_1-5">Are there other benefits to competing in Studio?</a>
                        </p>
                        
                        <!-- Q2-->
                        <h3>How to Compete</h3>
                        <p>
                        <a href="#QA_2-1">Where do I register?</strong></a><br />
                        <a href="#QA_2-2">OK, I am registered. How do I compete?</strong></a><br />
                        <a href="#QA_2-3">What if I have questions while I am creating my design?</strong></a><br />
                        <a href="#QA_2-4">I'm ready to submit! How do I do that?</strong></a><br />
                        <a href="#QA_2-5">I submitted my design. Now what happens?</strong></a><br />
                        <a href="#QA_2-6">Hey, I won! How do I get paid?</a>

                        </p>
                        
                        <!-- Q3-->
                        <h3>Assignment Questions</h3>
                        <p>
                        <a href="#QA_3-1">What is the Assignment Document?</strong></a><br />
                        <a href="#QA_3-2">Where is the Assignment Document?</strong></a><br />
                        <a href="#QA_3-3">Why does the Assignment Document  include my future winnings?</strong></a><br />
                        <a href="#QA_3-4">Do I have to sign the Assignment Document every time I compete?</strong></a><br />
                        <a href="#QA_3-5">What happens if I don't sign and return the Assignment Document?</strong></a><br />
                        <a href="#QA_3-6">How do I return the Assignment Document?</strong></a><br />
                        <a href="#QA_3-7">When do I have to return the Assignment Document?</a>
                        </p>
                        
                        <!-- Q4-->
                        <h3>Copyright Questions</h3>
                        <p>
                        <a href="#QA_4-1">Can I include stock art in my submission?</strong></a><br />
                        <a href="#QA_4-2">Can I include artwork or code that is free or open source?</strong></a><br />
                        <a href="#QA_4-3">Can I include screenshots or photos from the web as long as I somehow show that they are placeholders?</strong></a><br />
                        <a href="#QA_4-4">Can I include photos I've taken myself?</strong></a><br />
                        <a href="#QA_4-5">What should I do if I think my design might be failed for copyright issues?</strong></a><br />
                        <a href="#QA_4-6">What should I do if a client wants me to use screenshots or designs/artwork from the web?</a>
                        </p> 
                        
                        
                        <!-- Q5-->
                        <h3>Submission Formatting, Uploading and Screening Questions</h3>
                        <p>
                        <a href="#QA_5-1">How many submissions can I upload to a contest?</strong></a><br />
                        <a href="#QA_5-2">How many of my submissions will be considered for a contest?</strong></a><br />
                        <a href="#QA_5-3">When can I rank my submissions?</strong></a><br />
                        <a href="#QA_5-4">What happens if I don't rank my submissions?</strong></a><br />
                        <a href="#QA_5-5">I made changes to a submission I've already uploaded. Can I replace the old submission with my new submission?</strong></a><br />
                        <a href="#QA_5-6">Why is my submission screened?</strong></a><br />
                        <a href="#QA_5-7">Can I fix my submission if it fails screening?</strong></a><br />
                        <a href="#QA_5-8">When will final screening be complete?</strong></a><br />
                        <a href="#QA_5-9">What is included in my submission?</strong></a><br />
                        <a href="#QA_5-10">Why must I submit my source files with my submission?</strong></a><br />
                        <a href="#QA_5-11">Will my source files be shown on the Studio website?</strong></a><br />
                        <a href="#QA_5-12">What should I include in my Submission Zip file?</strong></a><br />
                        <a href="#QA_5-13">What should I include in my Source Zip file?</strong></a><br />
                        <a href="#QA_5-14">What should I include in my Preview Image?</strong></a><br />
                        <a href="#QA_5-15">When should I submit?</a>
                        </p>

                        <!-- Q6-->
                        <h3>Payment Questions</h3>
                        <p>
                        <a href="#QA_6-1">How do I get paid if I win?</strong></a><br />
                        <a href="#QA_6-2">When is my payment scheduled for processing?</strong></a><br />
                        <a href="#QA_6-3">When will I get paid?</strong></a><br />
                        <a href="#QA_6-4">What are the requirements for payment?</strong></a><br />
                        <a href="#QA_6-5">What are my options for receiving payments?</strong></a><br />
                        <a href="#QA_6-6">How can I check my payment status?</strong></a><br />
                        <a href="#QA_6-7">How do I contact you with payment questions?</a>
                        </p>
                        
                        <!-- Answers -->
                        
                        <!-- A1-->
                        <h3>Overview</h3>
                        <p>
                        <a name="QA_1-1"><strong>What kind of competitions will I find here?</strong></a><br />
                        Studio holds competitions for many areas of graphic design and web design/development. From logo contests, web design, print and apparel -  to Flash, Flex 3, JavaScript and widget design, you're sure to find an outlet for your creativity. Competitions are currently posted in two ways: 1) Studio-managed contests which are held by clients who use Studio information architects and other resources to manage their contests, and 2) TopCoder Direct-managed contests which are managed completely by clients.
                        </a></p>
                        <p>
                        <a name="QA_1-2"><strong>Who are the clients?</strong></a><br />
                        Clients range from Fortune 500 corporations who need new GUI for their applications to small businesses and start-ups looking for a new logo. Clients like AOL, ESPN, LendingTree, and GEICO regularly seek fresh ideas and unique concepts through Studio competitions.
                        </p>
                        <p>
                        <a name="QA_1-3"><strong>How much are the prize purses?</strong></a><br />
                        Prizes vary according to what the client wants to pay, the type of project and the amount of work involved. You'll see simple icon or banner contests listed for a couple hundred dollars, while prototypes and widget builds may go for a couple of thousand dollars. High profile contests can go for even more!
                        </p>
                        <p>
                        <a name="QA_1-4"><strong>Is it true that you hold live tournaments?</strong></a><br />
                        Yes. TopCoder holds an annual on-site tournament in the spring/summer. Studio is just one of the "tracks" at this large tournament. During the first few months of the year, Studio holds online rounds that allow designers a chance to qualify for the finals. During the 2008 TopCoder Open, twelve Studio finalists competed during the week of May 12, 2008 in Las Vegas for a total prize purse of $45,000. The champion won the grand prize of $20,000. <a href="http://www.topcoder.com/tc?module=Static&d1=tournaments&d2=tco08&d3=studio&d4=summary"> See more details about TCO08 here</a>.
                        </p>
                        <p>
                        <a name="QA_1-5"><strong>Are there other benefits to competing in Studio?</strong></a><br />
                        In addition to the prize purse that is awarded for each competition, competitors also have the chance to earn Studio Cup points. The Studio cup is a monthly bonus prize pool that is distributed to the top performers in any given month. Along with bonus money, the winner each month wins a free trip to the 2009 TopCoder Open in Las Vegas. <a href="http://studio.topcoder.com/?module=Static&d1=digitalrun&d2=2008v2&d3=home">Learn more about the Studio Cup here</a>. 
                        </p>
                        
                        <!-- A2-->
                        <h3>How to Compete</h3>
                        <p>
                        <a name="QA_2-1"><strong>Where do I register?</strong></a><br />
                        Studio is part of <a href="http://topcoder.com">TopCoder, Inc.</a> All registrations for TopCoder and Studio go through the same portal, so when you get to the registration screen, it's important to check the Studio box as the type of registration you want when you become a TopCoder member.
                        </p>
                        <p>
                        <a name="QA_2-2"><strong>OK, I am registered. How do I compete?</strong></a><br />
                        Any visitor to Studio can view contest details. However, in order to compete, you must be a TopCoder member and you must do the following:<br />
                        Register for the contest you wish to enter. In order to view and download any supporting documentation for a contest, you must register for that specific contest. Registering does not mean you are obligated to compete.
                        Sign and return your Assignment Document. All members must complete and return a standard assignment document before competing for the first time. You only need to do this once. <a href="#QA_3-1">More information about the assignment document can be found here</a>.
                        </p>
                        <p>
                        <a name="QA_2-3"><strong>What if I have questions while I am creating my design?</strong></a><br />
                        Each contest has detailed information within the contest details that you should follow. If you can't find your answers there, you can visit that contest's forum and ask questions. Your fellow members, Studio admins and the client will do their best to help clarify anything you need.
                        </p>
                        <p>
                        <a name="QA_2-4"><strong>I'm ready to submit! How do I do that?</strong></a><br />
                        Studio competitions require all members to upload both their submission files (the files we display on the Studio site and present to the client) and their source files (the files that are transferred to the client only if you win a prize). The current system requires you to submit three files (preview image, submission files and source files)  [You can find more information about how to format your submission here]. (link to submission area of this FAQS)
                        </p>
                        <p>
                        <a name="QA_2-5"><strong>I submitted my design. Now what happens?</strong></a><br />
                        All designs go through an initial screening phase. Submissions are screened against any requirements the client has specified and any copyright infringement or cheating. You will receive an email notification about your submission's status once it has been screened. If you submit early enough in a contest, and your submission fails screening, you have the opportunity to resubmit before the contest ends. Once final screening is completed, the client can make their winner selection(s).
                        </p>
                        <p>
                        <a name="QA_2-6"><strong>Hey, I won! How do I get paid?</strong></a><br />
                        In order to get paid, you must submit an IRS tax form. You will also choose how you would like to get paid (wire transfer, check or PayPal). All contest payments are scheduled and posted to your Payments page on TopCoder within 7 days of winning a contest. Your payment is then sent the following month, [within the schedule outlined at the bottom of this linked help file]. (link to payment schedule table in this FAQS)
                        </p>
                        
                        <!-- A3-->
                        <h3>Assignment Questions</h3>
                        <p>
                        <a name="QA_3-1"><strong>What is the Assignment Document?</strong></a><br />
                        This document is simply a confirmation of a member's agreement to transfer ownership of a winning entry to TopCoder, so that the member may receive payment for their work. 
                        The Assignment Document does NOT assign any entries for which you are not compensated, and you still retain the ownership of such entries. 
                        There is, however, a license included in the Assignment Document that allows TopCoder to display any/all of your submissions on the web site, in order that the client(s) may view submissions and select winners. 
                        </p>
                        <p>
                        <a name="QA_3-2"><strong>Where is the Assignment Document?</strong></a><br />
                         <a href="http://www.topcoder.com/wiki/download/attachments/22249776/TopCoder+Competition+Assignment+ver2.0.pdf"> Download the Assignment Document</a><br />
                         <a href="mailto:payments@topcoder.com"> Email us the Assignment Document</a><br />
                         <a href="http://studio.topcoder.com/?module=AssignmentDocumentHistory" target="_blank">Check your Assignment Document status</a>
                        </p>
                        <p>
                        <a name="QA_3-3"><strong>Why does the Assignment Document also include my future winning entries?</strong></a><br />
                        We have set up the Assignment Document to cover future entries for two reasons. First, having the Assignment Document cover future entries reduces the amount of paperwork for members and TopCoder. Second, it also relieves members from having to go through this process for each contest. 
                        </p>
                        <p>
                        <a name="QA_3-4"><strong>Do I have to sign the Assignment Document every time I compete?</strong></a><br />
                        No. You are only required to sign and return the Assignment Document the first time you compete. 
                        </p>
                        <p>
                        <a name="QA_3-5"><strong>What happens if I don't sign and return the Assignment Document?</strong></a><br />
                        You will not be able to participate in Studio competitions and/or upload your work to the Studio website.
                        </p>
                        <p>
                        <a name="QA_3-6"><strong>How do I return the Assignment Document?</strong></a><br />
                        Each individual member's Assignment Document must be completed in full. Then, either a legible scan or photo taken and sent in via one of these three methods:<br />
                        1) As an email attachment to: <a href="mailto:payments@topcoder.com">payments@topcoder.com</a><br />
                        2) By post/mail to: <br />
                        TopCoder, Inc., Attn: Payments <br />
                        95 Glastonbury Blvd<br />
                        Glastonbury, CT 06033 <br />
                        3) By fax to: (US) +1 (860) 371.2165 <br />
                        Note: no cover sheet necessary. 
                        </p>
                        <p>
                        <a name="QA_3-7"><strong>When do I have to return the Assignment Document?</strong></a><br />
                        You should sign and return the Assignment Document immediately after registering for your first Studio contest. We must receive and process your signed Assignment Document before you will be able to upload any work to the Studio website. It can take up to one full business day to process your Assignment Document. See the processing timeline table (below) to determine when you should send your Assignment Document.
                        Also, you may send your Assignment Document to us even before your register for a competition.
                        </p>
                        <div align="center">
                    <div class="statHolder" style="width: 400px;">
                        <div class="NE"><img src="/i/v2/stat_tableNE.png" alt="" /></div>
                        <div class="NW"><img src="/i/v2/stat_tableNW.png" alt="" /></div>
                            <table class="stat" cellpadding="0" cellspacing="0">
                            <tbody>
                                <tr><td class="title" colspan="4">Assignment Processing Schedule</td></tr>

                                <tr>
                                    <td class="headerW"><div>&nbsp;</div></td>
                                    <td class="header" width="50%"><strong>If we receive your Assignment on:</strong></td>
                                    <td class="header" width="50%"><strong>It will be processed on:</strong></td>
                                    <td class="headerE"><div>&nbsp;</div></td>
                                </tr>
                                
                                <tr><td class="space" colspan="2">&nbsp;</td></tr>
                                <tr class="light">

                                    <td class="valueW"><div>&nbsp;</div></td>
                                    <td class="value">Monday by 3:00 pm ET</td>
                                    <td class="value">Tuesday by 5:00 pm ET</td>
                            
                                    <td class="valueE"><div>&nbsp;</div></td>
                                </tr>
                                
                                <tr><td class="space" colspan="2">&nbsp;</td></tr>
                                <tr class="light">
                                    <td class="valueW"><div>&nbsp;</div></td>

                                    <td class="value">Tuesday by 3:00 pm ET</td>
                                    <td class="value">Wednesday by 5:00 pm ET</td>
                            
                                    <td class="valueE"><div>&nbsp;</div></td>
                                </tr>
                                
                                <tr><td class="space" colspan="2">&nbsp;</td></tr>
                                <tr class="light">
                                    <td class="valueW"><div>&nbsp;</div></td>
                                    <td class="value">Wednesday by 3:00 pm ET</td>

                                    <td class="value">Thursday by 5:00 pm ET</td>
                                    <td class="valueE"><div>&nbsp;</div></td>
                                </tr>
                                
                                <tr><td class="space" colspan="2">&nbsp;</td></tr>
                                <tr class="dark">
                                    <td class="valueW"><div>&nbsp;</div></td>
                            
                                    <td class="value">Thursday by 3:00 pm ET</td>
                                    <td class="value">Friday by 5:00 pm ET</td>

                                    <td class="valueE"><div>&nbsp;</div></td>
                                </tr>
                                <tr><td class="space" colspan="2">&nbsp;</td></tr>
                                <tr class="light">
                                    <td class="valueW"><div>&nbsp;</div></td>
                                    <td class="value">Friday by 3:00 pm ET</td>
                                    <td class="value">Monday by 5:00 pm ET</td>
                                    <td class="valueE"><div>&nbsp;</div></td>

                                </tr>
                                
                                <tr><td class="space" colspan="2">&nbsp;</td></tr>
                                <tr class="dark">
                                    <td class="valueW"><div>&nbsp;</div></td>
                            
                                    <td class="value">Saturday by 3:00 pm ET</td>
                                    <td class="value">Monday by 5:00 pm ET</td>
                                    <td class="valueE"><div>&nbsp;</div></td>
                                </tr>

                                 <tr><td class="space" colspan="2">&nbsp;</td></tr>
                                <tr class="light">
                                    <td class="valueW"><div>&nbsp;</div></td>
                                    <td class="value">Sunday by 3:00 pm ET</td>
                                    <td class="value">Monday by 5:00 pm ET</td>
                                    <td class="valueE"><div>&nbsp;</div></td>
                                </tr>
                                
                            </tbody>

                            </table>
                        <div class="SE"><img src="/i/v2/stat_tableSE.png" alt="" /></div>
                        <div class="SW"><img src="/i/v2/stat_tableSW.png" alt="" /></div>
                    </div>
                </div>
                <div>
                <p><strong>NOTE:</strong><br />
                Dates are based on the TopCoder, Inc. yearly calendar. Please check the forums for your contest if the contest falls during US Holidays.</strong>

                </p>
                </div>
                <div>
                <p><strong>Example:</strong><br />
                If the contest you wish to submit to ends on Tuesday at 2:00 pm ET. You will need to submit your Assignment no later than Sunday at 3:00 pm ET in order to ensure it is processed before Tuesday at 2:00 pm ET.
                <strong>Remember: You only need to do this ONE time to participate in all Studio contests.</strong>
                </p>
                </div>
                        
                        <!-- A4-->
                        <h3>Copyright Questions</h3>
                        <p>
                        <a name="QA_4-1"><strong>Can I include stock art in my submission?</strong></a><br />
                        Your submission cannot contain any stock art unless the contest details specifically allow it. The majority of contests on Studio only allow you to submit designs that you have created yourself. Please be sure you understand the Terms and check each contest for more information about copyright issues before you submit. 
                        </p>
                        <p>
                        <a name="QA_4-2"><strong>Can I include artwork or code that is free or open source?</strong></a><br />
                        Your submission cannot contain any artwork or code that is labeled "free" or is in the public domain unless the contest specifically allows it. 
                        </p>
                        <p>
                        <a name="QA_4-3"><strong>Can I include screenshots or photos from the web as long as I somehow show that they are placeholders?</strong></a><br />
                        You should never "grab" screenshots or photos from the web or stock art sites to use as placeholders. You can, however, use images the client provides for that contest. Otherwise, please create your own placeholder images.
                        </p>
                        <p>
                        <a name="QA_4-4"><strong>Can I include photos I have taken myself?</strong></a><br />
                        Yes, as long as you are not violating any licensing laws with regard to photo releases (taking photos of people and selling/distributing them without their knowledge and written consent, taking photos of objects or places that have restrictions on photography, etc.)
                        </p>
                        <p>
                        <a name="QA_4-5"><strong>What should I do if I think my design might be failed for copyright issues?</strong></a><br />
                        If you are concerned that your submission will fail, you should explain your concerns in the contest forum and/or send an email to the Studio admins. When it doubt, read the contest details again and look for any restrictions or allowances for copyrighted materials. Most contests will only allow you to submit designs you have created yourself.
                        </p>
                        <p>
                        <a name="QA_4-6"><strong>What should I do if a client wants me to use screenshots or designs/artwork from the web?</strong></a><br />
                        If a client provides the images, you are free to use them. If, however, a client asks you to take images from the web that you or the client do not own, you should contact Studio admins so that we can help the client revise their requirements.
                        </p>
                                                
                        <!-- A5-->    
                        <h3>Submission Formatting, Uploading and Screening Questions</h3>
                        <p>
                        <a name="QA_5-1"><strong>How many submissions can I upload to a contest?</strong></a><br />
                        You may upload as many submissions as you like, however, each contest limits how many submissions from each member will be eligible for consideration by the client. (See next question). This is why you will rank your submissions as you upload them, or after you've uploaded. 
                        </p>
                        <p>
                        <a name="QA_5-2"><strong>How many of my submissions will be considered for a contest?</strong></a><br />
                        Each contest will outline how many of each member's submissions will be eligible to be considered for prizes. Most contests will limit the number of submissions that will be considered from each member. However, a few contests will have no such limit. It is very important to note how many of your submissions are eligible when you enter. 
                        </p>
                        <p>
                        <a name="QA_5-3"><strong>When can I rank my submissions?</strong></a><br />
                        You have the opportunity to rank your submissions when you upload them. You can change the rank of your submissions at any time before the submission phase ends. 
                        </p>
                        <p>
                        <a name="QA_5-4"><strong>What happens if I don't rank my submissions?</strong></a><br />
                        By default, your submissions will be ranked in reverse of the order in which they were uploaded. So, your most recent submission is assumed to be your most preferred. 
                        </p>
                        <p>
                        <a name="QA_5-5"><strong>I made changes to a submission I've already uploaded. Can I replace the old submission with my new submission?</strong></a><br />
                        Yes. When you upload your new submission, you will be able to view all of your previous submissions. Just remove the old submission and rank your new submission accordingly. 
                        </p>
                        <p>
                        <a name="QA_5-6"><strong>Why is my submission screened?</strong></a><br />
                        The screening process is in place to ensure that all submissions meet the specification's minimum requirements (if there are any listed) and to identify submissions with copyright infringement problems or submitters who are cheating. 
                        </p>
                        <p>
                        <a name="QA_5-7"><strong>Can I fix my submission if it fails screening?</strong></a><br />
                        - Before the submission deadline: Yes. If you submit early enough in the contest, your submission is likely to get screened before the submission deadline. If your submission fails, you have the opportunity to fix problems and resubmit.
                        - After the deadline: No. A failed submission cannot be revised and reconsidered for a contest after the deadline. All screening decisions are final. Studio encourages you to submit as early as possible so that you can fix any problems if your submission fails screening before the contest deadline.
                        </p>
                        <p>
                        <a name="QA_5-8"><strong>When will final screening be complete?</strong></a><br />
                        The majority of contests go through a final screening by Studio admins within 12 hours after the submission phase deadline. 
                        </p>
                        <p>
                        <a name="QA_5-9"><strong>What is included in my submission?</strong></a><br />
                        Your entire contest submission will include three elements: <br />
                        Your display submission file(s): The file(s) you include in this Zip file will be displayed on the Studio site. The client will see everything within this Zip file and will base their winner choices on what they see here.
                        <br />Your final source file(s): The file(s) you include in this Zip file will never be displayed on the Studio site. This Zip file is only transferred to the client if your submission receives a prize placement.
                        <br />Your preview image: The file you choose here represents your entire submission and is the first thing a client sees when evaluating your submission. It is turned into a thumbnail and displayed on the Studio site. Some contests have specific requirements for Preview images - please be sure to read the contest specification thoroughly.
                        </p>
                        
                        <p>
                        Here is how the upload form appears on the Studio site:<br><img src="/i/v2/submission_process.jpg" alt="Submission Process" />
                        </p>
                        <p>
                        <a name="QA_5-1O"><strong>Why must I submit my source files with my submission?</strong></a><br />
                        When a client chooses a winner, Studio transfers the source files to the client. Source files are only released from the submissions that have won a prize placement. 
                        </p>
                        <p>
                        <a name="QA_5-11"><strong>Will my source files be shown on the Studio web site?</strong></a><br />
                        No. When you submit to a contest, your source files are not shown on the Studio web site. We only show your submission files. If your submission wins a prize placement, the IP rights of your source files will transfer to the client.  
                        </p>
                        <p>
                        <a name="QA_5-12"><strong>What should I include in my Submission Zip file?</strong></a><br />
                         <img src="/i/v2/sub_process1.gif" alt="Submission Zip File" /> <br />
                        Your submission Zip file will be created based on the information you find on the Contest Details page. 
                        </p>
                        <p>
                        Here are some examples: 
                        <strong>XYZ Logo Contest</strong><br />
                        One (1) JPG or PNG file containing your logo design.<br />
                        <strong>XYZ Web Design Storyboard Contest</strong><br />
                        Five (5) JPG or PNG files showing each screen of your design.<br />
                        <strong>XYZ Application Prototype Contest</strong><br />
                        Fifteen (15) HTML files showing each screen of your design, along with your CSS file, JavaScript file(s), and all image files, structured in the correct directory hierarchy in a Zip file. 
                        </p>
                        <p>
                        <a name="QA_5-13"><strong>What should I include in my Source Zip file?</strong></a><br />
                        <img src="/i/v2/sub_process2.gif" alt="Source Zip File" /><br />
                        Your source Zip file will be created based on the information you find on the Contest Details page. 
                        Here are some examples: 
                        <strong>XYZ Logo Contest</strong><br />
                        All vector files of the submitted logo design, created as IA files and/or EPS files. All fonts used (with the exception of Windows standard fonts) in your design must also be submitted in this zip. If you do not have permission to release the fonts, you must provide a text file including the name of the font and a link to where the font can be purchased.
                        <strong>XYZ Web Design Storyboard Contest</strong><br /> 
                        All original source files of the submitted design. Files should be created in Adobe Photoshop, Gimp, Adobe Illustrator or Inkscape and saved as layered PSD files, AI or EPS files.
                        </p>
                        <p>
                        All fonts used (with the exception of Windows standard fonts) in your design must also be submitted in this zip. If you do not have permission to release the fonts, you must provide a text file including the name of the font and a link to where the font can be purchased.
                        <strong>XYZ Application Prototype Contest</strong><br />
                        Same as "submission" folder PLUS any additional files for new graphics created. New files should be created in Adobe Photoshop, Gimp, Adobe Illustrator or Inkscape and saved as layered PSD files, AI or EPS files. All fonts used (with the exception of Windows standard fonts) in your design must also be submitted in this zip. If you do not have permission to release the fonts, you must provide a text file including the name of the font and a link to where the font can be purchased.
                        </p>
                        <p>
                        <a name="QA_5-14"><strong>What should be included in my Preview Image?</strong></a><br />
                         <img src="/i/v2/sub_process3.gif" alt="Preview Image" /><br />
                        Your preview image can be one of your JPG files from your submission files if the contest is graphical, or it can be a screenshot of one of the pages/screens your have programmed in coding contests. Some contests have specific requirements for Preview images - please be sure to read the contest specification thoroughly.
                        </p>
                        <p>
                        <a name="QA_5-15"><strong>When should I submit?</strong></a><br />
                        Because some internet connections are slow, and some source files are very large, we recommend uploading a "test" submission 24 hours before the contest ends. This will allow you to understand how long it will take your submission to be accepted. Once you've finalized your design, you can replace your test submission with your final one.
                        </p>
                        
                        <!-- A6-->    
                        <h3>Payment Questions</h3>
                        <p>
                        <a name="QA_6-1"><strong>How do I get paid if I win?</strong></a><br />
                        At the conclusion of each contest, after the client has made winner selections, the Contest Administrator will notify winners via email with instructions on how to get paid. This notification will arrive within 7 days of winner designation. 
                        </p>
                        <p>
                        <a name="QA_6-2"><strong>When is my payment scheduled for processing?</strong></a><br />

                        TopCoder begins the payment process for Studio contests one business day after the final files for the contest have been delivered by the winner(s). 
                        </p>
                        <p>
                        <a name="QA_6-2"><strong>When will I get paid?</strong></a><br />
                        Payments of $25.00 or more are distributed on the 15th day of the following month. For example: a payment earned between January 1st and January 31st will be released on February 15. 
                        </p>
                        <p>
                        Note: Release dates are based on the TopCoder, Inc. yearly calendar. If the 15th falls on a U.S. Holiday, payment may be delayed until the following non-holiday business day.
                        </p>
                        

                    </div>                
                    <div class="contentBottom"></div>
                </div>
            </div>
        </div>

        <jsp:include page="../foot.jsp"/>


</body>
</html>
