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

        <TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" WIDTH="100%">
                  <TR>
                        <TD><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="10" BORDER="0"/></TD>
                     </TR>
                      <TR>
                        <TD CLASS="statText" BGCOLOR="#43515E" HEIGHT="18" VALIGN="middle">&#160;&#160;<B>Great Jobs at TopCoder</B></TD>
                     </TR>
                  </TABLE>


            <table border="0" cellspacing="0" cellpadding="0"  width="100%">
                <tr valign="top">
                    <td class="bodyText" width="100%"><br/>

<h3>Employment Services Account Executive</h3>

<b>Job Description:</b><br/>
TopCoder Employment Services, a division of TopCoder, Inc. is an employment services company looking to hire a motivated, hard working salesperson to develop the west coast region. TopCoder markets employment and marketing services to companies in multiple industries using a unique combination of competition, training, and community development for software developers.
<br/><br/>
<b>Offerings:</b>
<ul>
<li><A href="/corp/?module=Static&d1=corp&d2=tces_home">Employment Services</A></li>
<li><A href="/corp/?module=Static&d1=corp&d2=spon_prog&d3=index">Marketing Services</A></li>
</ul>
<b>Responsibilities:</b>
<ul>
<li>Exceed all revenue targets - Following a three-month period to build a sales pipeline, we expect our sales representatives to exceed quarterly revenue goals. </li>
<li>Build sales pipeline - Identify new customer prospects via professional networks, cold calling and any other means necessary to build a sales pipeline. </li>
<li>Schedule meetings - Set up meetings for TopCoder executives at qualified prospects with identified needs. </li>
<li>Build business plan - Build a plan for developing the assigned business including specific customers and timeframes.</li>
</ul>
<b>Qualifications:</b>
<ul>
<li>Business development experience - Ideal candidates should have at least three years of prior technical sales experience in the west coast region. </li>
<li>Strong selling skills - Ideal candidates should have experience identifying, qualifying and closing software or services deals. </li>
<li>Prior success - Ideal candidates should have a demonstrated ability to consistently exceed quota. </li>
<li>Strong work ethic - Ideal candidates should be able to grow a pipeline two to four times the size of quota targets and prioritize likely prospects. </li>
<li>College Degree - Four year degree preferred.</li>
</ul>


                        <p>
                        <A href="mailto:jobs@topcoder.com?subject=Employment Services Account Executive">Apply for this job.<a/>
                        </p>
                        <p><br /></p>

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
