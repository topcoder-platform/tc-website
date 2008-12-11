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
                <tr><td class="<%=doc.equals("doc1")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=comp_finals&d4=aksonov_init_doc1">Catalog_Class_Diagram_<br/>Extension_Product_Group_Versioning.gif</a></td></tr>
                <tr><td class="<%=doc.equals("doc2")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=comp_finals&d4=aksonov_init_doc2">Catalog_Class_Diagram_<br/>Product_Conditions_Pricing_Rules.gif</a></td></tr>
                <tr><td class="<%=doc.equals("doc3")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=comp_finals&d4=aksonov_init_doc3">Catalog_Class_Diagram_<br/>Product_Group_Associative_Pricing_Rules.gif</a></td></tr>
                <tr><td class="<%=doc.equals("doc4")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=comp_finals&d4=aksonov_init_doc4">Catalog_Sequence_Diagram_<br/>Addproductgrouptoparentgroup.gif</a></td></tr>
                <tr><td class="<%=doc.equals("doc5")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=comp_finals&d4=aksonov_init_doc5">Catalog_Sequence_Diagram_<br/>Calculatefinalpriceforaproduct.gif</a></td></tr>
                <tr><td class="<%=doc.equals("doc6")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=comp_finals&d4=aksonov_init_doc6">Catalog_Sequence_Diagram_<br/>CreateassosiativePricingRules.gif</a></td></tr>
                <tr><td class="<%=doc.equals("doc7")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=comp_finals&d4=aksonov_init_doc7">Catalog_Sequence_Diagram_<br/>Createconditionsforpricingrules.gif</a></td></tr>
                <tr><td class="<%=doc.equals("doc8")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=comp_finals&d4=aksonov_init_doc8">Catalog_Sequence_Diagram_<br/>Createseveralversionsforaproduct.gif</a></td></tr>
                <tr><td class="<%=doc.equals("doc9")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=comp_finals&d4=aksonov_init_doc9">Catalog_Sequence_Diagram_<br/>Getchildproductsgroupslistchildcount.gif</a></td></tr>
                <tr><td class="<%=doc.equals("doc10")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=comp_finals&d4=aksonov_init_doc10">Catalog_Sequence_Diagram_<br/>Getparentgroupsset.gif</a></td></tr>
                <tr><td class="<%=doc.equals("doc11")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=comp_finals&d4=aksonov_init_doc11">Catalog_Sequence_Diagram_<br/>Removeproductgroupfromparentgroup.gif</a></td></tr>
                <tr><td class="<%=doc.equals("doc12")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=comp_finals&d4=aksonov_init_doc12">Catalog_Sequence_Diagram_<br/>Setgetbaseproductattributes.gif</a></td></tr>
                <tr><td class="<%=doc.equals("doc13")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=comp_finals&d4=aksonov_init_doc13">Catalog_Sequence_Diagram_<br/>Setgetcustomproductorgroupattributes.gif</a></td></tr>
                <tr><td class="<%=doc.equals("doc14")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=comp_finals&d4=aksonov_init_doc14">Catalog_Use_Case_Diagram_<br/>Create_Conditions_For_Pricing_Rules.gif</a></td></tr>
                <tr><td class="<%=doc.equals("doc15")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=comp_finals&d4=aksonov_init_doc15">Catalog_Use_Case_Diagram_<br/>Managing_Products_and_Groups.gif</a></td></tr>
                <tr><td class="<%=doc.equals("doc16")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=comp_finals&d4=aksonov_init_doc16">Catalog_Use_Case_Diagram_<br/>Overview.gif</a></td></tr>
                <tr><td class="compDocsTabOff"><img src="/i/clear.gif" alt="" width="1" height="1" border="0"></td></tr>

                <tr><td class="compDocsSmall">Documentation</td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tccc04/comp_docs/aksonov/documentation/Catalog_Component_Specification.pdf" target="_blank">Catalog_Component_Specification.pdf</a></td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tccc04/comp_docs/aksonov/documentation/Catalog_Requirements_Specification.pdf" target="_blank">Catalog_Requirements_Specification.pdf</a></td></tr>
                <tr><td class="compDocsTabOff"><img src="/i/clear.gif" alt="" width="1" height="1" border="0"></td></tr>

    <% } else if (time.equals("final")) { %>
                <tr><td class="compDocsSmall">Design Diagrams</td></tr>
                <tr><td class="<%=doc.equals("doc1")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=comp_finals&d4=aksonov_final_doc1">Catalog_Class_Diagram_<br/>Extension_Product_Group_Versioning.gif</a></td></tr>
                <tr><td class="<%=doc.equals("doc2")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=comp_finals&d4=aksonov_final_doc2">Catalog_Class_Diagram_<br/>Main.gif</a></td></tr>
                <tr><td class="<%=doc.equals("doc3")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=comp_finals&d4=aksonov_final_doc3">Catalog_Class_Diagram_<br/>Product_Conditions_Pricing_Rules.gif</a></td></tr>
                <tr><td class="<%=doc.equals("doc4")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=comp_finals&d4=aksonov_final_doc4">Catalog_Class_Diagram_<br/>Product_Group_Associative_Pricing_Rules.gif</a></td></tr>
                <tr><td class="<%=doc.equals("doc5")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=comp_finals&d4=aksonov_final_doc5">Catalog_Sequence_Diagram_<br/>Addproductgrouptoparentgroup.gif</a></td></tr>
                <tr><td class="<%=doc.equals("doc6")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=comp_finals&d4=aksonov_final_doc6">Catalog_Sequence_Diagram_<br/>Calculatefinalpriceforaproduct.gif</a></td></tr>
                <tr><td class="<%=doc.equals("doc7")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=comp_finals&d4=aksonov_final_doc7">Catalog_Sequence_Diagram_<br/>CreateassosiativePricingRules.gif</a></td></tr>
                <tr><td class="<%=doc.equals("doc8")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=comp_finals&d4=aksonov_final_doc8">Catalog_Sequence_Diagram_<br/>Createconditionsforpricingrules.gif</a></td></tr>
                <tr><td class="<%=doc.equals("doc9")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=comp_finals&d4=aksonov_final_doc9">Catalog_Sequence_Diagram_<br/>Createseveralversionsforaproduct.gif</a></td></tr>
                <tr><td class="<%=doc.equals("doc10")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=comp_finals&d4=aksonov_final_doc10">Catalog_Sequence_Diagram_<br/>Getchildproductsgroupslistchildcount.gif</a></td></tr>
                <tr><td class="<%=doc.equals("doc11")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=comp_finals&d4=aksonov_final_doc11">Catalog_Sequence_Diagram_<br/>Getparentgroupsset.gif</a></td></tr>
                <tr><td class="<%=doc.equals("doc12")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=comp_finals&d4=aksonov_final_doc12">Catalog_Sequence_Diagram_<br/>Removeproductgroupfromparentgroup.gif</a></td></tr>
                <tr><td class="<%=doc.equals("doc13")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=comp_finals&d4=aksonov_final_doc13">Catalog_Sequence_Diagram_<br/>Setgetbaseproductattributes.gif</a></td></tr>
                <tr><td class="<%=doc.equals("doc14")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=comp_finals&d4=aksonov_final_doc14">Catalog_Sequence_Diagram_<br/>Setgetcustomproductorgroupattributes.gif</a></td></tr>
                <tr><td class="<%=doc.equals("doc15")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=comp_finals&d4=aksonov_final_doc15">Catalog_Use_Case_Diagram_<br/>Create_Conditions_For_Pricing_Rules.gif</a></td></tr>
                <tr><td class="<%=doc.equals("doc16")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=comp_finals&d4=aksonov_final_doc16">Catalog_Use_Case_Diagram_<br/>Managing_Products_and_Groups.gif</a></td></tr>
                <tr><td class="<%=doc.equals("doc17")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=comp_finals&d4=aksonov_final_doc17">Catalog_Use_Case_Diagram_<br/>Overview.gif</a></td></tr>
                <tr><td class="compDocsTabOff"><img src="/i/clear.gif" alt="" width="1" height="1" border="0"></td></tr>

                <tr><td class="compDocsSmall">Documentation</td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tccc04/comp_docs/aksonov/documentation_final/Catalog_Component_Specification.pdf" target="_blank">Catalog_Component_Specification.pdf</a></td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tccc04/comp_docs/aksonov/documentation_final/Catalog_Requirements_Specification.pdf" target="_blank">Catalog_Requirements_Specification.pdf</a></td></tr>
                <tr><td class="compDocsTabOff"><img src="/i/clear.gif" alt="" width="1" height="1" border="0"></td></tr>

    <% } %>

                <tr><td class="compDocsTabOff"><img src="/i/clear.gif" alt="" width="1" height="1" border="0"></td></tr>

                <tr><td class="compDocsSmall">Initial Scorecards</td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tccc04/comp_docs/aksonov/scorecards/kyky_initial.htm" target="_blank"><strong>kyky</strong></a></td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tccc04/comp_docs/aksonov/scorecards/Ken_Vogel_initial.htm" target="_blank"><strong>Ken Vogel</strong></a></td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tccc04/comp_docs/aksonov/scorecards/ivern_initial.htm" target="_blank"><strong>ivern</strong></a></td></tr>

                <tr><td class="compDocsTabOff"><img src="/i/clear.gif" alt="" width="1" height="1" border="0"></td></tr>
                <tr><td class="compDocsSmall">Final Scorecards</td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tccc04/comp_docs/aksonov/scorecards/kyky_final.htm" target="_blank"><strong>kyky</strong></a></td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tccc04/comp_docs/aksonov/scorecards/Ken_Vogel_final.htm" target="_blank"><strong>Ken Vogel</strong></a></td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tccc04/comp_docs/aksonov/scorecards/ivern_final.htm" target="_blank"><strong>ivern</strong></a></td></tr>

           </table>
