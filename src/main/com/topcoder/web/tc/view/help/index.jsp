
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
        <td width="100%" align="left" class="bodyText">
        <img src="/i/clear.gif" alt="" width="1" height="10" border="0" /><br/>
        <jsp:include page="../body_top.jsp" >
           <jsp:param name="image" value="help"/>  
           <jsp:param name="image1" value="white"/>  
           <jsp:param name="title" value="Competition Manual"/>  
        </jsp:include>

        <h2>Competition Manual</h2>

        <p><span class="bodySubtitle">General TopCoder Arena Usage / Getting Started</span><br/>
            <span class="outline1">1 <a href="/tc?module=Static&d1=help&d2=getStarted#becomemember">Become a TopCoder Member</a></span><br/>
            <span class="outline1">2 <a href="/tc?module=Static&d1=help&d2=getStarted#whatisarena">What is the TopCoder Arena?</a></span><br/>
            <span class="outline1">3 <a href="/tc?module=Static&d1=help&d2=getStarted#howtorun">How to Run the TopCoder Arena</a></span><br/>
                <span class="outline2">3.1 <a href="/tc?module=Static&d1=help&d2=getStarted#whatsoftware">What software will you need to install?</a></span><br/>
                <span class="outline2">3.2 <a href="/tc?module=Static&d1=help&d2=getStarted#runningarena">Running the TopCoder Arena as an Applet or by using Java Web Start</a></span><br/>
                <span class="outline2">3.3 <a href="/tc?module=Static&d1=help&d2=getStarted#localfirewall">Local Firewall and Network Considerations</a></span><br/>
                <span class="outline2">3.4 <a href="/tc?module=Static&d1=help&d2=getStarted#httptunneling">HTTP Tunneling</a></span><br/>
            <span class="outline1">4 <a href="/tc?module=Static&d1=help&d2=getStarted#loggingin">Logging in to the TopCoder Arena</a></span><br/>
            <span class="outline1">5 <a href="/tc?module=Static&d1=help&d2=getStarted#generalusage">General Usage and the Various Lobbies</a></span><br/>
            <span class="outline1">6 <a href="/tc?module=Static&d1=help&d2=getStarted#chatting">Chatting / Asking Questions</a></span><br/>
                <span class="outline2">6.1 <a href="/tc?module=Static&d1=help&d2=getStarted#generalchat">General Chat</a></span><br/>
                <span class="outline2">6.2 <a href="/tc?module=Static&d1=help&d2=getStarted#replyto">ReplyTo</a></span><br/>
                <span class="outline2">6.3 <a href="/tc?module=Static&d1=help&d2=getStarted#whisper">Whisper</a></span><br/>
                <span class="outline2">6.4 <a href="/tc?module=Static&d1=help&d2=getStarted#admin">Admin</a></span><br/>
                <span class="outline2">6.5 <a href="/tc?module=Static&d1=help&d2=getStarted#autochat">Auto-Enhanced Chat</a></span><br/>
                <span class="outline2">6.6 <a href="/tc?module=Static&d1=help&d2=getStarted#emoting">Emoting</a></span><br/>
            <span class="outline1">7 <a href="/tc?module=Static&d1=help&d2=getStarted#othermembers">Other Members in the Arena</a></span><br/>
                <span class="outline2">7.1 <a href="/tc?module=Static&d1=help&d2=getStarted#getinfo">Getting Information about another Member</a></span><br/>
                <span class="outline2">7.2 <a href="/tc?module=Static&d1=help&d2=getStarted#findmember">Finding Another Member</a></span><br/>
                <span class="outline2">7.3 <a href="/tc?module=Static&d1=help&d2=getStarted#seemembers">Seeing Who's in the Arena</a></span><br/>
            <span class="outline1">8 <a href="/tc?module=Static&d1=help&d2=getStarted#movingaround">Moving Around</a></span><br/>
            <span class="outline1">9 <a href="/tc?module=Static&d1=help&d2=getStarted#leaderboard">The Leader Board</a></span><br/>

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
            <span class="outline1">1. <a href="/tc?module=Static&d1=help&d2=competing#when">When are the Rated Events?</a></span><br/>
            <span class="outline1">2. <a href="/tc?module=Static&d1=help&d2=competing#rated">How does a Rated Event Differ from the Practice Room?</a></span><br/>
            <span class="outline1">3. <a href="/tc?module=Static&d1=help&d2=competing#registration">Registration for a Rated Event</a></span><br/>
                <span class="outline2">3.1. <a href="/tc?module=Static&d1=help&d2=competing#logout">Can I log out after I register?</a></span><br/>
            <span class="outline1">4. <a href="/tc?module=Static&d1=help&d2=competing#rooms">Room Assignments – Getting to Your Room</a></span><br/>
            <span class="outline1">5. <a href="/tc?module=Static&d1=help&d2=competing#phases">The Phases of a Rated Event (Including Scoring and Length of Time)</a></span><br/>
                <span class="outline2">5.1. <a href="/tc?module=Static&d1=help&d2=competing#coding">Coding Phase</a></span><br/>
                    <span class="outline3">5.1.1. <a href="/tc?module=Static&d1=help&d2=competing#scoring">Scoring</a></span><br/>
                    <span class="outline3">5.1.2. <a href="/tc?module=Static&d1=help&d2=competing#submissions">Multiple Submission</a></span><br/>
                <span class="outline2">5.2. <a href="/tc?module=Static&d1=help&d2=competing#intermission">Intermission</a></span><br/>
                <span class="outline2">5.3. <a href="/tc?module=Static&d1=help&d2=competing#challenge">Challenge Phase</a></span><br/>
                    <span class="outline3">5.3.1. <a href="/tc?module=Static&d1=help&d2=competing#multChall">Multiple Challenge</a></span><br/>
                    <span class="outline3">5.3.2. <a href="/tc?module=Static&d1=help&d2=competing#zero">Challenge with Zero Points</a></span><br/>
                    <span class="outline3">5.3.3. <a href="/tc?module=Static&d1=help&d2=competing#scoring">Scoring</a></span><br/>
                <span class="outline2">5.4. <a href="/tc?module=Static&d1=help&d2=competing#sysTests">System Testing</a></span><br/>
                    <span class="outline3">5.4.1. <a href="/tc?module=Static&d1=help&d2=competing#testCases">Test Cases from Challenges</a></span><br/>
            <span class="outline1">6. <a href="/tc?module=Static&d1=help&d2=competing#broadcast">Broadcast Messages</a></span><br/>
            <span class="outline1">7. <a href="/tc?module=Static&d1=help&d2=competing#help">Getting Help</a></span><br/>
                <span class="outline2">7.1. <a href="/tc?module=Static&d1=help&d2=competing#help">Using “admins: “</a></span><br/>
                <span class="outline2">7.2. <a href="/tc?module=Static&d1=help&d2=competing#help">The Admin Lobby Room</a></span><br/>
                <span class="outline2">7.3. <a href="/tc?module=Static&d1=help&d2=competing#help">IM</a></span><br/>
            <span class="outline1">8. <a href="/tc?module=Static&d1=help&d2=competing#disconnected">What If You Get Disconnected from the Arena?</a></span><br/>
            <span class="outline1">9. <a href="/tc?module=Static&d1=help&d2=competing#rating">Rating Changes</a></span><br/>
            <span class="outline1">10. <a href="/tc?module=Static&d1=help&d2=competing#statistics">Web Site Statistics</a></span><br/>
            <span class="outline1">11. <a href="/tc?module=Static&d1=help&d2=competing#practice">Problems in the Practice Rooms</a></span><br/>
            <span class="outline1">12. <a href="/tc?module=Static&d1=help&d2=competing#results">What if You Do Not Agree with the Results?</a></span><br/>
            <span class="outline1">13. <a href="/tc?module=Static&d1=help&d2=competing#cheating">Cheating at TopCoder</a></span><br/>
            <span class="outline1">14. <a href="/tc?module=Static&d1=help&d2=competing#prewritten">Using Pre-Written Code</a></span></p>
            

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
