<%--
  - Author: isv
  - Version: 1.0 (TopCoder Studio Member Profile Assembly)
  - Copyright (C) 2010-2012 TopCoder Inc., All Rights Reserved.
  -
  - Description: This page renders a single Member Profile page
--%>
<%@ page import="com.topcoder.web.studio.Constants" %>
<%@ page import="com.topcoder.web.common.BaseProcessor" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="studio_tags" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">

<c:set var="processorDefaultsKey" value="<%=BaseProcessor.DEFAULTS_KEY%>"/>
<c:set var="memberProfileKey" value="<%=Constants.MEMBER_PROFILE%>"/>
<c:set var="CONTEST_ID" value="<%=Constants.CONTEST_ID%>"/>
<c:set var="processorDefaults" value="${requestScope[processorDefaultsKey]}"/>
<c:set var="profile" value="${processorDefaults[memberProfileKey]}"/>

<head>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>TopCoder Studio : Studio Profile</title>
    <jsp:include page="style.jsp">
        <jsp:param name="key" value="tc_studio_profile"/>
    </jsp:include>

    <!-- external javascript -->
    <script type="text/javascript" src="/js/jquery-1.7.1.min.js"></script>
    <script src="http://cdn.jquerytools.org/1.2.6/all/jquery.tools.min.js"></script>
    <script type="text/javascript" src="/js/jquery.jqtransform.js"></script>
    <script src="/js/NewStyleHeaderFooter/scripts.js" type="text/javascript"></script>
    <script type="text/javascript" src="/js/memberProfile.js"></script>

    <script src="/js/NewStyleHeaderFooter/preloadCssImages.jQuery_v5.js" language="javascript"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            //Run the script to preload images from CSS
            $.preloadCssImages();
        });
    </script>
</head>

<body>
<div id="page-wrap">
<div>
<jsp:include page="top.jsp">
    <jsp:param name="section" value="profile"/>
</jsp:include>
<br/>

<%
boolean hidePayments = ((Boolean)request.getAttribute("hidePayments")).booleanValue();
%>

