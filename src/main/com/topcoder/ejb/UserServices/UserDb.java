package com.topcoder.ejb.UserServices;

import com.topcoder.common.web.data.CoderRegistration;
import com.topcoder.common.web.error.TCException;
import com.topcoder.ejb.AuthenticationServices.*;
import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.logging.Logger;

import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;


final class UserDb {
    private static Logger log = Logger.getLogger(UserDb.class);

    static void insertUser(User user) throws TCException {
        log.debug("ejb.User.UserDb:insertUser():called...");
        Connection conn = null;
        PreparedStatement ps = null;
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
            if (user.getPermissions().size() > 0) {
                insertPermissions(conn, user);
            }
            if (user.getGroups().size() > 0) {
                insertGroupUsers(conn, user);
            }
            HashMap userTypeDetails = user.getUserTypeDetails();
            if (userTypeDetails.containsKey("Coder")) {
                CoderRegistration coder = (CoderRegistration) userTypeDetails.get("Coder");
                coder.setCoderId(user.getUserId());
                UserDbCoder.insertCoder(conn, coder);
                coder.setAllModifiedStable();
            }
        } catch (SQLException sqe) {
            DBMS.printSqlException(true, sqe);
            throw new TCException("ejb.DataCache.DataCacheBean.insertUser: ERROR \n " + sqe.getMessage());
        } catch (Exception ex) {
            throw new TCException("ejb.User.UserDb:insertUser():failed:\n" + ex);
        } finally {
            if (ps != null) {
                try {
                    ps.close();
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
                user.setModified("S");
            }
            updateDefaultUserType(conn, user);
            updateGroupUsers(conn, user);
            HashMap userTypeDetails = user.getUserTypeDetails();
            if (userTypeDetails.containsKey("Coder")) {
                CoderRegistration coder = (CoderRegistration) userTypeDetails.get("Coder");
                UserDbCoder.updateCoder(conn, coder);
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
                user.setSIdType(rs.getString(1));
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
                loadPermissions(conn, user);
                UserDbCoder.loadCoder(conn, user);
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


    private static void loadPermissions(Connection conn, User user)
            throws TCException {
        log.debug("ejb.User.UserDb:loadPermissions() called ...");
        try {
            user.getPermissions().clear();
            ArrayList permissions = getPermissions(conn, user.getUserId());
            if (permissions != null) {
                user.getPermissions().addAll(permissions);
                permissions.clear();
            }
            ArrayList groupIds = getGroupIds(conn, user.getUserId());
            if (groupIds != null) {
                for (int i = 0; i < groupIds.size(); i++) {
                    int groupId = ((Integer) groupIds.get(i)).intValue();
                    permissions = getPermissions(conn, groupId);
                    if (permissions != null) {
                        user.getPermissions().addAll(permissions);
                        permissions.clear();
                    }
                }
            }
        } catch (Exception ex) {
            ex.printStackTrace();
            throw new TCException("ejb.User.UserDb:loadPermissions():" + user.getUserId() + "failed:\n" + ex);
        }
    }


    private static ArrayList getGroupIds(Connection conn, int userId)
            throws TCException {
        log.debug("ejb.User.UserDb:getGroupIds() called ...");
        ArrayList result = null;
        ArrayList groupIds = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        StringBuffer query = new StringBuffer(200);
        /**************************************************************/
        /***********************Informix*******************************/
        /**************************************************************/
        query.append(" SELECT");
        query.append(" group_id");
        query.append(" FROM");
        query.append(" group_user");
        query.append(" WHERE");
        query.append(" user_id = ?");
        /**************************************************************/
        try {
            ps = conn.prepareStatement(query.toString());
            query.delete(0, 200);
            ps.setInt(1, userId);
            rs = ps.executeQuery();
            ps.clearParameters();
            while (rs.next()) {
                if (result == null) result = new ArrayList();
                int groupId = rs.getInt(1);
                result.add(new Integer(groupId));
                groupIds = getSubGroupIds(conn, groupId);
                if (groupIds != null) {
                    result.addAll(groupIds);
                    groupIds.clear();
                }
            }
        } catch (Exception ex) {
            throw new TCException("ejb.User.UserDb:getGroupIds():" + userId + "failed:\n" + ex);
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
        }
        return result;
    }


    private static ArrayList getSubGroupIds(Connection conn, int groupId)
            throws TCException {
        log.debug("ejb.User.UserDb:getSubGroupIds() called ...");
        ArrayList result = null;
        ArrayList groupIds = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        StringBuffer query = new StringBuffer(200);
        /**************************************************************/
        /***********************Informix*******************************/
        /**************************************************************/
        query.append(" SELECT");
        query.append(" g.user_id");
        query.append(" FROM");
        query.append(" group_user g");
        query.append(" ,secure_object s");
        query.append(" WHERE");
        query.append(" g.group_id = ?");
        query.append(" AND s.secure_object_type = 'G'");
        query.append(" AND g.user_id = s.secure_object_id");
        try {
            ps = conn.prepareStatement(query.toString());
            query.delete(0, 200);
            ps.setInt(1, groupId);
            rs = ps.executeQuery();
            ps.clearParameters();
            while (rs.next()) {
                if (result == null) result = new ArrayList();
                int subGroupId = rs.getInt(1);
                result.add(new Integer(subGroupId));
                groupIds = getSubGroupIds(conn, subGroupId);
                if (groupIds != null) {
                    result.addAll(groupIds);
                    groupIds.clear();
                }
            }
        } catch (Exception ex) {
            throw new TCException("ejb.User.UserDb:getSubGroupIds():" + groupId + "failed:\n" + ex);
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
        }
        return result;
    }


    private static ArrayList getPermissions(Connection conn, int sid)
            throws TCException {
        log.debug("ejb.User.UserDb:getPermissions(conn,sid) called ...");
        ArrayList result = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        StringBuffer query = new StringBuffer(400);
        /**************************************************************/
        /***********************Informix*******************************/
        /**************************************************************/
        query.append(" SELECT");
        query.append(" s.sector_id");
        query.append(" ,s.sector_desc");
        query.append(" ,a.access_id");
        query.append(" ,a.access_desc");
        query.append(" FROM");
        query.append(" permission p");
        query.append(" ,sector s");
        query.append(" ,access a");
        query.append(" WHERE");
        query.append(" p.secure_object_id = ?");
        query.append(" AND p.sector_id = s.sector_id");
        query.append(" AND p.access_id = a.access_id");
        /**************************************************************/
        try {
            ps = conn.prepareStatement(query.toString());
            ps.setInt(1, sid);
            rs = ps.executeQuery();
            while (rs.next()) {
                if (result == null) result = new ArrayList();
                Permission permission = new Permission();
                Sector sector = permission.getSector();
                AccessLevel accessLevel = permission.getAccessLevel();
                permission.setSId(sid);
                sector.setSectorId(rs.getInt(1));
                sector.setSectorDesc(rs.getString(2));
                accessLevel.setAccessLevelId(rs.getInt(3));
                accessLevel.setAccessLevelDescription(rs.getString(4));
                result.add(permission);
            }
        } catch (Exception ex) {
            throw new TCException(
                    "ejb.User.UserDb:getPermissions(conn,sid):" + sid + "failed:\n" + ex.getMessage()
            );
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
        }
        return result;
    }


    private static void insertSecureObject(Connection conn, User user)
            throws TCException {
        log.debug("ejb.User.UserDb:insertSecureObject() called ...");
        PreparedStatement ps = null;
        /**************************************************************/
        /***********************Informix*******************************/
        /**************************************************************/
        String query = "INSERT INTO secure_object ( secure_object_id, secure_object_type ) VALUES ( ?, ? )";
        /**************************************************************/
        try {
            user.setUserId(DBMS.getTransSeqId(conn, DBMS.JMA_SEQ));
            ps = conn.prepareStatement(query);
            ps.setInt(1, user.getUserId());
            ps.setString(2, user.getSIdType());
            int regVal = ps.executeUpdate();
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


    private static void insertPermissions(Connection conn, User user)
            throws TCException {
        log.debug("ejb.User.UserDb:insertPermissions() called ...");
        try {
            ArrayList permissions = user.getPermissions();
            for (int i = 0; i < permissions.size(); i++) {
                Permission permission = (Permission) permissions.get(i);
                permission.setSId(user.getUserId());
                insertPermission(conn, permission);
            }
        } catch (Exception ex) {
            throw new TCException("ejb.User.UserDb:insertPermissions():failed:\n" + ex);
        }
    }

    private static void insertPermission(Connection conn, Permission permission)
            throws TCException {
        log.debug("ejb.User.UserDb:insertPermission() called ...");
        PreparedStatement ps = null;
        /**************************************************************/
        /***********************Informix*******************************/
        /**************************************************************/
        String query = "INSERT INTO permission ( secure_object_id, sector_id, access_id ) VALUES ( ?, ?, ? )";
        /**************************************************************/
        try {
            ps = conn.prepareStatement(query);
            ps.setInt(1, permission.getSId());
            ps.setInt(2, permission.getSector().getSectorId());
            ps.setInt(3, permission.getAccessLevel().getAccessLevelId());
            int regVal = ps.executeUpdate();
            if (regVal != 1) {
                StringBuffer msg = new StringBuffer(200);
                msg.append("ejb.User.UserDb.insertPermission():insert error:sid=");
                msg.append(permission.getSId());
                msg.append(":sector_id=");
                msg.append(permission.getSector().getSectorId());
                msg.append(":sector_desc=");
                msg.append(permission.getSector().getSectorDesc());
                msg.append(":\n");
                throw new TCException(msg.toString());
            }
            permission.setModified("S");
        } catch (Exception ex) {
            throw new TCException("ejb.User.UserDb:insertPermission():failed:\n" + ex);
        } finally {
            try {
                if (ps != null) ps.close();
            } catch (Exception ignore) {
            }
        }
    }


    private static void updatePermissions(Connection conn, User user)
            throws TCException {
        log.debug("ejb.User.UserDb:updatePermissions() called ...");
        PreparedStatement ps = null;
        try {
            ArrayList permissions = user.getPermissions();
            for (int i = 0; i < permissions.size(); i++) {
                Permission permission = (Permission) permissions.get(i);
                String modified = permission.getModified();
                if (!modified.equals("S")) {
                    if (modified.equals("A")) {
                        insertPermission(conn, permission);
                    } else if (modified.equals("U")) {
                        /**************************************************************/
                        /***********************Informix*******************************/
                        /**************************************************************/
                        String query = "UPDATE permission SET secure_object_id=?, sector_id=?, access_id=? WHERE secure_object_id=? AND sector_id=?";
                        /**************************************************************/
                        ps = conn.prepareStatement(query);
                        ps.setInt(1, user.getUserId());
                        ps.setInt(2, permission.getSector().getSectorId());
                        ps.setInt(3, permission.getAccessLevel().getAccessLevelId());
                        ps.setInt(4, user.getUserId());
                        ps.setInt(5, permission.getSector().getSectorId());
                        int regVal = ps.executeUpdate();
                        if (regVal != 1) {
                            StringBuffer msg = new StringBuffer(200);
                            msg.append("ejb.User.UserDb.updatePermissions():update error:sid=");
                            msg.append(user.getUserId());
                            msg.append(":sector_id=");
                            msg.append(permission.getSector().getSectorId());
                            msg.append(":sector_desc=");
                            msg.append(permission.getSector().getSectorDesc());
                            msg.append(":\n");
                            throw new TCException(msg.toString());
                        }
                    } else if (modified.equals("D")) {
                        /**************************************************************/
                        /***********************Informix*******************************/
                        /**************************************************************/
                        String query = "DELETE FROM permission WHERE secure_object_id=? AND sector_id=?";
                        /**************************************************************/
                        ps = conn.prepareStatement(query);
                        ps.setInt(1, user.getUserId());
                        ps.setInt(2, permission.getSector().getSectorId());
                        int regVal = ps.executeUpdate();
                        if (regVal != 1) {
                            StringBuffer msg = new StringBuffer(200);
                            msg.append("ejb.User.UserDb.updatePermissions():delete error:sid=");
                            msg.append(user.getUserId());
                            msg.append(":sector_id=");
                            msg.append(permission.getSector().getSectorId());
                            msg.append(":sector_desc=");
                            msg.append(permission.getSector().getSectorDesc());
                            msg.append(":\n");
                            throw new TCException(msg.toString());
                        }
                    }
                }
            }
        } catch (Exception ex) {
            throw new TCException("ejb.User.UserDb:updatePermissions():failed:\n" + ex);
        } finally {
            try {
                if (ps != null) ps.close();
            } catch (Exception ignore) {
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


}
