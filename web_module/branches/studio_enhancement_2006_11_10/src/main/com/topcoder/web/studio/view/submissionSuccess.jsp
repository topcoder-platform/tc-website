<%@ page contentType="text/html;charset=utf-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ taglib uri="studio.tld" prefix="studio" %>

<html>
<head>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>TopCoder Studio</title>
    <jsp:include page="style.jsp">
        <jsp:param name="key" value="tc_studio"/>
    </jsp:include>
    <script language="javascript" type="text/javascript">
        <!--
        var objPopUp = null;
        function popUp(objectID) {
            objPopUp = document.getElementById(objectID);
            objPopUp.style.visibility = 'visible';
        }
        function popHide() {
            objPopUp.style.visibility = 'hidden';
            objPopUp = null;
        }
        // -->
    </script>
    <STYLE TYPE="text/css">
        div.container {
            display: block;
            width: 20px;
            text-align: center;
            position: relative;
            margin: 0px;
            padding: 0px;
        }

        div.popUp {
            visibility: hidden;
            position: absolute;
            top: 20px;
            left: 20px;
            z-index: 1;
        }

        div.popUp div {
            float: left;
            font-size: 11px;
            line-height: normal;
            background: #FFFFCC;
            border: 1px solid #999999;
            padding: 6px;
            text-align: left;
            white-space: nowrap;
        }
    </STYLE>
</head>

<body>
<div align="center">
    <div class="contentOut">
        <jsp:include page="top.jsp"/>
        <jsp:include page="topNav.jsp">
            <jsp:param name="node" value="contests"/>
        </jsp:include>
        <div class="contentIn">
            <img src="/i/layout/contentInN.gif" alt="" style="display:block;"/>

            <div class="contentSpacer">

                <div class="linkBox"><studio:forumLink forumID="${contest.forumId}"/></div>

                <div class="breadcrumb">
                    <A href="${sessionInfo.servletPath}?module=ViewActiveContests">Active Contests</A>
                    &gt; ${contest.name}
                </div>

                <h1>Submission Successfully Uploaded</h1>

                <div align="center">
                    <div align="left" style="width:500px; margin-top: 20px;">
                        Your Submission Has Been Uploaded
                        <br><br>
                        Please allow at least 24 hours for processing. If your submission does not pass screening, you
                        will receive an
                        email with a list of any requirements that it failed to meet.
                        <br><br>
                        Thank you.
                        <br><br>
                    </div>
                </div>

