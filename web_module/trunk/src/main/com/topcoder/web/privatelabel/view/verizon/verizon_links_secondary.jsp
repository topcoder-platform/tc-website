<%@ page contentType="text/html; charset=ISO-8859-1" %>
<%@ page import="com.topcoder.web.privatelabel.Constants,
                 com.topcoder.shared.util.ApplicationServer" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<script>
function openWin(url, name, w, h) {
    win = window.open(url, 'biowin', "scrollbars=no,toolbar=no,resizable=no,menubar=no,width="+w+",height="+h);
    win.location.href = url;
    win.focus();
}
</script>

                        <table border="0" cellpadding="0" cellspacing="0" width="133">
<!-- Summary tab -->
                            <tr><td><img src="/i/clear.gif" width="1" height="7" alt="" ></td></tr>
                            <tr><td><a class="subnavLink" href="/pl/?&module=Static&d1=verizon&d2=vcc03_overview" style="margin-left:1px;display:inline;">Overview</a></td></tr>
                            <tr><td><img src="/i/clear.gif" width="1" height="7" alt="" ></td></tr>
                            <tr><td class="grey"><img src="/i/clear.gif" width="10" height="1" alt="" ></td></tr>
                            <tr><td><img src="/i/clear.gif" width="1" height="7" alt="" ></td></tr>

<!-- Schedule tab -->
                            <tr><td><img src="/i/clear.gif" width="1" height="7" alt="" ></td></tr>
                            <tr><td><a class="subnavLink" href="/pl/?&module=Static&d1=verizon&d2=vcc03_sched" style="margin-left:1px;display:inline;">Schedule</a></td></tr>
                            <tr><td><img src="/i/clear.gif" width="1" height="7" alt="" ></td></tr>
                            <tr><td class="grey"><img src="/i/events/verizon2003/ccc.gif" width="10" height="1" alt="" ></td></tr>
                            <tr><td><img src="/i/clear.gif" width="1" height="7" alt="" ></td></tr>

<!-- Rules tab -->
                            <tr><td><img src="/i/clear.gif" width="1" height="7" alt="" ></td></tr>
                            <tr><td><a class="subnavLink" href="/pl/?&module=Static&d1=verizon&d2=vcc03_rules" style="margin-left:1px;display:inline;">Rules</a></td></tr>
                            <tr><td><img src="/i/clear.gif" width="1" height="7" alt="" ></td></tr>
                            <tr><td class="grey"><img src="/i/events/verizon2003/ccc.gif" width="10" height="1" alt="" ></td></tr>
                            <tr><td><img src="/i/clear.gif" width="1" height="7" alt="" ></td></tr>

<!-- Register tab -->
                            <tr><td><img src="/i/clear.gif" width="1" height="7" alt="" ></td></tr>
                            <tr><td><a class="subnavLink" href="https://<%=ApplicationServer.SERVER_NAME%>/pl/?&<%=Constants.MODULE_KEY+"="+Constants.VERIZON_REG_MAIN+"&"+Constants.COMPANY_ID+"=1747&"+Constants.EVENT_ID+"=1"%>" style="margin-left:1px;display:inline;">Register Now</a></td></tr>
<%--                            <tr><td><a class="subnavLink" href="?&<%=Constants.MODULE_KEY+"="+Constants.STATIC+"&d1=verizon&d2=vcc03_reg"%>" style="margin-left:1px;display:inline;">Registration</a></td></tr>--%>
                            <tr><td><img src="/i/clear.gif" width="1" height="7" alt="" ></td></tr>
                            <tr><td class="grey"><img src="/i/events/verizon2003/ccc.gif" width="10" height="1" alt="" ></td></tr>
                            <tr><td><img src="/i/clear.gif" width="1" height="7" alt="" ></td></tr>
                            
<!-- Instructions tab -->
                            <tr><td><img src="/i/clear.gif" width="1" height="7" alt="" ></td></tr>
                            <tr><td><a class="subnavLink" href="/pl/?&module=Static&d1=verizon&d2=vcc03_instructions" style="margin-left:1px;display:inline;">Competition Instructions</a></td></tr>
                            <tr><td><img src="/i/clear.gif" width="1" height="7" alt="" ></td></tr>
                            <tr><td class="grey"><img src="/i/events/verizon2003/ccc.gif" width="10" height="1" alt="" ></td></tr>

<!-- Advancers tab 
                            <tr><td><img src="/i/clear.gif" width="1" height="7" alt="" ></td></tr>
                            <tr><td><a class="subnavLink" href="/pl/?&module=Static&d1=verizon&d2=vcc03_advancers" style="margin-left:1px;display:inline;">Advancers</a></td></tr>
                            <tr><td><img src="/i/clear.gif" width="1" height="7" alt="" ></td></tr>
                            <tr><td class="grey"><img src="/i/events/verizon2003/ccc.gif" width="10" height="1" alt="" ></td></tr>
                            <tr><td><img src="/i/clear.gif" width="1" height="7" alt="" ></td></tr>-->
                            
                        </table>

<!-- Competition Arena tab 
                        <table border="0" cellpadding="0" cellspacing="0" width="133">
                            <tr valign="middle">
                                <td align="right" width="99%"><a href="/pl/?&module=Static&d1=verizon&d2=vcc03_competition">Competition Arena</a></td>
                                <td align="right" width="18"><a href="/pl/?&module=Static&d1=verizon&d2=vcc03_competition"><img src="/i/events/verizon2003/icn_go.gif" alt="&gt;" width="18" height="18" border="0" hspace="5"></a></td>
                            </tr>
                        </table>-->
                        
<!-- Practice Arena tab -->
                        <table border="0" cellpadding="0" cellspacing="0" width="133">
                            <tr valign="middle">
                                <td align="right" width="99%"><a href="/pl/?&module=Static&d1=verizon&d2=vcc03_practice">Practice Arena</a></td>
                                <td align="right" width="18"><a href="/pl/?&module=Static&d1=verizon&d2=vcc03_practice"><img src="/i/events/verizon2003/icn_go.gif" alt="&gt;" width="18" height="18" border="0" hspace="5"></a></td>
                            </tr>
                        </table>
                        
                        <table border="0" cellpadding="0" cellspacing="0" width="133">
                            <tr><td><img src="/i/clear.gif" width="1" height="7" alt="" ></td></tr>
                            <tr><td class="grey"><img src="/i/events/verizon2003/ccc.gif" width="10" height="2" alt="" ></td></tr>
                        </table>
