<%
    String tl1 = request.getParameter("tabLev1")==null?"":request.getParameter("tabLev1");
    String tl2 = request.getParameter("tabLev2")==null?"":request.getParameter("tabLev2");
%>

<% if (tl1.equals("collegiate")) {%>

<table width="750" cellpadding="0" cellspacing="7" border="0" align="center">
   <tr><td align="left" valign="bottom"><a href="/pl/?module=Static&d1=doubleclick&d2=col_overview"><img src="/i/events/doubleclick/dccc_logo.gif" width="200" height="100" alt="DoubleClick" border="0"/></a></td>
   <td align="right" valign="bottom"><a href="/"><img src="/i/events/doubleclick/pbtc.gif" width="185" height="69" alt="TopCoder" border="0"/></a></td>
   </tr>
</table>

    <table width="750" align="center" border="0" cellpadding="2" cellspacing="1" class="dc_lvl2_box">
        <tr valign="top">
            <td class="dc_subnav" width="49%" align="center">&nbsp;</td>
            <td align="center" class="<%=tl2.equals("overview")?"dc_subnav_on":"dc_subnav"%>">
                <a class="<%=tl2.equals("overview")?"dc_subnav_on_link":"dc_subnav_link"%>" href="/pl/?module=Static&d1=doubleclick&d2=col_overview">Tournament Overview</a>
            </td>
            <td align="center" class="<%=tl2.equals("schedule")?"dc_subnav_on":"dc_subnav"%>">
                <a class="<%=tl2.equals("schedule")?"dc_subnav_on_link":"dc_subnav_link"%>" href="/pl/?module=Static&d1=doubleclick&d2=col_schedule">Schedule</a>
            </td>
            <td align="center" class="<%=tl2.equals("registration")?"dc_subnav_on":"dc_subnav"%>">
                <a class="<%=tl2.equals("registration")?"dc_subnav_on_link":"dc_subnav_link"%>" href="/pl/?module=Static&d1=doubleclick&d2=col_reg">Registration</a>
            </td>
            <td align="center" class="<%=tl2.equals("rules")?"dc_subnav_on":"dc_subnav"%>">
                <a class="<%=tl2.equals("rules")?"dc_subnav_on_link":"dc_subnav_link"%>" href="/pl/?module=Static&d1=doubleclick&d2=col_rules">Rules</a>
            </td>
            <td align="center" class="<%=tl2.equals("faq")?"dc_subnav_on":"dc_subnav"%>">
                <a class="<%=tl2.equals("faq")?"dc_subnav_on_link":"dc_subnav_link"%>" href="/pl/?module=Static&d1=doubleclick&d2=col_faq">FAQ</a>
            </td>
            <td align="center" class="<%=tl2.equals("advancers")?"dc_subnav_on":"dc_subnav"%>">
                <a class="<%=tl2.equals("advancers")?"dc_subnav_on_link":"dc_subnav_link"%>" href="/pl/?module=Static&d1=doubleclick&d2=col_advancers">Advancers</a>
            </td>
            <td align="center" class="<%=tl2.equals("arena")?"dc_subnav_on":"dc_subnav"%>">
                <a class="<%=tl2.equals("arena")?"dc_subnav_on_link":"dc_subnav_link"%>" href="/pl/?module=Static&d1=doubleclick&d2=col_arena">Competition Arena</a>
            </td>
            <td class="dc_subnav" width="49%" align="center">&nbsp;</td>
        </tr>
    </table>

<% } else if(tl1.equals("internal")){ %>

<table width="750" cellpadding="0" cellspacing="7" border="0" align="center">
   <tr><td align="left" valign="bottom"><a href="/pl/?module=Static&d1=doubleclick&d2=int_overview"><img src="/i/events/doubleclick/dccc_logo.gif" width="200" height="100" alt="DoubleClick" border="0"/></a></td>
   <td align="right" valign="bottom"><a href="/"><img src="/i/events/doubleclick/pbtc.gif" width="185" height="69" alt="TopCoder" border="0"/></a></td>
   </tr>
</table>

    <table width="750" align="center" border="0" cellpadding="2" cellspacing="1" class="dc_lvl2_box">
        <tr valign="top">
            <td class="dc_subnav" width="49%" align="center">&nbsp;</td>
            <td align="center" class="<%=tl2.equals("overview")?"dc_subnav_on":"dc_subnav"%>">
                <a class="<%=tl2.equals("overview")?"dc_subnav_on_link":"dc_subnav_link"%>" href="/pl/?module=Static&d1=doubleclick&d2=int_overview">Tournament Overview</a>
            </td>
            <td align="center" class="<%=tl2.equals("schedule")?"dc_subnav_on":"dc_subnav"%>">
                <a class="<%=tl2.equals("schedule")?"dc_subnav_on_link":"dc_subnav_link"%>" href="/pl/?module=Static&d1=doubleclick&d2=int_schedule">Schedule</a>
            </td>
            <td align="center" class="<%=tl2.equals("registration")?"dc_subnav_on":"dc_subnav"%>">
                <a class="<%=tl2.equals("registration")?"dc_subnav_on_link":"dc_subnav_link"%>" href="/pl/?module=Static&d1=doubleclick&d2=int_reg">Registration</a>
            </td>
            <td align="center" class="<%=tl2.equals("rules")?"dc_subnav_on":"dc_subnav"%>">
                <a class="<%=tl2.equals("rules")?"dc_subnav_on_link":"dc_subnav_link"%>" href="/pl/?module=Static&d1=doubleclick&d2=int_rules">Rules</a>
            </td>
            <td align="center" class="<%=tl2.equals("faq")?"dc_subnav_on":"dc_subnav"%>">
                <a class="<%=tl2.equals("faq")?"dc_subnav_on_link":"dc_subnav_link"%>" href="/pl/?module=Static&d1=doubleclick&d2=int_faq">FAQ</a>
            </td>
            <td align="center" class="<%=tl2.equals("advancers")?"dc_subnav_on":"dc_subnav"%>">
                <a class="<%=tl2.equals("advancers")?"dc_subnav_on_link":"dc_subnav_link"%>" href="/pl/?module=Static&d1=doubleclick&d2=int_advancers">Advancers</a>
            </td>
            <td align="center" class="<%=tl2.equals("arena")?"dc_subnav_on":"dc_subnav"%>">
                <a class="<%=tl2.equals("arena")?"dc_subnav_on_link":"dc_subnav_link"%>" href="/pl/?module=Static&d1=doubleclick&d2=int_arena">Competition Arena</a>
            </td>
            <td class="dc_subnav" width="49%" align="center">&nbsp;</td>
        </tr>
    </table>
<% } %>

<% if (tl2.equals("rules")) {%>
    <table width="750" align="center" cellpadding="1" cellspacing="0" class="dc_lvl3_box">
        <tr>
            <td class="dc_lvl3Text" width="49%">&nbsp;</td>
				<td class="dc_lvl3Text" align="center">
                        <a class="bodyText_link" href="#eligibility">Eligibility</a>&nbsp;&nbsp;|&nbsp;&nbsp;
                        <a class="bodyText_link" href="#about">About the Tournament</a>&nbsp;&nbsp;|&nbsp;&nbsp;
                        <a class="bodyText_link" href="#prizes">About the Prizes</a>&nbsp;&nbsp;|&nbsp;&nbsp;
                        <a class="bodyText_link" href="#conditions">Conditions of Participation</a>
            </td>
            <td class="dc_lvl3Text" width="50%">&nbsp;</td>
        </tr>
    </table>
<% } %>
