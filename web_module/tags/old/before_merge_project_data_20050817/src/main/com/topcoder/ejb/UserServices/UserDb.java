package com.topcoder.ejb.UserServices;

import com.topcoder.common.web.data.*;
import com.topcoder.common.web.error.TCException;
import com.topcoder.shared.util.ApplicationServer;
import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.TCContext;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.ejb.email.Email;
import com.topcoder.web.ejb.email.EmailHome;
import com.topcoder.web.ejb.password.PasswordRemote;
import com.topcoder.web.ejb.password.PasswordRemoteHome;
import com.topcoder.web.ejb.user.UserHome;

import javax.naming.Context;
import javax.naming.InitialContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;


final class UserDb {
    private static Logger log = Logger.getLogger(UserDb.class);

    private static final long DEFAULT_EMAIL_TYPE_ID = 1;

    static void insertUser(User user) throws TCException {
        log.debug("ejb.User.UserDb:insertUser():called...");
        Connection conn = null;
        PreparedStatement ps = null;
        PreparedStatement ps1 = null;
        /**************************************************************/
        StringBuffer query = new StringBuffer(200);
        /**************************************************************/
        /***********************Informix*******************************/
        /**************************************************************/
        query.append(" INSERT");
        query.append(" INTO");
        query.append(" user (");
        query.append(" user_id");
        query.append(" ,handle");
        query.append(" ,password");
        query.append(" ,status");
        query.append(" ,logged_in");
        query.append(" ,email");
        query.append(" ,user_type_id");
        query.append(" ,terms");
        query.append(" )");
        query.append(" VALUES (?,?,?,?,?,?,?,?)");
        try {
            conn = DBMS.getTransConnection();
            insertSecureObject(conn, user);
            ps = conn.prepareStatement(query.toString());
            ps.setInt(1, user.getUserId());
            ps.setString(2, user.getHandle());
            ps.setString(3, user.getPassword());
            ps.setString(4, user.getStatus());
            ps.setString(5, user.getLoggedIn());
            ps.setString(6, user.getEmail());
            ps.setInt(7, user.getDefaultUserType().getUserTypeId());
            ps.setString(8, user.getTerms());
            int regVal = ps.executeUpdate();
            if (regVal != 1) {
                throw new TCException("ejb.User.UserDb:insertUser():failed:\n");
            }
            user.setModified("S");
            if (user.getGroups().size() > 0) {
                insertGroupUsers(conn, user);
            }


            /* make insert into common database containing this information.  this will
               allow other applications to use our login/password for authentication.
               have to do manual insert because you can't force the id in the common db
               through the security component.
             */

            String password = null;
            try {
                password = encodePassword(user.getPassword());
            } catch (Exception e) {
                e.printStackTrace();
                password = "encrypt failed";
            }

            log.debug("adding " + user.getHandle() + "(" + user.getUserId() + ")");
            query = new StringBuffer(100);
            query.append(" INSERT INTO security_user");
            query.append(" (login_id, user_id, password)");
            query.append(" VALUES (?, ?, ?)");
            ps1 = conn.prepareStatement(query.toString());
            ps1.setLong(1, user.getUserId());
            ps1.setString(2, user.getHandle());
            ps1.setString(3, password);
            regVal = ps1.executeUpdate();
            if (regVal != 1) {
                log.error("insertUser():did not insert  security user record");
            }


            HashMap userTypeDetails = user.getUserTypeDetails();
            if (userTypeDetails.containsKey("Coder")) {
                CoderRegistration coder = (CoderRegistration) userTypeDetails.get("Coder");
                coder.setCoderId(user.getUserId());

                /* make inserts for common db */
                InitialContext ctx = new InitialContext();
                com.topcoder.web.ejb.user.User userEJB = ((UserHome) ctx.lookup(UserHome.EJB_REF_NAME)).create();
                Email emailEJB = ((EmailHome) ctx.lookup(EmailHome.EJB_REF_NAME)).create();
                userEJB.createUser(user.getUserId(), user.getHandle(), user.getStatus().charAt(0), DBMS.COMMON_OLTP_DATASOURCE_NAME);
                userEJB.setFirstName(user.getUserId(), coder.getFirstName(), DBMS.COMMON_OLTP_DATASOURCE_NAME);
                userEJB.setLastName(user.getUserId(), coder.getLastName(), DBMS.COMMON_OLTP_DATASOURCE_NAME);

                long emailId = emailEJB.createEmail(coder.getCoderId(), DBMS.COMMON_OLTP_DATASOURCE_NAME, DBMS.COMMON_OLTP_DATASOURCE_NAME);
                emailEJB.setAddress(emailId, user.getEmail(), DBMS.COMMON_OLTP_DATASOURCE_NAME);
                emailEJB.setPrimaryEmailId(user.getUserId(), emailId, DBMS.COMMON_OLTP_DATASOURCE_NAME);
                emailEJB.setEmailTypeId(emailId, DEFAULT_EMAIL_TYPE_ID, DBMS.COMMON_OLTP_DATASOURCE_NAME);
                emailEJB.setStatusId(emailId, 2, DBMS.COMMON_OLTP_DATASOURCE_NAME);


                UserDbCoder.insertCoder(conn, coder);

                coder.setAllModifiedStable();
            }

        } catch (SQLException sqe) {
            DBMS.printSqlException(true, sqe);
            throw new TCException("ejb.User.UserDb.insertUser: ERROR \n " + sqe.getMessage());
        } catch (Exception ex) {
            ex.printStackTrace();
            throw new TCException("ejb.User.UserDb:insertUser():failed:\n" + ex);
        } finally {
            if (ps != null) {
                try {
                    ps.close();
                } catch (Exception ignore) {
                }
            }
            if (ps1 != null) {
                try {
                    ps1.close();
                } catch (Exception ignore) {
                }
            }
            if (conn != null) {
                try {
                    conn.close();
                    log.debug("insertCoder cx closed...");
                } catch (Exception ignore) {
                    log.error("insertCoder cx NOT closed...");
                }
            }
        }
    }


