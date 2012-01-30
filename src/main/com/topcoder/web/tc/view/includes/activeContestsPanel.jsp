<%--
  - Author: kanakarajank, bugbuka
  - Version: 2.0
  - Copyright (C) 2011 TopCoder Inc., All Rights Reserved.
  -
  - Description: Contains HTML elements and controls to submit contest name for searching.
  -
  - Changes 01/16/2012:
  - http://apps.topcoder.com/wiki/display/~winterflame/Release+Assembly+-+TC+Refactoring+Stage+1+Update+1
  - Using category id instead of type.
 --%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ page isELIgnored ="false"%>
<div class="infoBox activeContests">
	<div class="blackTitle">
		<span class="rightSide"><span class="inner">Active Contests</span> </span>
	</div>
	<div class="content">
		<ul>
			<s:url var="url" value="%{getText('dr.contest.url')}"/>
			<s:set value="#request.dr" var="cont"/>
			<s:if test="#cont.contestCount > 0 ">
				<li><span class="point"><s:text name="format.pts" ><s:param name="value" value="#cont.prizeTotal"/></s:text> pts</span> <s:a href="%{url}"
				cssClass="redlink">Digital Run </s:a>(<s:property value="#cont.contestCount"/>)</li>
			</s:if>
			<s:url var="contestLink" action="contests" namespace="/">
				<s:param name="category">ActiveContests</s:param>
				<s:param name="id">1</s:param>
			</s:url>
			<s:set value="#request.design" var="cont"/>
			<s:if test="#cont.contestCount > 0 ">
				<li><span class="point"><s:text name="format.money" ><s:param name="value" value="#cont.prizeTotal"/></s:text> </span> <s:a href="%{contestLink}"
					cssClass="redlink">Comp Design </s:a>(<s:property value="#cont.contestCount"/>)</li>
			</s:if>
			<s:url var="contestLink" action="contests" namespace="/">
				<s:param name="category">ActiveContests</s:param>
				<s:param name="id">2</s:param>
			</s:url>
			<s:set value="#request.dev" var="cont"/>
			<s:if test="#cont.contestCount > 0 ">
				<li><span class="point"><s:text name="format.money" ><s:param name="value" value="#cont.prizeTotal"/></s:text></span> <s:a href="%{contestLink}"
					cssClass="redlink">Comp Development </s:a>(<s:property value="#cont.contestCount"/>)</li>
			</s:if>
			<s:url var="contestLink" action="contests" namespace="/">
				<s:param name="category">ActiveContests</s:param>
				<s:param name="id">14</s:param>
			</s:url>
			<s:set value="#request.assembly" var="cont"/>
			<s:if test="#cont.contestCount > 0 ">
				<li><span class="point"><s:text name="format.money" ><s:param name="value" value="#cont.prizeTotal"/></s:text></span> <s:a href="%{contestLink}"
					cssClass="redlink">Assembly </s:a>(<s:property value="#cont.contestCount"/>)</li>
			</s:if>
			<s:url var="url" value="%{getText('bugraces.contest.url')}"/>
			<s:set value="#request.bugs" var="cont"/>
			<s:if test="#cont.contestCount > 0 ">
				<li><span class="point"><s:text name="format.money" ><s:param name="value" value="#cont.prizeTotal"/></s:text></span> <s:a href="%{url}"
					cssClass="redlink">Bug Races </s:a>(<s:property value="#cont.contestCount"/>)</li>
			</s:if>
			<s:url var="contestLink" action="contests" namespace="/">
				<s:param name="category">ActiveContests</s:param>
				<s:param name="id">7</s:param>
			</s:url>
			<s:set value="#request.arch" var="cont"/>
			<s:if test="#cont.contestCount > 0 ">
				<li><span class="point"><s:text name="format.money" ><s:param name="value" value="#cont.prizeTotal"/></s:text></span> <s:a href="%{contestLink}"
					cssClass="redlink">Architecture </s:a>(<s:property value="#cont.contestCount"/>)</li>
			</s:if>
			<s:url var="contestLink" action="contests" namespace="/">
				<s:param name="category">ActiveContests</s:param>
				<s:param name="id">6</s:param>
			</s:url>
			<s:set value="#request.spec" var="cont"/>
			<s:if test="#cont.contestCount > 0 ">
				<li><span class="point"><s:text name="format.money" ><s:param name="value" value="#cont.prizeTotal"/></s:text></span> <s:a href="%{contestLink}"
					cssClass="redlink">Specification </s:a>(<s:property value="#cont.contestCount"/>)</li>
			</s:if>
			<s:url var="contestLink" action="contests" namespace="/">
				<s:param name="category">ActiveContests</s:param>
				<s:param name="id">19</s:param>
			</s:url>
			<s:set value="#request.uiprototype" var="cont"/>
			<s:if test="#cont.contestCount > 0 ">
				<li><span class="point"><s:text name="format.money" ><s:param name="value" value="#cont.prizeTotal"/></s:text></span> <s:a href="%{contestLink}"
					cssClass="redlink">UI Prototype</s:a>(<s:property value="#cont.contestCount"/>)</li>
			</s:if>
			<s:url var="url" value="%{getText('studio.contest.url')}"/>
			<s:set value="#request.studio" var="cont"/>
			<s:if test="#cont.contestCount > 0 ">
				<li><span class="point"><s:text name="format.money" ><s:param name="value" value="#cont.prizeTotal"/></s:text></span> <s:a href="%{url}"
					cssClass="redlink">Studio </s:a>(<s:property value="#cont.contestCount"/>)</li>
			</s:if>
			<s:set value="#request.nextSrm" var="cont"/>
			<s:if test="#cont != null">
				<li><span class="point"><s:date name="#cont.contestDate"  format="MMM dd, HH:mm z"/> </span> <a
					href="javascript:;" class="redlink">Next SRM</a></li>
			</s:if>
		</ul>
	</div>
</div>