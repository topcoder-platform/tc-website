<%@ taglib uri="studio.tld" prefix="studio" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
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
                    
                    <h1>Getting Started</h1>
                    
                    <div style="float: right; text-align: left; margin: 0px 0px 10px 10px;">
                        Getting Started
                        <br /><a href="${sessionInfo.servletPath}?module=Static&amp;d1=support&amp;d2=generalFaq">General FAQs</a>
                        <br /><a href="${sessionInfo.servletPath}?module=Static&amp;d1=support&amp;d2=competitionFaq">Competition FAQs</a>
                        <br /><a href="${sessionInfo.servletPath}?module=Static&amp;d1=support&amp;d2=formatSubmission">Formatting Your Submission</a>
                        <br /><a href="${sessionInfo.servletPath}?module=Static&amp;d1=support&amp;d2=assignmentDocFaq">Assignment FAQ</a>
                    </div>
            
                    <h3>Creative and exciting projects that pay off big.</h3>
                    TopCoder Studio is the meeting place for clients who need creative work done and creative
                    people looking to compete for that work. Here's how it happens:
                    <br /><br />
                    
                    <div style="float:left; margin: 0px 6px 4px 0px;">
                    <img src="/i/layout/step1.gif" alt="Step 1"/>
                    </div>
                    
                    <strong>Client contacts TopCoder Studio with project:</strong>
                    Companies who are in need of creative work for their website or product line contact
                    TopCoder Studio with their project requirements and timelines. TopCoder Studio works with them to
                    gather the necessary information and documentation, as well as to ensure that the project fits
                    our competition model.
                    <br /><br />
                    
                    <div style="float:left; margin: 0px 6px 4px 0px;">
                    <img src="/i/layout/step2.gif" alt="Step 2"/>
                    </div>
                    <strong>TopCoder Studio posts project as a new contest:</strong>
                    Once the project documentation has been completed by the client and formatted appropriately by
                    TopCoder Studio, it is posted on the <a href="${sessionInfo.servletPath}?module=ViewActiveContests">Contests page</a>.
                    All TopCoder Studio members will be alerted via email when new contests are posted.
                    <br /><br />
                    
                    <div style="float:left; margin: 0px 6px 4px 0px;">
                    <img src="/i/layout/step3.gif" alt="Step 3"/>
                    </div>
                    <strong>Browse through the posted contests:</strong>
                    Anyone interested in participating in TopCoder Studio can read through the Contests page - no
                    prior registration is necessary. If there is a contest that you think a friend, co-worker or
                    fellow creative type might be interested in, send them a link to the
                    <a href="${sessionInfo.servletPath}?module=ViewActiveContests">Contests page</a>.
                    <br /><br />
                    
                    <div style="float:left; margin: 0px 6px 4px 0px;">
                    <img src="/i/layout/step4.gif" alt="Step 4"/>
                    
                    </div>
                    <strong>Registered TopCoder Studio members can download the full Project Specifications:</strong>
                    In order to participate in Studio contests, you must be a registered TopCoder Studio member. <a href="https://www.topcoder.com/reg/">Registration is free and easy.</a> Registered Studio members can then register for individual contests on the corresponding Contest Details pages. Contest registration gives members access to download the files associated with the contest, including the Spec Doc
                    <br /><br />
                    
                    <div style="float:left; margin: 0px 6px 4px 0px;">
                    <img src="/i/layout/step5.gif" alt="Step 5"/>
                    
                    </div>
                    <strong>Registered TopCoder Studio members submit a one-time assignment document:</strong>
                    In order to submit to any Studio contest, members must have signed and returned an assignment document. This only needs to be completed once. <a href="/?module=Static&d1=support&d2=assignmentDocFaq">Read more about the assignment document.</a>
                    <br /><br />
                    
                    <div style="float:left; margin: 0px 6px 4px 0px;">
                    <img src="/i/layout/step6.gif" alt="Step 6"/>
                    </div>
                    
                    <strong>Registered TopCoder Studio members can submit their work:</strong>
                    Once you've read through a contest's details, it's time to work on your submission. Designs can be submitted from the Contest Details page and must conform to the requirements. Members can submit more than one concept for each competition, but can only submit one concept at a time. Most contests limit how many submissions will be considered from each member. That submission limit is shown on the Contest Details page.
                    <br /><br />
                    
                    <div style="float:left; margin: 0px 6px 4px 0px;">
                    <img src="/i/layout/step7.gif" alt="Step 7"/>
                    </div>
                    <strong>Submissions are screened:</strong>
                    At the end of a contest's submission phase, the Contest Administrator will screen each submission to ensure that the project's specifications are met. Participants will be notified via email if their submission passes or fails. 
                    <br /><br />
                    
                    <div style="float:left; margin: 0px 6px 4px 0px;">
                    <img src="/i/layout/step8.gif" alt="Step 8"/>
                    </div>
                    <strong>Submissions that pass screening are sent to Client:</strong>
                    All submissions that pass screening (i.e., conform to the project specifications) will be sent to the client for review.
                    <br /><br />
                    
                    <div style="float:left; margin: 0px 6px 4px 0px;">
                    <img src="/i/layout/step9.gif" alt="Step 9"/>
                    </div>
                    
                    <strong>Client selection prizes are awarded:</strong>
                    The client reviews all passing submissions and chooses a winner (or winners) solely at their discretion.  Source files from the winning submissions are delivered to the client.
                    <br /><br />
                    
                    <div style="float:left; margin: 0px 6px 4px 0px;">
                    <img src="/i/layout/step10.gif" alt="Step 10"/>
                    </div>
                    <strong>Winner is compensated for their work:</strong>
                    Winners of the contest are notified via email. In order for winners to be compensated for their work, their source files must match the requirements detailed on the Contest Details. They must also sign the appropriate tax form. The payment will be distributed in one full installment once the final version of the winning submission has been downloaded by the client. Payment is released according to the payment schedule table found in the Competition FAQs.
                    <br /><br />
                    
                    Get started now by checking out the current <a href="${sessionInfo.servletPath}?module=ViewActiveContests">Contests</a>!
                    
                    <br /><br />
                    Questions about the process can be directed to <a href="mailto:studioadmin@topcoder.com">studioadmin@topcoder.com</a>.


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