<%@ page contentType="text/html;charset=utf-8" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer" %>
<%@ page language="java" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>TopCoder High School Competitions: Spotlight Sessions</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>

    <jsp:include page="/script.jsp"/>
    <jsp:include page="/style.jsp">
        <jsp:param name="key" value="tc_stats"/>
    </jsp:include>

</head>

<body>

<jsp:include page="../top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
<tbody>
    <tr valign="top">
<%-- Left Column Begins--%>
        <td width="180">
            <jsp:include page="../includes/global_left.jsp">
                <jsp:param name="node" value="hs_overview"/>
            </jsp:include>
        </td>
<%-- Left Column Ends --%>

<%-- Center Column Begins --%>
        <td width="100%" align="center" class="bodyColumn">
            <div class="fixedWidthBody">

                <div align="center">
                    <img src="/i/hs/banner.jpg" alt="TopCoder High School" border="0">
                </div>
                <br />
                <div align="center">
                    <%--
                    <a href="/tc?module=Static&amp;d1=hs&amp;d2=spotlightSessions"><img src="/i/hs/spotlight_sessions_header.png" alt="Spotlight Sessions" border="0"></a>
                    --%>
                    <a href="/tc?module=Static&amp;d1=hs&amp;d2=spotlightSessions"><img src="/i/hs/tchs_spotlightbanner.jpg" alt="Spotlight Sessions" border="0"></a>
                </div>
                <br />
                <div align="right" style="text-decoration:none;"><tc-webtag:forumLink forumID="523401" message="Discuss this" /></div>
                <br />

                <table class="stat" style="width: 100%;" cellpadding="0" cellspacing="0">
<thead>
    <tr>
        <td class="title" colspan="2">
        <div>Chat transcript from TCHS SRM 59: Spotlight Session with <tc-webtag:handle coderId="19849563" context="algorithm" /></div>
        </td>
    </tr>
    <tr>
        <td class="header">
        Handle
        </td>
        <td class="header">
        Comment
        </td>
    </tr>
</thead>

