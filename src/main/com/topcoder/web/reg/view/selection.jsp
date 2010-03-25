<%@ page import="com.topcoder.shared.util.ApplicationServer" %>
<%@ page import="com.topcoder.web.common.BaseProcessor" %>
<%@ page import="com.topcoder.web.common.model.RegistrationType" %>
<%@ page import="com.topcoder.web.reg.Constants" %>
<%@ page contentType="text/html;charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
        <title>Signup Personal Information</title>
        <script type="text/javascript" src="/js/regReskin20080904.js"></script>
        <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
        <jsp:include page="style.jsp">
            <jsp:param name="key" value="tc_reg"/>
        </jsp:include>
    
    <script type="text/javascript" src="/js/popup.js"></script>
    <script language="javascript" type="text/javascript">
        <!--
        function openWin(url, name, w, h) {
            win = window.open(url, 'biowin', "scrollbars=yes,toolbar=no,resizable=no,menubar=no,width=" + w + ",height=" + h);
            win.location.href = url;
            win.focus();
        }
        // -->
    </script>
</head>

<body>

        <div id="popUp0" class="popUp"> 
            <div style="width: 400px; white-space: normal;">Developers from all over the world are competing to build your next application. As a TopCoder Direct member, you have all the tools you need to access this community to get your project done.<br/><br/>Corporate Services:<br/><ul><li><strong>TopCoder Direct:</strong> Plug into the world's largest community of competitive software developers. Launch and monitor your own competitions, then view and download the submissions all through the TopCoder Cockpit tool.</li><li><strong>Event Sponsorship:</strong> Our onsite events are large gatherings of proven and recognizable software developers. Whether you want to hire developers at the professional or college level, sponsoring TopCoder tournaments is the most effective way to reach the development community.</li><li><strong>Powered by TopCoder Events:</strong> Whether your company seeks to identify and recruit the best talent or reward and recognize employees, TopCoder can provide a platform to execute online and onsite events.</li><li><strong>Technical Assessment:</strong> TopCoder's Technical Assessment Tool allows companies to test candidates' technical abilities during the interview process, thereby reducing the recruiting time incurred by in-house engineers.</li><li><strong>Placement:</strong> TopCoder works with companies to fill both full-time and contract positions. Clients provide us with a description of the position they need filled and we locate the most qualified members.</li></ul></div> 
        </div> 
    
    
        <div id="popUp1" class="popUp"> 
            <div style="width: 400px; white-space: normal;"><span class='bodySubtitle'>TopCoder Competitions</span><br />How do you stand up among your peers?<ul><li><strong>Algorithm Competitions:</strong> The competitions are timed events where all participants compete online to solve the same problems under the same time constraints. The competitions are available in four programming languages - Java, C++, C#, and VB.Net.</li><li><strong>Bug Races:</strong> The fastest and easiest way to earn money at TopCoder. Just check out our active Bug Races, fix a bug, win the prize money.</li><li><strong>Component Design Competitions:</strong> In the competitions, participants convert a set of requirements into a set of diagrams and a component specification document that is the basis for Component Development Competitions.</li><li><strong>Component Development Competitions:</strong> Participants are tasked with converting a component design, prepared by the winner of the Component Design Competition and reviewed by the Design Review Board, into a functional component.</li><li><strong>Marathon Matches:</strong> The competitions take place over an extended timeline and provide a more flexible competition format that offers different types of problems than what can be offered in the Algorithm Competitions.</li></ul></div> 
        </div> 
    
    
        <div id="popUp2" class="popUp"> 
            <div style="width: 400px; white-space: normal;">TopCoder Studio contests are for you "creative types" (graphic designers, artists, flash & flex designers, etc.). Whether you are a working professional or a talented "amateur", trying to build your portfolio or just looking for a great way to flex your creative muscles and earn big money in the process. At Studio you can compete in a variety of design competition types for real live clients and be eligible for large cash awards, including monthly bonus prizes in the "Studio Cup"</div> 
        </div> 
    
    
        <div id="popUp3" class="popUp"> 
            <div style="width: 400px; white-space: normal;"><span class='bodySubtitle'>High School (Secondary School) Registration</span><br />TCHS competitions are timed events where worldwide secondary school participants compete online to solve the same problems under the same time constraints. The competitions are available in four programming languages - Java, C++, C#, and VB.Net.  Participants can compete either as an individual or as part of a team representing their school.</div> 
        </div> 
    
    
        <div id="popUp4" class="popUp"> 
            <div style="width: 400px; white-space: normal;"><span class="bodySubtitle">Teacher/Professor</span><br />Are you a University professor?  If so, this registration is for you!<br /><br />Professor registration gives University professors access to TopCoder's Educational Platform, an academic version of the TopCoder Algorithm Arena customized for the classroom.  Professors have access to on-demand practice rooms and virtual classrooms, and can select, configure and assign problems to their students and view reports on students' progress.<br /><br />This registration also gives you access to the TopCoder forums where members discuss everything from their favorite algorithm to the latest game release.</div> 
        </div> 
    
    
        <div id="popUp5" class="popUp"> 
            <div style="width: 400px; white-space: normal;">stuff</div> 
        </div> 
    
    
        <div id="popUp6" class="popUp"> 
            <div style="width: 400px; white-space: normal;">stuff</div> 
        </div>     
    <div id="wrapper">

        <div id="box-head">
            <jsp:include page="header.jsp" />
            <div id="page-head">
                <h3 id="registration-signup"><span>Registration Signup: Personal Information</span></h3>
            </div>
        </div>
            
        <div id="box-body">
    
            <c:if test="${sessionInfo.loggedIn}">
                <div style="float:right;" class="small"><A href="${sessionInfo.servletPath}?module=Logout">logout</A></div>
            </c:if>
            
            <c:if test="${!sessionInfo.loggedIn}">
                <div style="float:right;" class="small">
                    (<A href="/reg/?nrg=false">Click here</A> if you're already a registered member and would like to update
                    your profile.)
                </div>
            </c:if>
    
            <form action="${sessionInfo.secureAbsoluteServletPath}" method="POST" name="selectionForm">
            <div class="block">
            
                <div class="sidebar">
                    <p>
                        <c:if test="${!sessionInfo.loggedIn}">
                            Before registering, we encourage you to read our <a href="Javascript:openWin('/reg/message.jsp','',1200,600);">Message
                            from the TopCoder Founder</a>.
                            <br/>
                        </c:if>                    
                    </p>
                    <p>All registered TopCoder members have the ability to read and post in our forums, as well as browse sections of the site that require login, such as detailed competition statistics. </p>
                    <p>You can always add to your registered capabilities later by clicking &quot;Update My Profile&quot;.</p>
                    <p>Please read the <a href="Javascript:openWin('/reg/privacy_policy.jsp','',1200,600);">Privacy Policy</a> </p>
                </div>
                
                <div class="content">
                <h4><span>What would you like to do as a registered TopCoder member?</span><span class="hint">(check all that apply)</span><span class="end">&nbsp;</span></h4>
                <div class="content-body">
                <ul>
            
                    <tc-webtag:hiddenInput name="<%=Constants.MODULE_KEY%>" value="Main"/>
        
                    <c:set value="<%=Constants.REGISTRATION_TYPE%>" var="regType"/>
                    <span class="bigRed"><tc-webtag:errorIterator id="err" name="${regType}">${err}
                        <br/></tc-webtag:errorIterator></span>
        
                    <c:set value="<%=BaseProcessor.DEFAULTS_KEY%>" var="defaults"/>
                    <c:set value="<%=RegistrationType.TEACHER_ID%>" var="teacherType"/>
                    <c:set value="<%=RegistrationType.OPENAIM_ID%>" var="openAIM"/>
                    <c:set value="<%=RegistrationType.TRUVEO_ID%>" var="truveo"/>
        
                    <c:set value="<%=RegistrationType.HIGH_SCHOOL_ID%>" var="highSchool"/>
                    

                    <h5>Run My Own Contests</h5>
                    <li class="form-row">
                        <c:choose>
                            <c:when test="${requestScope[defaults]['rt2']==null}">
                                <input name="rt2" style="margin-left: 10px; margin-top: 5px;" type="checkbox" />
                            </c:when>
                            <c:otherwise>
                                <input type="checkbox" style="margin-left: 10px; margin-top: 5px;" checked="true" disabled="true"/>
                                <tc-webtag:hiddenInput name="rt2" value="on"/>
                            </c:otherwise>
                        </c:choose>
                        I want to start using TopCoder Direct | <a href="javascript:void(0)" onmouseover="popUp(this,'popUp0');" onmouseout="popHide()">tell me more</a>
                    </li>
                    <h5 class="title2">I Want to Compete</h5>
                    <li class="form-row">
                        <c:choose>
                            <c:when test="${requestScope[defaults]['rt1']==null}">
                                <input name="rt1" style="margin-left: 10px; margin-top: 5px;" type="checkbox" />
                            </c:when>
                            <c:otherwise>
                                <input type="checkbox" style="margin-left: 10px; margin-top: 5px;" checked="true" disabled="true"/>
                                <tc-webtag:hiddenInput name="rt1" value="on"/>
                            </c:otherwise>
                        </c:choose>
                        on TopCoder | <a href="javascript:void(0)" onmouseover="popUp(this,'popUp1');" onmouseout="popHide()">tell me more</a>
                    </li>
                    <li class="form-row">
                        <c:choose>
                            <c:when test="${requestScope[defaults]['rt6']==null}">
                                <input name="rt6" style="margin-left: 10px; margin-top: 5px;" type="checkbox" />
                            </c:when>
                            <c:otherwise>
                                <input type="checkbox" style="margin-left: 10px; margin-top: 5px;" checked="true" disabled="true"/>
                                <tc-webtag:hiddenInput name="rt6" value="on"/>
                            </c:otherwise>
                        </c:choose>
                        on TopCoder Studio | <a href="javascript:void(0)" onmouseover="popUp(this,'popUp2');" onmouseout="popHide()">tell me more</a>
                    </li>
                    <!--<li class="form-row">
                        <c:choose>
                            <c:when test="${requestScope[defaults]['rt3']==null}">
                                <input name="rt3" style="margin-left: 10px; margin-top: 5px;" type="checkbox" />
                            </c:when>
                            <c:otherwise>
                                <input type="checkbox" style="margin-left: 10px; margin-top: 5px;" checked="true" disabled="true"/>
                                <tc-webtag:hiddenInput name="rt3" value="on"/>
                            </c:otherwise>
                        </c:choose>
                        High School (Secondary School) Registration | <a href="javascript:void(0)" onmouseover="popUp(this,'popUp3');" onmouseout="popHide()">tell me more</a>
                    </li>-->


                    <li class="form-bottom"><br />
                        <button type="submit" id="submit">Submit</button>
                        <p>
                            Or cancel and go to 
                            <a href="http://<%=ApplicationServer.SERVER_NAME%>/" title="TopCoder">TopCoder</a> or 
                            <a href="http://<%=ApplicationServer.STUDIO_SERVER_NAME%>/" title="Studio">Studio</a>
                        </p>
                        <p>&nbsp;</p>
                    </li>
                    
                </ul>
                </div>
                </div>
            </div>    
            </form>
        </div>
        
        <jsp:include page="footer.jsp" />
        
    </div>

</body>
</html>
