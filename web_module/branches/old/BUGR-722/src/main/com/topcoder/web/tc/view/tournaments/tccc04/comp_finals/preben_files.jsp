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
                <tr><td class="<%=doc.equals("doc1")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=comp_finals&d4=preben_init_doc1">Document_Generator_Class_<br/>Diagram_APIInput.gif</a></td></tr>
                <tr><td class="<%=doc.equals("doc2")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=comp_finals&d4=preben_init_doc2">Document_Generator_Class_<br/>Diagram_Main.gif</a></td></tr>
                <tr><td class="<%=doc.equals("doc3")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=comp_finals&d4=preben_init_doc3">Document_Generator_Class_<br/>Diagram_TemplateSources.gif</a></td></tr>
                <tr><td class="<%=doc.equals("doc4")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=comp_finals&d4=preben_init_doc4">Document_Generator_Class_<br/>Diagram_XsltTransformations.gif</a></td></tr>
                <tr><td class="<%=doc.equals("doc5")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=comp_finals&d4=preben_init_doc5">Document_Generator_Sequence_<br/>Diagram_ApplyTemplate.gif</a></td></tr>
                <tr><td class="<%=doc.equals("doc6")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=comp_finals&d4=preben_init_doc6">Document_Generator_Sequence_<br/>Diagram_GetInstance.gif</a></td></tr>
                <tr><td class="<%=doc.equals("doc7")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=comp_finals&d4=preben_init_doc7">Document_Generator_Sequence_<br/>Diagram_GetTemplate.gif</a></td></tr>
                <tr><td class="<%=doc.equals("doc8")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=comp_finals&d4=preben_init_doc8">Document_Generator_Sequence_<br/>Diagram_InvokeFromCommandLine.gif</a></td></tr>
                <tr><td class="<%=doc.equals("doc9")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=comp_finals&d4=preben_init_doc9">Document_Generator_Sequence_<br/>Diagram_UseAPIInput.gif</a></td></tr>
                <tr><td class="<%=doc.equals("doc10")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=comp_finals&d4=preben_init_doc10">Document_Generator_Use_Case_<br/>Diagram.gif</a></td></tr>
                <tr><td class="<%=doc.equals("doc11")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=comp_finals&d4=preben_init_doc11">Document_Generator_User_Case_<br/>Diagram_Batch.gif</a></td></tr>
                <tr><td class="compDocsTabOff"><img src="/i/clear.gif" alt="" width="1" height="1" border="0"></td></tr>

                <tr><td class="compDocsSmall">Documentation</td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tccc04/comp_docs/preben/documentation/Document_Generator_Component_Specification.pdf" target="_blank">Document_Generator_Component_<br/>Specification.pdf</a></td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tccc04/comp_docs/preben/documentation/Document_Generator_Requirements_Specification.pdf" target="_blank">Document_Generator_Requirements_<br/>Specification.pdf</a></td></tr>
                <tr><td class="compDocsTabOff"><img src="/i/clear.gif" alt="" width="1" height="1" border="0"></td></tr>

                <tr><td class="compDocsSmall">Source</td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tccc04/comp_docs/preben/source/DatabaseTemplateSource.java" target="_blank">DatabaseTemplateSource.java</a></td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tccc04/comp_docs/preben/source/DocumentGenerator.java" target="_blank">DocumentGenerator.java</a></td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tccc04/comp_docs/preben/source/DocumentGeneratorTestCase.java" target="_blank">DocumentGeneratorTestCase.java</a></td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tccc04/comp_docs/preben/source/ExceptionClassesTestCase.java" target="_blank">ExceptionClassesTestCase.java</a></td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tccc04/comp_docs/preben/source/Field.java" target="_blank">Field.java</a></td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tccc04/comp_docs/preben/source/FieldTestCase.java" target="_blank">FieldTestCase.java</a></td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tccc04/comp_docs/preben/source/FileTemplateSource.java" target="_blank">FileTemplateSource.java</a></td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tccc04/comp_docs/preben/source/FileTemplateSourceTestCase.java" target="_blank">FileTemplateSourceTestCase.java</a></td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tccc04/comp_docs/preben/source/InvalidConfigException.java" target="_blank">InvalidConfigException.java</a></td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tccc04/comp_docs/preben/source/Loop.java" target="_blank">Loop.java</a></td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tccc04/comp_docs/preben/source/LoopTestCase.java" target="_blank">LoopTestCase.java</a></td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tccc04/comp_docs/preben/source/Node.java" target="_blank">Node.java</a></td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tccc04/comp_docs/preben/source/NodeList.java" target="_blank">NodeList.java</a></td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tccc04/comp_docs/preben/source/NodeListTestCase.java" target="_blank">NodeListTestCase.java</a></td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tccc04/comp_docs/preben/source/Template.java" target="_blank">Template.java</a></td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tccc04/comp_docs/preben/source/TemplateData.java" target="_blank">TemplateData.java</a></td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tccc04/comp_docs/preben/source/TemplateDataFormatException.java" target="_blank">TemplateDataFormatException.java</a></td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tccc04/comp_docs/preben/source/TemplateFields.java" target="_blank">TemplateFields.java</a></td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tccc04/comp_docs/preben/source/TemplateFieldsTestCase.java" target="_blank">TemplateFieldsTestCase.java</a></td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tccc04/comp_docs/preben/source/TemplateFormatException.java" target="_blank">TemplateFormatException.java</a></td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tccc04/comp_docs/preben/source/TemplateSource.java" target="_blank">TemplateSource.java</a></td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tccc04/comp_docs/preben/source/TemplateSourceException.java" target="_blank">TemplateSourceException.java</a></td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tccc04/comp_docs/preben/source/UnitTests.java" target="_blank">UnitTests.java</a></td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tccc04/comp_docs/preben/source/XmlTemplateData.java" target="_blank">XmlTemplateData.java</a></td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tccc04/comp_docs/preben/source/XmlTemplateDataTestCase.java" target="_blank">XmlTemplateDataTestCase.java</a></td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tccc04/comp_docs/preben/source/XsltTemplate.java" target="_blank">XsltTemplate.java</a></td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tccc04/comp_docs/preben/source/XsltTemplateTestCase.java" target="_blank">XsltTemplateTestCase.java</a></td></tr>
                <tr><td class="compDocsTabOff"><img src="/i/clear.gif" alt="" width="1" height="1" border="0"></td></tr>

    <% } else if (time.equals("final")) { %>
                <tr><td class="compDocsSmall">Development Diagrams</td></tr>
                <tr><td class="<%=doc.equals("doc1")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=comp_finals&d4=preben_final_doc1">Document_Generator_Class_<br/>Diagram_APIInput.gif</a></td></tr>
                <tr><td class="<%=doc.equals("doc2")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=comp_finals&d4=preben_final_doc2">Document_Generator_Class_<br/>Diagram_Main.gif</a></td></tr>
                <tr><td class="<%=doc.equals("doc3")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=comp_finals&d4=preben_final_doc3">Document_Generator_Class_<br/>Diagram_TemplateSources.gif</a></td></tr>
                <tr><td class="<%=doc.equals("doc4")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=comp_finals&d4=preben_final_doc4">Document_Generator_Class_<br/>Diagram_XsltTransformations.gif</a></td></tr>
                <tr><td class="<%=doc.equals("doc5")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=comp_finals&d4=preben_final_doc5">Document_Generator_Sequence_<br/>Diagram_ApplyTemplate.gif</a></td></tr>
                <tr><td class="<%=doc.equals("doc6")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=comp_finals&d4=preben_final_doc6">Document_Generator_Sequence_<br/>Diagram_GetInstance.gif</a></td></tr>
                <tr><td class="<%=doc.equals("doc7")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=comp_finals&d4=preben_final_doc7">Document_Generator_Sequence_<br/>Diagram_GetTemplate.gif</a></td></tr>
                <tr><td class="<%=doc.equals("doc8")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=comp_finals&d4=preben_final_doc8">Document_Generator_Sequence_<br/>Diagram_InvokeFromCommandLine.gif</a></td></tr>
                <tr><td class="<%=doc.equals("doc9")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=comp_finals&d4=preben_final_doc9">Document_Generator_Sequence_<br/>Diagram_UseAPIInput.gif</a></td></tr>
                <tr><td class="<%=doc.equals("doc10")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=comp_finals&d4=preben_final_doc10">Document_Generator_Use_Case_<br/>Diagram.gif</a></td></tr>
                <tr><td class="<%=doc.equals("doc11")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=comp_finals&d4=preben_final_doc11">Document_Generator_User_Case_<br/>Diagram_Batch.gif</a></td></tr>
                <tr><td class="compDocsTabOff"><img src="/i/clear.gif" alt="" width="1" height="1" border="0"></td></tr>

                <tr><td class="compDocsSmall">Documentation</td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tccc04/comp_docs/preben/documentation/Document_Generator_Component_Specification.pdf" target="_blank">Document_Generator_Component_<br/>Specification.pdf</a></td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tccc04/comp_docs/preben/documentation/Document_Generator_Requirements_Specification.pdf" target="_blank">Document_Generator_Requirements_<br/>Specification.pdf</a></td></tr>
                <tr><td class="compDocsTabOff"><img src="/i/clear.gif" alt="" width="1" height="1" border="0"></td></tr>

                <tr><td class="compDocsSmall">Source</td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tccc04/comp_docs/preben/source_final/BatchDocument.java" target="_blank">BatchDocument.java</a></td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tccc04/comp_docs/preben/source_final/BatchDocumentTestCase.java" target="_blank">BatchDocumentTestCase.java</a></td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tccc04/comp_docs/preben/source_final/BatchFileProcessor.java" target="_blank">BatchFileProcessor.java</a></td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tccc04/comp_docs/preben/source_final/DatabaseTemplateSource.java" target="_blank">DatabaseTemplateSource.java</a></td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tccc04/comp_docs/preben/source_final/DocumentGenerator.java" target="_blank">DocumentGenerator.java</a></td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tccc04/comp_docs/preben/source_final/DocumentGeneratorTestCase.java" target="_blank">DocumentGeneratorTestCase.java</a></td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tccc04/comp_docs/preben/source_final/ExceptionClassesTestCase.java" target="_blank">ExceptionClassesTestCase.java</a></td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tccc04/comp_docs/preben/source_final/Field.java" target="_blank">Field.java</a></td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tccc04/comp_docs/preben/source_final/FieldTestCase.java" target="_blank">FieldTestCase.java</a></td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tccc04/comp_docs/preben/source_final/FileTemplateSource.java" target="_blank">FileTemplateSource.java</a></td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tccc04/comp_docs/preben/source_final/FileTemplateSourceTestCase.java" target="_blank">FileTemplateSourceTestCase.java</a></td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tccc04/comp_docs/preben/source_final/InvalidConfigException.java" target="_blank">InvalidConfigException.java</a></td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tccc04/comp_docs/preben/source_final/Loop.java" target="_blank">Loop.java</a></td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tccc04/comp_docs/preben/source_final/LoopTestCase.java" target="_blank">LoopTestCase.java</a></td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tccc04/comp_docs/preben/source_final/Node.java" target="_blank">Node.java</a></td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tccc04/comp_docs/preben/source_final/NodeList.java" target="_blank">NodeList.java</a></td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tccc04/comp_docs/preben/source_final/NodeListTestCase.java" target="_blank">NodeListTestCase.java</a></td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tccc04/comp_docs/preben/source_final/Template.java" target="_blank">Template.java</a></td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tccc04/comp_docs/preben/source_final/TemplateData.java" target="_blank">TemplateData.java</a></td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tccc04/comp_docs/preben/source_final/TemplateDataFormatException.java" target="_blank">TemplateDataFormatException.java</a></td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tccc04/comp_docs/preben/source_final/TemplateFields.java" target="_blank">TemplateFields.java</a></td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tccc04/comp_docs/preben/source_final/TemplateFieldsTestCase.java" target="_blank">TemplateFieldsTestCase.java</a></td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tccc04/comp_docs/preben/source_final/TemplateFormatException.java" target="_blank">TemplateFormatException.java</a></td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tccc04/comp_docs/preben/source_final/TemplateSource.java" target="_blank">TemplateSource.java</a></td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tccc04/comp_docs/preben/source_final/TemplateSourceException.java" target="_blank">TemplateSourceException.java</a></td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tccc04/comp_docs/preben/source_final/UnitTests.java" target="_blank">UnitTests.java</a></td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tccc04/comp_docs/preben/source_final/XmlTemplateData.java" target="_blank">XmlTemplateData.java</a></td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tccc04/comp_docs/preben/source_final/XmlTemplateDataTestCase.java" target="_blank">XmlTemplateDataTestCase.java</a></td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tccc04/comp_docs/preben/source_final/XsltTemplate.java" target="_blank">XsltTemplate.java</a></td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tccc04/comp_docs/preben/source_final/XsltTemplateTestCase.java" target="_blank">XsltTemplateTestCase.java</a></td></tr>
                <tr><td class="compDocsTabOff"><img src="/i/clear.gif" alt="" width="1" height="1" border="0"></td></tr>
    <% } %>

                <tr><td class="compDocsTabOff"><img src="/i/clear.gif" alt="" width="1" height="1" border="0"></td></tr>

                <tr><td class="compDocsSmall">Initial Scorecards</td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tccc04/comp_docs/preben/scorecards/AdamSelene_initial.htm" target="_blank"><strong>AdamSelene</strong></a></td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tccc04/comp_docs/preben/scorecards/mishagam_initial.htm" target="_blank"><strong>mishagam</strong></a></td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tccc04/comp_docs/preben/scorecards/pzhao_initial.htm" target="_blank"><strong>pzhao</strong></a></td></tr>

                <tr><td class="compDocsTabOff"><img src="/i/clear.gif" alt="" width="1" height="1" border="0"></td></tr>
                <tr><td class="compDocsSmall">Final Scorecards</td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tccc04/comp_docs/preben/scorecards/AdamSelene_final.htm" target="_blank"><strong>AdamSelene</strong></a></td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tccc04/comp_docs/preben/scorecards/mishagam_final.htm" target="_blank"><strong>mishagam</strong></a></td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tccc04/comp_docs/preben/scorecards/pzhao_final.htm" target="_blank"><strong>pzhao</strong></a></td></tr>
           </table>
