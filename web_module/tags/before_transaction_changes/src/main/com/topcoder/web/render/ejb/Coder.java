package com.topcoder.web.render.ejb;

import java.rmi.RemoteException;
import java.sql.Date;
import java.sql.SQLException;

public interface Coder extends javax.ejb.EJBObject {
    public static final int INSERT = 1;
    public static final int SELECT = 2;
    public static final int UPDATE = 3;
    public static final int DELETE = 4;

    public void create(Integer coder_id, String state_code, String country_code, String first_name, String last_name, String home_phone, String work_phone, String address1, String address2, String city, String zip, String middle_name, String activation_code, Date member_since, String notify, String quote, String employer_search, String relocate, Date modify_date, Integer referral_id, Integer editor_id, String notify_inquiry, Integer referral_user_id, Integer language_id, Integer coder_type_id) throws RemoteException, SQLException;

    public void delete(Integer coder_id) throws RemoteException, SQLException;

    public CoderObject request(int cmd, CoderObject obj) throws RemoteException, SQLException;

    public void setStateCode(Integer coder_id, String state_code) throws RemoteException, SQLException;

    public String getStateCode(Integer coder_id) throws RemoteException, SQLException;

    public void setCountryCode(Integer coder_id, String country_code) throws RemoteException, SQLException;

    public String getCountryCode(Integer coder_id) throws RemoteException, SQLException;

    public void setFirstName(Integer coder_id, String first_name) throws RemoteException, SQLException;

    public String getFirstName(Integer coder_id) throws RemoteException, SQLException;

    public void setLastName(Integer coder_id, String last_name) throws RemoteException, SQLException;

    public String getLastName(Integer coder_id) throws RemoteException, SQLException;

    public void setHomePhone(Integer coder_id, String home_phone) throws RemoteException, SQLException;

    public String getHomePhone(Integer coder_id) throws RemoteException, SQLException;

    public void setWorkPhone(Integer coder_id, String work_phone) throws RemoteException, SQLException;

    public String getWorkPhone(Integer coder_id) throws RemoteException, SQLException;

    public void setAddress1(Integer coder_id, String address1) throws RemoteException, SQLException;

    public String getAddress1(Integer coder_id) throws RemoteException, SQLException;

    public void setAddress2(Integer coder_id, String address2) throws RemoteException, SQLException;

    public String getAddress2(Integer coder_id) throws RemoteException, SQLException;

    public void setCity(Integer coder_id, String city) throws RemoteException, SQLException;

    public String getCity(Integer coder_id) throws RemoteException, SQLException;

    public void setZip(Integer coder_id, String zip) throws RemoteException, SQLException;

    public String getZip(Integer coder_id) throws RemoteException, SQLException;

    public void setMiddleName(Integer coder_id, String middle_name) throws RemoteException, SQLException;

    public String getMiddleName(Integer coder_id) throws RemoteException, SQLException;

    public void setActivationCode(Integer coder_id, String activation_code) throws RemoteException, SQLException;

    public String getActivationCode(Integer coder_id) throws RemoteException, SQLException;

    public void setMemberSince(Integer coder_id, Date member_since) throws RemoteException, SQLException;

    public Date getMemberSince(Integer coder_id) throws RemoteException, SQLException;

    public void setNotify(Integer coder_id, String notify) throws RemoteException, SQLException;

    public String getNotify(Integer coder_id) throws RemoteException, SQLException;

    public void setQuote(Integer coder_id, String quote) throws RemoteException, SQLException;

    public String getQuote(Integer coder_id) throws RemoteException, SQLException;

    public void setEmployerSearch(Integer coder_id, String employer_search) throws RemoteException, SQLException;

    public String getEmployerSearch(Integer coder_id) throws RemoteException, SQLException;

    public void setRelocate(Integer coder_id, String relocate) throws RemoteException, SQLException;

    public String getRelocate(Integer coder_id) throws RemoteException, SQLException;

    public void setModifyDate(Integer coder_id, Date modify_date) throws RemoteException, SQLException;

    public Date getModifyDate(Integer coder_id) throws RemoteException, SQLException;

    public void setReferralId(Integer coder_id, Integer referral_id) throws RemoteException, SQLException;

    public Integer getReferralId(Integer coder_id) throws RemoteException, SQLException;

    public void setEditorId(Integer coder_id, Integer editor_id) throws RemoteException, SQLException;

    public Integer getEditorId(Integer coder_id) throws RemoteException, SQLException;

    public void setNotifyInquiry(Integer coder_id, String notify_inquiry) throws RemoteException, SQLException;

    public String getNotifyInquiry(Integer coder_id) throws RemoteException, SQLException;

    public void setReferralUserId(Integer coder_id, Integer referral_user_id) throws RemoteException, SQLException;

    public Integer getReferralUserId(Integer coder_id) throws RemoteException, SQLException;

    public void setLanguageId(Integer coder_id, Integer language_id) throws RemoteException, SQLException;

    public Integer getLanguageId(Integer coder_id) throws RemoteException, SQLException;

    public void setCoderTypeId(Integer coder_id, Integer coder_type_id) throws RemoteException, SQLException;

    public Integer getCoderTypeId(Integer coder_id) throws RemoteException, SQLException;

    public void clearCache() throws RemoteException;
}
