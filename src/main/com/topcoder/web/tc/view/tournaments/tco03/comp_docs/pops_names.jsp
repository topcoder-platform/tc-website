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
    String time = request.getParameter("time")==null?"":request.getParameter("time");
    String doc = request.getParameter("doc")==null?"":request.getParameter("doc");
%>

            <table border="0" cellspacing="0" cellpadding="0" width="190">
                <tr><td class="compDocsTabOff"><img src="/i/clear.gif" alt="" width="1" height="20" border="0"></td></tr>

    <% if (time.equals("initial")) { %>
                <tr><td class="compDocsSmall">The following files will open in the window to the right</td></tr>
                <tr><td class="<%=doc.equals("doc1")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tco03&d3=comp_docs&d4=pops_initial_doc1">Timer_Class_Diagram.gif</td></tr>
                <tr><td class="<%=doc.equals("doc2")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tco03&d3=comp_docs&d4=pops_initial_doc2">Timer_Sequence_Diagram_1.gif</a></td></tr>
                <tr><td class="<%=doc.equals("doc3")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tco03&d3=comp_docs&d4=pops_initial_doc3">Timer_Sequence_Diagram_2.gif</a></td></tr>
                <tr><td class="<%=doc.equals("doc4")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tco03&d3=comp_docs&d4=pops_initial_doc4">Timer_Sequence_Diagram_3.gif</a></td></tr>
                <tr><td class="<%=doc.equals("doc5")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tco03&d3=comp_docs&d4=pops_initial_doc5">Timer_Sequence_Diagram_4.gif</a></td></tr>
                <tr><td class="<%=doc.equals("doc6")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tco03&d3=comp_docs&d4=pops_initial_doc6">Timer_Sequence_Diagram_5.gif</a></td></tr>
                <tr><td class="<%=doc.equals("doc7")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tco03&d3=comp_docs&d4=pops_initial_doc7">Timer_Sequence_Diagram_6.gif</a></td></tr>
                <tr><td class="<%=doc.equals("doc8")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tco03&d3=comp_docs&d4=pops_initial_doc8">Timer_Use_Case_Diagram.gif</a></td></tr>
                <tr><td class="compDocsTabOff"><img src="/i/clear.gif" alt="" width="1" height="20" border="0"></td></tr>

                <tr><td class="compDocsSmall">The following files will open in a new window</td></tr>
                <tr><td class="compDocsTabOff"><a href="/tc?module=Static&d1=tournaments&d2=tco03&d3=comp_docs&d4=pops_initial_doc09" target="_blank">TimerConfiguration.java</a></td></tr>
                <tr><td class="compDocsTabOff"><a href="/tc?module=Static&d1=tournaments&d2=tco03&d3=comp_docs&d4=pops_initial_doc10" target="_blank">Timer.java</a></td></tr>
                <tr><td class="compDocsTabOff"><a href="/tc?module=Static&d1=tournaments&d2=tco03&d3=comp_docs&d4=pops_initial_doc11" target="_blank">ExecutionDetail.java</a></td></tr>

    <% } else if (time.equals("830")) { %>
                <tr><td class="compDocsSmall">The following files will open in the window to the right</td></tr>
                <tr><td class="<%=doc.equals("doc1")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tco03&d3=comp_docs&d4=pops_830_doc1">Timer_Class_Diagram.gif</td></tr>
                <tr><td class="<%=doc.equals("doc2")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tco03&d3=comp_docs&d4=pops_830_doc2">Timer_Sequence_Diagram_1.gif</a></td></tr>
                <tr><td class="<%=doc.equals("doc3")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tco03&d3=comp_docs&d4=pops_830_doc3">Timer_Sequence_Diagram_2.gif</a></td></tr>
                <tr><td class="<%=doc.equals("doc4")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tco03&d3=comp_docs&d4=pops_830_doc4">Timer_Sequence_Diagram_3.gif</a></td></tr>
                <tr><td class="<%=doc.equals("doc5")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tco03&d3=comp_docs&d4=pops_830_doc5">Timer_Sequence_Diagram_4.gif</a></td></tr>
                <tr><td class="<%=doc.equals("doc6")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tco03&d3=comp_docs&d4=pops_830_doc6">Timer_Sequence_Diagram_5.gif</a></td></tr>
                <tr><td class="<%=doc.equals("doc7")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tco03&d3=comp_docs&d4=pops_830_doc7">Timer_Sequence_Diagram_6.gif</a></td></tr>
                <tr><td class="<%=doc.equals("doc8")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tco03&d3=comp_docs&d4=pops_830_doc8">Timer_Use_Case_Diagram.gif</a></td></tr>
                <tr><td class="compDocsTabOff"><img src="/i/clear.gif" alt="" width="1" height="20" border="0"></td></tr>

                <tr><td class="compDocsSmall">The following files will open in a new window</td></tr>
                <tr><td class="compDocsTabOff"><a href="/tc?module=Static&d1=tournaments&d2=tco03&d3=comp_docs&d4=pops_830_doc09" target="_blank">TimerConfiguration.java</a></td></tr>
                <tr><td class="compDocsTabOff"><a href="/tc?module=Static&d1=tournaments&d2=tco03&d3=comp_docs&d4=pops_830_doc10" target="_blank">Timer.java</a></td></tr>
                <tr><td class="compDocsTabOff"><a href="/tc?module=Static&d1=tournaments&d2=tco03&d3=comp_docs&d4=pops_830_doc11" target="_blank">ExecutionDetail.java</a></td></tr>

    <% } else if (time.equals("900")) { %>
                <tr><td class="compDocsSmall">The following files will open in the window to the right</td></tr>
                <tr><td class="<%=doc.equals("doc1")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tco03&d3=comp_docs&d4=pops_900_doc1">Timer_Class_Diagram.gif</td></tr>
                <tr><td class="<%=doc.equals("doc2")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tco03&d3=comp_docs&d4=pops_900_doc2">Timer_Sequence_Diagram_1.gif</a></td></tr>
                <tr><td class="<%=doc.equals("doc3")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tco03&d3=comp_docs&d4=pops_900_doc3">Timer_Sequence_Diagram_2.gif</a></td></tr>
                <tr><td class="<%=doc.equals("doc4")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tco03&d3=comp_docs&d4=pops_900_doc4">Timer_Sequence_Diagram_3.gif</a></td></tr>
                <tr><td class="<%=doc.equals("doc5")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tco03&d3=comp_docs&d4=pops_900_doc5">Timer_Sequence_Diagram_4.gif</a></td></tr>
                <tr><td class="<%=doc.equals("doc6")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tco03&d3=comp_docs&d4=pops_900_doc6">Timer_Sequence_Diagram_5.gif</a></td></tr>
                <tr><td class="<%=doc.equals("doc7")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tco03&d3=comp_docs&d4=pops_900_doc7">Timer_Sequence_Diagram_6.gif</a></td></tr>
                <tr><td class="<%=doc.equals("doc8")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tco03&d3=comp_docs&d4=pops_900_doc8">Timer_Use_Case_Diagram.gif</a></td></tr>
                <tr><td class="compDocsTabOff"><img src="/i/clear.gif" alt="" width="1" height="20" border="0"></td></tr>

                <tr><td class="compDocsSmall">The following files will open in a new window</td></tr>
                <tr><td class="compDocsTabOff"><a href="/tc?module=Static&d1=tournaments&d2=tco03&d3=comp_docs&d4=pops_900_doc09" target="_blank">TimerConfiguration.java</a></td></tr>
                <tr><td class="compDocsTabOff"><a href="/tc?module=Static&d1=tournaments&d2=tco03&d3=comp_docs&d4=pops_900_doc10" target="_blank">Timer.java</a></td></tr>
                <tr><td class="compDocsTabOff"><a href="/tc?module=Static&d1=tournaments&d2=tco03&d3=comp_docs&d4=pops_900_doc11" target="_blank">ExecutionDetail.java</a></td></tr>

    <% } else if (time.equals("930")) { %>
                <tr><td class="compDocsSmall">The following files will open in the window to the right</td></tr>
                <tr><td class="<%=doc.equals("doc1")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tco03&d3=comp_docs&d4=pops_930_doc1">Timer_Class_Diagram.gif</td></tr>
                <tr><td class="<%=doc.equals("doc2")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tco03&d3=comp_docs&d4=pops_930_doc2">Timer_Sequence_Diagram_1.gif</a></td></tr>
                <tr><td class="<%=doc.equals("doc3")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tco03&d3=comp_docs&d4=pops_930_doc3">Timer_Sequence_Diagram_2.gif</a></td></tr>
                <tr><td class="<%=doc.equals("doc4")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tco03&d3=comp_docs&d4=pops_930_doc4">Timer_Sequence_Diagram_3.gif</a></td></tr>
                <tr><td class="<%=doc.equals("doc5")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tco03&d3=comp_docs&d4=pops_930_doc5">Timer_Sequence_Diagram_4.gif</a></td></tr>
                <tr><td class="<%=doc.equals("doc6")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tco03&d3=comp_docs&d4=pops_930_doc6">Timer_Sequence_Diagram_5.gif</a></td></tr>
                <tr><td class="<%=doc.equals("doc7")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tco03&d3=comp_docs&d4=pops_930_doc7">Timer_Sequence_Diagram_6.gif</a></td></tr>
                <tr><td class="<%=doc.equals("doc8")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tco03&d3=comp_docs&d4=pops_930_doc8">Timer_Use_Case_Diagram.gif</a></td></tr>
                <tr><td class="compDocsTabOff"><img src="/i/clear.gif" alt="" width="1" height="20" border="0"></td></tr>

                <tr><td class="compDocsSmall">The following files will open in a new window</td></tr>
                <tr><td class="compDocsTabOff"><a href="/tc?module=Static&d1=tournaments&d2=tco03&d3=comp_docs&d4=pops_930_doc09" target="_blank">TimerConfiguration.java</a></td></tr>
                <tr><td class="compDocsTabOff"><a href="/tc?module=Static&d1=tournaments&d2=tco03&d3=comp_docs&d4=pops_930_doc10" target="_blank">Timer.java</a></td></tr>
                <tr><td class="compDocsTabOff"><a href="/tc?module=Static&d1=tournaments&d2=tco03&d3=comp_docs&d4=pops_930_doc11" target="_blank">ExecutionDetail.java</a></td></tr>

    <% } else if (time.equals("1000")) { %>
                <tr><td class="compDocsSmall">The following files will open in the window to the right</td></tr>
                <tr><td class="<%=doc.equals("doc1")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tco03&d3=comp_docs&d4=pops_1000_doc1">Timer_Class_Diagram.gif</td></tr>
                <tr><td class="<%=doc.equals("doc2")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tco03&d3=comp_docs&d4=pops_1000_doc2">Timer_Sequence_Diagram_1.gif</a></td></tr>
                <tr><td class="<%=doc.equals("doc3")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tco03&d3=comp_docs&d4=pops_1000_doc3">Timer_Sequence_Diagram_2.gif</a></td></tr>
                <tr><td class="<%=doc.equals("doc4")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tco03&d3=comp_docs&d4=pops_1000_doc4">Timer_Sequence_Diagram_3.gif</a></td></tr>
                <tr><td class="<%=doc.equals("doc5")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tco03&d3=comp_docs&d4=pops_1000_doc5">Timer_Sequence_Diagram_4.gif</a></td></tr>
                <tr><td class="<%=doc.equals("doc6")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tco03&d3=comp_docs&d4=pops_1000_doc6">Timer_Sequence_Diagram_5.gif</a></td></tr>
                <tr><td class="<%=doc.equals("doc7")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tco03&d3=comp_docs&d4=pops_1000_doc7">Timer_Sequence_Diagram_6.gif</a></td></tr>
                <tr><td class="<%=doc.equals("doc8")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tco03&d3=comp_docs&d4=pops_1000_doc8">Timer_Use_Case_Diagram.gif</a></td></tr>
                <tr><td class="compDocsTabOff"><img src="/i/clear.gif" alt="" width="1" height="20" border="0"></td></tr>

                <tr><td class="compDocsSmall">The following files will open in a new window</td></tr>
                <tr><td class="compDocsTabOff"><a href="/tc?module=Static&d1=tournaments&d2=tco03&d3=comp_docs&d4=pops_1000_doc09" target="_blank">TimerConfiguration.java</a></td></tr>
                <tr><td class="compDocsTabOff"><a href="/tc?module=Static&d1=tournaments&d2=tco03&d3=comp_docs&d4=pops_1000_doc10" target="_blank">Timer.java</a></td></tr>
                <tr><td class="compDocsTabOff"><a href="/tc?module=Static&d1=tournaments&d2=tco03&d3=comp_docs&d4=pops_1000_doc11" target="_blank">ExecutionDetail.java</a></td></tr>

    <% } else if (time.equals("1030")) { %>
                <tr><td class="compDocsSmall">The following files will open in the window to the right</td></tr>
                <tr><td class="<%=doc.equals("doc1")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tco03&d3=comp_docs&d4=pops_1030_doc1">Timer_Class_Diagram.gif</td></tr>
                <tr><td class="<%=doc.equals("doc2")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tco03&d3=comp_docs&d4=pops_1030_doc2">Timer_Sequence_Diagram_1.gif</a></td></tr>
                <tr><td class="<%=doc.equals("doc3")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tco03&d3=comp_docs&d4=pops_1030_doc3">Timer_Sequence_Diagram_2.gif</a></td></tr>
                <tr><td class="<%=doc.equals("doc4")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tco03&d3=comp_docs&d4=pops_1030_doc4">Timer_Sequence_Diagram_3.gif</a></td></tr>
                <tr><td class="<%=doc.equals("doc5")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tco03&d3=comp_docs&d4=pops_1030_doc5">Timer_Sequence_Diagram_4.gif</a></td></tr>
                <tr><td class="<%=doc.equals("doc6")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tco03&d3=comp_docs&d4=pops_1030_doc6">Timer_Sequence_Diagram_5.gif</a></td></tr>
                <tr><td class="<%=doc.equals("doc7")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tco03&d3=comp_docs&d4=pops_1030_doc7">Timer_Sequence_Diagram_6.gif</a></td></tr>
                <tr><td class="<%=doc.equals("doc8")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tco03&d3=comp_docs&d4=pops_1030_doc8">Timer_Use_Case_Diagram.gif</a></td></tr>
                <tr><td class="compDocsTabOff"><img src="/i/clear.gif" alt="" width="1" height="20" border="0"></td></tr>

                <tr><td class="compDocsSmall">The following files will open in a new window</td></tr>
                <tr><td class="compDocsTabOff"><a href="/tc?module=Static&d1=tournaments&d2=tco03&d3=comp_docs&d4=pops_1030_doc09" target="_blank">TimerConfiguration.java</a></td></tr>
                <tr><td class="compDocsTabOff"><a href="/tc?module=Static&d1=tournaments&d2=tco03&d3=comp_docs&d4=pops_1030_doc10" target="_blank">Timer.java</a></td></tr>
                <tr><td class="compDocsTabOff"><a href="/tc?module=Static&d1=tournaments&d2=tco03&d3=comp_docs&d4=pops_1030_doc11" target="_blank">ExecutionDetail.java</a></td></tr>

    <% } else if (time.equals("1100")) { %>
                <tr><td class="compDocsSmall">The following files will open in the window to the right</td></tr>
                <tr><td class="<%=doc.equals("doc1")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tco03&d3=comp_docs&d4=pops_1100_doc1">Timer_Class_Diagram.gif</td></tr>
                <tr><td class="<%=doc.equals("doc2")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tco03&d3=comp_docs&d4=pops_1100_doc2">Timer_Sequence_Diagram_1.gif</a></td></tr>
                <tr><td class="<%=doc.equals("doc3")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tco03&d3=comp_docs&d4=pops_1100_doc3">Timer_Sequence_Diagram_2.gif</a></td></tr>
                <tr><td class="<%=doc.equals("doc4")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tco03&d3=comp_docs&d4=pops_1100_doc4">Timer_Sequence_Diagram_3.gif</a></td></tr>
                <tr><td class="<%=doc.equals("doc5")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tco03&d3=comp_docs&d4=pops_1100_doc5">Timer_Sequence_Diagram_4.gif</a></td></tr>
                <tr><td class="<%=doc.equals("doc6")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tco03&d3=comp_docs&d4=pops_1100_doc6">Timer_Sequence_Diagram_5.gif</a></td></tr>
                <tr><td class="<%=doc.equals("doc7")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tco03&d3=comp_docs&d4=pops_1100_doc7">Timer_Sequence_Diagram_6.gif</a></td></tr>
                <tr><td class="<%=doc.equals("doc8")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tco03&d3=comp_docs&d4=pops_1100_doc8">Timer_Use_Case_Diagram.gif</a></td></tr>
                <tr><td class="compDocsTabOff"><img src="/i/clear.gif" alt="" width="1" height="20" border="0"></td></tr>

                <tr><td class="compDocsSmall">The following files will open in a new window</td></tr>
                <tr><td class="compDocsTabOff"><a href="/tc?module=Static&d1=tournaments&d2=tco03&d3=comp_docs&d4=pops_1100_doc09" target="_blank">TimerConfiguration.java</a></td></tr>
                <tr><td class="compDocsTabOff"><a href="/tc?module=Static&d1=tournaments&d2=tco03&d3=comp_docs&d4=pops_1100_doc10" target="_blank">Timer.java</a></td></tr>
                <tr><td class="compDocsTabOff"><a href="/tc?module=Static&d1=tournaments&d2=tco03&d3=comp_docs&d4=pops_1100_doc11" target="_blank">ExecutionDetail.java</a></td></tr>

    <% } else if (time.equals("1130")) { %>
                <tr><td class="compDocsSmall">The following files will open in the window to the right</td></tr>
                <tr><td class="<%=doc.equals("doc1")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tco03&d3=comp_docs&d4=pops_1130_doc1">Timer_Class_Diagram.gif</td></tr>
                <tr><td class="<%=doc.equals("doc2")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tco03&d3=comp_docs&d4=pops_1130_doc2">Timer_Sequence_Diagram_1.gif</a></td></tr>
                <tr><td class="<%=doc.equals("doc3")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tco03&d3=comp_docs&d4=pops_1130_doc3">Timer_Sequence_Diagram_2.gif</a></td></tr>
                <tr><td class="<%=doc.equals("doc4")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tco03&d3=comp_docs&d4=pops_1130_doc4">Timer_Sequence_Diagram_3.gif</a></td></tr>
                <tr><td class="<%=doc.equals("doc5")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tco03&d3=comp_docs&d4=pops_1130_doc5">Timer_Sequence_Diagram_4.gif</a></td></tr>
                <tr><td class="<%=doc.equals("doc6")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tco03&d3=comp_docs&d4=pops_1130_doc6">Timer_Sequence_Diagram_5.gif</a></td></tr>
                <tr><td class="<%=doc.equals("doc7")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tco03&d3=comp_docs&d4=pops_1130_doc7">Timer_Sequence_Diagram_6.gif</a></td></tr>
                <tr><td class="<%=doc.equals("doc8")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tco03&d3=comp_docs&d4=pops_1130_doc8">Timer_Use_Case_Diagram.gif</a></td></tr>
                <tr><td class="compDocsTabOff"><img src="/i/clear.gif" alt="" width="1" height="20" border="0"></td></tr>

                <tr><td class="compDocsSmall">The following files will open in a new window</td></tr>
                <tr><td class="compDocsTabOff"><a href="/tc?module=Static&d1=tournaments&d2=tco03&d3=comp_docs&d4=pops_1130_doc09" target="_blank">TimerConfiguration.java</a></td></tr>
                <tr><td class="compDocsTabOff"><a href="/tc?module=Static&d1=tournaments&d2=tco03&d3=comp_docs&d4=pops_1130_doc10" target="_blank">Timer.java</a></td></tr>
                <tr><td class="compDocsTabOff"><a href="/tc?module=Static&d1=tournaments&d2=tco03&d3=comp_docs&d4=pops_1130_doc11" target="_blank">ExecutionDetail.java</a></td></tr>

    <% } else if (time.equals("final")) { %>
                <tr><td class="compDocsSmall">The following files will open in the window to the right</td></tr>
                <tr><td class="<%=doc.equals("doc1")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tco03&d3=comp_docs&d4=pops_final_doc1">Timer_Class_Diagram.gif</td></tr>
                <tr><td class="<%=doc.equals("doc2")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tco03&d3=comp_docs&d4=pops_final_doc2">Timer_Sequence_Diagram_1.gif</a></td></tr>
                <tr><td class="<%=doc.equals("doc3")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tco03&d3=comp_docs&d4=pops_final_doc3">Timer_Sequence_Diagram_2.gif</a></td></tr>
                <tr><td class="<%=doc.equals("doc4")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tco03&d3=comp_docs&d4=pops_final_doc4">Timer_Sequence_Diagram_3.gif</a></td></tr>
                <tr><td class="<%=doc.equals("doc5")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tco03&d3=comp_docs&d4=pops_final_doc5">Timer_Sequence_Diagram_4.gif</a></td></tr>
                <tr><td class="<%=doc.equals("doc6")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tco03&d3=comp_docs&d4=pops_final_doc6">Timer_Sequence_Diagram_5.gif</a></td></tr>
                <tr><td class="<%=doc.equals("doc7")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tco03&d3=comp_docs&d4=pops_final_doc7">Timer_Sequence_Diagram_6.gif</a></td></tr>
                <tr><td class="<%=doc.equals("doc8")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tco03&d3=comp_docs&d4=pops_final_doc8">Timer_Use_Case_Diagram.gif</a></td></tr>
                <tr><td class="compDocsTabOff"><img src="/i/clear.gif" alt="" width="1" height="20" border="0"></td></tr>

                <tr><td class="compDocsSmall">The following files will open in a new window</td></tr>
                <tr><td class="compDocsTabOff"><a href="/tc?module=Static&d1=tournaments&d2=tco03&d3=comp_docs&d4=pops_final_doc09" target="_blank">TimerConfiguration.java</a></td></tr>
                <tr><td class="compDocsTabOff"><a href="/tc?module=Static&d1=tournaments&d2=tco03&d3=comp_docs&d4=pops_final_doc10" target="_blank">Timer.java</a></td></tr>
                <tr><td class="compDocsTabOff"><a href="/tc?module=Static&d1=tournaments&d2=tco03&d3=comp_docs&d4=pops_final_doc11" target="_blank">ExecutionDetail.java</a></td></tr>
    <% } %>

                <tr><td class="compDocsTabOff"><img src="/i/clear.gif" alt="" width="1" height="20" border="0"></td></tr>
                <tr><td class="compDocsSmall">Design Review Board Scorecards</td></tr>
                <tr><td class="compDocsTabOff"><a href="/tc?module=Static&d1=tournaments&d2=tco03&d3=comp_docs&d4=pops_aop_design_review_ken_vogel" target="_blank"><strong>Ken Vogel</strong></a></td></tr>
                <tr><td class="compDocsTabOff"><a href="/tc?module=Static&d1=tournaments&d2=tco03&d3=comp_docs&d4=pops_aop_design_review_srowen" target="_blank"><strong>srowen</strong></a></td></tr>
                <tr><td class="compDocsTabOff"><a href="/tc?module=Static&d1=tournaments&d2=tco03&d3=comp_docs&d4=pops_aop_design_review_valeriy" target="_blank"><strong>valeriy</strong></a></td></tr>
           </table>
