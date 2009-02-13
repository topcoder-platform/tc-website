<%@ page import="com.topcoder.web.reg.Constants" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib uri="common-functions" prefix="cf" %>
<%@ taglib prefix="reg_tags" tagdir="/WEB-INF/tags" %>

<%@ page contentType="text/html;charset=utf-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
   "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">

<head>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>TopCoder Registration</title>
    <reg_tags:style/>
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
<div id="schoolPageAligner" align="center">
    <div id="schoolPageSpacer">

        <div id="pageTitle"><div>&nbsp;</div></div>

        <form action="" method="post" name="schoolAddForm">
            <p>
                If you are being home schooled, please click <a href="#" onclick="homeSchooled();return false;">here</a>
            </p>
            <div class="regSection">
                School Search
            </div>
            <p>
                <strong>* School Name:</strong><br />
                <tc-webtag:errorIterator id="err" name="${schoolName}"><%=err%><br /></tc-webtag:errorIterator>
                <tc-webtag:textInput name="${schoolName}" size="50" maxlength="<%=Constants.MAX_SCHOOL_NAME_LENGTH%>" editable="true"/>
            </p>
            <p>
                <strong>* Country:</strong><br />
                <tc-webtag:errorIterator id="err" name="${countryCode}"><%=err%><br /></tc-webtag:errorIterator>
                <tc-webtag:objectSelect name="${countryCode}" list="${countries}" valueField="code" textField="name"/>
            </p>
            <p>
                <strong>State (US Only):</strong><br />
                <tc-webtag:errorIterator id="err" name="${stateCode}"><%=err%><br /></tc-webtag:errorIterator>
                <tc-webtag:textInput name="${stateCode}" size="2" maxlength="2" editable="true"/>
            </p>
            <p>
                <strong>Province:</strong><br />
                <tc-webtag:errorIterator id="err" name="${province}"><%=err%><br /></tc-webtag:errorIterator>
                <tc-webtag:textInput name="${province}" size="36" maxlength="<%=Constants.MAX_PROVINCE_LENGTH%>" editable="true"/>
            </p>
            <p>
                <strong>* City:</strong><br />
                <tc-webtag:errorIterator id="err" name="${city}"><%=err%><br /></tc-webtag:errorIterator>
                <tc-webtag:textInput name="${city}" size="36" maxlength="<%=Constants.MAX_CITY_LENGTH%>" editable="true"/>
            </p>
            <p>
                 <strong>* School Type:</strong><br />
                 <tc-webtag:errorIterator id="err" name="${schoolType}"><%=err%><br /></tc-webtag:errorIterator>
                 <tc-webtag:objectSelect name="${schoolType}" list="${schoolTypes}" valueField="id" textField="description"/>
            </p>

            <div align="center" id="legend">
                * = required
            </div>

            <div align="center" id="submitContainer">
                <button onclick="submit();">Submit</button>
            </div>
        </form>


    </div>
</div>
</body>
</html>