    static void updateUser(User user) throws TCException {
        log.debug("ejb.User.UserDb:updateUser():called...");
        PreparedStatement ps = null;
        PreparedStatement ps1 = null;
        Connection conn = null;
        try {
            conn = DBMS.getTransConnection();
            if (user.getModified().equals("U")) {
                StringBuffer query = new StringBuffer(150);
                /**************************************************************/
                /***********************Informix*******************************/
                /**************************************************************/
                query.append(" UPDATE");
                query.append(" user");
                query.append(" SET");
                query.append(" handle=?");
                query.append(" ,password=?");
                query.append(" ,status=?");
                query.append(" ,email=?");
                query.append(" ,logged_in=?");
                query.append(" ,terms=?");
                query.append(" WHERE");
                query.append(" user_id=?");
                ps = conn.prepareStatement(query.toString());
                ps.setString(1, user.getHandle());
                ps.setString(2, user.getPassword());
                ps.setString(3, user.getStatus());
                ps.setString(4, user.getEmail());
                ps.setString(5, user.getLoggedIn());
                ps.setString(6, user.getTerms());
                ps.setInt(7, user.getUserId());
                int regVal = ps.executeUpdate();
                if (regVal != 1) {
                    throw new TCException("ejb.User.UserDb:updateUser():did not update record:\n");
                }

                /* update their user name manually, cuz security user doesn't allow it */
                String password = null;
                try {
                    password = encodePassword(user.getPassword());
                } catch (Exception e) {
                    e.printStackTrace();
                }

                query = new StringBuffer(100);
                query.append(" UPDATE security_user");
                query.append(" SET user_id = ?");
                if (password != null)
                    query.append("  , password = ?");
                query.append(" WHERE login_id = ?");
                ps1 = conn.prepareStatement(query.toString());
                ps1.setString(1, user.getHandle());
                if (password != null)
                    ps1.setString(2, password);
                ps1.setLong(password != null ? 3 : 2, user.getUserId());
                regVal = ps1.executeUpdate();
                if (regVal != 1) {
                    log.error("updateUser():did not update security user record:\n");
                }
                user.setModified("S");
            }
            updateDefaultUserType(conn, user);
            updateGroupUsers(conn, user);
            HashMap userTypeDetails = user.getUserTypeDetails();
            if (userTypeDetails.containsKey("Coder")) {
                CoderRegistration coder = (CoderRegistration) userTypeDetails.get("Coder");
                UserDbCoder.updateCoder(conn, coder);

                InitialContext ctx = new InitialContext();
                com.topcoder.web.ejb.user.User userEJB = ((UserHome) ctx.lookup(UserHome.EJB_REF_NAME)).create();
                Email emailEJB = ((EmailHome) ctx.lookup(EmailHome.EJB_REF_NAME)).create();
                userEJB.setFirstName(user.getUserId(), coder.getFirstName(), DBMS.COMMON_OLTP_DATASOURCE_NAME);
                userEJB.setLastName(user.getUserId(), coder.getLastName(), DBMS.COMMON_OLTP_DATASOURCE_NAME);
                userEJB.setStatus(user.getUserId(), user.getStatus().charAt(0), DBMS.COMMON_OLTP_DATASOURCE_NAME);

                long emailId = emailEJB.getPrimaryEmailId(coder.getCoderId(), DBMS.COMMON_OLTP_DATASOURCE_NAME);
                emailEJB.setAddress(emailId, user.getEmail(), DBMS.COMMON_OLTP_DATASOURCE_NAME);

                coder.setAllModifiedStable();
            }


        } catch (Exception ex) {
            ex.printStackTrace();
            throw new TCException("ejb.User.UserDb:updateUser():failed:" + ex.getMessage());
        } finally {
            if (ps != null) {
                try {
                    ps.close();
                } catch (Exception ignore) {
                }
            }
            if (ps1 != null) {
                try {
                    ps1.close();
                } catch (Exception ignore) {
                }
            }
            if (conn != null) {
                try {
                    conn.close();
                    log.debug("updateCoder cx closed...");
                } catch (Exception ignore) {
                    log.error("updateCoder cx NOT closed...");
                }
            }
        }
    }


