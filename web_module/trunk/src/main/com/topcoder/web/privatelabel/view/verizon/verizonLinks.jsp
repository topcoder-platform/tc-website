<%@ page contentType="text/html; charset=ISO-8859-1" %>
<%@ page import="com.topcoder.web.privatelabel.Constants" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%
    String selectedTab = request.getParameter("selectedTab")==null?"":request.getParameter("selectedTab");
    String selectedSubtab = request.getParameter("selectedSubtab")==null?"":request.getParameter("selectedSubtab");    
%>

<script>
function openWin(url, name, w, h) {
    win = window.open(url, 'biowin', "scrollbars=no,toolbar=no,resizable=no,menubar=no,width="+w+",height="+h);
    win.location.href = url;
    win.focus();
}
</script>

<!-- Summary tab -->
<img src="/i/clear.gif" width=1 height=6 alt="" ><br>
<a class="leftnav" href="/pl/?&module=Static&d1=verizon&d2=vcc03_overview" style="margin-left:1px;display:inline;">Overview</a><br/>
<img src="/i/clear.gif" width=1 height=6 alt="" ><br>
<img src="/images/ccc.gif" width=110 height=1 alt="" ><br>
<img src="/i/clear.gif" width=1 height=6 alt="" ><br>

<!-- Schedule tab -->
<img src="/i/clear.gif" width=1 height=6 alt="" ><br>
<a class="leftnav" href="/pl/?&module=Static&d1=verizon&d2=vcc03_sched" style="margin-left:1px;display:inline;">Schedule</a><br/>
<img src="/i/clear.gif" width=1 height=6 alt="" ><br>
<img src="/images/ccc.gif" width=110 height=1 alt="" ><br>
<img src="/i/clear.gif" width=1 height=6 alt="" ><br>

<!-- Rules tab -->
<img src="/i/clear.gif" width=1 height=6 alt="" ><br>
<a class="leftnav" href="/pl/?&module=Static&d1=verizon&d2=vcc03_rules_overview" style="margin-left:1px;display:inline;">Rules</a><br/>
<img src="/i/clear.gif" width=1 height=6 alt="" ><br>
<img src="/images/ccc.gif" width=110 height=1 alt="" ><br>
<img src="/i/clear.gif" width=1 height=6 alt="" ><br>

<!-- Register tab -->
<img src="/i/clear.gif" width=1 height=6 alt="" ><br>
<a class="leftnav" href="?&<%=Constants.MODULE_KEY+"="+Constants.VERIZON_REG_MAIN+"&"+Constants.COMPANY_ID+"=1747&"+Constants.EVENT_ID+"=1"%>" style="margin-left:1px;display:inline;">Register Now</a><br/>
<img src="/i/clear.gif" width=1 height=6 alt="" ><br>
<img src="/images/ccc.gif" width=110 height=1 alt="" ><br>
<img src="/i/clear.gif" width=1 height=6 alt="" ><br>

<!-- Practice Arena tab -->
<a href="Javascript:openWin('?module=Static&d1=verizon&d2=vcc03_quick_launch','comp',300,225);"class="statTextBig"><img src="/i/events/verizon2003/tab_applet.gif" alt="Arena" width="127" height="25" border="0" /></a>
