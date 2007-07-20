package com.topcoder.security.admin;

import com.topcoder.security.*;
import com.topcoder.util.idgenerator.IDGenerationException;
import com.topcoder.util.idgenerator.IDGenerator;
import com.topcoder.util.idgenerator.IDGeneratorFactory;
import org.apache.log4j.Logger;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Collection;
import java.util.HashSet;
import java.util.Set;

public class PrincipalMgrBean extends BaseEJB {

    private static final Logger logger = Logger.getLogger(com.topcoder.security.admin.PrincipalMgrBean.class);
    private static final String DATA_SOURCE = "java:comp/env/jdbc/DefaultDS";

    public Collection getUsers(TCSubject requestor)
            throws GeneralSecurityException {
        logger.debug("PrincipalMgrBean - getUsers");
        Set pl = new HashSet();
        String query = "SELECT login_id, user_id FROM security_user";
        InitialContext ctx = null;
        ResultSet rs = null;
        PreparedStatement ps = null;
        Connection conn = null;
        try {
            ctx = new InitialContext();
            conn = Util.getConnection(ctx, DATA_SOURCE);
            ps = conn.prepareStatement(query);
            UserPrincipal up;
            for (rs = ps.executeQuery(); rs.next(); pl.add(up))
                up = new UserPrincipal(rs.getString(2), rs.getLong(1));
        } catch (Exception e) {
            throw new GeneralSecurityException(e);
        } finally {
            close(rs);
            close(ps);
            close(conn);
            close(ctx);
        }
        return pl;
    }

    public UserPrincipal getUser(String username, String dataSource)
            throws GeneralSecurityException, NoSuchUserException {
        checkLength(username, 50);
        logger.debug("getting user: " + username);
        String query = "SELECT login_id FROM security_user WHERE user_id = ?";
        InitialContext ctx = null;
        ResultSet rs = null;
        PreparedStatement ps = null;
        Connection conn = null;
        try {
            ctx = new InitialContext();
            conn = Util.getConnection(ctx, dataSource);
            ps = conn.prepareStatement(query);
            ps.setString(1, username);
            rs = ps.executeQuery();
            if (rs.next()) {
                UserPrincipal up = new UserPrincipal(username, rs.getLong(1));
                return up;
            } else {
                throw new NoSuchUserException(username);
            }
        } catch (NoSuchUserException e) {
            throw e;
        } catch (Exception e) {
            throw new GeneralSecurityException(e);
        } finally {
            close(rs);
            close(ps);
            close(conn);
            close(ctx);
        }
    }

    public UserPrincipal getUser(String username)
            throws GeneralSecurityException, NoSuchUserException {
        return getUser(username, DATA_SOURCE);
    }

    public UserPrincipal getUser(long id)
            throws GeneralSecurityException, NoSuchUserException {
        return getUser(id, DATA_SOURCE);
    }

    public UserPrincipal getUser(long id, String dataSource)
            throws GeneralSecurityException, NoSuchUserException {
        logger.debug("getting user: " + id);
        String query = "SELECT user_id FROM security_user WHERE login_id = ?";
        InitialContext ctx = null;
        ResultSet rs = null;
        PreparedStatement ps = null;
        Connection conn = null;
        try {
            ctx = new InitialContext();
            conn = Util.getConnection(ctx, dataSource);
            ps = conn.prepareStatement(query);
            ps.setLong(1, id);
            rs = ps.executeQuery();
            if (rs.next()) {
                UserPrincipal up = new UserPrincipal(rs.getString(1), id);
                return up;
            } else {
                throw new NoSuchUserException("" + id);
            }
        } catch (NoSuchUserException e) {
            throw e;
        } catch (Exception e) {
            throw new GeneralSecurityException(e);
        } finally {
            close(rs);
            close(ps);
            close(conn);
            close(ctx);
        }
    }

    public TCSubject getUserSubject(long userId)
            throws GeneralSecurityException, NoSuchUserException {
        return getUserSubject(userId, DATA_SOURCE);
    }


