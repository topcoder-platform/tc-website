<%@ page import="com.topcoder.shared.util.ApplicationServer" %>
<%@ taglib uri="studio.tld" prefix="studio" %>
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
   "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">

<head>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>TopCoder Studio</title>

    <jsp:include page="../style.jsp">
        <jsp:param name="key" value="tc_studio"/>
    </jsp:include>
</head>

<body>
    <!-- wrapper -->
    <div id="wrapper">
        <!-- header -->
        <div id="header">
            <jsp:include page="../top.jsp"/>
            <jsp:include page="../topNav.jsp">
                <jsp:param name="node" value="support"/>
            </jsp:include>
        </div>
        <!-- container -->
        <div id="container">
            <!-- content -->
            <div id="content">
                <div class="contentTop">
                    <div class="contentMiddle">

                <div class="linkBox"><studio:forumLink forumID="3"/></div>

                <h1>Competition FAQs</h1>
                
                <div style="float: right; text-align: left; margin-left: 10px;">
                    <a href="/?module=Static&amp;d1=support&amp;d2=getStarted">Getting Started</a>
                    <br /><a href="/?module=Static&amp;d1=support&amp;d2=generalFaq">General FAQs</a>
                    <br />Competition FAQs
                </div>

                <h3>Will Studio contests affect my TopCoder Rating?</h3>
                
                No. Studio is independent of TopCoder ratings and statistics. Winning Studio contests will not improve
                your TopCoder standings.
                <br /><br />
                
                <h3>Why can't I see the Contest Specifications?</h3>
                There are two steps you must take before you can see a contest's specification document. 
                <ol>
                <li> <strong>You must be a registered Studio member.</strong> You can register with
                Studio by clicking any of the <a href="https://www.topcoder.com/reg/">Register Now</a>
                links on this site. If you already have a TopCoder handle, you may <a href="http://www.topcoder.com/reg/?nrg=false">login</a> update your profile by opting in for Studio membership.</li>
                <li> <strong>You must register for the contest you wish to enter.</strong> Each contest has it's own registration. Once you've registered for a contest, the documentation and other files associated with the contest will become accessible to you.</li>
                </ol>
                
                <h3>What if I don't understand something in the Spec Doc?</h3>
                If you are confused about a required element in the Spec Doc, please post your question in the forums so that everyone may benefit from the answer. The Studio Contest Administrator and your fellow Studio members will help clarify things.
                <br /><br />
                
                <h3>How many submissions can I upload to a contest?</h3>
                
                You may upload as many submissions as you like.
                <br /><br />
                
                <h3>How many of my submissions will be considered for a contest?</h3>
                
                Each contest's Specification Document will outline how many of each member's submissions will be eligible to be considered for prizes. Most contests will limit the number of submissions that will be considered from each member. However, some contests will have no such limit. It is very important to note how many of your submissions are eligible when you read the Spec Doc.
                <br /><br />
                
                <h3>How many of my submissions will be screened after the submission phase is over?</h3>
                Only the allowed number of submissions specified in the Spec Doc will be screened. For example, if a contest will only allow 2 submissions per member, and you upload 4 submissions, only the 2 submissions ranked the highest (by you) will be screened.
                
                <br /><br />
                
                <h3>Will my lower-ranking submissions be eligible if my highest-ranking submissions fail screening?</h3>
                No. Once the contest submission phase is over, only the number of submissions allowed for the contest will be eligible to be screened. No other submissions will take their place if they fail screening.
                
                <br /><br />
                
                <h3>When can I rank my submissions?</h3>
                You have the opportunity to rank your submissions when you upload them. You can change the rank of your submissions at any time before the submission phase ends. 
                <br /><br />
                
                <h3>What happens if I don't rank my submissions?</h3>
                By default, your submissions will be ranked in reverse of the order in which they were uploaded.  So, your most recent submission is assumed to be your most preferred. <br /><br />
                
                <h3>I made changes to a submission I've already uploaded. Can I replace the old submission with my new submission?</h3>
                Yes. When you upload your new submission, you will be able to view all of your previous submissions. Just remove the old submission and rank your new submission accordingly.
                
                <br /><br />
                
                <h3>I submitted to a contest a few days ago and my submission still hasn't been screened. Why?</h3>
                In the past, the Contest Administrator screened submissions during the submission phase. The new screening process now happens after the submission phase is over. 
                <br /><br />
                
                <h3>Can I fix my submission if it fails screening?</h3>
                No. A failed submission cannot be revised and reconsidered for a contest. All screening decisions are final. The screening process is in place to ensure that all submissions that move into Online Review meet the specification's minimum requirements. In order to pass screening, it is important to double-check your submissions against the Required Elements in the Spec Doc.
                <br /><br />
                
                
                <h3>How do I get paid if I win?</h3>
                At the conclusion of each contest, after the passing submissions have been scored and after a client has made selections, the Contest Administrator will notify winners via email with instructions on how to get paid. TopCoder begins the payment process for Studio contests one business day after the final files for the contest have been delivered by the winner(s).  
                <br /><br />
                
                <strong>Timing</strong><br />
                Payments of $25.00 or more are distributed on or before the 15th day of the following month. For example: payments earned between November 1 and November 30 will be sent out on or before December 15.
                <br /><br />
                
                Payments will be issued on the following dates for 2007:
                <br /><br />
                
                <div align="center">
                    <div class="statHolder" style="width: 400px;">
                        <div class="NE"><img src="/i/v2/stat_tableNE.png" alt="" /></div>
                        <div class="NW"><img src="/i/v2/stat_tableNW.png" alt="" /></div>
                            <table class="stat" cellpadding="0" cellspacing="0">
                            <tbody>
                                <tr><td class="title" colspan="4">2007 Payment Schedule</td></tr>
                                <tr>
                                    <td class="headerW"><div>&nbsp;</div></td>
                                    <td class="header" width="50%"><strong>Earned</strong></td>
                                    <td class="header" width="50%"><strong>Paid **</strong></td>
                                    <td class="headerE"><div>&nbsp;</div></td>
                                </tr>
                                <%int i = 0;%>
                                <tr><td class="space" colspan="2">&nbsp;</td></tr>
                                <tr class="<%=(i%2==0 ? "light" : "dark")%>">
                                    <td class="valueW"><div>&nbsp;</div></td>
                                    <td class="value">January 1-30</td>
                                    <td class="value">February 15, 2007</td>
                            
                                    <td class="valueE"><div>&nbsp;</div></td>
                                </tr>
                                <%i++;%>
                                <tr><td class="space" colspan="2">&nbsp;</td></tr>
                                <tr class="<%=(i%2==0 ? "light" : "dark")%>">
                                    <td class="valueW"><div>&nbsp;</div></td>
                                    <td class="value">February 1-28</td>
                                    <td class="value">March 15, 2007</td>
                                    <td class="valueE"><div>&nbsp;</div></td>
                                </tr>
                                <%i++;%>
                                <tr><td class="space" colspan="2">&nbsp;</td></tr>
                                <tr class="<%=(i%2==0 ? "light" : "dark")%>">
                                    <td class="valueW"><div>&nbsp;</div></td>
                                    <td class="value">March 1-31</td>
                                    <td class="value">April 16, 2007</td>
                                    <td class="valueE"><div>&nbsp;</div></td>
                                </tr>
                                <%i++;%>
                                <tr><td class="space" colspan="2">&nbsp;</td></tr>
                                <tr class="<%=(i%2==0 ? "light" : "dark")%>">
                                    <td class="valueW"><div>&nbsp;</div></td>
                            
                                    <td class="value">April 1-30</td>
                                    <td class="value">May 15, 2007</td>
                                    <td class="valueE"><div>&nbsp;</div></td>
                                </tr>
                                <%i++;%>
                                <tr><td class="space" colspan="2">&nbsp;</td></tr>
                                <tr class="<%=(i%2==0 ? "light" : "dark")%>">
                                    <td class="valueW"><div>&nbsp;</div></td>
                                    <td class="value">May 1-31</td>
                            
                                    <td class="value">June 15, 2007</td>
                                    <td class="valueE"><div>&nbsp;</div></td>
                                </tr>
                                <%i++;%>
                                <tr><td class="space" colspan="2">&nbsp;</td></tr>
                                <tr class="<%=(i%2==0 ? "light" : "dark")%>">
                                    <td class="valueW"><div>&nbsp;</div></td>
                                    <td class="value">June 1-30</td>
                                    <td class="value">July 16, 2007</td>
                            
                                    <td class="valueE"><div>&nbsp;</div></td>
                                </tr>
                                <%i++;%>
                                <tr><td class="space" colspan="2">&nbsp;</td></tr>
                                <tr class="<%=(i%2==0 ? "light" : "dark")%>">
                                    <td class="valueW"><div>&nbsp;</div></td>
                                    <td class="value">July 1-31</td>
                                    <td class="value">August 15, 2007</td>
                                    <td class="valueE"><div>&nbsp;</div></td>
                                </tr>
                                <%i++;%>
                                <tr><td class="space" colspan="2">&nbsp;</td></tr>
                                <tr class="<%=(i%2==0 ? "light" : "dark")%>">
                                    <td class="valueW"><div>&nbsp;</div></td>
                                    <td class="value">August 1-31</td>
                                    <td class="value">September 14, 2007</td>
                                    <td class="valueE"><div>&nbsp;</div></td>
                                </tr>
                                <%i++;%>
                                <tr><td class="space" colspan="2">&nbsp;</td></tr>
                                <tr class="<%=(i%2==0 ? "light" : "dark")%>">
                                    <td class="valueW"><div>&nbsp;</div></td>
                            
                                    <td class="value">September 1-30</td>
                                    <td class="value">October 15, 2007</td>
                                    <td class="valueE"><div>&nbsp;</div></td>
                                </tr>
                                <%i++;%>
                                <tr><td class="space" colspan="2">&nbsp;</td></tr>
                                <tr class="<%=(i%2==0 ? "light" : "dark")%>">
                                    <td class="valueW"><div>&nbsp;</div></td>
                                    <td class="value">October 1-31</td>
                            
                                    <td class="value">November 15, 2007</td>
                                    <td class="valueE"><div>&nbsp;</div></td>
                                </tr>
                                <%i++;%>
                                <tr><td class="space" colspan="2">&nbsp;</td></tr>
                                <tr class="<%=(i%2==0 ? "light" : "dark")%>">
                                    <td class="valueW"><div>&nbsp;</div></td>
                                    <td class="value">November 1-30</td>
                                    <td class="value">December 14, 2007</td>
                            
                                    <td class="valueE"><div>&nbsp;</div></td>
                                </tr>
                                <%i++;%>
                                <tr><td class="space" colspan="2">&nbsp;</td></tr>
                                <tr class="<%=(i%2==0 ? "light" : "dark")%>">
                                    <td class="valueW"><div>&nbsp;</div></td>
                                    <td class="value">December 1-31</td>
                                    <td class="value">January 15, 2008</td>
                                    <td class="valueE"><div>&nbsp;</div></td>
                                </tr>
                                <%i++;%>
                                <tr><td class="space" colspan="2">&nbsp;</td></tr>
                                <tr class="<%=(i%2==0 ? "light" : "dark")%>">
                                    <td class="valueW"><div>&nbsp;</div></td>
                                    <td class="value" colspan="2">** Note: The date when you actually receive your payment will depend on the payment method you select.</td>
                                    <td class="valueE"><div>&nbsp;</div></td>
                                </tr>
                                <%i++;%>
                            </tbody>
                            </table>
                        <div class="SE"><img src="/i/v2/stat_tableSE.png" alt="" /></div>
                        <div class="SW"><img src="/i/v2/stat_tableSW.png" alt="" /></div>
                    </div>
                </div>
                <br /><br />
                
                There are three steps to getting paid:
                <ol>
                    <li>Submit the deliverables listed under the "Final Deliverables for Winner" heading on the contest
                        details page.</li>
                    <li> Complete and sign an Assignment Document. You will only need to complete and sign this document once; after TopCoder has received it, you will confirm/ratify the document each time you win a contest by clicking a checkbox when you upload your final files.</li>
                    <li>Complete and sign an IRS tax form - either W-9 or W-8BEN, depending on where you live and 
                        your U.S. resident status. Members will only be required to submit this document once.
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
                
                <h3>More questions?</h3>
                If you have more questions, please send them to <a href="mailto:studioadmin@topcoder.com">studioadmin@topcoder.com</a>.

                        <br clear="all"/>
                    </div>                
                    <div class="contentBottom"></div>
                </div>
            </div>
        </div>

        <jsp:include page="../foot.jsp"/>

    </div>
</body>
</html>