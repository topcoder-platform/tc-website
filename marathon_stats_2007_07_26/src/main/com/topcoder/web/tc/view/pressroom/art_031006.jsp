<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Press Room</title>

<jsp:include page="../script.jsp" />
<jsp:include page="../style.jsp">
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
            <jsp:include page="../includes/global_left.jsp">
                <jsp:param name="node" value="press_room"/>
            </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Center Column Begins -->
         <td width="100%" align="center">


            <table border="0" cellspacing="0" cellpadding="10" width="100%">
                <tr valign="top">
                    <td class="prText" width="100%"><img src="/i/clear.gif" alt="" width="400" height="1" border="0"/><br />
                    <jsp:include page="../page_title.jsp" >
                        <jsp:param name="image" value="press_room"/>
                        <jsp:param name="title" value="Article"/>
                    </jsp:include>
                        <div align="center">
                        <p><span class="bodyTitle">Exclusive: Interview with Pat Conley, <br>VP VeriSign O&I and TopCoder Member</span><br />
                        Pat shares his impressions of TopCoder, talks about his background <br>and what's going on at industry leader VeriSign.<br /><A href="/audio/Pat_Conley_03_10_06.mp3">listen</a>
                        </p>
                        </div>
                        
                        <p><strong>March 10, 2006&#151;</strong>Pat Conley, vice president for product development for VeriSign Operations & Infrastructure, is a technology leader specializing in high-tech product initiation and development. Pat is responsible for VeriSign global outsource development efforts, infrastructure product engineering, and the new common application framework initiative.
<br><br>
He began his career in software development in the early 80s, working at one of the most innovative development environments of the time: Bell Telephone Laboratories.   Pat was a co-author of one of the UDDI standards.  He has two patents pending on the LDAP Fault Tolerant System and on the Data Token Ring resulted from his work at Nortel Networks
                        </p>
                        <p>###</p>
                        <p><br /></p>
                    </td>
                </tr>
            </table>
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
