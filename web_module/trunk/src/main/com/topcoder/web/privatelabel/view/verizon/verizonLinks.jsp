<%@ page contentType="text/html; charset=ISO-8859-1" %>
<%@ page import="com.topcoder.web.privatelabel.Constants" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer" %>
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

                        <table border="0" cellpadding="0" cellspacing="5">
                            <tr>
                                <td width="124" class="leftnav" valign="top">
<!-- Summary tab -->
                                    <img src="/i/clear.gif" width="1" height="6" alt="" ><br>
                                    <a class="leftnav" href="/pl/?&module=Static&d1=verizon&d2=vcc03_overview" style="margin-left:1px;display:inline;">Overview</a><br/>
                                    <img src="/i/clear.gif" width="1" height="6" alt="" ><br>
                                    <img src="/i/events/verizon2003/ccc.gif" width="110" height="1" alt="" ><br>
                                    <img src="/i/clear.gif" width="1" height="6" alt="" ><br>

<!-- Schedule tab -->
                                    <img src="/i/clear.gif" width="1" height="6" alt="" ><br>
                                    <a class="leftnav" href="/pl/?&module=Static&d1=verizon&d2=vcc03_sched" style="margin-left:1px;display:inline;">Schedule</a><br/>
                                    <img src="/i/clear.gif" width="1" height="6" alt="" ><br>
                                    <img src="/i/events/verizon2003/ccc.gif" width="110" height="1" alt="" ><br>
                                    <img src="/i/clear.gif" width="1" height="6" alt="" ><br>

<!-- Rules tab -->
                                    <img src="/i/clear.gif" width="1" height="6" alt="" ><br>
                                    <a class="leftnav" href="/pl/?&module=Static&d1=verizon&d2=vcc03_rules" style="margin-left:1px;display:inline;">Rules</a><br/>
                                    <img src="/i/clear.gif" width="1" height="6" alt="" ><br>
                                    <img src="/i/events/verizon2003/ccc.gif" width="110" height="1" alt="" ><br>
                                    <img src="/i/clear.gif" width="1" height="6" alt="" ><br>

<!-- Register tab -->
                                    <img src="/i/clear.gif" width="1" height="6" alt="" ><br>
                                    <a class="leftnav" href="https://<%=ApplicationServer.SERVER_NAME%>/pl/?&<%=Constants.MODULE_KEY+"="+Constants.VERIZON_REG_MAIN+"&"+Constants.COMPANY_ID+"=1747&"+Constants.EVENT_ID+"=1"%>" style="margin-left:1px;display:inline;">Register Now</a><br/>
<%--                                    <a class="leftnav" href="?&<%=Constants.MODULE_KEY+"="+Constants.STATIC+"&d1=verizon&d2=vcc03_reg"%>" style="margin-left:1px;display:inline;">Registration</a><br/>--%>
                                    <img src="/i/clear.gif" width="1" height="6" alt="" ><br>
                                    <img src="/i/events/verizon2003/ccc.gif" width="110" height="1" alt="" ><br>
                                    <img src="/i/clear.gif" width="1" height="6" alt="" ><br>

<!-- Instructions tab -->
                                    <img src="/i/clear.gif" width="1" height="6" alt="" ><br>
                                    <a class="leftnav" href="/pl/?&module=Static&d1=verizon&d2=vcc03_instructions" style="margin-left:1px;display:inline;">Competition Instructions</a><br/>
                                    <img src="/i/clear.gif" width="1" height="6" alt="" ><br>
                                    <img src="/i/events/verizon2003/ccc.gif" width="110" height="1" alt="" ><br>
                                    <img src="/i/clear.gif" width="1" height="6" alt="" ><br>
                                    
<!-- Advancers tab --> 
                                    <img src="/i/clear.gif" width="1" height="6" alt="" ><br>
                                    <a class="leftnav" href="/pl/?&module=Static&d1=verizon&d2=vcc03_advancers" style="margin-left:1px;display:inline;">Advancers</a><br/>
                                    <img src="/i/clear.gif" width="1" height="6" alt="" ><br>
                                    <img src="/i/events/verizon2003/ccc.gif" width="110" height="1" alt="" ><br>
                                    <img src="/i/clear.gif" width="1" height="6" alt="" ><br>
                                    
                                </td>
                            </tr>
                        </table>

<!-- Competition Arena tab -->
                        <table border="0" cellpadding="0" cellspacing="0" >
                            <tr valign="middle">
                                <td align="right" width="99%" class="leftnav"><a href="/pl/?&module=Static&d1=verizon&d2=vcc03_practice">Competition Arena</a></td>
                                <td align="right" width="18" class="leftnav"><a href="/pl/?&module=Static&d1=verizon&d2=vcc03_practice"><img src="/i/events/verizon2003/icn_go.gif" alt="&gt;" width="18" height="18" border="0" hspace="5"></a></td>
                            </tr>
                        </table>

                        <img src="/images/spacer.gif" alt="" width="1" height="20"><br/>