    public TCSubject getUserSubject(long userId, String dataSource)
            throws GeneralSecurityException, NoSuchUserException {
        logger.debug("PrincipalMgrBean.getUserSubject: " + userId);
        Set pl = new HashSet();
        InitialContext ctx = null;
        ResultSet rs = null;
        PreparedStatement ps = null;
        Connection conn = null;
        try {
            ctx = new InitialContext();
            conn = Util.getConnection(ctx, dataSource);
            getUser(userId, dataSource);
            StringBuffer query = new StringBuffer(200);
            query.append("SELECT security_roles.role_id, description ");
            query.append(" FROM user_role_xref, security_roles ");
            query.append(" WHERE user_role_xref.login_id = ? ");
            query.append(" AND user_role_xref.role_id = security_roles.role_id ");
            query.append(" AND user_role_xref.security_status_id = ?");
            query.append(" UNION SELECT security_roles.role_id, description");
            query.append(" FROM security_roles, user_group_xref, group_role_xref");
            query.append(" WHERE user_group_xref.login_id = ?");
            query.append(" AND user_group_xref.group_id = group_role_xref.group_id");
            query.append(" AND group_role_xref.role_id = security_roles.role_id");
            query.append(" AND group_role_xref.security_status_id = ?");
            query.append(" AND user_group_xref.security_status_id = ?");
            ps = conn.prepareStatement(query.toString());
            ps.setLong(1, userId);
            ps.setInt(2, SecurityDB.STATUS_ACTIVE);
            ps.setLong(3, userId);
            ps.setInt(4, SecurityDB.STATUS_ACTIVE);
            ps.setInt(5, SecurityDB.STATUS_ACTIVE);
            rs = ps.executeQuery();

            while (rs.next()) {
                logger.debug(rs.getRow() + " adding principal: " + rs.getLong(1));
                RolePrincipal rp = new RolePrincipal(rs.getString(2), rs.getLong(1));
                pl.add(rp);
            }

        } catch (NoSuchUserException e) {
            throw e;
        } catch (Exception e) {
            throw new GeneralSecurityException(e);
        } finally {
            close(rs);
            close(ps);
            close(conn);
            close(ctx);
        }
        TCSubject sub = new TCSubject(pl, userId);
        return sub;
    }


    public String getPassword(long id, String dataSource)
            throws GeneralSecurityException, NoSuchUserException {
        logger.debug("getting user's password: " + id);
        String query = "SELECT password FROM security_user WHERE login_id = ? ";
        InitialContext ctx = null;
        ResultSet rs = null;
        PreparedStatement ps = null;
        Connection conn = null;
        try {
            ctx = new InitialContext();
            conn = Util.getConnection(ctx, dataSource);
            ps = conn.prepareStatement(query);
            ps.setEscapeProcessing(true);
            ps.setLong(1, id);
            rs = ps.executeQuery();
            if (rs.next()) {
                String encPassword = rs.getString(1);
                logger.debug("*********password from db: " + encPassword);
                String password = Util.decodePassword(encPassword, "users");
                return password;
            } else {
                throw new NoSuchUserException("" + id);
            }
        } catch (NoSuchUserException e) {
            throw e;
        } catch (Exception e) {
            throw new GeneralSecurityException(e);
        } finally {
            close(rs);
            close(ps);
            close(conn);
            close(ctx);
        }
    }


    public String getPassword(long id)
            throws GeneralSecurityException, NoSuchUserException {
        return getPassword(id, DATA_SOURCE);
    }


