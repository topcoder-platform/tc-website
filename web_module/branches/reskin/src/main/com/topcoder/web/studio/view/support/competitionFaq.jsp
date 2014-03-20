<%@ taglib uri="studio.tld" prefix="studio" %>
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
   "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">

<head>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>TopCoder Studio</title>

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
                    <strong>Help Pages:</strong> <a href="${sessionInfo.servletPath}?module=Static&amp;d1=support&amp;d2=getStarted">Getting Started</a>
                    | <a href="${sessionInfo.servletPath}?module=Static&amp;d1=support&amp;d2=assignmentDocFaq">Assignment FAQ</a>
                    | Competition FAQs
                    | <a href="${sessionInfo.servletPath}?module=Static&amp;d1=support&amp;d2=formatSubmission">Formatting Your Submission</a>
                    | <a href="${sessionInfo.servletPath}?module=Static&amp;d1=support&amp;d2=generalFaq">General FAQs</a>
                </div>

                <h1>Competition FAQs</h1>

                <h3>Why can't I download the supporting documentation in a challenge?</h3>
                There are two steps you must take before you can access all of a challenge's files: 
                <ol>
                <li><strong>You must be a registered Studio member.</strong> You can register with
                Studio by clicking any of the <a href="https://www.topcoder.com/reg/">Register Now</a>
                links on this site. If you already have a TopCoder handle, you must <a href="http://www.topcoder.com/reg/?nrg=false">login</a> update your profile by opting in for Studio membership.</li>
                <li><strong>You must register for the challenge you wish to enter.</strong> Each challenge has its own registration. Once you've registered for a challenge, the files associated with the challenge will become accessible to you.</li>
                </ol>
                
                <h3>What if I don't understand something about the challenge?</h3>
                If you are confused about a requirement, template or any other aspect of a challenge, please post your question in the forums so that everyone may benefit from the answer. The Studio challenge Administrator and your fellow Studio members will help clarify things.
                <br /><br />

                <h3>What should I include with my submission?</h3>
                
                For all Studio challenges, you must include both your submission file(s) and your source files. Everything is zipped up and submitted together. See <a href="/?module=Static&amp;d1=support&amp;d2=formatSubmission">formatting your submission</a> for more information.
                <br /><br />

                <h3>Why must I submit my source files with my submission?</h3>
                When a client chooses a winner, Studio transfers the source files to the client. Source files are only released from the submissions that have won a prize placement.  
                <br /><br />

                <h3>Will my source files be shown on the Studio web site?</h3>
                No. Source files are never shown on the Studio web site, whether that submission has won a prize placement or not.  
                <br /><br />
          
                <h3>How many submissions can I upload to a challenge?</h3>
                You may upload as many submissions as you like, however, each challenge limits how many submissions from each member will be eligible for consideration by the client. (see next question)
                <br /><br />
                
                <h3>How many of my submissions will be considered for a challenge?</h3>
                Each challenge will outline how many of each member's submissions will be eligible to be considered for prizes. Most challenges will limit the number of submissions that will be considered from each member. However, a few challenges will have no such limit. It is very important to note how many of your submissions are eligible when you enter.
                <br /><br />
                
                <h3>How many of my submissions will be screened after the submission phase is over?</h3>
                Only the allowed number of submissions per member specified in the challenge will be screened. For example, if a challenge will only allow 2 submissions per member, and you upload 4 submissions, only the 2 submissions you've ranked the highest will be screened.
                <br /><br />

                <h3>Will my lower-ranking submissions be eligible if my highest-ranking submissions fail screening?</h3>
                No. Once the challenge submission phase is over, only the number of submissions allowed for the challenge will be eligible to be screened. No other submissions will take their place if they fail screening.
                <br /><br />
                
                <h3>When can I rank my submissions?</h3>
                You have the opportunity to rank your submissions when you upload them. You can change the rank of your submissions at any time before the submission phase ends. 
                <br /><br />
                
                <h3>What happens if I don't rank my submissions?</h3>
                By default, your submissions will be ranked in reverse of the order in which they were uploaded.  So, your most recent submission is assumed to be your most preferred.
                <br /><br />
                
                <h3>I made changes to a submission I've already uploaded. Can I replace the old submission with my new submission?</h3>
                Yes. When you upload your new submission, you will be able to view all of your previous submissions. Just remove the old submission and rank your new submission accordingly.
                <br /><br />
                
                <h3>When will screening be complete?</h3>
                The majority of challenges are screened by Studio admins within 24 hours of the submission phase deadline.   
                <br /><br />
                
                <h3>Can I fix my submission if it fails screening?</h3>
                No. A failed submission cannot be revised and reconsidered for a challenge. All screening decisions are final. The screening process is in place to ensure that all submissions meet the specification's minimum requirements. In order to pass screening, it is important to double-check your submissions against the required elements of the challenge.
                <br /><br />
 
                <h3>How do I get paid if I win?</h3>
                At the conclusion of each challenge, after the submissions have been screened and the client has made winner selections, the challenge Administrator will notify winners via email with instructions on how to get paid. TopCoder begins the payment process for Studio challenges one business day after the final files for the challenge have been delivered by the winner(s).  
                <br /><br />
                
                <strong>Timing</strong><br />
                Payments of $25.00 or more are distributed on or before the 15th day of the following month. For example: a payments earned between July 29 (after Noon EDT) and August 25 (before Noon EDT) will be sent out on or before September 15.
                <br /><br />
                
                
                Payments will be issued on the following dates for 2008:
                <br /><br />
                
                <div align="center">
                    <div class="statHolder" style="width: 500px;">
                        <div class="NE"><img src="/i/v2/stat_tableNE.png" alt="" /></div>
                        <div class="NW"><img src="/i/v2/stat_tableNW.png" alt="" /></div>
                            <table class="stat" cellpadding="0" cellspacing="0">
                            <tbody>
                                <tr><td class="title" colspan="4">2008 Payment Schedule</td></tr>
                                <tr>
                                    <td class="headerW"><div>&nbsp;</div></td>
                                    <td class="header" width="50%"><strong>Earned</strong></td>
                                    <td class="header" width="50%"><strong>Paid **</strong></td>
                                    <td class="headerE"><div>&nbsp;</div></td>
                                </tr>
                                
                                <tr><td class="space" colspan="2">&nbsp;</td></tr>
                                <tr class="light">
                                    <td class="valueW"><div>&nbsp;</div></td>
                                    <td class="value">12:00 NOON on Monday July 28th<br />- 12:00 NOON on Monday Aug. 25th</td>
                                    <td class="value">September 15, 2008</td>
                                    <td class="valueE"><div>&nbsp;</div></td>
                                </tr>
                                
                                <tr><td class="space" colspan="2">&nbsp;</td></tr>
                                <tr class="dark">
                                    <td class="valueW"><div>&nbsp;</div></td>
                                    <td class="value">12:00 NOON on Monday Aug. 25th<br />- 12:00 NOON on Monday Sept. 29th</td>
                                    <td class="value">October 15, 2008</td>
                                    <td class="valueE"><div>&nbsp;</div></td>
                                </tr>
                                
                                <tr><td class="space" colspan="2">&nbsp;</td></tr>
                                <tr class="light">
                                    <td class="valueW"><div>&nbsp;</div></td>
                                    <td class="value">12:00 NOON on Monday Sept. 29th<br />- 12:00 NOON on Monday Oct. 27th</td>
                                    <td class="value">November 15, 2008</td>
                                    <td class="valueE"><div>&nbsp;</div></td>
                                </tr>
                                
                                <tr><td class="space" colspan="2">&nbsp;</td></tr>
                                <tr class="dark">
                                    <td class="valueW"><div>&nbsp;</div></td>
                                    <td class="value">12:00 NOON, Monday Oct. 27th<br />- 12:00 NOON, Monday Nov. 24th</td>
                                    <td class="value">December 15, 2008</td>
                                    <td class="valueE"><div>&nbsp;</div></td>
                                </tr>
                                
                                <tr><td class="space" colspan="2">&nbsp;</td></tr>
                                <tr class="light">
                                    <td class="valueW"><div>&nbsp;</div></td>
                                    <td class="value">12:00 NOON on Monday Nov. 24th<br />- 12:00 NOON, Monday Dec. 29th</td>
                                    <td class="value">January 15, 2009</td>
                                    <td class="valueE"><div>&nbsp;</div></td>
                                </tr>
                                
                                <tr><td class="space" colspan="2">&nbsp;</td></tr>
                                <tr class="dark">
                                    <td class="valueW"><div>&nbsp;</div></td>
                                    <td class="value" colspan="2">** Note: Deadlines are 12:00 NOON EDT/EST on each date, above. The date when you actually receive your payment will depend on the payment method you select.</td>
                                    <td class="valueE"><div>&nbsp;</div></td>
                                </tr>
                                
                            </tbody>
                            </table>
                        <div class="SE"><img src="/i/v2/stat_tableSE.png" alt="" /></div>
                        <div class="SW"><img src="/i/v2/stat_tableSW.png" alt="" /></div>
                    </div>
                </div>
                <br /><br />
                
                    <h3>Requirements for Payment</h3>
                    <ol>
                    <li>Your source files have been reviewed for completeness and transferred to the client</li>
                    <li>You have completed and sign an IRS tax form - either W-9 or W-8BEN, depending on where you live and your U.S. resident status. Members will only be required to submit this document once.
                    <ul>
                        <li><a href="/pdfs/forms/fw9.pdf">W-9 Form</a></li>
                        <li><a href="/pdfs/forms/iw9.pdf">W-9 Instructions</a></li>
                        <li><a href="/pdfs/forms/fw8ben.pdf">W-8BEN Form</a></li>
                        <li><a href="/pdfs/forms/iw8ben.pdf">W-8BEN Instructions</a></li>
                    </ul>
                    </li>
                    </ol>
                Once these requirements are satisfied, payment will be sent. You have the option of choosing to receive
                payment either via check using the U.S. Postal Service to the address in your profile, via PayPal or via
                wire transfer. Any questions regarding prize payments and requests for payment type should be directed to
                <a href="mailto:payments@topcoder.com">payments@topcoder.com</a>.
                <br /><br />
           
                <h3>Will Studio challenges affect my TopCoder Rating?</h3>
                No. Studio is independent of TopCoder ratings and statistics. Winning Studio challenges will not improve
                your TopCoder standings.
                <br /><br />

     
                <h3>More questions?</h3>
                Questions about the process can be directed to <a href="mailto:studioadmin@topcoder.com">studioadmin@topcoder.com</a>.
                    <br />Questions about the payments and document processing can be directed to <a href="mailto:payments@topcoder.com">payments@topcoder.com</a>.



                        <br clear="all"/>
                    </div>                
                    <div class="contentBottom"></div>
                </div>
            </div>
        </div>

        <jsp:include page="../foot.jsp"/>


</body>
</html>
