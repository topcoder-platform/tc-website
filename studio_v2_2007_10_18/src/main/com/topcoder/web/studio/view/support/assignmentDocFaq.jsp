<%@ page import="com.topcoder.web.studio.controller.request.mystudio.AssignmentDocumentHistory" %>
<%@ page import="com.topcoder.web.ejb.pacts.assignmentdocuments.AssignmentDocumentStatus" %>
<%@ page import="com.topcoder.shared.dataAccess.DataAccessConstants" %>
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
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>TopCoder Studio</title>
    <jsp:include page="../style.jsp">
        <jsp:param name="key" value="tc_studio"/>
    </jsp:include>
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

                <h1>Assignment Documents FAQ</h1>

                <div>
                    <p><strong>What is the Assignment?</strong></p>
                    <p>The Assignment is a document by which you confirm that you transfer your rights in a winning entry to TopCoder, Inc.  The Assignment: (i) documents your assignment of all rights in all of your previous winning entries, if any, in exchange for the applicable prize; (ii) documents your assignment of all rights in your current winning entry in exchange for receiving the applicable prize; and (iii) establishes a procedure by which you will be able to easily confirm your assignment of rights in any <a href="#futurewinnings">future winning entry</a>.  The Assignment does NOT cover any entries for which you are not compensated, and you still retain the ownership of such entries.  TopCoder will require this written assignment document for all winning entries in competitions which start after June 18, 2007.</p>
                </div>
                <div>
                    <p><strong>For which competitions will the Assignment be required?</strong></p>
                    <p>The Assignment will be required in any competition in which you will be assigning your rights in the winning entry to TopCoder.  Generally speaking, the Assignment will be required in Component Design competitions, Component Development competitions, Application Assembly competitions, Testing competitions, and TopCoder Studio competitions, but not Algorithm competitions.  However, this is subject to change depending the rules and requirements of each competition.</p>
                </div>
                <div>
                    <p><strong>Why do I need to sign the Assignment?</strong></p>
                    <p>Moving forward, TopCoder's customers may begin to require written assignments from our members in order to increase their comfort level with our software development process.  This document is simply a confirmation of a member's agreement to transfer ownership of a winning entry to TopCoder.  It is important to note that nothing fundamental is changing, as assignment of ownership of winning entries has always been included in the terms for each competition.  The written assignment document is just a way to make this process more official moving forward.</p>
                </div>
                <div>
                    <p><strong>What happens if I don't sign and return the Assignment?</strong></p>
                    <p>When you initially agree to the terms of each competition, you also agree to assign ownership in the event that you win a prize.  If you don't sign and return the Assignment, you will be violating the rules of the competition to which you agreed and you will not receive your prize.  In addition, you will not be allowed to participate in future competitions until the situation is resolved.</p>
                </div>
                <div>
                    <p><strong>Do I have to sign the Assignment every time I win?</strong></p>
                    <p>No.  You are only required to sign and return the assignment the first time you win a competition which starts after June 18, 2007.  Once you have signed and returned the Assignment, the next time you win a competition you will be given the opportunity to confirm/ratify the terms of the Assignment online.  You only have to sign and return the Assignment once.</p>
                </div>
                <div>
                    <p><strong>How do I return the Assignment?</strong></p>
                    <p>Each individual member's first assignment must be signed and either (i) scanned as a PDF file and emailed to <a href="mailto:payments@topcoder.com?subject=Assignment Documents FAQ">payments@topcoder.com</a> or (ii) mailed to:  TopCoder, Inc., Attn: Payments, 703 Hebron Avenue, Glastonbury, CT 06033.  However, please keep in mind that we must actually receive the Assignment before the expiration of 30 days.</p>
                </div>
                <div>
                    <p><strong>How much time do I have to return the Assignment?</strong></p>
                    <p>You have 30 days from the date on which you were notified that you won to sign and return the Assignment.  We must <span style="text-decoration:underline;">receive</span> the signed Assignment before the expiration of 30 days.  Simply putting the Assignment in the mail is not sufficient.</p>
                </div>
                <div>
                    <p><strong>Why does the Assignment cover all of my past winning entries?</strong></p>
                    <p>We may use previous winning entries in developing software for a client.  Because these clients may request written proof that we own rights in the components used in the software, we need the assignment from all past and future winners.</p>
                </div>
                <div>
                    <p><strong><a name="futurewinnings">Why does the Assignment also include my future winning entries after on-line ratification/confirmation?</a></strong></p>
                    <p>We have set up the assignment to cover future entries for two reasons.  First, having the Assignment cover future entries reduces the amount of paperwork for members and TopCoder because members do not sign and return a paper Assignment after every win.  Second, the process of confirming/ratifying the Assignment on-line is in line with our current process and paperwork (i.e., notarized affidavit, tax forms, etc...).   We have included an electronic ratification/confirmation step to make sure that we clearly communicate with you about what is being assigned.</p>
                </div>
                <div>
                    <p><strong>What happens if I don't confirm/ratify the Assignment after winning in the future?</strong></p>
                    <p>As outlined above, when you agree to the terms of each competition, you also agree to assign ownership in the event that you win a prize.  If you don't confirm/ratify the Assignment, you will be violating the rules of the competition to which you agreed and you will not receive your prize.  In addition, you will not be allowed to participate in future competitions until the situation is resolved.  You have 3 days from the date on which you were notified that you won to confirm/ratify the Assignment.</p>
                </div>
                <div>
                    <p><strong>Does this mean I own my past winning entries?</strong></p>
                    <p>No.  Under the rules for each competition, you agreed to assign your rights in any previous winning entries by participating in the competition.  The Assignment is a confirmation of your assignment of those rights.</p>
                </div>
                <div>
                    <p><strong>I won a competition which started before June 18, 2007, do I need to sign the Assignment?</strong></p>
                    <p>No.  At this time, we are only requiring members who win competitions which start after June 18, 2007 to sign the Assignment.</p>
                </div>

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