    public UserPrincipal createUser(long userId, String username, String password, TCSubject requestor, String dataSource)
            throws GeneralSecurityException {
        logger.debug(requestor + " is creating user " + username);
        checkLength(username, 50);
        checkLength(password, 31);
        String encPassword = Util.encodePassword(password, "users");
        logger.debug("*********password into db: " + encPassword);
        InitialContext ctx = null;
        ResultSet rs = null;
        PreparedStatement ps = null;
        Connection conn = null;
        try {
            ctx = new InitialContext();
            logger.debug("new login_id = " + userId);
            String query = "INSERT INTO security_user (login_id, user_id, password) VALUES (?, ?, ?)";
            conn = Util.getConnection(ctx, dataSource);
            ps = conn.prepareStatement(query);
            ps.setEscapeProcessing(true);
            ps.setLong(1, userId);
            ps.setString(2, username);
            ps.setString(3, encPassword);
            ps.executeUpdate();
            UserPrincipal up = new UserPrincipal(username, userId);
            return up;
        } catch (SQLException e) {
            throw new GeneralSecurityException(e);
        } catch (NamingException e) {
            throw new GeneralSecurityException(e);
        } finally {
            close(rs);
            close(ps);
            close(conn);
            close(ctx);
        }
    }

    public UserPrincipal createUser(long userId, String username, String password, TCSubject requestor)
            throws GeneralSecurityException {
        return createUser(userId, username, password, requestor, DATA_SOURCE);
    }

    public UserPrincipal createUser(String username, String password, TCSubject requestor, String dataSource)
            throws GeneralSecurityException {
        logger.debug(requestor + " is creating user " + username);
        checkLength(username, 50);
        checkLength(password, 31);
        String encPassword = Util.encodePassword(password, "users");
        logger.debug("*********password into db: " + encPassword);
        InitialContext ctx = null;
        ResultSet rs = null;
        PreparedStatement ps = null;
        Connection conn = null;
        try {
            ctx = new InitialContext();
            IDGenerator gen = IDGeneratorFactory.getIDGenerator("USER_SEQ");
            long userId = gen.getNextID();
            logger.debug("new login_id = " + userId);
            String query = "INSERT INTO security_user (login_id, user_id, password) VALUES (?, ?, ?)";
            conn = Util.getConnection(ctx, dataSource);
            ps = conn.prepareStatement(query);
            ps.setEscapeProcessing(true);
            ps.setLong(1, userId);
            ps.setString(2, username);
            ps.setString(3, encPassword);
            ps.executeUpdate();
            UserPrincipal up = new UserPrincipal(username, userId);
            return up;
        } catch (SQLException e) {
            throw new GeneralSecurityException(e);
        } catch (IDGenerationException e) {
            throw new GeneralSecurityException(e);
        } catch (NamingException e) {
            throw new GeneralSecurityException(e);
        } finally {
            close(rs);
            close(ps);
            close(conn);
            close(ctx);
        }
    }


    public UserPrincipal createUser(String username, String password, TCSubject requestor)
            throws GeneralSecurityException {
        return createUser(username, password, requestor, DATA_SOURCE);
    }

    public void removeUser(UserPrincipal user, TCSubject requestor)
            throws GeneralSecurityException {
        removeUser(user, requestor, DATA_SOURCE);
    }


    public void removeUser(UserPrincipal user, TCSubject requestor, String dataSource)
            throws GeneralSecurityException {
        logger.debug("PrinicpalMgrBean - removeUser: " + requestor + " is removing " + user);
        long userId = user.getId();
        String query1 = "DELETE from security_user WHERE login_id = ?";
        String query2 = "DELETE from user_group_xref WHERE login_id = ?";
        String query3 = "DELETE from user_role_xref WHERE login_id = ?";
        InitialContext ctx = null;
        PreparedStatement ps1 = null;
        PreparedStatement ps2 = null;
        PreparedStatement ps3 = null;
        Connection conn = null;
        try {
            ctx = new InitialContext();
            conn = Util.getConnection(ctx, dataSource);
            ps1 = conn.prepareStatement(query1);
            ps2 = conn.prepareStatement(query2);
            ps3 = conn.prepareStatement(query3);
            ps1.setLong(1, userId);
            ps2.setLong(1, userId);
            ps3.setLong(1, userId);
            ps3.executeUpdate();
            ps2.executeUpdate();
            ps1.executeUpdate();
        } catch (Exception e) {
            throw new GeneralSecurityException(e);
        } finally {
            close(ps1);
            close(ps2);
            close(ps3);
            close(conn);
            close(ctx);
        }
    }

