<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../includes/taglibs.jsp" %>

<tco10:pageSetup title="TCO 10 : Studio Competition Bracket" area="studio" menu="advancers" subMenu="bracket"/>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <jsp:include page="../includes/htmlhead.jsp"/>
</head>

<body>

<div id="wrapper" class="homepage singlePage"><!-- the outest whole website wrapper -->

    <jsp:include page="../includes/logo.jsp"/>

    <div id="content">
        <div class="contentInner">

            <jsp:include page="../includes/menu.jsp"/>

            <div id="mainbody" class="singleMainBody"><!-- below menu ,main content -->
                <span class="leftTop"></span><!-- main content left top corner -->
                <span class="rightTop"></span><!-- main content right top corner -->
                <span class="leftBottom"></span><!-- main content left bottom corner -->
                <span class="rightBottom"></span><!-- main conent right bottom corner -->

                <jsp:include page="subMenu.jsp"/>

                <div class="bigColumn">
                    <div class="text">
                    <h2 class="pageTitle">Congratulations Studio Semifinalists!</h2><!-- page title -->
                           <table cellpadding="0" cellspacing="0"><!-- Start table list -->
                                <tr>
                                    <th class="first" ><span class="left"></span>Semifinalists - Round 1 </th>
                                    <!-- table left top corner -->
                                    <th class="last"><span class="right">&nbsp;</span></th><!-- table right top corner -->
                            	</tr>
                            	<tr class="last">
                                      <td colspan="2"><a href="http://studio.topcoder.com/?module=ViewMemberProfile&ha=oninkxronda" target="_blank">oninkxronda</a></td>
                                 </tr>
                                <tr class="last">
                                      <td colspan="2"><a href="http://studio.topcoder.com/?module=ViewMemberProfile&ha=djackmania" target="_blank">djackmania</a></td>
                                 </tr>
                                <tr class="last">
                                      <td colspan="2"><a href="http://studio.topcoder.com/?module=ViewMemberProfile&ha=mahestro" target="_blank">mahestro</a></td>
                                  </tr>
                                  <tr class="last">
                                      <td colspan="2"><a href="http://studio.topcoder.com/?module=ViewMemberProfile&ha=daddum" target="_blank">daddum</a></td>
                                  </tr>
                                  <tr class="last">
                                      <td colspan="2"><a href="http://studio.topcoder.com/?module=ViewMemberProfile&ha=idblack" target="_blank">idblack</a></td>
                                  </tr>
                          </table>
                          <br />
                           <table cellpadding="0" cellspacing="0"><!-- Start table list -->
                                <tr>
                                    <th class="first" ><span class="left"></span>Semifinalists - Round 2 </th>
                                    <!-- table left top corner -->
                                    <th class="last"><span class="right">&nbsp;</span></th><!-- table right top corner -->
                            	</tr>
                            	<tr class="last">
                                      <td colspan="2"><a href="http://studio.topcoder.com/?module=ViewMemberProfile&ha=djnapier" target="_blank">djnapier</a></td>
                                 </tr>
                                <tr class="last">
                                      <td colspan="2"><a href="http://studio.topcoder.com/?module=ViewMemberProfile&ha=abedavera" target="_blank">abedavera</a></td>
                                 </tr>
                                <tr class="last">
                                      <td colspan="2"><a href="http://studio.topcoder.com/?module=ViewMemberProfile&ha=puchki" target="_blank">puchki</a></td>
                                  </tr>
                                  <tr class="last">
                                      <td colspan="2"><a href="http://studio.topcoder.com/?module=ViewMemberProfile&ha=CMYK" target="_blank">CMYK</a></td>
                                  </tr>
                                  <tr class="last">
                                      <td colspan="2"><a href="http://studio.topcoder.com/?module=ViewMemberProfile&ha=kathymak" target="_blank">kathymak</a></td>
                                  </tr>
                          </table>
                </div></div>

                <jsp:include page="../includes/sponsors.jsp"/>

                <div class="clear"></div>
            </div>
            <!--End .mainbody-->

        </div>
        <!--End .contentInner-->
    </div>
    <!--End .content-->

    <jsp:include page="../includes/footer.jsp"/>

</div>
<!--End .wrapper-->

</body>
</html>
