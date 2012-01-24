<%@ include file="taglibs.jsp" %>

<c:set var="overviewClass" value="${requestScope.SITE_AREA eq 'overview' ? 'actived' : ''}"/>
<c:set var="algorithmClass" value="${requestScope.SITE_AREA eq 'algorithm' ? 'actived' : ''}"/>
<c:set var="designClass" value="${requestScope.SITE_AREA eq 'design' ? 'actived' : ''}"/>
<c:set var="developmentClass" value="${requestScope.SITE_AREA eq 'development' ? 'actived' : ''}"/>
<c:set var="marathonClass" value="${requestScope.SITE_AREA eq 'marathon' ? 'actived' : ''}"/>
<c:set var="moddashClass" value="${requestScope.SITE_AREA eq 'moddash' ? 'actived' : ''}"/>
<c:set var="studioClass" value="${requestScope.SITE_AREA eq 'studio' ? 'actived' : ''}"/>
<c:set var="arenaClass" value="${requestScope.SITE_AREA eq 'arena' ? 'actived' : ''}"/>

<div class="innerBottom"><!-- gray frame bottom wrapper -->
    <span class="innerLeftBottom"></span><!-- gray frame left bottom corner image-->
    <span class="innerRightBottom"></span><!-- gray frame right bottom corner image -->
</div><!-- End .innerBottom-->

<div id="menu">
    <div class="backgroundTop"><!-- gray frame top shadow -->
        <span class="leftCorner"></span><!-- gray frame left top corner image-->
        <span class="rightCorner"></span><!-- gray frame right bottom corner image-->
    </div>
    <!--End .backgroundTop-->
    <ul>
        <li class="${overviewClass} first overview">
            <span class="topIcon blue"></span><!--  item top sign -->
            <tco10:overviewStaticPageLink page="overview" styleClass="${overviewClass}">
                <span class="itemIcon"></span><!-- item photo -->
                <span class="itemText"></span><!-- item text content -->
                Overview
            </tco10:overviewStaticPageLink>
        </li>
        <li class="${algorithmClass} algorithm">
            <span class="topIcon green"></span><!--  item top sign -->
            <tco10:algorithmStaticPageLink page="description" styleClass="${algorithmClass}">
                <span class="itemIcon"></span><!-- item photo -->
                <span class="itemText"></span><!-- item text content -->
                Algorithm
            </tco10:algorithmStaticPageLink>
        </li>
        <li class="${designClass} design">
            <span class="topIcon orange"></span><!--  item top sign -->
            <tco10:designStaticPageLink page="description" styleClass="${designClass}">
                <span class="itemIcon"></span><!-- item photo -->
                <span class="itemText"></span><!-- item text content -->
                Design
            </tco10:designStaticPageLink>
        </li>
        <li class="${developmentClass} development">
            <span class="topIcon green"></span><!--  item top sign -->
            <tco10:developmentStaticPageLink page="description" styleClass="${developmentClass}">
                <span class="itemIcon"></span><!-- item photo -->
                <span class="itemText"></span><!-- item text content -->
                Development
            </tco10:developmentStaticPageLink>
        </li>
        <li class="${marathonClass} marathon">
            <span class="topIcon blue"></span><!--  item top sign -->
            <tco10:marathonStaticPageLink page="description" styleClass="${marathonClass}">
                <span class="itemIcon"></span><!-- item photo -->
                <span class="itemText"></span><!-- item text content -->
                Marathon
            </tco10:marathonStaticPageLink>
        </li>
        <li class="${moddashClass} moddash">
            <span class="topIcon green"></span><!--  item top sign -->
            <tco10:moddashStaticPageLink page="description" styleClass="${moddashClass}">
                <span class="itemIcon"></span><!-- item photo -->
                <span class="itemText"></span><!-- item text content -->
                ModDash
            </tco10:moddashStaticPageLink>
        </li>
        <li class="${studioClass} studio">
            <span class="topIcon orange"></span><!--  item top sign -->
            <tco10:studioStaticPageLink page="description" styleClass="${studioClass}">
                <span class="itemIcon"></span><!-- item photo -->
                <span class="itemText"></span><!-- item text content -->
                Studio
            </tco10:studioStaticPageLink>
        </li>
        <li class="${arenaClass} last arena">
            <span class="topIcon blue"></span><!--  item top sign -->
            <a href="javascript:arena();">
                <span class="itemIcon"></span><!-- item photo -->
                <span class="itemText"></span><!-- item text content -->
                Arena
            </a>
        </li>
    </ul>
</div>
<!--End .menu-->
