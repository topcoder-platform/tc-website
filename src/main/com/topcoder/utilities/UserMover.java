package com.topcoder.utilities;

import com.topcoder.shared.util.logging.Logger;
import com.topcoder.shared.util.TCContext;
import com.topcoder.shared.util.ApplicationServer;
import com.topcoder.shared.util.DBMS;
import com.topcoder.web.ejb.user.UserHome;
import com.topcoder.web.ejb.user.UserAddress;
import com.topcoder.web.ejb.user.UserAddressHome;
import com.topcoder.web.ejb.user.User;
import com.topcoder.web.ejb.email.Email;
import com.topcoder.web.ejb.email.EmailHome;
import com.topcoder.web.ejb.address.Address;
import com.topcoder.web.ejb.address.AddressHome;
import com.topcoder.web.ejb.phone.Phone;
import com.topcoder.web.ejb.phone.PhoneHome;
import com.topcoder.security.admin.PrincipalMgrRemoteHome;
import com.topcoder.security.admin.PrincipalMgrRemote;
import com.topcoder.security.TCSubject;
import com.topcoder.security.UserPrincipal;
import com.topcoder.security.GroupPrincipal;

import javax.naming.Context;
import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Iterator;
import java.util.Collection;

public class UserMover {
    private static Logger log = Logger.getLogger(UserMover.class);

    private static final String SOURCE_DS = "OLTP";

    public static void main(String args[]) {
        UserMover um = new UserMover();
        try {
            Context ctx = TCContext.getInitial();
            long begin = System.currentTimeMillis();
            int count = um.getUsers(ctx);
            long end = System.currentTimeMillis();
            log.debug("all done, " + count + " moved in " + (double) ((end - begin) / 1000) + " seconds");
        } catch (Exception e) {
            e.printStackTrace();
        }


    }

