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

    <% if (time.equals("init")) { %>
                <tr><td class="compDocsSmall">Design Diagrams</td></tr>
                <tr><td class="<%=doc.equals("doc1")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=comp_finals&d4=adic_init_doc1">Catalog_Class_Diagram_Discount<br/>_Implementations.gif</a></td></tr>
                <tr><td class="<%=doc.equals("doc2")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=comp_finals&d4=adic_init_doc2">Catalog_Class_Diagram_Main.gif</a></td></tr>
                <tr><td class="<%=doc.equals("doc3")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=comp_finals&d4=adic_init_doc3">Catalog_Class_Diagram_Rule.gif</a></td></tr>
                <tr><td class="<%=doc.equals("doc4")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=comp_finals&d4=adic_init_doc4">Catalog_Class_Diagram_Scope_<br/>Implementations.gif</a></td></tr>
                <tr><td class="<%=doc.equals("doc5")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=comp_finals&d4=adic_init_doc5">Catalog_Sequence_Diagram_Add_<br/>Groups.gif</a></td></tr>
                <tr><td class="<%=doc.equals("doc6")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=comp_finals&d4=adic_init_doc6">Catalog_Sequence_Diagram_Add_<br/>Products.gif</a></td></tr>
                <tr><td class="<%=doc.equals("doc7")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=comp_finals&d4=adic_init_doc7">Catalog_Sequence_Diagram_Add_<br/>Rules.gif</a></td></tr>
                <tr><td class="<%=doc.equals("doc8")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=comp_finals&d4=adic_init_doc8">Catalog_Sequence_Diagram_Calculate_<br/>Discounted_Price.gif</a></td></tr>
                <tr><td class="<%=doc.equals("doc9")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=comp_finals&d4=adic_init_doc9">Catalog_Sequence_Diagram_Create_<br/>Groups.gif</a></td></tr>
                <tr><td class="<%=doc.equals("doc10")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=comp_finals&d4=adic_init_doc10">Catalog_Sequence_Diagram_Create_<br/>Products.gif</a></td></tr>
                <tr><td class="<%=doc.equals("doc11")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=comp_finals&d4=adic_init_doc11">Catalog_Sequence_Diagram_Create_<br/>Rules.gif</a></td></tr>
                <tr><td class="<%=doc.equals("doc12")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=comp_finals&d4=adic_init_doc12">Catalog_Sequence_Diagram_Navigate_<br/>Groups.gif</a></td></tr>
                <tr><td class="<%=doc.equals("doc13")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=comp_finals&d4=adic_init_doc13">Catalog_Sequence_Diagram_Navigate_<br/>Products.gif</a></td></tr>
                <tr><td class="<%=doc.equals("doc14")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=comp_finals&d4=adic_init_doc14">Catalog_Sequence_Diagram_Navigate_<br/>Rules.gif</a></td></tr>
                <tr><td class="<%=doc.equals("doc15")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=comp_finals&d4=adic_init_doc15">Catalog_Sequence_Diagram_Remove_<br/>Disable_Rules.gif</a></td></tr>
                <tr><td class="<%=doc.equals("doc16")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=comp_finals&d4=adic_init_doc16">Catalog_Sequence_Diagram_Remove_<br/>Groups.gif</a></td></tr>
                <tr><td class="<%=doc.equals("doc17")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=comp_finals&d4=adic_init_doc17">Catalog_Sequence_Diagram_Remove_<br/>Products.gif</a></td></tr>
                <tr><td class="<%=doc.equals("doc18")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=comp_finals&d4=adic_init_doc18">Catalog_Sequence_Diagram_Set_Active_<br/>Version.gif</a></td></tr>
                <tr><td class="<%=doc.equals("doc20")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=comp_finals&d4=adic_init_doc20">Catalog_Sequence_Diagram_Work_With_<br/>Additional_Attributes.gif</a></td></tr>
                <tr><td class="<%=doc.equals("doc21")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=comp_finals&d4=adic_init_doc21">Catalog_Use_Case_Diagram.gif</a></td></tr>
                <tr><td class="compDocsTabOff"><img src="/i/clear.gif" alt="" width="1" height="1" border="0"></td></tr>

                <tr><td class="compDocsSmall">Documentation</td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tccc04/comp_docs/adic/documentation/Catalog_Component_Specification.pdf" target="_blank">Catalog_Component_Specification.pdf</a></td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tccc04/comp_docs/adic/documentation/Catalog_Requirements_Specification.pdf" target="_blank">Catalog_Requirements_Specification.pdf</a></td></tr>
                <tr><td class="compDocsTabOff"><img src="/i/clear.gif" alt="" width="1" height="1" border="0"></td></tr>

    <% } else if (time.equals("final")) { %>
                <tr><td class="compDocsSmall">Design Diagrams</td></tr>
                <tr><td class="<%=doc.equals("doc1")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=comp_finals&d4=adic_final_doc1">Catalog_Class_Diagram_<br/>Discount_Implementations.gif</a></td></tr>
                <tr><td class="<%=doc.equals("doc2")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=comp_finals&d4=adic_final_doc2">Catalog_Class_Diagram_<br/>Main.gif</td></tr>
                <tr><td class="<%=doc.equals("doc3")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=comp_finals&d4=adic_final_doc3">Catalog_Class_Diagram_<br/>Rule.gif</a></td></tr>
                <tr><td class="<%=doc.equals("doc4")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=comp_finals&d4=adic_final_doc4">Catalog_Class_Diagram_<br/>Scope_Implementations.gif</a></td></tr>
                <tr><td class="<%=doc.equals("doc5")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=comp_finals&d4=adic_final_doc5">Catalog_Sequence_Diagram_<br/>Add_Groups.gif</a></td></tr>
                <tr><td class="<%=doc.equals("doc6")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=comp_finals&d4=adic_final_doc6">Catalog_Sequence_Diagram_<br/>Add_Products.gif</a></td></tr>
                <tr><td class="<%=doc.equals("doc7")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=comp_finals&d4=adic_final_doc7">Catalog_Sequence_Diagram_<br/>Add_Rules.gif</a></td></tr>
                <tr><td class="<%=doc.equals("doc8")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=comp_finals&d4=adic_final_doc8">Catalog_Sequence_Diagram_<br/>Calculate_Discounted_Price.gif</a></td></tr>
                <tr><td class="<%=doc.equals("doc9")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=comp_finals&d4=adic_final_doc9">Catalog_Sequence_Diagram_<br/>Create_Groups.gif</a></td></tr>
                <tr><td class="<%=doc.equals("doc10")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=comp_finals&d4=adic_final_doc10">Catalog_Sequence_Diagram_<br/>Create_Products.gif</a></td></tr>
                <tr><td class="<%=doc.equals("doc11")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=comp_finals&d4=adic_final_doc11">Catalog_Sequence_Diagram_<br/>Create_Rules.gif</a></td></tr>
                <tr><td class="<%=doc.equals("doc12")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=comp_finals&d4=adic_final_doc12">Catalog_Sequence_Diagram_<br/>Navigate_Groups.gif</a></td></tr>
                <tr><td class="<%=doc.equals("doc13")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=comp_finals&d4=adic_final_doc13">Catalog_Sequence_Diagram_<br/>Navigate_Products.gif</a></td></tr>
                <tr><td class="<%=doc.equals("doc14")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=comp_finals&d4=adic_final_doc14">Catalog_Sequence_Diagram_<br/>Navigate_Rules.gif</a></td></tr>
                <tr><td class="<%=doc.equals("doc15")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=comp_finals&d4=adic_final_doc15">Catalog_Sequence_Diagram_<br/>Remove_Disable_Rules.gif</a></td></tr>
                <tr><td class="<%=doc.equals("doc16")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=comp_finals&d4=adic_final_doc16">Catalog_Sequence_Diagram_<br/>Remove_Groups.gif</a></td></tr>
                <tr><td class="<%=doc.equals("doc17")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=comp_finals&d4=adic_final_doc17">Catalog_Sequence_Diagram_<br/>Remove_Products.gif</a></td></tr>
                <tr><td class="<%=doc.equals("doc18")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=comp_finals&d4=adic_final_doc18">Catalog_Sequence_Diagram_<br/>Set_Active_Version.gif</a></td></tr>
                <tr><td class="<%=doc.equals("doc20")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=comp_finals&d4=adic_final_doc20">Catalog_Sequence_Diagram_<br/>Work_With_Additional_Attributes.gif</a></td></tr>
                <tr><td class="<%=doc.equals("doc21")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=comp_finals&d4=adic_final_doc21">Catalog_Use_Case_Diagram.gif</a></td></tr>
                <tr><td class="compDocsTabOff"><img src="/i/clear.gif" alt="" width="1" height="1" border="0"></td></tr>

                <tr><td class="compDocsSmall">Documentation</td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tccc04/comp_docs/adic/documentation_final/Catalog_Component_Specification.pdf" target="_blank">Catalog_Component_Specification.pdf</a></td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tccc04/comp_docs/adic/documentation_final/Catalog_Requirements_Specification.pdf" target="_blank">Catalog_Requirements_Specification.pdf</a></td></tr>
                <tr><td class="compDocsTabOff"><img src="/i/clear.gif" alt="" width="1" height="1" border="0"></td></tr>
    <% } %>

                <tr><td class="compDocsTabOff"><img src="/i/clear.gif" alt="" width="1" height="1" border="0"></td></tr>

                <tr><td class="compDocsSmall">Initial Scorecards</td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tccc04/comp_docs/adic/scorecards/kyky_initial.htm" target="_blank"><strong>kyky</strong></a></td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tccc04/comp_docs/adic/scorecards/Ken_Vogel_initial.htm" target="_blank"><strong>Ken Vogel</strong></a></td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tccc04/comp_docs/adic/scorecards/ivern_initial.htm" target="_blank"><strong>ivern</strong></a></td></tr>

                <tr><td class="compDocsTabOff"><img src="/i/clear.gif" alt="" width="1" height="1" border="0"></td></tr>

                <tr><td class="compDocsSmall">Final Scorecards</td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tccc04/comp_docs/adic/scorecards/kyky_final.htm" target="_blank"><strong>kyky</strong></a></td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tccc04/comp_docs/adic/scorecards/Ken_Vogel_final.htm" target="_blank"><strong>Ken Vogel</strong></a></td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tccc04/comp_docs/adic/scorecards/ivern_final.htm" target="_blank"><strong>ivern</strong></a></td></tr>
           </table>
