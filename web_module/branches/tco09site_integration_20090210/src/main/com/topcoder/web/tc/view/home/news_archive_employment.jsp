<%@  page language="java"  %>
<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
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
            <jsp:param name="title" value="Employment Opportunities"/>
        </jsp:include>

<table border="0" cellpadding="2" cellspacing=0 width="100%">
<tr class="bodyText"><td nowrap="nowrap">12.12.06 4:15 PM&#160;-&#160</td><td width="100%"><A href="/tc?module=Static&d1=about&d2=web_designer">Job Opening at TopCoder: Web Designer</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">12.05.06 6:15 PM&#160;-&#160</td><td width="100%"><A href="/tc?module=Static&d1=about&d2=deployment_engineer">Job Opening at TopCoder: Deployment Engineer</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">08.29.06 9:45 AM&#160;-&#160</td><td width="100%"><A href="/tc?module=Static&d1=tournaments&d2=tccc06&d3=nsa">NSA chat session scheduled for SRM 318</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">04.07.06 9:00 AM&#160;-&#160</td><td width="100%"><A href="/tc?module=Static&d1=about&d2=graphic_designer">TopCoder Software is hiring graphic designers</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">02.16.06 6:00 PM&#160;-&#160</td><td width="100%"><A href="/tc?module=Static&d1=contracting&d2=tcs_chat_021506">TopCoder Software Chat from Feb 15</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">02.15.06 9:30 AM&#160;-&#160</td><td width="100%"><A href="/tc?module=Static&d1=about&d2=jobs">TopCoder Software Chat Scheduled for Feb 15</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">01.31.06 4:45 PM&#160;-&#160</td><td width="100%"><A href="/tc?module=Static&d1=contracting&d2=msn_chat_013006">MSN chat session from SRM 286</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">01.09.06 5:00 PM&#160;-&#160</td><td width="100%"><A href="/tc?module=Static&d1=tournaments&d2=tco06&d3=nsa">NSA chat session scheduled for SRM 282</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">12.29.05 11:00 AM&#160;-&#160</td><td width="100%"><A href="/tc?module=Static&d1=tournaments&d2=tco06&d3=verisign_chat_122805">VeriSign chat transcript from SRM 280</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">12.20.05 3:15 PM&#160;-&#160</td><td width="100%"><A href="/tc?module=Static&d1=contracting&d2=tces_chat_121905">TCES chat transcript from SRM 278</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">12.20.05 2:40 PM&#160;-&#160</td><td width="100%"><A href="/tc?module=Static&d1=contracting&d2=msn_chat_121705">MSN chat session from SRM 277</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">12.19.05 4:00 PM&#160;-&#160</td><td width="100%"><A href="/tc?module=MatchDetails&amp;rd=8075">Employment Services chat session scheduled for SRM 278</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">11.21.05 11:40 AM&#160;-&#160</td><td width="100%"><A href="/tc?module=Static&d1=contracting&d2=msn_chat_111905">MSN chat session from SRM 272</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">11.18.05 5:10 PM&#160;-&#160</td><td width="100%"><A href="/tc?module=Static&d1=contracting&d2=msn">MSN chat session scheduled for SRM 272</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">11.14.05 12:00 PM&#160;-&#160</td><td width="100%"><A href="/tc?module=Static&d1=contracting&d2=msn">MSN is hiring TopCoders</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">10.04.05 5:00 PM&#160;-&#160</td><td width="100%"><A href="/tc?module=Static&d1=tournaments&d2=tco05&d3=yahoo_chat_100105">Yahoo! chat session from SRM 266</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">09.30.05 5:00 PM&#160;-&#160</td><td width="100%"><A href="/tc?module=Static&d1=tournaments&d2=tco05&d3=yahoo">Yahoo! chat session scheduled for SRM 266</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">09.26.05 5:00 PM&#160;-&#160</td><td width="100%"><A href="/tc?module=Static&d1=tournaments&d2=tco05&d3=verisign">VeriSign chat session scheduled for SRM 265</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">08.27.05 11:00 AM&#160;-&#160</td><td width="100%"><A href="/tc?module=Static&d1=contracting&d2=tcs_chat_082705">TopCoder Software chat session</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">08.09.05 3:35 PM&#160;-&#160</td><td width="100%"><A href="/tc?module=Static&d1=contracting&d2=citigroup_chat_080805">Citigroup chat session</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">08.08.05 9:15 AM&#160;-&#160</td><td width="100%"><A href="/tc?module=Static&d1=contracting&d2=citigroup">Citigroup chat session scheduled for SRM 257</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">08.02.05 2:55 PM&#160;-&#160</td><td width="100%">New internship opening at <A href="http://<%=ApplicationServer.FORUMS_SERVER_NAME%>/?module=Thread&threadID=506838">Yahoo!</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">07.20.05 9:00 AM&#160;-&#160</td><td width="100%"><A href="/tc?module=Static&d1=contracting&d2=citigroup_chat_071905">Citigroup chat session</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">07.18.05 4:50 PM&#160;-&#160</td><td width="100%"><A href="/tc?module=Static&d1=contracting&d2=citigroup">Citigroup chat session scheduled for SRM 252</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">07.07.05 3:35 PM&#160;-&#160</td><td width="100%"><A href="/rtables/viewForum.jsp?forum=504996&mc=2">VeriSign Employment Discussion</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">07.07.05 11:25 AM&#160;-&#160</td><td width="100%"><A href="/tc?module=Static&d1=tournaments&d2=tco05&d3=verisign_chat">VeriSign chat session</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">06.30.05 9:25 AM&#160;-&#160</td><td width="100%"><A href="/tc?module=Static&d1=tournaments&d2=tco05&d3=yahoo_chat">Yahoo! chat session</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">06.22.05 12:55 PM&#160;-&#160</td><td width="100%"><A href="/tc?module=Static&d1=contracting&d2=citigroup_chat">Citigroup Employment Opportunities chat session</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">06.16.05 3:20 PM&#160;-&#160</td><td width="100%">New job openings at <A href="/tc?module=Static&d1=contracting&d2=citigroup">Citigroup</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">06.13.05 10:50 AM&#160;-&#160</td><td width="100%">New job openings at <A href="/tc?module=Static&d1=contracting&d2=smsac">SMS.ac</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">06.09.05 6:30 PM&#160;-&#160</td><td width="100%">New job openings at <A href="/tc?module=Static&d1=contracting&d2=jpmorgan">JP Morgan</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">06.09.05 8:55 AM&#160;-&#160</td><td width="100%">New job openings at <A href="/tc?module=Static&d1=tournaments&d2=tco05&d3=yahoo">Yahoo!</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">06.01.05 4:00 PM&#160;-&#160</td><td width="100%">New job opening at <A href="/tc?module=Static&d1=contracting&d2=gentiva">Gentiva</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">05.17.05 2:15 PM&#160;-&#160</td><td width="100%">New job opening at <A href="/tc?module=Static&d1=about&d2=alg_prob_coordinator">TopCoder</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">04.11.05 10:55 AM&#160;-&#160</td><td width="100%">New job opening at <A href="/tc?module=Static&d1=about&d2=employment_account_exec">TopCoder</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">04.01.05 3:45 PM&#160;-&#160</td><td width="100%">New job opening at <A href="/tc?module=Static&d1=contracting&d2=comac">Comac</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">03.22.05 11:05 AM&#160;-&#160</td><td width="100%">New job openings at <A href="/tc?module=Static&d1=contracting&d2=csfb">CSFB</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">03.15.05 12:35 PM&#160;-&#160</td><td width="100%">New job opening at <A href="/tc?module=Static&d1=contracting&d2=vertex">Vertex Pharmaceuticals</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">02.18.05 10:00 AM&#160;-&#160</td><td width="100%">New job openings at <A href="/tc?module=Static&d1=contracting&d2=limegroup">The Lime Group</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">02.09.05 10:00 AM&#160;-&#160</td><td width="100%">New job openings at <A href="/tc?module=Static&d1=contracting&d2=akamai">Akamai</A> and <A href="/tc?module=Static&d1=contracting&d2=goldengate">GoldenGate</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">02.04.05 12:00 PM&#160;-&#160</td><td width="100%">New job openings at <A href="/tc?module=Static&d1=contracting&d2=jumptrading">JumpTrading</A> and <A href="/tc?module=Static&d1=contracting&d2=oreilly">O'Reilly</A></td></tr>
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