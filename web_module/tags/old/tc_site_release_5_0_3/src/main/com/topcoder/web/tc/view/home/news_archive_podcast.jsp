<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder News Archive</title>

<jsp:include page="/script.jsp"/>
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
<jsp:param name="node" value="m_competitions"/>
</jsp:include>
</td>
<!-- Left Column Ends -->

<!-- Center Column Begins -->
         <td width="100%" align="center">

         <div class="myTCBody">
        <jsp:include page="../page_title.jsp" >
            <jsp:param name="image" value="news_archive"/>
            <jsp:param name="title" value="Podcasts"/>
        </jsp:include>

<table border=0 cellpadding=2 cellspacing=0 width="100%">
<tr class="bodyText" valign="top"><td nowrap="nowrap">03.10.06 3:00 PM&#160;-&#160</td><td width="100%"><A href="http://www.topcoder.com/audio/Pat_Conley_03_10_06.mp3">Exclusive: Interview with Pat Conley, VP VeriSign O&I and TopCoder Member</A></td></tr>
<tr class="bodyText" valign="top"><td nowrap="nowrap">01.20.06 11:00 AM&#160;-&#160</td><td width="100%"><A href="http://www.javaposse.com/media/dickwall/JavaPosse026.mp3" target="_blank">Java Posse - Bill Goggin interview</A></td></tr> 
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
