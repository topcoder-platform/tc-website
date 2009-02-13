<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<%@ taglib prefix="reg_tags" tagdir="/WEB-INF/tags" %>

<%@ page contentType="text/html;charset=utf-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
   "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">

<head>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>TopCoder Registration</title>
    <reg_tags:style/>
</head>

<body>

<%-- THE align="center" IS REQUIRED TO EVER CENTER IT, BUT THAT CAN BE OVERRULED TO LEFT OR RIGHT WITH CSS --%>
<div id="pageBranding" align="center">
    <a href="http://<%=ApplicationServer.SERVER_NAME%>">&nbsp;</a>
</div>

<div id="pageAligner" align="center">
    <div id="pageSpacer">
    
    <div id="pageTitle"><div>&nbsp;</div></div>

    <p>
        <strong>A Message from the TopCoder Founder</strong>
    </p>
    <p>
        Welcome to TopCoder. Before you register, there are a few things we think you should know:  First, and most importantly, TopCoder is a commercial
        site.  We charge sponsors for the right to advertise on our site.  This money pays for the operation of the site and the prizes awarded in competitions.
    </p>
    <p>
        This has several implications. Because we feel it is our obligation to let our sponsors know who their message is reaching, we collect as much
        demographic information as possible without making the Registration process overly burdensome.  Furthermore, we require that you verify the accuracy of
        the information you provide.  This does not mean that sponsors have access to your personal information; in general, they do
        not. In certain circumstances such as participating in or opting in to certain events,
        sponsors will be given access to view your demographic information, educational and work
        experience (if provided by you), and contact information.
    </p>
    <p>
        While we believe that sponsors have every right to expect that what we give them is accurate and valuable, we also believe that they must bring more
        than just money to our member base.  We want sponsors who provide true value to developers.  TopCoder intends to help developers increase their skill
        level as well as increase their value to employers. Therefore, we are careful to choose sponsors that represent this philosophy.
    </p>
    <p>
        We are also very strict about the way in which sponsors present themselves to the member base - no annoying banners, pop-ups, etc. We work with
        sponsors to get their message across in an appealing and non-intrusive manner.  Because we take our relationship with sponsors seriously, we
        believe that they have value to provide.  We ask that you listen to what they have to say.
    </p>
    <p>
        Let me be the first to say good luck in the arena.
    </p>
    <p>
        <em>Jack Hughes<br />
        Founder and Chairman, TopCoder, Inc.</em>
    </p>

    </div>
</div>

</body>
</html>
