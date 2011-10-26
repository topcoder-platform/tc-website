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

        <table border="0" cellspacing="0" cellpadding="0" width="100%">
                  <tr>
                        <td><img src="/i/clear.gif" alt="" width="11" height="10" border="0"/></td>
                     </tr>
                      <tr>
                        <td class="statText" bgcolor="#43515E" height="18" valign="middle">&#160;&#160;<strong>Great Jobs at TopCoder</strong></td>
                     </tr>
                  </table>


            <table border="0" cellspacing="0" cellpadding="0"  width="100%">
                <tr valign="top">
                    <td class="bodyText" width="100%"><br/>

                       <h3>TopCoder Salesperson</h3>


                       <strong>Job Description: </strong>

                        <p>Competition is the driving force behind TopCoder.  What started as simply trying to identify the world's best technical talent became a re-engineering of the entire software development process. <strong>We are now looking to build the best sales team in the business</strong> - a team that is passionate about innovations in technology, building relationships with customers, and with the desire to be a part of a thriving, entrepreneurial and rapidly growing company.  Our sales team plays a critical role in defining, creating and executing a strategy to penetrate the world's leading companies to provide technology solutions to drive their businesses.
                        <a href="http://software.topcoder.com/applications/index.jsp">Learn more</a></p>

                        <strong>Candidates MUST be able to:</strong>
                        <ul>
                            <li>Fit into the TopCoder culture: integrity, strong work ethic, forward-thinking and a successful mindset for themselves, our organization and our clients.</li>
                            <li>Deeply understand the superiority of our business model and be motivated by the opportunity to have a role in changing how software is developed today.</li>
                            <li>Immediately begin development of a sales pipeline and creation of a business plan including specific target accounts and strategies to exceed revenue goals.</li>
                            <li>Balance aggressively identifying potential revenue-generating prospects with developing long-lasting, relationship-based business partnerships that benefit both parties.</li>
                            <li>Visualize and articulate innovative ways TopCoder can have a direct, beneficial impact on a prospect's business.</li>
                            <li>Think outside of the "cold-call the CIO" box.</li>
                            <li>Utilize strong research and networking skills critical for pipeline/account development.</li>
                            <li>Demonstrate interest in exploring the latest technology trends and gadgets.</li>
                            <li>Utilize social networking tools like LinkedIn/Facebook/blogs/forums etc.</li>
                            <li>Travel frequently. This position can be based anywhere in the US.</li>
                        </ul>

                        <strong>Qualifications:</strong>
                        <ul>
                            <li>Bachelor's degree.</li>
                            <li>Demonstrated strong selling skills or an aptitude for identifying/closing business opportunities.</li>
                            <li>A basic understanding of software development - although the ability to discuss social networking, crowdsourcing and other "Web 2.0" concepts would suffice.</li>
                            <li>Candidates must be US Citizens, have a valid Greencard, or be eligible for a TN visa.</li>
                        </ul>
                        
                        <p>TopCoder is passionate about innovation and building long lasting relationships with companies interested in finding 'a better way' to do things.  To start or continue a sales career in a forward-thinking environment that offers a lucrative compensation structure focused on performance including a corporate benefits package, <a href="mailto:jobs@topcoder.com?subject=Salesperson">apply for this job<a/>.</p>
                        <%--
                        <strong>Salary: </strong>
                        <ul>
                            <li>Base Salary</li>
                            <li>Personal Goals bonus plan</li>
                            <li>Company Goals bonus plan</li>
                        </ul>

                        <p>
                        <a href="mailto:jobs@topcoder.com?subject=Salesperson">Apply for this job.<a/>
                        </p>
                        <p><br /></p>
                        --%>
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
