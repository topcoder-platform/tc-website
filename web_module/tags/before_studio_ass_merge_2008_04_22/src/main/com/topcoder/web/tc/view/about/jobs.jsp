<%@  page
 language="java"
 errorPage="/errorPage.jsp"
  import="com.topcoder.common.web.data.Navigation,
          com.topcoder.shared.util.ApplicationServer"
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Working at TopCoder</title>

<jsp:include page="/script.jsp" />
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
                <jsp:param name="node" value="working_tc"/>
            </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Gutter Begins -->
        <td width="15"><img src="/i/clear.gif" width="15" height="1" border="0"/></td>
<!-- Gutter Ends -->

<!-- Center Column Begins -->
        <td class="bodyText" width="99%"><img src="/i/clear.gif" width="400" height="1" vspace="5" border="0"><br>
        <jsp:include page="../body_top.jsp" >
           <jsp:param name="image" value="about_tc"/>
           <jsp:param name="image1" value="white"/>
           <jsp:param name="title" value="Working at TopCoder"/>
        </jsp:include>

            <table border="0" cellspacing="0" cellpadding="0"  width="100%">
                <tr valign="top">
                    <td class="bodyText" width="100%"><br />

                        <p><img src="/i/about/man_computer.jpg" alt="" width="200" height="151" border="0" align="left"  style="margin-left: 0px; margin-top: 0px; margin-right: 7px; margin-bottom: 7px;" />
                        TopCoder, Inc. provides a variety of service offerings.  We are the recognized leader in organizing and hosting online and onsite programming 
                        competitions for a global community of members.  Our software development methodology is building cutting edge enterprise software solutions 
                        for Fortune 500 clients by utilizing the largest and most diverse global workforce on the market, and our recruiting operation provides corporations 
                        with an unparalleled level of talent which is evaluated through our programming competitions.</p>

                        <p>TopCoder members extend across all professional and collegiate levels. The attraction of competition and the associated rewards create the most 
                        powerful community of programmers in the world. Corporate partners access this member base for value in terms of employment, software development 
                        and sponsorship.</p>

                        <p>Incorporated in 2001, TopCoder, Inc. has become the standard by which talent and software are measured. Our small staff is young, enthusiastic 
                        and welcomes the challenges of charting new territory within the industry. The Company has been built with integrity as our cornerstone, and we value 
                        professional and ethical standards at every level - from our employees and our clients alike.</p>

                        <p>Through our revolutionary software development methodology, cutting-edge recruiting offerings, and world-renowned programming tournaments, we are 
                        committed to excellence. We expect the same commitment and drive from our current and future employees.</p>

                        <p>If you are interested in joining this fast growing company, please view our open positions below and apply <a href="mailto:jobs@topcoder.com">here</a>.</p>
                        <h3>Currently available positions:</h3>
                        <ul>
                            <li><a href="/tc?module=Static&amp;d1=about&amp;d2=deployment_engineer">Deployment Engineer</a></li>
                            <li><a href="/tc?module=Static&amp;d1=about&amp;d2=project_manager">TopCoder Software Project Manager</a></li>
                            <li><a href="/tc?module=Static&amp;d1=about&amp;d2=software_application_architect">TopCoder Software Application Architect</a></li>
                            <li><a href="/tc?module=Static&amp;d1=about&amp;d2=frontend_designer">TopCoder Information Architect</a></li>
                            <li><a href="/tc?module=Static&amp;d1=about&amp;d2=tcs_salesdirector">TopCoder Salesperson</a></li>
                        </ul>
                    </td>
                </tr>
            </table>

            <p><br></p>
        </td>
<!-- Center Column Ends -->

<!-- Gutter -->
         <td width="15"><img src="/i/clear.gif" width="15" height="1" border="0"></td>
<!-- Gutter Ends -->

<!-- Right Column Begins -->
         <td width="170">
            <jsp:include page="../public_right.jsp">
               <jsp:param name="level1" value="about"/>
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
