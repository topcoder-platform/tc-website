<%@  page
 language="java"
 errorPage="/errorPage.jsp"
  import="com.topcoder.common.web.data.Navigation,
          com.topcoder.shared.util.ApplicationServer"
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Working at TopCoder - Sales Director Position</title>

<jsp:include page="../../script.jsp" />

</head>

<body>

<jsp:include page="../../top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">

<!-- Left Column Begins-->
        <td width="180">
            <jsp:include page="../../includes/global_left.jsp">
                <jsp:param name="level1" value="about"/>
                <jsp:param name="level2" value="jobs"/>
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
                       
                       <h3>Sales Director</h3>
                       
                       
                       <strong>Job Description: </strong>
                        
                        <p>TopCoder Software, a division of TopCoder, Inc. is a progressive software company looking to hire a motivated, hard 
                        working salesperson to develop the New York City/Northern New Jersey area. TopCoder Software markets application 
                        development services to companies in multiple industries using a unique combination of competition qualified software 
                        developers, a rigorous development methodology and catalogs of re-usable software components. TopCoder Software also 
                        sells subscriptions to the component catalogs.</p>
                        
                        <strong>Responsibilities include: </strong>
                        <ul>
                            <li>Exceed all revenue targets - Following a six-month period to build a sales pipeline, we expect our 
                            sales representatives to exceed quarterly revenue goals.</li>                            
                            <li>Build sales pipeline - Identify new customer prospects via professional networks, cold calling and any 
                            other means necessary to build a sales pipeline.</li>                 
                            <li>Schedule meetings - Set up meetings for TopCoder executives at qualified prospects with identified needs.</li>
                            <li>Build business plan - Build a plan for developing the assigned business including specific customers and timeframes.</li>
                        </ul>
                        
                        <strong>Qualifications include: </strong>
                        <ul>
                            <li>Business development experience - Ideal candidates should have at least three years of prior technical sales experience 
                            in the New York/Northern New Jersey area.</li>                 
                            <li>Strong selling skills - Ideal candidates should have experience identifying, qualifying and closing 
                            software or services deals.</li>                            
                            <li>Prior success - Ideal candidates should have a demonstrated ability to consistently exceed quota.</li> 
                            <li>Strong work ethic - Ideal candidates should be able to grow a pipeline two to four times the size of quota targets and prioritize likely prospects.</li>
                            <li>College Degree - Four year degree preferred.</li>                       
                        </ul>
                        
                        <strong>Contact Information:</strong>
                        <p> Company: TopCoder Software<br/>
                        Contact: Dave Tanacea<br/>
                        Email: <a class="bodyText" href="mailto:dtanacea@topcoder.com?subject=TopCoder Software Sales Director">dtanacea@topcoder.com</a><br/>
                        Address: 703 Hebron Ave<br/>
	               Glastonbury, CT  06033<br/>
                        Phone: 860.633.5540</p>
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
            <jsp:include page="../../public_right.jsp">
               <jsp:param name="level1" value="about"/>
            </jsp:include>
         </td>
<!-- Right Column Ends -->

<!-- Gutter -->
         <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<!-- Gutter Ends -->
    </tr>
</table>

<jsp:include page="../../foot.jsp" />

</body>

</html>
