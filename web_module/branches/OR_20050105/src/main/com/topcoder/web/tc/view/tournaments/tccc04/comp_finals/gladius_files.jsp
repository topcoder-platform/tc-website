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
                <tr><td class="compDocsSmall">Development Diagrams</td></tr>
                <tr><td class="<%=doc.equals("doc1")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=comp_finals&d4=gladius_init_doc1">Document_Generator_Class_Diagram_<br/>APIInputClassDiagram.gif</a></td></tr>
                <tr><td class="<%=doc.equals("doc2")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=comp_finals&d4=gladius_init_doc2">Document_Generator_Class_Diagram_<br/>MainClassDiagram.gif</a></td></tr>
                <tr><td class="<%=doc.equals("doc3")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=comp_finals&d4=gladius_init_doc3">Document_Generator_Class_Diagram_<br/>TemplateSourcesClassDiagram.gif</a></td></tr>
                <tr><td class="<%=doc.equals("doc4")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=comp_finals&d4=gladius_init_doc4">Document_Generator_Class_Diagram_<br/>XsltTransformationsClassDiagram.gif</a></td></tr>
                <tr><td class="<%=doc.equals("doc5")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=comp_finals&d4=gladius_init_doc5">Document_Generator_Sequence_Diagram_<br/>ApplyTemplate.gif</a></td></tr>
                <tr><td class="<%=doc.equals("doc6")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=comp_finals&d4=gladius_init_doc6">Document_Generator_Sequence_Diagram_<br/>GetInstance.gif</a></td></tr>
                <tr><td class="<%=doc.equals("doc7")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=comp_finals&d4=gladius_init_doc7">Document_Generator_Sequence_Diagram_<br/>GetTemplate.gif</a></td></tr>
                <tr><td class="<%=doc.equals("doc8")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=comp_finals&d4=gladius_init_doc8">Document_Generator_Sequence_Diagram_<br/>InvokeFromCommandLine.gif</a></td></tr>
                <tr><td class="<%=doc.equals("doc9")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=comp_finals&d4=gladius_init_doc9">Document_Generator_Sequence_Diagram_<br/>UseAPIInput.gif</a></td></tr>
                <tr><td class="<%=doc.equals("doc10")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=comp_finals&d4=gladius_init_doc10">Document_Generator_Use_Case_Diagram_<br/>Batch.gif</a></td></tr>
                <tr><td class="<%=doc.equals("doc11")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=comp_finals&d4=gladius_init_doc11">Document_Generator_Use_Case_Diagram.gif</a></td></tr>
                <tr><td class="compDocsTabOff"><img src="/i/clear.gif" alt="" width="1" height="1" border="0"></td></tr>

                <tr><td class="compDocsSmall">Documentation</td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tccc04/comp_docs/gladius/documentation/Document_Generator_Component_Specification.pdf" target="_blank">Document_Generator_Component_Specification.pdf</a></td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tccc04/comp_docs/gladius/documentation/Document_Generator_Requirements_Specification.pdf" target="_blank">Document_Generator_Requirements_Specification.pdf</a></td></tr>
                <tr><td class="compDocsTabOff"><img src="/i/clear.gif" alt="" width="1" height="1" border="0"></td></tr>

                <tr><td class="compDocsSmall">Source</td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tccc04/comp_docs/gladius/source/DocumentGenerator.cs" target="_blank">DocumentGenerator.cs</a></td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tccc04/comp_docs/gladius/source/Field.cs" target="_blank">Field.cs.cs</a></td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tccc04/comp_docs/gladius/source/FileTemplateSource.cs" target="_blank">FileTemplateSource.cs</a></td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tccc04/comp_docs/gladius/source/INode.cs" target="_blank">INode.cs</a></td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tccc04/comp_docs/gladius/source/InvalidConfigException.cs" target="_blank">InvalidConfigException.cs</a></td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tccc04/comp_docs/gladius/source/ITemplate.cs" target="_blank">ITemplate.cs</a></td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tccc04/comp_docs/gladius/source/ITemplateData.cs" target="_blank">ITemplateData.cs.cs</a></td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tccc04/comp_docs/gladius/source/ITemplateSource.cs" target="_blank">ITemplateSource.cs</a></td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tccc04/comp_docs/gladius/source/Loop.cs" target="_blank">Loop.cs</a></td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tccc04/comp_docs/gladius/source/NodeList.cs" target="_blank">NodeList.cs</a></td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tccc04/comp_docs/gladius/source/TemplateDataFormatException.cs" target="_blank">TemplateDataFormatException.cs</a></td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tccc04/comp_docs/gladius/source/TemplateFields.cs" target="_blank">TemplateFields.cs</a></td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tccc04/comp_docs/gladius/source/TemplateFormatException.cs" target="_blank">TemplateFormatException.cs</a></td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tccc04/comp_docs/gladius/source/TemplateSourceException.cs" target="_blank">TemplateSourceException.cs</a></td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tccc04/comp_docs/gladius/source/UnitTestField.cs" target="_blank">UnitTestField.cs</a></td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tccc04/comp_docs/gladius/source/UnitTestLoop.cs" target="_blank">UnitTestLoop.cs</a></td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tccc04/comp_docs/gladius/source/XmlTemplateData.cs" target="_blank">XmlTemplateData.cs</a></td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tccc04/comp_docs/gladius/source/XsltTemplate.cs" target="_blank">XsltTemplate.cs</a></td></tr>
                <tr><td class="compDocsTabOff"><img src="/i/clear.gif" alt="" width="1" height="1" border="0"></td></tr>

    <% } else if (time.equals("final")) { %>
                <tr><td class="compDocsSmall">Development Diagrams</td></tr>
                <tr><td class="<%=doc.equals("doc1")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=comp_finals&d4=gladius_final_doc1">Document_Generator_Class_Diagram_<br/>APIInputClassDiagram.gif</a></td></tr>
                <tr><td class="<%=doc.equals("doc2")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=comp_finals&d4=gladius_final_doc2">Document_Generator_Class_Diagram_<br/>MainClassDiagram.gif</a></td></tr>
                <tr><td class="<%=doc.equals("doc3")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=comp_finals&d4=gladius_final_doc3">Document_Generator_Class_Diagram_<br/>TemplateSourcesClassDiagram.gif</a></td></tr>
                <tr><td class="<%=doc.equals("doc4")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=comp_finals&d4=gladius_final_doc4">Document_Generator_Class_Diagram_<br/>XsltTransformationsClassDiagram.gif</a></td></tr>
                <tr><td class="<%=doc.equals("doc5")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=comp_finals&d4=gladius_final_doc5">Document_Generator_Sequence_Diagram_<br/>ApplyTemplate.gif</a></td></tr>
                <tr><td class="<%=doc.equals("doc6")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=comp_finals&d4=gladius_final_doc6">Document_Generator_Sequence_Diagram_<br/>GetInstance.gif</a></td></tr>
                <tr><td class="<%=doc.equals("doc7")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=comp_finals&d4=gladius_final_doc7">Document_Generator_Sequence_Diagram_<br/>GetTemplate.gif</a></td></tr>
                <tr><td class="<%=doc.equals("doc8")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=comp_finals&d4=gladius_final_doc8">Document_Generator_Sequence_Diagram_<br/>InvokeFromCommandLine.gif</a></td></tr>
                <tr><td class="<%=doc.equals("doc9")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=comp_finals&d4=gladius_final_doc9">Document_Generator_Sequence_Diagram_<br/>UseAPIInput.gif</a></td></tr>
                <tr><td class="<%=doc.equals("doc10")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=comp_finals&d4=gladius_final_doc10">Document_Generator_Use_Case_Diagram_<br/>Batch.gif</a></td></tr>
                <tr><td class="<%=doc.equals("doc11")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=comp_finals&d4=gladius_final_doc11">Document_Generator_Use_Case_Diagram.gif</a></td></tr>
                <tr><td class="compDocsTabOff"><img src="/i/clear.gif" alt="" width="1" height="1" border="0"></td></tr>

                <tr><td class="compDocsSmall">Documentation</td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tccc04/comp_docs/gladius/documentation/Document_Generator_Component_Specification.pdf" target="_blank">Document_Generator_Component_Specification.pdf</a></td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tccc04/comp_docs/gladius/documentation/Document_Generator_Requirements_Specification.pdf" target="_blank">Document_Generator_Requirements_Specification.pdf</a></td></tr>
                <tr><td class="compDocsTabOff"><img src="/i/clear.gif" alt="" width="1" height="1" border="0"></td></tr>

                <tr><td class="compDocsSmall">Source</td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tccc04/comp_docs/gladius/source_final/BigTemplateStressTests.cs" target="_blank">BigTemplateStressTests.cs</a></td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tccc04/comp_docs/gladius/source_final/DocumentGenerator.cs" target="_blank">DocumentGenerator.cs</a></td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tccc04/comp_docs/gladius/source_final/DocumentGeneratorAccuracyTests.cs" target="_blank">DocumentGeneratorAccuracyTests.cs</a></td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tccc04/comp_docs/gladius/source_final/DocumentGeneratorTest.cs" target="_blank">DocumentGeneratorTest.cs</a></td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tccc04/comp_docs/gladius/source_final/Field.cs" target="_blank">Field.cs</a></td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tccc04/comp_docs/gladius/source_final/FieldAccuracyTests.cs" target="_blank">FieldAccuracyTests.cs</a></td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tccc04/comp_docs/gladius/source_final/FieldTest.cs" target="_blank">FieldTest.cs</a></td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tccc04/comp_docs/gladius/source_final/FileTemplateSource.cs" target="_blank">FileTemplateSource.cs</a></td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tccc04/comp_docs/gladius/source_final/FileTemplateSourceAccuracyTests.cs" target="_blank">FileTemplateSourceAccuracyTests.cs</a></td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tccc04/comp_docs/gladius/source_final/FileTemplateSourceTest.cs" target="_blank">FileTemplateSourceTest.cs</a></td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tccc04/comp_docs/gladius/source_final/INode.cs" target="_blank">INode.cs</a></td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tccc04/comp_docs/gladius/source_final/InvalidConfigException.cs" target="_blank">InvalidConfigException.cs</a></td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tccc04/comp_docs/gladius/source_final/ITemplate.cs" target="_blank">ITemplate.cs</a></td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tccc04/comp_docs/gladius/source_final/ITemplateData.cs" target="_blank">ITemplateData.cs</a></td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tccc04/comp_docs/gladius/source_final/ITemplateSource.cs" target="_blank">ITemplateSource.cs</a></td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tccc04/comp_docs/gladius/source_final/Loop.cs" target="_blank">Loop.cs</a></td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tccc04/comp_docs/gladius/source_final/LoopAccuracyTests.cs" target="_blank">LoopAccuracyTests.cs</a></td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tccc04/comp_docs/gladius/source_final/LoopTest.cs" target="_blank">LoopTest.cs</a></td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tccc04/comp_docs/gladius/source_final/MultithreadedStressTests.cs" target="_blank">MultithreadedStressTests.cs</a></td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tccc04/comp_docs/gladius/source_final/NodeList.cs" target="_blank">NodeList.cs</a></td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tccc04/comp_docs/gladius/source_final/NodeListAccuracyTests.cs" target="_blank">NodeListAccuracyTests.cs</a></td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tccc04/comp_docs/gladius/source_final/NodeListTest.cs" target="_blank">NodeListTest.cs</a></td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tccc04/comp_docs/gladius/source_final/TemplateDataFormatException.cs" target="_blank">TemplateDataFormatException.cs</a></td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tccc04/comp_docs/gladius/source_final/TemplateFields.cs" target="_blank">TemplateFields.cs</a></td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tccc04/comp_docs/gladius/source_final/TemplateFieldsAccuracyTests.cs" target="_blank">TemplateFieldsAccuracyTests.cs</a></td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tccc04/comp_docs/gladius/source_final/TemplateFieldsTest.cs" target="_blank">TemplateFieldsTest.cs</a></td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tccc04/comp_docs/gladius/source_final/TemplateFormatException.cs" target="_blank">TemplateFormatException.cs</a></td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tccc04/comp_docs/gladius/source_final/TemplateSourceException.cs" target="_blank">TemplateSourceException.cs</a></td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tccc04/comp_docs/gladius/source_final/TemplateStressTests.cs" target="_blank">TemplateStressTests.cs</a></td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tccc04/comp_docs/gladius/source_final/UnitTestField.cs" target="_blank">UnitTestField.cs</a></td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tccc04/comp_docs/gladius/source_final/UnitTestLoop.cs" target="_blank">UnitTestLoop.cs</a></td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tccc04/comp_docs/gladius/source_final/XmlTemplateData.cs" target="_blank">XmlTemplateData.cs</a></td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tccc04/comp_docs/gladius/source_final/XmlTemplateDataAccuracyTests.cs" target="_blank">XmlTemplateDataAccuracyTests.cs</a></td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tccc04/comp_docs/gladius/source_final/XmlTemplateDataTest.cs" target="_blank">XmlTemplateDataTest.cs</a></td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tccc04/comp_docs/gladius/source_final/XsltTemplate.cs" target="_blank">XsltTemplate.cs</a></td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tccc04/comp_docs/gladius/source_final/XsltTemplateAccuracyTests.cs" target="_blank">XsltTemplateAccuracyTests.cs</a></td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tccc04/comp_docs/gladius/source_final/XsltTemplateTest.cs" target="_blank">XsltTemplateTest.cs</a></td></tr>
                <tr><td class="compDocsTabOff"><img src="/i/clear.gif" alt="" width="1" height="1" border="0"></td></tr>

    <% } %>

                <tr><td class="compDocsTabOff"><img src="/i/clear.gif" alt="" width="1" height="1" border="0"></td></tr>

                <tr><td class="compDocsSmall">Initial Scorecards</td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tccc04/comp_docs/gladius/scorecards/AdamSelene_initial.htm" target="_blank"><strong>AdamSelene</strong></a></td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tccc04/comp_docs/gladius/scorecards/mishagam_initial.htm" target="_blank"><strong>mishagam</strong></a></td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tccc04/comp_docs/gladius/scorecards/pzhao_initial.htm" target="_blank"><strong>pzhao</strong></a></td></tr>

                <tr><td class="compDocsTabOff"><img src="/i/clear.gif" alt="" width="1" height="1" border="0"></td></tr>

                <tr><td class="compDocsSmall">Final Scorecards</td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tccc04/comp_docs/gladius/scorecards/AdamSelene_final.htm" target="_blank"><strong>AdamSelene</strong></a></td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tccc04/comp_docs/gladius/scorecards/mishagam_final.htm" target="_blank"><strong>mishagam</strong></a></td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tccc04/comp_docs/gladius/scorecards/pzhao_final.htm" target="_blank"><strong>pzhao</strong></a></td></tr>
           </table>
