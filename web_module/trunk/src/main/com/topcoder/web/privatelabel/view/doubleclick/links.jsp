<%
    String tl1 = request.getParameter("tabLev1")==null?"":request.getParameter("tabLev1");
    String tl2 = request.getParameter("tabLev2")==null?"":request.getParameter("tabLev2");
%>

<table width="750" cellpadding="0" cellspacing="7" border="0" align="center">
   <tr><td align="left" valign="bottom"><a href="http://www.doubleclick.com/us/"><img src="/i/events/doubleclick/dccc_logo.gif" width="200" height="100" alt="DoubleClick" border="0"/></a></td>
   <td align="right" valign="bottom"><a href="/"><img src="/i/events/doubleclick/pbtc.gif" width="220" height="70" alt="TopCoder" border="0"/></a></td>
   </tr>
</table>

<% if (tl1.equals("collegiate")) {%>
    <table width="750" align="center" border="0" cellpadding="2" cellspacing="1" class="dc_subnav_box">
        <tr valign="top">
            <td class="dc_subnav" width="49%" align="center">&nbsp;</td>
            <td align="center" class="<%=tl2.equals("overview")?"dc_subnav_on":"dc_subnav"%>">
                <a class="<%=tl2.equals("overview")?"dc_subnav_on_link":"dc_subnav_link"%>" href="/pl/?&module=Static&d1=doubleclick&d2=col_overview">Tournament Overview</a>
            </td>
            <td align="center" class="<%=tl2.equals("schedule")?"dc_subnav_on":"dc_subnav"%>">
                <a class="<%=tl2.equals("schedule")?"dc_subnav_on_link":"dc_subnav_link"%>" href="/pl/?&module=Static&d1=doubleclick&d2=col_schedule">Schedule</a>
            </td>
            <td align="center" class="<%=tl2.equals("registration")?"dc_subnav_on":"dc_subnav"%>">
                <a class="<%=tl2.equals("registration")?"dc_subnav_on_link":"dc_subnav_link"%>" href="/pl/?module=DCReg&cid=2998&eid=1">Registration</a>
            </td>
            <td align="center" class="<%=tl2.equals("rules")?"dc_subnav_on":"dc_subnav"%>">
                <a class="<%=tl2.equals("rules")?"dc_subnav_on_link":"dc_subnav_link"%>" href="/pl/?&module=Static&d1=doubleclick&d2=col_rules">Rules</a>
            </td>
            <td align="center" class="<%=tl2.equals("arena")?"dc_subnav_on":"dc_subnav"%>">
                <a class="<%=tl2.equals("arena")?"dc_subnav_on_link":"dc_subnav_link"%>" href="/pl/?&module=Static&d1=doubleclick&d2=col_arena">Practice Arena</a>
            </td>
            <td class="dc_subnav" width="49%" align="center">&nbsp;</td>
        </tr>
    </table>
<% } else if(tl1.equals("internal")){ %>
    <table width="750" align="center" border="0" cellpadding="2" cellspacing="1" class="dc_subnav_box">
        <tr valign="top">
            <td class="dc_subnav" width="49%" align="center">&nbsp;</td>
            <td align="center" class="<%=tl2.equals("overview")?"dc_subnav_on":"dc_subnav"%>">
                <a class="<%=tl2.equals("overview")?"dc_subnav_on_link":"dc_subnav_link"%>" href="/pl/?&module=Static&d1=doubleclick&d2=int_overview">Tournament Overview</a>
            </td>
            <td align="center" class="<%=tl2.equals("schedule")?"dc_subnav_on":"dc_subnav"%>">
                <a class="<%=tl2.equals("schedule")?"dc_subnav_on_link":"dc_subnav_link"%>" href="/pl/?&module=Static&d1=doubleclick&d2=int_schedule">Schedule</a>
            </td>
            <td align="center" class="<%=tl2.equals("registration")?"dc_subnav_on":"dc_subnav"%>">
                <a class="<%=tl2.equals("registration")?"dc_subnav_on_link":"dc_subnav_link"%>" href="/pl/?module=DCReg&cid=2998&eid=2">Registration</a>
            </td>
            <td align="center" class="<%=tl2.equals("rules")?"dc_subnav_on":"dc_subnav"%>">
                <a class="<%=tl2.equals("rules")?"dc_subnav_on_link":"dc_subnav_link"%>" href="/pl/?&module=Static&d1=doubleclick&d2=int_rules">Rules</a>
            </td>
            <td align="center" class="<%=tl2.equals("arena")?"dc_subnav_on":"dc_subnav"%>">
                <a class="<%=tl2.equals("arena")?"dc_subnav_on_link":"dc_subnav_link"%>" href="/pl/?&module=Static&d1=doubleclick&d2=col_arena">Practice Arena</a>
            </td>
            <td class="dc_subnav" width="49%" align="center">&nbsp;</td>
        </tr>
    </table>
<% } %>