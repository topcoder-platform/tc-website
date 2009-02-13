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
                       
                       <h3>Placement Agent</h3>
                       
						
						<b>Job Description:</b><br/>
						TopCoder is hiring for the position of "Placement Agent" in our Employment Services group. As TopCoder works with companies to identify programming talent, we need to match exciting jobs at our clients with the top performers in our member base. This individual will be responsible for locating the talent in our database, establishing contact with those candidates and coordinating their involvement in the clients' recruitment process.  Applicants must be willing to relocate to Glastonbury, CT or San Jose, CA.
						<br/><br/>
						<b>Responsibilities:</b>
						<ul>
						<li>Responsible for increasing the TopCoder candidate base by motivating members to attain a TopCoder rating and introducing new developers to the TopCoder experience.</li>
						<li>Work closely with TopCoder Employment Services clients to identify employment positions and requirements.</li>
						<li>Identify TopCoder placement/contract candidates for filling the necessary job requirements.</li>
						<li>Interview TopCoder placement/contract candidates to identify strengths and employment requirements.</li>
						<li>Create candidate profiles, including related TopCoder statistical information, education and work history.</li>
						<li>Match the appropriate placement/contract candidate with the appropriate TopCoder Employment Services client.</li>
						<li>Work with multiple clients simultaneously.</li>
						<li>Minimal travel required.</li>
						</ul>
						<b>Professional Skills:</b>
						<ul>
						<li>Excellent communication skills, both written and verbal, are essential</li>
						<li>MS Office knowledge and experience are a must (Word, Excel and Outlook)</li>
						<li>Team player</li>
						<li>Knowledge of programming languages, hardware and software technologies, and system architecture is desirable, but not required.</li>
						</ul>

                        
                        <strong>Contact Information:</strong>
                        <p>
                        Contact: George Tsipolitis<br/>
                        Email: <a class="bodyText" href="mailto:gtsipolitis@topcoder.com?subject=TopCoder Placement Agent">gtsipolitis@topcoder.com</a><br/>
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