    public UserPrincipal editPassword(UserPrincipal user, String password, TCSubject requestor)
            throws GeneralSecurityException {
        return editPassword(user, password, requestor, DATA_SOURCE);
    }


    public UserPrincipal editPassword(UserPrincipal user, String password, TCSubject requestor, String dataSource)
            throws GeneralSecurityException {
        checkLength(password, 31);
        logger.debug("UserPrincipal.editPassword");
        String encPassword = Util.encodePassword(password, "users");
        long userId = user.getId();
        String query = "UPDATE security_user SET password = ? WHERE login_id = ?";
        InitialContext ctx = null;
        PreparedStatement ps = null;
        Connection conn = null;
        try {
            ctx = new InitialContext();
            conn = Util.getConnection(ctx, dataSource);
            ps = conn.prepareStatement(query);
            ps.setString(1, encPassword);
            ps.setLong(2, userId);
            ps.executeUpdate();
        } catch (Exception e) {
            throw new GeneralSecurityException(e);
        } finally {
            close(ps);
            close(conn);
            close(ctx);
        }
        return user;
    }


    public Collection getGroups(TCSubject requestor)
            throws GeneralSecurityException {
        return getGroups(requestor, DATA_SOURCE);
    }

    public Collection getGroups(TCSubject requestor, String dataSource)
            throws GeneralSecurityException {
        Set pl = new HashSet();
        String query = "SELECT group_id, description FROM security_groups";
        InitialContext ctx = null;
        ResultSet rs = null;
        PreparedStatement ps = null;
        Connection conn = null;
        try {
            ctx = new InitialContext();
            conn = Util.getConnection(ctx, dataSource);
            ps = conn.prepareStatement(query);
            GroupPrincipal gp;
            for (rs = ps.executeQuery(); rs.next(); pl.add(gp))
                gp = new GroupPrincipal(rs.getString(2), rs.getLong(1));

        } catch (Exception e) {
            throw new GeneralSecurityException(e);
        } finally {
            close(rs);
            close(ps);
            close(conn);
            close(ctx);
        }
        return pl;
    }


    public GroupPrincipal getGroup(long id)
            throws GeneralSecurityException, NoSuchGroupException {
        return getGroup(id, DATA_SOURCE);
    }


    public GroupPrincipal getGroup(long id, String dataSource)
            throws GeneralSecurityException, NoSuchGroupException {
        String query = "SELECT description FROM security_groups WHERE group_id = ?";
        InitialContext ctx = null;
        ResultSet rs = null;
        PreparedStatement ps = null;
        Connection conn = null;
        try {
            ctx = new InitialContext();
            conn = Util.getConnection(ctx, dataSource);
            ps = conn.prepareStatement(query);
            ps.setLong(1, id);
            rs = ps.executeQuery();
            if (rs.next()) {
                GroupPrincipal gp = new GroupPrincipal(rs.getString(1), id);
                return gp;
            } else {
                throw new NoSuchGroupException("" + id);
            }
        } catch (Exception e) {
            throw new GeneralSecurityException(e);
        } finally {
            close(rs);
            close(ps);
            close(conn);
            close(ctx);
        }
    }

