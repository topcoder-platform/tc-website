<%--
  - Author: kanakarajank
  - Version: 1.0
  - Copyright (C) 2011 TopCoder Inc., All Rights Reserved.
  -
  - Description: Contains HTML elements and controls to submit contest name for searching.
 --%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<div class="infoBox networks">
	<div class="blackTitle">
		<span class="rightSide"><span class="inner">TopCoder
				Networks</span> </span>
	</div>
	<div class="content">
		<ul>
			<li><a href="<s:url value="%{getText('topcoder.network.alcatel.url')}"/>" title="Alcatel Lucent"><img
					src="../i/architecture-logo.png" alt="Alcatel Lucent" /></a></li>
			<li><a href="<s:url value="%{getText('topcoder.network.paypal.url')}"/>" title="PayPalX"><img
					src="../i/payPalX-logo.png" alt="PayPalX" /> </a></li>
			<li><a href="<s:url value="%{getText('topcoder.network.darpacs.url')}"/>" title="Dapra CS-STEM"><img
					src="../i/dapraCS-STEM-logo.png" alt="Dapra CS-STEM" /></a></li>
		</ul>
	</div>
</div>