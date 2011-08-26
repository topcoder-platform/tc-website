<%@ page import="com.topcoder.shared.dataAccess.DataAccessConstants" %>
<%@ page import="com.topcoder.web.ejb.pacts.assignmentdocuments.AssignmentDocumentStatus" %>
<%@ page import="com.topcoder.web.studio.controller.request.mystudio.AssignmentDocumentHistory" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer" %>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set value="<%=AssignmentDocumentHistory.DEFAULTS_KEY%>" var="defaults"/>
<c:set value="<%=DataAccessConstants.START_RANK%>" var="startRank"/>
<c:set value="<%=DataAccessConstants.END_RANK%>" var="endRank"/>

<c:set var="PENDING_STATUS_ID" value="<%= AssignmentDocumentStatus.PENDING_STATUS_ID + "" %>" />
<c:set var="AFFIRMED_STATUS_ID" value="<%= AssignmentDocumentStatus.AFFIRMED_STATUS_ID + "" %>" />

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
    <script type="text/javascript" src="/js/popup.js"></script>

    <script type="text/javascript">
        var sr = <c:out value="${requestScope[defaults][startRank]}"/>;
        var er = <c:out value="${requestScope[defaults][endRank]}"/>;

        function next() {
            var myForm = document.f;
            myForm.<%=DataAccessConstants.START_RANK%>.value = er + 1;
            myForm.<%=DataAccessConstants.END_RANK%>.value = 2 * er - sr + 1;
            myForm.submit();
        }
        function previous() {
            var myForm = document.f;
            myForm.<%=DataAccessConstants.END_RANK%>.value = sr - 1;
            myForm.<%=DataAccessConstants.START_RANK%>.value = 2 * sr - er - 1;
            myForm.submit();
        }
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
                    <div class="contentMiddle"

                <div style="padding: 10px 0;">
                    <strong>Help Pages:</strong> <a href="${sessionInfo.servletPath}?module=Static&amp;d1=support&amp;d2=getStarted">Getting Started</a>
                    | Assignment FAQ
                    | <a href="${sessionInfo.servletPath}?module=Static&amp;d1=support&amp;d2=competitionFaq">Competition FAQs</a>
                    | <a href="${sessionInfo.servletPath}?module=Static&amp;d1=support&amp;d2=formatSubmission">Formatting Your Submission</a>
                    | <a href="${sessionInfo.servletPath}?module=Static&amp;d1=support&amp;d2=generalFaq">General FAQs</a>
                </div>
                
                 <h1>Assignment Document FAQ</h1>
                
                <div>
                <p><strong>What is the Assignment?</strong></p>
                <p><The Assignmentis a document by which you confirm that you transfer your rights in a winning entry to TopCoder, Inc. The Assignment documents your assignment of all rights in all of your winning entries, if any, in exchange for the applicable prize. 
                </p><p>The Assignment does NOT assign any entries for which you are not compensated, and you still retain the ownership of such entries. 
                </p><p>There is, however, a license included in the Assignment Document that allows TopCoder to display any/all of your submissions on the web site, in order that the client(s) may view submissions and select winners.
                </p>
                <p><strong>Links to download the Assignment document, send in the assignment document and check the status of your Assignment document can be found at the bottom of this page.</strong></p>
                </div>
                <div>
                <p><strong>Why do I need to sign the Assignment?</strong></p>
                <p>This document is simply a confirmation of a member's agreement to transfer ownership of a winning entry to TopCoder, so that the member may receive payment for their work.
                </p>
                </div>
                
                <div>
                <p><strong>Why does the Assignment also include my future winning entries?</strong></p>
                <p>We have set up the assignment to cover future entries for two reasons. First, having the Assignment cover future entries reduces the amount of paperwork for members and TopCoder. Second, it also relieves members from having to go through this process for each contest.
                </p>
                </div>
                
                <div>
                <p><strong>Do I have to sign the Assignment every time I compete?</strong></p>
                <p>No. You are only required to sign and return the assignment the first time you compete. 
                </p>
                </div>
                
                <div>
                <p><strong>What happens if I don't sign and return the Assignment?</strong></p>
                <p>You will not be able to participate in Studio competitions and/or upload your work to the Studio website.</p>
                </div>
                
                <div>
                <p><strong>How do I return the Assignment Document?</strong></p>
                <p>Each individual member's assignment document must be completed in full. Then, either a legible scan or photo taken and sent in via one of these three methods:</p>
                <p><strong>1) As an email attachment to:</strong> <a href="mailto:payments@topcoder.com">payments@topcoder.com</a></p>
                <p><strong>2) By post/mail to: </strong><br />
                    TopCoder, Inc., Attn: Payments, <br />
                    95 Glastonbury Blvd, <br />
                    Glastonbury, CT 06033 </p>
                <p><strong>3)    By fax to:</strong>
                      (US) +1 (860) 371.2165 <br />
                          (Note: no cover sheet necessary). 
                          </p>
                </div>
                
                <div>
                <p><strong>When do I have to return the Assignment Document?</strong></p>
                <p>You should sign and return the Assignment document immediately after registering for your first Studio contest. We must receive and process your signed Assignment Document before you will be able to upload any work to the Studio website. It can take up to one full business day to process your Assignment Document. See the processing timeline table (below) to determine when you should send your Assignment document.</p>
                <p>Also, you may send your Assignment to us even before your register for a competition - you may download the Assignment doc and send it using the links at the bottom of this page.
                </div>
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
                
                
                <div>
                <p>
                    <a target="_blank" href="http://www.topcoder.com/wiki/download/attachments/22249776/TopCoder+Competition+Assignment+ver2.0.pdf">Download the Assignment document</a>
                    <br /><a href="mailto:payments@topcoder.com">Email us the Assignment document</a>
                    <br /><a href="${sessionInfo.servletPath}?module=AssignmentDocumentHistory">Check your Assignment document status</a>
                </p>
                </div>

                        <br clear="all"/>
                    </div>                
                    <div class="contentBottom"></div>
                </div>
            </div>
        </div>

        <jsp:include page="../foot.jsp"/>


</body>
</html>
