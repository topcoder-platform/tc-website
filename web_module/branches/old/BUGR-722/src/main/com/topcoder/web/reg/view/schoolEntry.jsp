<%@ page import="com.topcoder.web.reg.Constants" %>
<%@ page contentType="text/html;charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib uri="common-functions" prefix="cf" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>

<head>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>TopCoder Registration</title>
    <jsp:include page="/style.jsp">
        <jsp:param name="key" value="tc_reg"/>
    </jsp:include>
    <script language="javascript" type="text/javascript" src="/js/tcdhtml.js"></script>

    <c:set value="<%=Constants.SCHOOL_NAME%>" var="schoolName"/>
    <c:set value="<%=Constants.SCHOOL_COUNTRY%>" var="countryCode"/>
    <c:set value="<%=Constants.SCHOOL_STATE%>" var="stateCode"/>
    <c:set value="<%=Constants.SCHOOL_PROVINCE%>" var="province"/>
    <c:set value="<%=Constants.SCHOOL_CITY%>" var="city"/>
    <c:set value="<%=Constants.VISIBLE_SCHOOL%>" var="visibleSchool"/>
    <c:set value="<%=Constants.SCHOOL_TYPE%>" var="schoolType"/>
    <c:set value="<%=Constants.SCHOOL_ID%>" var="schoolId"/>

    <script language="javascript" type="text/javascript">
        <!--
            function submit() {
            //set the school name and id
                putValue("window.opener.document.secondaryForm", "${schoolName}", getValue("document.schoolAddForm", "${schoolName}"));
                putValue("window.opener.document.secondaryForm", "${countryCode}", getValue("document.schoolAddForm", "${countryCode}"));
                putValue("window.opener.document.secondaryForm", "${stateCode}", getValue("document.schoolAddForm", "${stateCode}"));
                putValue("window.opener.document.secondaryForm", "${province}", getValue("document.schoolAddForm", "${province}"));
                putValue("window.opener.document.secondaryForm", "${city}", getValue("document.schoolAddForm", "${city}"));
                putValue("window.opener.document.secondaryForm", "${schoolId}", '');
                if (document.schoolAddForm.${visibleSchool}) {
                    putValue("window.opener.document.secondaryForm", "${visibleSchool}", getValue("document.schoolAddForm", "${visibleSchool}"));
                }
                putValue("window.opener.document.secondaryForm", "${schoolType}", getValue("document.schoolAddForm", "${schoolType}"));
                updateDivOrSpan(window.opener.document, "schoolName", getValue("document.schoolAddForm", "${schoolName}"));
                window.close();
            }
            function homeSchooled() {
                putValue("document.schoolAddForm", "${schoolName}", "<%=Constants.HOME_SCHOOLED%>");
                setSelectedOption("document.schoolAddForm", "${countryCode}", "${regUser.homeAddress.country.code}");
                putValue("document.schoolAddForm", "${stateCode}", "${regUser.homeAddress.state.code}");
                putValue("document.schoolAddForm", "${province}", "${regUser.homeAddress.province}");
                putValue("document.schoolAddForm", "${city}", "${regUser.homeAddress.city}");
            }
        -->
     </script>
</head>

<body>
<div align="center">
    <div style="width:500px;padding:15px;text-align:left;">

        <jsp:include page="/page_title.jsp">
            <jsp:param name="image" value="registration_w"/>
            <jsp:param name="title" value="School Selection"/>
        </jsp:include>

        <form action="" method="POST" name="schoolAddForm">
            <p>If you are being home schooled, please click <a href="#" onClick="homeSchooled();return false;">here</a></p>
            <span class="subtitle">School Search</span>
            <br><br>
            <strong>* School Name:</strong><br>
            <tc-webtag:errorIterator id="err" name="${schoolName}"><%=err%><br/></tc-webtag:errorIterator>
            <tc-webtag:textInput name="${schoolName}" size="50" maxlength="<%=Constants.MAX_SCHOOL_NAME_LENGTH%>" editable="true"/>
            <br><br>
            <strong>* Country:</strong><br>
            <tc-webtag:errorIterator id="err" name="${countryCode}"><%=err%><br/></tc-webtag:errorIterator>
            <tc-webtag:objectSelect name="${countryCode}" list="${countries}" valueField="code" textField="name"/>
            <br><br>
            <strong>State (US Only):</strong><br>
            <tc-webtag:errorIterator id="err" name="${stateCode}"><%=err%><br/></tc-webtag:errorIterator>
            <tc-webtag:textInput name="${stateCode}" size="2" maxlength="2" editable="true"/>
            <br><br>
            <strong>Province:</strong><br>
            <tc-webtag:errorIterator id="err" name="${province}"><%=err%><br/></tc-webtag:errorIterator>
            <tc-webtag:textInput name="${province}" size="36" maxlength="<%=Constants.MAX_PROVINCE_LENGTH%>" editable="true"/>
            <br><br>
            <strong>* City:</strong><br>
            <tc-webtag:errorIterator id="err" name="${city}"><%=err%><br/></tc-webtag:errorIterator>
            <tc-webtag:textInput name="${city}" size="36" maxlength="<%=Constants.MAX_CITY_LENGTH%>" editable="true"/>
            <br><br>



            <br><br>
             * School Type:
             <tc-webtag:errorIterator id="err" name="${schoolType}"><%=err%><br/></tc-webtag:errorIterator>
             <tc-webtag:objectSelect name="${schoolType}" list="${schoolTypes}" valueField="id" textField="description"/>


            <br><br>
            <div align="center">
            <a href="Javascript:submit();">Submit</a>
            </div>

        </form>

* = required
    </div>
</div>
</body>
</html>



