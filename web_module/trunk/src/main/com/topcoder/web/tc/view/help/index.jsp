<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder - Help</title>

<jsp:include page="../script.jsp" />

</head>

<body>

<jsp:include page="../top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">
<!-- Left Column Begins-->
        <td width="180">
            <jsp:include page="../includes/global_left.jsp">
                <jsp:param name="level1" value="help"/>
                <jsp:param name="level2" value="index"/>
            </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Gutter Begins -->
        <td width="15"><img src="/i/clear.gif" width="15" height="1" border="0"/></td>
<!-- Gutter Ends -->

<!-- Center Column Begins -->
         <td class="bodyText" WIDTH="100%">

        <h2>Help</h2>

        <p><span class="bodySubtitle">Getting Started</span><br/>
            <span class="outline1">1. <a href="/">What is the TopCoder Arena?</a></span><br/>
            <span class="outline1">2. <a href="/">How to Run the TopCoder Arena</a></span><br/>
                <span class="outline2">2.1. <a href="/">What software will you need to install?</a></span><br/>
                <span class="outline2">2.2. <a href="/">Run the TopCoder Arena as an Applet or using Java Web Start</a></span><br/>
                <span class="outline2">2.3. <a href="/">Local Firewall and Network Considerations</a></span><br/>
                <span class="outline2">2.4. <a href="/">HTTP Tunneling</a></span></p>

        <p><span class="bodySubtitle">General TopCoder Arena Usage</a></span><br/>
            <span class="outline1">1. <a href="/">General Arena Usage</a></span><br/>
            <span class="outline1">2. <a href="/">Chatting / Asking Questions</a></span><br/>
                <span class="outline2">2.1. <a href="/">General Chat</a></span><br/>
                <span class="outline2">2.2. <a href="/">ReplyTo</a></span><br/>
                <span class="outline2">2.3. <a href="/">Whisper</a></span><br/>
                <span class="outline2">2.4. <a href="/">Admin</a></span><br/>
                <span class="outline2">2.5. <a href="/">Auto-Enhanced Chat</a></span><br/>
                <span class="outline2">2.6. <a href="/">Emoting</a></span><br/>
            <span class="outline1">3. <a href="/">Getting Information about another Coder</a></span><br/>
            <span class="outline1">4. <a href="/">Finding another Coder</a></span><br/>
            <span class="outline1">5. <a href="/">Moving Around</a></span><br/>
            <span class="outline1">6. <a href="/">The Leader Board</a></span><br/>
            <span class="outline1">7. <a href="/">Messages</a></span></p>

        <p><span class="bodySubtitle">Practicing / Training in the TopCoder Arena</a></span><br/>
            <span class="outline1">1. <a href="/">The Practice Rooms</a></span><br/>
                <span class="outline2">1.1. <a href="/">Selecting a Problem</a></span><br/>
                <span class="outline2">1.2. <a href="/">The Coding Window</a></span><br/>
                    <span class="outline3">1.2.1. <a href="/">Choosing an Editor</a></span><br/>
                    <span class="outline3">1.2.2. <a href="/">Choosing a Language</a></span><br/>
                    <span class="outline3">1.2.3. <a href="/">The Solution Interface</a></span><br/>
                    <span class="outline3">1.2.4. <a href="/">The Problem Statement</a></span><br/>
                    <span class="outline3">1.2.5. <a href="/">Compiling</a></span><br/>
                    <span class="outline3">1.2.6. <a href="/">User Testing</a></span><br/>
                        <span class="outline4">1.2.6.1. <a href="/">Using the Argument Window</a></span><br/>
                    <span class="outline3">1.2.7. <a href="/">Submitting</a></span><br/>
                    <span class="outline3">1.2.8. <a href="/">Saving</a></span><br/>
                    <span class="outline3">1.2.9. <a href="/">Clearing the code</a></span><br/>
                    <span class="outline3">1.2.10. <a href="/">The Timer</a></span><br/>
                <span class="outline2">1.3. <a href="/">System Testing</a></span><br/>
                <span class="outline2">1.4. <a href="/">The Room Summary</a></span><br/>
                <span class="outline2">1.5. <a href="/">Challenging</a></span><br/>
                    <span class="outline3">1.5.1. <a href="/">Using the Argument Window</a></span><br/>
                <span class="outline2">1.6. <a href="/">Clearing Problems</a></span><br/>
                <span class="outline2">1.7. <a href="/">Viewing a Coder’s History</a></span></p>

        <p><span class="bodySubtitle">Competing in a TopCoder Rated Event</a></span><br/>
            <span class="outline1">1. <a href="/">When are the Rated Events?</a></span><br/>
            <span class="outline1">2. <a href="/">How does a Rated Event Differ from the Practice Room?</a></span><br/>
            <span class="outline1">3. <a href="/">Registration for a Rated Event</a></span><br/>
                <span class="outline2">3.1. <a href="/">Can I log out after I register?</a></span><br/>
            <span class="outline1">4. <a href="/">Room Assignments – Getting to Your Room</a></span><br/>
            <span class="outline1">5. <a href="/">The Phases of a Rated Event (Including Scoring and Length of Time)</a></span><br/>
                <span class="outline2">5.1. <a href="/">Coding Phase</a></span><br/>
                    <span class="outline3">5.1.1. <a href="/">Scoring</a></span><br/>
                    <span class="outline3">5.1.2. <a href="/">Multiple Submission</a></span><br/>
                <span class="outline2">5.2. <a href="/">Intermission</a></span><br/>
                <span class="outline2">5.3. <a href="/">Challenge Phase</a></span><br/>
                    <span class="outline3">5.3.1. <a href="/">Multiple Challenge</a></span><br/>
                    <span class="outline3">5.3.2. <a href="/">Challenge with Zero Points</a></span><br/>
                    <span class="outline3">5.3.3. <a href="/">Scoring</a></span><br/>
                <span class="outline2">5.4. <a href="/">System Testing</a></span><br/>
                    <span class="outline3">5.4.1. <a href="/">Test Cases from Challenges</a></span><br/>
            <span class="outline1">6. <a href="/">Broadcast Messages</a></span><br/>
            <span class="outline1">7. <a href="/">Getting Help</a></span><br/>
                <span class="outline2">7.1. <a href="/">Using “admins: “</a></span><br/>
                <span class="outline2">7.2. <a href="/">The Admin Lobby Room</a></span><br/>
                <span class="outline2">7.3. <a href="/">IM</a></span><br/>
            <span class="outline1">8. <a href="/">What If You Get Disconnected from the Arena?</a></span><br/>
            <span class="outline1">9. <a href="/">Rating Changes</a></span><br/>
            <span class="outline1">10. <a href="/">Web Site Statistics</a></span><br/>
            <span class="outline1">11. <a href="/">Problems in the Practice Rooms</a></span></p>

         <p><br/></p>
         </td>
<!-- Center Column Ends -->

<!-- Gutter -->
         <td width="15"><img src="/i/clear.gif" width="15" height="1" border="0"></td>
<!-- Gutter Ends -->

<!-- Right Column Begins -->
         <td width="170">
            <jsp:include page="../public_right.jsp">
               <jsp:param name="level1" value="privatelabel"/>
            </jsp:include>
         </td>
<!-- Right Column Ends -->

<!-- Gutter -->
         <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<!-- Gutter Ends -->
    </tr>
</table>

<jsp:include page="../foot.jsp" />

</body>

</html>
