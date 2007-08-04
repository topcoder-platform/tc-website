<%@  page language="java"
    import="com.topcoder.shared.dataAccess.DataAccessConstants,
           com.topcoder.web.tc.Constants"%>
          
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
  
<c:set value="<%=com.topcoder.web.common.BaseProcessor.DEFAULTS_KEY%>" var="defaults"/>
<c:set value="<%=DataAccessConstants.START_RANK%>" var="startRank"/>

<jsp:useBean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request" />

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Statistics</title>
<jsp:include page="/style.jsp">
  <jsp:param name="key" value="tc_stats"/>
</jsp:include>
<jsp:include page="/script.jsp" />
<script type="text/javascript">
function submitEnter(e) {
var keycode;
if (window.event) keycode = window.event.keyCode;
else if (e) keycode = e.which;
else return true;
if (keycode == 13) {
document.matchWinnersForm.submit();
return false;
} else return true;
}
function next() {
var myForm = document.matchWinnersForm;
myForm.<%=DataAccessConstants.START_RANK%>.value=<c:out value="${requestScope[defaults][startRank]}"/>+parseInt(myForm.<%=DataAccessConstants.NUMBER_RECORDS%>.value);
myForm.<%=DataAccessConstants.SORT_COLUMN%>.value='<%=request.getParameter(DataAccessConstants.SORT_COLUMN)==null?"":request.getParameter(DataAccessConstants.SORT_COLUMN)%>';
myForm.<%=DataAccessConstants.SORT_DIRECTION%>.value='<%=request.getParameter(DataAccessConstants.SORT_DIRECTION)==null?"":request.getParameter(DataAccessConstants.SORT_DIRECTION)%>';
myForm.submit();
}
function previous() {
var myForm = document.matchWinnersForm;
myForm.<%=DataAccessConstants.START_RANK%>.value=<c:out value="${requestScope[defaults][startRank]}"/>-parseInt(myForm.<%=DataAccessConstants.NUMBER_RECORDS%>.value);
myForm.<%=DataAccessConstants.SORT_COLUMN%>.value='<%=request.getParameter(DataAccessConstants.SORT_COLUMN)==null?"":request.getParameter(DataAccessConstants.SORT_COLUMN)%>';
myForm.<%=DataAccessConstants.SORT_DIRECTION%>.value='<%=request.getParameter(DataAccessConstants.SORT_DIRECTION)==null?"":request.getParameter(DataAccessConstants.SORT_DIRECTION)%>';

myForm.submit();
}
</script>

    <script language="JavaScript" type="text/javascript" src="/js/main.js"></script>


    <style type="text/css">
    div.shortList {
        display: block;
        white-space: nowrap;
    }

    div.fullList {
        display: none;
        white-space: nowrap;
    }
    </style>


</head>

