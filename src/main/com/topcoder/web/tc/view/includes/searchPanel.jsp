<%--
  - Author: TCSASSEMBLIER, kanakarajank
  - Version: 2.0
  - Copyright (C) 2011 TopCoder Inc., All Rights Reserved.
  -
  - Description: Contains HTML elements and controls to submit contest name for searching.
 --%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<div class="infoBox search">
	<div class="blackTitle">
		<span class="rightSide"><span class="inner"><span
				class="icon">Search</span> </span> </span>
	</div>
	<div class="content">
		<s:url var="searchContestLink" action="contests" namespace="/" >
			<s:param name="category">SearchContests</s:param>
		</s:url>
		<span id="searchMemberLink" class="hide"><s:property value="%{getText('searchMember.url')}"/></span>
		<span id="advancedSearchMemberLink" class="hide"><s:property value="%{getText('advancedSearchMember.url')}"/></span>
		<form action="<s:property value="searchContestLink"/>" method="post">
			<input type="text" class="text normal hint" value="Keyword" id="contestName" name="contestName" />
			<select id="searchSelect">
				<option value="SearchContest">
					Search for contest
				</option>
				<option value="SearchMember">
					Search for member
				</option>
			</select>
			<a href="javascript:;" class="redBtn searchBtn"><span
				class="rightSide"><span class="inner">SEARCH</span> </span> </a>
			<a href="javascript:;" class="bulletLink advSearchLink">Advanced Search</a>
		</form>
	</div>
</div>
<!--End .infoBox-->