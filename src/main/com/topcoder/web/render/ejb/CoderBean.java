package com.topcoder.web.render.ejb;

import javax.ejb.EJBException;
import javax.ejb.SessionContext;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import java.io.InputStream;
import java.sql.*;
import java.text.DecimalFormat;
import java.util.Enumeration;
import java.util.Hashtable;

public class CoderBean implements javax.ejb.SessionBean {

    static Hashtable cache = new Hashtable();
    public SessionContext context = null;
    public static int MAXSIZE = -1;
    public static final DecimalFormat fmt0 = new DecimalFormat("0000000000");

    public String getKey(Integer coder_id) {
        String key = "";

        key += fmt0.format(coder_id);
        return (key);
    }

    public String getKey(CoderObject obj) {
        return (getKey(obj.coder_id));
    }

    public void create(Integer coder_id, String state_code, String country_code, String first_name, String last_name, String home_phone, String work_phone, String address1, String address2, String city, String zip, String middle_name, String activation_code, Date member_since, String notify, String quote, String employer_search, String relocate, Date modify_date, Integer referral_id, Integer editor_id, String notify_inquiry, Integer referral_user_id, Integer language_id, Integer coder_type_id) throws SQLException {
        Connection conn = null;
        PreparedStatement ps = null;

        String insert = "INSERT INTO CODER VALUES (  " + coder_id + ", '" + state_code + "', '" + country_code + "', '" + first_name + "', '" + last_name + "', '" + home_phone + "', '" + work_phone + "', '" + address1 + "', '" + address2 + "', '" + city + "', '" + zip + "', '" + middle_name + "', '" + activation_code + "', ?, '" + notify + "', '" + quote + "', '" + employer_search + "', '" + relocate + "', ?, " + referral_id + ", " + editor_id + ", '" + notify_inquiry + "', " + referral_user_id + ", " + language_id + ", " + coder_type_id + " )";

        try {
            conn = com.topcoder.shared.util.DBMS.getConnection();
            ps = conn.prepareStatement(insert);
            ps.setDate(1, member_since);
            ps.setDate(2, modify_date);
            ps.executeUpdate();
        } catch (SQLException e) {
            try {
                if (ps != null) ps.close();
            } catch (Exception f) {
            }
            try {
                if (conn != null) conn.close();
            } catch (Exception f) {
            }
            throw(e);
        } catch (Exception e) {
        }
        try {
            if (ps != null) ps.close();
        } catch (Exception f) {
        }
        try {
            if (conn != null) conn.close();
        } catch (Exception f) {
        }
    }

    public void delete(Integer coder_id) throws SQLException {
        Connection conn = null;
        String delete = "DELETE FROM CODER WHERE CODER_ID = " + coder_id;
        PreparedStatement ps = null;

        try {
            conn = com.topcoder.shared.util.DBMS.getConnection();
            ps = conn.prepareStatement(delete);
            ps.executeUpdate();
        } catch (SQLException e) {
            try {
                if (ps != null) ps.close();
            } catch (Exception f) {
            }
            try {
                if (conn != null) conn.close();
            } catch (Exception f) {
            }
            throw(e);
        }
        cache.remove(getKey(coder_id));
        try {
            if (ps != null) ps.close();
        } catch (Exception f) {
        }
        try {
            if (conn != null) conn.close();
        } catch (Exception f) {
        }
    }

    public CoderObject request(int cmd, CoderObject obj) throws SQLException {

        switch (cmd) {

            case Coder.INSERT:
                create(obj.coder_id, obj.state_code, obj.country_code, obj.first_name, obj.last_name, obj.home_phone, obj.work_phone, obj.address1, obj.address2, obj.city, obj.zip, obj.middle_name, obj.activation_code, obj.member_since, obj.notify, obj.quote, obj.employer_search, obj.relocate, obj.modify_date, obj.referral_id, obj.editor_id, obj.notify_inquiry, obj.referral_user_id, obj.language_id, obj.coder_type_id);
                break;

            case Coder.SELECT:
                obj = getRecord(obj.coder_id);
                if (obj == null)
                    throw new EJBException(
                            "no matching record");
                break;

            case Coder.UPDATE:
                putRecord(obj.coder_id, obj.state_code, obj.country_code, obj.first_name, obj.last_name, obj.home_phone, obj.work_phone, obj.address1, obj.address2, obj.city, obj.zip, obj.middle_name, obj.activation_code, obj.member_since, obj.notify, obj.quote, obj.employer_search, obj.relocate, obj.modify_date, obj.referral_id, obj.editor_id, obj.notify_inquiry, obj.referral_user_id, obj.language_id, obj.coder_type_id);
                break;

            case Coder.DELETE:
                delete(obj.coder_id);
                break;

        }
        return (obj);
    }

