<%@ page contentType="text/html;charset=utf-8" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" 
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer" %>
<%@ page import="com.topcoder.web.common.WebConstants"%>

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

    <style type="text/css">
    div.creditTitle{
        border-bottom: 1px solid #DDDDDD;
        font-weight: bold;
        clear: both;
    }
    div.creditNames{
        text-align: left;
        float: right;
        clear: both;
        width: 100px;
        margin-bottom: 20px;
    }
    </style>
 
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
                    <a href="/tc?module=Static&amp;d1=dev&amp;d2=umltool&amp;d3=description&node=<%=node==null?"":node%>" class="bcLink">Introduction</a>
                    | <a href="/wiki/display/tc/TopCoder+UML+Tool" class="bcLink">Download</a> (Requires login)
                    | <a href="http://<%=ApplicationServer.FORUMS_SERVER_NAME%>/?module=Category&amp;categoryID=2479" class="bcLink">Discuss the UML Tool</a>
                    | Credits
                    </strong>
                </p>

<div class="creditTitle">
Project Manager
</div>
<div class="creditNames">
<tc-webtag:handle coderId="151743" />
</div>

<div class="creditTitle">
Architect
</div>
<div class="creditNames">
<tc-webtag:handle coderId="10348862" />
</div>

<div class="creditTitle">
Assemblers
</div>
<div class="creditNames">
<tc-webtag:handle coderId="15989447" />
<br /><tc-webtag:handle coderId="20771475" />
<br /><tc-webtag:handle coderId="22691296" />
<br /><tc-webtag:handle coderId="22652099" />
<br /><tc-webtag:handle coderId="22691306" />
</div>

<div class="creditTitle">
Designers
</div>
<div class="creditNames">
<tc-webtag:handle coderId="278342" />
<br /><tc-webtag:handle coderId="252022" />
<br /><tc-webtag:handle coderId="287614" />
<br /><tc-webtag:handle coderId="7568791" />
<br /><tc-webtag:handle coderId="10437190" />
<br /><tc-webtag:handle coderId="21706245" />
<br /><tc-webtag:handle coderId="10535364" />
<br /><tc-webtag:handle coderId="10143068" />
<br /><tc-webtag:handle coderId="8369898" />
<br /><tc-webtag:handle coderId="251184" />
<br /><tc-webtag:handle coderId="20092786" />
<br /><tc-webtag:handle coderId="21926605" />
<br /><tc-webtag:handle coderId="13399756" />
<br /><tc-webtag:handle coderId="22668017" />
<br /><tc-webtag:handle coderId="15179224" />
<br /><tc-webtag:handle coderId="299180" />
<br /><tc-webtag:handle coderId="20256177" />
<br /><tc-webtag:handle coderId="20251531" />
<br /><tc-webtag:handle coderId="13245629" />
<br /><tc-webtag:handle coderId="10425804" />
<br /><tc-webtag:handle coderId="20437508" />
<br /><tc-webtag:handle coderId="20467258" />
<br /><tc-webtag:handle coderId="10035319" />
<br /><tc-webtag:handle coderId="9971384" />
<br /><tc-webtag:handle coderId="275640" />
<br /><tc-webtag:handle coderId="310233" />
<br /><tc-webtag:handle coderId="19930287" />
<br /><tc-webtag:handle coderId="22629976" />
<br /><tc-webtag:handle coderId="7360318" />
</div>

