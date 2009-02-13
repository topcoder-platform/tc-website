package com.topcoder.ejb.AuthenticationServices;


import com.topcoder.common.web.data.*;
import com.topcoder.shared.ejb.BaseEJB;
import com.topcoder.shared.util.DBMS;

import java.rmi.RemoteException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

/**
 * The implementation for the AuthenticationServices EJB.
 * This stateless session EJB controls logins, security, and loading of user information.
 */

public class AuthenticationServicesBean extends BaseEJB {


    private static final boolean VERBOSE = false;

    private static String DS = null;
    private static Integer STAFF_GROUP_ID = null;
    private static Integer STAFF_ACCESS_LEVEL = null;


//****************************************************************************************
//                                 Public Members
//****************************************************************************************

    /**
     * Returns true for a valid user name.
     * @param handle the Handle.
     * @return boolean true for a valid user name.
     */
    public boolean validHandle(String handle) throws RemoteException {
        if (VERBOSE) System.out.println("ejb.AuthenticationServices.validHandle() called...");
        boolean result = false;
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        int check = 0;
        /*************************************************************************************/
        String query = "SELECT 1 FROM user WHERE handle_lower=lower(?)";
        /*************************************************************************************/
        javax.naming.Context ctx = null;
        try {
            conn = DBMS.getConnection(getDS());
            ps = conn.prepareStatement(query);
            ps.setString(1, handle);
            rs = ps.executeQuery();
            if (rs.next()) check = rs.getInt(1);
            if (check != 1) result = true;
        } catch (Exception e) {
            e.printStackTrace();
            throw new RemoteException("AuthenticationServicesBean:validHandle: ERROR \n " + e.getMessage());
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
                } catch (Exception ignore) {
                }
            }
            if (ctx != null) {
                try {
                    ctx.close();
                } catch (Exception ignore) {
                }
            }
        }
        return result;
    }


    /**
     * Returns true for sector agreement
     * @param sectorId the id for the security sector
     * @param userId the user's id.
     * @return boolean true for a sector agreement
     */
    public boolean agreed(int sectorId, int userId) throws RemoteException {
        if (VERBOSE) System.out.println("ejb.AuthenticationServices.agreed() called...");
        boolean result = false;
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        /*************************************************************************************/
        String query = "SELECT 1 FROM sector_agreement WHERE sector_id=? AND user_id=?";
        /*************************************************************************************/
        javax.naming.Context ctx = null;
        try {
            conn = DBMS.getConnection(getDS());
            ps = conn.prepareStatement(query);
            ps.setInt(1, sectorId);
            ps.setInt(2, userId);
            rs = ps.executeQuery();
            if (rs.next()) {
                result = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
            throw new RemoteException("AuthenticationServicesBean:agreed: ERROR \n " + e.getMessage());
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
                } catch (Exception ignore) {
                }
            }
            if (ctx != null) {
                try {
                    ctx.close();
                } catch (Exception ignore) {
                }
            }
        }
        return result;
    }


    /**
     * Returns a Map of UserId/Handle Entries with like user names.
     * @param handle the Handle.
     * @return Map of UserId keys and Handle values.
     */
    public Map getLikeUsers(String handle) throws RemoteException {
        if (VERBOSE) System.out.println("ejb.AuthenticationServices.getLikeUsers() called...");
        Map result = new HashMap();
        if (handle != null) {
            Connection conn = null;
            ResultSet rs = null;
            PreparedStatement ps = null;
            StringBuffer query = new StringBuffer(200);
            /*************************************************************************************/
            query.append(" SELECT user_id");
            query.append(" ,handle");
            query.append(" ,UPPER(handle) AS upper_handle");
            query.append(" FROM user");
            query.append(" WHERE handle_lower LIKE '%");
            query.append(handle.toLowerCase());
            query.append("%'");
            query.append(" ORDER BY 3");
            /*************************************************************************************/
            javax.naming.Context ctx = null;
            try {
                conn = DBMS.getConnection(getDS());
                ps = conn.prepareStatement(query.toString());
                rs = ps.executeQuery();
                while (rs.next()) {
                    result.put(new Integer(rs.getInt(1)), rs.getString(2));
                }
            } catch (Exception e) {
                e.printStackTrace();
                throw new RemoteException(
                        "AuthenticationServicesBean:getLikeUsers: ERROR \n " + e.getMessage()
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
                if (conn != null) {
                    try {
                        conn.close();
                    } catch (Exception ignore) {
                    }
                }
                if (ctx != null) {
                    try {
                        ctx.close();
                    } catch (Exception ignore) {
                    }
                }
            }
        }
        return result;
    }


    /**
     * Returns the authentication object for a given handle and password.
     * @param handle the user's name.
     * @param password the user's password.
     * @return an Authentication object.
     */
    public Authentication authenticate(String handle, String password)
            throws RemoteException {
        if (VERBOSE) System.out.println("ejb.AuthenticationServices.authenticate(" + handle + ",*****) called...");
        Authentication result = new Authentication();
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        StringBuffer query = new StringBuffer(100);
        /*************************************************************************************/
        query.append(" SELECT u.user_id");
        query.append(" ,u.status");
        query.append(" ,u.handle");
        query.append(" ,c.activation_code");
        query.append(" FROM user u");
        query.append(" ,coder c");
        query.append(" WHERE handle_lower=lower(?)");
        query.append(" AND u.password=?");
        query.append(" AND u.user_id=c.coder_id");
        /*************************************************************************************/
        javax.naming.Context ctx = null;
        try {
            conn = DBMS.getConnection(getDS());
            ps = conn.prepareStatement(query.toString());
            ps.setString(1, handle);
            ps.setString(2, password);
            rs = ps.executeQuery();
            if (rs.next()) {
                result.setUserId(rs.getInt(1));
                result.setStatus(rs.getString(2));
                result.setHandle(rs.getString(3));
                result.setPassword(password);
                result.setActivationCode(rs.getString(4));
            }
        } catch (Exception e) {
            e.printStackTrace();
            throw new RemoteException("AuthenticationServicesBean:authenticate:ERROR:\n" + e.getMessage());
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
                } catch (Exception ignore) {
                }
            }
            if (ctx != null) {
                try {
                    ctx.close();
                } catch (Exception ignore) {
                }
            }
        }
        return result;
    }


    /**
     * Returns the activation code for a valid coder_id.
     * @param coderId the user's id.
     * @return an Authentication object representing the coder's credentials
     */
    public Authentication getActivation(int coderId)
            throws RemoteException {
        if (VERBOSE) System.out.println("ejb.AuthenticationServices.getActivation() called...");
        Authentication result = new Authentication();
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        StringBuffer query = new StringBuffer(100);
        /*************************************************************************************/
        query.append("SELECT c.activation_code");
        query.append(" ,u.status");
        query.append(" ,u.handle");
        query.append(" ,u.password");
        query.append(" FROM user u");
        query.append(" ,coder c");
        query.append(" WHERE u.user_id=c.coder_id");
        query.append(" AND c.coder_id=?");
        /*************************************************************************************/
        javax.naming.Context ctx = null;
        try {
            conn = DBMS.getConnection(getDS());
            ps = conn.prepareStatement(query.toString());
            ps.setLong(1, new Long(coderId).longValue());
            rs = ps.executeQuery();
            if (rs.next()) {
                result.setUserId(coderId);
                result.setActivationCode(rs.getString(1));
                result.setStatus(rs.getString(2));
                result.setHandle(rs.getString(3));
                result.setPassword(rs.getString(4));
            }
        } catch (Exception e) {
            e.printStackTrace();
            StringBuffer msg = new StringBuffer(200);
            msg.append("ejb.AuthenticationServicesBean:getActivation:coderId=");
            msg.append(coderId);
            msg.append(":ERROR:\n");
            msg.append(e.getMessage());
            throw new RemoteException(msg.toString());
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
                } catch (Exception ignore) {
                }
            }
            if (ctx != null) {
                try {
                    ctx.close();
                } catch (Exception ignore) {
                }
            }
        }
        return result;
    }


    /**
     * Returns a user's credentials for a valid firstName, lastName, and email.
     * (used to create an email for a forgotten password)
     * @param firstName the user's first name.
     * @param lastName the user's last name.
     * @param email the user's email address.
     * @return an Authentication object representing the coder's credentials
     */
    public Authentication getCredentials(String firstName, String lastName, String email)
            throws RemoteException {
        if (VERBOSE) System.out.println("ejb.AuthenticationServices.getCredentials() called...");
        Authentication result = new Authentication();
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        javax.naming.Context ctx = null;
        try {
            conn = DBMS.getConnection(getDS());
            StringBuffer query = new StringBuffer(200);
            /*************************************************************************************/
            query.append("SELECT u.user_id");
            query.append(" ,u.handle");
            query.append(" ,u.password");
            query.append(" ,c.activation_code");
            query.append(" ,u.status");
            query.append(" FROM user u");
            query.append(" ,coder c");
            query.append(" WHERE u.user_id=c.coder_id");
            query.append(" AND UPPER(c.first_name) = UPPER(?)");
            query.append(" AND UPPER(c.last_name) = UPPER(?)");
            query.append(" AND UPPER(u.email) = UPPER(?)");
            /*************************************************************************************/
            ps = conn.prepareStatement(query.toString());
            ps.setString(1, firstName);
            ps.setString(2, lastName);
            ps.setString(3, email);
            rs = ps.executeQuery();
            if (rs.next()) {
                result.setUserId(rs.getInt(1));
                result.setHandle(rs.getString(2));
                result.setPassword(rs.getString(3));
                result.setActivationCode(rs.getString(4));
                result.setStatus(rs.getString(5));
            }
        } catch (Exception e) {
            e.printStackTrace();
            StringBuffer msg = new StringBuffer(200);
            msg.append("ejb.AuthenticationServicesBean:getCredentials:firstName=");
            msg.append(firstName);
            msg.append(":lastName=");
            msg.append(lastName);
            msg.append(":email=");
            msg.append(email);
            msg.append(":ERROR:\n");
            msg.append(e.getMessage());
            throw new RemoteException(msg.toString());
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
                } catch (Exception ignore) {
                }
            }
            if (ctx != null) {
                try {
                    ctx.close();
                } catch (Exception ignore) {
                }
            }
        }
        return result;
    }


    /**
     * Inserts a record in sector access for a given sector, user.
     * @param sectorId the secured area.
     * @param userId the user's id.
     * @param authorized the authorized status of the sector access.
     */
    public void insertSectorAccess(int sectorId, int userId, String authorized)
            throws RemoteException {
        if (VERBOSE) System.out.println("ejb.AuthenticationServices.insertSectorAccess() called...");
        java.sql.Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        javax.naming.Context ctx = null;
        try {
            conn = DBMS.getConnection(getDS());
            StringBuffer query = new StringBuffer(200);
            /*************************************************************************************/
            query.append(" INSERT");
            query.append(" INTO");
            query.append(" sector_access (");
            query.append(" sector_id");
            query.append(" ,user_id");
            query.append(" ,access");
            query.append(" ,authorized");
            query.append(" )");
            query.append(" VALUES (?,?,CURRENT,?)");
            /*************************************************************************************/
            ps = conn.prepareStatement(query.toString());
            ps.setInt(1, sectorId);
            ps.setInt(2, userId);
            ps.setString(3, authorized);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
            StringBuffer msg = new StringBuffer();
            msg.append("common.Common:insertSectorAccess:ERROR:");
            msg.append("sectorId=");
            msg.append(sectorId);
            msg.append(":");
            msg.append("userId=");
            msg.append(userId);
            msg.append(":");
            msg.append("authorized=");
            msg.append(authorized);
            msg.append(":");
            msg.append(e.getMessage());
            throw new RemoteException(msg.toString());
        } finally {
            if (ps != null) {
                try {
                    ps.close();
                } catch (Exception ignore) {
                }
            }
            if (rs != null) {
                try {
                    rs.close();
                } catch (Exception ignore) {
                }
            }
            if (conn != null) {
                try {
                    conn.close();
                } catch (Exception ignore) {
                }
            }
            if (ctx != null) {
                try {
                    ctx.close();
                } catch (Exception ignore) {
                }
            }
        }
    }


    /**
     * Inserts a record into sector agreement to indicate that a user agreed to the terms of the sector.
     * @param sectorId the secured area.
     * @param userId the user's id.
     */
    public void insertSectorAgreement(int sectorId, int userId)
            throws RemoteException {
        if (VERBOSE) System.out.println("ejb.AuthenticationServices.insertSectorAgreement() called...");
        java.sql.Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        javax.naming.Context ctx = null;
        try {
            conn = DBMS.getConnection(getDS());
            StringBuffer query = new StringBuffer(200);
            /*************************************************************************************/
            query.append(" INSERT");
            query.append(" INTO");
            query.append(" sector_agreement (");
            query.append(" sector_id");
            query.append(" ,user_id");
            query.append(" ,agree_date");
            query.append(" )");
            query.append(" VALUES (?,?,CURRENT)");
            /*************************************************************************************/
            ps = conn.prepareStatement(query.toString());
            ps.setInt(1, sectorId);
            ps.setInt(2, userId);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
            StringBuffer msg = new StringBuffer();
            msg.append("common.Common:insertSectorAgreement:ERROR:");
            msg.append("sectorId=");
            msg.append(sectorId);
            msg.append(":");
            msg.append("userId=");
            msg.append(userId);
            msg.append(":");
            msg.append(e.getMessage());
            throw new RemoteException(msg.toString());
        } finally {
            if (ps != null) {
                try {
                    ps.close();
                } catch (Exception ignore) {
                }
            }
            if (rs != null) {
                try {
                    rs.close();
                } catch (Exception ignore) {
                }
            }
            if (conn != null) {
                try {
                    conn.close();
                } catch (Exception ignore) {
                }
            }
            if (ctx != null) {
                try {
                    ctx.close();
                } catch (Exception ignore) {
                }
            }
        }
    }


    /**
     * Determines if a given permission assignee is a member of the TopCoder staff.
     * @param assignee -- the user.
     * @return boolean true if assignee is TopCoder staff.
     */
    public boolean isStaff(PermissionAssignee assignee) throws RemoteException {
        boolean result = false;
        try {
            ArrayList groups = assignee.getGroups();
            if (groups != null) {
                for (int i = 0; i < groups.size(); i++) {
                    GroupUser groupUser = (GroupUser) groups.get(i);
                    if (groupUser.getGroup().getGroupId() == getStaffGroupId().intValue()) {
                        result = true;
                        break;
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            throw new RemoteException(e.getMessage());
        }
        return result;
    }


    /**
     * Loads a User object from the DB for the given user id.
     * @param userId a valid user id.
     * @return a populated user object.
     */
    public User loadUser(int userId) throws RemoteException {
        User result = new User();
        result.setUserId(userId);
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
        javax.naming.Context ctx = null;
        try {
            conn = DBMS.getConnection(getDS());
            ps = conn.prepareStatement(query.toString());
            ps.setInt(1, result.getUserId());
            rs = ps.executeQuery();
            if (rs.next()) {
                UserType userType = result.getDefaultUserType();
                result.setHandle(rs.getString(2));
                result.setPassword(rs.getString(3));
                result.setEmail(rs.getString(4));
                result.setStatus(rs.getString(5));
                result.setLoggedIn(rs.getString(6));
                result.setModified("S");
                userType.setUserTypeId(rs.getInt(7));
                userType.setUserTypeDesc(rs.getString(8));
                result.setTerms(rs.getString(9));
                userType.setModified("S");
                loadGroupUsers(conn, result);
            } else {
                throw new RemoteException("ejb.User.UserDb:loadUser():empty resultset:\n");
            }
        } catch (Exception ex) {
            ex.printStackTrace();
            throw new RemoteException("ejb.User.UserDb:loadUser():failed:\n" + ex);
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
                } catch (Exception ignore) {
                    System.out.println("loadCoder cx NOT closed...");
                }
            }
        }
        return result;
    }





//****************************************************************************************
//                                 Private Members
//****************************************************************************************


    private static void loadGroupUsers(Connection conn, User user)
            throws RemoteException {
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
            ArrayList groupUsers = user.getGroups();
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
        } catch (Exception ex) {
            throw new RemoteException("ejb.User.UserDb:loadGroupUsers():" +
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


    private String getDS() {
        if (DS == null) {
            javax.naming.Context ctx = null;
            try {
                ctx = new javax.naming.InitialContext();
                javax.naming.Context env = (javax.naming.Context) ctx.lookup("java:comp/env");
                synchronized (this) {
                    DS = (java.lang.String) env.lookup("DS");
                }
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                if (ctx != null) {
                    try {
                        ctx.close();
                    } catch (Exception ignore) {
                    }
                }
            }
        }
        return DS;
    }


    private Integer getStaffGroupId() {
        if (STAFF_GROUP_ID == null) {
            javax.naming.Context ctx = null;
            try {
                ctx = new javax.naming.InitialContext();
                javax.naming.Context env = (javax.naming.Context) ctx.lookup("java:comp/env");
                synchronized (this) {
                    STAFF_GROUP_ID = (java.lang.Integer) env.lookup("STAFF_GROUP_ID");
                }
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                if (ctx != null) {
                    try {
                        ctx.close();
                    } catch (Exception ignore) {
                    }
                }
            }
        }
        return STAFF_GROUP_ID;
    }


}
