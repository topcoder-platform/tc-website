package com.topcoder.web.privatelabel.model;

import com.topcoder.web.common.model.Base;

/**
 *
 * @author gpaul 06.26.2003
 */
public class SimpleRegInfo extends Base {

    private long userId;
    private String handle;
    private String password;
    private String passwordConfirm;
    private String email;
    private String emailConfirm;
    private String firstName;
    private String middleName;
    private String lastName;
    private String nameInAnotherLanguage;
    private String address1;
    private String address2;
    private String address3;
    private String countryCode;
    private String countryName;
    private String stateCode;
    private String stateName;
    private String province;
    private String city;
    private String zip;
    private String phonenumber;
    private String compCountryCode;
/*
    private Locale locale;
*/
    private boolean isAccountConversion;


    private long companyId;
    private long eventId;

    public SimpleRegInfo() {
        userId = 0;
        handle = "";
        password = "";
        passwordConfirm = "";
        email = "";
        emailConfirm = "";
        firstName = "";
        middleName = "";
        lastName = "";
        address1 = "";
        address2 = "";
        address3 = "";
        countryCode = "";
        countryName = "";
        stateCode = "";
        stateName = "";
        province = "";
        city = "";
        zip = "";
        companyId = 0;
        eventId = 0;
        phonenumber = "";
        isAccountConversion = false;
        compCountryCode = "";
/*
        locale = Locale.US;
*/
    }

    public SimpleRegInfo(SimpleRegInfo info) {
        setUserId(info.getUserId());
        setHandle(info.getHandle());
        setPassword(info.getPassword());
        setPasswordConfirm(info.getPasswordConfirm());
        setEmail(info.getEmail());
        setEmailConfirm(info.getEmailConfirm());
        setFirstName(info.getFirstName());
        setMiddleName(info.getMiddleName());
        setLastName(info.getLastName());
        setAddress1(info.getAddress1());
        setAddress2(info.getAddress2());
        setAddress3(info.getAddress3());
        setCountryCode(info.getCountryCode());
        setCountryName(info.getCountryName());
        setStateCode(info.getStateCode());
        setStateName(info.getStateName());
        setProvince(info.getProvince());
        setCity(info.getCity());
        setZip(info.getZip());
        setCompanyId(info.getCompanyId());
        setEventId(info.getEventId());
        setPhoneNumber(info.getPhoneNumber());
        setAccountConversion(info.isAccountConversion());
        setCompCountryCode(info.getCompCountryCode());

/*
        setLocale(info.getLocale());
*/

        setNew(info.isNew());
    }

    public boolean isAccountConversion() {
        return isAccountConversion;
    }

    public void setAccountConversion(boolean accountConversion) {
        isAccountConversion = accountConversion;
    }

    public String getPhoneNumber() {
        return phonenumber;
    }

    public long getUserId() {
        return userId;
    }

    public void setUserId(long userId) {
        this.userId = userId;
    }

    public void setPhoneNumber(String number) {
        this.phonenumber = number;
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

    public String getMiddleName() {
        return middleName;
    }

    public void setMiddleName(String middleName) {
        this.middleName = middleName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getNameInAnotherLanguage() {
        return nameInAnotherLanguage;
    }

    public void setNameInAnotherLanguage(String nameInAnotherLanguage) {
        this.nameInAnotherLanguage = nameInAnotherLanguage;
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

    public String getAddress3() {
        return address3;
    }

    public void setAddress3(String address3) {
        this.address3 = address3;
    }

    public String getCountryCode() {
        return countryCode;
    }

    public void setCountryCode(String countryCode) {
        this.countryCode = countryCode;
    }

    public String getCountryName() {
        return countryName;
    }

    public void setCountryName(String countryName) {
        this.countryName = countryName;
    }

    public String getStateCode() {
        return stateCode;
    }

    public void setStateCode(String stateCode) {
        this.stateCode = stateCode;
    }

    public String getStateName() {
        return stateName;
    }

    public void setStateName(String stateName) {
        this.stateName = stateName;
    }

    public String getProvince() {
        return province;
    }

    public void setProvince(String province) {
        this.province = province;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
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

    public long getEventId() {
        return eventId;
    }

    public void setEventId(long eventId) {
        this.eventId = eventId;
    }

/*
    public Locale getLocale() {
        log.debug("getting locale " + locale.toString());
        return locale;
    }

    public void setLocale(Locale locale) {
        log.debug("setting locale to " + locale.toString());
        this.locale = locale;
    }

*/


    public String getCompCountryCode() {
        return compCountryCode;
    }

    public void setCompCountryCode(String compCountryCode) {
        this.compCountryCode = compCountryCode;
    }
}

