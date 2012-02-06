<%--
  - Author: kanakarajank, bugbuka
  - Version: 2.0
  - Copyright (C) 2011 TopCoder Inc., All Rights Reserved.
  -
  - Description: The page to display and filter a list of contests.
  -
  - Changes 01/16/2012:
  - http://apps.topcoder.com/wiki/display/~winterflame/Release+Assembly+-+TC+Refactoring+Stage+1+Update+1
  - Using category id instead of type.
  - Added year range dropdown list for PastContests.
  -
  - Changes 02/04/2012:
  - http://apps.topcoder.com/bugs/browse/TCCC-3978
  - Removed year range dropdown list.
 --%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<s:include value="/includes/head.jsp">
			<s:param name="title">${title}</s:param>
			<s:param name="jqueryUI">true</s:param>
		</s:include>
		<script src="../js/tc/jquery.dataTables.js" type="text/javascript"></script>
		<script type="text/javascript" src="../js/tc/loadContest.js"></script>
		<script type="text/javascript" src="../js/tc/jquery.ezCookie_0.8.0.min.js"></script>
	</head>
	<body>
		<span id="category" style="display: none;">${category }</span>
		<s:if test='category=="ActiveContests"'>
			<span id="contestType" style="display: none;">${type}</span>
		</s:if>
		<div id="wrapper">
			<s:include value="/includes/header.jsp">
				<s:param name="currentTag">Competitions</s:param>
			</s:include>
			<div id="content">
				<div id="leftColumn" class="sideBar">
					<ul id="contestList">
						<s:url var="activeContestsLink" action="contests" namespace="/">
							<s:param name="category">ActiveContests</s:param>
						</s:url>
						<li
							class="first <s:if test='category=="ActiveContests"'>current</s:if>">
							<a href="${activeContestsLink}"><span>Active Contests</span>
							</a>
							<span class="arrow"></span>
						</li>
						<s:iterator value="catalogs" id="cata">
							<li>
								<a href="javascript:;"
									class="node <s:if test='#cata==catalog'>expanded</s:if><s:else>collapsed</s:else>"><span>${cata}
										Contests</span> </a>
								<span class="arrow"></span>
								<ul <s:if test='#cata!=catalog'>class="hide"</s:if>>
									<s:if test='#cata=="Design"'>
										<li>
											<a href="http://studio.topcoder.com">Studio</a>
										</li>
									</s:if>
									<s:iterator value="categoriesByCatalog[#cata]" id="cate">
										<s:url var="contestLink" action="contests" namespace="/">
											<s:param name="category">ActiveContests</s:param>
											<s:param name="id">${cate.categoryId}</s:param>
										</s:url>
										<li>
											<a href="${contestLink}">${cate.categoryName}</a>
										</li>
									</s:iterator>
								</ul>
							</li>
						</s:iterator>
						<li <s:if test='category=="ContestStatus"'>class="current"</s:if>>
							<s:url var="contestStatusLink" action="contests" namespace="/">
								<s:param name="category">ContestStatus</s:param>
							</s:url>
							<a href="${contestStatusLink}"><span>Contest Status</span> </a>
							<span class="arrow"></span>
						</li>
						<s:url var="pastContestsLink" action="contests" namespace="/">
							<s:param name="category">PastContests</s:param>
						</s:url>
						<li <s:if test='category=="PastContests"'>class="current"</s:if>>
							<a href="${pastContestsLink}"><span>Past Contests</span> </a>
							<span class="arrow"></span>
						</li>
						<s:url var="upcomingContestsLink" action="contests" namespace="/">
							<s:param name="category">UpcomingContests</s:param>
						</s:url>
						<li
							<s:if test='category=="UpcomingContests"'>class="current"</s:if>>
							<a href="${upcomingContestsLink}"><span>Upcoming
									Contests</span> </a>
							<span class="arrow"></span>
						</li>
						<s:url var="reviewOpportunitiesLink" action="contests"
							namespace="/">
							<s:param name="category">ReviewOpportunities</s:param>
						</s:url>
						<li
							<s:if test='category=="ReviewOpportunities"'>class="current"</s:if>>
							<a href="${reviewOpportunitiesLink}"><span>Review
									Opportunities</span> </a>
							<span class="arrow"></span>
						</li>
						<li>
							<a href="<s:url value="%{getText('srm.contest.url')}"/>"><span>Single Round Matches
									(SRM)</span> </a>
							<span class="arrow"></span>
						</li>
						<li>
							<a href="<s:url value="%{getText('marathon.contest.url')}"/>"><span>Marathon Matches</span> </a>
							<span class="arrow"></span>
						</li>
						<li>
							<a href="<s:url value="%{getText('highschool.contest.url')}"/>"><span>High School</span> </a>
							<span class="arrow"></span>
						</li>
						<li>
							<a href="javascript:;"><span>Statistics</span> </a>
							<span class="arrow"></span>
						</li>
					</ul>
				</div>
				<div id="mainColumn">
					<s:if test='category=="ActiveContests"'>
						<a href="http://community.topcoder.com/tc?module=BasicRSS&c=rss_Registration_Open&dsid=28" class="redBtn rssBtn"><span
							class="rightSide"><span class="inner">RSS</span> </span> </a>
					</s:if>
					<h1 class="heading">
						${title }
						<s:if test='category=="SearchContests"&&contestName!=""'>
							<span style="display: none;"><span class="num"></span>&nbsp;Results
								found for "<strong>${contestName}</strong>"</span>
						</s:if>
					</h1>
					<div class="clear"></div>
					<div id="filterContainer" class="boxContainer">
						<div class="top">
							<div class="rightSide">
								<div class="inner"></div>
							</div>
						</div>
						<div class="content">
							<div class="rightSide">
								<div class="inner normal">
									<ul class="struct">
										<li>
											<h1>
												Filter
											</h1>
											<div class="optionsContainer">
												<a href="javascript:;" class="optionBtn collapsed">Show
													more options</a>
												<s:iterator value="catalogs" id="cata" status="status">
													<s:set name="filterColumnClass">
														<s:if test='#status.index==1'>firstColumn</s:if>
														<s:elseif test='#status.index==2'>secondColumn</s:elseif>
														<s:else>thirdColumn</s:else>
													</s:set>
													<div class="columns ${filterColumnClass}">
														<ul class="options">
															<li class="first">
																<input type="checkbox" name="${cata}" />
																${cata}
															</li>
															<s:iterator value="categoriesByCatalog[#cata]" var="cate">
																<s:if test="%{#cate=='Bug Races'}">
																	<s:if test="%{category=='ActiveContests'}">
																		<li class="more hide">
																			<input type="checkbox" name="${cate.categoryName}" />
																			${cate.categoryName}
																		</li>
																	</s:if>
																</s:if>
																<s:else>
																	<li class="more hide">
																		<input type="checkbox" name="${cate.categoryName}" />
																		${cate.categoryName}
																	</li>
																</s:else>
															</s:iterator>
														</ul>
													</div>
												</s:iterator>
											</div>
											<!-- End .optionsContainer -->
											<div class="catalog more hide">
												<p>
													<label>
														Contest Name:
													</label>
													<s:textfield cssClass="text" name="contestName" />
												</p>
												<p>
													<label for="catalog">
														Catalog :
													</label>
													<select id="catalog" class="select" name="catalog">
														<option value="Select">
															Select
														</option>
														<option value="Design">
															Design
														</option>
														<option value="Development">
															Development
														</option>
														<option value="UI Development">
															UI Development
														</option>
													</select>
												</p>
												<s:if
													test='category=="ContestStatus"||category=="PastContests"'>
													<p>
														<label>
															Winner:
														</label>
														<input type="text" class="text" name="winnerHandle" />
													</p>
												</s:if>
											</div>
											<!-- End .catalog -->
											<div class="moreOptions more hide">
												<div class="dateFilter">
													<s:if
														test='category!="ContestStatus"'>
														<s:include value="/includes/datePanel.jsp">
															<s:param name="label">Registration Start date</s:param>
														</s:include>
													</s:if>
													<s:include value="/includes/datePanel.jsp">
														<s:param name="label">Submission End date</s:param>
													</s:include>
													<s:if
														test='category!="UpcomingContests"&&category!="ReviewOpportunities"&&category!="ActiveContests"'>
														<s:include value="/includes/datePanel.jsp">
															<s:param name="label">Contest Finalization date</s:param>
														</s:include>
													</s:if>
													<s:if test='category=="ReviewOpportunities"'>
														<s:include value="/includes/datePanel.jsp">
															<s:param name="label">Review End date</s:param>
														</s:include>
													</s:if>
												</div>
												<!-- End .dateFilter -->
												<div class="priceFilter">
													<label>
														Prize($) :
													</label>
													<input type="text" class="text1 rightAligned"
														name="minPrize" value="0" />
													to
													<input type="text" class="text1" value="6000+"
														name="maxPrize" />
													<div class="sliderContainer">
														<div class="rightSide">
															<div class="content">
																<div>
																	<div id="slider"></div>
																</div>
																<div>
																	<ul class="scale">
																		<li>
																			0
																		</li>
																		<li>
																			1K
																		</li>
																		<li>
																			2K
																		</li>
																		<li>
																			3K
																		</li>
																		<li>
																			4K
																		</li>
																		<li>
																			5K
																		</li>
																		<li class="last">
																			6K+
																		</li>
																	</ul>
																</div>
															</div>
														</div>
													</div>
												</div>
												<!-- End .priceFilter -->
												<div class="clear"></div>
											</div>
											<!-- End .moreOptions -->
											<div class="clear"></div>
										</li>
										<li id="errors" style="display: none;">
											<ul></ul>
										</li>
										<li class="buttons">
											<a href="javascript:;" class="redBtn applyFilterBtn"><span
												class="rightSide"><span class="inner">APPLY</span> </span> </a>
											<a href="javascript:;" class="greyBtn"><span
												class="rightSide"><span class="inner">CLEAR</span> </span> </a>
										</li>
									</ul>
									<div class="clear"></div>
								</div>
							</div>
						</div>
						<div class="bottom">
							<div class="rightSide">
								<div class="inner"></div>
							</div>
						</div>
					</div>
					
					<!-- #filter -->
					<table id="contestTable" cellpadding="0" cellspacing="0"
						style="display: none;">
						<s:if test='category=="ActiveContests"'>
							<colgroup>
								<col width="65" />
								<col width="160" />
								<col width="65" />
								<col width="65" />
								<col />
								<col width="48" />
								<col />
								<col />
								<col />
							</colgroup>
							<thead>
								<tr>
									<th class="first">
										<span></span>Type
									</th>
									<th>
										Contest Name
									</th>
									<th>
										Register
									</th>
									<th>
										Submit
									</th>
									<th>
										1st Prize
									</th>
									<th style="width: 40px;">
										Reliability Bonus
									</th>
									<th>
										DR
									</th>
									<th style="width: 40px;">
										Regis- trants
									</th>
									<th class="last" style="width: 40px;">
										<span></span>No. of Subs
									</th>
								</tr>
							</thead>
						</s:if>
						<s:elseif test='category=="ContestStatus"'>
							<colgroup>
								<col width="65" />
								<col />
								<col width="160" />
								<col width="65" />
								<col width="75" />
								<col />
								<col width="70" />
								<col width="70" />
							</colgroup>
							<thead>
								<tr>
									<th class="first">
										<span></span>Type
									</th>
									<th>
										Catalog
									</th>
									<th>
										Contest Name
									</th>
									<th>
										Submission Date
									</th>
									<th>
										Final Review Date
									</th>
									<th>
										Current Phase
									</th>
									<th>
										1st Place
									</th>
									<th class="last">
										<span></span>2nd Place
									</th>
								</tr>
							</thead>
						</s:elseif>
						<s:elseif test='category=="PastContests"'>
							<colgroup>
								<col width="65" />
								<col />
								<col width="150" />
								<col width="65" />
								<col />
								<col />
								<col />
								<col />
							</colgroup>
							<thead>
								<tr>
									<th class="first">
										<span></span>Type
									</th>
									<th>
										Catalog
									</th>
									<th>
										Contest Name
									</th>
									<th>
										Complete Date
									</th>
									<th>
										No. of Registration
									</th>
									<th>
										No. of submissions
									</th>
									<th>
										Passed Screening
									</th>
									<th class="last">
										<span></span>Winner
									</th>
								</tr>
							</thead>
						</s:elseif>
						<s:elseif test='category=="UpcomingContests"'>
							<colgroup>
								<col width="75" />
								<col width="65" />
								<col />
								<col width="65" />
								<col width="160" />
								<col />
								<col />
							</colgroup>
							<thead>
								<tr>
									<th class="first">
										<span></span>Registration
										<br />
										Start
									</th>
									<th>
										Submission
										<br />
										End
									</th>
									<th>
										Duration (Day)
									</th>
									<th>
										Type
									</th>
									<th>
										Contest Name
									</th>
									<th>
										Technologies
									</th>
									<th class="last">
										Status
									</th>
								</tr>
							</thead>
						</s:elseif>
						<s:elseif test='category=="ReviewOpportunities"'>
							<colgroup>
								<col width="65" />
								<col width="160" />
								<col width="55" />
								<col width="55" />
								<col width="33" />
								<col width="65" />
								<col />
								<col />
								<col />
								<col />
							</colgroup>
							<thead>
								<tr>
									<th class="first">
										<span></span>Type
									</th>
									<th>
										Contest Name
									</th>
									<th>
										Primary Reviewer Payment
									</th>
									<th>
										Secondary Reviewer Payment
									</th>
									<th>
										No. of Subs
									</th>
									<th>
										Opens on
									</th>
									<th>
										Start Date
									</th>
									<th>
										End Date
									</th>
									<th>
										Position Avail.
									</th>
									<th class="last">
										<span></span>Details
									</th>
								</tr>
							</thead>
						</s:elseif>
						<s:else>
							<colgroup>
								<col width="240" />
								<col width="65" />
								<col />
								<col width="60" />
								<col width="75" />
								<col />
								<col />
							</colgroup>
							<thead>
								<tr>
									<th class="first">
										<span></span>Contest Name
									</th>
									<th>
										Type
									</th>
									<th>
										Catalog
									</th>
									<th>
										Prize
									</th>
									<th>
										Contest Status
									</th>
									<th>
										Registrants
									</th>
									<th class="last">
										<span></span>Details
									</th>
								</tr>
							</thead>
						</s:else>
						<tbody></tbody>
					</table>
				</div>
				<!--End #mainColumn-->
				<div class="clear"></div>
			</div>
		</div>
		<s:include value="/includes/footer.jsp" />
		<!-- New popups -->
		<div id="modalBackground"></div>
		<div id="new-modal">
			<div id="preload" class="popup">

			</div>
		</div>
	</body>
</html>