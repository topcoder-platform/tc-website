<%--
 * Copyright (C) 2004 - 2009 TopCoder Inc., All Rights Reserved.  
 *
 * This JSP handles main navigation bar.
 *
 * This JSP is included by the rest of the pages in this minisite. Taking into consideration the highest
 * navigation level, it renders the corresponding main nav and highlights the selected option.
 *
 * Author TCSDEVELOPER
 * Version 1.0
 * Since 2009 TopCoder Open Site Integration
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set value="<%=request.getParameter("mainTab")%>" var="mainTab"/>
                            
<div id="mainNav">
    <ul class="nav">
           <li><c:choose>
              <c:when test="${mainTab == 'overview'}">
                  <a href="/tc?module=Static&d1=tournaments&d2=tco09&d3=overview&d4=overview" class="tournamentActive"></a>
              </c:when>
              <c:otherwise>
                  <a href="/tc?module=Static&d1=tournaments&d2=tco09&d3=overview&d4=overview" class="tournament" onmouseover="rotateImage(this,1);" onmouseout="clearRotateImage();"><span class="tournament"></span></a>
               </c:otherwise>
            </c:choose></li>

           <li><c:choose>
              <c:when test="${mainTab == 'online'}">
                  <a href="/tc?module=Static&d1=tournaments&d2=tco09&d3=online&d4=architecture&d5=description" class="onlineActive"></a>
              </c:when>
              <c:otherwise>
                  <a href="/tc?module=Static&d1=tournaments&d2=tco09&d3=online&d4=architecture&d5=description" class="online" onmouseover="rotateImage(this,17);" onmouseout="clearRotateImage();"><span class="online"></span></a>
               </c:otherwise>
            </c:choose></li>

           <li><c:choose>
              <c:when test="${mainTab == 'algorithm'}">
                  <a href="/tc?module=Static&d1=tournaments&d2=tco09&d3=algorithm&d4=description" class="algorithmActive"></a>
              </c:when>
              <c:otherwise>
                  <a href="/tc?module=Static&d1=tournaments&d2=tco09&d3=algorithm&d4=description" class="algorithm" onmouseover="rotateImage(this,3);" onmouseout="clearRotateImage();"><span class="algorithm"></span></a>         
               </c:otherwise>
            </c:choose></li>

           <li><c:choose>
              <c:when test="${mainTab == 'marathon'}">
                  <a href="/tc?module=Static&d1=tournaments&d2=tco09&d3=marathon&d4=description" class="marathonActive"></a>
              </c:when>
              <c:otherwise>
                  <a href="/tc?module=Static&d1=tournaments&d2=tco09&d3=marathon&d4=description" class="marathon" onmouseover="rotateImage(this,6);" onmouseout="clearRotateImage();"><span class="marathon"></span></a>
               </c:otherwise>
            </c:choose></li>

           <li><c:choose>
              <c:when test="${mainTab == 'moddash'}">
                  <a href="/tc?module=Static&d1=tournaments&d2=tco09&d3=moddash&d4=description" class="moddashActive"></a>
              </c:when>
              <c:otherwise>
                  <a href="/tc?module=Static&d1=tournaments&d2=tco09&d3=moddash&d4=description" class="moddash" onmouseover="rotateImage(this,16);" onmouseout="clearRotateImage();"><span class="moddash"></span></a>
               </c:otherwise>
            </c:choose></li>

           <li><c:choose>
              <c:when test="${mainTab == 'studio'}">
                  <a href="/tc?module=Static&d1=tournaments&d2=tco09&d3=studio&d4=description" class="studioActive"></a>
              </c:when>
              <c:otherwise>
                  <a href="/tc?module=Static&d1=tournaments&d2=tco09&d3=studio&d4=description" class="studio" onmouseover="rotateImage(this,14);" onmouseout="clearRotateImage();"><span class="studio"></span></a>
               </c:otherwise>
            </c:choose></li>

            <li class="last"><a href="javascript:arena();" class="arena" onmouseover="rotateImage(this,10);" onmouseout="clearRotateImage();"><span class="launchArena"></span></a></li> 
  
    </ul>
</div><!-- End #mainNav -->