<div style="margin: 40px 0px 20px 0px;">
<table class="stat" cellpadding="0" cellspacing="0" style="width:740px;">
<tbody>
    <tr>
        <td class="NW">&nbsp;</td>
        <td class="title" colspan="7">My Ranked Submissions for this contest</td>
        <td class="NE">&nbsp;</td>
    </tr>
    <tr>
        <td class="headerW"><div>&nbsp;</div></td>
        <td class="headerC" >
        Ranking
        <div><A href="#"><img src="/i/layout/btnUpdateDk.png" alt="Update ranking" onmouseover="this.src = '/i/layout/btnUpdateDkOn.png';" onmouseout="this.src = '/i/layout/btnUpdateDk.png';" /></A></div>
        </td>
        <td class="header" colspan="2" width="33%">
        Submission
        </td>
        <td class="headerC" width="33%">
        Date Submitted
        </td>
        <td class="headerC" width="33%">
        Passed / Failed
        </td>
        <td class="headerC" nowrap>
        Move Up /<br>Move Down
        </td>
        <td class="headerC" nowrap>
        Move to<br>Top
        </td>
        <td class="headerE"><div>&nbsp;</div></td>
    </tr>
    <% boolean even = true; int i = 1; %>
    <tr class="<%=even?"highlightLt":"highlightLtDk"%>">
        <td class="valueW"><div>&nbsp;</div></td>
        <td class="valueC">
        <input type="text" maxlength="3" class="" name="" value="<%=i%>" size="1" align="center">
        </td>
        <td class="value">
        studio_submission_2.zip
        </td>
        <td class="value">
            <div class="container">
                <a href=""><img src="/i/layout/magnify.gif" alt="View submission" border="0" onmouseover="popUp('pop<%=i%>')" onmouseout="popHide()"/></a>
                <div id="pop<%=i%>" class="popUp"><div>View submission</div></div>
            </div>
        </td>
        <td class="valueC">
        11.03.2006 17:19 EST
        </td>
        <td class="valueC">
        <span class="bigGreen">Passed</span>
        </td>
        <td class="valueC">
        <div align="center" style="margin:2px;"><A href="" onfocus="this.blur();"><img src="/i/layout/btnMoveUp.png" alt="Move up" onmouseover="this.src = '/i/layout/btnMoveUpOn.png';" onmouseout="this.src = '/i/layout/btnMoveUp.png';" /></A></div>
        <div align="center" style="margin:2px;"><A href="" onfocus="this.blur();"><img src="/i/layout/btnMoveDown.png" alt="Move down" onmouseover="this.src = '/i/layout/btnMoveDownOn.png';" onmouseout="this.src = '/i/layout/btnMoveDown.png';" /></A></div>
        </td>
        <td class="valueC">
        <div align="center"><A href="" onfocus="this.blur();"><img src="/i/layout/btnMoveToTop.png" alt="Move to top" onmouseover="this.src = '/i/layout/btnMoveToTopOn.png';" onmouseout="this.src = '/i/layout/btnMoveToTop.png';" /></A></div>
        </td>
        <td class="valueE"><div>&nbsp;</div></td>
    </tr>
    <% even = !even; i++; %>
    <tr class="<%=even?"highlightLt":"highlightLtDk"%>">
        <td class="valueW"><div>&nbsp;</div></td>
        <td class="valueC">
        <input type="text" maxlength="3" class="" name="" value="<%=i%>" size="1" align="center">
        </td>
        <td class="value">
        studio_submission_2.zip
        </td>
        <td class="value">
            <div class="container">
                <a href=""><img src="/i/layout/magnify.gif" alt="View submission" border="0" onmouseover="popUp('pop<%=i%>')" onmouseout="popHide()"/></a>
                <div id="pop<%=i%>" class="popUp"><div>View submission</div></div>
            </div>
        </td>
        <td class="valueC">
        11.03.2006 17:19 EST
        </td>
        <td class="valueC">
        <span class="bigGreen">Passed</span>
        </td>
        <td class="valueC">
        <div align="center" style="margin:2px;"><A href="" onfocus="this.blur();"><img src="/i/layout/btnMoveUp.png" alt="Move up" onmouseover="this.src = '/i/layout/btnMoveUpOn.png';" onmouseout="this.src = '/i/layout/btnMoveUp.png';" /></A></div>
        <div align="center" style="margin:2px;"><A href="" onfocus="this.blur();"><img src="/i/layout/btnMoveDown.png" alt="Move down" onmouseover="this.src = '/i/layout/btnMoveDownOn.png';" onmouseout="this.src = '/i/layout/btnMoveDown.png';" /></A></div>
        </td>
        <td class="valueC">
        <div align="center"><A href="" onfocus="this.blur();"><img src="/i/layout/btnMoveToTop.png" alt="Move to top" onmouseover="this.src = '/i/layout/btnMoveToTopOn.png';" onmouseout="this.src = '/i/layout/btnMoveToTop.png';" /></A></div>
        </td>
        <td class="valueE"><div>&nbsp;</div></td>
    </tr>
    <% even = !even; i++; %>
    <tr class="<%=even?"highlightLt":"highlightLtDk"%>">
        <td class="valueW"><div>&nbsp;</div></td>
        <td class="valueC">
        <input type="text" maxlength="3" class="" name="" value="<%=i%>" size="1" align="center">
        </td>
        <td class="value">
        studio_submission_2.zip
        </td>
        <td class="value">
            <div class="container">
                <a href=""><img src="/i/layout/magnify.gif" alt="View submission" border="0" onmouseover="popUp('pop<%=i%>')" onmouseout="popHide()"/></a>
                <div id="pop<%=i%>" class="popUp"><div>View submission</div></div>
            </div>
        </td>
        <td class="valueC">
        11.03.2006 17:19 EST
        </td>
        <td class="valueC">
        <span class="bigGreen">Passed</span>
        </td>
        <td class="valueC">
        <div align="center" style="margin:2px;"><A href="" onfocus="this.blur();"><img src="/i/layout/btnMoveUp.png" alt="Move up" onmouseover="this.src = '/i/layout/btnMoveUpOn.png';" onmouseout="this.src = '/i/layout/btnMoveUp.png';" /></A></div>
        <div align="center" style="margin:2px;"><A href="" onfocus="this.blur();"><img src="/i/layout/btnMoveDown.png" alt="Move down" onmouseover="this.src = '/i/layout/btnMoveDownOn.png';" onmouseout="this.src = '/i/layout/btnMoveDown.png';" /></A></div>
        </td>
        <td class="valueC">
        <div align="center"><A href="" onfocus="this.blur();"><img src="/i/layout/btnMoveToTop.png" alt="Move to top" onmouseover="this.src = '/i/layout/btnMoveToTopOn.png';" onmouseout="this.src = '/i/layout/btnMoveToTop.png';" /></A></div>
        </td>
        <td class="valueE"><div>&nbsp;</div></td>
    </tr>
    <% even = !even; i++; %>
    <tr class="<%=even?"highlightLt":"highlightLtDk"%>">
        <td class="valueW"><div>&nbsp;</div></td>
        <td class="valueC">
        <input type="text" maxlength="3" class="" name="" value="<%=i%>" size="1" align="center">
        </td>
        <td class="value">
        studio_submission_2.zip
        </td>
        <td class="value">
            <div class="container">
                <a href=""><img src="/i/layout/magnify.gif" alt="View submission" border="0" onmouseover="popUp('pop<%=i%>')" onmouseout="popHide()"/></a>
                <div id="pop<%=i%>" class="popUp"><div>View submission</div></div>
            </div>
        </td>
        <td class="valueC">
        11.03.2006 17:19 EST
        </td>
        <td class="valueC">
        <span class="bigGreen">Passed</span>
        </td>
        <td class="valueC">
        <div align="center" style="margin:2px;"><A href="" onfocus="this.blur();"><img src="/i/layout/btnMoveUp.png" alt="Move up" onmouseover="this.src = '/i/layout/btnMoveUpOn.png';" onmouseout="this.src = '/i/layout/btnMoveUp.png';" /></A></div>
        <div align="center" style="margin:2px;"><A href="" onfocus="this.blur();"><img src="/i/layout/btnMoveDown.png" alt="Move down" onmouseover="this.src = '/i/layout/btnMoveDownOn.png';" onmouseout="this.src = '/i/layout/btnMoveDown.png';" /></A></div>
        </td>
        <td class="valueC">
        <div align="center"><A href="" onfocus="this.blur();"><img src="/i/layout/btnMoveToTop.png" alt="Move to top" onmouseover="this.src = '/i/layout/btnMoveToTopOn.png';" onmouseout="this.src = '/i/layout/btnMoveToTop.png';" /></A></div>
        </td>
        <td class="valueE"><div>&nbsp;</div></td>
    </tr>
    <% even = !even; i++; %>
    <tr class="<%=even?"highlightLt":"highlightLtDk"%>">
        <td class="valueW"><div>&nbsp;</div></td>
        <td class="valueC">
        <input type="text" maxlength="3" class="" name="" value="<%=i%>" size="1" align="center">
        </td>
        <td class="value">
        studio_submission_2.zip
        </td>
        <td class="value">
            <div class="container">
                <a href=""><img src="/i/layout/magnify.gif" alt="View submission" border="0" onmouseover="popUp('pop<%=i%>')" onmouseout="popHide()"/></a>
                <div id="pop<%=i%>" class="popUp"><div>View submission</div></div>
            </div>
        </td>
        <td class="valueC">
        11.03.2006 17:19 EST
        </td>
        <td class="valueC">
        Pending
        </td>
        <td class="valueC">
        <div align="center" style="margin:2px;"><A href="" onfocus="this.blur();"><img src="/i/layout/btnMoveUp.png" alt="Move up" onmouseover="this.src = '/i/layout/btnMoveUpOn.png';" onmouseout="this.src = '/i/layout/btnMoveUp.png';" /></A></div>
        <div align="center" style="margin:2px;"><A href="" onfocus="this.blur();"><img src="/i/layout/btnMoveDown.png" alt="Move down" onmouseover="this.src = '/i/layout/btnMoveDownOn.png';" onmouseout="this.src = '/i/layout/btnMoveDown.png';" /></A></div>
        </td>
        <td class="valueC">
        <div align="center"><A href="" onfocus="this.blur();"><img src="/i/layout/btnMoveToTop.png" alt="Move to top" onmouseover="this.src = '/i/layout/btnMoveToTopOn.png';" onmouseout="this.src = '/i/layout/btnMoveToTop.png';" /></A></div>
        </td>
        <td class="valueE"><div>&nbsp;</div></td>
    </tr>
    <% even = !even; i++; %>
    <tr class="<%=even?"light":"dark"%>">
        <td class="valueW"><div>&nbsp;</div></td>
        <td class="valueC">
        <input type="text" maxlength="3" class="" name="" value="<%=i%>" size="1" align="center">
        </td>
        <td class="value">
        studio_submission_2.zip
        </td>
        <td class="value">
            <div class="container">
                <a href=""><img src="/i/layout/magnify.gif" alt="View submission" border="0" onmouseover="popUp('pop<%=i%>')" onmouseout="popHide()"/></a>
                <div id="pop<%=i%>" class="popUp"><div>View submission</div></div>
            </div>
        </td>
        <td class="valueC">
        11.03.2006 17:19 EST
        </td>
        <td class="valueC">
        Pending
        </td>
        <td class="valueC">
        <div align="center" style="margin:2px;"><A href="" onfocus="this.blur();"><img src="/i/layout/btnMoveUp.png" alt="Move up" onmouseover="this.src = '/i/layout/btnMoveUpOn.png';" onmouseout="this.src = '/i/layout/btnMoveUp.png';" /></A></div>
        <div align="center" style="margin:2px;"><A href="" onfocus="this.blur();"><img src="/i/layout/btnMoveDown.png" alt="Move down" onmouseover="this.src = '/i/layout/btnMoveDownOn.png';" onmouseout="this.src = '/i/layout/btnMoveDown.png';" /></A></div>
        </td>
        <td class="valueC">
        <div align="center"><A href="" onfocus="this.blur();"><img src="/i/layout/btnMoveToTop.png" alt="Move to top" onmouseover="this.src = '/i/layout/btnMoveToTopOn.png';" onmouseout="this.src = '/i/layout/btnMoveToTop.png';" /></A></div>
        </td>
        <td class="valueE"><div>&nbsp;</div></td>
    </tr>
    <% even = !even; i++; %>
    <tr class="<%=even?"light":"dark"%>">
        <td class="valueW"><div>&nbsp;</div></td>
        <td class="valueC">
        <input type="text" maxlength="3" class="" name="" value="<%=i%>" size="1" align="center">
        </td>
        <td class="value">
        studio_submission_3.zip
        </td>
        <td class="value">
            <div class="container">
                <a href=""><img src="/i/layout/magnify.gif" alt="View submission" border="0" onmouseover="popUp('pop<%=i%>')" onmouseout="popHide()"/></a>
                <div id="pop<%=i%>" class="popUp"><div>View submission</div></div>
            </div>
        </td>
        <td class="valueC">
        11.04.2006 17:19 EST
        </td>
        <td class="valueC">
        Pending
        </td>
        <td class="valueC">
        <div align="center" style="margin:2px;"><A href="" onfocus="this.blur();"><img src="/i/layout/btnMoveUp.png" alt="Move up" onmouseover="this.src = '/i/layout/btnMoveUpOn.png';" onmouseout="this.src = '/i/layout/btnMoveUp.png';" /></A></div>
        <div align="center" style="margin:2px;"><A href="" onfocus="this.blur();"><img src="/i/layout/btnMoveDown.png" alt="Move down" onmouseover="this.src = '/i/layout/btnMoveDownOn.png';" onmouseout="this.src = '/i/layout/btnMoveDown.png';" /></A></div>
        </td>
        <td class="valueC">
        <div align="center"><A href="" onfocus="this.blur();"><img src="/i/layout/btnMoveToTop.png" alt="Move to top" onmouseover="this.src = '/i/layout/btnMoveToTopOn.png';" onmouseout="this.src = '/i/layout/btnMoveToTop.png';" /></A></div>
        </td>
        <td class="valueE"><div>&nbsp;</div></td>
    </tr>
    <% even = !even; i++;%>
    <tr class="<%=even?"light":"dark"%>">
        <td class="valueW"><div>&nbsp;</div></td>
        <td class="valueC">
        <input type="text" maxlength="3" class="" name="" value="<%=i%>" size="1" align="center">
        </td>
        <td class="value">
        studio_submission_3.zip
        </td>
        <td class="value">
            <div class="container">
                <a href=""><img src="/i/layout/magnify.gif" alt="View submission" border="0" onmouseover="popUp('pop<%=i%>')" onmouseout="popHide()"/></a>
                <div id="pop<%=i%>" class="popUp"><div>View submission</div></div>
            </div>
        </td>
        <td class="valueC">
        11.04.2006 17:19 EST
        </td>
        <td class="valueC">
        Pending
        </td>
        <td class="valueC">
        <div align="center" style="margin:2px;"><A href="" onfocus="this.blur();"><img src="/i/layout/btnMoveUp.png" alt="Move up" onmouseover="this.src = '/i/layout/btnMoveUpOn.png';" onmouseout="this.src = '/i/layout/btnMoveUp.png';" /></A></div>
        <div align="center" style="margin:2px;"><A href="" onfocus="this.blur();"><img src="/i/layout/btnMoveDown.png" alt="Move down" onmouseover="this.src = '/i/layout/btnMoveDownOn.png';" onmouseout="this.src = '/i/layout/btnMoveDown.png';" /></A></div>
        </td>
        <td class="valueC">
        <div align="center"><A href="" onfocus="this.blur();"><img src="/i/layout/btnMoveToTop.png" alt="Move to top" onmouseover="this.src = '/i/layout/btnMoveToTopOn.png';" onmouseout="this.src = '/i/layout/btnMoveToTop.png';" /></A></div>
        </td>
        <td class="valueE"><div>&nbsp;</div></td>
    </tr>
    <% even = !even; i++;%>
    <tr class="<%=even?"light":"dark"%>">
        <td class="valueW"><div>&nbsp;</div></td>
        <td class="valueC">
        <input type="text" maxlength="3" class="" name="" value="<%=i%>" size="1" align="center">
        </td>
        <td class="value">
        studio_submission_3.zip
        </td>
        <td class="value">
            <div class="container">
                <a href=""><img src="/i/layout/magnify.gif" alt="View submission" border="0" onmouseover="popUp('pop<%=i%>')" onmouseout="popHide()"/></a>
                <div id="pop<%=i%>" class="popUp"><div>View submission</div></div>
            </div>
        </td>
        <td class="valueC">
        11.04.2006 17:19 EST
        </td>
        <td class="valueC">
        Pending
        </td>
        <td class="valueC">
        <div align="center" style="margin:2px;"><A href="" onfocus="this.blur();"><img src="/i/layout/btnMoveUp.png" alt="Move up" onmouseover="this.src = '/i/layout/btnMoveUpOn.png';" onmouseout="this.src = '/i/layout/btnMoveUp.png';" /></A></div>
        <div align="center" style="margin:2px;"><A href="" onfocus="this.blur();"><img src="/i/layout/btnMoveDown.png" alt="Move down" onmouseover="this.src = '/i/layout/btnMoveDownOn.png';" onmouseout="this.src = '/i/layout/btnMoveDown.png';" /></A></div>
        </td>
        <td class="valueC">
        <div align="center"><A href="" onfocus="this.blur();"><img src="/i/layout/btnMoveToTop.png" alt="Move to top" onmouseover="this.src = '/i/layout/btnMoveToTopOn.png';" onmouseout="this.src = '/i/layout/btnMoveToTop.png';" /></A></div>
        </td>
        <td class="valueE"><div>&nbsp;</div></td>
    </tr>
    <% even = !even; i++;%>
    <tr class="<%=even?"light":"dark"%>">
        <td class="valueW"><div>&nbsp;</div></td>
        <td class="valueC">
        <input type="text" maxlength="3" class="" name="" value="<%=i%>" size="1" align="center">
        </td>
        <td class="value">
        studio_submission_3.zip
        </td>
        <td class="value">
            <div class="container">
                <a href=""><img src="/i/layout/magnify.gif" alt="View submission" border="0" onmouseover="popUp('pop<%=i%>')" onmouseout="popHide()"/></a>
                <div id="pop<%=i%>" class="popUp"><div>View submission</div></div>
            </div>
        </td>
        <td class="valueC">
        11.04.2006 17:19 EST
        </td>
        <td class="valueC">
        Pending
        </td>
        <td class="valueC">
        <div align="center" style="margin:2px;"><A href="" onfocus="this.blur();"><img src="/i/layout/btnMoveUp.png" alt="Move up" onmouseover="this.src = '/i/layout/btnMoveUpOn.png';" onmouseout="this.src = '/i/layout/btnMoveUp.png';" /></A></div>
        <div align="center" style="margin:2px;"><A href="" onfocus="this.blur();"><img src="/i/layout/btnMoveDown.png" alt="Move down" onmouseover="this.src = '/i/layout/btnMoveDownOn.png';" onmouseout="this.src = '/i/layout/btnMoveDown.png';" /></A></div>
        </td>
        <td class="valueC">
        <div align="center"><A href="" onfocus="this.blur();"><img src="/i/layout/btnMoveToTop.png" alt="Move to top" onmouseover="this.src = '/i/layout/btnMoveToTopOn.png';" onmouseout="this.src = '/i/layout/btnMoveToTop.png';" /></A></div>
        </td>
        <td class="valueE"><div>&nbsp;</div></td>
    </tr>
    <% even = !even; i++;%>
    <tr class="<%=even?"light":"dark"%>">
        <td class="valueW"><div>&nbsp;</div></td>
        <td class="valueC">
        <input type="text" maxlength="3" class="" name="" value="<%=i%>" size="1" align="center">
        </td>
        <td class="value">
        studio_submission_3.zip
        </td>
        <td class="value">
            <div class="container">
                <a href=""><img src="/i/layout/magnify.gif" alt="View submission" border="0" onmouseover="popUp('pop<%=i%>')" onmouseout="popHide()"/></a>
                <div id="pop<%=i%>" class="popUp"><div>View submission</div></div>
            </div>
        </td>
        <td class="valueC">
        11.04.2006 17:19 EST
        </td>
        <td class="valueC">
        Pending
        </td>
        <td class="valueC">
        <div align="center" style="margin:2px;"><A href="" onfocus="this.blur();"><img src="/i/layout/btnMoveUp.png" alt="Move up" onmouseover="this.src = '/i/layout/btnMoveUpOn.png';" onmouseout="this.src = '/i/layout/btnMoveUp.png';" /></A></div>
        <div align="center" style="margin:2px;"><A href="" onfocus="this.blur();"><img src="/i/layout/btnMoveDown.png" alt="Move down" onmouseover="this.src = '/i/layout/btnMoveDownOn.png';" onmouseout="this.src = '/i/layout/btnMoveDown.png';" /></A></div>
        </td>
        <td class="valueC">
        <div align="center"><A href="" onfocus="this.blur();"><img src="/i/layout/btnMoveToTop.png" alt="Move to top" onmouseover="this.src = '/i/layout/btnMoveToTopOn.png';" onmouseout="this.src = '/i/layout/btnMoveToTop.png';" /></A></div>
        </td>
        <td class="valueE"><div>&nbsp;</div></td>
    </tr>
    <% even = !even; i++;%>
    <tr class="<%=even?"light":"dark"%>">
        <td class="valueW"><div>&nbsp;</div></td>
        <td class="valueC">
        <input type="text" maxlength="3" class="" name="" value="<%=i%>" size="1" align="center">
        </td>
        <td class="value">
        studio_submission_3.zip
        </td>
        <td class="value">
            <div class="container">
                <a href=""><img src="/i/layout/magnify.gif" alt="View submission" border="0" onmouseover="popUp('pop<%=i%>')" onmouseout="popHide()"/></a>
                <div id="pop<%=i%>" class="popUp"><div>View submission</div></div>
            </div>
        </td>
        <td class="valueC">
        11.04.2006 17:19 EST
        </td>
        <td class="valueC">
        Pending
        </td>
        <td class="valueC">
        <div align="center" style="margin:2px;"><A href="" onfocus="this.blur();"><img src="/i/layout/btnMoveUp.png" alt="Move up" onmouseover="this.src = '/i/layout/btnMoveUpOn.png';" onmouseout="this.src = '/i/layout/btnMoveUp.png';" /></A></div>
        <div align="center" style="margin:2px;"><A href="" onfocus="this.blur();"><img src="/i/layout/btnMoveDown.png" alt="Move down" onmouseover="this.src = '/i/layout/btnMoveDownOn.png';" onmouseout="this.src = '/i/layout/btnMoveDown.png';" /></A></div>
        </td>
        <td class="valueC">
        <div align="center"><A href="" onfocus="this.blur();"><img src="/i/layout/btnMoveToTop.png" alt="Move to top" onmouseover="this.src = '/i/layout/btnMoveToTopOn.png';" onmouseout="this.src = '/i/layout/btnMoveToTop.png';" /></A></div>
        </td>
        <td class="valueE"><div>&nbsp;</div></td>
    </tr>
    <% even = !even; i++;%>
    <tr class="<%=even?"light":"dark"%>">
        <td class="valueW"><div>&nbsp;</div></td>
        <td class="valueC">
        <input type="text" maxlength="3" class="" name="" value="<%=i%>" size="1" align="center">
        </td>
        <td class="value">
        studio_submission_3.zip
        </td>
        <td class="value">
            <div class="container">
                <a href=""><img src="/i/layout/magnify.gif" alt="View submission" border="0" onmouseover="popUp('pop<%=i%>')" onmouseout="popHide()"/></a>
                <div id="pop<%=i%>" class="popUp"><div>View submission</div></div>
            </div>
        </td>
        <td class="valueC">
        11.04.2006 17:19 EST
        </td>
        <td class="valueC">
        Pending
        </td>
        <td class="valueC">
        <div align="center" style="margin:2px;"><A href="" onfocus="this.blur();"><img src="/i/layout/btnMoveUp.png" alt="Move up" onmouseover="this.src = '/i/layout/btnMoveUpOn.png';" onmouseout="this.src = '/i/layout/btnMoveUp.png';" /></A></div>
        <div align="center" style="margin:2px;"><A href="" onfocus="this.blur();"><img src="/i/layout/btnMoveDown.png" alt="Move down" onmouseover="this.src = '/i/layout/btnMoveDownOn.png';" onmouseout="this.src = '/i/layout/btnMoveDown.png';" /></A></div>
        </td>
        <td class="valueC">
        <div align="center"><A href="" onfocus="this.blur();"><img src="/i/layout/btnMoveToTop.png" alt="Move to top" onmouseover="this.src = '/i/layout/btnMoveToTopOn.png';" onmouseout="this.src = '/i/layout/btnMoveToTop.png';" /></A></div>
        </td>
        <td class="valueE"><div>&nbsp;</div></td>
    </tr>
    <% even = !even; i++;%>
    <tr class="<%=even?"light":"dark"%>">
        <td class="valueW"><div>&nbsp;</div></td>
        <td class="valueC">
        <input type="text" maxlength="3" class="" name="" value="<%=i%>" size="1" align="center">
        </td>
        <td class="value">
        studio_submission_3.zip
        </td>
        <td class="value">
            <div class="container">
                <a href=""><img src="/i/layout/magnify.gif" alt="View submission" border="0" onmouseover="popUp('pop<%=i%>')" onmouseout="popHide()"/></a>
                <div id="pop<%=i%>" class="popUp"><div>View submission</div></div>
            </div>
        </td>
        <td class="valueC">
        11.04.2006 17:19 EST
        </td>
        <td class="valueC">
        Pending
        </td>
        <td class="valueC">
        <div align="center" style="margin:2px;"><A href="" onfocus="this.blur();"><img src="/i/layout/btnMoveUp.png" alt="Move up" onmouseover="this.src = '/i/layout/btnMoveUpOn.png';" onmouseout="this.src = '/i/layout/btnMoveUp.png';" /></A></div>
        <div align="center" style="margin:2px;"><A href="" onfocus="this.blur();"><img src="/i/layout/btnMoveDown.png" alt="Move down" onmouseover="this.src = '/i/layout/btnMoveDownOn.png';" onmouseout="this.src = '/i/layout/btnMoveDown.png';" /></A></div>
        </td>
        <td class="valueC">
        <div align="center"><A href="" onfocus="this.blur();"><img src="/i/layout/btnMoveToTop.png" alt="Move to top" onmouseover="this.src = '/i/layout/btnMoveToTopOn.png';" onmouseout="this.src = '/i/layout/btnMoveToTop.png';" /></A></div>
        </td>
        <td class="valueE"><div>&nbsp;</div></td>
    </tr>
    <% even = !even; i++;%>
    <tr class="<%=even?"light":"dark"%>">
        <td class="valueW"><div>&nbsp;</div></td>
        <td class="valueC">
        <input type="text" maxlength="3" class="" name="" value="" size="1" align="center" disabled>
        </td>
        <td class="value">
        studio_submission_1.zip
        </td>
        <td class="value">
            <div class="container">
                <a href=""><img src="/i/layout/magnify.gif" alt="View submission" border="0" onmouseover="popUp('pop<%=i%>')" onmouseout="popHide()"/></a>
                <div id="pop<%=i%>" class="popUp"><div>View submission</div></div>
            </div>
        </td>
        <td class="valueC">
        11.02.2006 17:19 EST
        </td>
        <td class="valueC">
        <span class="bigRed">Failed</span>
        </td>
        <td class="valueC">
        <div align="center" style="margin:2px;"><img src="/i/layout/btnMoveUpNA.png" alt="Raise priority" /></div>
        <div align="center" style="margin:2px;"><img src="/i/layout/btnMoveDownNA.png" alt="Move down" /></div>
        </td>
        <td class="valueC">
        <div align="center"><img src="/i/layout/btnMoveToTopNA.png" alt="Move to top" /></div>
        </td>
        <td class="valueE"><div>&nbsp;</div></td>
    </tr>
    <% even = !even; i++;%>
    <tr class="<%=even?"light":"dark"%>">
        <td class="valueW"><div>&nbsp;</div></td>
        <td class="valueC">
        <input type="text" maxlength="3" class="" name="" value="" size="1" align="center" disabled>
        </td>
        <td class="value">
        studio_submission_1.zip
        </td>
        <td class="value">
            <div class="container">
                <a href=""><img src="/i/layout/magnify.gif" alt="View submission" border="0" onmouseover="popUp('pop<%=i%>')" onmouseout="popHide()"/></a>
                <div id="pop<%=i%>" class="popUp"><div>View submission</div></div>
            </div>
        </td>
        <td class="valueC">
        11.02.2006 17:19 EST
        </td>
        <td class="valueC">
        <span class="bigRed">Failed</span>
        </td>
        <td class="valueC">
        <div align="center" style="margin:2px;"><img src="/i/layout/btnMoveUpNA.png" alt="Raise priority" /></div>
        <div align="center" style="margin:2px;"><img src="/i/layout/btnMoveDownNA.png" alt="Move down" /></div>
        </td>
        <td class="valueC">
        <div align="center"><img src="/i/layout/btnMoveToTopNA.png" alt="Move to top" /></div>
        </td>
        <td class="valueE"><div>&nbsp;</div></td>
    </tr>
    <% even = !even; i++;%>
    <tr class="<%=even?"light":"dark"%>">
        <td class="valueW"><div>&nbsp;</div></td>
        <td class="valueC">
        <input type="text" maxlength="3" class="" name="" value="" size="1" align="center" disabled>
        </td>
        <td class="value">
        studio_submission_1.zip
        </td>
        <td class="value">
            <div class="container">
                <a href=""><img src="/i/layout/magnify.gif" alt="View submission" border="0" onmouseover="popUp('pop<%=i%>')" onmouseout="popHide()"/></a>
                <div id="pop<%=i%>" class="popUp"><div>View submission</div></div>
            </div>
        </td>
        <td class="valueC">
        11.02.2006 17:19 EST
        </td>
        <td class="valueC">
        <span class="bigRed">Failed</span>
        </td>
        <td class="valueC">
        <div align="center" style="margin:2px;"><img src="/i/layout/btnMoveUpNA.png" alt="Raise priority" /></div>
        <div align="center" style="margin:2px;"><img src="/i/layout/btnMoveDownNA.png" alt="Move down" /></div>
        </td>
        <td class="valueC">
        <div align="center"><img src="/i/layout/btnMoveToTopNA.png" alt="Move to top" /></div>
        </td>
        <td class="valueE"><div>&nbsp;</div></td>
    </tr>
    <% even = !even; i++;%>
    <tr>
        <td class="SW" colspan="8">&nbsp;</td>
        <td class="SE">&nbsp;</td>
    </tr>
</tbody>
</table>
<br><br>
<strong>NOTE:</strong> green rows indicate submissions that you have selected to be considered for this contest
</div>


            </div>
            <img src="/i/layout/contentInS.gif" alt="" style="display:block;"/>
        </div>
        <jsp:include page="foot.jsp"/>
        <img src="/i/layout/contentOutS.gif" alt="" style="display:block;"/>
    </div>
</div>

</body>
</html>