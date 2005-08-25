<%
    String tl1 = request.getParameter("tabLev1")==null?"":request.getParameter("tabLev1");
    String tl2 = request.getParameter("tabLev2")==null?"":request.getParameter("tabLev2");
%>

<table width="750" cellpadding="0" cellspacing="7" border="0" align="center">
   <tr><td align="left" valign="bottom"><a href="/pl/?module=Static&d1=doubleclick05&d2=overview"><img src="/i/events/doubleclick05/dccc_logo.gif" alt="DoubleClick" border="0"/></a></td>
   <td align="right" valign="bottom"><a href="/"><img src="/i/events/doubleclick05/pbtc.gif" alt="TopCoder" border="0"/></a></td>
   </tr>
</table>

    <table width="750" align="center" border="0" cellpadding="2" cellspacing="1" class="dc_lvl2_box">
        <tr valign="top">
            <td class="dc_subnav" width="49%" align="center">&#160;</td>
            <td align="center" class="<%=tl2.equals("overview")?"dc_subnav_on":"dc_subnav"%>">
                <a class="<%=tl2.equals("overview")?"dc_subnav_on_link":"dc_subnav_link"%>" href="/pl/?module=Static&d1=doubleclick05&d2=overview">Tournament Overview</a>
            </td>
            <td align="center" class="<%=tl2.equals("schedule")?"dc_subnav_on":"dc_subnav"%>">
                <a class="<%=tl2.equals("schedule")?"dc_subnav_on_link":"dc_subnav_link"%>" href="/pl/?module=Static&d1=doubleclick05&d2=schedule">Schedule</a>
            </td>
            <td align="center" class="<%=tl2.equals("registration")?"dc_subnav_on":"dc_subnav"%>">
                <a class="<%=tl2.equals("registration")?"dc_subnav_on_link":"dc_subnav_link"%>" href="/pl/?module=DC05Reg&cid=2998&eid=1">Registration</a>
            </td>
            <td align="center" class="<%=tl2.equals("rules")?"dc_subnav_on":"dc_subnav"%>">
                <a class="<%=tl2.equals("rules")?"dc_subnav_on_link":"dc_subnav_link"%>" href="/pl/?module=Static&d1=doubleclick05&d2=rules">Rules</a>
            </td>
            <td align="center" class="<%=tl2.equals("faq")?"dc_subnav_on":"dc_subnav"%>">
                <a class="<%=tl2.equals("faq")?"dc_subnav_on_link":"dc_subnav_link"%>" href="/pl/?module=Static&d1=doubleclick05&d2=faq">FAQ</a>
            </td>
<%--
            <td align="center" class="<%=tl2.equals("winners")?"dc_subnav_on":"dc_subnav"%>">
                <a class="<%=tl2.equals("winners")?"dc_subnav_on_link":"dc_subnav_link"%>" href="/pl/?module=Static&d1=doubleclick05&d2=winners">Winners</a>
            </td>
--%>
            <td align="center" class="<%=tl2.equals("arena")?"dc_subnav_on":"dc_subnav"%>">
                <a class="<%=tl2.equals("arena")?"dc_subnav_on_link":"dc_subnav_link"%>" href="/pl/?module=Static&d1=doubleclick05&d2=arena">Competition Arena</a>
            </td>
            <td class="dc_subnav" width="49%" align="center">&#160;</td>
        </tr>
    </table>

<% if (tl2.equals("rules")) {%>
    <table width="750" align="center" cellpadding="1" cellspacing="0" class="dc_lvl3_box">
        <tr>
            <td class="dc_lvl3Text" width="49%">&#160;</td>
				<td class="dc_lvl3Text" align="center">
                        <a class="bodyText_link" href="#eligibility">Eligibility</a>&#160;&#160;|&#160;&#160;
                        <a class="bodyText_link" href="#about">About the Tournament</a>&#160;&#160;|&#160;&#160;
                        <a class="bodyText_link" href="#prizes">About the Prizes</a>&#160;&#160;|&#160;&#160;
                        <a class="bodyText_link" href="#conditions">Conditions of Participation</a>
            </td>
            <td class="dc_lvl3Text" width="50%">&#160;</td>
        </tr>
    </table>
<% } %>
