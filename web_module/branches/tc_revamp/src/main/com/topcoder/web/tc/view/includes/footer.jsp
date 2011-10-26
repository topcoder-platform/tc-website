<%--
  - Author: TCSASSEMBLIER
  - Version: 1.0
  - Copyright (C) 2011 TopCoder Inc., All Rights Reserved.
  -
  - Description: HTML elements for footer of TC web pages.
 --%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<div id="footerWrapper">
	<div id="footer">
		<ul class="links">
			<li class="first">Copyright TopCoder, Inc. 2001-2011</li>
			<li><a href="<s:url value="%{getText('terms.of.use.url')}"/>">Terms of Use</a></li>
			<li class="last"><a href="<s:url value="%{getText('privacy.policy.url')}"/>">Privacy Policy</a></li>
		</ul>
		<div class="clear"></div>
	</div>
	<!-- End #footer -->
</div>
<!-- End #footerWrapper -->