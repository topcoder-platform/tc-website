<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder</title>

<link type="text/css" rel="stylesheet" href="/css/roundTables.css"/>
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
			<jsp:include page="../includes/global_left.jsp">
				<jsp:param name="level1" value=""/>
				<jsp:param name="level2" value=""/>
			</jsp:include>
		</td>
<!-- Left Column Ends -->
 
<!-- Center Column Begins -->
         <td width="100%" class="rtBody">

        <jsp:include page="../page_title.jsp" >
            <jsp:param name="image" value="round_table"/>
            <jsp:param name="title" value="Post a new topic"/>
        </jsp:include>

<table cellpadding="0" cellspacing="0" class="rtTable">
<tr><td class="rtHeader" colspan="2">New Topic</td></tr>
<tr>
<td class="rtPosterCell" rowspan="2"><div class="rtPosterSpacer"><img src="/i/m/radeye_mug.gif" border="0" class="rtPhoto" /><br><A href="/" class="coderTextRed">radeye</A><br><A href="/">1037 posts</A></div></td>
<td class="rtTextCell">
<form name="form1"><b>Subject:</b><br><input type="text" size="60" name="textbox1"><br><br>
<b>Body:</b><br><textarea name="bigbox" rows="15" cols="60"></textarea></form>
</td>
</tr>
<tr><td class="rtFooter"><A href="/"><img src="/i/roundTables/post.gif" class="rtButton" alt="" /></A><A href="/"><img src="/i/roundTables/preview.gif" class="rtButton" alt="" /></A></td></tr>
</table>

        <p><br/></p>
        </td>
<!-- Center Column Ends -->

    </tr>
</table>

<jsp:include page="../../foot.jsp" />

</body>

</html>
