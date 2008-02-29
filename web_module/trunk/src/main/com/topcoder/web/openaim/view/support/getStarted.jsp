<%@ taglib uri="openaim.tld" prefix="openaim" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
   "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>TopCoder OpenAIM</title>

    <jsp:include page="../style.jsp">
        <jsp:param name="key" value="tc_openaim"/>
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

                    <div class="linkBox"><openaim:forumLink forumID="3"/></div>
                    
                    <h1>Getting Started</h1>
                    
                    <div style="float: right; text-align: left; margin: 0px 0px 10px 10px;">
                        Getting Started
                        <br /><a href="${sessionInfo.servletPath}?module=Static&amp;d1=support&amp;d2=generalFaq">General FAQs</a>
                        <br /><a href="${sessionInfo.servletPath}?module=Static&amp;d1=support&amp;d2=competitionFaq">Competition FAQs</a>
                    </div>
            
                    <h3>Creative and exciting projects that pay off big.</h3>
                    TopCoder OpenAIM is the meeting place for clients who need creative work done and creative
                    people looking to compete for that work. Here's how it happens:
                    <br /><br />
                    
                    <div style="float:left; margin: 0px 6px 4px 0px;">
                    <img src="/i/layout/step1.gif" alt="Step 1"/>
                    </div>
                    
                    <strong>Client contacts TopCoder OpenAIM with project</strong>:
                    Companies who are in need of creative work for their website or product line contact
                    TopCoder OpenAIM with their project requirements and timelines. TopCoder OpenAIM works with them to
                    gather the necessary information and documentation, as well as to ensure that the project fits
                    our competition model.
                    <br /><br />
                    
                    <div style="float:left; margin: 0px 6px 4px 0px;">
                    <img src="/i/layout/step2.gif" alt="Step 2"/>
                    </div>
                    <strong>TopCoder OpenAIM posts project as a new contest</strong>:
                    Once the project documentation has been completed by the client and formatted appropriately by
                    TopCoder OpenAIM, it is posted on the <a href="${sessionInfo.servletPath}?module=ViewActiveContests">Contests page</a>.
                    All TopCoder OpenAIM members will be alerted via email when new contests are posted.
                    <br /><br />
                    
                    <div style="float:left; margin: 0px 6px 4px 0px;">
                    <img src="/i/layout/step3.gif" alt="Step 3"/>
                    </div>
                    <strong>Browse through the posted contests</strong>:
                    Anyone interested in participating in TopCoder OpenAIM can read through the Contests page - no
                    prior registration is necessary. If there is a contest that you think a friend, co-worker or
                    fellow creative type might be interested in, send them a link to the
                    <a href="${sessionInfo.servletPath}?module=ViewActiveContests">Contests page</a>.
                    <br /><br />
                    
                    <div style="float:left; margin: 0px 6px 4px 0px;">
                    <img src="/i/layout/step4.gif" alt="Step 4"/>
                    
                    </div>
                    <strong>Registered TopCoder OpenAIM members can download the full Project Specifications</strong>
                    :
                    In order to participate in OpenAIM contests, you must be a registered TopCoder
                    OpenAIM member. Registration is free and easy and can be completed
                    <a href="https://www.topcoder.com/reg/">here</a>. Registered OpenAIM members can then register for individual contests on the corresponding Contest Details pages. Contest registration gives members access to download the files associated with the contest, including the Spec Doc.
                    <br /><br />
                    
                    <div style="float:left; margin: 0px 6px 4px 0px;">
                    <img src="/i/layout/step5.gif" alt="Step 5"/>
                    </div>
                    
                    <strong>Registered TopCoder OpenAIM members can submit their work</strong>:
                    Once you've read through a Project's overview and specifications, it's time to work on your
                    submission. Designs can be submitted from the Contest Details page and must conform to the
                    requirements. Members can submit more than one concept for each competition, but can only submit one concept at
                    a time. Most contests limit how many submissions will be considered from each member. That submission limit is shown in the contest's Specification Document.
                    <br /><br />
                    
                    <div style="float:left; margin: 0px 6px 4px 0px;">
                    <img src="/i/layout/step6.gif" alt="Step 6"/>
                    </div>
                    <strong>Submissions are screened</strong>:
                    At the end of a contest's submission phase, the Contest Administrator will screen each submission to ensure that
                    the project's specifications are met. Participants will be notified via email if their
                    submission passes or fails. 
                    <br /><br />
                    
                    <div style="float:left; margin: 0px 6px 4px 0px;">
                    <img src="/i/layout/step7.gif" alt="Step 7"/>
                    </div>
                    <strong>Submissions that pass screening are sent to Online Review</strong>:
                    All submissions that pass screening (i.e., conform to the project specifications) will be sent
                    to a Review Board, which will score them. The highest scoring submission will win the contest.
                    <br /><br />
                    
                    <div style="float:left; margin: 0px 6px 4px 0px;">
                    <img src="/i/layout/step8.gif" alt="Step 8"/>
                    </div>
                    
                    <strong>A client selection prize is awarded</strong>:
                    Passing submissions and their scores are sent to the client. At this time, the client can choose to award a prize (or multiple prizes) for their selection. The client selection prize can be given to the OpenAIM contestant with the highest score, or to another competitor of the client's choosing. 
                    <br /><br />
                    
                    <div style="float:left; margin: 0px 6px 4px 0px;">
                    <img src="/i/layout/step9.gif" alt="Step 9"/>
                    </div>
                    <strong>Winner is compensated for their work</strong>:
                    Winners of the contest and the client selection prize(s) are notified via email. In order for winners to be compensated for their work, they must submit the required files or other deliverables detailed in the Specification Document. They must also sign an appropriate tax form. Once TopCoder OpenAIM receives the
                    required files, the winners will be paid the amount specified in the Project
                    Details.
                    <br /><br />
                    
                    Get started now by checking out the current <a href="${sessionInfo.servletPath}?module=ViewActiveContests">Contests</a>!
                    
                    <br /><br />
                    Questions about the process can be directed to <a href="mailto:openaimadmin@topcoder.com">openaimadmin@topcoder.com</a>.


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