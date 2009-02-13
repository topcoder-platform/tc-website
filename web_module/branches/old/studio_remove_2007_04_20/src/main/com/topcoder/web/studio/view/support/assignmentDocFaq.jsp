<%@ page import="com.topcoder.web.studio.controller.request.mystudio.AssignmentDocumentHistory" %>
<%@ page import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer" %>
<%@ page import="com.topcoder.web.studio.Constants" %>
<%@ page import="com.topcoder.web.common.model.AssignmentDocumentStatus" %>
<%@ page import="com.topcoder.shared.dataAccess.DataAccessConstants" %>
<%@ page contentType="text/html;charset=utf-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
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

<html>
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

<div align="center">
<div id="contentOut" class="contentOut">
<jsp:include page="../top.jsp"/>
<jsp:include page="../topNav.jsp">
    <jsp:param name="node" value="myStudio"/>
</jsp:include>
<div id="contentIn" class="contentIn">
<img src="/i/layout/contentInN.gif" alt="" style="display:block;"/>

<div class="contentSpacer" style="padding-bottom:100px;">

<h1>What is an Assignment Document?</h1>

                <div style="width: 500px; padding: 5px; margin: 0px auto";>
                    <div>
                        <p><strong>1. What is the Assignment?</strong></p>
                        <p>ANSWER:  The Assignment is a document by which you confirm that you transfer your rights in a winning entry to TopCoder, Inc.  The Assignment has three purposes: (i) to confirm that you assigned all rights in all of your previous winning entries, if any; (ii) to confirm that you assign all rights in your current winning entry in exchange for receiving the applicable prize; and (iii) to establish a procedure by which you will be able to easily confirm that you assign rights in any future winning entry (for details on the Assignment as it relates to future winning entries, please see Question 8).  The Assignment does NOT cover any entries for which you are not compensated, and you still retain the ownership of such entries.</p>
                    </div>
                    <div>
                        <p><strong>2. Why do I need to sign the Assignment?</strong></p>
                        <p>ANSWER:  Our legal department has asked that we require this document for all winning entries beginning on ________________, 2007.  It has advised us that our clients may begin to require written assignments from our members in order to do business with us.  If you do not sign and return the Assignment you will face consequences including, but not limited to, not receiving your prize.</p>
                    </div>
                    <div>
                        <p><strong>3. What happens if I don't sign and return the Assignment?</strong></p>
                        <p>ANSWER:  If you don't sign and return the Assignment, you will not receive your prize.  In addition, TopCoder reserves the right to take additional steps including, but not limited to, restricting your participation in future competitions.</p>
                    </div>
                    <div>
                        <p><strong>4. How much time do I have to return the Assignment?</strong></p>
                        <p>ANSWER:  You have ____ days from the date on which you were notified that you won to sign and return the Assignment.  We must receive the signed Assignment before the expiration of ____ days.  Simply putting the Assignment in the mail is not sufficient.</p>
                    </div>
                    <div>
                        <p><strong>5. How do I return the Assignment?</strong></p>
                        <p>ANSWER:  The assignment may be signed and scanned as a PDF file and either (i) emailed to _________@topcoder.com or (ii) mailed to:  TopCoder, Inc., Attn: _________________, 703 Hebron Avenue, Glastonbury, CT 06033.  However, please keep in mind that we must actually receive the Assignment before the expiration of ____ days.</p>
                    </div>
                    <div>
                        <p><strong>6. Can I make changes to the Assignment?</strong></p>
                        <p>ANSWER:  No.  Assignments which are returned with changes, additions, or words crossed out are not valid and will not be accepted.  The terms of the Assignment are not negotiable.</p>
                    </div>
                    <div>
                        <p><strong>7. Why does the Assignment cover all of my past winning entries?</strong></p>
                        <p>ANSWER:  We may use previous winning entries in developing software for a client.  Because these clients may request written proof that we own rights in the components used in the software, we need the Assignment.</p>
                    </div>
                    <div>
                        <p><strong>8. Why does the Assignment cover all of my future winning entries?</strong></p>
                        <p>ANSWER:  To be clear, the Assignment covers your future entries only if you agree.  In our effort to make this process as streamlined as possible, the Assignment has been written so that it only needs to be signed once.  You will be given the opportunity to confirm/ratify the Assignment if/when you win in the future.  If you do not confirm/ratify the Assignment at that time, you will face consequences including, but not limited to, not receiving your prize.</p>
                    </div>
                    <div>
                        <p><strong>9. Do I have to sign the Assignment every time I win?</strong></p>
                        <p>ANSWER:  No.  You are only required to sign and return the assignment the first time you win a competition after _____________, 2007.  Once you have signed and returned the Assignment, the next time you win a competition you will be given the opportunity to confirm/ratify the terms of the Assignment.  You only have to sign and return the Assignment once.</p>
                    </div>
                    <div>
                        <p><strong>10. Do I still own my past winning entries?</strong></p>
                        <p>ANSWER:  No.  Under the rules for each competition, you assigned your rights in any previous winning entries by participating in the competition.  The Assignment is a confirmation that you assigned those rights.</p>
                    </div>
                    <div>
                        <p><strong>11. Will all previous winners need to sign the Assignment?</strong></p>
                        <p>ANSWER:  Eventually all previous winners will need to sign the Assignment.  However, at this time we are requiring a signed Assignment only for winning entries after ________________, 2007.</p>
                    </div>
                </div>

</div>
<img src="/i/layout/contentInS.gif" alt="" style="display:block;"/>
</div>
<jsp:include page="../foot.jsp"/>
<img src="/i/layout/contentOutS.gif" alt="" style="display:block;"/>
</div>
</div>

</body>
</html>