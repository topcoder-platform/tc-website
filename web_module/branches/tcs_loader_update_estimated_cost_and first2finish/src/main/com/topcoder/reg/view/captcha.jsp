<%--
   - Copyright (C) 2013 TopCoder Inc., All Rights Reserved.
   - This snippet will display the captcha image.
   - Version: 1.0
   - Author: leo_lol
 --%>
<%@taglib prefix="s" uri="/struts-tags"%>
<img src="<s:url value='/i/captcha/%{captchaFile}'/>" />