<div id="content-new">
<!-- content -->
<div class="Wrapper">
    <h1>Studio Member Profile</h1>

    <div class="contentWrapper">
        <div class="leftPart">
            <div class="panelWrapper" id="currentlyReg">
                <h2 class="titleShadow">Currently Registered</h2>

                    <c:choose>
                        <c:when test="${not empty profile.currentRegistrations}">
                            <ul id="currentRegisted">
                            <c:forEach items="${profile.currentRegistrations}" var="reg" varStatus="loop">
                                <c:if test="${loop.index mod 6 eq 0}">
                                    <li class="page">
                                    <ul>
                                </c:if>
                                <li <c:if test="${loop.index mod 6 eq 5}">class="last"</c:if>>
                                    <div class="regTitle">
				        <a class="typeIcon tooltip type${reg.contestTypeId}" href="javascript:;" style="margin-top: 10.5px; visibility: visible;">
					    <span class="tipT">Contest Type</span>
					        <span class="tipC">${reg.contestTypeName}</span>
						</a>
                                        <a href="${sessionInfo.servletPath}?module=ViewContestDetails&amp;${CONTEST_ID}=${reg.contestId}"
                                           class="contestTitleLink"><c:out value="${reg.contestName}"/></a>
                                    </div>
                                    <dl>
                                        <dt>Start Date:</dt>
                                        <dd><fmt:formatDate value="${reg.contestStartTime}" pattern="MM.dd.yyyy HH:MM"/>
                                            EST
                                        </dd>
                                    </dl>
                                    <dl>
                                        <dt>End Date:</dt>
                                        <dd><fmt:formatDate value="${reg.contestEndTime}" pattern="MM.dd.yyyy HH:MM"/>
                                            EST
                                        </dd>
                                    </dl>
                                    <dl>
                                        <dt>Purse:</dt>
                                        <dd>$<fmt:formatNumber value="${reg.contestPrizePurse}"
                                                               pattern="#,##0.00"/></dd>
                                    </dl>
                                    <dl>
                                        <dt>Points:</dt>
                                        <dd><fmt:formatNumber value="${reg.drPoints}" pattern="###0"/></dd>
                                    </dl>
                                </li>
                                <c:if test="${loop.index mod 6 eq 5 or loop.index eq (fn:length(profile.currentRegistrations) - 1)}">
                                    </ul>
                                    </li>
                                </c:if>
                            </c:forEach>
                </ul>


                <div class="paginationWrapper">
                    <a href="javascript:;" class="prevArrow">Prev</a>
                    <a href="javascript:;" class="nextArrow">Next</a>
                    <span class="pageNumbers">
                        
                    </span>
                </div>
                </c:when>
                        <c:otherwise>
                            There are no registrations
                        </c:otherwise>
                    </c:choose>
            </div>
            <!--end .panelWrapper#currentlyReg-->
        </div>
        <!--end .leftPart-->

        <div class="centerPart">
            <div class="quoteArea ${profile.displayBanner ? profile.bannerStyle : ''}}">
            </div>
            
                <div class="editBannerBtnWrapper">
                    <c:choose>
                        <c:when test="${profile.userId eq sessionInfo.userId}">
                            <a href="javascript:;" class="editBannerBtn">Edit Banner</a>
                        </c:when>
                        <c:otherwise>&nbsp;</c:otherwise>
                    </c:choose>
                </div>
            
            <div class="panelWrapper" id="winSubmission">
                <h2 class="titleShadow">Recent Winning Submissions</h2>

                <c:choose>
                    <c:when test="${not empty profile.winningSubmissions}">
                        <div class="submissionDetails">
                            <div class="bigThumbWrapper">
                                <img src="/i/bigThumbPlaceHolder.png" alt="bigThumbPlaceholder" width="224" height="224"
                                     id="xxx4"/>

                                <div class="lockedNotice hide">
                                    <h3>Submissions are not viewable for this contest.</h3>

                                    <p>There are many reasons why the submissions may not be viewable, such as the
                                        allowance of
                                        stock art, or a client's desire to keep the work private.</p>
                                </div>
                            </div>

                            <div class="regTitle">
			        <a id="xxx5" style="visibility: hidden;" href="javascript:;" class="typeIcon tooltip">
				    <span class="tipT">Contest Type</span>
				    <span class="tipC">Application Front-End Design</span>
				</a>
                                <a class="contestTitleLink" href="javascript:;" id="xxx3"></a></div>
                            <span class="rankIcon"></span>
                            <dl class="firstLine">
                                <dt>Total Prize:</dt>
                                <dd id="xxx2"></dd>
                            </dl>
                            <dl>
                                <dt>Submitted on:</dt>
                                <dd id="xxx1"></dd>
                            </dl>
                        </div>

                        <div class="caroselWrapper">
                            <a href="javascript:;" class="prevArrow">Prev</a>
                            <a href="javascript:;" class="nextArrow">Next</a>

                            <ul>
                                <c:forEach items="${profile.winningSubmissions}" var="submission" varStatus="loop">
                                    <studio_tags:memberProfileWinningSubmission submission="${submission}"
                                                                                selected="${loop.index eq 0}"/>
                                </c:forEach>
                            </ul>
                        </div>
			<div class="pageNumbers"></div>
                    </c:when>
                    <c:otherwise>
                        There are no winning submissions.
                    </c:otherwise>
                </c:choose>
            </div>
            <!--end .panelWrapper#winSubmission-->

            <div class="panelWrapper" id="recentlySubmitted">
                <h2 class="titleShadow">Recently Submitted</h2>
                <c:choose>
                    <c:when test="${not empty profile.recentSubmissions}">
                        <ul id="rSub">
                            <c:forEach items="${profile.recentSubmissions}" var="submission" varStatus="loop">
                                <c:if test="${loop.index mod 6 eq 0}">
                                    <li class="spage">
                                    <ul>
                                </c:if>
                                <studio_tags:memberProfileRecentSubmission submission="${submission}"/>

                                <c:if test="${loop.index mod 6 eq 5 or loop.index eq (fn:length(profile.recentSubmissions) - 1)}">
                                    </ul>
                                    </li>
                                </c:if>
                            </c:forEach>
                        </ul>
                        <div class="paginationWrapper">
                            <a href="javascript:;" class="prevArrow">Prev</a>
                            <a href="javascript:;" class="nextArrow">Next</a>
                    <span class="pageNumbers">
                        
                    </span>
                        </div>
                    </c:when>
                    <c:otherwise>
                        There are no submissions.
                    </c:otherwise>
                </c:choose>
            </div>
            <!--end .panelWrapper#currentlyReg-->

        </div>
        <!--end .centerPart-->

        <div class="rightPart">
            <div class="memberPhotoWrapper">
                <h2><c:out value="${profile.handle}"/></h2>
		<div class="memberPhotoBox">
		<a href="http://community.topcoder.com//tc?module=MemberProfile&cr=${profile.userId}">
                <img width="117" height="140" src="<c:if test="${not empty profile.imageUrl}">${profile.imageUrl}</c:if><c:if test="${empty profile.imageUrl}">/i/no_photo.png</c:if>" alt="Member Photo"/>
		</a>
		</div>
            </div>
            <!--end .memberPhotoWrapper-->

            <dl>
                <dt>Member Since:</dt>
                <dd><fmt:formatDate value="${profile.memberSince}" pattern="yyyy"/></dd>
            </dl>
            <% if(!hidePayments) { %>
            <dl>
                <dt>Total Earnings:</dt>
                <dd>$<fmt:formatNumber value="${profile.overallEarnings}" pattern="#,##0.00"/></dd>
            </dl>
           <% } %>
            <dl>
                <dt>Country:</dt>
                <dd><c:out value="${profile.country}"/></dd>
            </dl>
            <c:if test="${profile.userId eq sessionInfo.userId}">
            <div class="manageAccoutLink">
	    [<a href="http://community.topcoder.com/tc?module=MyHome">Manage TopCoder Account</a>]
            </div>
	    </c:if>
            <%--
                <ul class="achievementWrapper">
                    <li class="achievementItem"></li>
                    <li class="achievementItem"></li>
                    <li class="achievementItem lastOfRow"></li>
                    <li class="achievementItem"></li>
                </ul>
            --%>
            <!--end .achievementWrapper-->
        </div>
        <!--end .rightPart-->

        <div class="clearFix"></div>
    </div>
    <!--end .contentWrapper-->