    public GroupPrincipal createGroup(String groupname, TCSubject requestor)
            throws GeneralSecurityException {
        checkLength(groupname, 254);
        InitialContext ctx = null;
        PreparedStatement ps = null;
        Connection conn = null;
        try {
            ctx = new InitialContext();
            IDGenerator gen = IDGeneratorFactory.getIDGenerator("SECURITY_SEQ");
            long groupId = gen.getNextID();
            logger.debug("createGroup: " + groupId);
            String query = "INSERT INTO security_groups (group_id, description) VALUES ( ?, ? )";
            conn = Util.getConnection(ctx, DATA_SOURCE);
            ps = conn.prepareStatement(query);
            ps.setLong(1, groupId);
            ps.setString(2, groupname);
            ps.executeUpdate();
            GroupPrincipal gs = new GroupPrincipal(groupname, groupId);
            return gs;
        } catch (SQLException e) {
            throw new GeneralSecurityException(e);
        } catch (IDGenerationException e) {
            throw new GeneralSecurityException(e);
        } catch (NamingException e) {
            throw new GeneralSecurityException(e);
        } finally {
            close(ps);
            close(conn);
            close(ctx);
        }
    }

    public void removeGroup(GroupPrincipal group, TCSubject requestor)
            throws GeneralSecurityException {
        long groupId = group.getId();
        String query1 = "DELETE FROM user_group_xref WHERE group_id = ?";
        String query2 = "DELETE FROM group_role_xref WHERE group_id = ?";
        String query3 = "DELETE FROM security_groups WHERE group_id = ?";
        InitialContext ctx = null;
        PreparedStatement ps1 = null;
        PreparedStatement ps2 = null;
        PreparedStatement ps3 = null;
        Connection conn = null;
        try {
            ctx = new InitialContext();
            conn = Util.getConnection(ctx, DATA_SOURCE);
            ps1 = conn.prepareStatement(query1);
            ps2 = conn.prepareStatement(query2);
            ps3 = conn.prepareStatement(query3);
            ps1.setLong(1, groupId);
            ps2.setLong(1, groupId);
            ps3.setLong(1, groupId);
            ps1.executeUpdate();
            ps2.executeUpdate();
            ps3.executeUpdate();
        } catch (Exception e) {
            throw new GeneralSecurityException(e);
        } finally {
            close(ps1);
            close(ps2);
            close(ps3);
            close(conn);
            close(ctx);
        }
    }

    public void addUserToGroup(GroupPrincipal group, UserPrincipal user, TCSubject requestor)
            throws GeneralSecurityException {
        addUserToGroup(group, user, requestor, DATA_SOURCE);
    }

    public void addUserToGroup(GroupPrincipal group, UserPrincipal user, TCSubject requestor, String dataSource)
            throws GeneralSecurityException {
        InitialContext ctx = null;
        PreparedStatement ps = null;
        PreparedStatement ps2 = null;
        PreparedStatement ps3 = null;
        ResultSet rs = null;
        Connection conn = null;
        try {
            ctx = new InitialContext();
            IDGenerator gen = IDGeneratorFactory.getIDGenerator("SECURITY_SEQ");
            long user_group_xrefid = gen.getNextID();
            long userId = user.getId();
            long groupId = group.getId();
            String select = "select security_status_id, user_group_id from user_group_xref where login_id = ? and group_id = ?";
            String updateQuery = "update user_group_xref set security_status_id = ? where user_group_id = ?";
            String query = "INSERT INTO user_group_xref (user_group_id, login_id, group_id, security_status_id) VALUES ( ?, ?, ?, ? )";
            conn = Util.getConnection(ctx, dataSource);

            ps3 = conn.prepareStatement(select);
            ps3.setLong(1, userId);
            ps3.setLong(2, groupId);
            rs = ps3.executeQuery();
            if (rs.next()) {
                if (rs.getInt("security_status_id") == SecurityDB.STATUS_INACTIVE) {
                    ps2 = conn.prepareStatement(updateQuery);
                    ps2.setInt(1, SecurityDB.STATUS_ACTIVE);
                    ps2.setLong(2, rs.getLong("user_group_id"));
                    ps2.executeUpdate();
                }
            } else {
                ps = conn.prepareStatement(query);
                ps.setLong(1, user_group_xrefid);
                ps.setLong(2, userId);
                ps.setLong(3, groupId);
                ps.setInt(4, SecurityDB.STATUS_ACTIVE);
                ps.executeUpdate();
            }

        } catch (SQLException e) {
            e.printStackTrace();
            throw new GeneralSecurityException(e);
        } catch (IDGenerationException e) {
            e.printStackTrace();
            throw new GeneralSecurityException(e);
        } catch (NamingException e) {
            e.printStackTrace();
            throw new GeneralSecurityException(e);
        } finally {
            close(ps);
            close(ps2);
            close(rs);
            close(ps3);
            close(conn);
            close(ctx);
        }
    }

