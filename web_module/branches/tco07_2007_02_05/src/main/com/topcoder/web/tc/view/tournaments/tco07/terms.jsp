<%@ page contentType="text/html;charset=utf-8" %> 
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>2007 TopCoder Open - Computer Programming Tournament</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <link type="text/css" rel="stylesheet" href="/css/tournaments/tco07.css"/>
    <link type="text/css" rel="stylesheet" href="/css/coders.css"/>
    <jsp:include page="../../script.jsp" />
</head>
<body>

<div align="center" style="background: transparent;">
    <div id="content">

        <jsp:include page="header.jsp" />

        <table cellpadding="0" cellspacing="0" id="spacer">
        <tbody>
            <tr>
                <td id="navSpacer">

<%--tabLev1 should be algorithm/component/marathon/studio--%>
                    <jsp:include page="nav.jsp" >
                    <jsp:param name="tabLev1" value="algorithm"/>
                    <jsp:param name="tabLev2" value="register"/>
                    <jsp:param name="tabLev3" value=""/>
                    </jsp:include>

                </td>
                <td id="bodySpacer" width="100%">
                    <div id="pageBody">

                        <h1><div>Registration</div></h1>

                        <form name="terms" method="post" action="/tc">
                            <input name="module" value="TCHS07SubmitRegistration" type="hidden">
                            <input name="eid" value="1" type="hidden">
<%--USE THE RIGHT SENTENCE HERE--%>
    <p align="center">To complete your registration for the 2007 TopCoder&#174; Open Algorithm Competition you must <b>read and agree to</b> the terms listed below.</p>
<%--<p align="center">To complete your registration for the 2007 TopCoder&#174; Open Component Competition you must <b>read and agree to</b> the terms listed below.</p>--%>
<%--<p align="center">To complete your registration for the 2007 TopCoder&#174; Open Marathon Matches Competition you must <b>read and agree to</b> the terms listed below.</p>--%>
<%--<p align="center">To complete your registration for the 2007 TopCoder&#174; Open Studio Competition you must <b>read and agree to</b> the terms listed below.</p>--%>
                            <div align="center">
                                <iframe marginwidth="5" src="" height="300" width="590"></iframe>
                            </div>
                            <div align="center">
                                <br>
                                <input name="terms_agree" type="checkbox">
                                I agree
                            </div>
                            <br>
                            <table class="stat" align="center" cellpadding="0" cellspacing="0">
                            <tbody><tr>
                                    <td align="center">
                                        <span class="bigRed">&nbsp;
                                        </span>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center">
                                        How old will you be on February 26, 2007? 
                                        <input size="3" maxlength="3" name="question_8084" id="answerInput" value="" type="text">
                                    </td>
                                </tr>
                            </tbody>
                            </table>
                            <br>
                            <table class="stat" align="center" cellpadding="0" cellspacing="0">
                                <tbody><tr>
                                    <td align="center">
                                        <span class="bigRed">&nbsp;
                                        </span>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center">
                                        Are you enrolled full time at a college or university?
                                         <br>
                                                 <input name="question_8085" id="answerInput" value="8086" type="radio">
                                                 Yes&nbsp;&nbsp;&nbsp;
                                                 <input name="question_8085" id="answerInput" value="8087" type="radio">
                                                 No&nbsp;&nbsp;&nbsp;
                                    </td>
                                </tr>
                            </tbody></table>
                            <br>
                            <table class="stat" align="center" cellpadding="0" cellspacing="0">
                                <tbody><tr>
                                    <td align="center">
                                        <span class="bigRed">&nbsp;
                                        </span>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center">
                                        Are you enrolled full time at a secondary school (high school)?
                                         <br>
                                                 <input name="question_8088" id="answerInput" value="8089" type="radio">
                                                 Yes&nbsp;&nbsp;&nbsp;
                                                 <input name="question_8088" id="answerInput" value="8090" type="radio">
                                                 No&nbsp;&nbsp;&nbsp;
                                    </td>
                                </tr>
                            </tbody></table>
                            <br>
                            <div align="center">
                                <button name="submit" value="submit" type="submit">Submit</button>
                            </div>
                        </form>

                    </div>
                </td>
            </tr>
        </table>


        <jsp:include page="footer.jsp" />
    </div>
</div>

</body>

</html>
