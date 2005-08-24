<%@ page contentType="text/html; charset=ISO-8859-1"
         import="com.topcoder.web.corp.Constants,
                 com.topcoder.web.corp.controller.TransactionServlet,
                 com.topcoder.web.corp.controller.request.Login,
                 com.topcoder.web.common.BaseServlet"
         %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>The TopCoder Technical Assessment Program allows companies to test the technical abilities of candidates during the interview process</title>

<jsp:include page="../includes/css.jsp" />

<script language="JavaScript" type="text/javascript" src="/js/script.js"></script>

</head>

<body>

<!-- Top begins -->
<jsp:include page="../includes/top.jsp" >
    <jsp:param name="level1" value="employment_services"/>
</jsp:include>

<!-- Top ends -->

<table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr valign="top">

<!-- Left Column Begins -->
        <td width="170">
            <jsp:include page="../includes/left.jsp">
                <jsp:param name="level1" value="testing"/>
                <jsp:param name="level2" value="demo"/>
            </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Gutter Begins -->
        <td valign="top"><img src="/i/corp/clear.gif" width="10" height="1" alt="" border="0"></td>
<!-- Gutter Ends -->

<!-- Center Column begins -->
        <td width="100%">
            <table width="100%" border="0" cellpadding="0" cellspacing="0">

                <tr valign="top">
                    <td class="bodyText" width="99%">
                        <img src="/i/corp/clear.gif" width="1" height="10" alt="" border="0"/><br>

                        <h1 class="testHead">TopCoder Technical Assessment Tool</h1>

                        <p>Here, through our real-time demonstration, you can see the entire TopCoder screening process from start to finish.
                        Sit in the candidate's seat and apply for a job, which automatically registers you for the Technical Assessment Tool.
                        Access the Reporting Application, which gives you immediate results of candidates' tests, contact information and resumes.</p>

						<p><a href="/corp/?module=Static&d1=corp&d2=testing&d3=demo_job" target="_blank"><img src="/i/corp/apply.gif" width="129" height="77" alt="" border="0" align="left" style="margin-left: 0px; margin-top: 7px; margin-right: 10px; margin-bottom: 7px;"/></a>
						<span class="testSubhead"><a href="/corp/?module=Static&d1=corp&d2=testing&d3=demo_job" target="_blank">Step One - Apply for a job and register for the Technical Assessment Tool</a></span><br/>
						Take a step back into the life of a candidate.  View a job description with a link to apply,
						which will get you registered for the Technical Assessment Tool. Receive an email with
						instructions and then participate in the test itself.</p>
						<p><br/></p>

						<p><a href="/corp/?module=Login&<%=Login.KEY_USER_HANDLE%>=xyzresults&<%=Login.KEY_USER_PASS%>=xyzpassword&<%=BaseServlet.NEXT_PAGE_KEY%>=/corp/testing?module=CampaignList" target="_blank"><img src="/i/corp/results.gif" width="129" height="77" alt="" border="0" align="left" style="margin-left: 0px; margin-top: 7px; margin-right: 10px; margin-bottom: 7px;"/></a>
						<span class="testSubhead"><a href="/corp/?module=Login&<%=Login.KEY_USER_HANDLE%>=xyzresults&<%=Login.KEY_USER_PASS%>=xyzpassword&<%=BaseServlet.NEXT_PAGE_KEY%>=/corp/testing?module=CampaignList" target="_blank">Step Two - View sample results and get acclimated with the reporting process</a></span><br/>
						After you've seen the candidate side, come back and see what kind of information is reported.
						You'll see contact information, test results (including the submitted code), answers to demographic
						questions, and resume.  You can rate each candidate on a scale from 1 to 5, and make notes that
						will be carried along in the interview process.</p>

                        <p><br></p>
                    </td>

<!-- Gutter -->
                    <td width="10"><img src="/i/corp/clear.gif" width="10" height="1" alt="" border="0"></td>
<!-- Gutter Ends -->

<!-- Right Column begins -->
                    <jsp:include page="/right.jsp">
                        <jsp:param name="level1" value="testing"/>
                        <jsp:param name="level2" value="overview"/>
                    </jsp:include>
<!-- Right Column ends -->

                </tr>
            </table>
        </td>
<!-- Center Column ends -->
    </tr>
</table>

<!-- Footer begins -->
  <jsp:include page="/foot.jsp"/>
<!-- Footer ends -->

</body>
</html>
