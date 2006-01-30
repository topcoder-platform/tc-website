<%@ page contentType="text/html; charset=ISO-8859-1"
         import="com.topcoder.web.corp.Constants,
                 com.topcoder.web.corp.controller.TransactionServlet"
         %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder | Corporate Services</title>

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
        <td width="180">
            <jsp:include page="../includes/left.jsp">
                <jsp:param name="level1" value="privatelabel"/>
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
                        <img src="/i/corp/clear.gif" width="1" height="10" alt="" border="0"><br>

                        <h1 class="testHead">Sourcing</h1>

                        <p>TopCoder has the ability to customize a competition to help our clients reach their goals and objectives. We
                        have executed hundreds of competitions and are uniquely qualified to handle the necessary details to effectively
                        carry out a successful competition including:</p>

                        <ul>
                        	<li>TopCoder developing all aspects of each event including rules, regulations, eligibility, registration,
                        	event website, competition manual, practice rooms, problem writing, testing and coordination.</li>

                        	<li>TopCoder providing support and administration during private label events for registration, practice
                        	rooms, competition arena, chat sessions, FAQs, and prize money administration.</li>

                        	<li>TopCoder marketing each event to our international member base of over 38,000 developers.</li>

                        	<li>TopCoder providing results verification and dissemination after each event, as well as completed
                        	software design documents, working components and code submissions.</li>

                        	<li>TopCoder providing flexible competition platforms such as algorithm, software component design,
                        	and software component development.</li>
                        </ul>

						<p><img src="/i/corp/candidate.jpg" width="200" height="200" alt="" border="0" align="right"><span class="bodySubtitle">External Recruiting</span><br>
                        Through TopCoder private label recruiting events, we provide our clients with the ability to capture structured
                        and objective information on developers' skills and to create a developer benchmark.  A custom registration process
                        provides a valuable tool to capture information about the individual, and throughout the competition we capture
                        information about their relative skills and abilities.</p>

                        <p><span class="bodySubtitle">Employee Development and Recognition</span><br>
                        An internal employee competition allows companies to identify and build the technical strength of their organization.
                        TopCoder's unique ability to execute algorithm, design and development competitions provides all developers with an
                        avenue to display their strengths.  Capturing information about an individual's performance allows companies to take
                        the action of rewarding and recognizing those employees who excel.</p>

                        <p><span class="bodySubtitle">Our most recent Private Label Events</span><br></p>


                       <table width="530" border="0" cellpadding="5" cellspacing="0" align="center">
                        	<tr>
                        		<td colspan="2" align="center"><a href="/pl/?module=Static&d1=doubleclick&d2=col_overview" target="_blank"><img src="/i/corp/privlab_doubleclick.gif" width="182" height="88" alt="" border="0"></a></td>
                        	</tr>
                        	<tr>
                        		<td align="center"><a href="/pl/?module=Static&d1=google&d2=google_overview" target="_blank"><img src="/i/corp/privlab_google.gif" width="182" height="88" alt="" border="0"></a></td>
                        		<td align="center"><a href="/pl/?module=Static&d1=verizon&d2=vcc03_overview" target="_blank"><img src="/i/corp/privlab_verizon.gif" width="182" height="88" alt="" border="0"></a></td>
                        	</tr>
                       </table>

                        <p>For more information, contact Paul Moriarty at <a href="mailto:tces@topcoder.com?subject=Request For Information-Private Label Events">tces@topcoder.com</a> or 866.TOP.CODE</p>
                    </td>
                <tr>

             </table>
          </td>

<!-- Gutter -->
                    <td width="10"><img src="/i/corp/clear.gif" width="10" height="1" alt="" border="0"></td>
<!-- Gutter Ends -->

                    <td width="244" align ="left">

<!-- Right Column begins -->
                    <jsp:include page="/right.jsp">
 						<jsp:param name="level1" value="tces_home"/>
                    </jsp:include>
<!-- Right Column ends -->
				</td>

                </tr>
            </table>

            <p><br></p>

        </td>
<!-- Center Column ends -->

    </tr>
</table>

<!-- Footer begins -->
  <jsp:include page="/foot.jsp"/>
<!-- Footer ends -->

</body>
</html>
