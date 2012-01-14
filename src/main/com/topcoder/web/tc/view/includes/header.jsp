<%--
  - Author: TCSASSEMBLIER, kanakarajank
  - Version: 2.0
  - Copyright (C) 2011 TopCoder Inc., All Rights Reserved.
  -
  - Description: HTML elements for header of TC web pages.
 --%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ page isELIgnored="false"%>
<s:set value="#session['sessionInfo']" var="sessionInfo"/>

	<s:if test="%{#sessionInfo != null}">
		<s:set var="handleId" value="%{#sessionInfo.handle}"/>
		<span id="userId" style="display: none;"><s:property value="%{#sessionInfo.userId}"/></span>
		<span id="handleId" style="display: none;"><s:property value="%{#sessionInfo.handle}"/></span>	
	</s:if>
	<s:if test="%{#sessionInfo == null}">
		<s:set var="handleId" value="%{'Guest'}" />	
		<span id="userId" style="display: none;">-1</span>
		<span id="handleId" style="display: none;"><s:property value="%{#handleId}"/></span>
	</s:if>
<div id="header">
	<div id="name">
		<div class="leftPart">
			<div class="rightPart">
				<div class="innerPart">
					<s:if test="%{#handleId=='Guest'}">
						<ul class="guest">
							<li>
								<span class="wrap">Hello, <strong>Guest</strong> </span>
							</li>
							<li>
								<a href="<s:url action="login"/>" class="logIn"><span class="wrap">log
										in</span> </a>
							</li>
							<li class="last">
								<a href="<s:url value="%{getText('register.url')}"/>" class="redlink"><span class="wrap">Register</span>
								</a>
							</li>
						</ul>
					</s:if>
					<s:if test="%{#handleId!='Guest'}">
					<ul class="user">
						<s:url id="memberProfileUrl" value="%{getText('memberprofile.url')}">
							<s:param name="cr" value="#sessionInfo.userId"/>
						</s:url>
						<li>
							<span class="wrap">Hello,</span>
							<s:a href="%{memberProfileUrl}" cssClass="redlink"><span class="wrap"><s:property value="%{#sessionInfo.handle}"/></span></s:a>
						</li>
						<li class="pageSetting">
							<div class="subNav hide">
								<div class="head">
									<div class="rightSide">
										<div class="inner"></div>
									</div>
								</div>

								<div class="content">
									<div class="rightSideCustom">
										<div class="innerSide">
											<p>
												You can customize your home page lorem ipsum dolor sit amet
												consecte.
											</p>
											<ul>
												<li>
													<input id="activeContests" type="checkbox" checked="checked" />
													<label>
														Active Contest
													</label>
												</li>
												<li>
													<input id="topcoderNetworks" type="checkbox" checked="checked" />
													<label>
														TopCoder Networks
													</label>
												</li>
												<li>
													<input id="memberRating" type="checkbox" checked="checked" />
													<label>
														Member Rating
													</label>
												</li>
												<li>
													<input id="memberOfMonth" type="checkbox" checked="checked" />
													<label>
														Member of the month
													</label>
												</li>
												<li>
													<input id="topDevelopers" type="checkbox" checked="checked" />
													<label>
														Top 10 Developers
													</label>
												</li>
												<li>
													<label>
														Topcoder News
													</label>
													<select id="noOftopcoderNews" class="miniselect">
														<option value="1">1</option>
														<option value="2">2</option>
														<option value="3">3</option>
														<option value="4">4</option>
														<option value="5" selected="true">5</option>
													</select>
													/ Page
												</li>


											</ul>
											<a href="javascript:;" class="redBtn"><span
												class="rightSide"><span class="inner">UPDATE</span> </span>
											</a>
											<a href="javascript:;" class="greyBtn"><span
												class="rightSide"><span class="inner">CANCEL</span> </span>
											</a>

										</div>
									</div>
								</div>

								<!-- bottom part -->
								<div class="foot">
									<div class="rightSide">
										<div class="inner"></div>
									</div>
								</div>
							</div>
							<!--End .subnav-->
							<a href="javascript:;" class="hoverBtn"><span class="wrap"><span>Page
										Setting</span> </span> </a>
						</li>
						<li>
							<a href="<s:url value="%{getText('mytopcoder.url')}"/>"><span class="wrap">My TopCoder</span>
							</a>
						</li>
						<li class="last">
							<a href="<s:url action="logout"/>" class="logOut"><span class="wrap">Log
									out</span> </a>
						</li>
					</ul>
					</s:if>
					<div class="clear"></div>
				</div>
				<!-- End .inner -->
			</div>
			<!-- End .rightSide -->
		</div>
		<!-- End .leftSide -->
	</div>
	<!--End #name-->
	<s:set name="tagName">${param.currentTag }</s:set>
	<a href="<s:url action="Home"/>" class="logo"></a>
	<div id="topNav">
		<ul>
			<li>
				<s:set name="homeLinkClass">
					<s:if test='#tagName=="Home"'>current</s:if>
				</s:set>
				<a href="<s:url value="%{getText('home.url')}"/>"
					class="${homeLinkClass }"> <span class="rightSide"> <span
						class="inner">Home </span> </span> <span class="arrow"></span> </a>
			</li>
			<li>
				<s:set name="competitionLinkClass">
					<s:if test='#tagName=="Competitions"'>current</s:if>
				</s:set>
				<s:url var="competitionsLink" action="contests" namespace="/">
					<s:param name="category">ActiveContests</s:param>
				</s:url>
				<a href="${competitionsLink}" class="${competitionLinkClass}">
					<span class="rightSide"> <span class="inner">Competitions</span>
					</span>
					<span class="arrow"></span>
				</a>
			</li>
			<li>
				<div class="subNav hide">
					<div class="head">
						<div class="rightSide">
							<div class="inner"></div>
						</div>
					</div>
					<div class="content">
						<div class="leftContent">
							<div class="rightSideCustom">
								<div class="rightContent">
									<ul>
										<li>
											<a href="<s:url value="%{getText('topcoder.network.alcatel.url')}"/>"> <span>Alcatel Lucent</span> <span
												class="over"></span> </a>
										</li>
										<li>
											<a href="<s:url value="%{getText('topcoder.network.darpacs.url')}"/>"> <span>DARPA CS-STEM</span> <span
												class="over"></span> </a>
										</li>
										<li>
											<a href="<s:url value="%{getText('topcoder.network.ntl.url')}"/>"> <span>NASA Tournament Lab</span> <span
												class="over"></span> </a>
										</li>
									</ul>
								</div>
							</div>
						</div>
					</div>
					<!-- bottom part -->
					<div class="foot">
						<div class="rightSide">
							<div class="inner"></div>
						</div>
					</div>
				</div>
				<!--End .subnav-->
				<s:set name="networksLinkClass">
					<s:if test='#tagName=="Networks"'>current</s:if>
				</s:set>
				<a href="javascript:;" class="${networksLinkClass }"> <span
					class="rightSide"> <span class="inner">TopCoder
							Networks</span> </span> <span class="arrow"></span> </a>
			</li>
			<li>
				<s:set name="forumLinkClass">
					<s:if test='#tagName=="Forums"'>current</s:if>
				</s:set>
				<a href="<s:url value="%{getText('forums.url')}"/>" class="${forumLinkClass }"> <span
					class="rightSide"> <span class="inner">Forums</span> </span> <span
					class="arrow"></span> </a>
			</li>
			<li>
				<div class="subNav hide">
					<div class="head">
						<div class="rightSide">
							<div class="inner"></div>
						</div>
					</div>
					<div class="content">
						<div class="leftContent">
							<div class="rightSideCustom">
								<div class="rightContent">
									<ul>
										<li>
											<a href="<s:url value="%{getText('componentcatalog.url')}"/>"> <span>Component Catalog</span> <span
												class="over"></span> </a>
										</li>
										<li>
											<a href="<s:url value="%{getText('cockpit.url')}"/>"> <span>Cockpit</span> <span
												class="over"></span> </a>
										</li>
										<li>
											<a href="<s:url value="%{getText('onlinereview.url')}"/>"> <span>Online Review</span> <span
												class="over"></span> </a>
										</li>
										<li>
											<a href="<s:url value="%{getText('umltool.url')}"/>"> <span>UML Tool</span> <span
												class="over"></span> </a>
										</li>
										<li>
											<a href="<s:url value="%{getText('wiki.url')}"/>"> <span>Wiki</span> <span
												class="over"></span> </a>
										</li>
									</ul>
								</div>
							</div>
						</div>
					</div>
					<!-- bottom part -->
					<div class="foot">
						<div class="rightSide">
							<div class="inner"></div>
						</div>
					</div>
				</div>
				<!--End .subnav-->
				<s:set name="toolsLinkClass">
					<s:if test='#tagName=="Tools"'>current</s:if>
				</s:set>
				<a href="javascript:;" class="${toolsLinkClass }"> <span
					class="rightSide"> <span class="inner">Tools</span> </span> <span
					class="arrow"></span> </a>
			</li>
			<li>
				<div class="subNav hide">
					<div class="head">
						<div class="rightSide">
							<div class="inner"></div>
						</div>
					</div>
					<div class="content">
						<div class="leftContent">
							<div class="rightSideCustom">
								<div class="rightContent">
									<ul>
										<li>
											<a href="<s:url value="%{getText('eventscalendar.url')}"/>"> <span>Events Calendar</span> <span
												class="over"></span> </a>
										</li>
										<li>
											<a href="<s:url value="%{getText('tournaments.url')}"/>"> <span>Tournaments</span> <span
												class="over"></span> </a>
										</li>
									</ul>
								</div>
							</div>
						</div>
					</div>
					<!-- bottom part -->
					<div class="foot">
						<div class="rightSide">
							<div class="inner"></div>
						</div>
					</div>
				</div>
				<!--End .subnav-->
				<s:set name="eventsLinkClass">
					<s:if test='#tagName=="Events"'>current</s:if>
				</s:set>
				<a href="javascript:;" class="${eventsLinkClass }"> <span
					class="rightSide"> <span class="inner">Events</span> </span> <span
					class="arrow"></span> </a>
			</li>
			<li>
				<s:set name="howItWorksLinkClass">
					<s:if test='#tagName=="HowItWorks"'>current</s:if>
				</s:set>
				<a href="<s:url value="%{getText('howitworks.url')}"/>" class="${howItWorksLinkClass }"> <span
					class="rightSide"> <span class="inner">How it works?</span>
				</span> <span class="arrow"></span> </a>
			</li>
			<li>
				<s:set name="aboutLinkClass">
					<s:if test='#tagName=="About"'>current</s:if>
				</s:set>
				<a href="<s:url value="%{getText('abouttc.url')}"/>" class="${About }"> <span
					class="rightSide"> <span class="inner">About TopCoder</span>
				</span> <span class="arrow"></span> </a>
			</li>
		</ul>
	</div>
	<!--End #topNav-->
</div>
<!--End #header-->