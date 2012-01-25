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
					src="../i/tc/architecture-logo.png" alt="Alcatel Lucent" /></a></li>
			<li><a href="<s:url value="%{getText('topcoder.network.ntl.url')}"/>" title="NASA Tournament Lab"><img
					src="../i/tc/NTL-logo.png" alt="NASA Tournament Lab" /> </a></li>
			<li><a href="<s:url value="%{getText('topcoder.network.darpacs.url')}"/>" title="DARPA CS-STEM"><img
					src="../i/tc/dapraCS-STEM-logo.png" alt="DARPA CS-STEM" /></a></li>
		</ul>
	</div>
</div>