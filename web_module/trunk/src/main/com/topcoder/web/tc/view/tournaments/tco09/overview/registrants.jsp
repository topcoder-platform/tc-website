<%--
 * Copyright (C) 2004 - 2009 TopCoder Inc., All Rights Reserved.  
 *
 * This JSP shows tournament registrants.
 *
 * Author TCSDEVELOPER
 * Version 1.0
 * Since 2009 TopCoder Open Site Integration
--%>
<%@ page contentType="text/html;charset=utf-8" %> 
<%@ page import="com.topcoder.shared.dataAccess.*, 
                 com.topcoder.web.tc.Constants,
                 com.topcoder.shared.dataAccess.resultSet.ResultSetContainer" %>

<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:useBean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request" />

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
        
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<title>TCO 09 : Tournament Overview</title>

<!-- Meta Tags -->
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<!-- External CSS -->
<link rel="stylesheet" href="css/tournaments/tco09.css" media="all" type="text/css" />
<link type="text/css" rel="stylesheet" href="/css/coders.css"/>
<!--[if IE 6]>
<link rel="stylesheet" type="text/css" media="screen" href="css/screen-ie6.css" />
<![endif]-->

<!-- External JavaScripts -->
<script type="text/javascript" src="/js/tournaments/tco09/jquery-1.2.6.js"></script>
<script type="text/javascript" src="/js/tournaments/tco09/jquery.backgroundPosition.js"></script>
<script type="text/javascript" src="/js/tournaments/tco09/scripts.js"></script>
<script type="text/javascript" src="/js/arena.js"></script> 
<style type="text/css">
<!--
.style2 {color: #FF0000}
-->
</style>
   <script type="text/javascript">
      function next() {
        var myForm = document.registrantsForm;
        myForm.<%=DataAccessConstants.START_RANK%>.value= parseInt(myForm.<%=DataAccessConstants.START_RANK%>.value) + parseInt(myForm.<%=DataAccessConstants.NUMBER_RECORDS%>.value);
        myForm.<%=DataAccessConstants.SORT_COLUMN%>.value='<%=request.getParameter(DataAccessConstants.SORT_COLUMN)==null?"":request.getParameter(DataAccessConstants.SORT_COLUMN)%>';
        myForm.<%=DataAccessConstants.SORT_DIRECTION%>.value='<%=request.getParameter(DataAccessConstants.SORT_DIRECTION)==null?"":request.getParameter(DataAccessConstants.SORT_DIRECTION)%>';
        myForm.submit();
      }
      function previous() {
        var myForm = document.registrantsForm;
        myForm.<%=DataAccessConstants.START_RANK%>.value-=parseInt(myForm.<%=DataAccessConstants.NUMBER_RECORDS%>.value);
        myForm.<%=DataAccessConstants.SORT_COLUMN%>.value='<%=request.getParameter(DataAccessConstants.SORT_COLUMN)==null?"":request.getParameter(DataAccessConstants.SORT_COLUMN)%>';
        myForm.<%=DataAccessConstants.SORT_DIRECTION%>.value='<%=request.getParameter(DataAccessConstants.SORT_DIRECTION)==null?"":request.getParameter(DataAccessConstants.SORT_DIRECTION)%>';
    
        myForm.submit();
      }
    </script>
</head>

<body id="page">

    <%ResultSetContainer rsc = (ResultSetContainer) (request.getAttribute("list"));%>

    <div id="wrapper">
        <div id="wrapperInner">
            <div id="wrapperContent">
                
                <div id="wrapperContentInner">
                
                    <jsp:include page="../header.jsp"/>
                    
                    <jsp:include page="../mainNav.jsp" >
                        <jsp:param name="mainTab" value="overview"/>
                    </jsp:include>
                    
                    <div id="content">
                            <div class="contentTopLeft"><div class="contentTopRight">
                                <div class="contentTopInner"></div>
                            </div></div>
                            
                            <div id="contentInner" class="contentInner">
                            
                                <div id="contentInnerInner">
                                
                                    <jsp:include page="topArea.jsp"/>
                                
                                    <div class="bottomArea">
                                        <div class="bottomLeft"><div class="bottomRight">
                                            
                                            <jsp:include page="../secondaryNav.jsp" >
                                                <jsp:param name="mainTab" value="overview"/>
                                                <jsp:param name="secondaryTab" value="registrants"/>
                                            </jsp:include>
                                            
                                            <jsp:include page="../tertiaryNav.jsp" >
                                                <jsp:param name="mainTab" value="overview"/>
                                                <jsp:param name="secondaryTab" value="registrants"/>
                                                <jsp:param name="tertiaryTab" value=""/>
                                            </jsp:include>
                                            
                                            <div class="bottomAreaContent">
                                                
                                            <div class="mainContent">
                                                <div id="mainContentInner">
                                                    <div>
                                                        <div class="pageContent">
                                                            <h2 class="title">Registrants</h2><br/>
                                                        </div><!-- End .pageContent -->
                                                        <form name="registrantsForm" action='<jsp:getProperty name="sessionInfo" property="servletPath"/>' method="get">
                                                            <tc-webtag:hiddenInput name="<%=Constants.MODULE_KEY%>" value="Registrants"/>
                                                            <tc-webtag:hiddenInput name="<%=DataAccessConstants.SORT_COLUMN%>"/>
                                                            <tc-webtag:hiddenInput name="<%=DataAccessConstants.SORT_DIRECTION%>"/>

<%=(rsc.croppedDataBefore()?"<a href=\"Javascript:previous()\" class=\"bcLink\">&lt;&lt; prev</a>":"&lt;&lt; prev")%>
| <%=(rsc.croppedDataAfter()?"<a href=\"Javascript:next()\" class=\"bcLink\">next &gt;&gt;</a>":"next &gt;&gt;")%>
   <br /><br />

                                                            <table class="data" width="100%" cellpadding="0" cellspacing="0">
                                                                <tr>
                                                                    <th class="first">&nbsp;</th>
                                                                    <th colspan="2">Registrants: ${numRegistrants}</th>
                                                                    <th class="last">&nbsp;</th>
                                                                </tr>
                                                                <tr>
                                                                    <td class="subfirstleft">&nbsp;</th>
                                                                    <td class="subfirst"><a href="/tco09?module=Registrants<tc-webtag:sort column="<%=rsc.getColumnIndex("handle_lower")%>"/>">Handle</a></th>
                                                                    <td class="subfirst" align="right">Search: <tc-webtag:textInput name="<%=Constants.HANDLE%>" size="16" style="border: 1px solid #999999; color: #999999;" onClick="this.style.color='#333333';" maxlength="100"/></th>
                                                                    <td class="sublastright">&nbsp;</th>
                                                                </tr>
                                                                <rsc:iterator list='<%=rsc%>' id="resultRow">
                                                                    <tr>
                                                                        <td class="first">&nbsp;</td>
                                                                        <td class="first last alignText" colspan="2"><tc-webtag:handle coderId='<%=resultRow.getIntItem("user_id")%>'/></td>
                                                                        <td class="last">&nbsp;</td>
                                                                    </tr>
                                                                </rsc:iterator>
                                                            </table>

   <br /><%=(rsc.croppedDataBefore()?"<a href=\"Javascript:previous()\" class=\"bcLink\">&lt;&lt; prev</a>":"&lt;&lt; prev")%>
   | <%=(rsc.croppedDataAfter()?"<a href=\"Javascript:next()\" class=\"bcLink\">next &gt;&gt;</a>":"next &gt;&gt;")%>

   <br /><br />

   View &#160;
   <tc-webtag:textInput name="<%=DataAccessConstants.NUMBER_RECORDS%>" size="4" maxlength="4"/>
   &#160;at a time starting with &#160;
   <tc-webtag:textInput name="<%=DataAccessConstants.START_RANK%>" size="4" maxlength="4"/>
    <button name="nameSubmit" value="submit" type="submit">Go</button>

                                                        </form>
                                                    </div>
                                                </div><!-- End #mainContentInner -->
                                            </div><!-- End #mainContent -->                                                
                                            
                                            <jsp:include page="../sponsors.jsp"/>
                                                
                                            </div><!-- End .bottomAreaContent -->
                                        
                                        </div></div>
                                    </div><!-- End .bottomArea -->
                                    
                                </div><!-- End #contentInnerInner -->
                            
                            </div><!-- End #contentInner -->
                            
                            <div class="contentBottomLeft"><div class="contentBottomRight">
                                <div class="contentTopInner"></div>
                            </div></div>
                            
                    </div><!-- End #content -->
                
                </div><!-- End #wrapperContentInner -->
                
            </div>
        </div><!-- End #wrapperInner -->
    </div><!-- End #wrapper -->

<jsp:include page="../footer.jsp"/>
</body>
</html>
