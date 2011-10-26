<%--
  - Author: kanakarajank
  - Version: 1.0
  - Copyright (C) 2011 TopCoder Inc., All Rights Reserved.
  -
  - Description: Contains HTML elements and controls to submit contest name for searching.
 --%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ page isELIgnored="false"%>
 <div class="infoBox manOfM">
	<div class="blackTitle">
		<span class="rightSide"><span class="inner"><span>Member
					of the month</span><strong>Febuary 2011</strong> </span> </span>
	</div>
	<div class="content">
		<table cellpadding="0" cellspacing="0">
			<tr>
				<s:url id="memberProfileUrl" value="%{getText('memberprofile.url')}">
					<s:param name="cr" value="22700424"/>
					<s:param name="tab" value="'alg'"/>
				</s:url>
				<td><img src="../i/user-small.png" alt="" /></td>
				<td class="userInfo"><strong><a href="<s:url value="%{getText('mom.algorithm.url')}"/>"
						class="gMetal">Algorithm</a> </strong> <s:a href="%{memberProfileUrl}"
					cssClass="codertextblue">kyo_key</s:a></td>
			</tr>
			<tr>
				<s:url id="memberProfileUrl" value="%{getText('memberprofile.url')}">
					<s:param name="cr" value="21932422"/>
					<s:param name="tab" value="'des'"/>
				</s:url>
				<td><img src="../i/user-small.png" alt="" /></td>
				<td class="userInfo"><strong><a href="<s:url value="%{getText('mom.design.url')}"/>"
						class="gMetal">Design</a> </strong> <s:a href="%{memberProfileUrl}"
					cssClass="codertextred">saarixx</s:a> <span>5 wins</span></td>
			</tr>
			<tr>
				<s:url id="memberProfileUrl" value="%{getText('memberprofile.url')}">
					<s:param name="cr" value="15604762"/>
					<s:param name="tab" value="'dev'"/>
				</s:url>
				<td><img src="../i/user-small.png" alt="" /></td>
				<td class="userInfo"><strong><a href="<s:url value="%{getText('mom.development.url')}"/>"
						class="gMetal">Development</a> </strong> <s:a href="%{memberProfileUrl}"
					cssClass="codertextyellow">Yeung</s:a></td>
			</tr>
		</table>
		<div class="meta">
			<a href="javascript:;" class="bulletLink">Read their interviews</a>
		</div>
	</div>
</div>