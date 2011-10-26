<%--
  - Author: kanakarajank
  - Version: 1.0
  - Copyright (C) 2011 TopCoder Inc., All Rights Reserved.
  -
  - Description: Contains HTML elements and controls to submit contest name for searching.
 --%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ page isELIgnored="false"%>
 <div class="infoBox topTen">
	<div class="blackTitle">
		<span class="rightSide"><span class="inner"> <a
				href="javascript:;" class="hint"><span class="hintText hide">This
						list represents the top rated algorithm competition participants
						that have competed within the last 180 days.</span> </a> <span>Top 10
					Developers</span> <select class="topTenSelect" onChange="swapTopTen(this.value);" >
					<option value="topTenAlgo" selected="selected">Algorithm</option>
					<option value="topTenAlgoSchools">Algorithm Schools</option>
					<option value="topTenAlgoCountries">Algorithm Countries</option>
					<option value="topTenDes">Design</option>
					<option value="topTenDev">Development</option>
					<option value="topTenMM">Marathon Matches</option>
					<option value="topTenConceptualization">Conceptualization</option>
					<option value="topTenSpecification">Specification</option>
					<option value="topArchitecture">Architecture</option>
					<option value="topAssembly">Assembly</option>
					<option value="topTestSuites">Test Suites</option>
			</select> </span> </span>
	</div>
	<div id="topTenAlgo" class="content">
		<table cellpadding="0" cellspacing="0">
			<col width="27" />
			<col width="115" />
			<col />
			<thead>
				<tr>
					<th>#</th>
					<th class="second">Handle</th>
					<th class="last">Rating</th>
				</tr>
			</thead>
			<tbody>
				<s:iterator value="#request.coderRatings" var="detail" status="status">
					<s:url id="memberProfileUrl" value="%{getText('memberprofile.url')}">
						<s:param name="cr" value="#detail.coderId"/>
						<s:param name="tab" value="'alg'"/>
					</s:url>
					<s:if test="#status.first == true">
						<tr class="first">
					</s:if>
					<s:else>
						<tr>
					</s:else>
						<td class="first"><s:property value="#detail.rank"/></td>
						<td><strong><s:a href="%{memberProfileUrl}" cssClass="redlink"><s:property value="#detail.handle"/></s:a> </strong></td>
						<td class="last"><strong><s:property value="#detail.rating"/></strong></td>
					</tr>
				</s:iterator>	
			</tbody>
		</table>
		<div class="meta">
			<a href="<s:url value="%{getText('top10.algo.url')}"/>" class="bulletLink">View All</a>
		</div>
	</div>
	<div id="topTenAlgoSchools" class="content" style="display: none;">
		<table cellpadding="0" cellspacing="0">
			<col width="27" />
			<col width="115" />
			<col />
			<thead>
				<tr>
					<th>#</th>
					<th class="second">school</th>
					<th class="last">Rating</th>
				</tr>
			</thead>
			<tbody>
				<s:iterator value="#request.schoolAvgRating" var="detail" status="status">
					<s:if test="#status.first == true">
						<tr class="first">
					</s:if>
					<s:else>
						<tr>
					</s:else>
						<td class="first"><s:property value="#detail.rank"/></td>
						<td><strong><s:property value="#detail.name"/></strong></td>
						<td class="last"><strong><s:property value="#detail.avgRating"/></strong></td>
					</tr>
				</s:iterator>
			</tbody>
		</table>
		<div class="meta">
			<a href="<s:url value="%{getText('top10.school.url')}"/>" class="bulletLink">View All</a>
		</div>
	</div>
	<div id="topTenAlgoCountries" class="content" style="display: none;">
		<table cellpadding="0" cellspacing="0">
			<col width="27" />
			<col width="115" />
			<col />
			<thead>
				<tr>
					<th>#</th>
					<th class="second">Handle</th>
					<th class="last">Rating</th>
				</tr>
			</thead>
			<tbody>
				<s:iterator value="#request.countryAvgRating" var="detail" status="status">
					<s:url id="url" value="%{getText('top10.country.algorank.url')}">
						<s:param name="cc" value="#detail.countryCode"/>
					</s:url>
					<s:if test="#status.first == true">
						<tr class="first">
					</s:if>
					<s:else>
						<tr>
					</s:else>
						<td class="first"><s:property value="#detail.rank"/></td>
						<td><strong><s:a href="%{url}" cssClass="redlink"><s:property value="#detail.name"/></s:a> </strong></td>
						<td class="last"><strong><s:property value="#detail.avgRating"/></strong></td>
					</tr>
				</s:iterator>
			</tbody>
		</table>
		<div class="meta">
			<a href="<s:url value="%{getText('top10.countries.url')}"/>" class="bulletLink">View All</a>
		</div>
	</div>
	<!--  Top Ten Designers -->
	<div id="topTenDes" class="content" style="display: none;">
		<table cellpadding="0" cellspacing="0">
			<col width="27" />
			<col width="115" />
			<col />
			<thead>
				<tr>
					<th>#</th>
					<th class="second">Handle</th>
					<th class="last">Rating</th>
				</tr>
			</thead>
			<tbody>
				<s:iterator value="#request.topDesigners" var="detail" status="status">
					<s:url id="memberProfileUrl" value="%{getText('memberprofile.url')}">
						<s:param name="cr" value="#detail.coderId"/>
						<s:param name="tab" value="'des'"/>
					</s:url>
					<s:if test="#status.first == true">
						<tr class="first">
					</s:if>
					<s:else>
						<tr>
					</s:else>
						<td class="first"><s:property value="#detail.rank"/></td>
						<td><strong><s:a href="%{memberProfileUrl}" cssClass="redlink"><s:property value="#detail.handle"/></s:a> </strong></td>
						<td class="last"><strong><s:property value="#detail.rating"/></strong></td>
					</tr>
				</s:iterator>
			</tbody>
		</table>
		<div class="meta">
			<a href="<s:url value="%{getText('top10.design.url')}"/>" class="bulletLink">View All</a>
		</div>
	</div>
	
	<!--  Top Ten Developers -->
	<div id="topTenDev" class="content" style="display: none;">
		<table cellpadding="0" cellspacing="0">
			<col width="27" />
			<col width="115" />
			<col />
			<thead>
				<tr>
					<th>#</th>
					<th class="second">Handle</th>
					<th class="last">Rating</th>
				</tr>
			</thead>
			<tbody>
				<s:iterator value="#request.topDevelopers" var="detail" status="status">
					<s:url id="memberProfileUrl" value="%{getText('memberprofile.url')}">
						<s:param name="cr" value="#detail.coderId"/>
						<s:param name="tab" value="'dev'"/>
					</s:url>
					<s:if test="#status.first == true">
						<tr class="first">
					</s:if>
					<s:else>
						<tr>
					</s:else>
						<td class="first"><s:property value="#detail.rank"/></td>
						<td><strong><s:a href="%{memberProfileUrl}" cssClass="redlink"><s:property value="#detail.handle"/></s:a> </strong></td>
						<td class="last"><strong><s:property value="#detail.rating"/></strong></td>
					</tr>
				</s:iterator>
			</tbody>
		</table>
		<div class="meta">
			<a href="<s:url value="%{getText('top10.dev.url')}"/>" class="bulletLink">View All</a>
		</div>
	</div>
	
	<!--  Top Ten Marathon Mathchers -->
	<div id="topTenMM" class="content" style="display: none;">
		<table cellpadding="0" cellspacing="0">
			<col width="27" />
			<col width="115" />
			<col />
			<thead>
				<tr>
					<th>#</th>
					<th class="second">Handle</th>
					<th class="last">Rating</th>
				</tr>
			</thead>
			<tbody>
				<s:iterator value="#request.topMmCoders" var="detail" status="status">
					<s:url id="memberProfileUrl" value="%{getText('memberprofile.url')}">
						<s:param name="cr" value="#detail.coderId"/>
						<s:param name="tab" value="'long'"/>
					</s:url>
					<s:if test="#status.first == true">
						<tr class="first">
					</s:if>
					<s:else>
						<tr>
					</s:else>
						<td class="first"><s:property value="#detail.rank"/></td>
						<td><strong><s:a href="%{memberProfileUrl}" cssClass="redlink"><s:property value="#detail.handle"/></s:a> </strong></td>
						<td class="last"><strong><s:property value="#detail.rating"/></strong></td>
					</tr>
				</s:iterator>
			</tbody>
		</table>
		<div class="meta">
			<a href="<s:url value="%{getText('top10.mm.url')}"/>" class="bulletLink">View All</a>
		</div>
	</div>
	
	<!--  Top Ten Conceptualizers -->
	<div id="topTenConceptualization" class="content" style="display: none;">
		<table cellpadding="0" cellspacing="0">
			<col width="27" />
			<col width="115" />
			<col />
			<thead>
				<tr>
					<th>#</th>
					<th class="second">Handle</th>
					<th class="last">Rating</th>
				</tr>
			</thead>
			<tbody>
				<s:iterator value="#request.topConceptors" var="detail" status="status">
					<s:url id="memberProfileUrl" value="%{getText('memberprofile.url')}">
						<s:param name="cr" value="#detail.coderId"/>
						<s:param name="tab" value="'concept'"/>
					</s:url>
					<s:if test="#status.first == true">
						<tr class="first">
					</s:if>
					<s:else>
						<tr>
					</s:else>
						<td class="first"><s:property value="#detail.rank"/></td>
						<td><strong><s:a href="%{memberProfileUrl}" cssClass="redlink"><s:property value="#detail.handle"/></s:a> </strong></td>
						<td class="last"><strong><s:property value="#detail.rating"/></strong></td>
					</tr>
				</s:iterator>
			</tbody>
		</table>
		<div class="meta">
			<a href="<s:url value="%{getText('top10.concept.url')}"/>" class="bulletLink">View All</a>
		</div>
	</div>
	
	<!--  Top Ten Specificators -->
	<div id="topTenSpecification" class="content" style="display: none;">
		<table cellpadding="0" cellspacing="0">
			<col width="27" />
			<col width="115" />
			<col />
			<thead>
				<tr>
					<th>#</th>
					<th class="second">Handle</th>
					<th class="last">Rating</th>
				</tr>
			</thead>
			<tbody>
				<s:iterator value="#request.topSpecificators" var="detail" status="status">
					<s:url id="memberProfileUrl" value="%{getText('memberprofile.url')}">
						<s:param name="cr" value="#detail.coderId"/>
						<s:param name="tab" value="'spec'"/>
					</s:url>
					<s:if test="#status.first == true">
						<tr class="first">
					</s:if>
					<s:else>
						<tr>
					</s:else>
						<td class="first"><s:property value="#detail.rank"/></td>
						<td><strong><s:a href="%{memberProfileUrl}" cssClass="redlink"><s:property value="#detail.handle"/></s:a> </strong></td>
						<td class="last"><strong><s:property value="#detail.rating"/></strong></td>
					</tr>
				</s:iterator>
			</tbody>
		</table>
		<div class="meta">
			<a href="<s:url value="%{getText('top10.spec.url')}"/>" class="bulletLink">View All</a>
		</div>
	</div>
	
	<!--  Top Ten Architects -->
	<div id="topArchitecture" class="content" style="display: none;">
		<table cellpadding="0" cellspacing="0">
			<col width="27" />
			<col width="115" />
			<col />
			<thead>
				<tr>
					<th>#</th>
					<th class="second">Handle</th>
					<th class="last">Rating</th>
				</tr>
			</thead>
			<tbody>
				<s:iterator value="#request.topArchitects" var="detail" status="status">
					<s:url id="memberProfileUrl" value="%{getText('memberprofile.url')}">
						<s:param name="cr" value="#detail.coderId"/>
						<s:param name="tab" value="'arch'"/>
					</s:url>
					<s:if test="#status.first == true">
						<tr class="first">
					</s:if>
					<s:else>
						<tr>
					</s:else>
						<td class="first"><s:property value="#detail.rank"/></td>
						<td><strong><s:a href="%{memberProfileUrl}" cssClass="redlink"><s:property value="#detail.handle"/></s:a> </strong></td>
						<td class="last"><strong><s:property value="#detail.rating"/></strong></td>
					</tr>
				</s:iterator>
			</tbody>
		</table>
		<div class="meta">
			<a href="<s:url value="%{getText('top10.arch.url')}"/>" class="bulletLink">View All</a>
		</div>
	</div>
	
	<!--  Top Ten Assemblers -->
	<div id="topAssembly" class="content" style="display: none;">
		<table cellpadding="0" cellspacing="0">
			<col width="27" />
			<col width="115" />
			<col />
			<thead>
				<tr>
					<th>#</th>
					<th class="second">Handle</th>
					<th class="last">Rating</th>
				</tr>
			</thead>
			<tbody>
				<s:iterator value="#request.topAssemblers" var="detail" status="status">
					<s:url id="memberProfileUrl" value="%{getText('memberprofile.url')}">
						<s:param name="cr" value="#detail.coderId"/>
						<s:param name="tab" value="'assembly'"/>
					</s:url>
					<s:if test="#status.first == true">
						<tr class="first">
					</s:if>
					<s:else>
						<tr>
					</s:else>
						<td class="first"><s:property value="#detail.rank"/></td>
						<td><strong><s:a href="%{memberProfileUrl}" cssClass="redlink"><s:property value="#detail.handle"/></s:a> </strong></td>
						<td class="last"><strong><s:property value="#detail.rating"/></strong></td>
					</tr>
				</s:iterator>
			</tbody>
		</table>
		<div class="meta">
			<a href="<s:url value="%{getText('top10.assembly.url')}"/>" class="bulletLink">View All</a>
		</div>
	</div>
	
	<!--  Top Ten Testers -->
	<div id="topTestSuites" class="content" style="display: none;">
		<table cellpadding="0" cellspacing="0">
			<col width="27" />
			<col width="115" />
			<col />
			<thead>
				<tr>
					<th>#</th>
					<th class="second">Handle</th>
					<th class="last">Rating</th>
				</tr>
			</thead>
			<tbody>
				<s:iterator value="#request.topTesters" var="detail" status="status">
					<s:url id="memberProfileUrl" value="%{getText('memberprofile.url')}">
						<s:param name="cr" value="#detail.coderId"/>
						<s:param name="tab" value="'test'"/>
					</s:url>
					<s:if test="#status.first == true">
						<tr class="first">
					</s:if>
					<s:else>
						<tr>
					</s:else>
						<td class="first"><s:property value="#detail.rank"/></td>
						<td><strong><s:a href="%{memberProfileUrl}" cssClass="redlink"><s:property value="#detail.handle"/></s:a> </strong></td>
						<td class="last"><strong><s:property value="#detail.rating"/></strong></td>
					</tr>
				</s:iterator>
			</tbody>
		</table>
		<div class="meta">
			<a href="<s:url value="%{getText('top10.test.url')}"/>" class="bulletLink">View All</a>
		</div>
	</div>
</div>