    public void removeUserFromGroup(GroupPrincipal group, UserPrincipal user, TCSubject requestor)
            throws GeneralSecurityException {
        removeUserFromGroup(group, user, requestor, DATA_SOURCE);

    }

    public void removeUserFromGroup(GroupPrincipal group, UserPrincipal user, TCSubject requestor, String dataSource)
            throws GeneralSecurityException {
        long userId = user.getId();
        long groupId = group.getId();
        String query = "UPDATE user_group_xref SET security_status_id = ? WHERE login_id = ? AND group_id = ?";
        InitialContext ctx = null;
        PreparedStatement ps = null;
        Connection conn = null;
        try {
            ctx = new InitialContext();
            conn = Util.getConnection(ctx, dataSource);
            ps = conn.prepareStatement(query);
            ps.setInt(1, SecurityDB.STATUS_INACTIVE);
            ps.setLong(2, userId);
            ps.setLong(3, groupId);
            ps.executeUpdate();
        } catch (Exception e) {
            throw new GeneralSecurityException(e);
        } finally {
            close(ps);
            close(conn);
            close(ctx);
        }
    }

    public Collection getRoles(TCSubject requestor)
            throws GeneralSecurityException {
        Set pl = new HashSet();
        String query = "SELECT role_id, description FROM security_roles";
        InitialContext ctx = null;
        PreparedStatement ps = null;
        Connection conn = null;
        ResultSet rs = null;
        try {
            ctx = new InitialContext();
            conn = Util.getConnection(ctx, DATA_SOURCE);
            ps = conn.prepareStatement(query);
            RolePrincipal rp;
            for (rs = ps.executeQuery(); rs.next(); pl.add(rp))
                rp = new RolePrincipal(rs.getString(2), rs.getLong(1));

        } catch (Exception e) {
            throw new GeneralSecurityException(e);
        } finally {
            close(rs);
            close(ps);
            close(conn);
            close(ctx);
        }
        return pl;
    }

    public RolePrincipal getRole(long id)
            throws GeneralSecurityException, NoSuchRoleException {
        String query = "SELECT description FROM security_roles WHERE role_id = ?";
        InitialContext ctx = null;
        PreparedStatement ps = null;
        Connection conn = null;
        ResultSet rs = null;
        try {
            ctx = new InitialContext();
            conn = Util.getConnection(ctx, DATA_SOURCE);
            ps = conn.prepareStatement(query);
            ps.setLong(1, id);
            rs = ps.executeQuery();
            if (rs.next()) {
                RolePrincipal rp = new RolePrincipal(rs.getString(1), id);
                return rp;
            } else {
                throw new NoSuchRoleException("" + id);
            }
        } catch (Exception e) {
            throw new GeneralSecurityException(e);
        } finally {
            close(rs);
            close(ps);
            close(conn);
            close(ctx);
        }
    }

