<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Tutor Transcripts</title>

<jsp:include page="../script.jsp" />

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
                <jsp:param name="level1" value="education"/>
                <jsp:param name="level2" value="tutor_transcripts"/>
            </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Center Column Begins -->
         <td width="100%" align="center">

         <div class="tutorBody">
        <jsp:include page="../page_title.jsp" >
            <jsp:param name="image" value="tutor_tran"/>
            <jsp:param name="title" value=""/>
        </jsp:include>


			<table width="100%" border="0" cellspacing="0" cellpadding="3">
				<tr valign="middle"><td class="statTextLarge" bgcolor="#999999" colspan="2"><font size="3">2004</font></td></tr>
				<tr><td colspan="2"><img src="/i/clear.gif" alt="" width="1" height="5" border="0"/></td></tr>
				<tr><td valign="middle" class="bodyText" colspan="2">&#160;<strong>August</strong></td></tr>
				<tr><td class="bodyText">08.28.04</td><td class="bodyText" nowrap=nowrap width="100%">&#160;-&#160;<a href="/tc?module=Static&d1=tutor_transcripts&d2=tt_082804">SRM 209</a></td></tr>
				<tr><td class="bodyText">08.19.04</td><td class="bodyText" nowrap=nowrap width="100%">&#160;-&#160;<a href="/tc?module=Static&d1=tutor_transcripts&d2=tt_081904">SRM 208</a></td></tr>

			</table>

        </div>
        <p><br/></p>
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
