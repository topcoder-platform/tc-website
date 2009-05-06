<%@ page contentType="text/html;charset=utf-8" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" 
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page import="com.topcoder.shared.util.ApplicationServer" %>
<%@ page import="com.topcoder.web.common.WebConstants"%>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>

<html>

<head>
    <title>TopCoder</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <jsp:include page="../../script.jsp" />
    <jsp:include page="../../style.jsp">
        <jsp:param name="key" value="tc_stats"/>
    </jsp:include>
    <% String node = request.getParameter(WebConstants.LEFT_NAV_KEY);
        if (node!=null&&!(node.equals("arch_uml_tool")||node.equals("des_uml_tool")||node.equals("dev_uml_tool"))) {
            node = null;
        }
        if(node==null){
            node = "des_uml_tool";
        }
    %>
</head>

<body>

<jsp:include page="../../top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
<tbody>
    <tr valign="top">
<%-- Left Column Begins--%>
        <td width="180">
            <jsp:include page="../../includes/global_left.jsp">
                <jsp:param name="node" value="<%=node==null?"":node%>"/>
            </jsp:include>
        </td>
<%-- Left Column Ends --%>

<%-- Center Column Begins --%>
        <td width="100%" align="center" class="bodyColumn">
            <div class="fixedWidthBody">

                <div style="margin-bottom: 10px; border-bottom: 1px solid #999999;">
                    <img src="/i/development/umltool/banner.jpg" alt="TopCoder UML Tool" />
                </div>

                <p align="center">
                    <strong>
                    Introduction
                    | <a href="/wiki/display/tc/TopCoder+UML+Tool" class="bcLink">Download</a> (Requires login)
                    | <a href="http://<%=ApplicationServer.FORUMS_SERVER_NAME%>/?module=Category&amp;categoryID=2479" class="bcLink">Discuss the UML Tool</a>
                    | <a href="/tc?module=Static&amp;d1=dev&amp;d2=umltool&amp;d3=credits&amp;node=<%=node==null?"":node%>" class="bcLink">Credits</a>
                    </strong>
                </p>

                <p>
                We're proud to introduce the new TopCoder UML Tool: An easy to use, consistent modeling tool for use in Design and Development competitions. The new tool was built to model sequence, class, use case, and activity diagrams. On top of that, all those elements can have documentation easily attached to them.
                </p>

                <div align="center" style="margin: 40px;">
                    <div><a href="/wiki/display/tc/TopCoder+UML+Tool" class="bigButton" style="width: 140px;">Download Now</a></div>
                    <div>(Requires login)</div>
                </div>

                <p>
                Where did this tool come from? On May 23, 2006, TopCoder founder Jack Hughes <a href="http://<%=ApplicationServer.FORUMS_SERVER_NAME%>/?module=Thread&amp;threadID=511139">posted a message</a> in the Component Competition forum, writing:
                </p>
                <p>
                "We have decided to build our own UML tool. After considering various options, we think that this approach will allow us to develop a tool that is closely aligned with our members' needs when working within the TC process."
                </p>
                <p>
                Though this project was to follow the standard TopCoder component methodology, it was unique in one important respect.  Rather than TopCoder staff leading the effort, everything -- including project management and architecture, from soup to nuts -- was to be done by TopCoder members. 
                </p>
                <p>
                Reaction was largely positive and very vocal, and it wasn't long before people had offered up a wish list of features, enhancements and ideas. <tc-webtag:handle coderId="151743" /> was selected to lead the charge as project manager. 
                </p>
                <p>
                "Managing the UML Tool was an eye opening experience in just how effective the TopCoder software development model really is," he says. "I was surprised at how smoothly most of the development went and by the quality of the tool after it left assembly, with relatively few major issues to address for an application of this size."
                </p>
                <p>
                Dozens of TopCoder members contributed to this project, from design to development to assembly. For a full list, see the Credits page.
                </p>
                <p>
                The net result of all this work: An easy to use, consistent UML modeling tool for use in Design and Development competitions. The new tool was built to model sequence, class, use case, and activity diagrams, and all items in the diagrams can have documentation easily attached to them. Going forward, the UML Tool will be used as a replacement to the Gentleware Poseidon tool currently in use.
                </p>
                <p>
                Though it is now available for download, of course, the work isn't entirely over. "I anticipate the tool being heavily modified by designers and developers alike and tailored to individual needs," says Ghostar. "This flexibility will greatly enhance the speed at which the entire TopCoder process will work; I know I have a few planned features I'd like to implement that will make <a href="/tc?module=Static&amp;d1=features&amp;d2=081307">my life as a designer</a> a lot easier."
                </p>
                <p>
                Interested in trying it out? <a href="/wiki/display/tc/TopCoder+UML+Tool">Download the TopCoder UML Tool</a> now.
                </p>

            </div>
        </td>
<%-- Center Column Ends --%>
        
<%-- Right Column Begins --%>
        <td width="170">
            <jsp:include page="../../public_right.jsp">
                <jsp:param name="level1" value="default"/>
            </jsp:include>
        </td>
<%-- Right Column Ends --%>
        
    </tr>
</tbody>
</table>

<jsp:include page="../../foot.jsp" />

</body>

</html>