<tr class="light"><td class="value"><strong>FameofLight</strong></td><td class="value">ACRush: Finally the god of programming arrives</td></tr>
<tr class="dark"><td class="value"><strong>Sarkin</strong></td><td class="value">ACRush: Why? when they will come they'll ask their questions!:D:D:D</td></tr>
<tr class="light"><td class="value"><strong>themaster</strong></td><td class="value">ACRush: thank you for your time</td></tr>
<tr class="dark"><td class="value"><strong>themaster</strong></td><td class="value">ACRush: really appreciating</td></tr>
<tr class="light"><td class="value"><strong>jmpld40</strong></td><td class="value">Hi everyone, this chat will officially start in about 10 minutes</td></tr>
<tr class="dark"><td class="value"><strong>ktuan</strong></td><td class="value">noone chat here ?</td></tr>
<tr class="light"><td class="value"><strong>FameofLight</strong></td><td class="value">jmpld40: hi</td></tr>
<tr class="dark"><td class="value"><strong>ardiankp</strong></td><td class="value">ACRush: hi, how was ntu? :)</td></tr>
<tr class="light"><td class="value"><strong>jmpld40</strong></td><td class="value">FameofLight: hello</td></tr>
<tr class="dark"><td class="value"><strong>ardiankp</strong></td><td class="value">ACRush: sorry I was away last time</td></tr>
<tr class="light"><td class="value"><span class="bigRed">ACRush</span></td><td class="value"><span class="bigRed">ardiankp: Great. but a little hot..</span></td></tr>
<tr class="dark"><td class="value"><strong>ktuan</strong></td><td class="value">ACRush: this season is better</td></tr>
<tr class="light"><td class="value"><strong>ktuan</strong></td><td class="value">ACRush: because of rain</td></tr>
<tr class="dark"><td class="value"><strong>ardiankp</strong></td><td class="value">ktuan: rain is not fun!</td></tr>
<tr class="light"><td class="value"><span class="bigRed">ACRush</span></td><td class="value"><span class="bigRed">ardiankp: seasons of SG?</span></td></tr>
<tr class="dark"><td class="value"><strong>ardiankp</strong></td><td class="value">ACRush: rainy season</td></tr>
<tr class="light"><td class="value"><strong>MB__</strong></td><td class="value">hi</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">ACRush</span></td><td class="value"><span class="bigRed">ardiankp: I see. :)</span></td></tr>
<tr class="light"><td class="value"><strong>ardiankp</strong></td><td class="value">ACRush: what did you do actually?</td></tr>
<tr class="dark"><td class="value"><strong>MB__</strong></td><td class="value">have people already started asking questions to ACRush?</td></tr>
<tr class="light"><td class="value"><strong>ardiankp</strong></td><td class="value">ACRush: presentation of what?</td></tr>
<tr class="dark"><td class="value"><strong>Sarkin</strong></td><td class="value">MB__: No.</td></tr>
<tr class="light"><td class="value"><span class="bigRed">ACRush</span></td><td class="value"><span class="bigRed">ardiankp: some representation.</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">ACRush</span></td><td class="value"><span class="bigRed">ardiankp: the report of my final year project.</span></td></tr>
<tr class="light"><td class="value"><strong>hamedvalizadeh</strong></td><td class="value">MB__: 9 min</td></tr>
<tr class="dark"><td class="value"><strong>ktuan</strong></td><td class="value">ACRush: what is it about ?</td></tr>
<tr class="light"><td class="value"><strong>ardiankp</strong></td><td class="value">ACRush: wow, cool</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">ACRush</span></td><td class="value"><span class="bigRed">ardiankp: Crypyto</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">ACRush</span></td><td class="value"><span class="bigRed">ardiankp: Crypto</span></td></tr>
<tr class="dark"><td class="value"><strong>themaster</strong></td><td class="value">ACRush: what is crypto</td></tr>
<tr class="light"><td class="value"><strong>themaster</strong></td><td class="value">ACRush: ?</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">ACRush</span></td><td class="value"><span class="bigRed">themaster: cryptography</span></td></tr>
<tr class="light"><td class="value"><strong>ktuan</strong></td><td class="value">themaster: the basic of information security :p</td></tr>
<tr class="dark"><td class="value"><strong>innocentboy</strong></td><td class="value">ktuan: :)</td></tr>
<tr class="light"><td class="value"><strong>themaster</strong></td><td class="value">ACRush: hmmm</td></tr>
<tr class="dark"><td class="value"><strong>themaster</strong></td><td class="value">ACRush: ...</td></tr>
<tr class="light"><td class="value"><strong>ardiankp</strong></td><td class="value">ACRush: you got paper published?</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">ACRush</span></td><td class="value"><span class="bigRed">ardiankp: Not yet.</span></td></tr>
<tr class="light"><td class="value"><strong>ktuan</strong></td><td class="value">themaster: when did you start programming ?</td></tr>
<tr class="dark"><td class="value"><strong>FameofLight</strong></td><td class="value">ACRush: do you follow a random practice , or you practice question by topic , in your early days</td></tr>
<tr class="light"><td class="value"><strong>themaster</strong></td><td class="value">ACRush: from about 7 months</td></tr>
<tr class="dark"><td class="value"><strong>themaster</strong></td><td class="value">ACRush: why??</td></tr>
<tr class="light"><td class="value"><strong>ktuan</strong></td><td class="value">themaster: Did you study in a special class for talent student in high school ?</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">ACRush</span></td><td class="value"><span class="bigRed">ktuan: er.. 7 years ago</span></td></tr>
<tr class="light"><td class="value"><strong>themaster</strong></td><td class="value">ACRush: well actually </td></tr>
<tr class="dark"><td class="value"><strong>themaster</strong></td><td class="value">ACRush: in my home there is no such thing as a class for talent student</td></tr>
<tr class="light"><td class="value"><span class="bigRed">ACRush</span></td><td class="value"><span class="bigRed">FameofLight: Do you mean ICPC or TC?</span></td></tr>
<tr class="dark"><td class="value"><strong>FameofLight</strong></td><td class="value">jmpld40: I know its difficult , but see if you can do something</td></tr>
<tr class="light"><td class="value"><strong>FameofLight</strong></td><td class="value">ACRush: yes</td></tr>
<tr class="dark"><td class="value"><strong>FameofLight</strong></td><td class="value">ACRush: ICPC</td></tr>
<tr class="light"><td class="value"><strong>Sarkin</strong></td><td class="value">ACRush: How old are you?</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">ACRush</span></td><td class="value"><span class="bigRed">FameofLight: No, our team practiced 3 or 4 full contests a week.</span></td></tr>
<tr class="light"><td class="value"><strong>ktuan</strong></td><td class="value">ACRush: Did you study in a special class for talent student in high school ? ( sorry, sent wrong )</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">ACRush</span></td><td class="value"><span class="bigRed">Sarkin: 22</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">ACRush</span></td><td class="value"><span class="bigRed">ktuan: No.</span></td></tr>
<tr class="dark"><td class="value"><strong>Sarkin</strong></td><td class="value">ACRush: Did you participate in the IOI? if yes did you get any medal?</td></tr>
<tr class="light"><td class="value"><strong>innocentboy</strong></td><td class="value">Sarkin: he got a gold I think.</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">ACRush</span></td><td class="value"><span class="bigRed">Sarkin: I joint IOI2004.</span></td></tr>
<tr class="light"><td class="value"><strong>pt1989</strong></td><td class="value">ACRush: Can u tell us whom or what do u credit for ur success?</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">ACRush</span></td><td class="value"><span class="bigRed">Sarkin: And I won the third place.</span></td></tr>
<tr class="light"><td class="value"><strong>algoboy</strong></td><td class="value">Sarkin: he's gold medal IOI 2004</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">ACRush</span></td><td class="value"><span class="bigRed">pt1989: I think more practice is the way.</span></td></tr>
<tr class="light"><td class="value"><strong>jmpld40</strong></td><td class="value">FameofLight: sure, i'll let you kjonw</td></tr>
<tr class="dark"><td class="value"><strong>pt1989</strong></td><td class="value">ACRush: but any specific person or camp that you think sets u apart?</td></tr>
<tr class="light"><td class="value"><strong>Sarkin</strong></td><td class="value">ACRush: Did you use any source other than the contests like books to learn algorithms?</td></tr>
<tr class="dark"><td class="value"><strong>jmpld40</strong></td><td class="value">FameofLight: *know</td></tr>
<tr class="light"><td class="value"><strong>FameofLight</strong></td><td class="value">ACRush: any specific approach , helpful for preparing ACM Regionals</td></tr>
<tr class="dark"><td class="value"><strong>ktuan</strong></td><td class="value">ACRush: how can you arrange your study with 3-4 contests a week ?</td></tr>
<tr class="light"><td class="value"><span class="bigRed">ACRush</span></td><td class="value"><span class="bigRed">Sarkin: No.</span></td></tr>
<tr class="dark"><td class="value"><strong>vrajesh1989</strong></td><td class="value">ACRush: Happiest moment of your life?</td></tr>
<tr class="light"><td class="value"><strong>FameofLight</strong></td><td class="value">ACRush: because blind practice , doesn't work for me</td></tr>
<tr class="dark"><td class="value"><strong>algoboy</strong></td><td class="value">ACRush: why you didn't participate in the last ACM ICPC Final ? Is it true what lympanda said about Tsinghua rule ?</td></tr>
<tr class="light"><td class="value"><span class="bigRed">ACRush</span></td><td class="value"><span class="bigRed">ktuan: UVA, SGU , ZJU and PKU is enough.</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">ACRush</span></td><td class="value"><span class="bigRed">vrajesh1989: IOI2004</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">ACRush</span></td><td class="value"><span class="bigRed">algoboy: er..</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">ACRush</span></td><td class="value"><span class="bigRed">algoboy: In our university, one person is really hard to participate two WFs.</span></td></tr>
<tr class="light"><td class="value"><strong>ktuan</strong></td><td class="value">ACRush: when did you practice harder ? in high school ( for IOI ) or in Univ ( for ICPC ) ?</td></tr>
<tr class="dark"><td class="value"><strong>pt1989</strong></td><td class="value">ACRush: what is ur method of  practising?</td></tr>
<tr class="light"><td class="value"><strong>pt1989</strong></td><td class="value">ACRush: random or organised?</td></tr>
<tr class="dark"><td class="value"><strong>lvhuiwei</strong></td><td class="value">ACRush: what do you find most exciting in algorithms?</td></tr>
<tr class="light"><td class="value"><span class="bigRed">ACRush</span></td><td class="value"><span class="bigRed">ktuan: In HS, and I stop practicing one year after IOI2004.</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">ACRush</span></td><td class="value"><span class="bigRed">pt1989: contest env.</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">ACRush</span></td><td class="value"><span class="bigRed">pt1989: We always solve programs in contest env.</span></td></tr>
<tr class="dark"><td class="value"><strong>themaster</strong></td><td class="value">ACRush: what do you recommend to do in order to improve the ability to solve dp problems</td></tr>
<tr class="light"><td class="value"><span class="bigRed">ACRush</span></td><td class="value"><span class="bigRed">lvhuiwei: the complexity.</span></td></tr>
<tr class="dark"><td class="value"><strong>pt1989</strong></td><td class="value">ACRush: at what age did u start programming? </td></tr>
<tr class="light"><td class="value"><strong>FameofLight</strong></td><td class="value">sanky29288: what happened</td></tr>
<tr class="dark"><td class="value"><strong>themaster</strong></td><td class="value">ACRush: any books</td></tr>
<tr class="light"><td class="value"><strong>themaster</strong></td><td class="value">ACRush: ???</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">ACRush</span></td><td class="value"><span class="bigRed">themaster: dp? = dynamic programming.</span></td></tr>
<tr class="light"><td class="value"><strong>algoboy</strong></td><td class="value">ACRush: why you and Zhuzeyuan not in the same team in the ICPC ?</td></tr>
<tr class="dark"><td class="value"><strong>themaster</strong></td><td class="value">ACRush: yes</td></tr>
<tr class="light"><td class="value"><strong>jmpld40</strong></td><td class="value">hi everyone!  we're going to get this chat started.  please realize there are many people questions for ACRush so if your question is not answered you can post it here:  <a href="http://<%=ApplicationServer.FORUMS_SERVER_NAME%>/?module=Thread&amp;threadID=625150">http://forums.topcoder.com/?module=Thread&amp;threadID=625150</a></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">ACRush</span></td><td class="value"><span class="bigRed">about 16.</span></td></tr>
<tr class="light"><td class="value"><strong>ahm.kam_92</strong></td><td class="value">ACRush: how old r u ?</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">ACRush</span></td><td class="value"><span class="bigRed">22.</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">ACRush</span></td><td class="value"><span class="bigRed">ahm.kam_92: 22</span></td></tr>
<tr class="dark"><td class="value"><strong>jmpld40</strong></td><td class="value">welcome to the chat!</td></tr>
<tr class="light"><td class="value"><strong>Sarkin</strong></td><td class="value">ACRush: Is starting at a young age have an effect?</td></tr>
<tr class="dark"><td class="value"><strong>kcm1700</strong></td><td class="value">how old were you when you started algorithm study?</td></tr>
<tr class="light"><td class="value"><strong>ahm.kam_92</strong></td><td class="value">ACRush: :) nice</td></tr>
<tr class="dark"><td class="value"><strong>jmpld40</strong></td><td class="value">hi everyone!  we're going to get this chat started.  please realize there are many people questions for ACRush so if your question is not answered you can post it here:  <a href="http://<%=ApplicationServer.FORUMS_SERVER_NAME%>/?module=Thread&amp;threadID=625150">http://forums.topcoder.com/?module=Thread&amp;threadID=625150</a></td></tr>
<tr class="light"><td class="value"><strong>oa12gb</strong></td><td class="value">ACRush: how did u started learning programing and algorithms?</td></tr>
<tr class="dark"><td class="value"><strong>binarywithme</strong></td><td class="value">ACRush: hii sir</td></tr>
<tr class="light"><td class="value"><strong>Soyoja</strong></td><td class="value">Why aren't you any more participate ACM-ICPC ?</td></tr>
<tr class="dark"><td class="value"><strong>ahm.kam_92</strong></td><td class="value">ACRush: how can i be like u ?</td></tr>
<tr class="light"><td class="value"><span class="bigRed">ACRush</span></td><td class="value"><span class="bigRed">Sarkin: Only good effect. I believe.</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">ACRush</span></td><td class="value"><span class="bigRed">oa12gb: from my coach.</span></td></tr>
<tr class="light"><td class="value"><strong>Sarkin</strong></td><td class="value">oa12gb: Hello!</td></tr>
<tr class="dark"><td class="value"><strong>binarywithme</strong></td><td class="value">ACRush: i need some suggestions to prepare for ACM ICPC</td></tr>
<tr class="light"><td class="value"><span class="bigRed">ACRush</span></td><td class="value"><span class="bigRed">binarywithme: hi</span></td></tr>
<tr class="dark"><td class="value"><strong>oa12gb</strong></td><td class="value">ACRush: yes what was your scedule</td></tr>
<tr class="light"><td class="value"><strong>abs_abs</strong></td><td class="value">ACRush: do you have any blog or website ?</td></tr>
<tr class="dark"><td class="value"><strong>vijay_comc</strong></td><td class="value">Hello AC Rush :)</td></tr>
<tr class="light"><td class="value"><strong>zhangmingwen</strong></td><td class="value">hello,are you in qinghua university</td></tr>
<tr class="dark"><td class="value"><strong>algoboy</strong></td><td class="value">ACRush: who is your coach ?</td></tr>
<tr class="light"><td class="value"><span class="bigRed">ACRush</span></td><td class="value"><span class="bigRed">binarywithme: contest env.</span></td></tr>
<tr class="dark"><td class="value"><strong>Seraphy</strong></td><td class="value">Hi Ac</td></tr>
<tr class="light"><td class="value"><strong>Sunny_05</strong></td><td class="value">ACRush: wat is ur daily routine ??</td></tr>
<tr class="dark"><td class="value"><strong>vijay_comc</strong></td><td class="value">contest environment ?</td></tr>
<tr class="light"><td class="value"><span class="bigRed">ACRush</span></td><td class="value"><span class="bigRed">abs_abs: sorry. I don't.</span></td></tr>
<tr class="dark"><td class="value"><strong>Sunny_05</strong></td><td class="value">ACRush: i mean hw do u practice everyday ??</td></tr>
<tr class="light"><td class="value"><strong>ahm.kam_92</strong></td><td class="value">ACRush: what did u do to be in that good rate in programming ?</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">ACRush</span></td><td class="value"><span class="bigRed">algoboy: His name is Lijianjiang.</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">ACRush</span></td><td class="value"><span class="bigRed">Sunny_05: We only have weekly routine for practice.</span></td></tr>
<tr class="dark"><td class="value"><strong>Sarkin</strong></td><td class="value">ACRush: Do you recommned reading "Introduction to Algorithms"? if you know?</td></tr>
<tr class="light"><td class="value"><strong>Dee2306</strong></td><td class="value">ACRush: Are u married.. ? or any gf ?</td></tr>
<tr class="dark"><td class="value"><strong>AlexErofeev</strong></td><td class="value">ACRush: where do you work or plan to work?</td></tr>
<tr class="light"><td class="value"><strong>zhangmingwen</strong></td><td class="value">ac</td></tr>
<tr class="dark"><td class="value"><strong>binarywithme</strong></td><td class="value">ACRush: what u think about world final problems..level of difficulty</td></tr>
<tr class="light"><td class="value"><strong>Dee2306</strong></td><td class="value">ACRush: common ques..</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">ACRush</span></td><td class="value"><span class="bigRed">ahm.kam_92: High rate in TC need more accuracy.</span></td></tr>
<tr class="light"><td class="value"><strong>habachionline</strong></td><td class="value">ACRush: how i can prove myself in the dynamic programing</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">ACRush</span></td><td class="value"><span class="bigRed">Sarkin: Really good.</span></td></tr>
<tr class="light"><td class="value"><strong>habachionline</strong></td><td class="value">ACRush: ??</td></tr>
<tr class="dark"><td class="value"><strong>Sarkin</strong></td><td class="value">ACRush: And math any books?</td></tr>
<tr class="light"><td class="value"><strong>ahm.kam_92</strong></td><td class="value">ACRush: no no not in TC</td></tr>
<tr class="dark"><td class="value"><strong>Sunny_05</strong></td><td class="value">ACRush: any advice for beginners ??</td></tr>
<tr class="light"><td class="value"><strong>ahm.kam_92</strong></td><td class="value">ACRush: in programming at all</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">ACRush</span></td><td class="value"><span class="bigRed">Dee2306: No idea.</span></td></tr>
<tr class="light"><td class="value"><strong>Soyoja</strong></td><td class="value">I think you participated ACM-ICPC only one time. Why aren't you any more participate ACM-ICPC?</td></tr>
<tr class="dark"><td class="value"><strong>vrajesh1989</strong></td><td class="value">ACRush: Thinking under Pressure.. Please give tips on it. </td></tr>
<tr class="light"><td class="value"><span class="bigRed">ACRush</span></td><td class="value"><span class="bigRed">AlexErofeev: ITCS.</span></td></tr>
<tr class="dark"><td class="value"><strong>ahm.kam_92</strong></td><td class="value">ACRush: we wanna know ur history</td></tr>
<tr class="light"><td class="value"><strong>oa12gb</strong></td><td class="value">ACRush: did u enter IOI before?</td></tr>
<tr class="dark"><td class="value"><strong>kcm1700</strong></td><td class="value">ACRush: did you participated in IOI?</td></tr>
<tr class="light"><td class="value"><strong>Dee2306</strong></td><td class="value">ACRush: hmmm .. u have no idea.. ?? wat does that mean ..haha ..</td></tr>
<tr class="dark"><td class="value"><strong>Sarkin</strong></td><td class="value">oa12gb: Yes.</td></tr>
<tr class="light"><td class="value"><strong>_sunny</strong></td><td class="value">ACRush: What is ur advice to have better understanding in probability?</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">ACRush</span></td><td class="value"><span class="bigRed">binarywithme: A little harder than 1000p.</span></td></tr>
<tr class="light"><td class="value"><strong>BryanPG</strong></td><td class="value">ACR</td></tr>
<tr class="dark"><td class="value"><strong>Sarkin</strong></td><td class="value">oa12gb: IOI 2004 gold medal 3 place.</td></tr>
<tr class="light"><td class="value"><strong>Dee2306</strong></td><td class="value">ACRush: u dont wanna tell...its ok then ..</td></tr>
<tr class="dark"><td class="value"><strong>binarywithme</strong></td><td class="value">ACRush: sir could u teel me any efficient bipartitated matching algorithm</td></tr>
<tr class="light"><td class="value"><strong>BryanPG</strong></td><td class="value">ACRush: do you use any IDE or just notepad?</td></tr>
<tr class="dark"><td class="value"><strong>ahm.kam_92</strong></td><td class="value">Sarkin: is there others ?</td></tr>
<tr class="light"><td class="value"><strong>K.A.D.R</strong></td><td class="value">ACRush: Are you interested in sports?</td></tr>
<tr class="dark"><td class="value"><strong>geekru2</strong></td><td class="value">ACRush: COuld u brief about you initial approach towards programming in ur learning day??</td></tr>
<tr class="light"><td class="value"><strong>Sarkin</strong></td><td class="value">ahm.kam_92: What do you mean?</td></tr>
<tr class="dark"><td class="value"><strong>vijay_comc</strong></td><td class="value">ACRush: logged out :o</td></tr>
<tr class="light"><td class="value"><strong>ahm.kam_92</strong></td><td class="value">Sarkin: other iois he participated in</td></tr>
<tr class="dark"><td class="value"><strong>MB__</strong></td><td class="value">ACRush: Which of these do you do after you submit your solution on TC: test solution, re-read problem statement, check code line by line</td></tr>
<tr class="light"><td class="value"><span class="bigRed">ACRush</span></td><td class="value"><span class="bigRed">Sorry..</span></td></tr>
<tr class="dark"><td class="value"><strong>Sarkin</strong></td><td class="value">ahm.kam_92: I don't think.</td></tr>
<tr class="light"><td class="value"><strong>Sarkin</strong></td><td class="value">ahm.kam_92: No.</td></tr>
<tr class="dark"><td class="value"><strong>binarywithme</strong></td><td class="value">ACRush: BIPARTED MATCHING algorithm</td></tr>
<tr class="light"><td class="value"><span class="bigRed">ACRush</span></td><td class="value"><span class="bigRed">I loged out due to the network problem.</span></td></tr>
<tr class="dark"><td class="value"><strong>BatusaiX</strong></td><td class="value">ACRush: There is Topcoder Community in Beijing now i'm living here i will like to meet you guys?</td></tr>
<tr class="light"><td class="value"><strong>tito.temp</strong></td><td class="value">ahm.kam_92: sabba7</td></tr>
<tr class="dark"><td class="value"><strong>BryanPG</strong></td><td class="value">ACRush: Do you use any IDE or just notepad?</td></tr>
<tr class="light"><td class="value"><span class="bigRed">ACRush</span></td><td class="value"><span class="bigRed">MB__: test.</span></td></tr>
<tr class="dark"><td class="value"><strong>nnhthuan</strong></td><td class="value">...</td></tr>
<tr class="light"><td class="value"><span class="bigRed">ACRush</span></td><td class="value"><span class="bigRed">MB__: test for at least 10 cases.</span></td></tr>
<tr class="dark"><td class="value"><strong>geekru2</strong></td><td class="value"> ACRush: COuld u brief about you initial approach towards programming in ur learning day??</td></tr>
<tr class="light"><td class="value"><strong>habachionline</strong></td><td class="value">ACRush: how i can prove myself in the dynamic programing</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">ACRush</span></td><td class="value"><span class="bigRed">BatusaiX: Ok. I will.</span></td></tr>
<tr class="light"><td class="value"><strong>_sunny</strong></td><td class="value">ACRush: What is ur advice to have better understanding in probability?</td></tr>
<tr class="dark"><td class="value"><strong>martins256</strong></td><td class="value">ACRush: how many problems have you solved on OJ ?</td></tr>
<tr class="light"><td class="value"><strong>zhangmingwen</strong></td><td class="value">ACRush: hi,what is your major?</td></tr>
<tr class="dark"><td class="value"><strong>binarywithme</strong></td><td class="value">ACRush: sir could u teel me any efficient bipartated matching algorithm</td></tr>
<tr class="light"><td class="value"><span class="bigRed">ACRush</span></td><td class="value"><span class="bigRed">habachionline: It's obvious.</span></td></tr>
<tr class="dark"><td class="value"><strong>vijay_comc</strong></td><td class="value">ACRush: Who is your Arch Rival in Programming ? ;)</td></tr>
<tr class="light"><td class="value"><span class="bigRed">ACRush</span></td><td class="value"><span class="bigRed">martins256: about 2000.</span></td></tr>
<tr class="dark"><td class="value"><strong>kcm1700</strong></td><td class="value">ACRush: How many problems have you proposed on OJ or anything like this competition or something...?</td></tr>
<tr class="light"><td class="value"><span class="bigRed">ACRush</span></td><td class="value"><span class="bigRed">zhangmingwen: CS</span></td></tr>
<tr class="dark"><td class="value"><strong>Sarkin</strong></td><td class="value">ACRush: What math books do you recommend?</td></tr>
<tr class="light"><td class="value"><span class="bigRed">ACRush</span></td><td class="value"><span class="bigRed">binarywithme: I known one algorithm which time complexity is O(N^2.5).</span></td></tr>
<tr class="dark"><td class="value"><strong>geekru2</strong></td><td class="value">ACRu</td></tr>
<tr class="light"><td class="value"><span class="bigRed">ACRush</span></td><td class="value"><span class="bigRed">binarywithme: And forget its name.</span></td></tr>
<tr class="dark"><td class="value"><strong>ahm.kam_92</strong></td><td class="value">ACRush: what do u do in ur day ?</td></tr>
<tr class="light"><td class="value"><strong>tito.temp</strong></td><td class="value">ACRush: where do you work right now ??</td></tr>
<tr class="dark"><td class="value"><strong>Sarkin</strong></td><td class="value">ACRush: Did you only use your school math knowledge?</td></tr>
<tr class="light"><td class="value"><strong>ahm.kam_92</strong></td><td class="value">ACRush: how do u practice ?</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">ACRush</span></td><td class="value"><span class="bigRed">vijay_comc: Petr, I think.</span></td></tr>
<tr class="light"><td class="value"><strong>vrajesh1989</strong></td><td class="value">ACRush: Thinking under pressure.. Please give tips on it..</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">ACRush</span></td><td class="value"><span class="bigRed">kcm1700: about 2000.</span></td></tr>
<tr class="light"><td class="value"><strong>Sarkin</strong></td><td class="value">ACRush: Or did you use any books?</td></tr>
<tr class="dark"><td class="value"><strong>algoboy</strong></td><td class="value">ACRush: how about tomek ?</td></tr>
<tr class="light"><td class="value"><strong>binarywithme</strong></td><td class="value">ACRush: sir do u remember any resource this time..</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">ACRush</span></td><td class="value"><span class="bigRed">Sarkin: CLR.</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">ACRush</span></td><td class="value"><span class="bigRed">zhangmingwen: Yes.</span></td></tr>
<tr class="dark"><td class="value"><strong>Sarkin</strong></td><td class="value">ACRush: What is CLR.</td></tr>
<tr class="light"><td class="value"><strong>Sarkin</strong></td><td class="value">ACRush: ?</td></tr>
<tr class="dark"><td class="value"><strong>binarywithme</strong></td><td class="value">ACRush: sir i got stuck in a problum since last one month i need it</td></tr>
<tr class="light"><td class="value"><strong>SomethingWrong</strong></td><td class="value">ACRush: What is your favourite Online Judge? :)</td></tr>
<tr class="dark"><td class="value"><strong>Dee2306</strong></td><td class="value">ACRush: Being one of top programmers, do u believe its just practice which makes u perfect.. or some of u are born genius ?? :)</td></tr>
<tr class="light"><td class="value"><span class="bigRed">ACRush</span></td><td class="value"><span class="bigRed">binarywithme: sorry?</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">ACRush</span></td><td class="value"><span class="bigRed">SomethingWrong: SGU.</span></td></tr>
<tr class="light"><td class="value"><strong>binarywithme</strong></td><td class="value">ACRush: ok sir</td></tr>
<tr class="dark"><td class="value"><strong>vijay_comc</strong></td><td class="value">Sarkin: Cormen Lieserson Rivest Stein -&gt; Intorduction to Algorithms</td></tr>
<tr class="light"><td class="value"><strong>vexorian</strong></td><td class="value">ACRush: Why SGU?</td></tr>
<tr class="dark"><td class="value"><strong>Soyoja</strong></td><td class="value">I think you participated ACM-ICPC only one time. Why aren't you participate ACM-ICPC anymore?</td></tr>
<tr class="light"><td class="value"><span class="bigRed">ACRush</span></td><td class="value"><span class="bigRed">Dee2306: It's at least 80% due to practice</span></td></tr>
<tr class="dark"><td class="value"><strong>geekru2</strong></td><td class="value">ACRush: Do you think the set of probelems you solve (as in programming compettiton problems) would be helpful in real life during ur job?</td></tr>
<tr class="light"><td class="value"><strong>Sarkin</strong></td><td class="value">ACRush: I mean math books not algorithm!?</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">ACRush</span></td><td class="value"><span class="bigRed">vexorian: More tricky testcases.</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">ACRush</span></td><td class="value"><span class="bigRed">geekru2: a little.</span></td></tr>
<tr class="dark"><td class="value"><strong>Dee2306</strong></td><td class="value">ACRush: i get it.</td></tr>
<tr class="light"><td class="value"><strong>bucephalus</strong></td><td class="value">vexorian: and, he finished doing all the tasks afaik ;)</td></tr>
<tr class="dark"><td class="value"><strong>stormsky</strong></td><td class="value">ACRush: how to practice ACM for a ACM beginner?</td></tr>
<tr class="light"><td class="value"><strong>seaking</strong></td><td class="value">what's url SGU?</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">ACRush</span></td><td class="value"><span class="bigRed">Sarkin: My textbooks.</span></td></tr>
<tr class="light"><td class="value"><strong>ktuan</strong></td><td class="value">seaking: acm.sgu.ru</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">ACRush</span></td><td class="value"><span class="bigRed">stormsky: practice in contest env.</span></td></tr>
<tr class="light"><td class="value"><strong>Sarkin</strong></td><td class="value">ACRush: What do you mean?</td></tr>
<tr class="dark"><td class="value"><strong>seaking</strong></td><td class="value">thanks</td></tr>
<tr class="light"><td class="value"><strong>Soyoja</strong></td><td class="value">ACRush: I think you participated ACM-ICPC only one time. Why aren't you participate ACM-ICPC anymore?</td></tr>
<tr class="dark"><td class="value"><strong>Sarkin</strong></td><td class="value">ACRush: What are your textbooks?</td></tr>
<tr class="light"><td class="value"><strong>Dee2306</strong></td><td class="value">ACRush: hey can u plz list one of ur textbuks here..</td></tr>
<tr class="dark"><td class="value"><strong>vexorian</strong></td><td class="value">Soyoja: I think he read you the first time...</td></tr>
<tr class="light"><td class="value"><strong>lvhuiwei</strong></td><td class="value">ACRush: what are you planning to do after graduate?</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">ACRush</span></td><td class="value"><span class="bigRed">Sarkin: I don't have any special math books.</span></td></tr>
<tr class="light"><td class="value"><strong>martins256</strong></td><td class="value">Sarkin: I guess some chinice books</td></tr>
<tr class="dark"><td class="value"><strong>martins256</strong></td><td class="value">Sarkin: chinise</td></tr>
<tr class="light"><td class="value"><strong>vrajesh1989</strong></td><td class="value">ACRush: What is your interested area in algorithms?</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">ACRush</span></td><td class="value"><span class="bigRed">Sarkin: The book used in our uni.</span></td></tr>
<tr class="light"><td class="value"><strong>martins256</strong></td><td class="value">ACRush: how old are you?</td></tr>
<tr class="dark"><td class="value"><strong>themaster</strong></td><td class="value">ACRush: any advice about increasing the ability to solve dynamic programming problem </td></tr>
<tr class="light"><td class="value"><strong>Sarkin</strong></td><td class="value">martins256: 22</td></tr>
<tr class="dark"><td class="value"><strong>piva</strong></td><td class="value">ACRush: Do you train more of one category of problems? Or you just solve problems at random?</td></tr>
<tr class="light"><td class="value"><span class="bigRed">ACRush</span></td><td class="value"><span class="bigRed">lvhuiwei: pursuing a PHD study.</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">ACRush</span></td><td class="value"><span class="bigRed">martins256: 22</span></td></tr>
<tr class="light"><td class="value"><strong>lvhuiwei</strong></td><td class="value">ACRush: PHD on what subject?</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">ACRush</span></td><td class="value"><span class="bigRed">lvhuiwei: Theory and Complexity.</span></td></tr>
<tr class="light"><td class="value"><strong>kcm1700</strong></td><td class="value">ACRush: do you have a girl friend?</td></tr>
<tr class="dark"><td class="value"><strong>puigy1</strong></td><td class="value">hi</td></tr>
<tr class="light"><td class="value"><strong>abs_abs</strong></td><td class="value">kcm1700: :D</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">ACRush</span></td><td class="value"><span class="bigRed">piva: I do more practice in the ones I have troubles with.</span></td></tr>
<tr class="light"><td class="value"><strong>geekru2</strong></td><td class="value">ACRush: whats been the longest problem solving spree u have been on?</td></tr>
<tr class="dark"><td class="value"><strong>Sarkin</strong></td><td class="value">ACRush: Is analyzing algorithms an essential part of learning algorithms?</td></tr>
<tr class="light"><td class="value"><span class="bigRed">ACRush</span></td><td class="value"><span class="bigRed">kcm1700: No.</span></td></tr>
<tr class="dark"><td class="value"><strong>freopen</strong></td><td class="value">ACRush: How do you start programming?</td></tr>
<tr class="light"><td class="value"><strong>kcm1700</strong></td><td class="value">ACRush: thank you for your response.</td></tr>
<tr class="dark"><td class="value"><strong>Dee2306</strong></td><td class="value">kcm1700: he's got no idea abt it.</td></tr>
<tr class="light"><td class="value"><strong>vijay_comc</strong></td><td class="value">This Girl Friend Question is one of most FAQ :)</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">ACRush</span></td><td class="value"><span class="bigRed">geekru2: longest or spree?</span></td></tr>
<tr class="light"><td class="value"><strong>lvhuiwei</strong></td><td class="value">ACRush: cool! I think it is exciting.</td></tr>
<tr class="dark"><td class="value"><strong>abdessamad</strong></td><td class="value">ACRush: hi!  i'm expecting if there are some tips for the challenge phases?</td></tr>
<tr class="light"><td class="value"><strong>piva</strong></td><td class="value">ACRush: Do you think there is a more important category of problems both for topcoder and ACM-ICPC?</td></tr>
<tr class="dark"><td class="value"><strong>K.A.D.R</strong></td><td class="value">ACRush: Are you interested in sports?</td></tr>
<tr class="light"><td class="value"><strong>geekru2</strong></td><td class="value">ACRush: hmm maybe both?? do u get stuff in problems for long?</td></tr>
<tr class="dark"><td class="value"><strong>pt1989</strong></td><td class="value">ACRush: what are ur interests other than programming?</td></tr>
<tr class="light"><td class="value"><span class="bigRed">ACRush</span></td><td class="value"><span class="bigRed">abdessamad: In fact, I'm not good at it.</span></td></tr>
<tr class="dark"><td class="value"><strong>vijay_comc</strong></td><td class="value">ACRush: Petr is already married. No plans to compete him in that area ? :D</td></tr>
<tr class="light"><td class="value"><strong>spiglerg</strong></td><td class="value">ACRush: yes, could you advice us on challenge phase?</td></tr>
<tr class="dark"><td class="value"><strong>pt1989</strong></td><td class="value">ACRush: what are ur interests other than programming?</td></tr>
<tr class="light"><td class="value"><strong>Sarkin</strong></td><td class="value">ACRush: Is analyzing algorithms an essential part of learning algorithms?</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">ACRush</span></td><td class="value"><span class="bigRed">pt1989: WarCraft.</span></td></tr>
<tr class="light"><td class="value"><strong>without</strong></td><td class="value">how long have you learn algorithm?</td></tr>
<tr class="dark"><td class="value"><strong>spiglerg</strong></td><td class="value">Sarkin: it should</td></tr>
<tr class="light"><td class="value"><strong>pt1989</strong></td><td class="value">ACRush: and ... wat else?</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">ACRush</span></td><td class="value"><span class="bigRed">vijay_comc: ....not yet.</span></td></tr>
<tr class="light"><td class="value"><strong>vexorian</strong></td><td class="value">ACRush: wc3  , wow or DOTA :) ?</td></tr>
<tr class="dark"><td class="value"><strong>geekru2</strong></td><td class="value">ACRush: would knowing all the algorithms and being able to code them fast do good enough? whats that extra bit required?</td></tr>
<tr class="light"><td class="value"><strong>vijay_comc</strong></td><td class="value">ACRush: :)</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">ACRush</span></td><td class="value"><span class="bigRed">Sarkin: Not all, I think coding is in practice room is the rest way.</span></td></tr>
<tr class="light"><td class="value"><strong>abdessamad</strong></td><td class="value">ACRush: can believe it! when i see your challengers :D :D</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">ACRush</span></td><td class="value"><span class="bigRed">vexorian: a..</span></td></tr>
<tr class="light"><td class="value"><strong>raulooo</strong></td><td class="value">ACRush: are you a programmer in warcraft ?</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">ACRush</span></td><td class="value"><span class="bigRed">vexorian: all.</span></td></tr>
<tr class="light"><td class="value"><strong>abdessamad</strong></td><td class="value">ACRush: please just one tips </td></tr>
<tr class="dark"><td class="value"><strong>Sarkin</strong></td><td class="value">ACRush: Do you make any analyzis before writing the algorithm?</td></tr>
<tr class="light"><td class="value"><strong>hamedvalizadeh</strong></td><td class="value">ACRush: What's the biggest project you have done?</td></tr>
<tr class="dark"><td class="value"><strong>vijay_comc</strong></td><td class="value">ACRush: if ACRush didnt know programming in his life. What would he be doing now ? </td></tr>
<tr class="light"><td class="value"><strong>without</strong></td><td class="value">ACRush</td></tr>
<tr class="dark"><td class="value"><strong>raulooo</strong></td><td class="value">ACRush: progamer*</td></tr>
<tr class="light"><td class="value"><strong>without</strong></td><td class="value">....</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">ACRush</span></td><td class="value"><span class="bigRed">abdessamad: It's one thing that Petr did much better than me.</span></td></tr>
<tr class="light"><td class="value"><strong>Dee2306</strong></td><td class="value">ACRush: wat's ur favorite timepass ??</td></tr>
<tr class="dark"><td class="value"><strong>stjepan</strong></td><td class="value">ACRush: where did/do you practice most and how?</td></tr>
<tr class="light"><td class="value"><strong>frank44</strong></td><td class="value">ACRush: how old are you? and what degrees are you persuing</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">ACRush</span></td><td class="value"><span class="bigRed">vijay_comc: ....no idea.</span></td></tr>
<tr class="light"><td class="value"><strong>binarywithme</strong></td><td class="value">ACRush: why u choose c++ as a default programming language</td></tr>
<tr class="dark"><td class="value"><strong>zhangmingwen</strong></td><td class="value">ACRush: what is your full name?</td></tr>
<tr class="light"><td class="value"><span class="bigRed">ACRush</span></td><td class="value"><span class="bigRed">Dee2306: War3</span></td></tr>
<tr class="dark"><td class="value"><strong>without</strong></td><td class="value">what is the thing?</td></tr>
<tr class="light"><td class="value"><span class="bigRed">ACRush</span></td><td class="value"><span class="bigRed">stjepan: In HS.</span></td></tr>
<tr class="dark"><td class="value"><strong>hamedvalizadeh</strong></td><td class="value">ACRush: What's the biggest project you have done?</td></tr>
<tr class="light"><td class="value"><span class="bigRed">ACRush</span></td><td class="value"><span class="bigRed">stjepan: And join contest.</span></td></tr>
<tr class="dark"><td class="value"><strong>vrajesh1989</strong></td><td class="value">ACRush: May I know your current goals? </td></tr>
<tr class="light"><td class="value"><strong>abdessamad</strong></td><td class="value">ACRush: did adopt the "shotgun" strategy , or you seek a bug for each problem?</td></tr>
<tr class="dark"><td class="value"><strong>stjepan</strong></td><td class="value">ACRush: anything specific except topcoder? spoj, uva...?</td></tr>
<tr class="light"><td class="value"><span class="bigRed">ACRush</span></td><td class="value"><span class="bigRed">binarywithme: er.. Stl is the first reason.</span></td></tr>
<tr class="dark"><td class="value"><strong>abdessamad</strong></td><td class="value">ACRush: i mean for each solution</td></tr>
<tr class="light"><td class="value"><span class="bigRed">ACRush</span></td><td class="value"><span class="bigRed">binarywithme: Another one may be efficient.</span></td></tr>
<tr class="dark"><td class="value"><strong>raulooo</strong></td><td class="value">ACRush: are you a wc3 progamer?</td></tr>
<tr class="light"><td class="value"><span class="bigRed">ACRush</span></td><td class="value"><span class="bigRed">vrajesh1989: ..PHD study.</span></td></tr>
<tr class="dark"><td class="value"><strong>without</strong></td><td class="value">ACRush: how long have you learn algorithm?</td></tr>
<tr class="light"><td class="value"><strong>geekru2</strong></td><td class="value">ACRush: during contest, what kind of problems do u enjoy doing? as in type of problem?</td></tr>
<tr class="dark"><td class="value"><strong>vijay_comc</strong></td><td class="value">ACRush: Do you plan to work later in your life. or puruse research -&gt; become a Prof !! ?</td></tr>
<tr class="light"><td class="value"><span class="bigRed">ACRush</span></td><td class="value"><span class="bigRed">abdessamad: In SRM, I did. But not in onsite round.</span></td></tr>
<tr class="dark"><td class="value"><strong>pt1989</strong></td><td class="value">ACRush: during preparation for IOI and ICPC how often and how long did u practise?</td></tr>
<tr class="light"><td class="value"><strong>abdessamad</strong></td><td class="value">ACRush: :D</td></tr>
<tr class="dark"><td class="value"><strong>reginachris</strong></td><td class="value">ACRush: What's the best OJ to start with for practice (UVa, SPOJ, TC, etc.)?</td></tr>
<tr class="light"><td class="value"><strong>khanhptnk</strong></td><td class="value">excuse me ac, are you chinese?</td></tr>
<tr class="dark"><td class="value"><strong>raulooo</strong></td><td class="value">ACRush: how old are you????</td></tr>
<tr class="light"><td class="value"><strong>kcm1700</strong></td><td class="value">khanhptnk: chinese.</td></tr>
<tr class="dark"><td class="value"><strong>spiglerg</strong></td><td class="value">rauloo: 22</td></tr>
<tr class="light"><td class="value"><span class="bigRed">ACRush</span></td><td class="value"><span class="bigRed">raulooo: no.</span></td></tr>
<tr class="dark"><td class="value"><strong>vexorian</strong></td><td class="value">ACRush: What was your favorite SRM problem of the last few months?</td></tr>
<tr class="light"><td class="value"><span class="bigRed">ACRush</span></td><td class="value"><span class="bigRed">without: 7 years.</span></td></tr>
<tr class="dark"><td class="value"><strong>hakami</strong></td><td class="value">ACRush: Have you a big bang in your life?</td></tr>
<tr class="light"><td class="value"><strong>frank44</strong></td><td class="value">ACRush: what do you think is the best way to practice? old tc contest? online judges? etc?</td></tr>
<tr class="dark"><td class="value"><strong>without</strong></td><td class="value">ACRush: what is your job now?</td></tr>
<tr class="light"><td class="value"><strong>khanhptnk</strong></td><td class="value">what your real name?</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">ACRush</span></td><td class="value"><span class="bigRed">geekru2: dp and network-flow.</span></td></tr>
<tr class="light"><td class="value"><strong>ferry</strong></td><td class="value">ACRush: What do you do when you can't solve a problem or you don't know what's wrong?</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">ACRush</span></td><td class="value"><span class="bigRed">reginachris: USACO</span></td></tr>
<tr class="light"><td class="value"><strong>geekru2</strong></td><td class="value">ACRush: Do you solve puzzles and mind bending questions to improve your problem solving techniques?</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">ACRush</span></td><td class="value"><span class="bigRed">raulooo: 22</span></td></tr>
<tr class="light"><td class="value"><strong>raulooo</strong></td><td class="value">ACRush: what do you do?</td></tr>
<tr class="dark"><td class="value"><strong>Sarkin</strong></td><td class="value">ACRush: What algorithm types helped you in the IOI?</td></tr>
<tr class="light"><td class="value"><strong>abdessamad</strong></td><td class="value">ACRush: did you like chess?</td></tr>
<tr class="dark"><td class="value"><strong>frank44</strong></td><td class="value">ACRush: how fast can you solve a 3x3x3 rubik's cube?</td></tr>
<tr class="light"><td class="value"><span class="bigRed">ACRush</span></td><td class="value"><span class="bigRed">ferry: I will try to pass it in practice room. I always do that.</span></td></tr>
<tr class="dark"><td class="value"><strong>Dee2306</strong></td><td class="value">frank44: nice ques... hehhe</td></tr>
<tr class="light"><td class="value"><span class="bigRed">ACRush</span></td><td class="value"><span class="bigRed">geekru2: no. I don't like such problems like suduko.</span></td></tr>
<tr class="dark"><td class="value"><strong>geekru2</strong></td><td class="value">ACRush: when in a team event(IOI etc), do you dominate while programming?</td></tr>
<tr class="light"><td class="value"><strong>kcm1700</strong></td><td class="value">ACRush: how do you prepare data for the challenge phase?</td></tr>
<tr class="dark"><td class="value"><strong>deepfritz01</strong></td><td class="value">ACRush: Why don't you use Topcoder Forums??</td></tr>
<tr class="light"><td class="value"><span class="bigRed">ACRush</span></td><td class="value"><span class="bigRed">raulooo: PHD candidate.</span></td></tr>
<tr class="dark"><td class="value"><strong>vijay_comc</strong></td><td class="value">ACRush: never see u in forums </td></tr>
<tr class="light"><td class="value"><strong>binarywithme</strong></td><td class="value">ACRush: r u doing any proect for google..</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">ACRush</span></td><td class="value"><span class="bigRed">Sarkin: dp.</span></td></tr>
<tr class="light"><td class="value"><strong>Dee2306</strong></td><td class="value">ACRush: how fast can u solve 3x3x3 rubik's cube . ? :D</td></tr>
<tr class="dark"><td class="value"><strong>vrajesh1989</strong></td><td class="value">ACRush: Did TC play a good role in improving you algorithmic skills? If yes, how?</td></tr>
<tr class="light"><td class="value"><span class="bigRed">ACRush</span></td><td class="value"><span class="bigRed">abdessamad: yes.</span></td></tr>
<tr class="dark"><td class="value"><strong>pt1989</strong></td><td class="value">ACRush: do u plan to apply for Google Summer of Coder?</td></tr>
<tr class="light"><td class="value"><strong>pt1989</strong></td><td class="value">ACRush: *Code</td></tr>
<tr class="dark"><td class="value"><strong>abdessamad</strong></td><td class="value">ACRush: great! do u play in online competition??</td></tr>
<tr class="light"><td class="value"><strong>binarywithme</strong></td><td class="value">ACRush: sir what is the best way to learn DP.</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">ACRush</span></td><td class="value"><span class="bigRed">geekru2: yes. I guess.</span></td></tr>
<tr class="light"><td class="value"><strong>SergeiFedorov</strong></td><td class="value">ACRush: What about your salary nowarays?</td></tr>
<tr class="dark"><td class="value"><strong>Sarkin</strong></td><td class="value">ACRush: Do you work at google?</td></tr>
<tr class="light"><td class="value"><span class="bigRed">ACRush</span></td><td class="value"><span class="bigRed">kcm1700: The trickiest one, of course.</span></td></tr>
<tr class="dark"><td class="value"><strong>[dasha]</strong></td><td class="value">ACRush: When u were beginning to compete,did u have any problems? Like low speed of sloving, or maybe some particular method u couldn't understend for a long time, sth else? If yes, how did u get over that?</td></tr>
<tr class="light"><td class="value"><span class="bigRed">ACRush</span></td><td class="value"><span class="bigRed">abdessamad: yes.</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">ACRush</span></td><td class="value"><span class="bigRed">binarywithme: TC contest.</span></td></tr>
<tr class="light"><td class="value"><strong>deepfritz01</strong></td><td class="value">ACRush: Why don't you use Topcoder Forums??</td></tr>
<tr class="dark"><td class="value"><strong>khanhptnk</strong></td><td class="value">excuse me, what 's you real neame</td></tr>
<tr class="light"><td class="value"><strong>khanhptnk</strong></td><td class="value">excuse me, what 's you real name?</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">ACRush</span></td><td class="value"><span class="bigRed">SergeiFedorov: I'm only a student.</span></td></tr>
<tr class="light"><td class="value"><strong>abdessamad</strong></td><td class="value">ACRush: i think you can guess what i will ask u know</td></tr>
<tr class="dark"><td class="value"><strong>without</strong></td><td class="value">ACRush: where do you woek at now?</td></tr>
<tr class="light"><td class="value"><strong>hamedvalizadeh</strong></td><td class="value">ACRush: How many hours in a day do you use your computer?</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">ACRush</span></td><td class="value"><span class="bigRed">[dasha]: USACO is a really good place. Especially for the beginners.</span></td></tr>
<tr class="light"><td class="value"><strong>without</strong></td><td class="value">ACRush: where do you work at now?</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">ACRush</span></td><td class="value"><span class="bigRed">deepfritz01: Network.</span></td></tr>
<tr class="light"><td class="value"><strong>spiglerg</strong></td><td class="value">without: he's a PHD student</td></tr>
<tr class="dark"><td class="value"><strong>frank44</strong></td><td class="value">ACRush: how long did the usaco practice take you?</td></tr>
<tr class="light"><td class="value"><span class="bigRed">ACRush</span></td><td class="value"><span class="bigRed">deepfritz01: The network of my uni. can not access TC forums.</span></td></tr>
<tr class="dark"><td class="value"><strong>abdessamad</strong></td><td class="value">ACRush: u can wisper to me which competition you do in net?</td></tr>
<tr class="light"><td class="value"><strong>seaking</strong></td><td class="value">USACO &lt;-- what's url?</td></tr>
<tr class="dark"><td class="value"><strong>binarywithme</strong></td><td class="value">ACRush: what u think math should b strong to become a Gud programmer</td></tr>
<tr class="light"><td class="value"><span class="bigRed">ACRush</span></td><td class="value"><span class="bigRed">abdessamad: ? sorry, there are too many questions.</span></td></tr>
<tr class="dark"><td class="value"><strong>khanhptnk</strong></td><td class="value">do you think what we should prepare before an important contest ?</td></tr>
<tr class="light"><td class="value"><strong>abs_abs</strong></td><td class="value">ACRush: RED and pursuing PHD..., so where do you see yourself after 5-6 years.., i mean what after all this.. ?</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">ACRush</span></td><td class="value"><span class="bigRed">frank44: half one year.</span></td></tr>
<tr class="light"><td class="value"><strong>Sarkin</strong></td><td class="value">ACRush: How much time did it take you to solve all USACO problems?</td></tr>
<tr class="dark"><td class="value"><strong>vijay_comc</strong></td><td class="value">seaking: google is your friend</td></tr>
<tr class="light"><td class="value"><strong>khanhptnk</strong></td><td class="value">ACRush: do you think what we should prepare before an important contest ?</td></tr>
<tr class="dark"><td class="value"><strong>abdessamad</strong></td><td class="value">ACRush: yeah i see ;) , i talked about what chess online competitions you do??</td></tr>
<tr class="light"><td class="value"><strong>Soyoja</strong></td><td class="value">seaking: ace.delos.com</td></tr>
<tr class="dark"><td class="value"><strong>martins256</strong></td><td class="value">ACRush: why do you think you do that bad (relative) on TCO Finals?</td></tr>
<tr class="light"><td class="value"><strong>dupree</strong></td><td class="value">usaco...url???</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">ACRush</span></td><td class="value"><span class="bigRed">binarywithme: The mathematical foundation is helps.</span></td></tr>
<tr class="light"><td class="value"><strong>without</strong></td><td class="value">ACRush: which school?</td></tr>
<tr class="dark"><td class="value"><strong>AlexErofeev</strong></td><td class="value">dupree: google.com</td></tr>
<tr class="light"><td class="value"><strong>seaking</strong></td><td class="value">thanks :)</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">ACRush</span></td><td class="value"><span class="bigRed">abs_abs: ITCS.</span></td></tr>
<tr class="light"><td class="value"><strong>without</strong></td><td class="value">spiglerg: which school?</td></tr>
<tr class="dark"><td class="value"><strong>hamedvalizadeh</strong></td><td class="value">ACRush: How many hours in a day do you use your computer?</td></tr>
<tr class="light"><td class="value"><strong>millky</strong></td><td class="value">dupree: ace.delos.com/usacogate</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">ACRush</span></td><td class="value"><span class="bigRed">without: THU.</span></td></tr>
<tr class="light"><td class="value"><strong>reginachris</strong></td><td class="value">ACRush: Can you recommend a math book? Is Concrete Mathematics good?</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">ACRush</span></td><td class="value"><span class="bigRed">hamedvalizadeh: about 8hs.</span></td></tr>
<tr class="light"><td class="value"><strong>dupree</strong></td><td class="value">slow down guys</td></tr>
<tr class="dark"><td class="value"><strong>bangaru</strong></td><td class="value">ACRush: can you please comment about education system in china?</td></tr>
<tr class="light"><td class="value"><span class="bigRed">ACRush</span></td><td class="value"><span class="bigRed">hamedvalizadeh: because I do some research in this area.</span></td></tr>
<tr class="dark"><td class="value"><strong>khanhptnk</strong></td><td class="value">ACRush: excuse me, do you think what we should prepare before an important contest ?</td></tr>
<tr class="light"><td class="value"><strong>binarywithme</strong></td><td class="value">ACRush: what u think math should b strong to become a Gud programmer</td></tr>
<tr class="dark"><td class="value"><strong>kcm1700</strong></td><td class="value">ACRush: Have you gone to ACM ICPC World Final?</td></tr>
<tr class="light"><td class="value"><span class="bigRed">ACRush</span></td><td class="value"><span class="bigRed">reginachris: Modern graph theory.</span></td></tr>
<tr class="dark"><td class="value"><strong>Sarkin</strong></td><td class="value">ACRush: Whould you recommend reading the parts in "Introduction to Algorithms" about algorithm analysis?</td></tr>
<tr class="light"><td class="value"><strong>yiuyuho</strong></td><td class="value">kcm1700: he has</td></tr>
<tr class="dark"><td class="value"><strong>binarywithme</strong></td><td class="value">ACRush: thnx sir</td></tr>
<tr class="light"><td class="value"><strong>yiuyuho</strong></td><td class="value">kcm1700: and got second place ;)</td></tr>
<tr class="dark"><td class="value"><strong>kcm1700</strong></td><td class="value">yiuyuho: thanks</td></tr>
<tr class="light"><td class="value"><span class="bigRed">ACRush</span></td><td class="value"><span class="bigRed">bangaru: I can not answer this question yet.</span></td></tr>
<tr class="dark"><td class="value"><strong>yiuyuho</strong></td><td class="value">ACRush: are you going to ICPC World Finals this year?</td></tr>
<tr class="light"><td class="value"><strong>progfool</strong></td><td class="value">hello</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">ACRush</span></td><td class="value"><span class="bigRed">kcm1700: 2007, only once.</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">ACRush</span></td><td class="value"><span class="bigRed">yiuyuho: no.</span></td></tr>
<tr class="dark"><td class="value"><strong>Brahmand</strong></td><td class="value">ACRush: which debugger you recommend?</td></tr>
<tr class="light"><td class="value"><strong>khanhptnk</strong></td><td class="value">ACRush: hi, ac :)</td></tr>
<tr class="dark"><td class="value"><strong>yiuyuho</strong></td><td class="value">ACRush: why?</td></tr>
<tr class="light"><td class="value"><span class="bigRed">ACRush</span></td><td class="value"><span class="bigRed">Brahmand: I used VS2008.</span></td></tr>
<tr class="dark"><td class="value"><strong>dupree</strong></td><td class="value">any message for starters..</td></tr>
<tr class="light"><td class="value"><span class="bigRed">ACRush</span></td><td class="value"><span class="bigRed">Brahmand: I think rhide and eclipse are also good.</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">ACRush</span></td><td class="value"><span class="bigRed">khanhptnk: hi</span></td></tr>
<tr class="light"><td class="value"><strong>progfool</strong></td><td class="value">hey ACRush..i m a gr8 fan of the way u do dynamic programming problems...whr did u read it from??</td></tr>
<tr class="dark"><td class="value"><strong>khanhptnk</strong></td><td class="value">ACRush: excuse me, do you think what we should prepare before an important contest ?</td></tr>
<tr class="light"><td class="value"><strong>niko</strong></td><td class="value">ACRush: What IDE, Compiler, OS do you use for SRMs?</td></tr>
<tr class="dark"><td class="value"><strong>stjepan</strong></td><td class="value">ACRush: what editor, debugger, ide do you use for topcoding?</td></tr>
<tr class="light"><td class="value"><strong>khanhptnk</strong></td><td class="value">ACRush: please give me an advice</td></tr>
<tr class="dark"><td class="value"><strong>kcm1700</strong></td><td class="value">ACRush: Can you use BrainF*ck?</td></tr>
<tr class="light"><td class="value"><span class="bigRed">ACRush</span></td><td class="value"><span class="bigRed">khanhptnk: relax, and rush some simple problems.</span></td></tr>
<tr class="dark"><td class="value"><strong>dupree</strong></td><td class="value">ACRush:any message for starters..</td></tr>
<tr class="light"><td class="value"><span class="bigRed">ACRush</span></td><td class="value"><span class="bigRed">khanhptnk: pops.</span></td></tr>
<tr class="dark"><td class="value"><strong>khanhptnk</strong></td><td class="value">ACRush: opera ?</td></tr>
<tr class="light"><td class="value"><strong>coder29</strong></td><td class="value">ACRush: which parts do u advice to read in "Introduction to Algorithms"?</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">ACRush</span></td><td class="value"><span class="bigRed">stjepan: pop's editor.</span></td></tr>
<tr class="light"><td class="value"><strong>khanhptnk</strong></td><td class="value">ACRush: when did you start learning programming</td></tr>
<tr class="dark"><td class="value"><strong>yazhini</strong></td><td class="value">ACRush: Why did you choose this handle?</td></tr>
<tr class="light"><td class="value"><span class="bigRed">ACRush</span></td><td class="value"><span class="bigRed">khanhptnk: And solve some problems in a contest env. is also helpful.</span></td></tr>
<tr class="dark"><td class="value"><strong>MB__</strong></td><td class="value">ACRush: do you do any sports but topcoding?</td></tr>
<tr class="light"><td class="value"><strong>progfool</strong></td><td class="value">ACRush: hii...where did u read dynamic programming from??</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">ACRush</span></td><td class="value"><span class="bigRed">coder29: All parts are perfect.</span></td></tr>
<tr class="light"><td class="value"><strong>dupree</strong></td><td class="value">ACRush: whats the first step in programming ladder</td></tr>
<tr class="dark"><td class="value"><strong>vijay_comc</strong></td><td class="value">ACRush: How mnay hours do you sleep every day ?</td></tr>
<tr class="light"><td class="value"><strong>progfool</strong></td><td class="value">ACRush: i m a gr8 fan of the way u solve those problems</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">ACRush</span></td><td class="value"><span class="bigRed">coder29: except complexity.</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">ACRush</span></td><td class="value"><span class="bigRed">khanhptnk: 7 years ago.</span></td></tr>
<tr class="dark"><td class="value"><strong>Sarkin</strong></td><td class="value">ACRush: What do you mean except comlexity?</td></tr>
<tr class="light"><td class="value"><span class="bigRed">ACRush</span></td><td class="value"><span class="bigRed">yazhini: From my dorm-mate.</span></td></tr>
<tr class="dark"><td class="value"><strong>khanhptnk</strong></td><td class="value">ACRush: it mean when you are in grade 10</td></tr>
<tr class="light"><td class="value"><strong>khanhptnk</strong></td><td class="value">ACRush: the same as me :)</td></tr>
<tr class="dark"><td class="value"><strong>vijay_comc</strong></td><td class="value">ACRush: Complexity in CLRS is flawed ?? :o</td></tr>
<tr class="light"><td class="value"><strong>khanhptnk</strong></td><td class="value">ACRush: now i'm 16</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">ACRush</span></td><td class="value"><span class="bigRed">MB__: soccer.</span></td></tr>
<tr class="light"><td class="value"><strong>progfool</strong></td><td class="value">what do u do now?????</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">ACRush</span></td><td class="value"><span class="bigRed">vijay_comc: 7-8</span></td></tr>
<tr class="light"><td class="value"><strong>Sarkin</strong></td><td class="value">ACRush: What do you mean except comlexity?</td></tr>
<tr class="dark"><td class="value"><strong>Soyoja</strong></td><td class="value">ACRush: Your handle, ACRush means "Accepted Rush", Is it right? </td></tr>
<tr class="light"><td class="value"><strong>pcaldeira</strong></td><td class="value">ACRush: which skill do you consider most important on TCHS/ioi-style contests?</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">ACRush</span></td><td class="value"><span class="bigRed">Sarkin: That's only my opinion.</span></td></tr>
<tr class="light"><td class="value"><strong>coder29</strong></td><td class="value">ACRush: I am newbie...which OJ is better fr me...USCO or UVA?</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">ACRush</span></td><td class="value"><span class="bigRed">khanhptnk: yes.</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">ACRush</span></td><td class="value"><span class="bigRed">Soyoja: yes. Thanks.</span></td></tr>
<tr class="dark"><td class="value"><strong>Sarkin</strong></td><td class="value">ACRush: I fully agree with you:D</td></tr>
<tr class="light"><td class="value"><strong>hakami</strong></td><td class="value">ACRush: Are you useing library or typing from first for SRMs?</td></tr>
<tr class="dark"><td class="value"><strong>khanhptnk</strong></td><td class="value">ACRush: when did you became a red topcoder ?</td></tr>
<tr class="light"><td class="value"><span class="bigRed">ACRush</span></td><td class="value"><span class="bigRed">pcaldeira: algorithm skills and coding ability.</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">ACRush</span></td><td class="value"><span class="bigRed">coder29: USACO</span></td></tr>
<tr class="light"><td class="value"><strong>Sarkin</strong></td><td class="value">coder29: USACO.</td></tr>
<tr class="dark"><td class="value"><strong>vrajesh1989</strong></td><td class="value">ACRush: Will you try to prove your algorithms to yourselves during contest time or just believe your intuition and start coding?</td></tr>
<tr class="light"><td class="value"><strong>pcaldeira</strong></td><td class="value">hum ACRush , which algorithm skills mainly? DP and graphs?</td></tr>
<tr class="dark"><td class="value"><strong>samshu</strong></td><td class="value">is ACRush another googler??</td></tr>
<tr class="light"><td class="value"><span class="bigRed">ACRush</span></td><td class="value"><span class="bigRed">hakami: some includes and basic untilities.</span></td></tr>
<tr class="dark"><td class="value"><strong>vijay_comc</strong></td><td class="value">All Great Coders play Soccer ?</td></tr>
<tr class="light"><td class="value"><span class="bigRed">ACRush</span></td><td class="value"><span class="bigRed">vrajesh1989: Yes, it's very important for me.</span></td></tr>
<tr class="dark"><td class="value"><strong>igi</strong></td><td class="value">gates14: ides na tchs?</td></tr>
<tr class="light"><td class="value"><span class="bigRed">ACRush</span></td><td class="value"><span class="bigRed">samshu: I used to be an internship of google.</span></td></tr>
<tr class="dark"><td class="value"><strong>progfool</strong></td><td class="value">ACRush:what do u do now??</td></tr>
<tr class="light"><td class="value"><strong>innocentboy</strong></td><td class="value">ACRush: are you planning to do a job after university or do higher studies ?</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">ACRush</span></td><td class="value"><span class="bigRed">vrajesh1989: PHD candidate.</span></td></tr>
<tr class="light"><td class="value"><strong>reginachris</strong></td><td class="value">ACRush: Is there a good basic discrete math book for beginners?</td></tr>
<tr class="dark"><td class="value"><strong>Sarkin</strong></td><td class="value">ACRush: Do you use algorithm analyzis when solving a problem to see it's effeciency?</td></tr>
<tr class="light"><td class="value"><strong>stormsky</strong></td><td class="value">progfool: he is a student</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">ACRush</span></td><td class="value"><span class="bigRed">liuyizheanxy: In high, about 8.</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">ACRush</span></td><td class="value"><span class="bigRed">liuyizheanxy: In HS, about 8.</span></td></tr>
<tr class="dark"><td class="value"><strong>dupree</strong></td><td class="value">ACRush: m a new b should i start wid C++ or java is better</td></tr>
<tr class="light"><td class="value"><span class="bigRed">ACRush</span></td><td class="value"><span class="bigRed">innocentboy: I prefer higher studies.</span></td></tr>
<tr class="dark"><td class="value"><strong>khanhptnk</strong></td><td class="value">ACRush: when did you became a red topcoder ?</td></tr>
<tr class="light"><td class="value"><strong>coder29</strong></td><td class="value">ACRush: basically i want 2 to do pratice on DP and greedy types...is TCs' room are sufficient..?</td></tr>
<tr class="dark"><td class="value"><strong>Sarkin</strong></td><td class="value">dupree: Your own opinion.</td></tr>
<tr class="light"><td class="value"><strong>samshu</strong></td><td class="value">khanhptnk: have a look at his rating graph :)</td></tr>
<tr class="dark"><td class="value"><strong>puneetkp444</strong></td><td class="value">ACRush: hey ACRUSH, can you suggest some ways to improve my algorithmic skills and  problem solving techniques</td></tr>
<tr class="light"><td class="value"><span class="bigRed">ACRush</span></td><td class="value"><span class="bigRed">Sarkin: Yes. the effeciency sometimes is more important than correctness in TC contest.</span></td></tr>
<tr class="dark"><td class="value"><strong>martins256</strong></td><td class="value">khanhptnk: take look at hes graph</td></tr>
<tr class="light"><td class="value"><strong>pcaldeira</strong></td><td class="value">khanhptnk: wouldn't it be easier if you just checked his profile on the website?</td></tr>
<tr class="dark"><td class="value"><strong>khanhptnk</strong></td><td class="value">ACRush: sorry</td></tr>
<tr class="light"><td class="value"><strong>rajeshsr</strong></td><td class="value">ACRush: What do you think is important to become successful in Algorithm competition, is that through sheer practice or a lot of theoretical knowledge in algorithms?</td></tr>
<tr class="dark"><td class="value"><strong>SwitchCase</strong></td><td class="value">ACRush: hi..</td></tr>
<tr class="light"><td class="value"><strong>dupree</strong></td><td class="value">Sarkin: thnks</td></tr>
<tr class="dark"><td class="value"><strong>rajeshsr</strong></td><td class="value">ACRush: In short, what is the strategy for becoming a good coder, according to u?</td></tr>
<tr class="light"><td class="value"><strong>khanhptnk</strong></td><td class="value">ACRush: when did you feel you are in the best condition ?</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">ACRush</span></td><td class="value"><span class="bigRed">coder29: A bulk of dp tasks in SRMs. TC's room is good.</span></td></tr>
<tr class="light"><td class="value"><strong>vrajesh1989</strong></td><td class="value">ACRush: May I know the significance of your TC Quote : "Ctrl-A-Ctrl-C-Ctrl-V" ?</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">ACRush</span></td><td class="value"><span class="bigRed">liuyizheanxy: CLR</span></td></tr>
<tr class="light"><td class="value"><strong>bucephalus</strong></td><td class="value">ACRush: What is the medal in you profile pic?</td></tr>
<tr class="dark"><td class="value"><strong>wack-a-mole</strong></td><td class="value">ACRush: What editor and OS do you use?</td></tr>
<tr class="light"><td class="value"><strong>liuyizheanxy</strong></td><td class="value">ACRush: CLRS?</td></tr>
<tr class="dark"><td class="value"><strong>khanhptnk</strong></td><td class="value">ACRush: i mean when you feel like programming is easiest to you ?</td></tr>
<tr class="light"><td class="value"><strong>shady_mokhtar</strong></td><td class="value">ACRush: what best makes you a good topcoderer??  choose:  quik thinking or being good in algorithm  </td></tr>
<tr class="dark"><td class="value"><strong>Lingmum</strong></td><td class="value">ACRush: How can we improve our speed of solving the problems,more problems?</td></tr>
<tr class="light"><td class="value"><strong>coder29</strong></td><td class="value">ACRush: for greedy types?</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">ACRush</span></td><td class="value"><span class="bigRed">rajeshsr: Practice is the way.</span></td></tr>
<tr class="light"><td class="value"><strong>Sarkin</strong></td><td class="value">dupree:but I think C++ is a better place to start. My opinion.</td></tr>
<tr class="dark"><td class="value"><strong>SwitchCase</strong></td><td class="value">ACRush: How much time do u reckon it takes for a starter with almost no knowledge to become someone like u??</td></tr>
<tr class="light"><td class="value"><span class="bigRed">ACRush</span></td><td class="value"><span class="bigRed">wack-a-mole: I used VS2008 in Windows.</span></td></tr>
<tr class="dark"><td class="value"><strong>hakami</strong></td><td class="value">ACRush: What is the diffrence between onsite match and SRMs for you?</td></tr>
<tr class="light"><td class="value"><strong>Sarkin</strong></td><td class="value">liuyizheanxy: Introduction to Algorithms.</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">ACRush</span></td><td class="value"><span class="bigRed">khanhptnk: from the very beginning.</span></td></tr>
<tr class="light"><td class="value"><strong>innocentboy</strong></td><td class="value">SwitchCase: maybe infinite.. depends on the starter :)</td></tr>
<tr class="dark"><td class="value"><strong>snguyen</strong></td><td class="value">ACRush: VS2008 for the TC matches?</td></tr>
<tr class="light"><td class="value"><strong>rajeshsr</strong></td><td class="value">ACRush: Can u elaborate on the strategy of practice we should use?</td></tr>
<tr class="dark"><td class="value"><strong>krepst</strong></td><td class="value">ACRush: how much time do you spend programming?</td></tr>
<tr class="light"><td class="value"><span class="bigRed">ACRush</span></td><td class="value"><span class="bigRed">Lingmum: More practice.</span></td></tr>
<tr class="dark"><td class="value"><strong>dupree</strong></td><td class="value">Sarkin: but here at stanford they make us strt wid java</td></tr>
<tr class="light"><td class="value"><strong>lzzhang07</strong></td><td class="value">I found out that most of the good code in topcoder is very short. How can I write a algorithm in very few codes? I always give a long answer</td></tr>
<tr class="dark"><td class="value"><strong>coder29</strong></td><td class="value">ACRush: for greesy types which Oj is good?</td></tr>
<tr class="light"><td class="value"><strong>coder29</strong></td><td class="value">ACRush: *greedy</td></tr>
<tr class="dark"><td class="value"><strong>puneetkp444</strong></td><td class="value">ACRush: Can you suggest some ways to improve my problem solving techniques .</td></tr>
<tr class="light"><td class="value"><strong>Lingmum</strong></td><td class="value">ACRush: Where do you have your practise? poj?tc? or other oj ?</td></tr>
<tr class="dark"><td class="value"><strong>SwitchCase</strong></td><td class="value">innocentboy: the starter is a dedicated fellow!!!</td></tr>
<tr class="light"><td class="value"><strong>wack-a-mole</strong></td><td class="value">ACRush: What else do you do apart from coding?</td></tr>
<tr class="dark"><td class="value"><strong>khanhptnk</strong></td><td class="value">ACRush: do you think a bad start lead to a bad result ?</td></tr>
<tr class="light"><td class="value"><strong>vrajesh1989</strong></td><td class="value">ACRush: May I know the significance of your TC Quote : "Ctrl-A-Ctrl-C-Ctrl-V" ?</td></tr>
<tr class="dark"><td class="value"><strong>Dee2306</strong></td><td class="value">wack-a-mole: War3</td></tr>
<tr class="light"><td class="value"><span class="bigRed">ACRush</span></td><td class="value"><span class="bigRed">hakami: my room-mates(opponents).</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">ACRush</span></td><td class="value"><span class="bigRed">wack-a-mole: War3</span></td></tr>
<tr class="light"><td class="value"><strong>MohammadReza</strong></td><td class="value">What do you do that your code becomes bugfree although the big size?</td></tr>
<tr class="dark"><td class="value"><strong>stormsky</strong></td><td class="value">ACRush: do you often practice TC?and how to practice?</td></tr>
<tr class="light"><td class="value"><strong>shady_mokhtar</strong></td><td class="value">ACRush: what best makes you a good topcoderer??  choose:  quik thinking or being good in algorithm  </td></tr>
<tr class="dark"><td class="value"><strong>Sarkin</strong></td><td class="value">ACRush: How do you know what type of algorithm to use is it experience?</td></tr>
<tr class="light"><td class="value"><strong>wack-a-mole</strong></td><td class="value">ACRush: War == Warcraft?</td></tr>
<tr class="dark"><td class="value"><strong>bucephalus</strong></td><td class="value">Sarkin: 24</td></tr>
<tr class="light"><td class="value"><span class="bigRed">ACRush</span></td><td class="value"><span class="bigRed">vrajesh1989: :) The most efficient way to get AC, isn't it? Just ignore the coding and debuging time.</span></td></tr>
<tr class="dark"><td class="value"><strong>viswanath</strong></td><td class="value">ACRush: hello!</td></tr>
<tr class="light"><td class="value"><span class="bigRed">ACRush</span></td><td class="value"><span class="bigRed">wack-a-mole: yes.</span></td></tr>
<tr class="dark"><td class="value"><strong>lzzhang07</strong></td><td class="value"> I found out that most of the good code in topcoder is very short. How can I write a algorithm in very few codes? I always give a long answer</td></tr>
<tr class="light"><td class="value"><strong>Dee2306</strong></td><td class="value">ACRush: "Ctrl-A-Ctrl-C-Ctrl-V" , does it mean u have a gud library of generic codes...</td></tr>
<tr class="dark"><td class="value"><strong>Dee2306</strong></td><td class="value">ACRush: hahhaa</td></tr>
<tr class="light"><td class="value"><strong>raulooo</strong></td><td class="value">copy paste!</td></tr>
<tr class="dark"><td class="value"><strong>raulooo</strong></td><td class="value">select and copy paste</td></tr>
<tr class="light"><td class="value"><strong>Sarkin</strong></td><td class="value">ACRush: What do you mean except comlexity?</td></tr>
<tr class="dark"><td class="value"><strong>Dee2306</strong></td><td class="value">raulooo: exactly.</td></tr>
<tr class="light"><td class="value"><strong>Sarkin</strong></td><td class="value">ACRush: How do you know what type of algorithm to use is it experience?</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">ACRush</span></td><td class="value"><span class="bigRed">stormsky: Yes. But in fact, I prefer to doing past Regionals and finals.</span></td></tr>
<tr class="light"><td class="value"><strong>Sarkin</strong></td><td class="value">ACRush: Sorry.</td></tr>
<tr class="dark"><td class="value"><strong>fight_</strong></td><td class="value">YM??</td></tr>
<tr class="light"><td class="value"><strong>sahiltiwari</strong></td><td class="value">ACRush: how many hours you practise per day ?</td></tr>
<tr class="dark"><td class="value"><strong>khanhptnk</strong></td><td class="value">ACRush: who do you want to thank more, yourself or your teacher ?</td></tr>
<tr class="light"><td class="value"><span class="bigRed">ACRush</span></td><td class="value"><span class="bigRed">Dee2306: no.</span></td></tr>
<tr class="dark"><td class="value"><strong>shady_mokhtar</strong></td><td class="value">ACRush: what best makes you a good topcoderer??  choose:  quik thinking or being good in algorithm  </td></tr>
<tr class="light"><td class="value"><span class="bigRed">ACRush</span></td><td class="value"><span class="bigRed">Sarkin: Yes. I believe.</span></td></tr>
<tr class="dark"><td class="value"><strong>stjepan</strong></td><td class="value">ACRush: does it mean you used copy-paste before to rush at ACing? :)</td></tr>
<tr class="light"><td class="value"><strong>MohammadReza</strong></td><td class="value">ACRush:  What do you do to make your code becomes bugfree although the big size?</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">ACRush</span></td><td class="value"><span class="bigRed">sahiltiwari: 4-5</span></td></tr>
<tr class="light"><td class="value"><strong>Dee2306</strong></td><td class="value">ACRush: wats the significance of "Ctrl-A-Ctrl-C-Ctrl-V" then ..??</td></tr>
<tr class="dark"><td class="value"><strong>lvhuiwei</strong></td><td class="value">ACRush: what is the most difficult part of solving a problem?</td></tr>
<tr class="light"><td class="value"><strong>viswanath</strong></td><td class="value">ACRush: are you studying now?</td></tr>
<tr class="dark"><td class="value"><strong>feitian</strong></td><td class="value">ACRush: ???</td></tr>
<tr class="light"><td class="value"><span class="bigRed">ACRush</span></td><td class="value"><span class="bigRed">shady_mokhtar: there are the same.</span></td></tr>
<tr class="dark"><td class="value"><strong>khanhptnk</strong></td><td class="value">ACRush: who do you want to thank more, yourself or your teacher ?</td></tr>
<tr class="light"><td class="value"><strong>vrajesh1989</strong></td><td class="value">ACRush: Did TC play a good role in improving you algorithmic skills? If yes, how?</td></tr>
<tr class="dark"><td class="value"><strong>SwitchCase</strong></td><td class="value">ACRush: any particular reason for using a name like ACRush as a Handle/nick??</td></tr>
<tr class="light"><td class="value"><strong>coder29</strong></td><td class="value">ACRush: I want to do practice on greedY programming which is better TC or OJ?</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">ACRush</span></td><td class="value"><span class="bigRed">MohammadReza: test more tricky cases.(corner cases)</span></td></tr>
<tr class="light"><td class="value"><strong>rajeshsr</strong></td><td class="value">ACRush: Sorry to be repetitious, But I want to know what is the strategy of practice you employed? U select some random problems from OJs and solve or try to master a particular domain like DP by solving problems based on that or any other thing?</td></tr>
<tr class="dark"><td class="value"><strong>connect4</strong></td><td class="value">**connect4 resists urge to ask about sports...</td></tr>
<tr class="light"><td class="value"><strong>progfool</strong></td><td class="value">What made u a coder u are today.......ur teachers or ur practice????</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">ACRush</span></td><td class="value"><span class="bigRed">khanhptnk: teacher.</span></td></tr>
<tr class="light"><td class="value"><strong>khanhptnk</strong></td><td class="value">ACRush: So the teacher training you more than you train yourself ?</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">ACRush</span></td><td class="value"><span class="bigRed">rajeshsr: set problems of past regionals and finals.</span></td></tr>
<tr class="light"><td class="value"><strong>Brahmand</strong></td><td class="value">ACRush: you also know MFC,COM ,etc...?</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">ACRush</span></td><td class="value"><span class="bigRed">khanhptnk: In the first years, teacher trained me more.</span></td></tr>
<tr class="light"><td class="value"><strong>ahm.kam_92</strong></td><td class="value">ACRush: where do u work ?</td></tr>
<tr class="dark"><td class="value"><strong>Dee2306</strong></td><td class="value">ACRush: plz tell us na .. wat is it actually.. "Ctrl-A-Ctrl-C-Ctrl-V"..??</td></tr>
<tr class="light"><td class="value"><strong>rajeshsr</strong></td><td class="value">ACRush: k, thanks. U have been practising with that for how long?</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">ACRush</span></td><td class="value"><span class="bigRed">Brahmand: I know. But I seldom used them in TC.</span></td></tr>
<tr class="light"><td class="value"><strong>dupree</strong></td><td class="value">coder29: OJ...??</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">ACRush</span></td><td class="value"><span class="bigRed">ahm.kam_92: beijing.</span></td></tr>
<tr class="light"><td class="value"><strong>reginachris</strong></td><td class="value">Dee2306: Select All - Copy - Paste</td></tr>
<tr class="dark"><td class="value"><strong>khanhptnk</strong></td><td class="value">ACRush: Why did you have the name ACRush ?</td></tr>
<tr class="light"><td class="value"><strong>coder29</strong></td><td class="value">dupree: Online Judge</td></tr>
<tr class="dark"><td class="value"><strong>hamedvalizadeh</strong></td><td class="value">?</td></tr>
<tr class="light"><td class="value"><strong>lvhuiwei</strong></td><td class="value">ACRush: What is the most difficult part of solving a problem, how do you strike at it?</td></tr>
<tr class="dark"><td class="value"><strong>dupree</strong></td><td class="value">coder29: kk</td></tr>
<tr class="light"><td class="value"><span class="bigRed">ACRush</span></td><td class="value"><span class="bigRed">Dee2306: No. It's just my goal.</span></td></tr>
<tr class="dark"><td class="value"><strong>puneetkp444</strong></td><td class="value">ACRush: Can you suggest some ways to improve problem solving abilities</td></tr>
<tr class="light"><td class="value"><strong>SwitchCase</strong></td><td class="value">khanhptnk: tats wat i asked!!!</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">ACRush</span></td><td class="value"><span class="bigRed">khanhptnk: Accept - rush.</span></td></tr>
<tr class="light"><td class="value"><strong>khanhptnk</strong></td><td class="value">ACRush: sorry again</td></tr>
<tr class="dark"><td class="value"><strong>Apofis</strong></td><td class="value">sta ima Gates</td></tr>
<tr class="light"><td class="value"><strong>Dee2306</strong></td><td class="value">reginachris: that i knoe, but he says he doesnt do that, then wats the significance.</td></tr>
<tr class="dark"><td class="value"><strong>Brahmand</strong></td><td class="value">ACRush: have u created any project using them also</td></tr>
<tr class="light"><td class="value"><strong>SwitchCase</strong></td><td class="value">ACRush: nice one!!</td></tr>
<tr class="dark"><td class="value"><strong>reginachris</strong></td><td class="value">ACRush: Any input on how to improve in math (discrete math book recommendation, online classes)</td></tr>
<tr class="light"><td class="value"><span class="bigRed">ACRush</span></td><td class="value"><span class="bigRed">puneetkp444: practice all kinds of problems.</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">ACRush</span></td><td class="value"><span class="bigRed">Brahmand: Yes.</span></td></tr>
<tr class="light"><td class="value"><strong>Dee2306</strong></td><td class="value">SwitchCase: hey dog, wats so nice ?</td></tr>
<tr class="dark"><td class="value"><strong>khanhptnk</strong></td><td class="value">ACRush: have you ever feel nervous and do not know what to learn about proramming?</td></tr>
<tr class="light"><td class="value"><strong>ahm.kam_92</strong></td><td class="value">ACRush: so what's ur real name ?</td></tr>
<tr class="dark"><td class="value"><strong>snguyen</strong></td><td class="value">ACRush: are you using VS2008 for the TC matches?</td></tr>
<tr class="light"><td class="value"><strong>Apofis</strong></td><td class="value">hokage;;;</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">ACRush</span></td><td class="value"><span class="bigRed">reginachris: I only took the usual maths courses in Uni.</span></td></tr>
<tr class="light"><td class="value"><strong>innocentboy</strong></td><td class="value">ahmed_aly: Lou Tiancheng</td></tr>
<tr class="dark"><td class="value"><strong>puneetkp444</strong></td><td class="value">ACRush: Can you suggest some book for general problem solving </td></tr>
<tr class="light"><td class="value"><span class="bigRed">ACRush</span></td><td class="value"><span class="bigRed">ahm.kam_92: Tiancheng Lou</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">ACRush</span></td><td class="value"><span class="bigRed">snguyen: No. pop's editor is good enough.</span></td></tr>
<tr class="light"><td class="value"><strong>abdessamad</strong></td><td class="value">raidenx2: salam alikom</td></tr>
<tr class="dark"><td class="value"><strong>ahm.kam_92</strong></td><td class="value">ACRush: nice name :)</td></tr>
<tr class="light"><td class="value"><strong>alft7</strong></td><td class="value">ACRush: what do you usually do before a very important competition, practise or something else?</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">ACRush</span></td><td class="value"><span class="bigRed">puneetkp444: I only have some books for algorithm, not for problem solving.</span></td></tr>
<tr class="light"><td class="value"><strong>snguyen</strong></td><td class="value">ACRush: you should be very strong in code maintainance and debugging!</td></tr>
<tr class="dark"><td class="value"><strong>ortschun</strong></td><td class="value">ACRush: is it too late for you  to begin learning about algorithms and problem solving in university?</td></tr>
<tr class="light"><td class="value"><span class="bigRed">ACRush</span></td><td class="value"><span class="bigRed">alft7: practice until 3 days before it.</span></td></tr>
<tr class="dark"><td class="value"><strong>Apofis</strong></td><td class="value">What books?</td></tr>
<tr class="light"><td class="value"><strong>puneetkp444</strong></td><td class="value">ACRush: ok wat books do u recommend for algortihms ?</td></tr>
<tr class="dark"><td class="value"><strong>khanhptnk</strong></td><td class="value">ACRush: have you ever feel nervous and do not know what to learn about proramming?</td></tr>
<tr class="light"><td class="value"><strong>kcm1700</strong></td><td class="value">ACRush: What kind of subject do you like except for programming, algorithms, and mathematics?</td></tr>
<tr class="dark"><td class="value"><strong>simplysuperb_kn</strong></td><td class="value">ACRush: Please suggest study material for Dynamic Programming and Graph Theory!!!</td></tr>
<tr class="light"><td class="value"><strong>Lingmum</strong></td><td class="value">ACRush: Do you want to go abroad for study?</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">ACRush</span></td><td class="value"><span class="bigRed">ortschun: too late? why?</span></td></tr>
<tr class="light"><td class="value"><strong>progfool</strong></td><td class="value">which of ur opponents in topcoder do u admire the most???</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">ACRush</span></td><td class="value"><span class="bigRed">puneetkp444: CLR.</span></td></tr>
<tr class="light"><td class="value"><strong>jmpld40</strong></td><td class="value">For the benefit of all, please try to keep questions in English.  Thank you!</td></tr>
<tr class="dark"><td class="value"><strong>jay23jack</strong></td><td class="value">petr?</td></tr>
<tr class="light"><td class="value"><strong>ferry</strong></td><td class="value">ACRush: What is the hardest problem you've done?</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">ACRush</span></td><td class="value"><span class="bigRed">kcm1700: PE</span></td></tr>
<tr class="light"><td class="value"><strong>ortschun</strong></td><td class="value">ACRush: as i've heard all best coders like you have started this when they were like 11-12 ..</td></tr>
<tr class="dark"><td class="value"><strong>snguyen</strong></td><td class="value">ACRush: and CLR is the short for?</td></tr>
<tr class="light"><td class="value"><strong>stormsky</strong></td><td class="value">in English</td></tr>
<tr class="dark"><td class="value"><strong>Dee2306</strong></td><td class="value">ACRush: You just said .."Ctrl-A-Ctrl-C-Ctrl-V" is ur goal, its a way to ur goal ..?? how ??</td></tr>
<tr class="light"><td class="value"><strong>puneetkp444</strong></td><td class="value">ACRush: CLR ?? is this the name of the book for algorithms ...please tell the full name </td></tr>
<tr class="dark"><td class="value"><strong>Dee2306</strong></td><td class="value">ACRush: u didnt justify</td></tr>
<tr class="light"><td class="value"><strong>romesh</strong></td><td class="value">CLR = Introduction to Algorithms</td></tr>
<tr class="dark"><td class="value"><strong>khanhptnk</strong></td><td class="value">ACRush: sorry, have you ever feel nervous and do not know what to learn about proramming?</td></tr>
<tr class="light"><td class="value"><span class="bigRed">ACRush</span></td><td class="value"><span class="bigRed">ferry: I in WF2007.</span></td></tr>
<tr class="dark"><td class="value"><strong>puneetkp444</strong></td><td class="value">ACRush: ok ...cormer leiserson and rivest </td></tr>
<tr class="light"><td class="value"><strong>puneetkp444</strong></td><td class="value">ACRush: gotcha</td></tr>
<tr class="dark"><td class="value"><strong>snguyen</strong></td><td class="value">romesh: isn't it? quite strange.</td></tr>
<tr class="light"><td class="value"><span class="bigRed">ACRush</span></td><td class="value"><span class="bigRed">ortschun: I think start at 18 is also good.</span></td></tr>
<tr class="dark"><td class="value"><strong>snguyen</strong></td><td class="value">romesh: thx</td></tr>
<tr class="light"><td class="value"><strong>Apofis</strong></td><td class="value">ACRush: How old are you??</td></tr>
<tr class="dark"><td class="value"><strong>Dee2306</strong></td><td class="value">Apofis: 22</td></tr>
<tr class="light"><td class="value"><strong>Lingmum</strong></td><td class="value">ACRush: Do you think the ART of programming is as googd as the CLR?</td></tr>
<tr class="dark"><td class="value"><strong>MB__</strong></td><td class="value">ACRush: What is the easiest problem you haven't done? :P</td></tr>
<tr class="light"><td class="value"><span class="bigRed">ACRush</span></td><td class="value"><span class="bigRed">khanhptnk: no.</span></td></tr>
<tr class="dark"><td class="value"><strong>puneetkp444</strong></td><td class="value">ACRush: any other good book apart from CLR which u recommened</td></tr>
<tr class="light"><td class="value"><strong>CrankyDay</strong></td><td class="value">abstractwhiz: heya</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">ACRush</span></td><td class="value"><span class="bigRed">Apofis: 22</span></td></tr>
<tr class="light"><td class="value"><strong>togi_</strong></td><td class="value">i'm trying to practice to NWERC, any suggestions?</td></tr>
<tr class="dark"><td class="value"><strong>stjepan</strong></td><td class="value">ACRush: do you know anyone remarkably good who started at that age?</td></tr>
<tr class="light"><td class="value"><strong>hamedvalizadeh</strong></td><td class="value">What's CLR?</td></tr>
<tr class="dark"><td class="value"><strong>khanhptnk</strong></td><td class="value">ACRush: you're very confident, i think so !</td></tr>
<tr class="light"><td class="value"><strong>niquefa</strong></td><td class="value">puneetkp444: CLR ?</td></tr>
<tr class="dark"><td class="value"><strong>khanhptnk</strong></td><td class="value">ACRush: i admire it !</td></tr>
<tr class="light"><td class="value"><strong>Andimeo</strong></td><td class="value">qu317058542: CLR?</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">ACRush</span></td><td class="value"><span class="bigRed">Apofis: Yes. they're of the same quality.</span></td></tr>
<tr class="light"><td class="value"><strong>puneetkp444</strong></td><td class="value">niquefa: CLR is Cormen - Itroduction to Algorithms</td></tr>
<tr class="dark"><td class="value"><strong>Dee2306</strong></td><td class="value">ACRush: Unlike Petr, u hav ignored so many questions.</td></tr>
<tr class="light"><td class="value"><span class="bigRed">ACRush</span></td><td class="value"><span class="bigRed">MB__: ...</span></td></tr>
<tr class="dark"><td class="value"><strong>suno</strong></td><td class="value">ACRush: I thick you must have a great code library~ Have you ever share it?</td></tr>
<tr class="light"><td class="value"><strong>niquefa</strong></td><td class="value">puneetkp444: OK </td></tr>
<tr class="dark"><td class="value"><strong>ortschun</strong></td><td class="value">ACRush: have you ever felt like you are bored with problem solving or like you're gonna compete no more?</td></tr>
<tr class="light"><td class="value"><span class="bigRed">ACRush</span></td><td class="value"><span class="bigRed">puneetkp444: Introduction to Algorihtm</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">ACRush</span></td><td class="value"><span class="bigRed">Dee2306: sorry, there are too many questions.</span></td></tr>
<tr class="light"><td class="value"><strong>Apofis</strong></td><td class="value">ACRush: Can I with algorithms get money and a job???</td></tr>
<tr class="dark"><td class="value"><strong>kcm1700</strong></td><td class="value">Dee2306: it is very hard to answer all the questions, you must understand it.</td></tr>
<tr class="light"><td class="value"><strong>viswanath</strong></td><td class="value">ACRush: I found many resubmissions in your initial topcoder competition...now how did you improve upon that?</td></tr>
<tr class="dark"><td class="value"><strong>khanhptnk</strong></td><td class="value">ACRush: what time do you usually go to bed ?</td></tr>
<tr class="light"><td class="value"><span class="bigRed">ACRush</span></td><td class="value"><span class="bigRed">Apofis: of course.</span></td></tr>
<tr class="dark"><td class="value"><strong>acsaga</strong></td><td class="value">Dee2306: i think if you ask question in some code format, he will response you very quickly:)</td></tr>
<tr class="light"><td class="value"><strong>khanhptnk</strong></td><td class="value">ACRush: do you think staying up late is good ?</td></tr>
<tr class="dark"><td class="value"><strong>samsam</strong></td><td class="value">how many members can register for the today's SRM...is it 1500 </td></tr>
<tr class="light"><td class="value"><span class="bigRed">ACRush</span></td><td class="value"><span class="bigRed">fancysimon: more practice and contests.</span></td></tr>
<tr class="dark"><td class="value"><strong>silverprince</strong></td><td class="value">ACRush: what are your favourite computer games ?</td></tr>
<tr class="light"><td class="value"><strong>Dee2306</strong></td><td class="value">ACRush: Yeaah .. i know.. but dude u r just perfect like Petr.</td></tr>
<tr class="dark"><td class="value"><strong>CrankyDay</strong></td><td class="value">yiuyuho: hey there raymond</td></tr>
<tr class="light"><td class="value"><strong>liruqi</strong></td><td class="value">ACRush: and you will have srm soon?</td></tr>
<tr class="dark"><td class="value"><strong>kcm1700</strong></td><td class="value">ACRush: I think you will need a break for upcoming SRM. Thank you very much ACRush, and I appologize for rudeness of some of my questions.</td></tr>
<tr class="light"><td class="value"><strong>krepst</strong></td><td class="value">Are you still enjoying problem-solving? Isn't it less interesting for you than it was?</td></tr>
<tr class="dark"><td class="value"><strong>krepst</strong></td><td class="value">ACRush: Are you still enjoying problem-solving? Isn't it less interesting for you than it was?</td></tr>
<tr class="light"><td class="value"><span class="bigRed">ACRush</span></td><td class="value"><span class="bigRed">viswanath: not so many resubmissions, but many failed submissions.</span></td></tr>
<tr class="dark"><td class="value"><strong>ortschun</strong></td><td class="value">ACRush: have you ever felt like you are bored with problem solving or like you're gonna compete no more?</td></tr>
<tr class="light"><td class="value"><span class="bigRed">ACRush</span></td><td class="value"><span class="bigRed">silverprince: War3</span></td></tr>
<tr class="dark"><td class="value"><strong>hamedvalizadeh</strong></td><td class="value">ACRush: What food do you like most?</td></tr>
<tr class="light"><td class="value"><strong>suno</strong></td><td class="value">ACRush: I thick you must have a great code library~ Have you ever share it to others?</td></tr>
<tr class="dark"><td class="value"><strong>andysoft</strong></td><td class="value">ACRush: What countries have you visited during your lifetime?</td></tr>
<tr class="light"><td class="value"><span class="bigRed">ACRush</span></td><td class="value"><span class="bigRed">suno: no.</span></td></tr>
<tr class="dark"><td class="value"><strong>khanhptnk</strong></td><td class="value">ACRush: what time do you usually go to bed ?</td></tr>
<tr class="light"><td class="value"><strong>progfool</strong></td><td class="value">any problem which u love the most....from the topcoder??</td></tr>
<tr class="dark"><td class="value"><strong>Apofis</strong></td><td class="value">ACRush: What kind of movies do you preffer??</td></tr>
<tr class="light"><td class="value"><strong>Dee2306</strong></td><td class="value">ACRush: do u resubmit ..?? or submit without testing sumtimes. ?</td></tr>
<tr class="dark"><td class="value"><strong>silverprince</strong></td><td class="value">ACRush: Nice :) </td></tr>
<tr class="light"><td class="value"><span class="bigRed">ACRush</span></td><td class="value"><span class="bigRed">andysoft: there are about 7-8 countries.</span></td></tr>
<tr class="dark"><td class="value"><strong>ortschun</strong></td><td class="value">ACRush: have you ever felt like you are bored with problem solving or like you're gonna compete no more?</td></tr>
<tr class="light"><td class="value"><strong>progfool</strong></td><td class="value">i mean the most interesting problem or contest u ever had during topcoder</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">ACRush</span></td><td class="value"><span class="bigRed">12:30</span></td></tr>
<tr class="light"><td class="value"><strong>ardiankp</strong></td><td class="value">ACRush: so early!</td></tr>
<tr class="dark"><td class="value"><strong>fancysimon</strong></td><td class="value">ACRush: How can i practice chanllage in TC?</td></tr>
<tr class="light"><td class="value"><strong>CrankyDay</strong></td><td class="value">knightry: good luck bud</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">ACRush</span></td><td class="value"><span class="bigRed">Dee2306: I will resubmit if neccessary. and I submit always many cases.</span></td></tr>
<tr class="light"><td class="value"><strong>progfool</strong></td><td class="value">ACRush: please answer at least one question from me!!!!.....which is the most memorable topcoder contest u ever had??</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">ACRush</span></td><td class="value"><span class="bigRed">ardiankp: ...</span></td></tr>
<tr class="light"><td class="value"><strong>MoS333</strong></td><td class="value">ACRush: what kind of music you like?</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">ACRush</span></td><td class="value"><span class="bigRed">fancysimon: only in contest.</span></td></tr>
<tr class="light"><td class="value"><strong>fancysimon</strong></td><td class="value">ACRush: every time I find it is hard for me to read other's code</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">ACRush</span></td><td class="value"><span class="bigRed">fancysimon: I have no idea about that. I'm not good at it.</span></td></tr>
<tr class="light"><td class="value"><strong>Apofis</strong></td><td class="value">ACRush: How much time and work is needed to be good enough for IOI??</td></tr>
<tr class="dark"><td class="value"><strong>ardiankp</strong></td><td class="value">ACRush: early sleep</td></tr>
<tr class="light"><td class="value"><strong>k.whitehat</strong></td><td class="value">schroeder, REPORT IN TEAM!!</td></tr>
<tr class="dark"><td class="value"><strong>khanhptnk</strong></td><td class="value">ACRush: good bye, ac and I hope you'll archive what you want !</td></tr>
<tr class="light"><td class="value"><strong>hamedvalizadeh</strong></td><td class="value">ACRush: Bye!</td></tr>
<tr class="dark"><td class="value"><strong>Shr33</strong></td><td class="value">k'</td></tr>
<tr class="light"><td class="value"><strong>bizkut</strong></td><td class="value">Let's do this Abington</td></tr>
<tr class="dark"><td class="value"><strong>hakami</strong></td><td class="value">ACRush: How much TC is known in world for work?</td></tr>
<tr class="light"><td class="value"><span class="bigRed">ACRush</span></td><td class="value"><span class="bigRed">fancysimon: In fact, we needn't fully understand those codes before challenge.</span></td></tr>
<tr class="dark"><td class="value"><strong>ortschun</strong></td><td class="value">ACRush: have you ever felt like you are bored with problem solving or like you're gonna compete no more?</td></tr>
<tr class="light"><td class="value"><strong>jmpld40</strong></td><td class="value">okay, let's close this chat session and thank ACRush for all his words of wisdom</td></tr>
<tr class="dark"><td class="value"><strong>cytmike</strong></td><td class="value">register at last min lol</td></tr>
<tr class="light"><td class="value"><strong>kcm1700</strong></td><td class="value">ACRush: thank you very much</td></tr>
<tr class="dark"><td class="value"><strong>tranquilliser</strong></td><td class="value">Apofis: It depends! If you just want to _make_ it to the IOI, then it depends what country you want to compete for</td></tr>
<tr class="light"><td class="value"><span class="bigRed">ACRush</span></td><td class="value"><span class="bigRed">Apofis: 8 h per day</span></td></tr>
<tr class="dark"><td class="value"><strong>fancysimon</strong></td><td class="value">ACRush: why?</td></tr>
<tr class="light"><td class="value"><strong>suno</strong></td><td class="value">ACRush: thx</td></tr>
<tr class="dark"><td class="value"><strong>jmpld40</strong></td><td class="value">If you have any pending questions, please post them here:  <a href="http://<%=ApplicationServer.FORUMS_SERVER_NAME%>/?module=Thread&amp;threadID=625150">http://forums.topcoder.com/?module=Thread&amp;threadID=625150</a></td></tr>
<tr class="light"><td class="value"><strong>progfool</strong></td><td class="value">thank u ACRush!!</td></tr>
<tr class="dark"><td class="value"><strong>cuihaochuan</strong></td><td class="value">thx~</td></tr>
<tr class="light"><td class="value"><strong>DieIng</strong></td><td class="value">thx</td></tr>
<tr class="dark"><td class="value"><strong>vrajesh1989</strong></td><td class="value">ardiankp: thanks </td></tr>
<tr class="light"><td class="value"><strong>moxi</strong></td><td class="value">ACRush: thank you, and good bye.</td></tr>
<tr class="dark"><td class="value"><strong>acsaga</strong></td><td class="value">suno: thanks jiao zhu</td></tr>
<tr class="light"><td class="value"><strong>Dee2306</strong></td><td class="value">ACRush: Yeaaaah .. Gud Luck All !!</td></tr>
<tr class="dark"><td class="value"><strong>[dasha]</strong></td><td class="value">ACRush: Thank u=)</td></tr>
<tr class="light"><td class="value"><strong>knightry</strong></td><td class="value">CrankyDay: thanks, you too</td></tr>
<tr class="dark"><td class="value"><strong>andysoft</strong></td><td class="value">ACRush: thanx</td></tr>
<tr class="light"><td class="value"><strong>kcm1700</strong></td><td class="value">ACRush: good luck</td></tr>
<tr class="dark"><td class="value"><strong>dupree</strong></td><td class="value">ACRush: bye</td></tr>
<tr class="light"><td class="value"><strong>ortschun</strong></td><td class="value">ACRush: thank you for ur wisdom :)</td></tr>
<tr class="dark"><td class="value"><strong>vrajesh1989</strong></td><td class="value">ACRush: thanks</td></tr>
<tr class="light"><td class="value"><strong>acsaga</strong></td><td class="value">ACRush: thanks jiao zhu</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">ACRush</span></td><td class="value"><span class="bigRed">ortschun: no. it's really fun.(for me0</span></td></tr>
<tr class="light"><td class="value"><strong>orienthis</strong></td><td class="value">hey k.w</td></tr>
<tr class="dark"><td class="value"><strong>andysoft</strong></td><td class="value">ACRush: thank you, bye</td></tr>
<tr class="light"><td class="value"><strong>liruqi</strong></td><td class="value">ACRush: 8 hour... Orzzzzzzzzzzzzzzzzz</td></tr>
<tr class="dark"><td class="value"><strong>jmpld40</strong></td><td class="value">Again, thanks for attending, thanks to ACRush and Good Luck in the competition!</td></tr>
<tr class="light"><td class="value"><strong>coder29</strong></td><td class="value">ACRush: whats us strategy in challenging problems?</td></tr>
<tr class="dark"><td class="value"><strong>magicpig</strong></td><td class="value">YM:)</td></tr>
<tr class="light"><td class="value"><strong>Dee2306</strong></td><td class="value">Yeaaaah .. Gud Luck!!!!!!!!!!!</td></tr>
<tr class="dark"><td class="value"><strong>without</strong></td><td class="value">good luck all tonight</td></tr>
<tr class="light"><td class="value"><span class="bigRed">ACRush</span></td><td class="value"><span class="bigRed">thanks, bye.</span></td></tr>
<tr class="dark"><td class="value"><strong>silverprince</strong></td><td class="value">ATB Acrush :)</td></tr>
<tr class="light"><td class="value"><strong>ahm.kam_92</strong></td><td class="value">ACRush: bye</td></tr>
<tr class="dark"><td class="value"><strong>ahm.kam_92</strong></td><td class="value">ACRush: :)</td></tr>
<tr class="light"><td class="value"><strong>coder29</strong></td><td class="value">ACRush: Bye</td></tr>
<tr class="dark"><td class="value"><strong>innocentboy</strong></td><td class="value">Rush: good luck</td></tr>
<tr class="light"><td class="value"><strong>fancysimon</strong></td><td class="value">ACRush: thanks</td></tr>
<tr class="dark"><td class="value"><strong>Shr33</strong></td><td class="value">:D</td></tr>
<tr class="light"><td class="value"><strong>fancysimon</strong></td><td class="value">ACRush: bye</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">ACRush</span></td><td class="value"><span class="bigRed">good luck all.</span></td></tr>
<tr class="light"><td class="value"><strong>innocentboy</strong></td><td class="value">ACRush: good luck</td></tr>



</tbody>
</table>
                <br /><br />
            </div>
        </td>
<%-- Center Column Ends --%>
        
<%-- Right Column Begins --%>
        <td width="170">
            <jsp:include page="../public_right.jsp">
                <jsp:param name="level1" value="default"/>
            </jsp:include>
        </td>
<%-- Right Column Ends --%>
        
    </tr>
</tbody>
</table>

<jsp:include page="../foot.jsp" />

</body>

</html>