<%--
  - Author: kanakarajank
  - Version: 1.0
  - Copyright (C) 2011 TopCoder Inc., All Rights Reserved.
  -
  - Description: Contains HTML elements and controls to submit contest name for searching.
 --%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ page isELIgnored="false"%>
<s:set var="sessionInfo" value="#session['sessionInfo']"/>
<s:set var="handleId" value="%{#sessionInfo.handle}"/>
<div class="infoBox myProfile">
	<s:set var="handleId" value="%{#sessionInfo.handle}"/>
	<div class="blackTitle">
		<span class="rightSide"><span class="inner"><span>My
					Profile</span> </span> </span>
	</div>
	<div class="content">
		<s:if test="#request.memberInfo.hasImage" >
			<s:url id="imageAnchor" value="%{memberProfileUrl}"/>
			<s:url id="imageUrl" value="#request.memberInfo.imageUrl"/>
		</s:if>
		<s:else>
			<s:url id="imageAnchor" value="%{memberProfileUrl}"/>
			<s:url id="imageUrl" value="../i/tc/user-big.png"/>
		</s:else>
		<s:a href="%{imageAnchor}"><img src='<s:property value="%{imageUrl}"/>'/></s:a>
		<ul>
			<li class="profile"><strong><s:a href="%{memberProfileUrl}"
					cssClass="redlink"><s:property value="%{#handleId}"/></s:a> </strong>
				<p>
					<s:url id="paymentSummaryUrl" value="%{getText('paymentsummary.url')}">
						<s:param name="cr" value="#sessionInfo.userId"/>
					</s:url>
					<span>Total Earnings: </span>
					<s:if test="#request.memberInfo.overallEarnings > 0 ">
						<s:a href="%{paymentSummaryUrl}" cssClass="redlink"><s:property value="#request.memberInfo.overallEarnings"/></s:a>
					</s:if>
					<s:else>
  						<s:a href="%{paymentSummaryUrl}" cssClass="redlink">$0.00</s:a>
  					</s:else>
				</p></li>
			<li><strong>Algorithm</strong>
				<p>
					<s:if test="#request.memberInfo.rating > 0 ">
						<s:url id="algoUrl" value="%{getText('algocompetitionhistory.url')}">
							<s:param name="cr" value="#sessionInfo.userId"/>
						</s:url>
						<s:a href="%{algoUrl}" ><span class="rated"><s:property value="#request.memberInfo.rating"/></span></s:a> 
					</s:if>
					<s:else>
						<span class="rated">Not Rated</span>
					</s:else>
					<span>Rating</span>
				</p></li>
			<li><strong>Design</strong>
				<p>
					<s:if test="#request.memberInfo.designRating > 0 ">
						<s:url id="designUrl" value="%{getText('designcompetitionhistory.url')}">
							<s:param name="cr" value="#sessionInfo.userId"/>
						</s:url>
						<s:a href="%{designUrl}" ><span class="rated"><s:property value="#request.memberInfo.designRating"/></span></s:a> 
					</s:if>
					<s:else>
						<span class="rated">Not Rated</span>
					</s:else>
					<span>Rating</span>
				</p></li>
			<li><strong>Development</strong>
				<p>
					<s:if test="#request.memberInfo.developmentRating > 0 ">
						<s:url id="devUrl" value="%{getText('devcompetitionhistory.url')}">
							<s:param name="cr" value="#sessionInfo.userId"/>
						</s:url>
						<s:a href="%{devUrl}" ><span class="rated"><s:property value="#request.memberInfo.developmentRating"/></span></s:a> 
					</s:if>
					<s:else>
						<span class="rated">Not Rated</span>
					</s:else>
					<span>Rating</span>
				</p></li>
			<li><strong>Marathon Match</strong>
				<p>
					<s:if test="#request.memberInfo.mmRating > 0 ">
						<s:url id="mmUrl" value="%{getText('mmcompetitionhistory.url')}">
							<s:param name="cr" value="#sessionInfo.userId"/>
						</s:url>
						<s:a href="%{mmUrl}" ><span class="rated"><s:property value="#request.memberInfo.mmRating"/></span></s:a>
					</s:if>
					<s:else>
						<span class="rated">Not Rated</span>
					</s:else>
					<span>Rating</span>
				</p></li>
		</ul>
	</div>
</div>