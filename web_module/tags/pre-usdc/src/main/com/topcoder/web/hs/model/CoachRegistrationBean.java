package com.topcoder.web.hs.model;

import java.io.*;
import java.util.*;

public class CoachRegistrationBean implements Serializable {

    private Long userId = null;
    private String firstName = null;
    private String lastName = null;
    private String stateCode = null;
    private Long schoolId = null;
    private String handle = null;
    private boolean changePassword = false;
    private String password = null;
    private String confirmPassword = null;
    private String email = null;
    private String confirmEmail = null;
    private Integer editorId = null;
    private Integer languageId = null;
    private boolean agreeTerms = false;
    private List stateList = null;
    private List schoolList = null;
    private List editorList = null;
    private List languageList = null;
    private String termsOfUse = null;

    public CoachRegistrationBean() {
        /* do nothing */
    }

    public Long getUserId() {
        return (userId);
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public String getFirstName() {
        return (firstName);
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return (lastName);
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getStateCode() {
        return (stateCode);
    }

    public void setStateCode(String stateCode) {
        this.stateCode = stateCode;
    }

    public Long getSchoolId() {
        return (schoolId);
    }

    public void setSchoolId(Long schoolId) {
        this.schoolId = schoolId;
    }

    public String getHandle() {
        return (handle);
    }

    public void setHandle(String handle) {
        this.handle = handle;
    }

    public boolean getChangePassword() {
        return (changePassword);
    }

    public void setChangePassword(boolean changePassword) {
        this.changePassword = changePassword;
    }

    public String getPassword() {
        return (password);
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getConfirmPassword() {
        return (confirmPassword);
    }

    public void setConfirmPassword(String confirmPassword) {
        this.confirmPassword = confirmPassword;
    }

    public String getEmail() {
        return (email);
    }

    public void setEmail(String _email) {
        email = _email;
    }

    public String getConfirmEmail() {
        return (confirmEmail);
    }

    public void setConfirmEmail(String confirmEmail) {
        this.confirmEmail = confirmEmail;
    }

    public Integer getEditorId() {
        return (editorId);
    }

    public void setEditorId(Integer editorId) {
        this.editorId = editorId;
    }

    public Integer getLanguageId() {
        return (languageId);
    }

    public void setLanguageId(Integer languageId) {
        this.languageId = languageId;
    }

    public boolean getAgreeTerms() {
        return (agreeTerms);
    }

    public void setAgreeTerms(boolean agreeTerms) {
        this.agreeTerms = agreeTerms;
    }

    public List getStateList() {
        return (stateList);
    }

    public void setStateList(List stateList) {
        this.stateList = stateList;
    }

    public List getSchoolList() {
        return (schoolList);
    }

    public void setSchoolList(List schoolList) {
        this.schoolList = schoolList;
    }

    public List getEditorList() {
        return (editorList);
    }

    public void setEditorList(List editorList) {
        this.editorList = editorList;
    }

    public List getLanguageList() {
        return (languageList);
    }

    public void setLanguageList(List languageList) {
        this.languageList = languageList;
    }

    public String getTermsOfUse() {
        return (termsOfUse);
    }

    public void setTermsOfUse(String termsOfUse) {
        this.termsOfUse = termsOfUse;
    }

}

;
