<%@ page contentType="text/html;charset=utf-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
<title>TopCoder</title>
<jsp:include page="../script.jsp" />
<jsp:include page="../style.jsp">
<jsp:param name="key" value="tc_stats"/>
</jsp:include>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
</head>

<body>

<jsp:include page="../top.jsp">
    <jsp:param name="level1" value="long"/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
<tr valign="top">
<%-- Left Column Begins--%>
<td width="180">
         <jsp:include page="../includes/global_left.jsp">
            <jsp:param name="node" value="long_editorials"/>
         </jsp:include>
</td>
<%-- Left Column Ends --%>

<%-- Center Column Begins --%>
<TD CLASS="statTableSpacer" WIDTH="100%" VALIGN="top">
<div align="center">
   <div style="width: 100%; text-align: left;">

    <jsp:include page="../page_title.jsp">
        <jsp:param name="image" value="long_comps_topcoder"/>
        <jsp:param name="title" value="Match Editorials"/>
    </jsp:include>

<table class="bodyText" cellpadding="3" cellspacing="0" border="0">
<tr><td>06.27.2007</td><td><strong>TCO07 Marathon Match Final</strong> - <A href="/longcontest/?module=Static&d1=match_editorials&d2=mm_tco07">Analysis</A></td></tr>
<tr><td>05.30.2007</td><td><strong>Marathon Match 17</strong> - <A href="/longcontest/?module=Static&d1=match_editorials&d2=mm_17">Analysis</A></td></tr>
<tr><td>03.07.2007</td><td><strong>TCO07 Round 1 Analysis / Marathon Match 13</strong> - <A href="/longcontest/?module=Static&d1=match_editorials&d2=mm_13_tco07_rd_1">Analysis</A></td></tr>
<tr><td>01.31.2007</td><td><strong>Marathon Match 10</strong> - <A href="/longcontest/?module=Static&d1=match_editorials&d2=mm_10">Analysis</A></td></tr>
<tr><td>11.30.2006</td><td><strong>Intel&#174; Multi-Threading Competion 11</strong> - <A href="/longcontest/?module=Static&d1=match_editorials&d2=intel_mtcs_11">Analysis</A></td></tr>
<tr><td>11.01.2006</td><td><strong>Intel&#174; Multi-Threading Competion 10</strong> - <A href="/longcontest/?module=Static&d1=match_editorials&d2=intel_mtcs_10">Analysis</A></td></tr>
<tr><td>09.27.2006</td><td><strong>Intel&#174; Multi-Threading Competion 9</strong> - <A href="/longcontest/?module=Static&d1=match_editorials&d2=intel_mtcs_9">Analysis</A></td></tr>
<tr><td>08.30.2006</td><td><strong>Intel&#174; Multi-Threading Competion 8</strong> - <A href="/longcontest/?module=Static&d1=match_editorials&d2=intel_mtcs_8">Analysis</A></td></tr>
<tr><td>08.16.2006</td><td><strong>Marathon Match 4</strong> - <A href="/longcontest/?module=Static&d1=match_editorials&d2=mm_4">Analysis</A></td></tr>
<tr><td>08.02.2006</td><td><strong>Intel&#174; Multi-Threading Competion 7</strong> - <A href="/longcontest/?module=Static&d1=match_editorials&d2=intel_mtcs_7">Analysis</A></td></tr>
<tr><td>06.28.2006</td><td><strong>Intel&#174; Multi-Threading Competion 6</strong> - <A href="/longcontest/?module=Static&d1=match_editorials&d2=intel_mtcs_6">Analysis</A></td></tr>
<tr><td>06.14.2006</td><td><strong>Marathon Match 2</strong> - <A href="/longcontest/?module=Static&d1=match_editorials&d2=mm_2">Analysis</A></td></tr>
<tr><td>06.01.2006</td><td><strong>Intel&#174; Multi-Threading Competion 5</strong> - <A href="/longcontest/?module=Static&d1=match_editorials&d2=intel_mtcs_5">Analysis</A></td></tr>
<tr><td>05.17.2006</td><td><strong>Marathon Match 1</strong> - <A href="/longcontest/?module=Static&d1=match_editorials&d2=mm_1">Analysis</A></td></tr>
<tr><td>05.03.2006</td><td><strong>Intel&#174; Multi-Threading Competion 4</strong> - <A href="/longcontest/?module=Static&d1=match_editorials&d2=intel_mtcs_4">Analysis</A></td></tr>
<tr><td>04.06.2006</td><td><strong>Intel&#174; Multi-Threading Competion 3</strong> - <A href="/longcontest/?module=Static&d1=match_editorials&d2=intel_mtcs_3">Analysis</A></td></tr>
<tr><td>03.08.2006</td><td><strong>Intel&#174; Multi-Threading Competion 2</strong> - <A href="/longcontest/?module=Static&d1=match_editorials&d2=intel_mtcs_2">Analysis</A></td></tr>
<tr><td>02.15.2006</td><td><strong>Intel&#174; Multi-Threading Competion 1</strong> - <A href="/longcontest/?module=Static&d1=match_editorials&d2=intel_mtcs_1">Analysis</A></td></tr>
<tr><td>12.22.2005</td><td><strong>Beta</strong> - <A href="/longcontest/?module=Static&d1=match_editorials&d2=beta">Analysis</A></td></tr>
</table>

   </div>
</div>
</td>

<%-- Right Column Begins --%>
<td width="170">
    <jsp:include page="../public_right.jsp">
        <jsp:param name="level1" value="default"/>
    </jsp:include>
</td>
<%-- Right Column Ends --%>

<td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
</tr>
</table>

<jsp:include page="../foot.jsp"/>
</body>
</html>