    public RolePrincipal createRole(String name, TCSubject requestor)
            throws GeneralSecurityException {
        checkLength(name, 254);
        InitialContext ctx = null;
        PreparedStatement ps = null;
        Connection conn = null;
        try {
            ctx = new InitialContext();
            conn = Util.getConnection(ctx, DATA_SOURCE);
            IDGenerator gen = IDGeneratorFactory.getIDGenerator("SECURITY_SEQ");
            long roleId = gen.getNextID();
            String query = "INSERT INTO security_roles (role_id, description) VALUES ( ?, ? )";
            ps = conn.prepareStatement(query);
            ps.setLong(1, roleId);
            ps.setString(2, name);
            ps.executeUpdate();
            RolePrincipal rp = new RolePrincipal(name, roleId);
            return rp;
        } catch (SQLException e) {
            throw new GeneralSecurityException(e);
        } catch (IDGenerationException e) {
            throw new GeneralSecurityException(e);
        } catch (NamingException e) {
            throw new GeneralSecurityException(e);
        } finally {
            close(ps);
            close(conn);
            close(ctx);
        }
    }

    public void removeRole(RolePrincipal role, TCSubject requestor)
            throws GeneralSecurityException {
        long roleId = role.getId();
        String query1 = "UPDATE group_role_xref SET security_status_id = ? WHERE role_id = ?";
        String query2 = "UPDATE user_role_xref security_status_id = ? WHERE role_id = ?";
        String query3 = "UPDATE security_perms security_status_id = ? WHERE role_id = ?";
        //String query4 = "DELETE FROM security_roles WHERE role_id = ?";
        InitialContext ctx = null;
        PreparedStatement ps1 = null;
        PreparedStatement ps2 = null;
        PreparedStatement ps3 = null;
        //PreparedStatement ps4 = null;
        Connection conn = null;
        try {
            ctx = new InitialContext();
            conn = Util.getConnection(ctx, DATA_SOURCE);
            ps1 = conn.prepareStatement(query1);
            ps2 = conn.prepareStatement(query2);
            ps3 = conn.prepareStatement(query3);
            //ps4 = conn.prepareStatement(query4);
            ps1.setInt(1, SecurityDB.STATUS_INACTIVE);
            ps1.setLong(2, roleId);
            ps2.setInt(1, SecurityDB.STATUS_INACTIVE);
            ps2.setLong(2, roleId);
            ps3.setInt(1, SecurityDB.STATUS_INACTIVE);
            ps3.setLong(2, roleId);
            //ps4.setLong(1, roleId);
            ps1.executeUpdate();
            ps2.executeUpdate();
            ps3.executeUpdate();
            //ps4.executeUpdate();
        } catch (Exception e) {
            throw new GeneralSecurityException(e);
        } finally {
            close(ps1);
            close(ps2);
            close(ps3);
            //close(ps4);
            close(conn);
            close(ctx);
        }
    }

    public void assignRole(UserPrincipal user, RolePrincipal role,
                           TCSubject requestor) throws GeneralSecurityException {
        assignRole(user, role, requestor, DATA_SOURCE);
    }

    public void assignRole(UserPrincipal user, RolePrincipal role, TCSubject requestor, String dataSource)
            throws GeneralSecurityException {
        long userId = user.getId();
        long roleId = role.getId();
        String query = "INSERT INTO user_role_xref (user_role_id, login_id, role_id, security_status_id) VALUES ( ?, ?, ?, ?)";
        String deleteQuery = "DELETE FROM user_role_xref where login_id = ? and role_id = ?";
        InitialContext ctx = null;
        PreparedStatement ps = null;
        PreparedStatement ps2 = null;
        Connection conn = null;
        try {
            ctx = new InitialContext();
            conn = Util.getConnection(ctx, dataSource);

            IDGenerator gen = IDGeneratorFactory.getIDGenerator("SECURITY_SEQ");
            long user_role_xrefid = gen.getNextID();

            ps2 = conn.prepareStatement(deleteQuery);
            ps2.setLong(1, userId);
            ps2.setLong(2, roleId);
            ps2.executeUpdate();

            ps = conn.prepareStatement(query);
            ps.setLong(1, user_role_xrefid);
            ps.setLong(2, userId);
            ps.setLong(3, roleId);
            ps.setInt(4, SecurityDB.STATUS_ACTIVE);
            ps.executeUpdate();
        } catch (SQLException e) {
            throw new GeneralSecurityException(e);
        } catch (IDGenerationException e) {
            throw new GeneralSecurityException(e);
        } catch (NamingException e) {
            throw new GeneralSecurityException(e);
        } finally {
            close(ps);
            close(ps2);
            close(conn);
            close(ctx);
        }
    }