    public void setStateCode(Integer coder_id, String state_code) throws SQLException {
        putRecord(coder_id, state_code, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
    }

    public String getStateCode(Integer coder_id) throws SQLException {
        CoderObject obj = null;
        String result;

        obj = getRecord(coder_id);
        if (obj == null)
            throw new EJBException("record not found");
        return (obj.state_code);
    }

    public void setCountryCode(Integer coder_id, String country_code) throws SQLException {
        putRecord(coder_id, null, country_code, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
    }

    public String getCountryCode(Integer coder_id) throws SQLException {
        CoderObject obj = null;
        String result;

        obj = getRecord(coder_id);
        if (obj == null)
            throw new EJBException("record not found");
        return (obj.country_code);
    }

    public void setFirstName(Integer coder_id, String first_name) throws SQLException {
        putRecord(coder_id, null, null, first_name, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
    }

    public String getFirstName(Integer coder_id) throws SQLException {
        CoderObject obj = null;
        String result;

        obj = getRecord(coder_id);
        if (obj == null)
            throw new EJBException("record not found");
        return (obj.first_name);
    }

    public void setLastName(Integer coder_id, String last_name) throws SQLException {
        putRecord(coder_id, null, null, null, last_name, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
    }

    public String getLastName(Integer coder_id) throws SQLException {
        CoderObject obj = null;
        String result;

        obj = getRecord(coder_id);
        if (obj == null)
            throw new EJBException("record not found");
        return (obj.last_name);
    }

    public void setHomePhone(Integer coder_id, String home_phone) throws SQLException {
        putRecord(coder_id, null, null, null, null, home_phone, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
    }

    public String getHomePhone(Integer coder_id) throws SQLException {
        CoderObject obj = null;
        String result;

        obj = getRecord(coder_id);
        if (obj == null)
            throw new EJBException("record not found");
        return (obj.home_phone);
    }

    public void setWorkPhone(Integer coder_id, String work_phone) throws SQLException {
        putRecord(coder_id, null, null, null, null, null, work_phone, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
    }

    public String getWorkPhone(Integer coder_id) throws SQLException {
        CoderObject obj = null;
        String result;

        obj = getRecord(coder_id);
        if (obj == null)
            throw new EJBException("record not found");
        return (obj.work_phone);
    }

    public void setAddress1(Integer coder_id, String address1) throws SQLException {
        putRecord(coder_id, null, null, null, null, null, null, address1, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
    }

    public String getAddress1(Integer coder_id) throws SQLException {
        CoderObject obj = null;
        String result;

        obj = getRecord(coder_id);
        if (obj == null)
            throw new EJBException("record not found");
        return (obj.address1);
    }

    public void setAddress2(Integer coder_id, String address2) throws SQLException {
        putRecord(coder_id, null, null, null, null, null, null, null, address2, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
    }

    public String getAddress2(Integer coder_id) throws SQLException {
        CoderObject obj = null;
        String result;

        obj = getRecord(coder_id);
        if (obj == null)
            throw new EJBException("record not found");
        return (obj.address2);
    }

    public void setCity(Integer coder_id, String city) throws SQLException {
        putRecord(coder_id, null, null, null, null, null, null, null, null, city, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
    }

    public String getCity(Integer coder_id) throws SQLException {
        CoderObject obj = null;
        String result;

        obj = getRecord(coder_id);
        if (obj == null)
            throw new EJBException("record not found");
        return (obj.city);
    }

    public void setZip(Integer coder_id, String zip) throws SQLException {
        putRecord(coder_id, null, null, null, null, null, null, null, null, null, zip, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
    }

    public String getZip(Integer coder_id) throws SQLException {
        CoderObject obj = null;
        String result;

        obj = getRecord(coder_id);
        if (obj == null)
            throw new EJBException("record not found");
        return (obj.zip);
    }

    public void setMiddleName(Integer coder_id, String middle_name) throws SQLException {
        putRecord(coder_id, null, null, null, null, null, null, null, null, null, null, middle_name, null, null, null, null, null, null, null, null, null, null, null, null, null);
    }

    public String getMiddleName(Integer coder_id) throws SQLException {
        CoderObject obj = null;
        String result;

        obj = getRecord(coder_id);
        if (obj == null)
            throw new EJBException("record not found");
        return (obj.middle_name);
    }

    public void setActivationCode(Integer coder_id, String activation_code) throws SQLException {
        putRecord(coder_id, null, null, null, null, null, null, null, null, null, null, null, activation_code, null, null, null, null, null, null, null, null, null, null, null, null);
    }

    public String getActivationCode(Integer coder_id) throws SQLException {
        CoderObject obj = null;
        String result;

        obj = getRecord(coder_id);
        if (obj == null)
            throw new EJBException("record not found");
        return (obj.activation_code);
    }

    public void setMemberSince(Integer coder_id, Date member_since) throws SQLException {
        putRecord(coder_id, null, null, null, null, null, null, null, null, null, null, null, null, member_since, null, null, null, null, null, null, null, null, null, null, null);
    }

    public Date getMemberSince(Integer coder_id) throws SQLException {
        CoderObject obj = null;
        Date result;

        obj = getRecord(coder_id);
        if (obj == null)
            throw new EJBException("record not found");
        return (obj.member_since);
    }

    public void setNotify(Integer coder_id, String notify) throws SQLException {
        putRecord(coder_id, null, null, null, null, null, null, null, null, null, null, null, null, null, notify, null, null, null, null, null, null, null, null, null, null);
    }

    public String getNotify(Integer coder_id) throws SQLException {
        CoderObject obj = null;
        String result;

        obj = getRecord(coder_id);
        if (obj == null)
            throw new EJBException("record not found");
        return (obj.notify);
    }

    public void setQuote(Integer coder_id, String quote) throws SQLException {
        putRecord(coder_id, null, null, null, null, null, null, null, null, null, null, null, null, null, null, quote, null, null, null, null, null, null, null, null, null);
    }

    public String getQuote(Integer coder_id) throws SQLException {
        CoderObject obj = null;
        String result;

        obj = getRecord(coder_id);
        if (obj == null)
            throw new EJBException("record not found");
        return (obj.quote);
    }

    public void setEmployerSearch(Integer coder_id, String employer_search) throws SQLException {
        putRecord(coder_id, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, employer_search, null, null, null, null, null, null, null, null);
    }

    public String getEmployerSearch(Integer coder_id) throws SQLException {
        CoderObject obj = null;
        String result;

        obj = getRecord(coder_id);
        if (obj == null)
            throw new EJBException("record not found");
        return (obj.employer_search);
    }

    public void setRelocate(Integer coder_id, String relocate) throws SQLException {
        putRecord(coder_id, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, relocate, null, null, null, null, null, null, null);
    }

    public String getRelocate(Integer coder_id) throws SQLException {
        CoderObject obj = null;
        String result;

        obj = getRecord(coder_id);
        if (obj == null)
            throw new EJBException("record not found");
        return (obj.relocate);
    }

    public void setModifyDate(Integer coder_id, Date modify_date) throws SQLException {
        putRecord(coder_id, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, modify_date, null, null, null, null, null, null);
    }

    public Date getModifyDate(Integer coder_id) throws SQLException {
        CoderObject obj = null;
        Date result;

        obj = getRecord(coder_id);
        if (obj == null)
            throw new EJBException("record not found");
        return (obj.modify_date);
    }

    public void setReferralId(Integer coder_id, Integer referral_id) throws SQLException {
        putRecord(coder_id, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, referral_id, null, null, null, null, null);
    }

    public Integer getReferralId(Integer coder_id) throws SQLException {
        CoderObject obj = null;
        Integer result;

        obj = getRecord(coder_id);
        if (obj == null)
            throw new EJBException("record not found");
        return (obj.referral_id);
    }

    public void setEditorId(Integer coder_id, Integer editor_id) throws SQLException {
        putRecord(coder_id, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, editor_id, null, null, null, null);
    }

    public Integer getEditorId(Integer coder_id) throws SQLException {
        CoderObject obj = null;
        Integer result;

        obj = getRecord(coder_id);
        if (obj == null)
            throw new EJBException("record not found");
        return (obj.editor_id);
    }

    public void setNotifyInquiry(Integer coder_id, String notify_inquiry) throws SQLException {
        putRecord(coder_id, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, notify_inquiry, null, null, null);
    }

    public String getNotifyInquiry(Integer coder_id) throws SQLException {
        CoderObject obj = null;
        String result;

        obj = getRecord(coder_id);
        if (obj == null)
            throw new EJBException("record not found");
        return (obj.notify_inquiry);
    }

    public void setReferralUserId(Integer coder_id, Integer referral_user_id) throws SQLException {
        putRecord(coder_id, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, referral_user_id, null, null);
    }

    public Integer getReferralUserId(Integer coder_id) throws SQLException {
        CoderObject obj = null;
        Integer result;

        obj = getRecord(coder_id);
        if (obj == null)
            throw new EJBException("record not found");
        return (obj.referral_user_id);
    }

    public void setLanguageId(Integer coder_id, Integer language_id) throws SQLException {
        putRecord(coder_id, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, language_id, null);
    }

    public Integer getLanguageId(Integer coder_id) throws SQLException {
        CoderObject obj = null;
        Integer result;

        obj = getRecord(coder_id);
        if (obj == null)
            throw new EJBException("record not found");
        return (obj.language_id);
    }

    public void setCoderTypeId(Integer coder_id, Integer coder_type_id) throws SQLException {
        putRecord(coder_id, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, coder_type_id);
    }

    public Integer getCoderTypeId(Integer coder_id) throws SQLException {
        CoderObject obj = null;
        Integer result;

        obj = getRecord(coder_id);
        if (obj == null)
            throw new EJBException("record not found");
        return (obj.coder_type_id);
    }

    private class CoderObjectWrapper {
        CoderObject obj;
        Date lastUsed;

        CoderObjectWrapper() {
            lastUsed = new Date(System.currentTimeMillis());
        }
    }

    private class RecordNotFoundException extends Exception {
    }

    private CoderObject getRecord(Integer coder_id) throws SQLException {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        String key = getKey(coder_id);
        CoderObject obj = null;
        CoderObjectWrapper wobj = (CoderObjectWrapper) cache.get(key);
        if (wobj != null) {
            wobj.lastUsed = new Date(System.currentTimeMillis());
            return (wobj.obj);
        }
        obj = new CoderObject();
        String query = "SELECT * FROM CODER WHERE CODER_ID = " + coder_id;
        InputStream is = null;

        try {
            conn = com.topcoder.shared.util.DBMS.getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            if (!rs.next())
                throw new RecordNotFoundException();
            obj.coder_id = new Integer(rs.getInt(1));
            if (rs.wasNull())
                obj.coder_id = null;
            obj.state_code = rs.getString(2);
            if (rs.wasNull())
                obj.state_code = null;
            obj.country_code = rs.getString(3);
            if (rs.wasNull())
                obj.country_code = null;
            obj.first_name = rs.getString(4);
            if (rs.wasNull())
                obj.first_name = null;
            obj.last_name = rs.getString(5);
            if (rs.wasNull())
                obj.last_name = null;
            obj.home_phone = rs.getString(6);
            if (rs.wasNull())
                obj.home_phone = null;
            obj.work_phone = rs.getString(7);
            if (rs.wasNull())
                obj.work_phone = null;
            obj.address1 = rs.getString(8);
            if (rs.wasNull())
                obj.address1 = null;
            obj.address2 = rs.getString(9);
            if (rs.wasNull())
                obj.address2 = null;
            obj.city = rs.getString(10);
            if (rs.wasNull())
                obj.city = null;
            obj.zip = rs.getString(11);
            if (rs.wasNull())
                obj.zip = null;
            obj.middle_name = rs.getString(12);
            if (rs.wasNull())
                obj.middle_name = null;
            obj.activation_code = rs.getString(13);
            if (rs.wasNull())
                obj.activation_code = null;
            obj.member_since = rs.getDate(14);
            if (rs.wasNull())
                obj.member_since = null;
            obj.notify = rs.getString(15);
            if (rs.wasNull())
                obj.notify = null;
            obj.quote = rs.getString(16);
            if (rs.wasNull())
                obj.quote = null;
            obj.employer_search = rs.getString(17);
            if (rs.wasNull())
                obj.employer_search = null;
            obj.relocate = rs.getString(18);
            if (rs.wasNull())
                obj.relocate = null;
            obj.modify_date = rs.getDate(19);
            if (rs.wasNull())
                obj.modify_date = null;
            obj.referral_id = new Integer(rs.getInt(20));
            if (rs.wasNull())
                obj.referral_id = null;
            obj.editor_id = new Integer(rs.getInt(21));
            if (rs.wasNull())
                obj.editor_id = null;
            obj.notify_inquiry = rs.getString(22);
            if (rs.wasNull())
                obj.notify_inquiry = null;
            obj.referral_user_id = new Integer(rs.getInt(23));
            if (rs.wasNull())
                obj.referral_user_id = null;
            obj.language_id = new Integer(rs.getInt(24));
            if (rs.wasNull())
                obj.language_id = null;
            obj.coder_type_id = new Integer(rs.getInt(25));
            if (rs.wasNull())
                obj.coder_type_id = null;
            rs.close();
        } catch (SQLException e) {
            try {
                if (ps != null) ps.close();
            } catch (Exception f) {
            }
            try {
                if (conn != null) conn.close();
            } catch (Exception f) {
            }
            throw(e);
        } catch (Exception e) {
            obj = null;
        }
        try {
            if (ps != null) ps.close();
        } catch (Exception f) {
        }
        try {
            if (conn != null) conn.close();
        } catch (Exception f) {
        }
        if (MAXSIZE < 0)
            MAXSIZE = getMaxCacheSize();
        if (MAXSIZE > 0) {
            wobj = new CoderObjectWrapper();
            wobj.obj = obj;
            if (cache.size() >= MAXSIZE)
                trimCache();
            cache.put(key, wobj);
        }
        return (obj);
    }

    public int putRecord(Integer coder_id, String state_code, String country_code, String first_name, String last_name, String home_phone, String work_phone, String address1, String address2, String city, String zip, String middle_name, String activation_code, Date member_since, String notify, String quote, String employer_search, String relocate, Date modify_date, Integer referral_id, Integer editor_id, String notify_inquiry, Integer referral_user_id, Integer language_id, Integer coder_type_id) throws SQLException {
        String identifier = getKey(coder_id);
        PreparedStatement ps = null;
        Connection conn = null;
        StringBuffer update = new StringBuffer();
        CoderObjectWrapper obj = null;
        int count = 0;

        obj = (CoderObjectWrapper) cache.get(getKey(coder_id));
        update.append("UPDATE CODER SET ");
        if (state_code != null) {
            if (obj != null)
                obj.obj.state_code = state_code;
            if (count > 0)
                update.append(", ");
            update.append("STATE_CODE = '" + state_code + "'");
            count++;
        }
        if (country_code != null) {
            if (obj != null)
                obj.obj.country_code = country_code;
            if (count > 0)
                update.append(", ");
            update.append("COUNTRY_CODE = '" + country_code + "'");
            count++;
        }
        if (first_name != null) {
            if (obj != null)
                obj.obj.first_name = first_name;
            if (count > 0)
                update.append(", ");
            update.append("FIRST_NAME = '" + first_name + "'");
            count++;
        }
        if (last_name != null) {
            if (obj != null)
                obj.obj.last_name = last_name;
            if (count > 0)
                update.append(", ");
            update.append("LAST_NAME = '" + last_name + "'");
            count++;
        }
        if (home_phone != null) {
            if (obj != null)
                obj.obj.home_phone = home_phone;
            if (count > 0)
                update.append(", ");
            update.append("HOME_PHONE = '" + home_phone + "'");
            count++;
        }
        if (work_phone != null) {
            if (obj != null)
                obj.obj.work_phone = work_phone;
            if (count > 0)
                update.append(", ");
            update.append("WORK_PHONE = '" + work_phone + "'");
            count++;
        }
        if (address1 != null) {
            if (obj != null)
                obj.obj.address1 = address1;
            if (count > 0)
                update.append(", ");
            update.append("ADDRESS1 = '" + address1 + "'");
            count++;
        }
        if (address2 != null) {
            if (obj != null)
                obj.obj.address2 = address2;
            if (count > 0)
                update.append(", ");
            update.append("ADDRESS2 = '" + address2 + "'");
            count++;
        }
        if (city != null) {
            if (obj != null)
                obj.obj.city = city;
            if (count > 0)
                update.append(", ");
            update.append("CITY = '" + city + "'");
            count++;
        }
        if (zip != null) {
            if (obj != null)
                obj.obj.zip = zip;
            if (count > 0)
                update.append(", ");
            update.append("ZIP = '" + zip + "'");
            count++;
        }
        if (middle_name != null) {
            if (obj != null)
                obj.obj.middle_name = middle_name;
            if (count > 0)
                update.append(", ");
            update.append("MIDDLE_NAME = '" + middle_name + "'");
            count++;
        }
        if (activation_code != null) {
            if (obj != null)
                obj.obj.activation_code = activation_code;
            if (count > 0)
                update.append(", ");
            update.append("ACTIVATION_CODE = '" + activation_code + "'");
            count++;
        }
        if (member_since != null) {
            if (obj != null)
                obj.obj.member_since = member_since;
            if (count > 0)
                update.append(", ");
            update.append("MEMBER_SINCE = '" + member_since + "'");
            count++;
        }
        if (notify != null) {
            if (obj != null)
                obj.obj.notify = notify;
            if (count > 0)
                update.append(", ");
            update.append("NOTIFY = '" + notify + "'");
            count++;
        }
        if (quote != null) {
            if (obj != null)
                obj.obj.quote = quote;
            if (count > 0)
                update.append(", ");
            update.append("QUOTE = '" + quote + "'");
            count++;
        }
        if (employer_search != null) {
            if (obj != null)
                obj.obj.employer_search = employer_search;
            if (count > 0)
                update.append(", ");
            update.append("EMPLOYER_SEARCH = '" + employer_search + "'");
            count++;
        }
        if (relocate != null) {
            if (obj != null)
                obj.obj.relocate = relocate;
            if (count > 0)
                update.append(", ");
            update.append("RELOCATE = '" + relocate + "'");
            count++;
        }
        if (modify_date != null) {
            if (obj != null)
                obj.obj.modify_date = modify_date;
            if (count > 0)
                update.append(", ");
            update.append("MODIFY_DATE = '" + modify_date + "'");
            count++;
        }
        if (referral_id != null) {
            if (obj != null)
                obj.obj.referral_id = referral_id;
            if (count > 0)
                update.append(", ");
            update.append("REFERRAL_ID = " + referral_id.intValue());
            count++;
        }
        if (editor_id != null) {
            if (obj != null)
                obj.obj.editor_id = editor_id;
            if (count > 0)
                update.append(", ");
            update.append("EDITOR_ID = " + editor_id.intValue());
            count++;
        }
        if (notify_inquiry != null) {
            if (obj != null)
                obj.obj.notify_inquiry = notify_inquiry;
            if (count > 0)
                update.append(", ");
            update.append("NOTIFY_INQUIRY = '" + notify_inquiry + "'");
            count++;
        }
        if (referral_user_id != null) {
            if (obj != null)
                obj.obj.referral_user_id = referral_user_id;
            if (count > 0)
                update.append(", ");
            update.append("REFERRAL_USER_ID = " + referral_user_id.intValue());
            count++;
        }
        if (language_id != null) {
            if (obj != null)
                obj.obj.language_id = language_id;
            if (count > 0)
                update.append(", ");
            update.append("LANGUAGE_ID = " + language_id.intValue());
            count++;
        }
        if (coder_type_id != null) {
            if (obj != null)
                obj.obj.coder_type_id = coder_type_id;
            if (count > 0)
                update.append(", ");
            update.append("CODER_TYPE_ID = " + coder_type_id.intValue());
            count++;
        }
        update.append(" WHERE CODER_ID = " + coder_id);
        if (count == 0)
            return (0);
        int rc = 0;
        try {
            conn = com.topcoder.shared.util.DBMS.getConnection();
            ps = conn.prepareStatement(update.toString());
            int index = 1;
            rc = ps.executeUpdate();
        } catch (SQLException e) {
            try {
                if (ps != null) ps.close();
            } catch (Exception f) {
            }
            try {
                if (conn != null) conn.close();
            } catch (Exception f) {
            }
            throw(e);
        } catch (Exception e) {
        }
        try {
            if (ps != null) ps.close();
        } catch (Exception f) {
        }
        try {
            if (conn != null) conn.close();
        } catch (Exception f) {
        }
        return (rc);
    }

    private void trimCache() {
        CoderObjectWrapper oldest = null;
        CoderObjectWrapper current = null;
        Enumeration e;

        e = cache.elements();
        while (e.hasMoreElements()) {
            current = (CoderObjectWrapper) e.nextElement();
            if (oldest == null)
                oldest = current;
            else {
                if (current.lastUsed.compareTo(oldest.lastUsed) < 0)
                    oldest = current;
            }
        }
        cache.remove(getKey(oldest.obj));
    }

    public static void clearCache() {
        cache.clear();
    }

    private int getMaxCacheSize() {
        try {
            InitialContext ctx = new InitialContext();
            Integer val = (Integer) ctx.lookup("java:comp/env/MaxCacheSize");
            return (val.intValue());
        } catch (NamingException e) {
            throw new EJBException(e);
        }
    }

    public void ejbCreate() {
    }

    public void ejbRemove() {
    }

    public void setSessionContext(SessionContext context) {
        this.context = context;
    }

    public void ejbActivate() {
    }

    public void ejbPassivate() {
    }
}
