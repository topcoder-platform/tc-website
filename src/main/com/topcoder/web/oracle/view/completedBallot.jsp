<%@ page contentType="text/html;charset=utf-8" %> 
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<head>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>TopCoder</title>
    <link type="text/css" rel="stylesheet" href="/css/oracle/main.css">
    <link type="text/css" rel="stylesheet" href="/css/oracle/stats.css">
    <style type="text/css">
        html {
            min-height: 100%;
            margin-bottom: 1px;
        }
    </style>
    <script language="JavaScript" type="text/javascript" src="/js/oracle/popup.js"></script>
    <script language="JavaScript" type="text/javascript"><!--
        function postToViewer(mySrc) {
            document.getElementById("viewer").src = mySrc;
            document.getElementById("viewer").style.width = '300px';
            document.getElementById("viewer").style.height = '300px';
        }
        
        function hideViewer() {
            document.getElementById("viewerpopup").style.display = "none";
        }
        //-->
    </script>
</head>

<body>

<div align="center">
    <div id="contentOut">
        <div id="contentIn">

                <h1>You have already competed.</h1>

                <div align="center" style="margin: 40px 0px 100px 0px;">
                <p align="center">You have already made your prediction for this contest.<br>Here it is:</p>
                
                    <div class="selectedContainer" style="width: 305px;">
                        <img src="/i/oracle/interface/meterBest.png" alt="" style="position: absolute; top: 0px; left: -30px;">
                        <img src="/i/oracle/interface/meterWorst.png" alt="" style="position: absolute; top: 0px; right: -30px;">

                        <ul id="selectedCandidates" class="imageLineup" style="margin: 0px; float: left; clear: both;">
                            <li>
                                <div class="save">
                                <a target="_blank" href="DOWNLOAD"><img src="/i/oracle/interface/disk.png" alt="DL"></a>
                                </div>
                                <img class="small" name="candidateImage" src="/i/oracle/candidates/39.png" alt="" onmouseover="postToViewer(this.src); popUp(this,'viewerpopup');" onmouseout="popHide()" onmousedown="hideViewer()" style="cursor: default;">
                            </li>
                            <li>
                                <div class="save">
                                <a target="_blank" href="DOWNLOAD"><img src="/i/oracle/interface/disk.png" alt="DL"></a>
                                </div>
                                <img class="small" name="candidateImage" src="/i/oracle/candidates/49.png" alt="" onmouseover="postToViewer(this.src); popUp(this,'viewerpopup');" onmouseout="popHide()" onmousedown="hideViewer()" style="cursor: default;">
                            </li>
                            <li>
                                <div class="save">
                                <a target="_blank" href="DOWNLOAD"><img src="/i/oracle/interface/disk.png" alt="DL"></a>
                                </div>
                                <img class="small" name="candidateImage" src="/i/oracle/candidates/15.png" alt="" onmouseover="postToViewer(this.src); popUp(this,'viewerpopup');" onmouseout="popHide()" onmousedown="hideViewer()" style="cursor: default;">
                            </li>
                            <li>
                                <div class="save">
                                <a target="_blank" href="DOWNLOAD"><img src="/i/oracle/interface/disk.png" alt="DL"></a>
                                </div>
                                <img class="small" name="candidateImage" src="/i/oracle/candidates/29.png" alt="" onmouseover="postToViewer(this.src); popUp(this,'viewerpopup');" onmouseout="popHide()" onmousedown="hideViewer()" style="cursor: default;">
                            </li>
                            <li>
                                <div class="save">
                                <a target="_blank" href="DOWNLOAD"><img src="/i/oracle/interface/disk.png" alt="DL"></a>
                                </div>
                                <img class="small" name="candidateImage" src="/i/oracle/candidates/48.png" alt="" onmouseover="postToViewer(this.src); popUp(this,'viewerpopup');" onmouseout="popHide()" onmousedown="hideViewer()" style="cursor: default;">
                            </li>
                        </ul>

                    </div>
                </div>

            <div class="popUp" id="viewerpopup">
                <img src="#" id="viewer" alt="" style="margin:5px; border: 1px solid black; background: #FFFFFF;"></div>

            <div style="clear:both;">&nbsp;</div>



        <jsp:include page="foot.jsp"/>
        </div>
    </div>
</div>

</body>
</html>