<%@  page
  language="java"
  errorPage="../../../errorPage.jsp"
  import="com.topcoder.common.web.data.Navigation,com.coolservlets.forum.*,
          java.text.SimpleDateFormat,
          java.util.HashMap,
          java.util.Iterator,
          com.topcoder.shared.util.ApplicationServer"
%>

<%
    String member = request.getParameter("member")==null?"":request.getParameter("member");
    String time = request.getParameter("time")==null?"":request.getParameter("time");
%>

<!-- Times for Pops -->

    <% if (member.equals("pops")) { %>
            <table border="0" cellspacing="0" cellpadding="0">
               <tr valign="middle">
                    <td class="compDocsTimeOff"><img src="/i/clear.gif" alt="" width="1" height="1" border="0"></td>
                    <td class="<%=time.equals("initial")?"compDocsTimeOn":"compDocsTimeOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tco03&d3=comp_docs&d4=pops_initial_doc1">Initial Submission</a></td>
<!--                    <td class="<%=time.equals("830")?"compDocsTimeOn":"compDocsTimeOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tco03&d3=comp_docs&d4=pops_830_doc1">8:30 AM</a></td> -->
<!--                    <td class="<%=time.equals("900")?"compDocsTimeOn":"compDocsTimeOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tco03&d3=comp_docs&d4=pops_900_doc1">9:00 AM</a></td> -->
<!--                    <td class="<%=time.equals("930")?"compDocsTimeOn":"compDocsTimeOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tco03&d3=comp_docs&d4=pops_930_doc1">9:30 AM</a></td> -->
<!--                    <td class="<%=time.equals("1000")?"compDocsTimeOn":"compDocsTimeOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tco03&d3=comp_docs&d4=pops_1000_doc1">10:00 AM</a></td> -->
<!--                    <td class="<%=time.equals("1030")?"compDocsTimeOn":"compDocsTimeOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tco03&d3=comp_docs&d4=pops_1030_doc1">10:30 AM</a></td> -->
<!--                    <td class="<%=time.equals("1100")?"compDocsTimeOn":"compDocsTimeOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tco03&d3=comp_docs&d4=pops_1100_doc1">11:00 AM</a></td> -->
<!--                    <td class="<%=time.equals("1130")?"compDocsTimeOn":"compDocsTimeOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tco03&d3=comp_docs&d4=pops_1130_doc1">11:30 AM</a></td> -->
<!--                    <td class="<%=time.equals("final")?"compDocsTimeOn":"compDocsTimeOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tco03&d3=comp_docs&d4=pops_final_doc1">FINAL</a></td> -->
                    <td class="compDocsTimeOff" width="99%"><img src="/i/clear.gif" alt="" width="1" height="1" border="0"></td>
                </tr>
            </table>

<!-- Times for kyky -->

    <% } else if (member.equals("kyky")) { %>
            <table border="0" cellspacing="0" cellpadding="0">
               <tr valign="middle">
                    <td class="compDocsTimeOff"><img src="/i/clear.gif" alt="" width="1" height="1" border="0"></td>
                    <td class="<%=time.equals("initial")?"compDocsTimeOn":"compDocsTimeOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tco03&d3=comp_docs&d4=kyky_initial_doc1">Initial Submission</a></td>
<!--                    <td class="<%=time.equals("830")?"compDocsTimeOn":"compDocsTimeOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tco03&d3=comp_docs&d4=kyky_830_doc1">8:30 AM</a></td> -->
<!--                    <td class="<%=time.equals("900")?"compDocsTimeOn":"compDocsTimeOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tco03&d3=comp_docs&d4=kyky_900_doc1">9:00 AM</a></td> -->
<!--                    <td class="<%=time.equals("930")?"compDocsTimeOn":"compDocsTimeOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tco03&d3=comp_docs&d4=kyky_930_doc1">9:30 AM</a></td> -->
<!--                    <td class="<%=time.equals("1000")?"compDocsTimeOn":"compDocsTimeOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tco03&d3=comp_docs&d4=kyky_1000_doc1">10:00 AM</a></td> -->
<!--                    <td class="<%=time.equals("1030")?"compDocsTimeOn":"compDocsTimeOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tco03&d3=comp_docs&d4=kyky_1030_doc1">10:30 AM</a></td> -->
<!--                    <td class="<%=time.equals("1100")?"compDocsTimeOn":"compDocsTimeOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tco03&d3=comp_docs&d4=kyky_1100_doc1">11:00 AM</a></td> -->
<!--                    <td class="<%=time.equals("1130")?"compDocsTimeOn":"compDocsTimeOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tco03&d3=comp_docs&d4=kyky_1130_doc1">11:30 AM</a></td> -->
<!--                    <td class="<%=time.equals("final")?"compDocsTimeOn":"compDocsTimeOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tco03&d3=comp_docs&d4=kyky_final_doc1">FINAL</a></td> -->
                    <td class="compDocsTimeOff" width="99%"><img src="/i/clear.gif" alt="" width="1" height="1" border="0"></td>
                </tr>
            </table>

<!-- Times for aksonov -->

    <% } else if (member.equals("aksonov")) { %>
            <table border="0" cellspacing="0" cellpadding="0">
               <tr valign="middle">
                    <td class="compDocsTimeOff"><img src="/i/clear.gif" alt="" width="1" height="1" border="0"></td>
                    <td class="<%=time.equals("initial")?"compDocsTimeOn":"compDocsTimeOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tco03&d3=comp_docs&d4=aksonov_initial_doc1">Initial Submission</a></td>
<!--                    <td class="<%=time.equals("830")?"compDocsTimeOn":"compDocsTimeOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tco03&d3=comp_docs&d4=aksonov_830_doc1">8:30 AM</a></td> -->
<!--                    <td class="<%=time.equals("900")?"compDocsTimeOn":"compDocsTimeOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tco03&d3=comp_docs&d4=aksonov_900_doc1">9:00 AM</a></td> -->
<!--                    <td class="<%=time.equals("930")?"compDocsTimeOn":"compDocsTimeOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tco03&d3=comp_docs&d4=aksonov_930_doc1">9:30 AM</a></td> -->
<!--                    <td class="<%=time.equals("1000")?"compDocsTimeOn":"compDocsTimeOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tco03&d3=comp_docs&d4=aksonov_1000_doc1">10:00 AM</a></td> -->
<!--                    <td class="<%=time.equals("1030")?"compDocsTimeOn":"compDocsTimeOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tco03&d3=comp_docs&d4=aksonov_1030_doc1">10:30 AM</a></td> -->
<!--                    <td class="<%=time.equals("1100")?"compDocsTimeOn":"compDocsTimeOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tco03&d3=comp_docs&d4=aksonov_1100_doc1">11:00 AM</a></td> -->
<!--                    <td class="<%=time.equals("1130")?"compDocsTimeOn":"compDocsTimeOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tco03&d3=comp_docs&d4=aksonov_1130_doc1">11:30 AM</a></td> -->
<!--                    <td class="<%=time.equals("final")?"compDocsTimeOn":"compDocsTimeOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tco03&d3=comp_docs&d4=aksonov_final_doc1">FINAL</a></td> -->
                    <td class="compDocsTimeOff" width="99%"><img src="/i/clear.gif" alt="" width="1" height="1" border="0"></td>
                </tr>
            </table>

<!-- Times for rneilsen -->

    <% } else if (member.equals("rnielsen")) { %>
            <table border="0" cellspacing="0" cellpadding="0">
               <tr valign="middle">
                    <td class="compDocsTimeOff"><img src="/i/clear.gif" alt="" width="1" height="1" border="0"></td>
                    <td class="<%=time.equals("initial")?"compDocsTimeOn":"compDocsTimeOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tco03&d3=comp_docs&d4=rneilsen_initial_doc1">Initial Submission</a></td>
<!--                    <td class="<%=time.equals("830")?"compDocsTimeOn":"compDocsTimeOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tco03&d3=comp_docs&d4=rneilsen_830_doc1">8:30 AM</a></td> -->
<!--                    <td class="<%=time.equals("900")?"compDocsTimeOn":"compDocsTimeOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tco03&d3=comp_docs&d4=rneilsen_900_doc1">9:00 AM</a></td> -->
<!--                    <td class="<%=time.equals("930")?"compDocsTimeOn":"compDocsTimeOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tco03&d3=comp_docs&d4=rneilsen_930_doc1">9:30 AM</a></td> -->
<!--                    <td class="<%=time.equals("1000")?"compDocsTimeOn":"compDocsTimeOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tco03&d3=comp_docs&d4=rneilsen_1000_doc1">10:00 AM</a></td> -->
<!--                    <td class="<%=time.equals("1030")?"compDocsTimeOn":"compDocsTimeOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tco03&d3=comp_docs&d4=rneilsen_1030_doc1">10:30 AM</a></td> -->
<!--                    <td class="<%=time.equals("1100")?"compDocsTimeOn":"compDocsTimeOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tco03&d3=comp_docs&d4=rneilsen_1100_doc1">11:00 AM</a></td> -->
<!--                    <td class="<%=time.equals("1130")?"compDocsTimeOn":"compDocsTimeOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tco03&d3=comp_docs&d4=rneilsen_1130_doc1">11:30 AM</a></td> -->
<!--                    <td class="<%=time.equals("final")?"compDocsTimeOn":"compDocsTimeOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tco03&d3=comp_docs&d4=rneilsen_final_doc1">FINAL</a></td> -->
                    <td class="compDocsTimeOff" width="99%"><img src="/i/clear.gif" alt="" width="1" height="1" border="0"></td>
                </tr>
            </table>
    <% } %>