</div>
<!--end .Wrapper-->

<!-- Start modal -->
<div id="modalBackground"></div>

<div id="modal" class="noShow">
    <div class="modalPanel" id="personalBanner">
        <div class="modalHeader">
            <h3 class="titleShadow">Personal Banner</h3>
            <a href="javascript:;" class="closePanel"></a>
        </div>
        <!-- end .modalHeader -->
        <div class="modalBody">
            <form id="QuoteBannerForm" action="">
                <input name="bannerStyle" id="bannerStyleInput" type="hidden" value="${profile.bannerStyle}"/>
            <div class="quoteSettingWrapper">
                <div class="checkBoxWrapper">
                    <input name="isDisplayQuote" type="checkbox" class="checkInput" value="1" id="isDisplayQuote"
                           <c:if test="${profile.displayQuote}">checked="checked"</c:if>/>
                    <label class="checkboxLabel">Display quote on profile page</label>
                </div>
                <h4>QUOTE SETTINGS</h4>

                <input name="quoteTxt" type="text" class="text fullRowTextInpu" maxlength="200"
                       value="<c:out value="${profile.quote}"/>"/>

                <div class="formLineWithLabel raidoLine">
                    <div class="formLineLabel">Quote Location:</div>
                    <span class="radioItem firstRadioItemOfRow">
                        <input name="quoteLocation" type="radio" class="radioInput" value="tl" 
                               <c:if test="${profile.quoteLocation eq 'tl'}">checked="checked"</c:if>/>
                        <label class="radioLabel">Top Left</label>
                    </span>
                    <span class="radioItem">
                        <input name="quoteLocation" type="radio" class="radioInput" value="tr"
                               <c:if test="${profile.quoteLocation eq 'tr'}">checked="checked"</c:if>/>
                        <label class="radioLabel">Top Right</label>
                    </span>
                    <span class="radioItem lastRadioItemOfRow">
                        <input name="quoteLocation" type="radio" class="radioInput" value="md"
                               <c:if test="${profile.quoteLocation eq 'md'}">checked="checked"</c:if>/>
                        <label class="radioLabel">Middle</label>
                    </span>
                    <span class="radioItem firstRadioItemOfRow">
                        <input name="quoteLocation" type="radio" class="radioInput" value="lf"
                               <c:if test="${profile.quoteLocation eq 'lf'}">checked="checked"</c:if>/>
                        <label class="radioLabel">Left</label>
                    </span>
                    <span class="radioItem">
                        <input name="quoteLocation" type="radio" class="radioInput" value="rt"
                               <c:if test="${profile.quoteLocation eq 'rt'}">checked="checked"</c:if>/>
                        <label class="radioLabel">Right</label>
                    </span>
                    <span class="radioItem lastRadioItemOfRow">
                        <input name="quoteLocation" type="radio" class="radioInput" value="ct" id="quoteLocationCT"
                               <c:if test="${fn:startsWith(profile.quoteLocation, 'ct')}">checked="checked"</c:if>/>
                        <label class="radioLabel">Custom:</label>
                        <span class="customizedPosition <c:if test="${not fn:startsWith(profile.quoteLocation, 'ct')}">customizedPositionDisabled</c:if>">
                            x:  <input name="xVal" type="text" class="text positionVal" id="xValInput"
                                       <c:if test="${not fn:startsWith(profile.quoteLocation, 'ct')}">disabled="disabled"</c:if> 
                                       value="${fn:split(profile.quoteLocation, ' ')[1]}"/>
                            y:  <input name="yVal" type="text" class="text positionVal" id="yValInput"
                                       <c:if test="${not fn:startsWith(profile.quoteLocation, 'ct')}">disabled="disabled"</c:if>
                                       value="${fn:split(profile.quoteLocation, ' ')[2]}"/>
                        </span>
                        <br/>
                        <span class="hide" id="xyErrors" style="color:red">X and Y must be positive numbers</span>
                    </span>
                    <span class="radioItem firstRadioItemOfRow">
                        <input name="quoteLocation" type="radio" class="radioInput" value="bl"
                               <c:if test="${profile.quoteLocation eq 'bl'}">checked="checked"</c:if>/>
                        <label class="radioLabel">Bottom Left</label>
                    </span>
                    <span class="radioItem">
                        <input name="quoteLocation" type="radio" class="radioInput" value="br"
                               <c:if test="${profile.quoteLocation eq 'br'}">checked="checked"</c:if>/>
                        <label class="radioLabel">Bottom Right</label>
                    </span>
                </div>
                <div class="formLineWithLabel comboLine">
                    <div class="formLineLabel">Text Color:</div>
                    <select name="quoteTextColorSelect" class="quoteTextColorSelect">
                        <option value="#00FF00" <c:if test="${profile.quoteColor eq '#00FF00'}">selected="selected"</c:if>>Topcoder Blue</option>
                        <option value="#FF0000" <c:if test="${profile.quoteColor eq '#FF0000'}">selected="selected"</c:if>>Topcoder Red</option>
                        <option value="#FFFFFF" <c:if test="${profile.quoteColor eq '#FFFFFF'}">selected="selected"</c:if>>White</option>
                        <option value="#000000" <c:if test="${profile.quoteColor eq '#000000'}">selected="selected"</c:if>>Black</option>
                    </select>
                </div>
                <div class="disableMask" id="m1"></div>
            </div>
            <!-- end .quoteSettingWrapper -->

            <div class="quoteSettingWrapper quoteWp">
                <h4>PREVIEW</h4>

                <div class="previewArea noShow">
                    <span><c:out value="${profile.quote}"/></span>
                </div>
            </div>
            <!-- end .quoteSettingWrapper -->

            <div class="quoteSettingWrapper quoteWp lastQuoteSettingWrapper">
                <div class="checkBoxWrapper">
                    <input name="isDisplayBanner" type="checkbox" class="checkInput" value="1"
                           <c:if test="${profile.displayBanner}">checked="checked"</c:if>/>
                    <label class="checkboxLabel">Display banner on profile page</label>
                </div>
                <h4>BANNER SETTINGS</h4>
                <ul class="bannerSelectionArea">
                    <li <c:if test="${profile.bannerStyle eq 'bannerStyle1'}">class="selected"</c:if>>
                        <div class="">
                            <div class="selectedBack bannerStyle1">
                                <div class="triangle"></div>
                            </div>
                        </div>
                    </li>
                    <li <c:if test="${profile.bannerStyle eq 'bannerStyle2'}">class="selected"</c:if>>
                        <div class="">
                            <div class="selectedBack bannerStyle2">
                                <div class="triangle"></div>
                            </div>
                        </div>
                    </li>
                    <li <c:if test="${profile.bannerStyle eq 'bannerStyle3'}">class="selected"</c:if>>
                        <div class="">
                            <div class="selectedBack bannerStyle3">
                                <div class="triangle"></div>
                            </div>
                        </div>
                    </li>
                    <li <c:if test="${profile.bannerStyle eq 'bannerStyle4'}">class="selected"</c:if>>
                        <div class="">
                            <div class="selectedBack bannerStyle4">
                                <div class="triangle"></div>
                            </div>
                        </div>
                    </li>
                    <li <c:if test="${profile.bannerStyle eq 'bannerStyle5'}">class="selected"</c:if>>
                        <div class="">
                            <div class="selectedBack bannerStyle5">
                                <div class="triangle"></div>
                            </div>
                        </div>
                    </li>
                    <li <c:if test="${profile.bannerStyle eq 'bannerStyle6'}">class="selected"</c:if>>
                        <div class="">
                            <div class="selectedBack bannerStyle6">
                                <div class="triangle"></div>
                            </div>
                        </div>
                    </li>
                    <li <c:if test="${profile.bannerStyle eq 'bannerStyle7'}">class="selected"</c:if>>
                        <div class="">
                            <div class="selectedBack bannerStyle7">
                                <div class="triangle"></div>
                            </div>
                        </div>
                    </li>
                    <li <c:if test="${profile.bannerStyle eq 'bannerStyle8'}">class="selected"</c:if>>
                        <div class="">
                            <div class="selectedBack bannerStyle8">
                                <div class="triangle"></div>
                            </div>
                        </div>
                    </li>
                    <li <c:if test="${profile.bannerStyle eq 'bannerStyle9'}">class="selected"</c:if>>
                        <div class="">
                            <div class="selectedBack bannerStyle9">
                                <div class="triangle"></div>
                            </div>
                        </div>
                    </li>
                    <li <c:if test="${profile.bannerStyle eq 'bannerStyle10'}">class="selected"</c:if>>
                        <div class="">
                            <div class="selectedBack bannerStyle10">
                                <div class="triangle"></div>
                            </div>
                        </div>
                    </li>
                    <li <c:if test="${profile.bannerStyle eq 'bannerStyle11'}">class="selected"</c:if>>
                        <div class="">
                            <div class="selectedBack bannerStyle11">
                                <div class="triangle"></div>
                            </div>
                        </div>
                    </li>
                    <li <c:if test="${profile.bannerStyle eq 'bannerStyle12'}">class="selected"</c:if>>
                        <div class="">
                            <div class="selectedBack bannerStyle12">
                                <div class="triangle"></div>
                            </div>
                        </div>
                    </li>
                    <li <c:if test="${profile.bannerStyle eq 'bannerStyle13'}">class="selected"</c:if>>
                        <div class="">
                            <div class="selectedBack bannerStyle13">
                                <div class="triangle"></div>
                            </div>
                        </div>
                    </li>
                    <li <c:if test="${profile.bannerStyle eq 'bannerStyle14'}">class="selected"</c:if>>
                        <div class="">
                            <div class="selectedBack bannerStyle14">
                                <div class="triangle"></div>
                            </div>
                        </div>
                    </li>
                    <li <c:if test="${profile.bannerStyle eq 'bannerStyle15'}">class="selected"</c:if>>
                        <div class="">
                            <div class="selectedBack bannerStyle15">
                                <div class="triangle"></div>
                            </div>
                        </div>
                    </li>
                    <li <c:if test="${profile.bannerStyle eq 'bannerStyle16'}">class="selected"</c:if>>
                        <div class="">
                            <div class="selectedBack bannerStyle16">
                                <div class="triangle"></div>
                            </div>
                        </div>
                    </li>
                    <li <c:if test="${profile.bannerStyle eq 'bannerStyle17'}">class="selected"</c:if>>
                        <div class="">
                            <div class="selectedBack bannerStyle17">
                                <div class="triangle"></div>
                            </div>
                        </div>
                    </li>
                </ul>
                <div class="disableMask" id="m2"></div>
            </div>
            <!-- end .quoteSettingWrapper -->
            </form>
        </div>
        <!-- end .modalBody -->
        <div class="bannerContainer">
            <span id="discardChanges"
               class="btn blueBtnProfile discardChanges"><span style="display: block;"><span style="display: block;">Cancel</span></span></span>
            <span class="btn blueBtnProfile updateChanges" id="updateChanges"><span
                    style="display: block;"><span style="display: block;">Save</span></span></span>
        </div>
        <!-- end .bannerContainer -->
    </div>
    <!--end #personalBanner-->
</div>
<!-- content -->
</div>

<jsp:include page="foot.jsp"/>

<div class="tooltipsBox" id="tooltipsBox1">
    <div class="tooltipsH"><h6></h6></div>
    <div class="tooltipsC"><p></p></div>
    <div class="tooltipsF"></div>
</div>
</body>
</html>
