<%@ page contentType="text/html;charset=utf-8" %> 
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
    <title>TopCoder - PACTs</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <jsp:include page="../script.jsp" />
    <jsp:include page="../style.jsp">
    <jsp:param name="key" value="tc_stats"/>
    </jsp:include>
</head>
<body>

<jsp:include page="../top.jsp" >
<jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
<tbody>
    <tr valign="top">
<%-- Left Column Begins--%>
        <td width="180">
            <jsp:include page="../includes/global_left.jsp">
                <jsp:param name="node" value="assignment_docs"/>
            </jsp:include>
        </td>
<%-- Left Column Ends --%>

<%-- Center Column Begins --%>
        <td width="100%" align="center" class="bodyColumn">
            <div class="fixedWidthBody">
                <jsp:include page="../page_title.jsp" >
                <jsp:param name="image" value="pact_s"/>
                <jsp:param name="title" value="Assignment Documents"/>
                </jsp:include>



                <div class="bigTitle">Assignment Documents FAQ</div>
                
                <div align="right">
                    <a target="_blank" href="/wiki/display/tc/The+Assignment+Document">Download Assignment</a><br />
                    <a href="/PactsMemberServlet?module=AssignmentDocumentHistory">Assignment Status</a></div>
                    
                <div>
                    <p><strong>What is the Assignment?</strong></p>
                    <p>The Assignment is a document by which you confirm that you transfer your rights in a winning entry to TopCoder, Inc. The Assignment: (i) documents your assignment of all rights in all of your winning entries, if any, in exchange for the applicable prize. The Assignment does NOT assign any entries for which you are not compensated, and you still retain the ownership of such entries. (There is a license, however, which allows TopCoder to post you submissions on the web site.)  Version 2.0 of the assignment document is now available <a href="/wiki/display/tc/The+Assignment+Document">here</a>.</p>
                </div>
                <div>
                    <p><strong>For which competitions will the Assignment be required?</strong></p>
                    <p>The Assignment will be required in any competition in which you will be assigning your rights in the winning entry to TopCoder. Generally speaking, the Assignment will be required in Component Design competitions, Component Development competitions, Application Assembly competitions, Testing competitions, and TopCoder Studio competitions, but not Algorithm competitions. However, this is subject to change depending the rules and requirements of each competition.</p>
                </div>
                <div>
                    <p><strong>Why do I need to sign the Assignment?</strong></p>
                    <p>This document is simply a confirmation of a member's agreement to transfer ownership of a winning entry to TopCoder.</p>
                </div>
                <div>
                    <p><strong>What happens if I don't sign and return the Assignment?</strong></p>
                    <p>When you initially agree to the terms of each competition, you also agree to assign ownership in the event that you win a prize. If you don't sign and return the Assignment, you will be violating the rules of the competition to which you agreed and you will not receive your prize. In addition, you will not be allowed to participate in future competitions until the situation is resolved.</p>
                </div>
                <div>
                    <p><strong>Do I have to sign the Assignment every time I win?</strong></p>
                    <p>No. You are only required to sign and return the assignment the first time you win a competition. You only have to sign and return the Assignment once.</p>
                </div>
                <div>
                    <p><strong>How do I return the Assignment?</strong></p>
                    <p>Each individual member's assignment document must be completed in full and either (i) a legible scan/photo taken and sent as an email attachment to <a href="mailto:payments@topcoder.com?subject=Assignment Document">payments@topcoder.com</a> or (ii) mailed to: TopCoder, Inc., Attn: Payments, 95 Glastonbury Blvd, Glastonbury, CT 06033 or (iii) communicated by fax to (US) +1 (860) 371.2165 (no cover sheet necessary).  However, please keep in mind that we must actually receive the Assignment before the expiration of 30 days.</p>
                </div>
                <div>
                    <p><strong>How much time do I have to return the Assignment?</strong></p>
                    <p>You have 30 days from the date on which you were notified that you won to sign and return the Assignment. We must receive the signed Assignment before the expiration of 30 days. Simply putting the Assignment in the mail is not sufficient.</p>
                </div>
                <div>
                    <p><strong>Why does the Assignment cover all of my past winning entries?</strong></p>
                    <p>We may use previous winning entries in developing software for a client. Because these clients may request written proof that we own rights in the components used in the software, we need the assignment from all past and future winners.</p>
                </div>
                <div>
                    <p><strong>Why does the Assignment also include my future winning entries after on-line ratification/confirmation?</strong></p>
                    <p>We have set up the assignment to cover future entries for two reasons. First, having the Assignment cover future entries reduces the amount of paperwork for members and TopCoder because members do not sign and return a paper Assignment after every win.</p>
                </div>
                <div>
                    <p><strong>Do Reviewers need to complete the Assignment?</strong></p>
                    <p>Yes, reviewers need to complete the Assignment. This is because reviewers sometimes contribute code and/or substantive ideas, for example in final fixes.</p>
                </div>
            </div>
        </td>
<%-- Center Column Ends --%>
        
<%-- Right Column Begins --%>
        <td width="170">
            <jsp:include page="../public_right.jsp">
                <jsp:param name="level1" value="default"/>
            </jsp:include>
        </td>
<%-- Right Column Ends --%>
        
    </tr>
    </tbody>
</table>

<jsp:include page="../foot.jsp" />
</body>
</html> 