    public void unAssignRole(UserPrincipal user, RolePrincipal role, TCSubject requestor)
            throws GeneralSecurityException {
        long userId = user.getId();
        long roleId = role.getId();
        String query = "UPDATE user_role_xref SET security_status_id = ? WHERE login_id = ? AND role_id = ?";
        InitialContext ctx = null;
        PreparedStatement ps = null;
        Connection conn = null;
        try {
            ctx = new InitialContext();
            conn = Util.getConnection(ctx, DATA_SOURCE);
            ps = conn.prepareStatement(query);
            ps.setInt(1, SecurityDB.STATUS_ACTIVE);
            ps.setLong(2, userId);
            ps.setLong(3, roleId);
            ps.executeUpdate();
        } catch (Exception e) {
            throw new GeneralSecurityException(e);
        } finally {
            close(ps);
            close(conn);
            close(ctx);
        }
    }

    public void assignRole(GroupPrincipal group, RolePrincipal role, TCSubject requestor)
            throws GeneralSecurityException {
        long groupId = group.getId();
        long roleId = role.getId();
        String query = "INSERT INTO group_role_xref (group_role_id, group_id, role_id, security_status_id) VALUES ( ?, ?, ?, ? )";
        String deleteQuery = "DELETE FROM group_role_xref where group_id = ? and role_id = ?";
        InitialContext ctx = null;
        PreparedStatement ps = null;
        PreparedStatement ps2 = null;
        Connection conn = null;
        try {
            ctx = new InitialContext();
            conn = Util.getConnection(ctx, DATA_SOURCE);

            IDGenerator gen = IDGeneratorFactory.getIDGenerator("SECURITY_SEQ");
            long group_role_xrefid = gen.getNextID();

            ps2 = conn.prepareStatement(deleteQuery);
            ps2.setLong(1, groupId);
            ps2.setLong(2, roleId);
            ps2.executeUpdate();

            ps = conn.prepareStatement(query);
            ps.setLong(1, group_role_xrefid);
            ps.setLong(2, groupId);
            ps.setLong(3, roleId);
            ps.setInt(4, SecurityDB.STATUS_ACTIVE);
            ps.executeUpdate();
        } catch (SQLException e) {
            throw new GeneralSecurityException(e);
        } catch (IDGenerationException e) {
            throw new GeneralSecurityException(e);
        } catch (NamingException e) {
            throw new GeneralSecurityException(e);
        } finally {
            close(ps);
            close(ps2);
            close(conn);
            close(ctx);
        }
    }

    public void unAssignRole(GroupPrincipal group, RolePrincipal role, TCSubject requestor)
            throws GeneralSecurityException {
        long groupId = group.getId();
        long roleId = role.getId();
        String query = "UPDATE group_role_xref SET security_status_id = ? WHERE group_id = ? AND role_id = ?";
        InitialContext ctx = null;
        PreparedStatement ps = null;
        Connection conn = null;
        try {
            ctx = new InitialContext();
            conn = Util.getConnection(ctx, DATA_SOURCE);
            ps = conn.prepareStatement(query);
            ps.setInt(1, SecurityDB.STATUS_ACTIVE);
            ps.setLong(2, groupId);
            ps.setLong(3, roleId);
            ps.executeUpdate();
        } catch (Exception e) {
            throw new GeneralSecurityException(e);
        } finally {
            close(ps);
            close(conn);
            close(ctx);
        }
    }

    static Class _mthclass$(String x0) {
        try {
            return Class.forName(x0);
        } catch (ClassNotFoundException x1) {
            throw new NoClassDefFoundError(x1.getMessage());
        }
    }

}