<div class="creditTitle">
Developers
</div>
<div class="creditNames">
<tc-webtag:handle coderId="15072390" />
<br /><tc-webtag:handle coderId="15997283" />
<br /><tc-webtag:handle coderId="10336829" />
<br /><tc-webtag:handle coderId="11838998" />
<br /><tc-webtag:handle coderId="22654379" />
<br /><tc-webtag:handle coderId="14926554" />
<br /><tc-webtag:handle coderId="21221008" />
<br /><tc-webtag:handle coderId="10063132" />
<br /><tc-webtag:handle coderId="20092786" />
<br /><tc-webtag:handle coderId="15989447" />
<br /><tc-webtag:handle coderId="20095099" />
<br /><tc-webtag:handle coderId="15050434" />
<br /><tc-webtag:handle coderId="20058309" />
<br /><tc-webtag:handle coderId="20771475" />
<br /><tc-webtag:handle coderId="15214882" />
<br /><tc-webtag:handle coderId="10275123" />
<br /><tc-webtag:handle coderId="302810" />
<br /><tc-webtag:handle coderId="15147311" />
<br /><tc-webtag:handle coderId="20807620" />
<br /><tc-webtag:handle coderId="22655076" />
<br /><tc-webtag:handle coderId="8380623" />
<br /><tc-webtag:handle coderId="22652099" />
<br /><tc-webtag:handle coderId="21075542" />
<br /><tc-webtag:handle coderId="14788013" />
<br /><tc-webtag:handle coderId="11971764" />
<br /><tc-webtag:handle coderId="14845140" />
<br /><tc-webtag:handle coderId="22629228" />
<br /><tc-webtag:handle coderId="8394868" />
<br /><tc-webtag:handle coderId="13325985" />
<br /><tc-webtag:handle coderId="22647930" />
<br /><tc-webtag:handle coderId="278460" />
<br /><tc-webtag:handle coderId="10169506" />
<br /><tc-webtag:handle coderId="7504160" />
<br /><tc-webtag:handle coderId="20822482" />
<br /><tc-webtag:handle coderId="15002482" />
<br /><tc-webtag:handle coderId="8375801" />
<br /><tc-webtag:handle coderId="8544935" />
<br /><tc-webtag:handle coderId="286907" />
<br /><tc-webtag:handle coderId="22659010" />
<br /><tc-webtag:handle coderId="22653372" />
<br /><tc-webtag:handle coderId="10526732" />
<br /><tc-webtag:handle coderId="20696742" />
</div>

<div class="creditTitle">
Design Reviewers
</div>
<div class="creditNames">
<tc-webtag:handle coderId="278342" />
<br /><tc-webtag:handle coderId="252022" />
<br /><tc-webtag:handle coderId="287614" />
<br /><tc-webtag:handle coderId="11797255" />
<br /><tc-webtag:handle coderId="10437190" />
<br /><tc-webtag:handle coderId="10535364" />
<br /><tc-webtag:handle coderId="10143068" />
<br /><tc-webtag:handle coderId="7360309" />
<br /><tc-webtag:handle coderId="7390772" />
<br /><tc-webtag:handle coderId="13399756" />
<br /><tc-webtag:handle coderId="15247903" />
<br /><tc-webtag:handle coderId="299180" />
<br /><tc-webtag:handle coderId="156859" />
<br /><tc-webtag:handle coderId="13245629" />
<br /><tc-webtag:handle coderId="289824" />
<br /><tc-webtag:handle coderId="11789293" />
<br /><tc-webtag:handle coderId="10650643" />
<br /><tc-webtag:handle coderId="15816101" />
<br /><tc-webtag:handle coderId="7463987" />
<br /><tc-webtag:handle coderId="310233" />
<br /><tc-webtag:handle coderId="297731" />
<br /><tc-webtag:handle coderId="19930287" />
<br /><tc-webtag:handle coderId="13377493" />
<br /><tc-webtag:handle coderId="8544935" />
<br /><tc-webtag:handle coderId="286907" />
<br /><tc-webtag:handle coderId="9981727" />
</div>

