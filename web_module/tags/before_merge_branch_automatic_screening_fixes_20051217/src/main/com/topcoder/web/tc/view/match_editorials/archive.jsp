<%@  page language="java"  %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Statistics</title>

<jsp:include page="../script.jsp" />
<LINK REL="stylesheet" TYPE="text/css" HREF="/css/stats.css"/>

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
                <jsp:param name="level1" value="statistics"/>
                <jsp:param name="level2" value="match_editorials"/>
            </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Center Column Begins -->
<td class="statTableSpacer" width="100%" valign="top">
<div class="bodyText">
<jsp:include page="../page_title.jsp" >
<jsp:param name="image" value="statistics_w"/>
<jsp:param name="title" value="Match Editorials Archive"/>
</jsp:include>

<table width="100%" border="0" cellspacing="0" cellpadding="3">
   <tr valign="middle"><td class="statTextLarge" bgcolor="#999999" colspan="2"><font size="3">Match Editorial Archive - 2005</font></td></tr>
   
   <tr><td colspan="2"><img src="/i/clear.gif" alt="" width="1" height="5" border="0"/></td></tr>
   <tr><td valign="middle" class="bodyText" colspan="2"><strong>December</strong></td></tr>
   <tr><td class="bodyText">12.28.05</td><td class="bodyText" nowrap="0" width="100%">SRM 280 - <a href="/tc?module=Static&d1=match_editorials&d2=srm280">Problem Set & Analysis</a></td></tr>
   <tr><td class="bodyText">12.21.05</td><td class="bodyText" nowrap="0" width="100%">SRM 279 - <a href="/tc?module=Static&d1=match_editorials&d2=srm279">Problem Set & Analysis</a></td></tr>
   <tr><td class="bodyText">12.19.05</td><td class="bodyText" nowrap="0" width="100%">SRM 278 - <a href="/tc?module=Static&d1=match_editorials&d2=srm278">Problem Set & Analysis</a></td></tr>
   <tr><td class="bodyText">12.17.05</td><td class="bodyText" nowrap="0" width="100%">SRM 277 - <a href="/tc?module=Static&d1=match_editorials&d2=srm277">Problem Set & Analysis</a></td></tr>
   <tr><td class="bodyText">12.08.05</td><td class="bodyText" nowrap="0" width="100%">SRM 276 - <a href="/tc?module=Static&d1=match_editorials&d2=srm276">Problem Set & Analysis</a></td></tr>

   <tr><td colspan="2"><img src="/i/clear.gif" alt="" width="1" height="5" border="0"/></td></tr>
   <tr><td valign="middle" class="bodyText" colspan="2"><strong>November</strong></td></tr>
   <tr><td class="bodyText">11.30.05</td><td class="bodyText" nowrap="0" width="100%">SRM 275 - <a href="/tc?module=Static&d1=match_editorials&d2=srm275">Problem Set & Analysis</a></td></tr>
   <tr><td class="bodyText">11.23.05</td><td class="bodyText" nowrap="0" width="100%">SRM 274 - <a href="/tc?module=Static&d1=match_editorials&d2=srm274">Problem Set & Analysis</a></td></tr>
   <tr><td class="bodyText">11.21.05</td><td class="bodyText" nowrap="0" width="100%">SRM 273 - <a href="/tc?module=Static&d1=match_editorials&d2=srm273">Problem Set & Analysis</a></td></tr>
   <tr><td class="bodyText">11.19.05</td><td class="bodyText" nowrap="0" width="100%">SRM 272 - <a href="/tc?module=Static&d1=match_editorials&d2=srm272">Problem Set & Analysis</a></td></tr>
   <tr><td class="bodyText">11.08.05</td><td class="bodyText" nowrap="0" width="100%">SRM 271 - <a href="/tc?module=Static&d1=match_editorials&d2=srm271">Problem Set & Analysis</a></td></tr>
   <tr><td class="bodyText">11.03.05</td><td class="bodyText" nowrap="0" width="100%">SRM 270 - <a href="/tc?module=Static&d1=match_editorials&d2=srm270">Problem Set & Analysis</a></td></tr>

   <tr><td colspan="2"><img src="/i/clear.gif" alt="" width="1" height="5" border="0"/></td></tr>
   <tr><td valign="middle" class="bodyText" colspan="2"><strong>October</strong></td></tr>
   <tr><td class="bodyText">10.26.05</td><td class="bodyText" nowrap="0" width="100%">SRM 269 - <a href="/tc?module=Static&d1=match_editorials&d2=srm269">Problem Set & Analysis</a></td></tr>
   <tr><td class="bodyText">10.18.05</td><td class="bodyText" nowrap="0" width="100%">SRM 268 - <a href="/tc?module=Static&d1=match_editorials&d2=srm268">Problem Set & Analysis</a></td></tr>
   <tr><td class="bodyText">10.14.05</td><td class="bodyText" nowrap="0">TCO05 - Finals - <a href="/tc?module=Static&d1=tournaments&d2=tco05&d3=alg_finals_analysis">Problem Set & Analysis</a></td></tr>
   <tr><td class="bodyText">10.14.05</td><td class="bodyText" nowrap="0">TCO05 - WildCard Room - <a href="/tc?module=Static&d1=tournaments&d2=tco05&d3=alg_wildcard_analysis">Problem Set & Analysis</a></td></tr>
   <tr><td class="bodyText">10.13.05</td><td class="bodyText" nowrap="0">TCO05 - Semifinals Room 3 - <a href="/tc?module=Static&d1=tournaments&d2=tco05&d3=alg_room3_analysis">Problem Set & Analysis</a></td></tr>
   <tr><td class="bodyText">10.13.05</td><td class="bodyText" nowrap="0">TCO05 - Semifinals Room 2 - <a href="/tc?module=Static&d1=tournaments&d2=tco05&d3=alg_room2_analysis">Problem Set & Analysis</a></td></tr>
   <tr><td class="bodyText">10.13.05</td><td class="bodyText" nowrap="0">TCO05 - Semifinals Room 1 - <a href="/tc?module=Static&d1=tournaments&d2=tco05&d3=alg_room1_analysis">Problem Set & Analysis</a></td></tr>
   <tr><td class="bodyText">10.06.05</td><td class="bodyText" nowrap="0" width="100%">SRM 267 - <a href="/tc?module=Static&d1=match_editorials&d2=srm267">Problem Set & Analysis</a></td></tr>
   <tr><td class="bodyText">10.01.05</td><td class="bodyText" nowrap="0" width="100%">SRM 266 - <a href="/tc?module=Static&d1=match_editorials&d2=srm266">Problem Set & Analysis</a></td></tr>

   <tr><td colspan="2"><img src="/i/clear.gif" alt="" width="1" height="5" border="0"/></td></tr>
   <tr><td valign="middle" class="bodyText" colspan="2"><strong>September</strong></td></tr>
   <tr><td class="bodyText">09.27.05</td><td class="bodyText" nowrap="0" width="100%">SRM 265 - <a href="/tc?module=Static&d1=match_editorials&d2=srm265">Problem Set & Analysis</a></td></tr>
   <tr><td class="bodyText">09.20.05</td><td class="bodyText" nowrap="0" width="100%">SRM 264 - <a href="/tc?module=Static&d1=match_editorials&d2=srm264">Problem Set & Analysis</a></td></tr>
   <tr><td class="bodyText">09.14.05</td><td class="bodyText" nowrap="0" width="100%">SRM 263 - <a href="/tc?module=Static&d1=match_editorials&d2=srm263">Problem Set & Analysis</a></td></tr>
   <tr><td class="bodyText">09.09.05</td><td class="bodyText" nowrap="0" width="100%">SRM 262 - <a href="/tc?module=Static&d1=match_editorials&d2=srm262">Problem Set & Analysis</a></td></tr>
   <tr><td class="bodyText">09.07.05</td><td class="bodyText" nowrap="0" width="100%">TCO05 - Online Round 4 - <a href="/tc?module=Static&d1=match_editorials&d2=tco05_online_rd_4">Problem Set & Analysis</a></td></tr>

   <tr><td colspan="2"><img src="/i/clear.gif" alt="" width="1" height="5" border="0"/></td></tr>
   <tr><td valign="middle" class="bodyText" colspan="2"><strong>August</strong></td></tr>
   <tr><td class="bodyText">08.31.05</td><td class="bodyText" nowrap="0" width="100%">TCO05 - Online Round 3 - <a href="/tc?module=Static&d1=match_editorials&d2=tco05_online_rd_3">Problem Set & Analysis</a></td></tr>
   <tr><td class="bodyText">08.30.05</td><td class="bodyText" nowrap="0" width="100%">SRM 261 - <a href="/tc?module=Static&d1=match_editorials&d2=srm261">Problem Set & Analysis</a></td></tr>
   <tr><td class="bodyText">08.27.05</td><td class="bodyText" nowrap="0" width="100%">SRM 260 - <a href="/tc?module=Static&d1=match_editorials&d2=srm260">Problem Set & Analysis</a></td></tr>
   <tr><td class="bodyText">08.24.05</td><td class="bodyText" nowrap="0" width="100%">TCO05 - Online Round 2 - <a href="/index?t=statistics&c=tco05_online_rd_2">Problem Set & Analysis</a></td></tr>
   <tr><td class="bodyText">08.22.05</td><td class="bodyText" nowrap="0" width="100%">SRM 259 - <a href="/tc?module=Static&d1=match_editorials&d2=srm259">Problem Set & Analysis</a></td></tr>
   <tr><td class="bodyText">08.20.05</td><td class="bodyText" nowrap="0" width="100%">TCO05 - Online Round 1 - <a href="/index?t=statistics&c=tco05_online_rd_1">Problem Set & Analysis</a></td></tr>
   <tr><td class="bodyText">08.16.05</td><td class="bodyText" nowrap="0" width="100%">TCO05 - Qualification 5 - <a href="/tc?module=Static&d1=match_editorials&d2=tco05_qual5">Problem Set & Analysis</a></td></tr>
   <tr><td class="bodyText">08.16.05</td><td class="bodyText" nowrap="0" width="100%">TCO05 - Qualification 4 - <a href="/tc?module=Static&d1=match_editorials&d2=tco05_qual4">Problem Set & Analysis</a></td></tr>
   <tr><td class="bodyText">08.16.05</td><td class="bodyText" nowrap="0" width="100%">TCO05 - Qualification 3 - <a href="/tc?module=Static&d1=match_editorials&d2=tco05_qual3">Problem Set & Analysis</a></td></tr>
   <tr><td class="bodyText">08.16.05</td><td class="bodyText" nowrap="0" width="100%">TCO05 - Qualification 2 - <a href="/tc?module=Static&d1=match_editorials&d2=tco05_qual2">Problem Set & Analysis</a></td></tr>
   <tr><td class="bodyText">08.16.05</td><td class="bodyText" nowrap="0" width="100%">TCO05 - Qualification 1 - <a href="/tc?module=Static&d1=match_editorials&d2=tco05_qual1">Problem Set & Analysis</a></td></tr>
   <tr><td class="bodyText">08.10.05</td><td class="bodyText" nowrap="0" width="100%">SRM 258 - <a href="/tc?module=Static&d1=match_editorials&d2=srm258">Problem Set & Analysis</a></td></tr>
   <tr><td class="bodyText">08.08.05</td><td class="bodyText" nowrap="0" width="100%">SRM 257 - <a href="/tc?module=Static&d1=match_editorials&d2=srm257">Problem Set & Analysis</a></td></tr>
   <tr><td class="bodyText">08.02.05</td><td class="bodyText" nowrap="0" width="100%">SRM 256 - <a href="/tc?module=Static&d1=match_editorials&d2=srm256">Problem Set & Analysis</a></td></tr>
   
   <tr><td colspan="2"><img src="/i/clear.gif" alt="" width="1" height="5" border="0"/></td></tr>
   <tr><td valign="middle" class="bodyText" colspan="2"><strong>July</strong></td></tr>
   <tr><td class="bodyText">07.28.05</td><td class="bodyText" nowrap="0" width="100%">SRM 255 - <a href="/tc?module=Static&d1=match_editorials&d2=srm255">Problem Set & Analysis</a></td></tr>
   <tr><td class="bodyText">07.26.05</td><td class="bodyText" nowrap="0" width="100%">SRM 254 - <a href="/tc?module=Static&d1=match_editorials&d2=srm254">Problem Set & Analysis</a></td></tr>
   <tr><td class="bodyText">07.23.05</td><td class="bodyText" nowrap="0" width="100%">SRM 253 - <a href="/tc?module=Static&d1=match_editorials&d2=srm253">Problem Set & Analysis</a></td></tr>
   <tr><td class="bodyText">07.12.05</td><td class="bodyText" nowrap="0" width="100%">SRM 251 - <a href="/tc?module=Static&d1=match_editorials&d2=srm251">Problem Set & Analysis</a></td></tr>
   <tr><td class="bodyText">07.07.05</td><td class="bodyText" nowrap="0" width="100%">SRM 250 - <a href="/tc?module=Static&d1=match_editorials&d2=srm250">Problem Set & Analysis</a></td></tr>
   
   <tr><td colspan="2"><img src="/i/clear.gif" alt="" width="1" height="5" border="0"/></td></tr>
   <tr><td valign="middle" class="bodyText" colspan="2"><strong>June</strong></td></tr>
   <tr><td class="bodyText">06.29.05</td><td class="bodyText" nowrap="0" width="100%">SRM 249 - <a href="/tc?module=Static&d1=match_editorials&d2=srm249">Problem Set & Analysis</a></td></tr>
   <tr><td class="bodyText">06.21.05</td><td class="bodyText" nowrap="0" width="100%">SRM 248 - <a href="/tc?module=Static&d1=match_editorials&d2=srm248">Problem Set & Analysis</a></td></tr>
   <tr><td class="bodyText">06.18.05</td><td class="bodyText" nowrap="0" width="100%">SRM 247 - <a href="/tc?module=Static&d1=match_editorials&d2=srm247">Problem Set & Analysis</a></td></tr>
   <tr><td class="bodyText">06.09.05</td><td class="bodyText" nowrap="0" width="100%">SRM 246 - <a href="/tc?module=Static&d1=match_editorials&d2=srm246">Problem Set & Analysis</a></td></tr>
   <tr><td class="bodyText">06.01.05</td><td class="bodyText" nowrap="0" width="100%">SRM 245 - <a href="/tc?module=Static&d1=match_editorials&d2=srm245">Problem Set & Analysis</a></td></tr>
   
   <tr><td colspan="2"><img src="/i/clear.gif" alt="" width="1" height="5" border="0"/></td></tr>
   <tr><td valign="middle" class="bodyText" colspan="2"><strong>May</strong></td></tr>
   <tr><td class="bodyText">05.23.05</td><td class="bodyText" nowrap="0" width="100%">SRM 244 - <a href="/tc?module=Static&d1=match_editorials&d2=srm244">Problem Set & Analysis</a></td></tr>
   <tr><td class="bodyText">05.17.05</td><td class="bodyText" nowrap="0" width="100%">SRM 243 - <a href="/tc?module=Static&d1=match_editorials&d2=srm243">Problem Set & Analysis</a></td></tr>
   <tr><td class="bodyText">05.14.05</td><td class="bodyText" nowrap="0" width="100%">SRM 242 - <a href="/tc?module=Static&d1=match_editorials&d2=srm242">Problem Set & Analysis</a></td></tr>
   <tr><td class="bodyText">05.04.05</td><td class="bodyText" nowrap="0" width="100%">SRM 241 - <a href="/tc?module=Static&d1=match_editorials&d2=srm241">Problem Set & Analysis</a></td></tr>
   
   <tr><td colspan="2"><img src="/i/clear.gif" alt="" width="1" height="5" border="0"/></td></tr>
   <tr><td valign="middle" class="bodyText" colspan="2"><strong>April</strong></td></tr>
   <tr><td class="bodyText">04.30.05</td><td class="bodyText" nowrap="0" width="100%">SRM 240 - <a href="/tc?module=Static&d1=match_editorials&d2=srm240">Problem Set & Analysis</a></td></tr>
   <tr><td class="bodyText">04.18.05</td><td class="bodyText" nowrap="0" width="100%">SRM 239 - <a href="/tc?module=Static&d1=match_editorials&d2=srm239">Problem Set & Analysis</a></td></tr>
   <tr><td class="bodyText">04.14.05</td><td class="bodyText" nowrap="0" width="100%">SRM 238 - <a href="/tc?module=Static&d1=match_editorials&d2=srm238">Problem Set & Analysis</a></td></tr>
   <tr><td class="bodyText">04.06.05</td><td class="bodyText" nowrap="0" width="100%">SRM 237 - <a href="/tc?module=Static&d1=match_editorials&d2=srm237">Problem Set & Analysis</a></td></tr>
   <tr><td class="bodyText">04.02.05</td><td class="bodyText" nowrap="0" width="100%">SRM 236 - <a href="/tc?module=Static&d1=match_editorials&d2=srm236">Problem Set & Analysis</a></td></tr>
   
   <tr><td colspan="2"><img src="/i/clear.gif" alt="" width="1" height="5" border="0"/></td></tr>
   <tr><td valign="middle" class="bodyText" colspan="2"><strong>March</strong></td></tr>
   <tr><td class="bodyText">03.22.05</td><td class="bodyText" nowrap="0" width="100%">SRM 235 - <a href="/tc?module=Static&d1=match_editorials&d2=srm235">Problem Set & Analysis</a></td></tr>
   <tr><td class="bodyText">03.16.05</td><td class="bodyText" nowrap="0" width="100%">SRM 234 - <a href="/tc?module=Static&d1=match_editorials&d2=srm234">Problem Set & Analysis</a></td></tr>
   <tr><td class="bodyText">03.11.05</td><td class="bodyText" nowrap="0">TCCC05 - Finals - <a href="/tc?module=Static&d1=tournaments&d2=tccc05&d3=alg_finals_analysis">Problem Set & Analysis</a></td></tr>
   <tr><td class="bodyText">03.11.05</td><td class="bodyText" nowrap="0">TCCC05 - WildCard Room - <a href="/tc?module=Static&d1=tournaments&d2=tccc05&d3=alg_wildcard_analysis">Problem Set & Analysis</a></td></tr>
   <tr><td class="bodyText">03.10.05</td><td class="bodyText" nowrap="0">TCCC05 - Semifinals Room 3 - <a href="/tc?module=Static&d1=tournaments&d2=tccc05&d3=alg_room3_analysis">Problem Set & Analysis</a></td></tr>
   <tr><td class="bodyText">03.10.05</td><td class="bodyText" nowrap="0">TCCC05 - Semifinals Room 2 - <a href="/tc?module=Static&d1=tournaments&d2=tccc05&d3=alg_room2_analysis">Problem Set & Analysis</a></td></tr>
   <tr><td class="bodyText">03.10.05</td><td class="bodyText" nowrap="0">TCCC05 - Semifinals Room 1 - <a href="/tc?module=Static&d1=tournaments&d2=tccc05&d3=alg_room1_analysis">Problem Set & Analysis</a></td></tr>
   <tr><td class="bodyText">03.02.05</td><td class="bodyText" nowrap="0" width="100%">SRM 233 - <a href="/tc?module=Static&d1=match_editorials&d2=srm233">Problem Set & Analysis</a></td></tr>
   
   <tr><td colspan="2"><img src="/i/clear.gif" alt="" width="1" height="5" border="0"/></td></tr>
   <tr><td valign="middle" class="bodyText" colspan="2"><strong>February</strong></td></tr>
   <tr><td class="bodyText">02.23.05</td><td class="bodyText" nowrap="0" width="100%">SRM 232 - <a href="/tc?module=Static&d1=match_editorials&d2=srm232">Problem Set & Analysis</a></td></tr>
   <tr><td class="bodyText">02.19.05</td><td class="bodyText" nowrap="0" width="100%">SRM 231 - <a href="/tc?module=Static&d1=match_editorials&d2=srm231">Problem Set & Analysis</a></td></tr>
   <tr><td class="bodyText">02.08.05</td><td class="bodyText" nowrap="0" width="100%">SRM 230 - <a href="/tc?module=Static&d1=match_editorials&d2=srm230">Problem Set & Analysis</a></td></tr>
   <tr><td class="bodyText">02.02.05</td><td class="bodyText" nowrap="0">TCCC05 - Online Round 4 - <a href="/index?t=statistics&c=tccc05_online_rd_4">Problem Set & Analysis</a></td></tr>
   
   <tr><td colspan="2"><img src="/i/clear.gif" alt="" width="1" height="5" border="0"/></td></tr>
   <tr><td valign="middle" class="bodyText" colspan="2"><strong>January</strong></td></tr>
   <tr><td class="bodyText">01.31.05</td><td class="bodyText" nowrap="0" width="100%">SRM 229 - <a href="/tc?module=Static&d1=match_editorials&d2=srm229">Problem Set & Analysis</a></td></tr>
   <tr><td class="bodyText">01.27.05</td><td class="bodyText" nowrap="0" width="100%">SRM 228 - <a href="/tc?module=Static&d1=match_editorials&d2=srm229">Problem Set & Analysis</a></td></tr>
   <tr><td class="bodyText">01.26.05</td><td class="bodyText" nowrap="0">TCCC05 - Online Round 3 - <a href="/index?t=statistics&c=tccc05_online_rd_3">Problem Set & Analysis</a></td></tr>
   <tr><td class="bodyText">01.22.05</td><td class="bodyText" nowrap="0" width="100%">SRM 227 - <a href="/tc?module=Static&d1=match_editorials&d2=srm227">Problem Set & Analysis</a></td></tr>
   <tr><td class="bodyText">01.19.05</td><td class="bodyText" nowrap="0">TCCC05 - Online Round 2 - <a href="/index?t=statistics&c=tccc05_online_rd_2">Problem Set & Analysis</a></td></tr>
   <tr><td class="bodyText">01.15.05</td><td class="bodyText" nowrap="0">TCCC05 - Online Round 1 - <a href="/index?t=statistics&c=tccc05_online_rd_1">Problem Set & Analysis</a></td></tr>
   <tr><td class="bodyText">01.12.05</td><td class="bodyText" nowrap="0">TCCC05 - Qualification 5 - <a href="/index?t=statistics&c=tccc05_qual_5">Problem Set & Analysis</a></td></tr>
   <tr><td class="bodyText">01.12.05</td><td class="bodyText" nowrap="0">TCCC05 - Qualification 4 - <a href="/index?t=statistics&c=tccc05_qual_4">Problem Set & Analysis</a></td></tr>
   <tr><td class="bodyText">01.12.05</td><td class="bodyText" nowrap="0">TCCC05 - Qualification 3 - <a href="/index?t=statistics&c=tccc05_qual_3">Problem Set & Analysis</a></td></tr>
   <tr><td class="bodyText">01.12.05</td><td class="bodyText" nowrap="0">TCCC05 - Qualification 2 - <a href="/index?t=statistics&c=tccc05_qual_2">Problem Set & Analysis</a></td></tr>
   <tr><td class="bodyText">01.12.05</td><td class="bodyText" nowrap="0">TCCC05 - Qualification 1 - <a href="/index?t=statistics&c=tccc05_qual_1">Problem Set & Analysis</a></td></tr>
   <tr><td class="bodyText">01.05.05</td><td class="bodyText" nowrap="0" width="100%">SRM 226 - <a href="/tc?module=Static&d1=match_editorials&d2=srm226">Problem Set & Analysis</a></td></tr>
   </table>
   
   <br/><br/>
   
   <table width="100%" border="0" cellspacing="0" cellpadding="3">
   <tr valign="middle"><td class="statTextLarge" bgcolor="#999999" colspan="2"><font size="3">Match Editorial Archive - 2004</font></td></tr>
   
   <tr><td colspan="2"><img src="/i/clear.gif" alt="" width="1" height="5" border="0"/></td></tr>
   <tr><td valign="middle" class="bodyText" colspan="2"><strong>December</strong></td></tr>
   <tr><td class="bodyText">12.28.04</td><td class="bodyText" nowrap="0">SRM 225 - <a href="/tc?module=Static&d1=match_editorials&d2=srm225">Problem Set & Analysis</a></td></tr>
   <tr><td class="bodyText">12.22.04</td><td class="bodyText" nowrap="0">SRM 224 - <a href="/tc?module=Static&d1=match_editorials&d2=srm224">Problem Set & Analysis</a></td></tr>
   <tr><td class="bodyText">12.18.04</td><td class="bodyText" nowrap="0">SRM 223 - <a href="/tc?module=Static&d1=match_editorials&d2=srm223">Problem Set & Analysis</a></td></tr>
   <tr><td class="bodyText">12.07.04</td><td class="bodyText" nowrap="0">SRM 222 - <a href="/tc?module=Static&d1=match_editorials&d2=srm222">Problem Set & Analysis</a></td></tr>
   <tr><td class="bodyText">12.01.04</td><td class="bodyText" nowrap="0">SRM 221 - <a href="/tc?module=Static&d1=match_editorials&d2=srm221">Problem Set & Analysis</a></td></tr>
   
   <tr><td colspan="2"><img src="/i/clear.gif" alt="" width="1" height="5" border="0"/></td></tr>
   <tr><td valign="middle" class="bodyText" colspan="2"><strong>November</strong></td></tr>
   <tr><td class="bodyText">11.23.04</td><td class="bodyText" nowrap="0">SRM 220 - <a href="/tc?module=Static&d1=match_editorials&d2=srm220">Problem Set & Analysis</a></td></tr>
   <tr><td class="bodyText">11.20.04</td><td class="bodyText" nowrap="0">SRM 219 - <a href="/tc?module=Static&d1=match_editorials&d2=srm219">Problem Set & Analysis</a></td></tr>
   <tr><td class="bodyText">11.12.04</td><td class="bodyText" nowrap="0">TCO04 - Finals - <a href="/tc?module=Static&d1=tournaments&d2=tco04&d3=alg_finals_analysis">Problem Set & Analysis</a></td></tr>
   <tr><td class="bodyText">11.12.04</td><td class="bodyText" nowrap="0">TCO04 - WildCard Round - <a href="/tc?module=Static&d1=tournaments&d2=tco04&d3=alg_wildcard_analysis">Problem Set & Analysis</a></td></tr>
   <tr><td class="bodyText">11.11.04</td><td class="bodyText" nowrap="0">TCO04 - Semifinals Room 3 - <a href="/tc?module=Static&d1=tournaments&d2=tco04&d3=alg_room3_analysis">Problem Set & Analysis</a></td></tr>
   <tr><td class="bodyText">11.11.04</td><td class="bodyText" nowrap="0">TCO04 - Semifinals Room 2 - <a href="/tc?module=Static&d1=tournaments&d2=tco04&d3=alg_room2_analysis">Problem Set & Analysis</a></td></tr>
   <tr><td class="bodyText">11.11.04</td><td class="bodyText" nowrap="0">TCO04 - Semifinals Room 1 - <a href="/tc?module=Static&d1=tournaments&d2=tco04&d3=alg_room1_analysis">Problem Set & Analysis</a></td></tr>
   <tr><td class="bodyText">11.04.04</td><td class="bodyText" nowrap="0">SRM 218- <a href="/tc?module=Static&d1=match_editorials&d2=srm218">Problem Set & Analysis</a></td></tr>
   
   <tr><td colspan="2"><img src="/i/clear.gif" alt="" width="1" height="5" border="0"/></td></tr>
   <tr><td valign="middle" class="bodyText" colspan="2"><strong>October</strong></td></tr>
   <tr><td class="bodyText">10.27.04</td><td class="bodyText" nowrap="0">SRM 217- <a href="/tc?module=Static&d1=match_editorials&d2=srm217">Problem Set & Analysis</a></td></tr>
   <tr><td class="bodyText">10.18.04</td><td class="bodyText" nowrap="0">SRM 216- <a href="/tc?module=Static&d1=match_editorials&d2=srm216">Problem Set & Analysis</a></td></tr>
   <tr><td class="bodyText">10.16.04</td><td class="bodyText" nowrap="0">SRM 215- <a href="/tc?module=Static&d1=match_editorials&d2=srm215">Problem Set & Analysis</a></td></tr>
   <tr><td class="bodyText">10.06.04</td><td class="bodyText" nowrap="0">SRM 214- <a href="/tc?module=Static&d1=match_editorials&d2=srm214">Problem Set & Analysis</a></td></tr>
   
   <tr><td colspan="2"><img src="/i/clear.gif" alt="" width="1" height="5" border="0"/></td></tr>
   <tr><td valign="middle" class="bodyText" colspan="2"><strong>September</strong></td></tr>
   <tr><td class="bodyText">09.29.04</td><td class="bodyText" nowrap="0">TCO04 - Online Round 4 - <a href="/index?t=statistics&c=tco04_online_rd_4">Problem Set & Analysis</a></td></tr>
   <tr><td class="bodyText">09.28.04</td><td class="bodyText" nowrap="0">SRM 213- <a href="/tc?module=Static&d1=match_editorials&d2=srm213">Problem Set & Analysis</a></td></tr>
   <tr><td class="bodyText">09.25.04</td><td class="bodyText" nowrap="0">SRM 212- <a href="/tc?module=Static&d1=match_editorials&d2=srm212">Problem Set & Analysis</a></td></tr>
   <tr><td class="bodyText">09.22.04</td><td class="bodyText" nowrap="0">TCO04 - Online Round 3 - <a href="/index?t=statistics&c=tco04_online_rd_3">Problem Set & Analysis</a></td></tr>
   <tr><td class="bodyText">09.14.04</td><td class="bodyText" nowrap="0">TCO04 - Online Round 2 - <a href="/index?t=statistics&c=tco04_online_rd_2">Problem Set & Analysis</a></td></tr>
   <tr><td class="bodyText">09.14.04</td><td class="bodyText" nowrap="0">SRM 211- <a href="/tc?module=Static&d1=match_editorials&d2=srm211">Problem Set & Analysis</a></td></tr>
   <tr><td class="bodyText">09.11.04</td><td class="bodyText" nowrap="0">TCO04 - Online Round 1 - <a href="/index?t=statistics&c=tco04_online_rd_1">Problem Set & Analysis</a></td></tr>
   <tr><td class="bodyText">09.08.04</td><td class="bodyText" nowrap="0">TCO04 - Qualification 5 - <a href="/index?t=statistics&c=tco04_qual_5">Problem Set & Analysis</a></td></tr>
   <tr><td class="bodyText">09.08.04</td><td class="bodyText" nowrap="0">TCO04 - Qualification 4 - <a href="/index?t=statistics&c=tco04_qual_4">Problem Set & Analysis</a></td></tr>
   <tr><td class="bodyText">09.08.04</td><td class="bodyText" nowrap="0">TCO04 - Qualification 3 - <a href="/index?t=statistics&c=tco04_qual_3">Problem Set & Analysis</a></td></tr>
   <tr><td class="bodyText">09.08.04</td><td class="bodyText" nowrap="0">TCO04 - Qualification 2 - <a href="/index?t=statistics&c=tco04_qual_2">Problem Set & Analysis</a></td></tr>
   <tr><td class="bodyText">09.08.04</td><td class="bodyText" nowrap="0">TCO04 - Qualification 1 - <a href="/index?t=statistics&c=tco04_qual_1">Problem Set & Analysis</a></td></tr>
   <tr><td class="bodyText">09.01.04</td><td class="bodyText" nowrap="0">SRM 210- <a href="/tc?module=Static&d1=match_editorials&d2=srm210">Problem Set & Analysis</a></td></tr>
   
   <tr><td colspan="2"><img src="/i/clear.gif" alt="" width="1" height="5" border="0"/></td></tr>
   <tr><td valign="middle" class="bodyText" colspan="2"><strong>August</strong></td></tr>
   <tr><td class="bodyText">08.28.04</td><td class="bodyText" nowrap="0">SRM 209- <a href="/tc?module=Static&d1=match_editorials&d2=srm209">Problem Set & Analysis</a></td></tr>
   <tr><td class="bodyText">08.18.04</td><td class="bodyText" nowrap="0">SRM 208- <a href="/tc?module=Static&d1=match_editorials&d2=srm208">Problem Set & Analysis</a></td></tr>
   <tr><td class="bodyText">08.10.04</td><td class="bodyText" nowrap="0">SRM 207- <a href="/tc?module=Static&d1=match_editorials&d2=srm207">Problem Set & Analysis</a></td></tr>
   <tr><td class="bodyText">08.04.04</td><td class="bodyText" nowrap="0">SRM 206- <a href="/tc?module=Static&d1=match_editorials&d2=srm206">Problem Set & Analysis</a></td></tr>
   
   <tr><td colspan="2"><img src="/i/clear.gif" alt="" width="1" height="5" border="0"/></td></tr>
   <tr><td valign="middle" class="bodyText" colspan="2"><strong>July</strong></td></tr>
   <tr><td class="bodyText">07.31.04</td><td class="bodyText" nowrap="0">SRM 205- <a href="/tc?module=Static&d1=match_editorials&d2=srm205">Problem Set & Analysis</a></td></tr>
   <tr><td class="bodyText">07.21.04</td><td class="bodyText" nowrap="0">SRM 204- <a href="/tc?module=Static&d1=match_editorials&d2=srm204">Problem Set & Analysis</a></td></tr>
   <tr><td class="bodyText">07.15.04</td><td class="bodyText" nowrap="0">SRM 203- <a href="/tc?module=Static&d1=match_editorials&d2=srm203">Problem Set & Analysis</a></td></tr>
   <tr><td class="bodyText">07.07.04</td><td class="bodyText" nowrap="0">SRM 202- <a href="/tc?module=Static&d1=match_editorials&d2=srm202">Problem Set & Analysis</a></td></tr>
   
   <tr><td colspan="2"><img src="/i/clear.gif" alt="" width="1" height="5" border="0"/></td></tr>
   <tr><td valign="middle" class="bodyText" colspan="2"><strong>June</strong></td></tr>
   <tr><td class="bodyText">06.29.04</td><td class="bodyText" nowrap="0">SRM 201- <a href="/tc?module=Static&d1=match_editorials&d2=srm201">Problem Set & Analysis</a></td></tr>
   <tr><td class="bodyText">06.21.04</td><td class="bodyText" nowrap="0">SRM 200- <a href="/tc?module=Static&d1=match_editorials&d2=srm200">Problem Set & Analysis</a></td></tr>
   <tr><td class="bodyText">06.16.04</td><td class="bodyText" nowrap="0">SRM 199- <a href="/tc?module=Static&d1=match_editorials&d2=srm199">Problem Set & Analysis</a></td></tr>
   <tr><td class="bodyText">06.12.04</td><td class="bodyText" nowrap="0">SRM 198- <a href="/tc?module=Static&d1=match_editorials&d2=srm198">Problem Set & Analysis</a></td></tr>
   <tr><td class="bodyText">06.02.04</td><td class="bodyText" nowrap="0">SRM 197- <a href="/tc?module=Static&d1=match_editorials&d2=srm197">Problem Set & Analysis</a></td></tr>
   
   <tr><td colspan="2"><img src="/i/clear.gif" alt="" width="1" height="5" border="0"/></td></tr>
   <tr><td valign="middle" class="bodyText" colspan="2"><strong>May</strong></td></tr>
   <tr><td class="bodyText">05.27.04</td><td class="bodyText" nowrap="0">SRM 196- <a href="/tc?module=Static&d1=match_editorials&d2=srm196">Problem Set & Analysis</a></td></tr>
   <tr><td class="bodyText">05.18.04</td><td class="bodyText" nowrap="0">SRM 195- <a href="/tc?module=Static&d1=match_editorials&d2=srm195">Problem Set & Analysis</a></td></tr>
   <tr><td class="bodyText">05.15.04</td><td class="bodyText" nowrap="0">SRM 194- <a href="/tc?module=Static&d1=match_editorials&d2=srm194">Problem Set & Analysis</a></td></tr>
   <tr><td class="bodyText">05.05.04</td><td class="bodyText" nowrap="0">SRM 193- <a href="/tc?module=Static&d1=match_editorials&d2=srm193">Problem Set & Analysis</a></td></tr>
   
   <tr><td colspan="2"><img src="/i/clear.gif" alt="" width="1" height="5" border="0"/></td></tr>
   <tr><td valign="middle" class="bodyText" colspan="2"><strong>April</strong></td></tr>
   <tr><td class="bodyText">04.27.04</td><td class="bodyText" nowrap="0">SRM 192- <a href="/tc?module=Static&d1=match_editorials&d2=srm192">Problem Set & Analysis</a></td></tr>
   <tr><td class="bodyText">04.24.04</td><td class="bodyText" nowrap="0">SRM 191- <a href="/tc?module=Static&d1=match_editorials&d2=srm191">Problem Set & Analysis</a></td></tr>
   <tr><td class="bodyText">04.16.04</td><td class="bodyText" nowrap="0">TCCC04 - Finals - <a href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=alg_finals_analysis">Problem Set & Analysis</a></td></tr>
   <tr><td class="bodyText">04.15.04</td><td class="bodyText" nowrap="0">TCCC04 - Wildcard Room - <a href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=alg_wildcard_analysis">Problem Set & Analysis</a></td></tr>
   <tr><td class="bodyText">04.15.04</td><td class="bodyText" nowrap="0">TCCC04 - Semi Room 3 - <a href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=alg_room3_analysis">Problem Set & Analysis</a></td></tr>
   <tr><td class="bodyText">04.15.04</td><td class="bodyText" nowrap="0">TCCC04 - Semi Room 2 - <a href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=alg_room2_analysis">Problem Set & Analysis</a></td></tr>
   <tr><td class="bodyText">04.15.04</td><td class="bodyText" nowrap="0">TCCC04 - Semi Room 1 - <a href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=alg_room1_analysis">Problem Set & Analysis</a></td></tr>
   <tr><td class="bodyText">04.06.04</td><td class="bodyText" nowrap="0">SRM 190 - <a href="/tc?module=Static&d1=match_editorials&d2=srm191">Problem Set & Analysis</a></td></tr>
   
   <tr><td colspan="2"><img src="/i/clear.gif" alt="" width="1" height="5" border="0"/></td></tr>
   <tr><td valign="middle" class="bodyText" colspan="2"><strong>March</strong></td></tr>
   <tr><td class="bodyText">03.31.04</td><td class="bodyText" nowrap="0">SRM 189 - <a href="/tc?module=Static&d1=match_editorials&d2=srm189">Problem Set & Analysis</a></td></tr>
   <tr><td class="bodyText">03.25.04</td><td class="bodyText" nowrap="0">SRM 188 - <a href="/tc?module=Static&d1=match_editorials&d2=srm188">Problem Set & Analysis</a></td></tr>
   <tr><td class="bodyText">03.17.04</td><td class="bodyText" nowrap="0">TCCC04 - Online Round 4 - <a href="/index?t=statistics&c=tccc04_online_rd_4">Problem Set & Analysis</a></td></tr>
   <tr><td class="bodyText">03.16.04</td><td class="bodyText" nowrap="0">SRM 187 - <a href="/tc?module=Static&d1=match_editorials&d2=srm187">Problem Set & Analysis</a></td></tr>
   <tr><td class="bodyText">03.13.04</td><td class="bodyText" nowrap="0">SRM 186 - <a href="/tc?module=Static&d1=match_editorials&d2=srm186">Problem Set & Analysis</a></td></tr>
   <tr><td class="bodyText">03.10.04</td><td class="bodyText" nowrap="0">TCCC04 - Online Round 3 - <a href="/index?t=statistics&c=tccc04_online_rd_3">Problem Set & Analysis</a></td></tr>
   <tr><td class="bodyText">03.03.04</td><td class="bodyText" nowrap="0">TCCC04 - Online Round 2 - <a href="/index?t=statistics&c=tccc04_online_rd_2">Problem Set & Analysis</a></td></tr>
   <tr><td class="bodyText">03.01.04</td><td class="bodyText" nowrap="0">SRM 185 - <a href="/tc?module=Static&d1=match_editorials&d2=srm185">Problem Set & Analysis</a></td></tr>
   
   <tr><td colspan="2"><img src="/i/clear.gif" alt="" width="1" height="5" border="0"/></td></tr>
   <tr><td valign="middle" class="bodyText" colspan="2"><strong>February</strong></td></tr>
   <tr><td class="bodyText">02.28.04</td><td class="bodyText" nowrap="0">TCCC04 - Online Round 1 - <a href="/index?t=statistics&c=tccc04_online_rd_1">Problem Set & Analysis</a></td></tr>
   <tr><td class="bodyText">02.24.04</td><td class="bodyText" nowrap="0">TCCC04 - Qualification 5 - <a href="/index?t=statistics&c=tccc04_qual_5">Problem Set & Analysis</a></td></tr>
   <tr><td class="bodyText">02.24.04</td><td class="bodyText" nowrap="0">TCCC04 - Qualification 4 - <a href="/index?t=statistics&c=tccc04_qual_4">Problem Set & Analysis</a></td></tr>
   <tr><td class="bodyText">02.24.04</td><td class="bodyText" nowrap="0">TCCC04 - Qualification 3 - <a href="/index?t=statistics&c=tccc04_qual_3">Problem Set & Analysis</a></td></tr>
   <tr><td class="bodyText">02.24.04</td><td class="bodyText" nowrap="0">TCCC04 - Qualification 2 - <a href="/index?t=statistics&c=tccc04_qual_2">Problem Set & Analysis</a></td></tr>
   <tr><td class="bodyText">02.24.04</td><td class="bodyText" nowrap="0">TCCC04 - Qualification 1 - <a href="/index?t=statistics&c=tccc04_qual_1">Problem Set & Analysis</a></td></tr>
   <tr><td class="bodyText">02.17.04</td><td class="bodyText" nowrap="0">SRM 184 - <a href="/tc?module=Static&d1=match_editorials&d2=srm184">Problem Set & Analysis</a></td></tr>
   <tr><td class="bodyText">02.11.04</td><td class="bodyText" nowrap="0">SRM 183 - <a href="/tc?module=Static&d1=match_editorials&d2=srm183">Problem Set & Analysis</a></td></tr>
   <tr><td class="bodyText">02.07.04</td><td class="bodyText" nowrap="0">SRM 182 - <a href="/tc?module=Static&d1=match_editorials&d2=srm182">Problem Set & Analysis</a></td></tr>
   
   <tr><td valign="middle" class="bodyText" colspan="2"><strong>January</strong></td></tr>
   <tr><td class="bodyText">01.28.04</td><td class="bodyText" nowrap="0">SRM 181 - <a href="/tc?module=Static&d1=match_editorials&d2=srm181">Problem Set & Analysis</a></td></tr>
   <tr><td class="bodyText">01.22.04</td><td class="bodyText" nowrap="0">SRM 180 - <a href="/tc?module=Static&d1=match_editorials&d2=srm180">Problem Set & Analysis</a></td></tr>
   <tr><td class="bodyText">01.17.04</td><td class="bodyText" nowrap="0">SRM 179 - <a href="/tc?module=Static&d1=match_editorials&d2=srm179">Problem Set & Analysis</a></td></tr>
   <tr><td class="bodyText">01.07.04</td><td class="bodyText" nowrap="0" width="100%">SRM 178 - <a href="/tc?module=Static&d1=match_editorials&d2=srm178">Problem Set & Analysis</a></td></tr>
   </table>
   
   <br/><br/>
   
   <table width="100%" border="0" cellspacing="0" cellpadding="3">
   <tr valign="middle"><td class="statTextLarge" bgcolor="#999999" colspan="2"><font size="3">Match Editorial Archive - 2003</font></td></tr>
   
   <tr><td colspan="2"><img src="/i/clear.gif" alt="" width="1" height="5" border="0"/></td></tr>
   <tr><td valign="middle" class="bodyText" colspan="2"><strong>December</strong></td></tr>
   <tr><td class="bodyText">12.30.03</td><td class="bodyText" nowrap="0">SRM 177 - <a href="/tc?module=Static&d1=match_editorials&d2=srm177">Problem Set & Analysis</a></td></tr>
   <tr><td class="bodyText">12.22.03</td><td class="bodyText" nowrap="0">SRM 176 - <a href="/tc?module=Static&d1=match_editorials&d2=srm176">Problem Set & Analysis</a></td></tr>
   <tr><td class="bodyText">12.17.03</td><td class="bodyText" nowrap="0">SRM 175 - <a href="/tc?module=Static&d1=match_editorials&d2=srm175">Problem Set & Analysis</a></td></tr>
   <tr><td class="bodyText">12.13.03</td><td class="bodyText" nowrap="0">SRM 174 - <a href="/tc?module=Static&d1=match_editorials&d2=srm174">Problem Set & Analysis</a></td></tr>
   <tr><td class="bodyText">12.05.03</td><td class="bodyText" nowrap="0">2003 TCO Finals - <a href="/tc?module=Static&d1=tournaments&d2=tco03&d3=summary&d4=final_analysis">Problem Set & Analysis</a></td></tr>
   <tr><td class="bodyText">12.04.03</td><td class="bodyText" nowrap="0">2003 TCO Semi Room 4 - <a href="/tc?module=Static&d1=tournaments&d2=tco03&d3=summary&d4=room4_analysis">Problem Set & Analysis</a></td></tr>
   <tr><td class="bodyText">12.04.03</td><td class="bodyText" nowrap="0">2003 TCO Semi Room 3 - <a href="/tc?module=Static&d1=tournaments&d2=tco03&d3=summary&d4=room3_analysis">Problem Set & Analysis</a></td></tr>
   <tr><td class="bodyText">12.04.03</td><td class="bodyText" nowrap="0">2003 TCO Semi Room 2 - <a href="/tc?module=Static&d1=tournaments&d2=tco03&d3=summary&d4=room2_analysis">Problem Set & Analysis</a></td></tr>
   <tr><td class="bodyText">12.04.03</td><td class="bodyText" nowrap="0">2003 TCO Semi Room 1 - <a href="/tc?module=Static&d1=tournaments&d2=tco03&d3=summary&d4=room1_analysis">Problem Set & Analysis</a></td></tr>
   
   <tr><td valign="middle" class="bodyText" colspan="2"><strong>November</strong></td></tr>
   <tr><td class="bodyText">11.26.03</td><td class="bodyText" nowrap="0">SRM 173 - <a href="/tc?module=Static&d1=match_editorials&d2=srm173">Problem Set & Analysis</a></td></tr>
   <tr><td class="bodyText">11.20.03</td><td class="bodyText" nowrap="0">SRM 172 - <a href="/tc?module=Static&d1=match_editorials&d2=srm172">Problem Set & Analysis</a></td></tr>
   <tr><td class="bodyText">11.17.03</td><td class="bodyText" nowrap="0">CRPF - Finals - <a href="/index?t=statistics&c=crpf_finals_prob">Problem Set & Analysis</a></td></tr>
   <tr><td class="bodyText">11.12.03</td><td class="bodyText" nowrap="0">SRM 171 - <a href="/tc?module=Static&d1=match_editorials&d2=srm171">Problem Set & Analysis</a></td></tr>
   <tr><td class="bodyText">11.11.03</td><td class="bodyText" nowrap="0">CRPF - Round 1 - <a href="/index?t=statistics&c=crpf_rd1_prob">Problem Set & Analysis</a></td></tr>
   <tr><td class="bodyText">11.08.03</td><td class="bodyText" nowrap="0">SRM 170 - <a href="/tc?module=Static&d1=match_editorials&d2=srm170">Problem Set & Analysis</a></td></tr>
   <tr><td class="bodyText">11.05.03</td><td class="bodyText" nowrap="0">TCO - Online Round 4 - <a href="/index?t=statistics&c=tco03_online_rd_4">Problem Set & Analysis</a></td></tr>
   
   <tr><td colspan="2"><img src="/i/clear.gif" alt="" width="1" height="5" border="0"/></td></tr>
   
   <tr><td valign="middle" class="bodyText" colspan="2"><strong>October</strong></td></tr>
   <tr><td class="bodyText">10.29.03</td><td class="bodyText" nowrap="0">TCO - Online Round 3 - <a href="/index?t=statistics&c=tco03_online_rd_3">Problem Set & Analysis</a></td></tr>
   <tr><td class="bodyText">10.28.03</td><td class="bodyText" nowrap="0">SRM 169 - <a href="/tc?module=Static&d1=match_editorials&d2=srm169">Problem Set & Analysis</a></td></tr>
   <tr><td class="bodyText">10.22.03</td><td class="bodyText" nowrap="0">TCO - Online Round 2 - <a href="/index?t=statistics&c=tco03_online_rd_2">Problem Set & Analysis</a></td></tr>
   <tr><td class="bodyText">10.21.03</td><td class="bodyText" nowrap="0">SRM 168 - <a href="/tc?module=Static&d1=match_editorials&d2=srm168">Problem Set & Analysis</a></td></tr>
   <tr><td class="bodyText">10.15.03</td><td class="bodyText" nowrap="0">TCO - Online Round 1 - <a href="/index?t=statistics&c=tco03_online_rd_1">Problem Set & Analysis</a></td></tr>
   <tr><td class="bodyText">10.14.03</td><td class="bodyText" nowrap="0">SRM 167 - <a href="/tc?module=Static&d1=match_editorials&d2=srm167">Problem Set & Analysis</a></td></tr>
   <tr><td class="bodyText">10.09.03</td><td class="bodyText" nowrap="0">TCO - Qualification Round 2 - <a href="/index?t=statistics&c=tco03_qual_rd_2">Problem Set & Analysis</a></td></tr>
   <tr><td class="bodyText">10.07.03</td><td class="bodyText" nowrap="0">TCO - Qualification Round 1 - <a href="/index?t=statistics&c=tco03_qual_rd_1">Problem Set & Analysis</a></td></tr>
   <tr><td class="bodyText">10.01.03</td><td class="bodyText" nowrap="0">SRM 166 - <a href="/tc?module=Static&d1=match_editorials&d2=srm166">Problem Set & Analysis</a></td></tr>
   
   <tr><td colspan="2"><img src="/i/clear.gif" alt="" width="1" height="5" border="0"/></td></tr>
   
   <tr><td valign="middle" class="bodyText" colspan="2"><strong>September</strong></td></tr>
   <tr><td class="bodyText">09.23.03</td><td class="bodyText" nowrap="0">SRM 165 - <a href="/tc?module=Static&d1=match_editorials&d2=srm165">Problem Set & Analysis</a></td></tr>
   <tr><td class="bodyText">09.20.03</td><td class="bodyText" nowrap="0">SRM 164 - <a href="/tc?module=Static&d1=match_editorials&d2=srm164">Problem Set & Analysis</a></td></tr>
   <tr><td class="bodyText">09.08.03</td><td class="bodyText" nowrap="0">SRM 163 - <a href="/tc?module=Static&d1=match_editorials&d2=srm163">Problem Set & Analysis</a></td></tr>
   <tr><td class="bodyText">09.03.03</td><td class="bodyText" nowrap="0">SRM 162 - <a href="/tc?module=Static&d1=match_editorials&d2=srm162">Problem Set & Analysis</a></td></tr>
   
   <tr><td colspan="2"><img src="/i/clear.gif" alt="" width="1" height="5" border="0"/></td></tr>
   
   <tr><td valign="middle" class="bodyText" colspan="2"><strong>August</strong></td></tr>
   <tr><td class="bodyText">08.28.03</td><td class="bodyText" nowrap="0">SRM 161 - <a href="/tc?module=Static&d1=match_editorials&d2=srm161">Problem Set & Analysis</a></td></tr>
   <tr><td class="bodyText">08.23.03</td><td class="bodyText" nowrap="0">SRM 160 - <a href="/tc?module=Static&d1=match_editorials&d2=srm160">Problem Set & Analysis</a></td></tr>
   <tr><td class="bodyText">08.12.03</td><td class="bodyText" nowrap="0">SRM 159 - <a href="/tc?module=Static&d1=match_editorials&d2=srm159">Problem Set & Analysis</a></td></tr>
   <tr><td class="bodyText">08.06.03</td><td class="bodyText" nowrap="0">SRM 158 - <a href="/tc?module=Static&d1=match_editorials&d2=srm158">Problem Set & Analysis</a></td></tr>
   
   <tr><td colspan="2"><img src="/i/clear.gif" alt="" width="1" height="5" border="0"/></td></tr>
   
   <tr><td valign="middle" class="bodyText" colspan="2"><strong>July</strong></td></tr>
   <tr><td class="bodyText">07.28.03</td><td class="bodyText" nowrap="0">SRM 157 - <a href="/tc?module=Static&d1=match_editorials&d2=srm157">Problem Set & Analysis</a></td></tr>
   <tr><td class="bodyText">07.23.03</td><td class="bodyText" nowrap="0">SRM 156 - <a href="/tc?module=Static&d1=match_editorials&d2=srm156">Problem Set & Analysis</a></td></tr>
   <tr><td class="bodyText">07.17.03</td><td class="bodyText" nowrap="0">SRM 155 - <a href="/tc?module=Static&d1=match_editorials&d2=srm155">Problem Set & Analysis</a></td></tr>
   <tr><td class="bodyText">07.09.03</td><td class="bodyText" nowrap="0">SRM 154 - <a href="/tc?module=Static&d1=match_editorials&d2=srm154">Problem Set & Analysis</a></td></tr>
   <tr><td class="bodyText">07.01.03</td><td class="bodyText" nowrap="0">SRM 153 - <a href="/tc?module=Static&d1=match_editorials&d2=srm153">Problem Set & Analysis</a></td></tr>
   
   <tr><td colspan="2"><img src="/i/clear.gif" alt="" width="1" height="5" border="0"/></td></tr>
   
   <tr><td valign="middle" class="bodyText" colspan="2"><strong>June</strong></td></tr>
   <tr><td class="bodyText">06.26.03</td><td class="bodyText" nowrap="0">SRM 152 - <a href="/tc?module=Static&d1=match_editorials&d2=srm152">Problem Set & Analysis</a></td></tr>
   <tr><td class="bodyText">06.17.03</td><td class="bodyText" nowrap="0">SRM 151 - <a href="/tc?module=Static&d1=match_editorials&d2=srm151">Problem Set & Analysis</a></td></tr>
   <tr><td class="bodyText">06.11.03</td><td class="bodyText" nowrap="0">SRM 150 - <a href="/tc?module=Static&d1=match_editorials&d2=srm150">Problem Set & Analysis</a></td></tr>
   <tr><td class="bodyText">06.02.03</td><td class="bodyText" nowrap="0">SRM 149 - <a href="/tc?module=Static&d1=match_editorials&d2=srm149">Problem Set & Analysis</a></td></tr>
   
   <tr><td colspan="2"><img src="/i/clear.gif" alt="" width="1" height="5" border="0"/></td></tr>
   
   <tr><td valign="middle" class="bodyText" colspan="2"><strong>May</strong></td></tr>
   <tr><td class="bodyText">05.28.03</td><td class="bodyText" nowrap="0">SRM 148 - <a href="/tc?module=Static&d1=match_editorials&d2=srm148">Problem Set & Analysis</a></td></tr>
   <tr><td class="bodyText">05.22.03</td><td class="bodyText" nowrap="0">SRM 147 - <a href="/tc?module=Static&d1=match_editorials&d2=srm147">Problem Set & Analysis</a></td></tr>
   <tr><td class="bodyText">05.14.03</td><td class="bodyText" nowrap="0">SRM 146 - <a href="/tc?module=Static&d1=match_editorials&d2=srm146">Problem Set & Analysis</a></td></tr>
   <tr><td class="bodyText">05.06.03</td><td class="bodyText" nowrap="0">SRM 145 - <a href="/tc?module=Static&d1=match_editorials&d2=srm145">Problem Set & Analysis</a></td></tr>
   
   <tr><td colspan="2"><img src="/i/clear.gif" alt="" width="1" height="5" border="0"/></td></tr>
   
   <tr><td valign="middle" class="bodyText" colspan="2"><strong>April</strong></td></tr>
   <tr><td class="bodyText">04.30.03</td><td class="bodyText" nowrap="0">SRM 144 - <a href="/tc?module=Static&d1=match_editorials&d2=srm144">Problem Set & Analysis</a></td></tr>
   <tr><td class="bodyText">04.15.03</td><td class="bodyText" nowrap="0">SRM 142 - <a href="/tc?module=Static&d1=match_editorials&d2=srm142">Problem Set & Analysis</a></td></tr>
   <tr><td class="bodyText">04.10.03</td><td class="bodyText" nowrap="0">SRM 141 - <a href="/tc?module=Static&d1=match_editorials&d2=srm141">Problem Set & Analysis</a></td></tr>
   <tr><td class="bodyText">04.05.03</td><td class="bodyText" nowrap="0">2003 TCCC Finals - <a href="/index?t=tournaments&c=tccc03_champprob">Problem Set & Analysis</a></td></tr>
   <tr><td class="bodyText">04.04.03</td><td class="bodyText" nowrap="0">2003 TCCC Semifinals - <a href="/index?t=tournaments&c=tccc03_semiprob4">Problem Set & Analysis</a></td></tr>
   <tr><td class="bodyText">04.04.03</td><td class="bodyText" nowrap="0">2003 TCCC Semifinals - <a href="/index?t=tournaments&c=tccc03_semiprob3">Problem Set & Analysis</a></td></tr>
   <tr><td class="bodyText">04.04.03</td><td class="bodyText" nowrap="0">2003 TCCC Semifinals - <a href="/index?t=tournaments&c=tccc03_semiprob2">Problem Set & Analysis</a></td></tr>
   <tr><td class="bodyText">04.04.03</td><td class="bodyText" nowrap="0">2003 TCCC Semifinals - <a href="/index?t=tournaments&c=tccc03_semiprob1">Problem Set & Analysis</a></td></tr>
   
   <tr><td colspan="2"><img src="/i/clear.gif" alt="" width="1" height="5" border="0"/></td></tr>
   
   <tr><td valign="middle" class="bodyText" colspan="2"><strong>March</strong></td></tr>
   <tr><td class="bodyText">03.26.03</td><td class="bodyText" nowrap="0">SRM 140 - <a href="/tc?module=Static&d1=match_editorials&d2=srm140">Problem Set & Analysis</a></td></tr>
   <tr><td class="bodyText">03.18.03</td><td class="bodyText" nowrap="0">SRM 139 - <a href="/tc?module=Static&d1=match_editorials&d2=srm139">Problem Set & Analysis</a></td></tr>
   <tr><td class="bodyText">03.12.03</td><td class="bodyText" nowrap="0">2003 TCCC Regional Finals - <a href="/index?t=statistics&c=tccc03_regfinal_prob">Problem Set & Analysis</a></td></tr>
   <tr><td class="bodyText">03.10.03</td><td class="bodyText" nowrap="0">SRM 138 - <a href="/tc?module=Static&d1=match_editorials&d2=srm138">Problem Set & Analysis</a></td></tr>
   <tr><td class="bodyText">03.06.03</td><td class="bodyText" nowrap="0">SRM 137 - <a href="/tc?module=Static&d1=match_editorials&d2=srm137">Problem Set & Analysis</a></td></tr>
   <tr><td class="bodyText">03.05.03</td><td class="bodyText" nowrap="0">2003 TCCC Regional Semi. - <a href="/index?t=statistics&c=tccc03_reg_semi_prob">Problem Set & Analysis</a></td></tr>
   
   <tr><td colspan="2"><img src="/i/clear.gif" alt="" width="1" height="5" border="0"/></td></tr>
   
   <tr><td valign="middle" class="bodyText" colspan="2"><strong>February</strong></td></tr>
   <tr><td class="bodyText">02.26.03</td><td class="bodyText" nowrap="0">2003 TCCC Regional Quart. - <a href="/index?t=statistics&c=tccc03_reg_quart_prob">Problem Set & Analysis</a></td></tr>
   <tr><td class="bodyText">02.25.03</td><td class="bodyText" nowrap="0">SRM 136 - <a href="/tc?module=Static&d1=match_editorials&d2=srm136">Problem Set & Analysis</a></td></tr>
   <tr><td class="bodyText">02.22.03</td><td class="bodyText" nowrap="0">2003 TCCC Round 1 Int. - <a href="/index?t=statistics&c=tccc03_int_prob">Problem Set & Analysis</a></td></tr>
   <tr><td class="bodyText">02.20.03</td><td class="bodyText" nowrap="0">2003 TCCC Round 1 W/MW - <a href="/index?t=statistics&c=tccc03_wmw_prob">Problem Set & Analysis</a></td></tr>
   <tr><td class="bodyText">02.18.03</td><td class="bodyText" nowrap="0">2003 TCCC Round 1 NE/SE - <a href="/index?t=statistics&c=tccc03_nese_prob">Problem Set & Analysis</a></td></tr>
   <tr><td class="bodyText">02.11.03</td><td class="bodyText" nowrap="0">SRM 135 - <a href="/tc?module=Static&d1=match_editorials&d2=srm135">Problem Set & Analysis</a></td></tr>
   <tr><td class="bodyText">02.08.03</td><td class="bodyText" nowrap="0">SRM 134 - <a href="/tc?module=Static&d1=match_editorials&d2=srm134">Problem Set & Analysis</a></td></tr>
   <tr><td class="bodyText">02.05.03</td><td class="bodyText" nowrap="0">SRM 133 - <a href="/tc?module=Static&d1=match_editorials&d2=srm133">Problem Set & Analysis</a></td></tr>
   <tr><td class="bodyText">02.01.03</td><td class="bodyText" nowrap="0">SRM 132 - <a href="/tc?module=Static&d1=match_editorials&d2=srm132">Problem Set & Analysis</a></td></tr>
   
   <tr><td colspan="2"><img src="/i/clear.gif" alt="" width="1" height="5" border="0"/></td></tr>
   
   <tr><td valign="middle" class="bodyText" colspan="2"><strong>January</strong></td></tr>
   <tr><td class="bodyText">01.30.03</td><td class="bodyText" nowrap="0">SRM 131 - <a href="/tc?module=Static&d1=match_editorials&d2=srm131">Problem Set & Analysis</a></td></tr>
   <tr><td class="bodyText">01.14.03</td><td class="bodyText" nowrap="0">SRM 129 - <a href="/tc?module=Static&d1=match_editorials&d2=srm129">Problem Set & Analysis</a></td></tr>
   <tr><td class="bodyText">01.06.03</td><td class="bodyText" nowrap="0">SRM 128 - <a href="/tc?module=Static&d1=match_editorials&d2=srm128">Problem Set & Analysis</a></td></tr>
   <tr><td class="bodyText">01.02.03</td><td class="bodyText" nowrap="0" width="100%">SRM 127 - <a href="/tc?module=Static&d1=match_editorials&d2=srm127">Problem Set & Analysis</a></td></tr>
   </table>
   
   <br/><br/>
   
   <table width="100%" border="0" cellspacing="0" cellpadding="3">
   <tr valign="middle"><td class="statTextLarge" bgcolor="#999999" colspan="2"><font size="3">Match Editorial Archive - 2002</font></td></tr>
   
   <tr><td colspan="2"><img src="/i/clear.gif" alt="" width="1" height="5" border="0"/></td></tr>
   
   <tr><td valign="middle" class="bodyText" colspan="2"><strong>December</strong></td></tr>
   <tr><td class="bodyText">12.23.02</td><td class="bodyText" nowrap="0">SRM 126 - <a href="/tc?module=Static&d1=match_editorials&d2=srm126">Problem Set & Analysis</a></td></tr>
   <tr><td class="bodyText">12.16.02</td><td class="bodyText" nowrap="0">SRM 125 - <a href="/tc?module=Static&d1=match_editorials&d2=srm125">Problem Set & Analysis</a></td></tr>
   <tr><td class="bodyText">12.12.02</td><td class="bodyText" nowrap="0">SRM 124 - <a href="/tc?module=Static&d1=match_editorials&d2=srm124">Problem Set & Analysis</a></td></tr>
   <tr><td class="bodyText">12.10.02</td><td class="bodyText" nowrap="0">SRM 123 - <a href="/tc?module=Static&d1=match_editorials&d2=srm123">Problem Set & Analysis</a></td></tr>
   <tr><td class="bodyText">12.04.02</td><td class="bodyText" nowrap="0">SRM 122 - <a href="/tc?module=Static&d1=match_editorials&d2=srm122">Problem Set & Analysis</a></td></tr>
   
   <tr><td colspan="2"><img src="/i/clear.gif" alt="" width="1" height="5" border="0"/></td></tr>
   
   <tr><td valign="middle" class="bodyText" colspan="2"><strong>November</strong></td></tr>
   <tr><td class="bodyText">11.26.02</td><td class="bodyText" nowrap="0">SRM 121 - <a href="/tc?module=Static&d1=match_editorials&d2=srm121">Problem Set & Analysis</a></td></tr>
   <tr><td class="bodyText">11.23.02</td><td class="bodyText" nowrap="0">2002 Invitational Championship - <a href="/index?t=tournaments&c=invit02_champprob">Problem Set & Analysis</a></td></tr>
   <tr><td class="bodyText">11.22.02</td><td class="bodyText" nowrap="0">2002 Invitational Room #4 - <a href="/index?t=tournaments&c=invit02_semiprob4">Problem Set & Analysis</a></td></tr>
   <tr><td class="bodyText">11.22.02</td><td class="bodyText" nowrap="0">2002 Invitational Room #3 - <a href="/index?t=tournaments&c=invit02_semiprob3">Problem Set & Analysis</a></td></tr>
   <tr><td class="bodyText">11.22.02</td><td class="bodyText" nowrap="0">2002 Invitational Room #2 - <a href="/index?t=tournaments&c=invit02_semiprob2">Problem Set & Analysis</a></td></tr>
   <tr><td class="bodyText">11.22.02</td><td class="bodyText" nowrap="0">2002 Invitational Room #1 - <a href="/index?t=tournaments&c=invit02_semiprob1">Problem Set & Analysis</a></td></tr>
   <tr><td class="bodyText">11.13.02</td><td class="bodyText" nowrap="0">SRM 120 - <a href="/tc?module=Static&d1=match_editorials&d2=srm120">Problem Set & Analysis</a></td></tr>
   <tr><td class="bodyText">11.07.02</td><td class="bodyText" nowrap="0">SRM 119 - <a href="/tc?module=Static&d1=match_editorials&d2=srm119">Problem Set & Analysis</a></td></tr>
   
   <tr><td colspan="2"><img src="/i/clear.gif" alt="" width="1" height="5" border="0"/></td></tr>
   
   <tr><td valign="middle" class="bodyText" colspan="2"><strong>October</strong></td></tr>
   <tr><td class="bodyText">10.30.02</td><td class="bodyText" nowrap="0">2002 Invitational Round #4 - <a href="/index?t=statistics&c=invit02_r4_prob">Problem Set & Analysis</a></td></tr>
   <tr><td class="bodyText">10.29.02</td><td class="bodyText" nowrap="0">SRM 118 - <a href="/tc?module=Static&d1=match_editorials&d2=srm118">Problem Set & Analysis</a></td></tr>
   <tr><td class="bodyText">10.23.02</td><td class="bodyText" nowrap="0">2002 Invitational Round #3 - <a href="/index?t=statistics&c=invit02_r3_prob">Problem Set & Analysis</a></td></tr>
   <tr><td class="bodyText">10.21.02</td><td class="bodyText" nowrap="0">SRM 117 - <a href="/tc?module=Static&d1=match_editorials&d2=srm117">Problem Set & Analysis</a></td></tr>
   <tr><td class="bodyText">10.16.02</td><td class="bodyText" nowrap="0">2002 Invitational Round #2 - <a href="/index?t=statistics&c=invit02_r2_prob">Problem Set & Analysis</a></td></tr>
   <tr><td class="bodyText">10.15.02</td><td class="bodyText" nowrap="0">SRM 116 - <a href="/tc?module=Static&d1=match_editorials&d2=srm116">Problem Set & Analysis</a></td></tr>
   <tr><td class="bodyText">10.10.02</td><td class="bodyText" nowrap="0">2002 Invitational Round #1 (part 2) - <a href="/index?t=statistics&c=invit02_r1b_prob">Problem Set & Analysis</a></td></tr>
   <tr><td class="bodyText">10.08.02</td><td class="bodyText" nowrap="0">2002 Invitational Round #1 (part 1) - <a href="/index?t=statistics&c=invit02_r1a_prob">Problem Set & Analysis</a></td></tr>
   
   <tr><td colspan="2"><img src="/i/clear.gif" alt="" width="1" height="5" border="0"/></td></tr>
   
   <tr><td valign="middle" class="bodyText" colspan="2"><strong>September</strong></td></tr>
   <tr><td class="bodyText">09.30.02</td><td class="bodyText" nowrap="0">SRM 115 - <a href="/tc?module=Static&d1=match_editorials&d2=srm115">Problem Set & Analysis</a></td></tr>
   <tr><td class="bodyText">09.24.02</td><td class="bodyText" nowrap="0">SRM 114 - <a href="/tc?module=Static&d1=match_editorials&d2=srm114">Problem Set & Analysis</a></td></tr>
   <tr><td class="bodyText">09.10.02</td><td class="bodyText" nowrap="0">SRM 113 - <a href="/tc?module=Static&d1=match_editorials&d2=srm113">Problem Set & Analysis</a></td></tr>
   <tr><td class="bodyText">09.09.02</td><td class="bodyText" nowrap="0">SRM 112 - <a href="/tc?module=Static&d1=match_editorials&d2=srm112">Problem Set & Analysis</a></td></tr>
   <tr><td class="bodyText">09.04.02</td><td class="bodyText" nowrap="0">SRM 111 - <a href="/tc?module=Static&d1=match_editorials&d2=srm111">Problem Set & Analysis</a></td></tr>
   
   
   <tr><td colspan="2"><img src="/i/clear.gif" alt="" width="1" height="5" border="0"/></td></tr>
   
   <tr><td valign="middle" class="bodyText" colspan="2"><strong>August</strong></td></tr>
   <tr><td class="bodyText">08.27.02</td><td class="bodyText" nowrap="0">SRM 110 - <a href="/tc?module=Static&d1=match_editorials&d2=srm110">Problem Set & Analysis</a></td></tr>
   <tr><td class="bodyText">08.21.02</td><td class="bodyText" nowrap="0">SRM 109 - <a href="/tc?module=Static&d1=match_editorials&d2=srm109">Problem Set & Analysis</a></td></tr>
   <tr><td class="bodyText">08.12.02</td><td class="bodyText" nowrap="0">SRM 108 - <a href="/tc?module=Static&d1=match_editorials&d2=srm108">Problem Set & Analysis</a></td></tr>
   <tr><td class="bodyText">08.07.02</td><td class="bodyText" nowrap="0">SRM 107 - <a href="/tc?module=Static&d1=match_editorials&d2=srm107">Problem Set & Analysis</a></td></tr>
   <tr><td class="bodyText">08.01.02</td><td class="bodyText" nowrap="0">SRM 106 - <a href="/tc?module=Static&d1=match_editorials&d2=srm106">Problem Set & Analysis</a></td></tr>
   
   
   <tr><td colspan="2"><img src="/i/clear.gif" alt="" width="1" height="5" border="0"/></td></tr>
   
   <tr><td valign="middle" class="bodyText" colspan="2"><strong>July</strong></td></tr>
   <tr><td class="bodyText">07.24.02</td><td class="bodyText" nowrap="0">SRM 105 - <a href="/tc?module=Static&d1=match_editorials&d2=srm105">Problem Set & Analysis</a></td></tr>
   <tr><td class="bodyText">07.16.02</td><td class="bodyText" nowrap="0">SRM 104 - <a href="/tc?module=Static&d1=match_editorials&d2=srm104">Problem Set & Analysis</a></td></tr>
   <tr><td class="bodyText">07.10.02</td><td class="bodyText" nowrap="0">SRM 103 - <a href="/tc?module=Static&d1=match_editorials&d2=srm103_rookie">Rookie Review</a> | <a href="/tc?module=Static&d1=match_editorials&d2=srm103">Problem Set</a></td></tr>
   <tr><td class="bodyText">07.01.02</td><td class="bodyText" nowrap="0">SRM 102 - <a href="/tc?module=Static&d1=match_editorials&d2=srm102_room1">Room 1</a> | <a href="/tc?module=Static&d1=match_editorials&d2=srm102_rookie">Rookie Review</a> | <a href="/tc?module=Static&d1=match_editorials&d2=srm102">Problem Set</a><!-- | <A HREF="/index?t=statistics&c=srm102_lessons">LessonsLearned</A> --></td></tr>
   
   
   <tr><td colspan="2"><img src="/i/clear.gif" alt="" width="1" height="5" border="0"/></td></tr>
   
   <tr><td valign="middle" class="bodyText" colspan="2"><strong>June</strong></td></tr>
   <tr><td class="bodyText">06.26.02</td><td class="bodyText" nowrap="0">SRM 101 - <a href="/tc?module=Static&d1=match_editorials&d2=srm101_room1">Room 1</a> | <a href="/tc?module=Static&d1=match_editorials&d2=srm101_rookie">Rookie Review</a> | <a href="/tc?module=Static&d1=match_editorials&d2=srm101">Problem Set</a> | <a href="/tc?module=Static&d1=match_editorials&d2=srm101_lessons">LessonsLearned</a></td></tr>
   <tr><td class="bodyText">06.24.02</td><td class="bodyText" nowrap="0">SRM 100 - <a href="/tc?module=Static&d1=match_editorials&d2=srm100_room1">Room 1</a> | <a href="/tc?module=Static&d1=match_editorials&d2=srm100_rookie">Rookie Review</a> | <a href="/tc?module=Static&d1=match_editorials&d2=srm100">Problem Set</a></td></tr>
   <tr><td class="bodyText">06.19.02</td><td class="bodyText" nowrap="0">SRM 98 - <a href="/tc?module=Static&d1=match_editorials&d2=srm98_room1">Room 1</a> | <a href="/tc?module=Static&d1=match_editorials&d2=srm98_rookie">Rookie Review</a> | <a href="/tc?module=Static&d1=match_editorials&d2=srm98">Problem Set</a></td></tr>
   <tr><td class="bodyText">06.12.02</td><td class="bodyText" nowrap="0">SRM 97 - <a href="/tc?module=Static&d1=match_editorials&d2=srm97_room1">Room 1</a> | <a href="/tc?module=Static&d1=match_editorials&d2=srm97_rookie">Rookie Review</a> | <a href="/tc?module=Static&d1=match_editorials&d2=srm97">Problem Set</a> | <a href="/tc?module=Static&d1=match_editorials&d2=srm97_lessons">LessonsLearned</a></td></tr>
   <tr><td class="bodyText">06.11.02</td><td class="bodyText" nowrap="0">SRM 96 - <a href="/tc?module=Static&d1=match_editorials&d2=srm96_room1">Room 1</a> | <a href="/tc?module=Static&d1=match_editorials&d2=srm96_rookie">Rookie Review</a> | <a href="/tc?module=Static&d1=match_editorials&d2=srm96">Problem Set</a></td></tr>
   <tr><td class="bodyText">06.05.02</td><td class="bodyText" nowrap="0">SRM 95 - <a href="/tc?module=Static&d1=match_editorials&d2=srm95_room1">Room 1</a> | <a href="/tc?module=Static&d1=match_editorials&d2=srm95_rookie">Rookie Review</a> | <a href="/tc?module=Static&d1=match_editorials&d2=srm95">Problem Set</a></td></tr>
   <tr><td class="bodyText">06.03.02</td><td class="bodyText" nowrap="0">SRM 94 - <a href="/tc?module=Static&d1=match_editorials&d2=srm94_room1">Room 1</a> | <a href="/tc?module=Static&d1=match_editorials&d2=srm94_rookie">Rookie Review</a> | <a href="/tc?module=Static&d1=match_editorials&d2=srm94">Problem Set</a></td></tr>
   
   
   <tr><td colspan="2"><img src="/i/clear.gif" alt="" width="1" height="5" border="0"/></td></tr>
   
   <tr><td valign="middle" class="bodyText" colspan="2"><strong>May</strong></td></tr>
   <tr><td class="bodyText">05.30.02</td><td class="bodyText" nowrap="0">SRM 93 - <a href="/tc?module=Static&d1=match_editorials&d2=srm93_room1">Room 1</a> | <a href="/tc?module=Static&d1=match_editorials&d2=srm93_rookie">Rookie Review</a> | <a href="/tc?module=Static&d1=match_editorials&d2=srm93">Problem Set</a> | <a href="/tc?module=Static&d1=match_editorials&d2=srm93_lessons">LessonsLearned</a></td></tr>
   <tr><td class="bodyText">05.29.02</td><td class="bodyText" nowrap="0">SRM 92 - <a href="/tc?module=Static&d1=match_editorials&d2=srm92_room1">Room 1</a> | <a href="/tc?module=Static&d1=match_editorials&d2=srm92_rookie">Rookie Review</a> | <a href="/tc?module=Static&d1=match_editorials&d2=srm92">Problem Set</a></td></tr>
   <tr><td class="bodyText">05.22.02</td><td class="bodyText" nowrap="0">SRM 91 - <a href="/tc?module=Static&d1=match_editorials&d2=srm91_room1">Room 1</a> | <a href="/tc?module=Static&d1=match_editorials&d2=srm91_rookie">Rookie Review</a> | <a href="/tc?module=Static&d1=match_editorials&d2=srm91">Problem Set</a> | <a href="/tc?module=Static&d1=match_editorials&d2=srm91_lessons">LessonsLearned</a></td></tr>
   <tr><td class="bodyText">05.21.02</td><td class="bodyText" nowrap="0">SRM 90 - <a href="/tc?module=Static&d1=match_editorials&d2=srm90_room1">Room 1</a> | <a href="/tc?module=Static&d1=match_editorials&d2=srm90_rookie">Rookie Review</a> | <a href="/tc?module=Static&d1=match_editorials&d2=srm90">Problem Set</a></td></tr>
   <tr><td class="bodyText">05.18.02</td><td class="bodyText" nowrap="0">SRM 89 - <a href="/tc?module=Static&d1=match_editorials&d2=srm89_room1">Room 1</a> | <a href="/tc?module=Static&d1=match_editorials&d2=srm89_rookie">Rookie Review</a> | <a href="/tc?module=Static&d1=match_editorials&d2=srm89">Problem Set</a> | <a href="/tc?module=Static&d1=match_editorials&d2=srm89_lessons">LessonsLearned</a></td></tr>
   <tr><td class="bodyText">05.15.02</td><td class="bodyText" nowrap="0">SRM 88 - <a href="/tc?module=Static&d1=match_editorials&d2=srm88_room1">Room 1</a> | <a href="/tc?module=Static&d1=match_editorials&d2=srm88_rookie">Rookie Review</a> | <a href="/tc?module=Static&d1=match_editorials&d2=srm88">Problem Set</a> | <a href="/tc?module=Static&d1=match_editorials&d2=srm88_lessons">LessonsLearned</a></td></tr>
   <tr><td class="bodyText">05.09.02</td><td valign="middle" class="bodyText">SRM 87 - <a href="/tc?module=Static&d1=match_editorials&d2=srm87_room1">Room 1</a> | <a href="/tc?module=Static&d1=match_editorials&d2=srm87_rookie">Rookie Review</a> | <a href="/tc?module=Static&d1=match_editorials&d2=srm87">Problem Set</a> | <a href="/tc?module=Static&d1=match_editorials&d2=srm">LessonsLearned</a></td></tr>
   <tr><td class="bodyText">05.08.02</td><td valign="middle" class="bodyText">SRM 86 - <a href="/tc?module=Static&d1=match_editorials&d2=srm86_room1">Room 1</a> | <a href="/tc?module=Static&d1=match_editorials&d2=srm86_rookie">Rookie Review</a> | <a href="/tc?module=Static&d1=match_editorials&d2=srm86">Problem Set</a></td></tr>
   <tr><td class="bodyText">05.01.02</td><td valign="middle" class="bodyText">SRM 85 - <a href="/tc?module=Static&d1=match_editorials&d2=srm85_room1">Room 1</a> | <a href="/tc?module=Static&d1=match_editorials&d2=srm85_rookie">Rookie Review</a> | <a href="/tc?module=Static&d1=match_editorials&d2=srm85">Problem Set</a> | <a href="/tc?module=Static&d1=match_editorials&d2=srm85_lessons">LessonsLearned</a></td></tr>
   
   
   <tr><td colspan="2"><img src="/i/clear.gif" alt="" width="1" height="5" border="0"/></td></tr>
   
   <tr><td valign="middle" class="bodyText" colspan="2"><strong>April</strong></td></tr>
   <tr><td class="bodyText">04.30.02</td><td valign="middle" class="bodyText">SRM 84 - <a href="/tc?module=Static&d1=match_editorials&d2=srm84_room1">Room 1</a> | <a href="/tc?module=Static&d1=match_editorials&d2=srm84_rookie">Rookie Review</a> | <a href="/tc?module=Static&d1=match_editorials&d2=srm84">Problem Set Analysis & Opinion</a></td></tr>
   <tr><td class="bodyText">04.27.02</td><td valign="middle" class="bodyText">SRM 83 - <a href="/tc?module=Static&d1=match_editorials&d2=srm83_room1">Room 1</a> | <a href="/tc?module=Static&d1=match_editorials&d2=srm83_rookie">Rookie Review</a> | <a href="/tc?module=Static&d1=match_editorials&d2=srm83">Problem Set Analysis & Opinion</a></td></tr>
   <tr><td class="bodyText">04.24.02</td><td valign="middle" class="bodyText">SRM 82 - Coder Point of View editorials not available for this match.</td></tr>
   <tr><td class="bodyText">04.22.02</td><td valign="middle" class="bodyText">SRM 81 - This match was rescheduled to Saturday, April 27th as SRM 83</td></tr>
   <tr><td class="bodyText">04.15.02</td><td valign="middle" class="bodyText">SRM 80 - <a href="/tc?module=Static&d1=match_editorials&d2=srm80_room1">Room 1</a> | <a href="/tc?module=Static&d1=match_editorials&d2=srm80_rookie">Rookie Review</a> | <a href="/tc?module=Static&d1=match_editorials&d2=srm80">Problem Set Analysis & Opinion</a></td></tr>
   <tr><td class="bodyText">04.10.02</td><td valign="middle" class="bodyText">SRM 79 - <a href="/tc?module=Static&d1=match_editorials&d2=srm79_room1">Room 1</a> | <a href="/tc?module=Static&d1=match_editorials&d2=srm79_rookie">Rookie Review</a> | <a href="/tc?module=Static&d1=match_editorials&d2=srm79">Problem Set Analysis & Opinion</a></td></tr>
   <tr><td class="bodyText">04.09.02</td><td valign="middle" class="bodyText"  width="100%">SRM 78 - <a href="/tc?module=Static&d1=match_editorials&d2=srm78_room1">Room 1</a> | <a href="/tc?module=Static&d1=match_editorials&d2=srm78_rookie">Rookie Review</a> | <a href="/tc?module=Static&d1=match_editorials&d2=srm78">Problem Set Analysis & Opinion</a></td></tr>
   <tr><td colspan="2"><img src="/i/clear.gif" alt="" width="1" height="5" border="0"/></td></tr>
   
   <tr><td colspan="2" align="left"><br/><a href="mailto:editorial@topcoder.com">Are you a member interested in writing a review?</a></td></tr>
</table>

</div>
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
