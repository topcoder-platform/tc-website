<%@ page import="com.topcoder.web.common.model.IntroEventConfig" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=utf-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>TopCoder College Tour</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>

    <jsp:include page="/script.jsp"/>
    <jsp:include page="/style.jsp">
        <jsp:param name="key" value="tc_stats"/>
    </jsp:include>

</head>

<body>

<jsp:include page="../../top.jsp">
    <jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
<tr valign="top">
<!-- Left Column Begins-->
<td width="180">
    <jsp:include page="/includes/global_left.jsp">
        <jsp:param name="node" value="m_competitions"/>
    </jsp:include>
</td>
<!-- Left Column Ends -->

<!-- Center Column Begins -->
<td width="100%" align="center" class="bodyColumn">
<div class="fixedWidthBody">

<jsp:include page="../../page_title.jsp">
    <jsp:param name="image" value="college_tour"/>
    <jsp:param name="title" value="Overview"/>
</jsp:include>

<div align="center">
    <tc-webtag:sponsorImage image="image" alt="College Logo" border="0"/>
</div>

<!-- college tour site subnav -->
<jsp:include page="topMenu.jsp">
    <jsp:param name="active" value="algo_overview"/>
</jsp:include>

<!-- ends -->

<p>
    <div align="center"><a href="/tc?module=CollegeTourDescription"><img src="/i/collegetour/seeOtherEvents.png" /></a></div>
    <h2>2014 [topcoder] Asia Programming Competition</h2>

    <br>

    <h3>The Event</h3>
    [topcoder] is sponsoring a programming competition on Monday 07.28 2014 2:30pm CST (China Standard Time) UTC/GMT +8 hours.<br><br>

    <span class="bigRed">Registration for this event is from Friday 07.18 2014 2:30pm CST (China Standard Time) to Monday 07.28 2014 2:30pm CST (China Standard Time).</span><br>
    <br>
    
    <br><br>

    <h3>Prizes</h3>

    <ul>
            <li>1st place finisher will win an iPad mini Retina.
            </li>

            <li>2nd place from will win an iPad mini Retina.
            </li>


            <li>3rd place from will win an iPad mini Retina.
            </li>

            <li>All registrants from participating universities will receive a Maxwell-topcoder t-shirt.
            </li>

    </ul>

    <br /><br />
    
    <h3>Participating Universities</h3>
Beijing Institute of Technology School of software<br/>
Beihang University<br/>
Beijing Forestry University<br/>
Beijing Information Science and Technology University<br/>
Beijing Institute of Technology<br/>
Beijing Jiaotong University<br/>
Beijing Normal University<br/>
Beijing University of Chemical Technology<br/>
Beijing University of Posts and Telecommunications<br/>
Beijing University of Technology<br/>
Capital University of Economics and Business<br/>
Central South University<br/>
Changchun University of Science and Technology<br/>
Chengdu Neusoft University<br/>
China University of Geosciences<br/>
China University of Petroleum<br/>
Chongqing University<br/>
Dalian Maritime University<br/>
Dalian University of Technology School of software<br/>
East China Jiaotong University<br/>
East China Normal University<br/>
East China University of Science and Technology<br/>
Fudan University<br/>
Fujian Agriculture And Forestry University<br/>
Fujian Normal University<br/>
Fuzhou University<br/>
Guangdong University of Technology<br/>
Guilin University of Electronic Technology<br/>
Guizhou Normal University<br/>
Hangzhou Dianzi University<br/>
Hangzhou Institute of information engineering, electrical<br/>
Harbin Engineering University<br/>
Harbin Institute of Technology<br/>
Harbin University<br/>
Harbin University of Science and Technology<br/>
Heilongjiang University<br/>
Henan Polytechnic University<br/>
Hehai University<br/>
Huaihai Institute of Techology<br/>
Huazhong Agricultural University<br/>
Huazhong Normal University<br/>
Huazhong University of Science and Technology<br/>
Hubei Institute for Nationalities<br/>
Hunan City University<br/>
Hunan Normal University<br/>
Hunan University<br/>
Hunan University of Science and Technology<br/>
Hunan University of Technology<br/>
Huzhou Teachers College<br/>
Information Engineering University<br/>
Inner Mongolia Normal University<br/>
Jiangnan University<br/>
Jiangxi Normal University<br/>
Jiangxi University of Science and Technology<br/>
Jilin University<br/>
Jishou University<br/>
Nanjing University<br/>
Nanjing University of Aeronautics & Astronautics<br/>
Nanjing University of Posts and Telecommunications<br/>
Nanjing University of Science and Technology<br/>
Nankai University<br/>
Nanyang Institute of Technology<br/>
National University of Defense Technology<br/>
Ningbo University<br/>
Northeast Agricultural University<br/>
Northeast Forestry University<br/>
Northeast Normal University<br/>
Northeastern University<br/>
Northwestern Polytechnical University<br/>
Ocean University of China<br/>
Peking University<br/>
Renmin University of China<br/>
Sanya University<br/>
Shandong Jianzhu University<br/>
Shandong University<br/>
Shandong University of Science and Technology<br/>
Shandong University of Technology<br/>
Shanghai University<br/>
Shenzhen University<br/>
Sichuan University<br/>
South China University of Technology<br/>
Southeast University<br/>
Southwest Jiao Tong University<br/>
Southwest University for Nationalities<br/>
Southwest University of Science and Technology<br/>
Jinan University Zhuhai Campus<br/>
Tianjin University<br/>
Tianjin University of Technology<br/>
Tianjin University of Technology<br/>
Tongji University<br/>
Tsinghua University<br/>
University of Electronic Science and technology<br/>
University of Jinan<br/>
University of Science and Technology of China<br/>
Wuhan University<br/>
Wuhan University of Science and Technology<br/>
Xi'an Electronic and Science University<br/>
Xiamen University of Technology<br/>
Xiangtan University<br/>
Zhaoqing University<br/>
Zhejiang agriculture and Forestry University<br/>
Zhejiang Chinese Medicine University<br/>
Zhejiang Gongshang University<br/>
Zhejiang Normal University<br/>
Zhejiang posts and telecommunications at Career Technical College<br/>
Zhejiang Sci-Tech University<br/>
Zhejiang University Ningbo College of science and Engineering<br/>
Zhejiang University of Finance and Economics<br/>
Zhejiang University of Media and Communications<br/>
Zhejiang University of Science and Technology<br/>
Zhejiang University of Technology<br/>
Zhengzhou University of Light Industry
   
    <br /><br />
    
    <br><br>

    <h3>Becoming Participating Universities</h3>

    If you are interested in making your university a participating university, please <a href="mailto:ywu@appirio.com">contact us</a>.

</p>


</div>

</td>
<!-- Center Column Ends -->

<!-- Right Column Begins -->
<td width="170">
    <jsp:include page="../../public_right.jsp">
        <jsp:param name="level1" value="privatelabel"/>
    </jsp:include>
</td>
<!-- Right Column Ends -->

<!-- Gutter -->
<td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<!-- Gutter Ends -->
</tr>
</table>

<jsp:include page="../../foot.jsp"/>

</body>

</html>