<div class="creditTitle">
Development Reviewers
</div>
<div class="creditNames">
<tc-webtag:handle coderId="15997283" />
<br /><tc-webtag:handle coderId="154579" />
<br /><tc-webtag:handle coderId="12029342" />
<br /><tc-webtag:handle coderId="7489235" />
<br /><tc-webtag:handle coderId="20076717" />
<br /><tc-webtag:handle coderId="14926554" />
<br /><tc-webtag:handle coderId="10063132" />
<br /><tc-webtag:handle coderId="21706245" />
<br /><tc-webtag:handle coderId="12006665" />
<br /><tc-webtag:handle coderId="15868222" />
<br /><tc-webtag:handle coderId="10535364" />
<br /><tc-webtag:handle coderId="22657163" />
<br /><tc-webtag:handle coderId="10098406" />
<br /><tc-webtag:handle coderId="21177823" />
<br /><tc-webtag:handle coderId="20708384" />
<br /><tc-webtag:handle coderId="8347577" />
<br /><tc-webtag:handle coderId="20092786" />
<br /><tc-webtag:handle coderId="20095099" />
<br /><tc-webtag:handle coderId="15050434" />
<br /><tc-webtag:handle coderId="13262921" />
<br /><tc-webtag:handle coderId="281876" />
<br /><tc-webtag:handle coderId="152605" />
<br /><tc-webtag:handle coderId="21110930" />
<br /><tc-webtag:handle coderId="21237755" />
<br /><tc-webtag:handle coderId="15832162" />
<br /><tc-webtag:handle coderId="21688022" />
<br /><tc-webtag:handle coderId="22627015" />
<br /><tc-webtag:handle coderId="10275123" />
<br /><tc-webtag:handle coderId="20719960" />
<br /><tc-webtag:handle coderId="299180" />
<br /><tc-webtag:handle coderId="11775761" />
<br /><tc-webtag:handle coderId="22655207" />
<br /><tc-webtag:handle coderId="11950083" />
<br /><tc-webtag:handle coderId="15692538" />
<br /><tc-webtag:handle coderId="21101272" />
<br /><tc-webtag:handle coderId="22656086" />
<br /><tc-webtag:handle coderId="10353806" />
<br /><tc-webtag:handle coderId="22656268" />
<br /><tc-webtag:handle coderId="15147311" />
<br /><tc-webtag:handle coderId="20807620" />
<br /><tc-webtag:handle coderId="21075542" />
<br /><tc-webtag:handle coderId="14788013" />
<br /><tc-webtag:handle coderId="10425804" />
<br /><tc-webtag:handle coderId="15655112" />
<br /><tc-webtag:handle coderId="11971764" />
<br /><tc-webtag:handle coderId="22656482" />
<br /><tc-webtag:handle coderId="22652765" />
<br /><tc-webtag:handle coderId="15832159" />
<br /><tc-webtag:handle coderId="9998760" />
<br /><tc-webtag:handle coderId="10650643" />
<br /><tc-webtag:handle coderId="150424" />
<br /><tc-webtag:handle coderId="14845140" />
<br /><tc-webtag:handle coderId="20262386" />
<br /><tc-webtag:handle coderId="11802577" />
<br /><tc-webtag:handle coderId="7463987" />
<br /><tc-webtag:handle coderId="15845095" />
<br /><tc-webtag:handle coderId="10022398" />
<br /><tc-webtag:handle coderId="13325985" />
<br /><tc-webtag:handle coderId="9971384" />
<br /><tc-webtag:handle coderId="15500330" />
<br /><tc-webtag:handle coderId="21459383" />
<br /><tc-webtag:handle coderId="21271044" />
<br /><tc-webtag:handle coderId="20314022" />
<br /><tc-webtag:handle coderId="299761" />
<br /><tc-webtag:handle coderId="10169506" />
<br /><tc-webtag:handle coderId="297731" />
<br /><tc-webtag:handle coderId="301597" />
<br /><tc-webtag:handle coderId="22629750" />
<br /><tc-webtag:handle coderId="21471587" />
<br /><tc-webtag:handle coderId="20822482" />
<br /><tc-webtag:handle coderId="15002482" />
<br /><tc-webtag:handle coderId="299979" />
<br /><tc-webtag:handle coderId="8375801" />
<br /><tc-webtag:handle coderId="15197513" />
<br /><tc-webtag:handle coderId="8544935" />
<br /><tc-webtag:handle coderId="10405908" />
<br /><tc-webtag:handle coderId="286907" />
<br /><tc-webtag:handle coderId="7360318" />
<br /><tc-webtag:handle coderId="15604762" />
<br /><tc-webtag:handle coderId="22653372" />
<br /><tc-webtag:handle coderId="21725045" />
</div>

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