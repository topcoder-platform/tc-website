package com.topcoder.web.hs.model;

import java.io.Serializable;
import java.util.List;

public class StudentRegistrationBean implements Serializable {

    private Long user_id = null;

    private String first_name = null;

    private String last_name = null;

    private String state_code = null;

    private Long school_id = null;

    private String handle = null;

    private boolean change_password = false;

    private String password = null;

    private String confirm_password = null;

    private String email = null;

    private String confirm_email = null;

    private Integer editor_id = null;

    private Integer language_id = null;

    private boolean agree_terms = false;

    private List state_list = null;

    private List school_list = null;

    private List editor_list = null;

    private List language_list = null;

    private String terms_of_use = null;

    private Long school_coach_count = null;

    public StudentRegistrationBean() {
        /* do nothing */
    }

    public Long getUserId() {
        return (user_id);
    }

    public void setUserId(Long _user_id) {
        user_id = _user_id;
    }

    public String getFirstName() {
        return (first_name);
    }

    public void setFirstName(String _first_name) {
        first_name = _first_name;
    }

    public String getLastName() {
        return (last_name);
    }

    public void setLastName(String _last_name) {
        last_name = _last_name;
    }

    public String getStateCode() {
        return (state_code);
    }

    public void setStateCode(String _state_code) {
        state_code = _state_code;
    }

    public Long getSchoolId() {
        return (school_id);
    }

    public void setSchoolId(Long _school_id) {
        school_id = _school_id;
    }

    public String getHandle() {
        return (handle);
    }

    public void setHandle(String _handle) {
        handle = _handle;
    }

    public boolean getChangePassword() {
        return (change_password);
    }

    public void setChangePassword(boolean _change_password) {
        change_password = _change_password;
    }

    public String getPassword() {
        return (password);
    }

    public void setPassword(String _password) {
        password = _password;
    }

    public String getConfirmPassword() {
        return (confirm_password);
    }

    public void setConfirmPassword(String _confirm_password) {
        confirm_password = _confirm_password;
    }

    public String getEmail() {
        return (email);
    }

    public void setEmail(String _email) {
        email = _email;
    }

    public String getConfirmEmail() {
        return (confirm_email);
    }

    public void setConfirmEmail(String _confirm_email) {
        confirm_email = _confirm_email;
    }

    public Integer getEditorId() {
        return (editor_id);
    }

    public void setEditorId(Integer _editor_id) {
        editor_id = _editor_id;
    }

    public Integer getLanguageId() {
        return (language_id);
    }

    public void setLanguageId(Integer _language_id) {
        language_id = _language_id;
    }

    public boolean getAgreeTerms() {
        return (agree_terms);
    }

    public void setAgreeTerms(boolean _agree_terms) {
        agree_terms = _agree_terms;
    }

    public List getStateList() {
        return (state_list);
    }

    public void setStateList(List _state_list) {
        state_list = _state_list;
    }

    public List getSchoolList() {
        return (school_list);
    }

    public void setSchoolList(List _school_list) {
        school_list = _school_list;
    }

    public List getEditorList() {
        return (editor_list);
    }

    public void setEditorList(List _editor_list) {
        editor_list = _editor_list;
    }

    public List getLanguageList() {
        return (language_list);
    }

    public void setLanguageList(List _language_list) {
        language_list = _language_list;
    }

    public String getTermsOfUse() {
        return (terms_of_use);
    }

    public void setTermsOfUse(String _terms_of_use) {
        terms_of_use = _terms_of_use;
    }

    public Long getSchoolCoachCount() {
        return (school_coach_count);
    }

    public void setSchoolCoachCount(Long _school_coach_count) {
        school_coach_count = _school_coach_count;
    }

}

;
