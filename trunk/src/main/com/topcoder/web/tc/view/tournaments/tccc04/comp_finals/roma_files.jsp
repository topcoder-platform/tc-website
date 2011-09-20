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
                <tr><td class="<%=doc.equals("doc1")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=comp_finals&d4=roma_init_doc1">Document_Generator_Class_<br/>Diagram_APIInput.gif</a></td></tr>
                <tr><td class="<%=doc.equals("doc2")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=comp_finals&d4=roma_init_doc2">Document_Generator_Class_<br/>Diagram_Main.gif</a></td></tr>
                <tr><td class="<%=doc.equals("doc3")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=comp_finals&d4=roma_init_doc3">Document_Generator_Class_<br/>Diagram_TemplateSources.gif</a></td></tr>
                <tr><td class="<%=doc.equals("doc4")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=comp_finals&d4=roma_init_doc4">Document_Generator_Class_<br/>Diagram_XsltTransformations.gif</a></td></tr>
                <tr><td class="<%=doc.equals("doc5")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=comp_finals&d4=roma_init_doc5">Document_Generator_Sequence_<br/>Diagram_ApplyTemplate.gif</a></td></tr>
                <tr><td class="<%=doc.equals("doc6")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=comp_finals&d4=roma_init_doc6">Document_Generator_Sequence_<br/>Diagram_GetInstance.gif</a></td></tr>
                <tr><td class="<%=doc.equals("doc7")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=comp_finals&d4=roma_init_doc7">Document_Generator_Sequence_<br/>Diagram_GetTemplate.gif</a></td></tr>
                <tr><td class="<%=doc.equals("doc8")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=comp_finals&d4=roma_init_doc8">Document_Generator_Sequence_<br/>Diagram_InvokeFromCommandLine.gif</a></td></tr>
                <tr><td class="<%=doc.equals("doc9")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=comp_finals&d4=roma_init_doc9">Document_Generator_Sequence_<br/>Diagram_UseAPIInput.gif</a></td></tr>
                <tr><td class="<%=doc.equals("doc10")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=comp_finals&d4=roma_init_doc10">Document_Generator_Use_Case_<br/>Diagram.gif</a></td></tr>
                <tr><td class="<%=doc.equals("doc11")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=comp_finals&d4=roma_init_doc11">Document_Generator_User_Case_<br/>Diagram_Batch.gif</a></td></tr>
                <tr><td class="compDocsTabOff"><img src="/i/clear.gif" alt="" width="1" height="1" border="0"></td></tr>

                <tr><td class="compDocsSmall">Documentation</td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tccc04/comp_docs/roma/documentation/Document_Generator_Component_Specification.pdf" target="_blank">Document_Generator_Component_<br/>Specification.pdf</a></td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tccc04/comp_docs/roma/documentation/Document_Generator_Requirements_Specification.pdf" target="_blank">Document_Generator_Requirements_<br/>Specification.pdf</a></td></tr>
                <tr><td class="compDocsTabOff"><img src="/i/clear.gif" alt="" width="1" height="1" border="0"></td></tr>

                <tr><td class="compDocsSmall">Source</td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tccc04/comp_docs/roma/source/Constants.java" target="_blank">Constants.java</a></td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tccc04/comp_docs/roma/source/DatabaseTemplateSource.java" target="_blank">DatabaseTemplateSource.java</a></td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tccc04/comp_docs/roma/source/DocumentGenerator.java" target="_blank">DocumentGenerator.java</a></td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tccc04/comp_docs/roma/source/Field.java" target="_blank">Field.java</a></td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tccc04/comp_docs/roma/source/FileTemplateSource.java" target="_blank">FileTemplateSource.java</a></td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tccc04/comp_docs/roma/source/InvalidConfigException.java" target="_blank">InvalidConfigException.java</a></td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tccc04/comp_docs/roma/source/Loop.java" target="_blank">Loop.java</a></td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tccc04/comp_docs/roma/source/MyFileTemplateSource.java" target="_blank">MyFileTemplateSource.java</a></td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tccc04/comp_docs/roma/source/MyTemplateData.java" target="_blank">MyTemplateData.java</a></td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tccc04/comp_docs/roma/source/Node.java" target="_blank">Node.java</a></td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tccc04/comp_docs/roma/source/NodeList.java" target="_blank">NodeList.java</a></td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tccc04/comp_docs/roma/source/Template.java" target="_blank">Template.java</a></td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tccc04/comp_docs/roma/source/TemplateData.java" target="_blank">TemplateData.java</a></td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tccc04/comp_docs/roma/source/TemplateDataFormatException.java" target="_blank">TemplateDataFormatException.java</a></td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tccc04/comp_docs/roma/source/TemplateFields.java" target="_blank">TemplateFields.java</a></td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tccc04/comp_docs/roma/source/TemplateFormatException.java" target="_blank">TemplateFormatException.java</a></td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tccc04/comp_docs/roma/source/TemplateSource.java" target="_blank">TemplateSource.java</a></td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tccc04/comp_docs/roma/source/TemplateSourceException.java" target="_blank">TemplateSourceException.java</a></td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tccc04/comp_docs/roma/source/TestDocumentGenerator.java" target="_blank">TestDocumentGenerator.java</a></td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tccc04/comp_docs/roma/source/TestField.java" target="_blank">TestField.java</a></td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tccc04/comp_docs/roma/source/TestFileTemplateSource.java" target="_blank">TestFileTemplateSource.java</a></td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tccc04/comp_docs/roma/source/TestInvalidConfigException.java" target="_blank">TestInvalidConfigException.java</a></td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tccc04/comp_docs/roma/source/TestLoop.java" target="_blank">TestLoop.java</a></td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tccc04/comp_docs/roma/source/TestNodeList.java" target="_blank">TestNodeList.java</a></td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tccc04/comp_docs/roma/source/TestTemplateDataFormatException.java" target="_blank">TestTemplateDataFormatException.java</a></td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tccc04/comp_docs/roma/source/TestTemplateFields.java" target="_blank">TestTemplateFields.java</a></td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tccc04/comp_docs/roma/source/TestTemplateFormatException.java" target="_blank">TestTemplateFormatException.java</a></td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tccc04/comp_docs/roma/source/TestTemplateSourceException.java" target="_blank">TestTemplateSourceException.java</a></td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tccc04/comp_docs/roma/source/TestXmlTemplateData.java" target="_blank">TestXmlTemplateData.java</a></td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tccc04/comp_docs/roma/source/TestXsltTemplate.java" target="_blank">TestXsltTemplate.java</a></td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tccc04/comp_docs/roma/source/UnitTests.java" target="_blank">UnitTests.java</a></td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tccc04/comp_docs/roma/source/XmlTemplateData.java" target="_blank">XmlTemplateData.java</a></td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tccc04/comp_docs/roma/source/XsltTemplate.java" target="_blank">XsltTemplate.java</a></td></tr>
                <tr><td class="compDocsTabOff"><img src="/i/clear.gif" alt="" width="1" height="1" border="0"></td></tr>


    <% } else if (time.equals("final")) { %>
                <tr><td class="compDocsSmall">Development Diagrams</td></tr>
                <tr><td class="<%=doc.equals("doc1")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=comp_finals&d4=roma_final_doc1">Document_Generator_Class_<br/>Diagram_APIInput.gif</a></td></tr>
                <tr><td class="<%=doc.equals("doc2")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=comp_finals&d4=roma_final_doc2">Document_Generator_Class_<br/>Diagram_Main.gif</a></td></tr>
                <tr><td class="<%=doc.equals("doc3")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=comp_finals&d4=roma_final_doc3">Document_Generator_Class_<br/>Diagram_TemplateSources.gif</a></td></tr>
                <tr><td class="<%=doc.equals("doc4")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=comp_finals&d4=roma_final_doc4">Document_Generator_Class_<br/>Diagram_XsltTransformations.gif</a></td></tr>
                <tr><td class="<%=doc.equals("doc5")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=comp_finals&d4=roma_final_doc5">Document_Generator_Sequence_<br/>Diagram_ApplyTemplate.gif</a></td></tr>
                <tr><td class="<%=doc.equals("doc6")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=comp_finals&d4=roma_final_doc6">Document_Generator_Sequence_<br/>Diagram_GetInstance.gif</a></td></tr>
                <tr><td class="<%=doc.equals("doc7")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=comp_finals&d4=roma_final_doc7">Document_Generator_Sequence_<br/>Diagram_GetTemplate.gif</a></td></tr>
                <tr><td class="<%=doc.equals("doc8")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=comp_finals&d4=roma_final_doc8">Document_Generator_Sequence_<br/>Diagram_InvokeFromCommandLine.gif</a></td></tr>
                <tr><td class="<%=doc.equals("doc9")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=comp_finals&d4=roma_final_doc9">Document_Generator_Sequence_<br/>Diagram_UseAPIInput.gif</a></td></tr>
                <tr><td class="<%=doc.equals("doc10")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=comp_finals&d4=roma_final_doc10">Document_Generator_Use_Case_<br/>Diagram.gif</a></td></tr>
                <tr><td class="<%=doc.equals("doc11")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=comp_finals&d4=roma_final_doc11">Document_Generator_User_Case_<br/>Diagram_Batch.gif</a></td></tr>
                <tr><td class="compDocsTabOff"><img src="/i/clear.gif" alt="" width="1" height="1" border="0"></td></tr>

                <tr><td class="compDocsSmall">Documentation</td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tccc04/comp_docs/roma/documentation/Document_Generator_Component_Specification.pdf" target="_blank">Document_Generator_Component_<br/>Specification.pdf</a></td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tccc04/comp_docs/roma/documentation/Document_Generator_Requirements_Specification.pdf" target="_blank">Document_Generator_Requirements_<br/>Specification.pdf</a></td></tr>
                <tr><td class="compDocsTabOff"><img src="/i/clear.gif" alt="" width="1" height="1" border="0"></td></tr>

                <tr><td class="compDocsSmall">Source</td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tccc04/comp_docs/roma/source_final/BatchDocument.java" target="_blank">BatchDocument.java</a></td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tccc04/comp_docs/roma/source_final/BatchFileProcessor.java" target="_blank">BatchFileProcessor.java</a></td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tccc04/comp_docs/roma/source_final/Constants.java" target="_blank">Constants.java</a></td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tccc04/comp_docs/roma/source_final/DatabaseTemplateSource.java" target="_blank">DatabaseTemplateSource.java</a></td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tccc04/comp_docs/roma/source_final/DocumentGenerator.java" target="_blank">DocumentGenerator.java</a></td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tccc04/comp_docs/roma/source_final/Field.java" target="_blank">Field.java</a></td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tccc04/comp_docs/roma/source_final/FileTemplateSource.java" target="_blank">FileTemplateSource.java</a></td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tccc04/comp_docs/roma/source_final/InvalidConfigException.java" target="_blank">InvalidConfigException.java</a></td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tccc04/comp_docs/roma/source_final/Loop.java" target="_blank">Loop.java</a></td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tccc04/comp_docs/roma/source_final/MyFileTemplateSource.java" target="_blank">MyFileTemplateSource.java</a></td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tccc04/comp_docs/roma/source_final/MyTemplateData.java" target="_blank">MyTemplateData.java</a></td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tccc04/comp_docs/roma/source_final/Node.java" target="_blank">Node.java</a></td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tccc04/comp_docs/roma/source_final/NodeList.java" target="_blank">NodeList.java</a></td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tccc04/comp_docs/roma/source_final/Template.java" target="_blank">Template.java</a></td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tccc04/comp_docs/roma/source_final/TemplateData.java" target="_blank">TemplateData.java</a></td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tccc04/comp_docs/roma/source_final/TemplateDataFormatException.java" target="_blank">TemplateDataFormatException.java</a></td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tccc04/comp_docs/roma/source_final/TemplateFields.java" target="_blank">TemplateFields.java</a></td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tccc04/comp_docs/roma/source_final/TemplateFormatException.java" target="_blank">TemplateFormatException.java</a></td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tccc04/comp_docs/roma/source_final/TemplateSource.java" target="_blank">TemplateSource.java</a></td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tccc04/comp_docs/roma/source_final/TemplateSourceException.java" target="_blank">TemplateSourceException.java</a></td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tccc04/comp_docs/roma/source_final/TestBatchDocument.java" target="_blank">TestBatchDocument.java</a></td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tccc04/comp_docs/roma/source_final/TestBatchFileProcessor.java" target="_blank">TestBatchFileProcessor.java</a></td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tccc04/comp_docs/roma/source_final/TestDocumentGenerator.java" target="_blank">TestDocumentGenerator.java</a></td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tccc04/comp_docs/roma/source_final/TestField.java" target="_blank">TestField.java</a></td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tccc04/comp_docs/roma/source_final/TestFileTemplateSource.java" target="_blank">TestFileTemplateSource.java</a></td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tccc04/comp_docs/roma/source_final/TestInvalidConfigException.java" target="_blank">TestInvalidConfigException.java</a></td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tccc04/comp_docs/roma/source_final/TestLoop.java" target="_blank">TestLoop.java</a></td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tccc04/comp_docs/roma/source_final/TestNodeList.java" target="_blank">TestNodeList.java</a></td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tccc04/comp_docs/roma/source_final/TestTemplateDataFormatException.java" target="_blank">TestTemplateDataFormatException.java</a></td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tccc04/comp_docs/roma/source_final/TestTemplateFields.java" target="_blank">TestTemplateFields.java</a></td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tccc04/comp_docs/roma/source_final/TestTemplateFormatException.java" target="_blank">TestTemplateFormatException.java</a></td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tccc04/comp_docs/roma/source_final/TestTemplateSourceException.java" target="_blank">TestTemplateSourceException.java</a></td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tccc04/comp_docs/roma/source_final/TestXmlTemplateData.java" target="_blank">TestXmlTemplateData.java</a></td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tccc04/comp_docs/roma/source_final/TestXsltTemplate.java" target="_blank">TestXsltTemplate.java</a></td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tccc04/comp_docs/roma/source_final/UnitTests.java" target="_blank">UnitTests.java</a></td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tccc04/comp_docs/roma/source_final/XmlTemplateData.java" target="_blank">XmlTemplateData.java</a></td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tccc04/comp_docs/roma/source_final/XsltTemplate.java" target="_blank">XsltTemplate.java</a></td></tr>
                <tr><td class="compDocsTabOff"><img src="/i/clear.gif" alt="" width="1" height="1" border="0"></td></tr>


    <% } %>

                <tr><td class="compDocsTabOff"><img src="/i/clear.gif" alt="" width="1" height="1" border="0"></td></tr>

                <tr><td class="compDocsSmall">Initial Scorecards</td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tccc04/comp_docs/roma/scorecards/AdamSelene_initial.htm" target="_blank"><strong>AdamSelene</strong></a></td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tccc04/comp_docs/roma/scorecards/mishagam_initial.htm" target="_blank"><strong>mishagam</strong></a></td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tccc04/comp_docs/roma/scorecards/pzhao_initial.htm" target="_blank"><strong>pzhao</strong></a></td></tr>

                <tr><td class="compDocsTabOff"><img src="/i/clear.gif" alt="" width="1" height="1" border="0"></td></tr>
                <tr><td class="compDocsSmall">Final Scorecards</td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tccc04/comp_docs/roma/scorecards/AdamSelene_final.htm" target="_blank"><strong>AdamSelene</strong></a></td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tccc04/comp_docs/roma/scorecards/mishagam_final.htm" target="_blank"><strong>mishagam</strong></a></td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tccc04/comp_docs/roma/scorecards/pzhao_final.htm" target="_blank"><strong>pzhao</strong></a></td></tr>
           </table>