<body>

        <jsp:include page="top.jsp" >
            <jsp:param name="level1" value=""/>
        </jsp:include>
               

        <table width="100%" border="0" cellpadding="0" cellspacing="0">
            <tr valign="top">
                <!-- Left Column Begins-->
                <td width="180">
                    <jsp:include page="/includes/global_left.jsp">
                        <jsp:param name="node" value="long_match_winners"/>
                    </jsp:include>
                </td>
                <!-- Left Column Ends -->

                <!-- Center Column Begins -->
                <TD CLASS="statTableSpacer" WIDTH="100%" VALIGN="top">

                <jsp:include page="page_title.jsp" >
                    <jsp:param name="image" value="statistics_w"/>
                    <jsp:param name="title" value="Match Winners"/>
                </jsp:include>

                <form name="matchWinnersForm" action='<jsp:getProperty name="sessionInfo" property="servletPath"/>' method="get">

                <tc-webtag:hiddenInput name="<%=Constants.MODULE_KEY%>" value="MatchWinners"/>
                <tc-webtag:hiddenInput name="<%=DataAccessConstants.SORT_COLUMN%>"/>
                <tc-webtag:hiddenInput name="<%=DataAccessConstants.SORT_DIRECTION%>"/>

				<center>
				
				<div class="pagingBox" style="width:300px;">
				    <c:choose>
				        <c:when test="${croppedDataBefore}">
				            <a href="Javascript:previous()" class="bcLink">&lt;&lt; prev</a>
				        </c:when>
				        <c:otherwise>
				            &lt;&lt; prev
				        </c:otherwise>
				    </c:choose>
				    |
				    <c:choose>
				        <c:when test="${croppedDataAfter}">
				            <a href="Javascript:next()" class="bcLink">next &gt;&gt;</a>
				        </c:when>
				        <c:otherwise>
				            next &gt;&gt;
				        </c:otherwise>
				    </c:choose>
				</div>
				</center>

			<table class="stat" cellpadding="0" cellspacing="0" width="100%" border="0">
			   <tr><td class="title" colspan="6">Marathon Match Winners</td></tr>
			   <tr>
			      <td class="headerC"><a href="<%=sessionInfo.getServletPath()%>?<tc-webtag:sort column="${columnMap['date']}" includeParams="true" excludeParams="sr" />">Date</a></td>
			      <td class="header" ><a href="<%=sessionInfo.getServletPath()%>?<tc-webtag:sort column="${columnMap['name']}" includeParams="true" excludeParams="sr" />">Match</a></td>
			      <td class="header" >Winners</td>
			      <td class="header" >Wins*</td>
			   </tr>
			   <c:forEach items="${list}" var="row" varStatus="status">
			   		<c:set var="roundId" value="r${row.map['round_id']}" />
			       <tr class='${status.index % 2 == 1? "dark" : "light" }'>
						<td class="valueC"><tc-webtag:format object="${row.map['date']}" format="MM.dd.yyyy" /></td>
						<td class="value" nowrap="nowrap">
							<a href="/longcontest/?module=ViewOverview&rd=${row.map['round_id']}"/>${row.map['name']}</a>
						</td>
						
						<c:choose>
							<c:when test="${fn:length(winnersMap[roundId]) > 3}">
						        <td class="value">
						            <div id="winnersShort${roundId}" class="shortList">
						                <a href="javascript: hide('winnersShort${roundId}'); showBlock('winnersFull${roundId}'); showBlock('winsFull${roundId}');" onfocus="this.blur();">
						                	[${fn:length(winnersMap[roundId])} winners]</a>
						            </div>
						            <div id="winnersFull${roundId}" class="fullList">
											<c:forEach items="${winnersMap[roundId]}" var="winner">
												<tc-webtag:handle coderId="${winner.coderId}" context="marathon_match"/> <br/> 
											</c:forEach>
						                <a href="javascript: hide('winnersFull${roundId}'); hide('winsFull${roundId}'); showBlock('winnersShort${roundId}');" onfocus="this.blur();">close</a>
						            </div>
						        </td>
						        <td class="valueR">
						            <div id="winsFull${roundId}" class="fullList">
									<c:forEach items="${winnersMap[roundId]}" var="winner">
										${winner.numWins} <br/> 
									</c:forEach>
						            </div>
						            &nbsp;
						        </td>

							</c:when>
							<c:otherwise>
								<td class="value">
									<c:forEach items="${winnersMap[roundId]}" var="winner">
										<tc-webtag:handle coderId="${winner.coderId}" context="marathon_match"/> <br/> 
									</c:forEach>
								</td>
								<td class="valueR">
									<c:forEach items="${winnersMap[roundId]}" var="winner">
										${winner.numWins} <br/> 
									</c:forEach>
								</td>							
							</c:otherwise>
						</c:choose>
					</tr>   
			   </c:forEach>   
			</table>

		<center>
		<div class="pagingBox" style="width:300px;">
		    <c:choose>
		        <c:when test="${croppedDataBefore}">
		            <a href="Javascript:previous()" class="bcLink">&lt;&lt; prev</a>
		        </c:when>
		        <c:otherwise>
		            &lt;&lt; prev
		        </c:otherwise>
		    </c:choose>
		    |
		    <c:choose>
		        <c:when test="${croppedDataAfter}">
		            <a href="Javascript:next()" class="bcLink">next &gt;&gt;</a>
		        </c:when>
		        <c:otherwise>
		            next &gt;&gt;
		        </c:otherwise>
		    </c:choose>
		</div>
		</center>

                        View &#160;
                        <tc-webtag:textInput name="<%=DataAccessConstants.NUMBER_RECORDS%>" size="4" maxlength="4" onKeyPress="submitEnter(event)"/>
                        &#160;at a time starting with &#160;
                        <tc-webtag:textInput name="<%=DataAccessConstants.START_RANK%>" size="4" maxlength="4" onKeyPress="submitEnter(event)"/>
                        <a href="javascript:document.matchListForm.submit();" class="bcLink">&#160;[ submit ]</a>
                    </div>

                    </form>
                </td>


         <td width="170">
            <jsp:include page="public_right.jsp">
               <jsp:param name="level1" value="default"/>
            </jsp:include>
         </td>

                <!-- Gutter -->
                <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
                <!-- Gutter Ends -->
            </tr>
        </table>

        <jsp:include page="foot.jsp" />

    </body>

</html>