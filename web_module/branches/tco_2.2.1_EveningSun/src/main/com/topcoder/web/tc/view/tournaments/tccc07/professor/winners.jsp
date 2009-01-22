<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page contentType="text/html;charset=utf-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>2007 TopCoder Collegiate Challenge - Computer Programming Tournament</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <link type="text/css" rel="stylesheet" href="/css/tournaments/tccc07.css"/>
    <link type="text/css" rel="stylesheet" href="/css/coders.css"/>
    <jsp:include page="../../script.jsp"/>
</head>
<body>

<div align="center" style="background: transparent;">
    <div id="containAll">
        <div id="content">

            <jsp:include page="../nav.jsp">
                <jsp:param name="tabLev1" value="overview"/>
                <jsp:param name="tabLev2" value="joinus"/>
                <jsp:param name="tabLev3" value="professor"/>
            </jsp:include>

            <div id="pageBody">

                <h1><span>Prestigious Professor Award Winners</span></h1>
                
                <h2>Professor: Vitaly Bondarenko</h2>
                <p style="float:right; width:175px; height: 219px; padding:10px;"><img style="border: 2px solid #2f2f2f;" alt="Professor Vitaly Bondarenko" src="/i/tournament/tccc07/vvb.png" /></p>
                <p><strong>Nominated by </strong><tc-webtag:handle coderId="7389864" context="algorithm"/><br />
                In my country most smart people don't want to lecture in a university because lectors do not receive good money. But some heroes exist, those who think not only about money and who are smart enough to make money and make lectures in university as a second job or as a hobby. One such brave spirit exists in our university. We call him Bond. His full name is Vitaly Bondarenko and he was one of the first winners of IOI from Ukraine in 1992. After being the winner of IOI, the spirit of competition never left him and he was one of the people who developed a national school computer competition to a high level as an organizer and a judge. After finishing education in university, he did not leave Ukraine as a lot of smart people in my country do in order to find a better life in Silicon Valley. He stayed to become a true hero of the motherland - a lector at a university. And not so long ago he also became an organizer for ACM teams of my university and he manages to make a community of people who has a desire to challenge hard tasks, to challenge the world in order to make it different. And now a community can play a big role in the life of students, especially first year students, who from their first days in the university can be involved in the beautiful world of colored balloons, two second time limits, and fifteen minute challenge phases which help students to become professionals in a computer science field.</p>
                
                <h2>Professor: Yue Chen</h2>
                <p style="float:right; width:175px; height: 231px; padding:10px;"><img style="border: 2px solid #2f2f2f;" alt="Professor Yue Chen" src="/i/tournament/tccc07/chenyue.png" /></p>
                <p><strong>Nominated by </strong><tc-webtag:handle coderId="10526732" context="algorithm"/><br />
                Professor Yue Chen has been the lead-coach of the Zhejiang University ACM/ICPC team from early 2000. Since then, Professor Chen encourages the ICPC team members, as well as the students in CS College, to take part in online programming contests to practice. From the summer 2002, many of ZJU students became active members of TopCoder; usually they take part in the SRM contests at the very beginning, since algorithm is the soul of the programming. Professor Chen even treated TopCoder ratings as a part of the evidence to select ICPC team member. That is part of the reason why there are so many TopCoder members from Zhejiang University (check our <a href="/stat?c=school_avg_rating">school rating</a>). Some ZJU students also tried Component Design / Development contests, and they have had very good achievements. In last year's TCCC, <tc-webtag:handle coderId="9998760" context="development"/> won the <a href="/tc?module=Static&d1=tournaments&d2=tccc06&d3=comp_dev_summary">development contest</a>, and <tc-webtag:handle coderId="10425804" context="design"/> got 2nd place in the <a href="/tc?module=Static&d1=tournaments&d2=tccc06&d3=comp_des_summary">design contest</a>. Professor Chen is very kind and warm-hearted; the students in ZJU call her "Chen Yue Sister", instead of "Teacher Chen".</p>
                
                <h2>Professor: Wenhu Wu</h2>
                <p><strong>Nominated by </strong><tc-webtag:handle coderId="11889868" context="algorithm"/><br />
                If it wasn't for <tc-webtag:handle coderId="10574855" context="algorithm"/>, <tc-webtag:handle coderId="19849563" context="algorithm"/> would be the top coder the in algorithm contest! Yes, China is really a power house in this amazing community. If you ask the members from China, they will tell you about Professor Wenhu Wu from Tsinghua University, who is really a leader and a guide of young algorithm talents from China. As an alumni of Tsinghua University myself, my contact with Mr. Wu started several years before my entering into the university. Mr. Wu is the coach of the China IOI team and has been working at this for over 20 years, since the 1980s. Thanks to his great effort, many middle (even primary) school students learn skills of programming and algorithms at a young age. I'm one of the students who benefits from his good books and lectures. Without him, maybe I would not be a CS student now. No Chinese competitor would deny that he is the most influential teacher of algorithm contests in China. Professor Wenhu Wu has a lot of stories. He has kept the record of long distance running in Tsinghua University for over 40 years. Now he is about 70 and he is still giving lectures of basic programming skills. This is a very famous course and attracts students from the whole university. As a rumor, I even heard that recently Miss Wu (<tc-webtag:handle coderId="22629209" context="algorithm"/>), the VP of TopCoder China, visited his lectures and asked him questions. I really hope Professor Wu could show up in this year's finals and compete with the top Chinese programmers together!</p>

            </div>
        </div>
        <jsp:include page="../footer.jsp"/>
    </div>
</div>
</body>
</html>
