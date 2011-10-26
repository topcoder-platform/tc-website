<%--
  - Author: kanakarajank
  - Version: 1.0
  - Copyright (C) 2011 TopCoder Inc., All Rights Reserved.
  -
  - Description: Contains HTML elements and controls to submit contest name for searching.
 --%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<div class="infoBox tools">
	<div class="content">
		<ul>
			<li><a href="<s:url value="%{getText('umltool.url')}"/>" class="umlTool" title="UML Tool"></a>
			</li>
			<li><a href="<s:url value="%{getText('eventscalendar.url')}"/>" class="eventCalendar"
				title="Event Calendar"></a></li>
			<li class="last"><a href="<s:url value="%{getText('topcoder.surveys.url')}"/>" class="surveys"
				title="TopCoder Surveys"></a></li>
		</ul>
	</div>
</div>