    static void loadUser(User user) throws TCException {
        log.debug("ejb.User.UserDb:loadUser()called...");
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        StringBuffer query = new StringBuffer(250);
        /**************************************************************/
        /***********************Informix*******************************/
        /**************************************************************/
        query.append(" SELECT");
        query.append(" s.secure_object_type");
        query.append(" ,u.handle");
        query.append(" ,u.password");
        query.append(" ,u.email");
        query.append(" ,u.status");
        query.append(" ,u.logged_in");
        query.append(" ,u.user_type_id");
        query.append(" ,t.user_type_desc");
        query.append(" ,u.terms");
        query.append(" FROM");
        query.append(" secure_object s");
        query.append(" ,user u");
        query.append(" ,user_type t");
        query.append(" WHERE");
        query.append(" secure_object_id = ?");
        query.append(" AND s.secure_object_id = u.user_id");
        query.append(" AND u.user_type_id = t.user_type_id");
        /**************************************************************/
        try {
            conn = DBMS.getConnection();
            ps = conn.prepareStatement(query.toString());
            log.debug("EJB CODER ID=" + user.getUserId());
            ps.setInt(1, user.getUserId());
            rs = ps.executeQuery();
            if (rs.next()) {
                UserType userType = user.getDefaultUserType();
                user.setHandle(rs.getString(2));
                user.setPassword(rs.getString(3));
                user.setEmail(rs.getString(4));
                user.setStatus(rs.getString(5));
                user.setLoggedIn(rs.getString(6));
                user.setModified("S");
                userType.setUserTypeId(rs.getInt(7));
                userType.setUserTypeDesc(rs.getString(8));
                user.setTerms(rs.getString(9));
                userType.setModified("S");
                user.setUserTypeDetails(new HashMap(4));
                loadGroupUsers(conn, user);
                // if they have the coder user type, load their coder info
                if (userType.getUserTypeId() == 1) {
                    UserDbCoder.loadCoder(conn, user);
                }
            } else {
                throw new TCException("ejb.User.UserDb:loadUser():empty resultset:\n");
            }
        } catch (Exception ex) {
            ex.printStackTrace();
            throw new TCException("ejb.User.UserDb:loadUser():failed:\n" + ex);
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (Exception ignore) {
                }
            }
            if (ps != null) {
                try {
                    ps.close();
                } catch (Exception ignore) {
                }
            }
            if (conn != null) {
                try {
                    conn.close();
                    log.debug("loadeCoder cx closed...");
                } catch (Exception ignore) {
                    log.error("loadCoder cx NOT closed...");
                }
            }
        }
    }


    static void inactivateUser(int userId) throws TCException {
        log.debug("ejb.User.UserDb:inactivateUser() called ...");
        Connection conn = null;
        PreparedStatement ps = null;
        /**************************************************************/
        /***********************Informix*******************************/
        /**************************************************************/
        String query = "UPDATE user SET status='I' WHERE user_id=?";
        try {
            conn = DBMS.getTransConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, userId);
            int regVal = ps.executeUpdate();
            if (regVal != 1) {
                throw new TCException("ejb.User.UserDb:inactivateUser:" + userId + ":failed to update:\n");
            }
        } catch (Exception ex) {
            throw new TCException("ejb.User.UserDb:inactivateUser:" + userId + ":failed:\n" + ex);
        } finally {
            try {
                if (ps != null) ps.close();
            } catch (Exception ignore) {
            }
            try {
                if (conn != null) conn.close();
            } catch (Exception ignore) {
            }
        }
    }


    static Integer getExistingUserId(Integer key) throws TCException {
        log.debug("ejb.User.UserDb:getExistingUserId():called...");
        ResultSet rs = null;
        PreparedStatement ps = null;
        Connection conn = null;
        String query = null;
        query = "SELECT user_id FROM user WHERE user_id=?";
        try {
            conn = DBMS.getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, key.intValue());
            rs = ps.executeQuery();
            if (!rs.next()) {
                throw new TCException("ejb.User.UserDb:getExistingUserId:" + key.intValue() + ":failed:\n");
            }
        } catch (Exception ex) {
            throw new TCException("ejb.User.UserDb:getExistingUserId:failed:\n" + ex);
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (Exception ignore) {
                }
            }
            if (ps != null) {
                try {
                    ps.close();
                } catch (Exception ignore) {
                }
            }
            if (conn != null) {
                try {
                    conn.close();
                    log.debug("getExistingUserId cx closed...");
                } catch (Exception ignore) {
                    log.error("getExistingUserId cx NOT closed...");
                }
            }
        }
        return key;
    }




