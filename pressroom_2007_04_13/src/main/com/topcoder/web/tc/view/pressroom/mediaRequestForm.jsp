<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page contentType="text/html;charset=utf-8" %> 
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
    <title>TopCoder Press Room</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <jsp:include page="../script.jsp" />
    <jsp:include page="../style.jsp">
    <jsp:param name="key" value="tc_pressroom"/>
    </jsp:include>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
</head>
<body>

<jsp:include page="../top.jsp" >
<jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
<tbody>
    <tr valign="top">
<%-- Left Column Begins--%>
        <td width="180">
            <jsp:include page="/includes/global_left.jsp">
                <jsp:param name="node" value="press_room"/>
            </jsp:include>
        </td>
<%-- Left Column Ends --%>

<%-- Center Column Begins --%>
        <td width="100%" align="center" class="bodyColumn">
            <div align="center">
<%-- YOUR WORK GOES HERE --%>

<%-- pr_wrapper begin --%>
<div id="pr_wrapper">

    <%-- pr_header begin --%>
    <div id="pr_header">
        <h1><a href="/tc?module=Static&d1=pressroom&d2=index" name="pr_top">Press Room</a></h1>
    </div>
    <%-- pr_header end --%>
    
    <%-- pr_menu begin --%>
    <div id="pr_menu">
        <ul>
        <li><a href="/tc?module=Static&d1=pressroom&d2=index" title="Current News"><span>Current News</span></a></li>
        <li><a href="/tc?module=Static&d1=pressroom&d2=pr_archive" title="Press Release Archive"><span>Press Release Archive</span></a></li>
        <li><a href="/tc?module=Static&d1=pressroom&d2=mediaResources" title="Media Resources"><span>Media</span></a></li>
        <li id="pr_menuactive"><a href="/tc?module=Static&d1=pressroom&d2=mediaRequestForm" title="Media Request Form"><span>Media Request Form</span></a></li>
        <li><a href="/tc?module=Static&d1=pressroom&d2=art_archive" title="Articles Archive"><span>Articles Archive</span></a></li>
        </ul>
    </div>
    <%-- pr_menu end --%>
    <div class="pr_clear"></div>
    
    
    <%-- content rounded frame wrapper --%>
    <div id="pr_frame"><div id="pr_frame2"><div id="pr_frame3">
        
        <div id="pr_content" align="left">
        
            <div id="pr_requestform">
                <p>Please use the following form to request information from our Public Relations department.</p>
                
                <form action="#formtarget">
                <dl>
                    <dt><label for="firstname">First Name</label></dt>
                    <dd><input type="text" name="firstname" size="25" id="firstname"></dd>
                    
                    <dt><label for="lastname">Last Name</label></dt>
                    <dd><input type="text" name="lastname" size="25" id="lastname"></dd>
                    
                    <dt><label for="lastname">Email Address</label></dt>
                    <dd><input type="text" name="lastname" size="25" id="lastname"></dd>
                    
                    <dt><label for="lastname">Phone Number</label></dt>
                    <dd><input type="text" name="lastname" size="25" id="lastname"></dd>
                    
                    <dt><label for="lastname">Fax Number</label></dt>
                    <dd><input type="text" name="lastname" size="25" id="lastname"></dd>
                    
                    <dt><label for="lastname">Type of Media</label></dt>
                    <dd>
                        <select name="mediatype">
                        <option value="paper">Newspaper</option>
                        <option value="mag">Magazine</option>
                        <option value="online">Online</option>
                        </select>
                    </dd>
                    
                    <dt><label for="lastname">Media Outlet</label></dt>
                    <dd><input type="text" name="lastname" size="25" id="lastname"></dd>
                    
                    <dt><label for="lastname">Your Title</label></dt>
                    <dd><input type="text" name="lastname" size="25" id="lastname"></dd>
                    
                    <dt><label for="lastname">Are you on assignment?</label></dt>
                    <dd><input type="radio" name="assign" size="25" id="assignYes" value="Yes" checked="checked"><label for="assignYes">&nbsp;Yes</label>&nbsp;<input type="radio" name="assign" size="25" id="assignNo" value="No"><label for="assignNo">&nbsp;No</label></dd>
                    
                    <dt><label for="lastname">Comments or Questions</label></dt>
                    <dd><textarea cols="50" rows="15" name="comment"></textarea></dd>
                    
                    <dt>&nbsp;</dt>
                    <dd><a href="#" class="button" style="width:50; height:15px;">Submit</a></dd>
                </dl>
                </form>
            </div>
            
        </div>
        <%-- pr_content end --%>
        
    </div></div></div>
    <%-- pr_frame_inner pr_frame --%>

</div>
<%-- pr_wrapper end --%>

<%-------------------------%>
            </div>
        </td>
<%-- Center Column Ends --%>
        
<%-- Right Column Begins --%>
        <td width="170">
            <jsp:include page="../public_right.jsp">
                <jsp:param name="level1" value="default"/>
            </jsp:include>
        </td>
<%-- Right Column Ends --%>
        
    </tr>
    </tbody>
</table>

<jsp:include page="../foot.jsp" />
</body>
</html>