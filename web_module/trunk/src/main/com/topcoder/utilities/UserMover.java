package com.topcoder.utilities;

import com.topcoder.shared.util.logging.Logger;
import com.topcoder.shared.util.TCContext;
import com.topcoder.shared.util.ApplicationServer;
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
            log.debug("all done, " + count + " moved in " + (double)((end-begin)/1000) + " seconds");
        } catch (Exception e) {
            e.printStackTrace();
        }


    }

    private int getUsers(Context ctx) throws Exception {

        DataSource ds = (DataSource)ctx.lookup(SOURCE_DS);
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = ds.getConnection();
            StringBuffer query = new StringBuffer();
            query.append("select u.user_id");
            query.append(     ", u.handle");
            query.append(     ", u.status");
            query.append(     ", u.email");
            query.append(     ", c.state_code");
            query.append(     ", c.country_code");
            query.append(     ", c.first_name");
            query.append(     ", c.last_name");
            query.append(     ", c.home_phone");
            query.append(     ", c.address1");
            query.append(     ", c.address2");
            query.append(     ", c.city");
            query.append(     ", c.zip");
            query.append(     ", CASE WHEN u.status='A' THEN 1 ELSE 0 END as status_order");
            query.append( " from user u");
            query.append(     ", coder c");
            query.append(" where u.user_id = c.coder_id");
            //query.append(  " and u.user_id = 114443");
            query.append(" order by status_order desc");

            ps = conn.prepareStatement(query.toString());
            rs = ps.executeQuery();
            String handle = null;


            User userEJB = ((UserHome) ctx.lookup("main:" + UserHome.EJB_REF_NAME)).create();
            Email emailEJB = ((EmailHome) ctx.lookup("main:" + EmailHome.EJB_REF_NAME)).create();
            Address addressEJB = ((AddressHome) ctx.lookup(AddressHome.EJB_REF_NAME)).create();
            Phone phoneEJB = ((PhoneHome) ctx.lookup(PhoneHome.EJB_REF_NAME)).create();
            UserAddress userAddressEJB = ((UserAddressHome) ctx.lookup("main:" + UserAddressHome.EJB_REF_NAME)).create();
            Context context = TCContext.getContext(ApplicationServer.SECURITY_CONTEXT_FACTORY, ApplicationServer.SECURITY_PROVIDER_URL);

            PrincipalMgrRemoteHome pmrh = (PrincipalMgrRemoteHome)context.lookup(PrincipalMgrRemoteHome.EJB_REF_NAME);
            PrincipalMgrRemote pmr = pmrh.create();

            int count = 0;
            while (rs.next()) {

                long userId = rs.getLong(1);
                handle = rs.getString(2);
                char status = rs.getString(3).charAt(0);
                String firstName = rs.getString(7);
                String lastName = rs.getString(8);
                String email = rs.getString(4);
                String address1 = rs.getString(10);
                String address2 = rs.getString(11);
                String city = rs.getString(12);
                String state = rs.getString(5);
                String country = rs.getString(6);
                String zip = rs.getString(13);
                String phone = rs.getString(9);


                userEJB.createUser(userId, handle, status);
                userEJB.setFirstName(userId, firstName);
                userEJB.setLastName(userId, lastName);

                long emailId = emailEJB.createEmail(userId);
                emailEJB.setAddress(emailId, email);
                emailEJB.setPrimaryEmailId(userId, emailId);
                emailEJB.setEmailTypeId(emailId, 1);

                long addressId = addressEJB.createAddress();
                addressEJB.setAddress1(addressId, address1);
                addressEJB.setAddress2(addressId, address2);
                addressEJB.setCity(addressId, city);
                addressEJB.setStateCode(addressId, state);
                addressEJB.setCountryCode(addressId, country);
                addressEJB.setZip(addressId, zip);
                addressEJB.setAddressTypeId(addressId, 2);

                userAddressEJB.createUserAddress(userId, addressId);

                long phoneId = phoneEJB.createPhone(userId);
                phoneEJB.setNumber(phoneId, phone);
                phoneEJB.setPrimaryPhoneId(userId, phoneId);
                phoneEJB.setPhoneTypeId(phoneId, 2);

                UserPrincipal up = pmr.getUser(userId);
                TCSubject tcs = new TCSubject(132456);
                Collection groups = pmr.getGroups(tcs);
                for (Iterator iterator = groups.iterator(); iterator.hasNext();) {
                    GroupPrincipal gp = (GroupPrincipal) iterator.next();
                    if (gp.getName().equals("Anonymous")) {
                        pmr.addUserToGroup(gp, up, tcs);
                    }
                }

                count++;
                if(count%100==0) log.info(""+count+" users processed");
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
