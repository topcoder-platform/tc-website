<%@ page import="com.topcoder.web.common.tag.ListSelectTag" %>
<%@ page import="com.topcoder.web.tc.Constants" %>
<%@ page import="com.topcoder.web.tc.controller.request.MediaRequest" %>
<%@ page import="java.util.ArrayList" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page contentType="text/html;charset=utf-8" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<%
    ArrayList<ListSelectTag.Option> mediaTypes = new ArrayList<ListSelectTag.Option>(3);
    mediaTypes.add(new ListSelectTag.Option("Newspaper", "Newspaper"));
    mediaTypes.add(new ListSelectTag.Option("Magazine", "Magazine"));
    mediaTypes.add(new ListSelectTag.Option("Online", "Online"));
%>

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
        <h1><a onfocus="this.blur();" href="/tc?module=Static&d1=pressroom&d2=index" name="pr_top">Press Room</a></h1>
    </div>
    <%-- pr_header end --%>
    
    <%-- pr_menu begin --%>
    <div id="pr_menu">
        <ul>
        <li><a href="/tc?module=Static&d1=pressroom&d2=index" title="Current News"><span>Current News</span></a></li>
        <li><a href="/tc?module=Static&d1=pressroom&d2=pr_archive" title="Press Release Archive"><span>Press Release Archive</span></a></li>
        <li><a href="/tc?module=Static&d1=pressroom&d2=art_archive" title="Articles Archive"><span>Articles Archive</span></a></li>
        <li><a href="/tc?module=Static&d1=pressroom&d2=mediaResources" title="Media Resources"><span>Media</span></a></li>
        <li id="pr_menuactive"><a href="/tc?module=Static&d1=pressroom&d2=mediaRequestForm" title="Media Request Form"><span>Media Request Form</span></a></li>
        </ul>
    </div>
    <%-- pr_menu end --%>
    <div class="pr_clear"></div>
    
    
    <%-- content rounded frame wrapper --%>
    <div id="pr_frame"><div id="pr_frame2"><div id="pr_frame3">
        
        <div id="pr_content" align="left">
        
            <div id="pr_requestform">
                <p>Please use the following form to request information from our Public Relations department.</p>
                
                <form action="${sessionInfo.servletPath}" method="post">
                    <tc-webtag:hiddenInput name="<%=Constants.MODULE_KEY%>" value="MediaRequest"/>
                <dl>
                    <tc-webtag:errorIterator id="err" name="<%=Constants.FIRST_NAME%>"><span class="bigRed">${err}<br/></span></tc-webtag:errorIterator>
                    <dt><label for="<%=Constants.FIRST_NAME%>">Given Name</label></dt>
                    <dd><tc-webtag:textInput name="<%=Constants.FIRST_NAME%>" size="25"/></dd>

                    <tc-webtag:errorIterator id="err" name="<%=Constants.LAST_NAME%>"><span class="bigRed">${err}<br/></span></tc-webtag:errorIterator>
                    <dt><label for="<%=Constants.LAST_NAME%>">Surname</label></dt>
                    <dd><tc-webtag:textInput name="<%=Constants.LAST_NAME%>" size="25"/></dd>

                    <tc-webtag:errorIterator id="err" name="<%=Constants.EMAIL%>"><span class="bigRed">${err}<br/></span></tc-webtag:errorIterator>
                    <dt><label for="<%=Constants.EMAIL%>">Email Address</label></dt>
                    <dd><tc-webtag:textInput name="<%=Constants.EMAIL%>" size="25"/></dd>

                    <tc-webtag:errorIterator id="err" name="<%=Constants.PHONE_NUMBER%>"><span class="bigRed">${err}<br/></span></tc-webtag:errorIterator>
                    <dt><label for="<%=Constants.PHONE_NUMBER%>">Phone Number</label></dt>
                    <dd><tc-webtag:textInput name="<%=Constants.PHONE_NUMBER%>" size="25"/></dd>

                    <tc-webtag:errorIterator id="err" name="<%=MediaRequest.FAX_NUMBER%>"><span class="bigRed">${err}<br/></span></tc-webtag:errorIterator>
                    <dt><label for="<%=MediaRequest.FAX_NUMBER%>">Fax Number</label></dt>
                    <dd><tc-webtag:textInput name="<%=MediaRequest.FAX_NUMBER%>" size="25"/></dd>

                    <tc-webtag:errorIterator id="err" name="<%=MediaRequest.MEDIA_TYPE%>"><span class="bigRed">${err}<br/></span></tc-webtag:errorIterator>
                    <dt><label for="<%=MediaRequest.MEDIA_TYPE%>">Type of Media</label></dt>
                    <dd><tc-webtag:listSelect name="<%=MediaRequest.MEDIA_TYPE%>" list="<%=mediaTypes%>"/></dd>
                    
                    <tc-webtag:errorIterator id="err" name="<%=MediaRequest.MEDIA_OUTLET%>"><span class="bigRed">${err}<br/></span></tc-webtag:errorIterator>
                    <dt><label for="<%=MediaRequest.MEDIA_OUTLET%>">Media Outlet</label></dt>
                    <dd><tc-webtag:textInput name="<%=MediaRequest.MEDIA_OUTLET%>" size="25"/></dd>
                    
                    <tc-webtag:errorIterator id="err" name="<%=Constants.TITLE%>"><span class="bigRed">${err}<br/></span></tc-webtag:errorIterator>
                    <dt><label for="<%=Constants.TITLE%>">Your Title</label></dt>
                    <dd><tc-webtag:textInput name="<%=Constants.TITLE%>" size="25"/></dd>
                    
                    <tc-webtag:errorIterator id="err" name="<%=MediaRequest.ON_ASSIGNMENT%>"><span class="bigRed">${err}<br/></span></tc-webtag:errorIterator>
                    <dt><label for="<%=MediaRequest.ON_ASSIGNMENT%>">Are you on assignment?</label></dt>
                    <dd>
                        <tc-webtag:radioButton name="<%=MediaRequest.ON_ASSIGNMENT%>" value="Yes"/><label for="<%=MediaRequest.ON_ASSIGNMENT%>Yes">&nbsp;Yes</label>
                        <tc-webtag:radioButton name="<%=MediaRequest.ON_ASSIGNMENT%>" value="No"/><label for="<%=MediaRequest.ON_ASSIGNMENT%>No">&nbsp;No</label></dd>
                    
                    <tc-webtag:errorIterator id="err" name="<%=MediaRequest.COMMENTS%>"><span class="bigRed">${err}<br/></span></tc-webtag:errorIterator>
                    <dt><label for="<%=MediaRequest.COMMENTS%>">Comments or Questions</label></dt>
                    <dd><tc-webtag:textArea name="<%=MediaRequest.COMMENTS%>" rows="15" cols="50"/></dd>
                    
                    <dt>&nbsp;</dt>
                    <dd><button name="submit" value="submit" type="submit">Submit</button></dd>
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