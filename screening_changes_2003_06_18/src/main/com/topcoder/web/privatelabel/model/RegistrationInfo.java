package com.topcoder.web.privatelabel.model;

import com.topcoder.web.common.StringUtils;
import com.topcoder.web.privatelabel.Constants;

import javax.servlet.http.HttpServletRequest;

public class RegistrationInfo extends Base {
    private String handle;
    private String password;
    private String passwordConfirm;
    private String email;
    private String emailConfirm;
    private String firstName;
    private String lastName;
    private String address1;
    private String address2;
    private String countryCode;
    private String countryName;
    private String stateCode;
    private String stateName;
    private String city;
    private String state;
    private String zip;
    private long companyId;

    public RegistrationInfo() {

    }

    public RegistrationInfo(HttpServletRequest request) {
        setHandle(StringUtils.checkNull(request.getParameter(Constants.HANDLE)));
        setPassword(StringUtils.checkNull(request.getParameter(Constants.PASSWORD)));
        setPasswordConfirm(StringUtils.checkNull(request.getParameter(Constants.PASSWORD_CONFIRM)));
        setEmail(StringUtils.checkNull(request.getParameter(Constants.EMAIL)));
        setEmailConfirm(StringUtils.checkNull(request.getParameter(Constants.EMAIL_CONFIRM)));
        setFirstName(StringUtils.checkNull(request.getParameter(Constants.FIRST_NAME)));
        setLastName(StringUtils.checkNull(request.getParameter(Constants.LAST_NAME)));
        setAddress1(StringUtils.checkNull(request.getParameter(Constants.ADDRESS1)));
        setAddress2(StringUtils.checkNull(request.getParameter(Constants.ADDRESS2)));
        setCountryCode(StringUtils.checkNull(request.getParameter(Constants.COUNTRY_CODE)));
        setStateCode(StringUtils.checkNull(request.getParameter(Constants.STATE_CODE)));
        setCity(StringUtils.checkNull(request.getParameter(Constants.CITY)));
        setZip(StringUtils.checkNull(request.getParameter(Constants.ZIP)));
        setCompanyId(Long.parseLong(StringUtils.checkNull(request.getParameter(Constants.COMPANY_ID))));
    }

    public String getHandle() {
        return handle;
    }

    public void setHandle(String handle) {
        this.handle = handle;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPasswordConfirm() {
        return passwordConfirm;
    }

    public void setPasswordConfirm(String passwordConfirm) {
        this.passwordConfirm = passwordConfirm;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getEmailConfirm() {
        return emailConfirm;
    }

    public void setEmailConfirm(String emailConfirm) {
        this.emailConfirm = emailConfirm;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getAddress1() {
        return address1;
    }

    public void setAddress1(String address1) {
        this.address1 = address1;
    }

    public String getAddress2() {
        return address2;
    }

    public void setAddress2(String address2) {
        this.address2 = address2;
    }

    public String getCountryCode() {
        return countryCode;
    }

    public void setCountryCode(String countryCode) {
        this.countryCode = countryCode;
    }

    public String getStateCode() {
        return stateCode;
    }

    public void setStateCode(String stateCode) {
        this.stateCode = stateCode;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public String getZip() {
        return zip;
    }

    public void setZip(String zip) {
        this.zip = zip;
    }

    public long getCompanyId() {
        return companyId;
    }

    public void setCompanyId(long companyId) {
        this.companyId = companyId;
    }

    public String getCountryName() {
        return countryName;
    }

    public void setCountryName(String countryName) {
        this.countryName = countryName;
    }

    public String getStateName() {
        return stateName;
    }

    public void setStateName(String stateName) {
        this.stateName = stateName;
    }

}

