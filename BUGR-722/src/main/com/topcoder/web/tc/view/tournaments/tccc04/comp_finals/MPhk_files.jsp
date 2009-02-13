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
                <tr><td class="<%=doc.equals("doc1")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=comp_finals&d4=MPhk_init_doc1">Catalog_Class_Diagram_<br/>Data_Custom.gif</a></td></tr>
                <tr><td class="<%=doc.equals("doc2")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=comp_finals&d4=MPhk_init_doc2">Catalog_Class_Diagram_<br/>Data.gif</a></td></tr>
                <tr><td class="<%=doc.equals("doc3")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=comp_finals&d4=MPhk_init_doc3">Catalog_Class_Diagram_<br/>Exceptions.gif</a></td></tr>
                <tr><td class="<%=doc.equals("doc4")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=comp_finals&d4=MPhk_init_doc4">Catalog_Class_Diagram_<br/>Main.gif</a></td></tr>
                <tr><td class="<%=doc.equals("doc5")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=comp_finals&d4=MPhk_init_doc5">Catalog_Class_Diagram_<br/>Managers.gif</a></td></tr>
                <tr><td class="<%=doc.equals("doc6")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=comp_finals&d4=MPhk_init_doc6">Catalog_Sequence_Diagram_<br/>add_groups_to_group_manager.gif</a></td></tr>
                <tr><td class="<%=doc.equals("doc7")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=comp_finals&d4=MPhk_init_doc7">Catalog_Sequence_Diagram_<br/>add_products_to_groups_in_the_<br/>product_group_manager.gif</a></td></tr>
                <tr><td class="<%=doc.equals("doc8")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=comp_finals&d4=MPhk_init_doc8">Catalog_Sequence_Diagram_<br/>add_rules_in_the_rule_manager.gif</a></td></tr>
                <tr><td class="<%=doc.equals("doc9")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=comp_finals&d4=MPhk_init_doc9">Catalog_Sequence_Diagram_<br/>add_update_product_to_product_manager.gif</a></td></tr>
                <tr><td class="<%=doc.equals("doc10")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=comp_finals&d4=MPhk_init_doc10">Catalog_Sequence_Diagram_<br/>apply_rule.gif</a></td></tr>
                <tr><td class="<%=doc.equals("doc11")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=comp_finals&d4=MPhk_init_doc11">Catalog_Sequence_Diagram_<br/>catalog_and_managers.gif</a></td></tr>
                <tr><td class="<%=doc.equals("doc12")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=comp_finals&d4=MPhk_init_doc12">Catalog_Sequence_Diagram_<br/>create_group.gif</a></td></tr>
                <tr><td class="<%=doc.equals("doc13")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=comp_finals&d4=MPhk_init_doc13">Catalog_Sequence_Diagram_<br/>create_product.gif</a></td></tr>
                <tr><td class="<%=doc.equals("doc14")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=comp_finals&d4=MPhk_init_doc14">Catalog_Sequence_Diagram_<br/>create_promotion_rules.gif</a></td></tr>
                <tr><td class="<%=doc.equals("doc15")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=comp_finals&d4=MPhk_init_doc15">Catalog_Sequence_Diagram_<br/>get_group_information.gif</a></td></tr>
                <tr><td class="<%=doc.equals("doc16")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=comp_finals&d4=MPhk_init_doc16">Catalog_Sequence_Diagram_<br/>get_product_information.gif</a></td></tr>
                <tr><td class="<%=doc.equals("doc17")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=comp_finals&d4=MPhk_init_doc17">Catalog_Sequence_Diagram_<br/>get_rule_information.gif</a></td></tr>
                <tr><td class="<%=doc.equals("doc18")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=comp_finals&d4=MPhk_init_doc18">Catalog_Sequence_Diagram_<br/>remove_groups_from_product_manager.gif</a></td></tr>
                <tr><td class="<%=doc.equals("doc19")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=comp_finals&d4=MPhk_init_doc19">Catalog_Sequence_Diagram_<br/>remove_prduct_from_group_information_in_<br/>the_product_group_manager.gif</a></td></tr>
                <tr><td class="<%=doc.equals("doc20")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=comp_finals&d4=MPhk_init_doc20">Catalog_Sequence_Diagram_<br/>remove_product_from_manager.gif</a></td></tr>
                <tr><td class="<%=doc.equals("doc21")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=comp_finals&d4=MPhk_init_doc21">Catalog_Sequence_Diagram_<br/>remove_rules_from_rule_manager.gif</a></td></tr>
                <tr><td class="<%=doc.equals("doc22")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=comp_finals&d4=MPhk_init_doc22">Catalog_Sequence_Diagram_<br/>restore_product_version.gif</a></td></tr>
                <tr><td class="<%=doc.equals("doc23")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=comp_finals&d4=MPhk_init_doc23">Catalog_Use_Case_Diagram_<br/>catalog_and_managers.gif</a></td></tr>
                <tr><td class="<%=doc.equals("doc24")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=comp_finals&d4=MPhk_init_doc24">Catalog_Use_Case_Diagram_<br/>managing_porduct_groups_and_products.gif</a></td></tr>
                <tr><td class="<%=doc.equals("doc25")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=comp_finals&d4=MPhk_init_doc25">Catalog_Use_Case_Diagram_<br/>managing_pricing_promotion_rules.gif</a></td></tr>
                <tr><td class="<%=doc.equals("doc26")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=comp_finals&d4=MPhk_init_doc26">Catalog_Use_Case_Diagram_<br/>managing_product_versions.gif</a></td></tr>
                <tr><td class="<%=doc.equals("doc27")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=comp_finals&d4=MPhk_init_doc27">Catalog_Use_Case_Diagram_<br/>managing_products.gif</a></td></tr>
                <tr><td class="compDocsTabOff"><img src="/i/clear.gif" alt="" width="1" height="1" border="0"></td></tr>

                <tr><td class="compDocsSmall">Documentation</td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tccc04/comp_docs/MPhk/documentation/Catalog_Component_Specification.pdf" target="_blank">Catalog_Component_Specification.pdf</a></td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tccc04/comp_docs/MPhk/documentation/Catalog_Requirements_Specification.pdf" target="_blank">Catalog_Requirements_Specification.pdf</a></td></tr>
                <tr><td class="compDocsTabOff"><img src="/i/clear.gif" alt="" width="1" height="1" border="0"></td></tr>

    <% } else if (time.equals("final")) { %>
                <tr><td class="compDocsSmall">Design Diagrams</td></tr>
                <tr><td class="<%=doc.equals("doc1")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=comp_finals&d4=MPhk_final_doc1">Catalog_Class_Diagram_<br/>Addendum.gif</a></td></tr>
                <tr><td class="<%=doc.equals("doc2")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=comp_finals&d4=MPhk_final_doc2">Catalog_Class_Diagram_<br/>Data_Custom.gif</a></td></tr>
                <tr><td class="<%=doc.equals("doc3")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=comp_finals&d4=MPhk_final_doc3">Catalog_Class_Diagram_<br/>Data.gif</a></td></tr>
                <tr><td class="<%=doc.equals("doc4")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=comp_finals&d4=MPhk_final_doc4">Catalog_Class_Diagram_<br/>Exceptions.gif</a></td></tr>
                <tr><td class="<%=doc.equals("doc5")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=comp_finals&d4=MPhk_final_doc5">Catalog_Class_Diagram_<br/>Main.gif</a></td></tr>
                <tr><td class="<%=doc.equals("doc6")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=comp_finals&d4=MPhk_final_doc6">Catalog_Class_Diagram_<br/>Managers.gif</a></td></tr>
                <tr><td class="<%=doc.equals("doc7")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=comp_finals&d4=MPhk_final_doc7">Catalog_Sequence_Diagram_<br/>add_groups_to_group_manager.gif</a></td></tr>
                <tr><td class="<%=doc.equals("doc8")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=comp_finals&d4=MPhk_final_doc8">Catalog_Sequence_Diagram_<br/>add_products_to_groups_in_the_<br/>product_group_manager.gif</a></td></tr>
                <tr><td class="<%=doc.equals("doc9")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=comp_finals&d4=MPhk_final_doc9">Catalog_Sequence_Diagram_<br/>add_rules_in_the_rule_manager.gif</a></td></tr>
                <tr><td class="<%=doc.equals("doc10")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=comp_finals&d4=MPhk_final_doc10">Catalog_Sequence_Diagram_<br/>add_update_product_to_product_<br/>manager.gif</a></td></tr>
                <tr><td class="<%=doc.equals("doc11")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=comp_finals&d4=MPhk_final_doc11">Catalog_Sequence_Diagram_<br/>apply_rule.gif</a></td></tr>
                <tr><td class="<%=doc.equals("doc12")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=comp_finals&d4=MPhk_final_doc12">Catalog_Sequence_Diagram_<br/>catalog_and_managers.gif</a></td></tr>
                <tr><td class="<%=doc.equals("doc13")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=comp_finals&d4=MPhk_final_doc13">Catalog_Sequence_Diagram_<br/>create_group.gif</a></td></tr>
                <tr><td class="<%=doc.equals("doc14")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=comp_finals&d4=MPhk_final_doc14">Catalog_Sequence_Diagram_<br/>create_product.gif</a></td></tr>
                <tr><td class="<%=doc.equals("doc15")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=comp_finals&d4=MPhk_final_doc15">Catalog_Sequence_Diagram_<br/>create_promotion_rules.gif</a></td></tr>
                <tr><td class="<%=doc.equals("doc16")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=comp_finals&d4=MPhk_final_doc16">Catalog_Sequence_Diagram_<br/>get_group_infromation.gif</a></td></tr>
                <tr><td class="<%=doc.equals("doc17")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=comp_finals&d4=MPhk_final_doc17">Catalog_Sequence_Diagram_<br/>get_product_information.gif</a></td></tr>
                <tr><td class="<%=doc.equals("doc18")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=comp_finals&d4=MPhk_final_doc18">Catalog_Sequence_Diagram_<br/>get_rule_information.gif</a></td></tr>
                <tr><td class="<%=doc.equals("doc19")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=comp_finals&d4=MPhk_final_doc19">Catalog_Sequence_Diagram_<br/>remove_groups_from_product_manager.gif</a></td></tr>
                <tr><td class="<%=doc.equals("doc20")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=comp_finals&d4=MPhk_final_doc20">Catalog_Sequence_Diagram_<br/>remove_prduct_from_group_information_in_<br/>the_product_group_manager.gif</a></td></tr>
                <tr><td class="<%=doc.equals("doc21")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=comp_finals&d4=MPhk_final_doc21">Catalog_Sequence_Diagram_<br/>remove_product_from_manager.gif</a></td></tr>
                <tr><td class="<%=doc.equals("doc22")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=comp_finals&d4=MPhk_final_doc22">Catalog_Sequence_Diagram_<br/>remove_rules_from_rule_manager.gif</a></td></tr>
                <tr><td class="<%=doc.equals("doc23")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=comp_finals&d4=MPhk_final_doc23">Catalog_Sequence_Diagram_<br/>restore_product_version.gif</a></td></tr>
                <tr><td class="<%=doc.equals("doc24")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=comp_finals&d4=MPhk_final_doc24">Catalog_Use_Case_Diagram_<br/>catalog_and_managers.gif</a></td></tr>
                <tr><td class="<%=doc.equals("doc25")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=comp_finals&d4=MPhk_final_doc25">Catalog_Use_Case_Diagram_<br/>managing_porduct_groups_and_products.gif</a></td></tr>
                <tr><td class="<%=doc.equals("doc26")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=comp_finals&d4=MPhk_final_doc26">Catalog_Use_Case_Diagram_<br/>managing_pricing_promotion_rules.gif</a></td></tr>
                <tr><td class="<%=doc.equals("doc27")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=comp_finals&d4=MPhk_final_doc27">Catalog_Use_Case_Diagram_<br/>managing_product_versions.gif</a></td></tr>
                <tr><td class="<%=doc.equals("doc28")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=comp_finals&d4=MPhk_final_doc28">Catalog_Use_Case_Diagram_<br/>managing_products.gif</a></td></tr>
                <tr><td class="compDocsTabOff"><img src="/i/clear.gif" alt="" width="1" height="1" border="0"></td></tr>

                <tr><td class="compDocsSmall">Documentation</td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tccc04/comp_docs/MPhk/documentation_final/Catalog_Component_Specification.pdf" target="_blank">Catalog_Component_Specification.pdf</a></td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tccc04/comp_docs/MPhk/documentation_final/Catalog_Requirements_Specification.pdf" target="_blank">Catalog_Requirements_Specification.pdf</a></td></tr>
                <tr><td class="compDocsTabOff"><img src="/i/clear.gif" alt="" width="1" height="1" border="0"></td></tr>

    <% } %>

                <tr><td class="compDocsTabOff"><img src="/i/clear.gif" alt="" width="1" height="1" border="0"></td></tr>

                <tr><td class="compDocsSmall">Initial Scorecards</td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tccc04/comp_docs/MPhk/scorecards/kyky_initial.htm" target="_blank"><strong>kyky</strong></a></td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tccc04/comp_docs/MPhk/scorecards/Ken_Vogel_initial.htm" target="_blank"><strong>Ken Vogel</strong></a></td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tccc04/comp_docs/MPhk/scorecards/ivern_initial.htm" target="_blank"><strong>ivern</strong></a></td></tr>

                <tr><td class="compDocsTabOff"><img src="/i/clear.gif" alt="" width="1" height="1" border="0"></td></tr>
                <tr><td class="compDocsSmall">Final Scorecards</td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tccc04/comp_docs/MPhk/scorecards/kyky_final.htm" target="_blank"><strong>kyky</strong></a></td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tccc04/comp_docs/MPhk/scorecards/Ken_Vogel_final.htm" target="_blank"><strong>Ken Vogel</strong></a></td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tccc04/comp_docs/MPhk/scorecards/ivern_final.htm" target="_blank"><strong>ivern</strong></a></td></tr>
           </table>
