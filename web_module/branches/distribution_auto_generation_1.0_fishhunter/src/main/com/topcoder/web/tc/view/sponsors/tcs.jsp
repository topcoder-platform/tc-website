<%@  page language="java"  %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Sponsor</title>

<jsp:include page="/script.jsp"/>
<jsp:include page="/style.jsp">
<jsp:param name="key" value="tc_main"/>
</jsp:include>

</head>

<body>

<jsp:include page="../top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">
<!-- Left Column Begins-->
        <td width="180">
         <jsp:include page="/includes/global_left.jsp">
            <jsp:param name="node" value=""/>
         </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Center Column Begins -->
        <td class="bodyText" width="100%" align="center">

        <div style="padding: 15px; text-align: left; width: 540px;">

        <div align="center"><img src="/i/sponsor/TC_logo.png" border="0px" alt="TopCoder Logo" /></div>
        <br /><br />
        
        <div style="float: right;">
        <h3 style="border-bottom: 1px solid #999999;">Chat Session Transcripts</h3>
            <strong>
                <A style="text-decoration:none;" href="/tc?module=Static&d1=sponsors&d2=tcsChat20070801">SRM 361</A>
            </strong>
        </div>
        <br /><br />
        

        <br />
        <h1>TopCoder is hiring!</h1>
        <p>TopCoder, Inc. organizes and hosts online and onsite programming competitions for a global community of members. TopCoder members extend across all professional and collegiate levels. The attraction of competition and the associated rewards create a powerful community of programmers. Corporate partners access this member base for employment, software development and sponsorship.</p>
        <p>Incorporated in 2001, TopCoder, Inc. is fast becoming the standard by which talent and software are measured. Our small staff is young, enthusiastic and welcomes the challenges of charting new territory within the industry. The Company has been built with integrity as our cornerstone, and we value honesty at every level – from our employees and our clients alike.</p>
        <p>Through our high-quality software, cutting-edge recruiting offerings, and world-renowned programming tournaments, we are committed to excellence. We expect the same commitment and drive from our current and future employees.</p>
        
        <p><a href="/tc?module=JobHit&jid=405&jt=1" class="button" style="width: 70px;">Apply Now</a></p>
        <p>&nbsp;</p>

        </td>
<!-- Center Column Ends -->

<!-- Right Column Begins -->
         <td width="170">
            <jsp:include page="../public_right.jsp">
               <jsp:param name="level1" value="privatelabel"/>
            </jsp:include>
         </td>
<!-- Right Column Ends -->

<!-- Gutter -->
         <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<!-- Gutter Ends -->
    </tr>
</table>

<jsp:include page="../foot.jsp" />

</body>

</html>