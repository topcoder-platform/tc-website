<%@ page contentType="text/html;charset=utf-8" %> 
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
    <title>TopCoder</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <jsp:include page="../script.jsp" />
    <jsp:include page="../style.jsp">
    <jsp:param name="key" value="tc_stats"/>
    </jsp:include>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
</head>
<body>

<div id="onTop">
<jsp:include page="../top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>
</div>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">
<%-- Left Column Begins--%>
        <td width="180">
            <jsp:include page="/includes/global_left.jsp">
                <jsp:param name="node" value=""/>
            </jsp:include>
        </td>
<%-- Left Column Ends --%>

<!-- Center Column Begins -->
<td width="100%" align="left" class="bodyColumn">
<br />
<br />
<br />
<br />

<span class="bigTitle">No Resume</span>
<br />

<br clear="all">

<div>
<table style="width: 100%;" cellpadding="0" cellspacing="0">
<thead>
    <tr>
        <td>
Applying for a job through TopCoder requires an uploaded resume. Currently, you do not have a resume uploaded. In order for your information to be viewed by employers, you must <A href="/reg/?nrg=false">upload your resume now by updating your profile</A>. Once you have added your resume, you will need to reapply for the job in which you are interested. Thank you.

        </td>
    </tr>

</table>
<br /><br />
            </div>


<p>&nbsp;</p>
     </td>
<!-- Center Column Ends -->

<!-- Right Column Begins -->
         <td width="170" id="onRight">
            <jsp:include page="../public_right.jsp">
               <jsp:param name="level1" value="defaults"/>
            </jsp:include>
         </td>
<!-- Right Column Ends -->

<!-- Gutter -->
         <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<!-- Gutter Ends -->
    </tr>
</table>

<div id="onBottom">
<jsp:include page="../foot.jsp" />
</div>

</body>

</html>