    private int getUsers(Context ctx) throws Exception {

        DataSource ds = (DataSource) ctx.lookup(SOURCE_DS);
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = ds.getConnection();
            StringBuffer query = new StringBuffer();
            query.append(" select u.user_id");
            query.append(" , u.handle");
            query.append(" , u.status");
            query.append(" , u.email");
            query.append(" , c.state_code");
            query.append(" , c.country_code");
            query.append(" , c.first_name");
            query.append(" , c.last_name");
            query.append(" , c.home_phone");
            query.append(" , c.address1");
            query.append(" , c.address2");
            query.append(" , c.city");
            query.append(" , c.zip");
            query.append(" , CASE WHEN u.status='A' THEN 1 ELSE 0 END as status_order");
            query.append(" from user u");
            query.append(" , coder c");
            query.append(" where u.user_id = c.coder_id");
            query.append("   AND u.user_id between 301 and 310");
            query.append(" order by status_order desc");

            log.info("built query");
            ps = conn.prepareStatement(query.toString());
            rs = ps.executeQuery();
            log.info("executed query");
            String handle = null;
            long userId = 0;


            User userEJB = ((UserHome) ctx.lookup(UserHome.EJB_REF_NAME)).create();
            Email emailEJB = ((EmailHome) ctx.lookup(EmailHome.EJB_REF_NAME)).create();
            Address addressEJB = ((AddressHome) ctx.lookup(AddressHome.EJB_REF_NAME)).create();
            Phone phoneEJB = ((PhoneHome) ctx.lookup(PhoneHome.EJB_REF_NAME)).create();
            UserAddress userAddressEJB = ((UserAddressHome) ctx.lookup(UserAddressHome.EJB_REF_NAME)).create();
            Context context = TCContext.getContext(ApplicationServer.SECURITY_CONTEXT_FACTORY, ApplicationServer.SECURITY_PROVIDER_URL);

            log.info("created ejbs");

            PrincipalMgrRemoteHome pmrh = (PrincipalMgrRemoteHome) context.lookup(PrincipalMgrRemoteHome.EJB_REF_NAME);
            PrincipalMgrRemote pmr = pmrh.create();
            TCSubject tcs = new TCSubject(132456);
            Collection groups = pmr.getGroups(tcs);
            GroupPrincipal anonGroup = null;
            GroupPrincipal userGroup = null;
            for (Iterator iterator = groups.iterator(); iterator.hasNext();) {
                anonGroup = (GroupPrincipal) iterator.next();
                if (anonGroup.getName().equals("Anonymous")) {
                    break;
                }
            }
            for (Iterator iterator = groups.iterator(); iterator.hasNext();) {
                userGroup = (GroupPrincipal) iterator.next();
                if (userGroup.getName().equals("Users")) {
                    break;
                }
            }

            log.info("created ejbs");

            int count = 0;
            String firstName = null;
            String lastName = null;
            String email = null;
            String address1 = null;
            String address2 = null;
            String city = null;
            String state = null;
            String country = null;
            String zip = null;
            String phone = null;
            while (rs.next()) {

                try {
                    userId = rs.getLong(1);
                    handle = rs.getString(2);
                    char status = rs.getString(3).charAt(0);
                    firstName = rs.getString(7);
                    lastName = rs.getString(8);
                    email = rs.getString(4);
                    address1 = rs.getString(10);
                    address2 = rs.getString(11);
                    city = rs.getString(12);
                    state = rs.getString(5);
                    country = rs.getString(6);
                    zip = rs.getString(13);
                    phone = rs.getString(9);

                    try {
                        userEJB.createUser(userId, handle, status, DBMS.JTS_OLTP_DATASOURCE_NAME);
                        userEJB.setFirstName(userId, firstName, DBMS.JTS_OLTP_DATASOURCE_NAME);
                        userEJB.setLastName(userId, lastName, DBMS.JTS_OLTP_DATASOURCE_NAME);
                    } catch (Exception e) {
                        log.error("error moving over user " + handle + "(" + userId + ")");
                        e.printStackTrace();
                    }

                    try {
                        long emailId = emailEJB.createEmail(userId, DBMS.COMMON_JTS_OLTP_DATASOURCE_NAME, DBMS.COMMON_OLTP_DATASOURCE_NAME);
                        emailEJB.setAddress(emailId, email, DBMS.COMMON_JTS_OLTP_DATASOURCE_NAME);
                        emailEJB.setPrimaryEmailId(userId, emailId, DBMS.COMMON_JTS_OLTP_DATASOURCE_NAME);
                        emailEJB.setEmailTypeId(emailId, 1, DBMS.COMMON_JTS_OLTP_DATASOURCE_NAME);
                    } catch (Exception e) {
                        log.error("error moving over email for " + handle + "(" + userId + ")");
                        e.printStackTrace();
                    }

                    long addressId = 0;
                    try {
                        addressId = addressEJB.createAddress(DBMS.COMMON_JTS_OLTP_DATASOURCE_NAME, DBMS.COMMON_OLTP_DATASOURCE_NAME);
                        addressEJB.setAddress1(addressId, address1, DBMS.COMMON_JTS_OLTP_DATASOURCE_NAME);
                        addressEJB.setAddress2(addressId, address2, DBMS.COMMON_JTS_OLTP_DATASOURCE_NAME);
                        addressEJB.setCity(addressId, city, DBMS.COMMON_JTS_OLTP_DATASOURCE_NAME);
                        addressEJB.setStateCode(addressId, state, DBMS.COMMON_JTS_OLTP_DATASOURCE_NAME);
                        addressEJB.setCountryCode(addressId, country, DBMS.COMMON_JTS_OLTP_DATASOURCE_NAME);
                        addressEJB.setZip(addressId, zip, DBMS.COMMON_JTS_OLTP_DATASOURCE_NAME);
                        addressEJB.setAddressTypeId(addressId, 2, DBMS.COMMON_JTS_OLTP_DATASOURCE_NAME);
                    } catch (Exception e) {
                        log.error("error moving over address for " + handle + "(" + userId + ")");
                        e.printStackTrace();
                    }

                    try {
                        userAddressEJB.createUserAddress(userId, addressId, DBMS.JTS_OLTP_DATASOURCE_NAME);
                    } catch (Exception e) {
                        log.error("error moving over user address for " + handle + "(" + userId + ")");
                        e.printStackTrace();
                    }

                    try {
                        long phoneId = phoneEJB.createPhone(userId, DBMS.COMMON_JTS_OLTP_DATASOURCE_NAME, DBMS.COMMON_OLTP_DATASOURCE_NAME);
                        phoneEJB.setNumber(phoneId, phone, DBMS.COMMON_JTS_OLTP_DATASOURCE_NAME);
                        phoneEJB.setPrimaryPhoneId(userId, phoneId, DBMS.COMMON_JTS_OLTP_DATASOURCE_NAME);
                        phoneEJB.setPhoneTypeId(phoneId, 2, DBMS.COMMON_JTS_OLTP_DATASOURCE_NAME);
                    } catch (Exception e) {
                        log.error("error moving over phone for " + handle + "(" + userId + ")");
                        e.printStackTrace();
                    }

                    UserPrincipal up = pmr.getUser(userId);
                    try {
                        pmr.addUserToGroup(anonGroup, up, tcs);
                    } catch (Exception e) {
                        log.error("error adding to anonymous group " + handle + "(" + userId + ")");
                        e.printStackTrace();
                    }
                    try {
                        pmr.addUserToGroup(userGroup, up, tcs);
                    } catch (Exception e) {
                        log.error("error adding to anonymous group " + handle + "(" + userId + ")");
                        e.printStackTrace();
                    }

                } catch (Exception e) {
                    log.error("error moving over " + handle + "(" + userId + ")");
                    e.printStackTrace();
                }

                count++;
                if (count % 100 == 0) log.info("" + count + " users processed");
                if (count % 100 == 0) System.gc();
            }


            return count;

        } catch (SQLException e) {
            throw e;
        } finally {
            try {
                if (rs != null) rs.close();
            } catch (Exception ignore) {
                log.error("rs   close problem");
            }
            try {
                if (ps != null) ps.close();
            } catch (Exception ignore) {
                log.error("ps   close problem");
            }
            try {
                if (conn != null) conn.close();
            } catch (Exception ignore) {
                log.error("conn close problem");
            }
            rs = null;
            ps = null;
            conn = null;
        }
    }
}
