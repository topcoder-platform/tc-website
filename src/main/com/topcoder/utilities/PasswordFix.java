package com.topcoder.utilities;

import com.topcoder.shared.util.logging.Logger;
import com.topcoder.shared.util.TCContext;
import com.topcoder.shared.util.ApplicationServer;
import com.topcoder.web.ejb.password.PasswordRemoteHome;
import com.topcoder.web.ejb.password.PasswordRemote;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

public class PasswordFix {

        private static Logger log = Logger.getLogger(PasswordFix.class);

        private static final String SOURCE_DS = "OLTP";

        public static void main(String args[]) {
            PasswordFix um = new PasswordFix();
            try {
                log.debug("first");
                log.debug("first");
                long begin = System.currentTimeMillis();
                log.debug("first");
                int count = um.getUsers();
                log.debug("first");
                long end = System.currentTimeMillis();
                log.debug("all done, " + count + " moved in " + (double) ((end - begin) / 1000) + " seconds");
            } catch (Exception e) {
                e.printStackTrace();
            }


        }

        private int getUsers() throws Exception {


            log.debug("next");
            InitialContext ctx = TCContext.getInitial();
            log.debug("next");
            DataSource ds = (DataSource) ctx.lookup(SOURCE_DS);
            Connection conn = null;
            PreparedStatement ps = null;
            ResultSet rs = null;
            try {
                conn = ds.getConnection();
                StringBuffer query = new StringBuffer();
                query.append("select u.user_id, u.password");
                query.append("  from user u");
                query.append("     , security_user su");
                query.append(" where u.user_id = su.login_id");
                query.append("   and u.password = su.password");

                log.info("built query");
                ps = conn.prepareStatement(query.toString());
                rs = ps.executeQuery();
                log.info("executed query");

                Context context = TCContext.getContext(ApplicationServer.SECURITY_CONTEXT_FACTORY, ApplicationServer.SECURITY_PROVIDER_URL);

                PasswordRemoteHome passHome = (PasswordRemoteHome) context.lookup(PasswordRemoteHome.EJB_REF_NAME);
                PasswordRemote pass = passHome.create();

                HashMap hash = new HashMap();
                while (rs.next()) {
                    hash.put(new Long(rs.getLong("user_id")), pass.encodePassword(rs.getString("password")));
                }

                PreparedStatement ps2 = null;
                StringBuffer query2 = new StringBuffer();
                query2.append(" UPDATE security_user");
                query2.append(   " SET password = ?");
                query2.append( " WHERE login_id = ?");
                ps2 = conn.prepareStatement(query2.toString());

                long id;
                String encPass = null;
                Map.Entry entry = null;
                for (Iterator it = hash.entrySet().iterator(); it.hasNext();) {
                    entry = (Map.Entry)it.next();
                    encPass = (String)entry.getValue();
                    id = ((Long)entry.getKey()).longValue();
                    log.info("setting user: " + id + " to " + encPass);
                    ps2.setString(1, encPass);
                    ps2.setLong(2, id);
                    ps2.executeUpdate();
                }


                return 0;

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






