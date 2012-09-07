<%@ page import="com.topcoder.shared.util.ApplicationServer" %>
<%--
  - Author: isv
  - Version: 1.0
  - Copyright (C) 2012 TopCoder Inc., All Rights Reserved.
  -
  - Description: This page fragment displays the popup for uploading member photo image.
--%>
<div class="photoPopup popupUploadPhoto transparent hide">
    <div class="popupWindow">
        <div class="title">UPLOAD YOUR PHOTO</div>

        <div class="content" id="uploadDiv">
            <div id="photoUploadLeft">
                <div class="locateInput">
                    <div class="inner"></div>
                </div>

                <form action="http://<%=ApplicationServer.SERVER_NAME%>/photo?module=upload&photoAction=preview" method="post" enctype="multipart/form-data"
                      id="photoUploadForm">
                    <a href="javascript:;" class="btn1 btnBrowse">
                        <span class="rightSide">
                            <span class="inner">
                                Browse 
                                <span class="file-wrapper">
                                <input type="file" name="photoFile" id="inputFile"/>
                                </span>                     
                            </span>                                                 
                        </span>
                    </a>
                </form>

                <div id="uploadImage">
                    <p>Uploaded Image</p>
                </div>
            </div>
            <div id="photoUploadRight">
                <div id="previewDiv">
                    <img src="i/previewPhoto.jpg" alt=""/>
                </div>

                <div class="alert">
                    Browse Photo should be in *.JPG format file which is the width is 400 pixel and the height is 400
                    pixel.
                </div>
                <div>
                    <a class="link" href="http://topcoder.com/home/help/?p=866">Photo Policy</a>
                </div>
                <a href="javascript:;" class="btn1 btnCancel">
                    <span class="rightSide">
                        <span class="inner">
                            Cancel                                               
                        </span>                                                 
                    </span>
                </a>
                <a href="javascript:;" class="btn1 red btnUpload">
                    <span class="rightSide">
                        <span class="inner">
                            Upload                                               
                        </span>                                                 
                    </span>
                </a>

                <form action="http://<%=ApplicationServer.SERVER_NAME%>/photo?module=upload&photoAction=commit" method="post" id="submitPhotoForum">
                    <input type="hidden" name="previewPath"/>
                    <input type="hidden" name="lx"/>
                    <input type="hidden" name="ly"/>
                    <input type="hidden" name="rx"/>
                    <input type="hidden" name="ry"/>
                    <input type="hidden" name="picWidth"/>
                    <input type="hidden" name="picHeight"/>
                </form>
            </div>
        </div>
    </div>
</div>