//
// PRIVATE METHODS
//


    private static void loadGroupUsers(Connection conn, User user)
            throws TCException {
        log.debug("ejb.User.UserDb:loadGroupUsers() called ...");
        PreparedStatement ps = null;
        ResultSet rs = null;
        StringBuffer query = new StringBuffer(150);
        /**************************************************************/
        /***********************Informix*******************************/
        /**************************************************************/
        query.append(" SELECT");
        query.append(" g.group_id");
        query.append(" ,g.group_desc");
        query.append(" FROM");
        query.append(" group_user u");
        query.append(" ,group g");
        query.append(" WHERE");
        query.append(" u.user_id = ?");
        query.append(" AND u.group_id = g.group_id");
        /**************************************************************/
        try {
            ps = conn.prepareStatement(query.toString());
            ps.setInt(1, user.getUserId());
            rs = ps.executeQuery();
            ArrayList groupUsers = new ArrayList();
            while (rs.next()) {
                GroupUser groupUser = new GroupUser();
                groupUser.setUserId(user.getUserId());
                Group group = groupUser.getGroup();
                group.setGroupId(rs.getInt(1));
                group.setGroupDesc(rs.getString(2));
                group.setModified("S");
                groupUser.setModified("S");
                groupUsers.add(groupUser);
            }
            user.setGroups(groupUsers);
        } catch (Exception ex) {
            throw new TCException("ejb.User.UserDb:loadGroupUsers():" +
                    user.getUserId() + "failed:\n" + ex);
        } finally {
            try {
                if (rs != null) rs.close();
            } catch (Exception ignore) {
            }
            try {
                if (ps != null) ps.close();
            } catch (Exception ignore) {
            }
        }
    }


    private static void insertSecureObject(Connection conn, User user)
            throws TCException {
        log.debug("ejb.User.UserDb:insertSecureObject() called ...");
        PreparedStatement ps = null;
        /**************************************************************/
        /***********************Informix*******************************/
        /**************************************************************/
        String query = "INSERT INTO secure_object ( secure_object_id) VALUES (?)";
        /**************************************************************/
        try {
            user.setUserId(DBMS.getTransSeqId(conn, DBMS.JMA_SEQ));
            ps = conn.prepareStatement(query);
            ps.setInt(1, user.getUserId());
            ps.executeUpdate();
        } catch (Exception ex) {
            throw new TCException(
                    "ejb.User.UserDb:insertSecureObject():failed:\n" + ex
            );
        } finally {
            if (ps != null) {
                try {
                    ps.close();
                } catch (Exception ignore) {
                }
            }
        }
    }


    private static void insertGroupUsers(Connection conn, User user)
            throws TCException {
        log.debug("ejb.User.UserDb:insertGroupUsers() called ...");
        try {
            ArrayList groups = user.getGroups();
            for (int i = 0; i < groups.size(); i++) {
                GroupUser groupUser = (GroupUser) groups.get(i);
                groupUser.setUserId(user.getUserId());
                insertGroupUser(conn, groupUser);
            }
        } catch (Exception ex) {
            throw new TCException("ejb.User.UserDb:insertGroupUsers():failed:\n" + ex);
        }
    }


    private static void insertGroupUser(Connection conn, GroupUser groupUser)
            throws TCException {
        log.debug("ejb.User.UserDb:insertGroupUser() called ...");
        PreparedStatement ps = null;
        /**************************************************************/
        /***********************Informix*******************************/
        /**************************************************************/
        String query = "INSERT INTO group_user ( user_id, group_id ) VALUES ( ?, ? )";
        /**************************************************************/
        try {
            ps = conn.prepareStatement(query);
            ps.setInt(1, groupUser.getUserId());
            ps.setInt(2, groupUser.getGroup().getGroupId());
            int regVal = ps.executeUpdate();
            if (regVal != 1) {
                StringBuffer msg = new StringBuffer(200);
                msg.append("ejb.User.UserDb.insertGroup():insert error:user_id=");
                msg.append(groupUser.getUserId());
                msg.append(":group_id=");
                msg.append(groupUser.getGroup().getGroupId());
                msg.append(":group_desc=");
                msg.append(groupUser.getGroup().getGroupDesc());
                msg.append(":\n");
                throw new TCException(msg.toString());
            }
            groupUser.setModified("S");
        } catch (Exception ex) {
            throw new TCException("ejb.User.UserDb:insertGroupUser():failed:\n" + ex);
        } finally {
            try {
                if (ps != null) ps.close();
            } catch (Exception ignore) {
            }
        }
    }


    private static void updateGroupUsers(Connection conn, User user)
            throws TCException {
        log.debug("ejb.User.UserDb:updateGroupUsers() called ...");
        PreparedStatement ps = null;
        try {
            ArrayList groups = user.getGroups();
            for (int i = 0; i < groups.size(); i++) {
                GroupUser groupUser = (GroupUser) groups.get(i);
                String modified = groupUser.getModified();
                if (!modified.equals("S")) {
                    if (modified.equals("A")) {
                        insertGroupUser(conn, groupUser);
                        groupUser.setModified("S");
                    } else if (modified.equals("U")) {
                        /**************************************************************/
                        /***********************Informix*******************************/
                        /**************************************************************/
                        String query = "UPDATE group_user SET user_id=?, group_id=? WHERE user_id=? AND group_id=?";
                        /**************************************************************/
                        ps = conn.prepareStatement(query);
                        ps.setInt(1, user.getUserId());
                        ps.setInt(2, groupUser.getGroup().getGroupId());
                        ps.setInt(3, user.getUserId());
                        ps.setInt(4, groupUser.getGroup().getGroupId());
                        int regVal = ps.executeUpdate();
                        if (regVal != 1) {
                            StringBuffer msg = new StringBuffer(200);
                            msg.append("ejb.User.UserDb.updateGroupUsers():update error:sid=");
                            msg.append(user.getUserId());
                            msg.append(":group_id=");
                            msg.append(groupUser.getGroup().getGroupId());
                            msg.append(":group_desc=");
                            msg.append(groupUser.getGroup().getGroupDesc());
                            msg.append(":\n");
                            throw new TCException(msg.toString());
                        }
                        groupUser.setModified("S");
                    } else if (modified.equals("D")) {
                        /**************************************************************/
                        /***********************Informix*******************************/
                        /**************************************************************/
                        String query = "DELETE FROM group_user WHERE user_id=? AND group_id=?";
                        /**************************************************************/
                        ps = conn.prepareStatement(query);
                        ps.setInt(1, user.getUserId());
                        ps.setInt(2, groupUser.getGroup().getGroupId());
                        int regVal = ps.executeUpdate();
                        if (regVal != 1) {
                            StringBuffer msg = new StringBuffer(200);
                            msg.append("ejb.User.UserDb.updateGroupUsers():delete error:sid=");
                            msg.append(user.getUserId());
                            msg.append(":group_id=");
                            msg.append(groupUser.getGroup().getGroupId());
                            msg.append(":group_desc=");
                            msg.append(groupUser.getGroup().getGroupDesc());
                            msg.append(":\n");
                            throw new TCException(msg.toString());
                        }
                    }
                }
            }
        } catch (Exception ex) {
            throw new TCException("ejb.User.UserDb:updateGroupUsers():failed:\n" + ex);
        } finally {
            try {
                if (ps != null) ps.close();
            } catch (Exception ignore) {
            }
        }
    }

    private static void updateDefaultUserType(Connection conn, User user)
            throws TCException {
        log.debug("ejb.User.UserDb:updateDefaultUserType() called ...");
        PreparedStatement ps = null;
        try {
            String modified = user.getDefaultUserType().getModified();
            if (modified.equals("U")) {
                /**************************************************************/
                /***********************Informix*******************************/
                /**************************************************************/
                String query = "UPDATE user SET user_type_id=? WHERE user_id=?";
                /**************************************************************/
                ps = conn.prepareStatement(query);
                ps.setInt(1, user.getDefaultUserType().getUserTypeId());
                ps.setInt(2, user.getUserId());
                int regVal = ps.executeUpdate();
                if (regVal != 1) {
                    StringBuffer msg = new StringBuffer(200);
                    msg.append("ejb.User.UserDb.updateDefaultUserType():update error:sid=");
                    msg.append(user.getUserId());
                    msg.append(":user_type_id=");
                    msg.append(user.getDefaultUserType().getUserTypeId());
                    msg.append(":user_type_desc=");
                    msg.append(user.getDefaultUserType().getUserTypeDesc());
                    msg.append(":\n");
                    throw new TCException(msg.toString());
                }
            }
        } catch (Exception ex) {
            throw new TCException("ejb.User.UserDb:updateDefaultUserType():failed:\n" + ex);
        } finally {
            try {
                if (ps != null) ps.close();
            } catch (Exception ignore) {
            }
        }
    }

    private static String encodePassword(String password) throws Exception {
        Context context = TCContext.getContext(ApplicationServer.SECURITY_CONTEXT_FACTORY, ApplicationServer.SECURITY_PROVIDER_URL);

        PasswordRemoteHome passHome = (PasswordRemoteHome) context.lookup(PasswordRemoteHome.EJB_REF_NAME);
        PasswordRemote pass = passHome.create();

        return pass.encodePassword(password);
    }


}
