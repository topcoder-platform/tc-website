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
                       
<P>
<B>Algorithm Problem Coordinator</B>
</P>

<p>
TopCoder is looking to hire a full-time algorithm problem coordinator.  The problem coordination position is a very unique position that requires someone with extensive algorithmic knowledge, as well as mathematical, and logical problem solving skills.  This person would be responsible for both writing problems as well as coordinating getting problems written from other members.  The Algorithm Problem Coordinator would be expected to travel to the onsite portion of various events each year - including all TopCoder tournament onsite events.  We would look to this person to help decide what changes, enhancements, or additions should be made to all algorithm competitions and systems at TopCoder.
</p>
<p><b>Responsibilities</b></p>
<ul>
<li>Work with the problem writing and testing teams (TopCoder members) to coordinate the creation, testing, and usage of algorithm problems for all TopCoder public and private events.</li>
<li>Provide answers to problem statements inquiries during all algorithm competitions.</li>
</ul>

<p><b>Environment</b></p>
<ul>
<li>TopCoder's problem management and coordination systems are written in Java</li>
<li>All algorithm reference solutions are written in Java</li>
<li>TopCoder's development environment consists of mostly Linux and Solaris, with some Windows 2000</li>
</ul>

<p><b>Requirements</b></p>
<ul>
<li>You must have knowledge of Java - knowledge of C++, C# and VB.NET a plus</li>
<li>You must have extensive knowledge of all algorithmic categories used in TopCoder algorithm competitions</li>
<li>You must have a well established, division one TopCoder rating</li>
<li>You must be willing to travel to various locations for onsite administration of some private label competitions and all major TopCoder tournaments.</li>
<li>Willingness to relocate to the Hartford, CT area is a plus</li>
</ul>

<br><br>
<b>Contact Information:</b><br>
Company: TopCoder<br>
Contact: Mike Lydon<br>
Email: <A href="mailto:mlydon@topcoder.com">mlydon@topcoder.com</A><br>
Address: 703 Hebron Ave<br>
Glastonbury, CT 06033<br>
Phone: 860.633.5540<br>

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
