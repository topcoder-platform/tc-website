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
                <tr><td class="<%=doc.equals("doc1")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tco03&d3=comp_docs&d4=aksonov_initial_doc1">Class Diagram 1.gif</td></tr>
                <tr><td class="<%=doc.equals("doc2")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tco03&d3=comp_docs&d4=aksonov_initial_doc2">Class Diagram 2.gif</a></td></tr>
                <tr><td class="<%=doc.equals("doc3")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tco03&d3=comp_docs&d4=aksonov_initial_doc3">Sequence Diagram 1.gif</a></td></tr>
                <tr><td class="<%=doc.equals("doc4")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tco03&d3=comp_docs&d4=aksonov_initial_doc4">Sequence Diagram 2.gif</a></td></tr>
                <tr><td class="<%=doc.equals("doc5")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tco03&d3=comp_docs&d4=aksonov_initial_doc5">Sequence Diagram 3.gif</a></td></tr>
                <tr><td class="<%=doc.equals("doc6")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tco03&d3=comp_docs&d4=aksonov_initial_doc6">Sequence Diagram 4.gif</a></td></tr>
                <tr><td class="<%=doc.equals("doc7")?"compDocsTabOn":"compDocsTabOff"%>"><a href="/tc?module=Static&d1=tournaments&d2=tco03&d3=comp_docs&d4=aksonov_initial_doc7">Use Case Diagram 1.gif</a></td></tr>
                <tr><td class="compDocsTabOff"><img src="/i/clear.gif" alt="" width="1" height="1" border="0"></td></tr>

                <tr><td class="compDocsSmall">Documentation</td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tco03/comp_docs/aksonov/Distributed_Cache_Requirements_Addendum.pdf" target="_blank">Distributed Cache Requirements Addendum.pdf</a></td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tco03/comp_docs/aksonov/Distributed_Simple_Cache_Component_Specification.pdf" target="_blank">Distributed Simple Cache Component Specification.pdf</a></td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tco03/comp_docs/aksonov/Distributed_Simple_Cache_Requirements_Specification.pdf" target="_blank">Distributed Simple Cache Requirements Specification.pdf</a></td></tr>

                <tr><td class="compDocsSmall">Source</td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tco03/comp_docs/aksonov/AccuracyTests.java" target="_blank">Accuracy Tests.java</a></td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tco03/comp_docs/aksonov/AllTests.java" target="_blank">All Tests.java</a></td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tco03/comp_docs/aksonov/CacheAccuracyTests.java" target="_blank">Cache Accuracy Tests.java</a></td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tco03/comp_docs/aksonov/DistributedSimpleCacheTestCase.java" target="_blank">Distributed Simple Cache Test Case.java</a></td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tco03/comp_docs/aksonov/ExceptionTests.java" target="_blank">Exception Tests.java</a></td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tco03/comp_docs/aksonov/FailureTests.java" target="_blank">Failure Tests.java</a></td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tco03/comp_docs/aksonov/FunctionalTests.java" target="_blank">Functional Tests.java</a></td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tco03/comp_docs/aksonov/StressTests.java" target="_blank">Stress Tests.java</a></td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tco03/comp_docs/aksonov/TestFailedMaintainer.java" target="_blank">Test Failed Maintainer.java</a></td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tco03/comp_docs/aksonov/TestManyMessages.java" target="_blank">Test Many Messages.java</a></td></tr>
                
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tco03/comp_docs/aksonov/initial/AckMessage.java" target="_blank">Ack Message.java</a></td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tco03/comp_docs/aksonov/initial/AckMessageTest.java" target="_blank">Ack Message Test.java</a></td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tco03/comp_docs/aksonov/initial/AgreementLayerImpl.java" target="_blank">Agreement Layer Impl.java</a></td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tco03/comp_docs/aksonov/initial/AgreementMessage.java" target="_blank">Agreement Message.java</a></td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tco03/comp_docs/aksonov/initial/AgreementMessageTest.java" target="_blank">Agreement Message Test.java</a></td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tco03/comp_docs/aksonov/initial/CacheMessage.java" target="_blank">Cache Message.java</a></td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tco03/comp_docs/aksonov/initial/CacheMessageTest.java" target="_blank">Cache Message Test.java</a></td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tco03/comp_docs/aksonov/initial/CommitMessage.java" target="_blank">Commit Message.java</a></td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tco03/comp_docs/aksonov/initial/CommitMessageTest.java" target="_blank">Commit Message Test.java</a></td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tco03/comp_docs/aksonov/initial/DistributedCache.xml" target="_blank">Distributed Cache.xml</a></td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tco03/comp_docs/aksonov/initial/DistributedCacheComplexTests.java" target="_blank">Distributed Cache Complex Tests.java</a></td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tco03/comp_docs/aksonov/initial/DistributedCacheSimpleTests.java" target="_blank">Distributed Cache Simple Tests.java</a></td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tco03/comp_docs/aksonov/initial/DistributedException.java" target="_blank">Distributed Exception.java</a></td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tco03/comp_docs/aksonov/initial/DistributedLayer.java" target="_blank">Distributed Layer.java</a></td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tco03/comp_docs/aksonov/initial/DistributedSimpleCache.java" target="_blank">Distributed Simple Cache.java</a></td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tco03/comp_docs/aksonov/initial/JoinResponseMessage.java" target="_blank">Join Response Message.java</a></td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tco03/comp_docs/aksonov/initial/JoinResponseMessageTest.java" target="_blank">Join Response Message Test.java</a></td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tco03/comp_docs/aksonov/initial/MaintainerMsgState.java" target="_blank">Maintainer Msg State.java</a></td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tco03/comp_docs/aksonov/initial/MaintainerMsgStateTest.java" target="_blank">Maintainer Msg State Test.java</a></td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tco03/comp_docs/aksonov/initial/Message.java" target="_blank">Message.java</a></td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tco03/comp_docs/aksonov/initial/MessageTest.java" target="_blank">Message Test.java</a></td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tco03/comp_docs/aksonov/initial/NetworkLayer.java" target="_blank">Network Layer.java</a></td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tco03/comp_docs/aksonov/initial/ProtocolLayer.java" target="_blank">Protocol Layer.java</a></td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tco03/comp_docs/aksonov/initial/Server.java" target="_blank">Server.java</a></td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tco03/comp_docs/aksonov/initial/ServerMessage.java" target="_blank">Server Message.java</a></td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tco03/comp_docs/aksonov/initial/ServerMessageTest.java" target="_blank">Server Message Test.java</a></td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tco03/comp_docs/aksonov/initial/ServerTest.java" target="_blank">Server Test.java</a></td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tco03/comp_docs/aksonov/initial/SocketAddress.java" target="_blank">Socket Address.java</a></td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tco03/comp_docs/aksonov/initial/SocketAddressTest.java" target="_blank">Socket Address Test.java</a></td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tco03/comp_docs/aksonov/initial/UnitTests.java.java" target="_blank">Unit Tests.java</a></td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tco03/comp_docs/aksonov/initial/VoteDownListEntry.java" target="_blank">Vote Down List Entry.java</a></td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tco03/comp_docs/aksonov/initial/VoteDownListEntryTest.java" target="_blank">Vote Down List Entry Test.java</a></td></tr>

    <% } else if (time.equals("830")) { %>
                <tr><td class="compDocsSmall">Design Diagrams</td></tr>

                <tr><td class="compDocsSmall">Documentation</td></tr>

                <tr><td class="compDocsSmall">Source</td></tr>

    <% } else if (time.equals("900")) { %>
                <tr><td class="compDocsSmall">Design Diagrams</td></tr>

                <tr><td class="compDocsSmall">Documentation</td></tr>

                <tr><td class="compDocsSmall">Source</td></tr>

    <% } else if (time.equals("930")) { %>
                <tr><td class="compDocsSmall">Design Diagrams</td></tr>

                <tr><td class="compDocsSmall">Documentation</td></tr>

                <tr><td class="compDocsSmall">Source</td></tr>

    <% } else if (time.equals("1000")) { %>
                <tr><td class="compDocsSmall">Design Diagrams</td></tr>

                <tr><td class="compDocsSmall">Documentation</td></tr>

                <tr><td class="compDocsSmall">Source</td></tr>

    <% } else if (time.equals("1030")) { %>
                <tr><td class="compDocsSmall">Design Diagrams</td></tr>

                <tr><td class="compDocsSmall">Documentation</td></tr>

                <tr><td class="compDocsSmall">Source</td></tr>

    <% } else if (time.equals("1100")) { %>
                <tr><td class="compDocsSmall">Design Diagrams</td></tr>

                <tr><td class="compDocsSmall">Documentation</td></tr>

                <tr><td class="compDocsSmall">Source</td></tr>

    <% } else if (time.equals("1130")) { %>
                <tr><td class="compDocsSmall">Design Diagrams</td></tr>

                <tr><td class="compDocsSmall">Documentation</td></tr>

                <tr><td class="compDocsSmall">Source</td></tr>

    <% } else if (time.equals("final")) { %>
                <tr><td class="compDocsSmall">Design Diagrams</td></tr>

                <tr><td class="compDocsSmall">Documentation</td></tr>

                <tr><td class="compDocsSmall">Source</td></tr>

    <% } %>

                <tr><td class="compDocsTabOff"><img src="/i/clear.gif" alt="" width="1" height="1" border="0"></td></tr>
                
                <tr><td class="compDocsSmall">Review Board Scorecards</td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tco03/comp_docs/aksonov/aksonov_aop_design_review_lkw.htm" target="_blank"><strong>lkw</strong></a></td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tco03/comp_docs/aksonov/aksonov_aop_design_review_bryanchen.htm" target="_blank"><strong>BryanChen</strong></a></td></tr>
                <tr><td class="compDocsTabOff"><a href="/i/tournament/tco03/comp_docs/aksonov/aksonov_aop_design_review_mishagam.htm" target="_blank"><strong>mishagam</strong></a></td></tr>
           </table>
