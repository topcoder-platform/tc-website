<%@  page language="java"  %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Press Room</title>

    <jsp:include page="/script.jsp" />
    <jsp:include page="/style.jsp">
      <jsp:param name="key" value="tc_main"/>
    </jsp:include>
</head>

<body>

<jsp:include page="../top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">
<%-- Left Column Begins--%>
        <td width="180">
            <jsp:include page="../includes/global_left.jsp">
                <jsp:param name="node" value="press_room"/>
            </jsp:include>
        </td>
<%-- Left Column Ends --%>

<%-- Center Column Begins --%>
         <td width="100%" align="center">


            <table border="0" cellspacing="0" cellpadding="10" width="100%">
                <tr valign="top">
                    <td class="prText" width="100%"><img src="/i/clear.gif" alt="" width="400" height="1" border="0"/><br />
                    <jsp:include page="../page_title.jsp" >
                        <jsp:param name="image" value="press_room"/>
                        <jsp:param name="title" value="Press Release"/>
                    </jsp:include>
                    
<div align="right"><tc-webtag:forumLink forumID="519895" message="Discuss this press release" /></div>
                        
<div align="center">
<p><span class="bodyTitle">TopCoder UML Design Tool Free to Developers</span><br />
<span class="bodySubTitle"><em>Community Built and Tested Unified Modeling Language Tool Provides Custom Flexibility &amp;<br />Interoperability for Global Community of Programmers</em></span></p>
</div>
      
<p>
<strong>GLASTONBURY, CONN., February 26, 2008 &#151;</strong>TopCoder&#174;, Inc., the leader in online programming competition, skills assessment and competitive software development, today introduced a pure Unified Modeling Language (UML) tool, providing a free alternative for virtual and professional development communities. Created from the UML standard using TopCoder's component-based methodology, TopCoder's UML tool was designed, built and tested by its global community of developers offering a better solution for the core functionality developers typically need in a UML tool, - without unnecessary feature sets-resulting in increased speed, reliability and extensibility as well as the capability to interface with third-party UML-based tools. The source code for the TopCoder UML tool is open for anyone to extend or enhance for their own purposes. To download TopCoder's free UML tool or to view source code and detailed development documentation (including specifications, architecture and components), visit: <a href="/wiki/display/tc/TopCoder+UML+Tool">http://www.topcoder.com/wiki/display/tc/TopCoder+UML+Tool</a>
</p>

<p>
"Software development is increasingly done in a virtual environment today, and requires an open collaboration platform for all participants to use and build upon. The industry needed an extensible UML tool, backed by the continued support of an enterprise name like TopCoder," said Dave Messinger, chief architect, TopCoder. "UML was designed as an open language and specification for anyone to read and work with, regardless of the design task, so we saw an opportunity to provide a free alternative to the commonly available options which are often expensive or lacking in flexibility for many developers and their projects."
</p>

<p>
TopCoder also announced recently that its catalog of member-built proprietary Java&trade; and Microsoft&reg; .NET Framework compatible components has surpassed the 1,000 component milestone, growing to more than 1,100 total units with functionality across major categories including AJAX, persistence, UML and infrastructure (see <a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_021808">http://www.topcoder.com/tc?module=Static&d1=pressroom&d2=pr_021808</a>). TopCoder's community of highly-skilled developers and others can now build additional components using TopCoder's UML Tool-yielding substantially shorter development timelines, better quality and decreased costs.
</p>

<p>
TopCoder community members use the TopCoder UML tool to participate in software design and development competitions. With an active online community engaging in the TopCoder competitions and virtual development, the transparent and collaborative nature of TopCoder's business required a powerful and reliable UML tool.  Rather than asking its member base to absorb the cost of a UML design tool required for competition or development, TopCoder chose to engage its members to build a better solution and to make that solution available for general use by the community at large. TopCoder also wanted to provide its UML tool to others without charge to further encourage the trend of component-based software design and development. By making the design, documentation and source code available, TopCoder allows developers inside and outside the TopCoder community to improve the UML tool for themselves or to contribute their ideas about how to do so to TopCoder.
</p>

<p>
TopCoder's new UML tool was created from the core Unified Modeling Language specification, without any vendor-specific UML or features. The open and available design allows anyone to add custom functionality or to tie in with other systems for maximum flexibility based upon industry standards for object modeling. With the new UML tool, TopCoder and developers can now easily write converters to work with whatever UML tool their customers, partners or community members are working with - for seamless integration without the overhead of licensing multiple UML tools for a distributed member base.
</p>

<p>
<span class="bodySubtitle">About TopCoder, Inc.</span><br />
TopCoder is the world's largest competitive software development community with over 140,000 developers representing more than 200 countries.  TopCoder hosts the largest and most comprehensive developer ratings and performance metrics available.   The TopCoder community builds software for a wide-ranging client base through a competitive, rigorous, standards based methodology.   This methodology results in a highly consistent set of software components allowing a software-as-parts approach to application development.  TopCoder makes this large library of software components built through competition available to all of our clients.  Utilizing a world-wide member base and this library, TopCoder seeks to lower the cost of software development while increasing both the speed at which applications can be developed and the quality of the ultimate application. For more information about utilizing TopCoder's software services or sponsoring TopCoder events, visit <a href="/">http://www.topcoder.com/</a>.
</p>
<p>
TopCoder is a registered trademark of TopCoder, Inc. in the United States and other countries. All other product and company names herein may be trademarks of their respective owners.
</p>
                        <p>###</p>
                        <p><br /></p>
                    </td>
                </tr>
            </table>
        </td>
<%-- Center Column Ends --%>

<%-- Right Column Begins --%>
         <td width="170">
            <jsp:include page="../public_right.jsp">
               <jsp:param name="level1" value="privatelabel"/>
            </jsp:include>
         </td>
<%-- Right Column Ends --%>

<%-- Gutter --%>
         <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<%-- Gutter Ends --%>
    </tr>
</table>

<jsp:include page="../foot.jsp" />

</body>

</html>
