<%@ include file="head.inc" %>
<jsp:useBean id="student" type="com.topcoder.web.hs.model.StudentRegistrationBean" scope="request"/>
<h3>Thank You </h3>
<P><B>Your TopCoder High School registration request has been submitted. We will set up your member home page.</B></P>
<% if (student.getSchoolCoachCount().equals(new Long(0))) { %>
<P><B>Your school does not currently have a coach. We require that each school have a coach in order to participate. Please encourage your school administration to get involved with TopCoder High School.</B></P>
<% } %>
<P><B>Best of luck to you in the High School Arena!</B></P>
<%@ include file="tail.inc" %>

