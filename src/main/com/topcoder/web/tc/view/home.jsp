<%--
  - Author: TCSASSEMBLIER, kanakarajank
  - Version: 2.0
  - Copyright (C) 2011 TopCoder Inc., All Rights Reserved.
  -
  - Description: The TC home page. 
 --%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ page isELIgnored ="false"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<s:include value="/includes/head.jsp">
			<s:param name="title">Home</s:param>
		</s:include>
		<link href="../css/tc/skin.css" type="text/css" rel="stylesheet" media="screen" />
		<script src="../js/tc/jquery.jcarousel.min.js" type="text/javascript"></script>
	</head>

	<body>
		<div id="wrapper">
			<s:include value="/includes/header.jsp">
				<s:param name="currentTag">Home</s:param>
			</s:include>
			<div id="content">
				<div id="leftColumn" class="sideBar">
					<s:include value="/includes/searchPanel.jsp"/>
					<s:include value="/includes/activeContestsPanel.jsp"/>
					<s:include value="/includes/networksPanel.jsp"/>
					<s:include value="/includes/toolsPanel.jsp"/>
					
				</div>
				<!--End #leftColunm-->
				<div id="centerColumn">
					<div class="topBanner">
						<script type="text/javascript">
							getNewsBanner($("#centerColumn .topBanner"),'<s:property  value="%{getText('topcoder.newbanner.feed.url')}" />');
							//getNewsBanner($("#centerColumn .topBanner"),'http://topcoder.com/home/blog/category/hidden/feed/');
						</script>
						
					</div>
					<!--End .topBanner-->
					<div id="newsHeadLine" class="boxContainer">
						<div class="top">
							<div class="rightSide">
								<div class="inner"></div>
							</div>
						</div>
						<div class="content">
							<div class="rightSide">
								<div class="details">
									<div id="newsHeadLineCarousel" class="jcarousel-skin-tc">
									</div>
									<!-- #newsHeadLineCarousel -->
									<div id="newsHeadLineCarouselNav">
									</div>
									<!-- #newsHeadLineCarouselNav -->
									
									<script type="text/javascript">
										getHeadLinesFeed($("#newsHeadLine"), '<s:property  value="%{getText('topcoder.headlines.feed.url')}" />');
										//getHeadLinesFeed($("#newsHeadLine"), 'http://topcoder.com/news/feed/');
									</script> 
								</div>
							</div>
						</div>
						<div class="bottom">
							<div class="rightSide">
								<div class="inner"></div>
							</div>
						</div>
					</div>
					<!-- #newsHeadLine -->
					<div id="newsContainer">
						<div class="blackTitle">
							<span class="rightSide"><span class="inner">TopCoder
									News</span> </span>
						</div>
						<div class="content">
							<script type="text/javascript">
								getTopCoderNews($("#newsContainer .content"), '<s:property  value="%{getText('topcoder.news.feed.url')}" />');
								//getTopCoderNews($("#newsContainer .content"), 'http://community.topcoder.com/feed/');
							</script>	
							<div class="clear"></div>
							<!-- corners -->
							<span class="corners bl"></span>
							<span class="corners br"></span>

						</div>
					</div>
					<!--End #newContainer-->
					<div id="newsArchives">
						<h1>
							News Archives
						</h1>
						<ul>
							<li>
								<a href="<s:url value="%{getText('generaltopcoder.news.url')}"/>">General TopCoder News</a>
							</li>
							<li>
								<a href="<s:url value="%{getText('pressreleases.url')}"/>">Press Releases &amp; Articles</a>
							</li>
							<li>
								<a href="<s:url value="%{getText('algorithmcompetition.news.url')}"/>">Algorithm Competition News</a>
							</li>
							<li>
								<a href="<s:url value="%{getText('componentcompetition.news.url')}"/>">Component Competition News</a>
							</li>
							<li>
								<a href="<s:url value="%{getText('surveys.url')}"/>">Surveys</a>
							</li>
							<li>
								<a href="<s:url value="%{getText('problemsets.url')}"/>">Problem Sets &amp; Analyses</a>
							</li>
							<li>
								<a href="<s:url value="%{getText('tournamentnews.url')}"/>">Tournament News</a>
							</li>
							<li>
								<a href="<s:url value="%{getText('employmentopportunities.url')}"/>">Employment Opportunities</a>
							</li>
							<li>
								<a href="<s:url value="%{getText('tutorial.url')}"/>">Tutorial</a>
							</li>
							<li>
								<a href="<s:url value="%{getText('featurearticle.url')}"/>">Feature Article</a>
							</li>
							<li>
								<a href="<s:url value="%{getText('movies.url')}"/>">Movies</a>
							</li>
							<li>
								<a href="<s:url value="%{getText('podcasts.url')}"/>">Podcasts</a>
							</li>
							<li>
								<a href="<s:url value="%{getText('marathonmatch.news.url')}"/>">Marathon Match News</a>
							</li>
						</ul>
					</div>
					<!--End #newsArchives-->
				</div>
				<!--End #centerColunm-->
				<div id="rightColumn" class="sideBar">
					<s:if test="%{#handleId!='Guest'}">
						<s:include value="/includes/myprofilePanel.jsp"/>
					</s:if>
					<s:include value="/includes/momPanel.jsp"/>
					<s:include value="/includes/topTenPanel.jsp"/>
				</div>
				<!--End #rightColunm-->
				<div class="clear"></div>
			</div>
		</div>
		<s:include value="/includes/footer.jsp" />
	</body>
</html>
