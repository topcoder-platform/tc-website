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
                <tr><td class="compDocsSmall">Design Diagrams</td></tr>
                <tr><td class="<%=doc.equals("doc1")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tco03&d3=comp_docs&d4=pops_initial_doc1">Add a Method Aspect to an existing object.gif</td></tr>
                <tr><td class="<%=doc.equals("doc2")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tco03&d3=comp_docs&d4=pops_initial_doc2">Add a Method Aspect with method filter to an existing object.gif</a></td></tr>
                <tr><td class="<%=doc.equals("doc3")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tco03&d3=comp_docs&d4=pops_initial_doc3">Aspect Oriented Factory.gif</a></td></tr>
                <tr><td class="<%=doc.equals("doc4")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tco03&d3=comp_docs&d4=pops_initial_doc4">Aspect Oriented Use Cases.gif</a></td></tr>
                <tr><td class="<%=doc.equals("doc5")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tco03&d3=comp_docs&d4=pops_initial_doc5">Call an Aspected Method.gif</a></td></tr>
                <tr><td class="<%=doc.equals("doc6")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tco03&d3=comp_docs&d4=pops_initial_doc6">Create a Method Aspect.gif</a></td></tr>
                <tr><td class="<%=doc.equals("doc7")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tco03&d3=comp_docs&d4=pops_initial_doc7">Create a Method Filter.gif</a></td></tr>
                <tr><td class="<%=doc.equals("doc8")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tco03&d3=comp_docs&d4=pops_initial_doc8">Create a Proxy Factory.gif</a></td></tr>
                <tr><td class="<%=doc.equals("doc9")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tco03&d3=comp_docs&d4=pops_initial_doc9">Create the AOP Factory.gif</a></td></tr>
                <tr><td class="compDocsTabOff"><img src="/i/clear.gif" alt="" width="1" height="1" border="0"></td></tr>

                <tr><td class="compDocsSmall">Documentation</td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tco03/comp_docs/pops/AOP_Factory_Requirements_Specification.pdf" target="_blank">AOP Factory Requirements Specification.pdf</a></td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tco03/comp_docs/pops/initial/AOP_Factory_Component_Specification.pdf" target="_blank">AOP Factory Component Specification.pdf</a></td></tr>

    <% } else if (time.equals("830")) { %>
                <tr><td class="compDocsSmall">Design Diagrams</td></tr>
                <tr><td class="<%=doc.equals("doc1")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tco03&d3=comp_docs&d4=pops_830_doc1">Add a Method Aspect to an existing object.gif</td></tr>
                <tr><td class="<%=doc.equals("doc2")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tco03&d3=comp_docs&d4=pops_830_doc2">Add a Method Aspect with method filter to an existing object.gif</a></td></tr>
                <tr><td class="<%=doc.equals("doc3")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tco03&d3=comp_docs&d4=pops_830_doc3">Aspect Oriented Factory.gif</a></td></tr>
                <tr><td class="<%=doc.equals("doc4")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tco03&d3=comp_docs&d4=pops_830_doc4">Aspect Oriented Use Cases.gif</a></td></tr>
                <tr><td class="<%=doc.equals("doc5")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tco03&d3=comp_docs&d4=pops_830_doc5">Call an Aspected Method.gif</a></td></tr>
                <tr><td class="<%=doc.equals("doc6")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tco03&d3=comp_docs&d4=pops_830_doc6">Create a Method Aspect.gif</a></td></tr>
                <tr><td class="<%=doc.equals("doc7")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tco03&d3=comp_docs&d4=pops_830_doc7">Create a Method Filter.gif</a></td></tr>
                <tr><td class="<%=doc.equals("doc8")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tco03&d3=comp_docs&d4=pops_830_doc8">Create a Proxy Factory.gif</a></td></tr>
                <tr><td class="<%=doc.equals("doc9")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tco03&d3=comp_docs&d4=pops_830_doc9">Create the AOP Factory.gif</a></td></tr>
                <tr><td class="compDocsTabOff"><img src="/i/clear.gif" alt="" width="1" height="1" border="0"></td></tr>

                <tr><td class="compDocsSmall">Documentation</td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tco03/comp_docs/pops/AOP_Factory_Requirements_Specification.pdf" target="_blank">AOP Factory Requirements Specification.pdf</a></td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tco03/comp_docs/pops/830/AOP_Factory_Component_Specification.pdf" target="_blank">AOP Factory Component Specification.pdf</a></td></tr>

    <% } else if (time.equals("900")) { %>
                <tr><td class="compDocsSmall">Design Diagrams</td></tr>
                <tr><td class="<%=doc.equals("doc1")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tco03&d3=comp_docs&d4=pops_900_doc1">Add a Method Aspect to an existing object.gif</td></tr>
                <tr><td class="<%=doc.equals("doc2")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tco03&d3=comp_docs&d4=pops_900_doc2">Add a Method Aspect with method filter to an existing object.gif</a></td></tr>
                <tr><td class="<%=doc.equals("doc3")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tco03&d3=comp_docs&d4=pops_900_doc3">Aspect Oriented Factory.gif</a></td></tr>
                <tr><td class="<%=doc.equals("doc4")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tco03&d3=comp_docs&d4=pops_900_doc4">Aspect Oriented Use Cases.gif</a></td></tr>
                <tr><td class="<%=doc.equals("doc5")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tco03&d3=comp_docs&d4=pops_900_doc5">Call an Aspected Method.gif</a></td></tr>
                <tr><td class="<%=doc.equals("doc6")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tco03&d3=comp_docs&d4=pops_900_doc6">Create a Method Aspect.gif</a></td></tr>
                <tr><td class="<%=doc.equals("doc7")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tco03&d3=comp_docs&d4=pops_900_doc7">Create a Method Filter.gif</a></td></tr>
                <tr><td class="<%=doc.equals("doc8")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tco03&d3=comp_docs&d4=pops_900_doc8">Create a Proxy Factory.gif</a></td></tr>
                <tr><td class="<%=doc.equals("doc9")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tco03&d3=comp_docs&d4=pops_900_doc9">Create the AOP Factory.gif</a></td></tr>
                <tr><td class="compDocsTabOff"><img src="/i/clear.gif" alt="" width="1" height="1" border="0"></td></tr>

                <tr><td class="compDocsSmall">Documentation</td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tco03/comp_docs/pops/AOP_Factory_Requirements_Specification.pdf" target="_blank">AOP Factory Requirements Specification.pdf</a></td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tco03/comp_docs/pops/900/AOP_Factory_Component_Specification.pdf" target="_blank">AOP Factory Component Specification.pdf</a></td></tr>

    <% } else if (time.equals("930")) { %>
                <tr><td class="compDocsSmall">Design Diagrams</td></tr>

                <tr><td class="compDocsSmall">Documentation</td></tr>

    <% } else if (time.equals("1000")) { %>
                <tr><td class="compDocsSmall">Design Diagrams</td></tr>

                <tr><td class="compDocsSmall">Documentation</td></tr>

    <% } else if (time.equals("1030")) { %>
                <tr><td class="compDocsSmall">Design Diagrams</td></tr>

                <tr><td class="compDocsSmall">Documentation</td></tr>

    <% } else if (time.equals("1100")) { %>
                <tr><td class="compDocsSmall">Design Diagrams</td></tr>

                <tr><td class="compDocsSmall">Documentation</td></tr>

    <% } else if (time.equals("1130")) { %>
                <tr><td class="compDocsSmall">Design Diagrams</td></tr>

                <tr><td class="compDocsSmall">Documentation</td></tr>

    <% } else if (time.equals("final")) { %>
                <tr><td class="compDocsSmall">Design Diagrams</td></tr>

                <tr><td class="compDocsSmall">Documentation</td></tr>

    <% } %>

                <tr><td class="compDocsTabOff"><img src="/i/clear.gif" alt="" width="1" height="1" border="0"></td></tr>
                
                <tr><td class="compDocsSmall">Review Board Scorecards</td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tco03/comp_docs/pops/pops_aop_design_review_ken_vogel.htm" target="_blank"><strong>Ken Vogel</strong></a></td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tco03/comp_docs/pops/pops_aop_design_review_srowen.htm" target="_blank"><strong>srowen</strong></a></td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tco03/comp_docs/pops/pops_aop_design_review_valeriy.htm" target="_blank"><strong>valeriy</strong></a></td></tr>
           </table>
