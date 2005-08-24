package com.topcoder.security.admin;

import com.topcoder.security.*;
import com.topcoder.util.idgenerator.bean.IdGenException;
import com.topcoder.util.idgenerator.bean.LocalIdGenHome;
import org.apache.log4j.Logger;

import javax.ejb.CreateException;
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

    private static final Logger logger = Logger.getLogger(com.topcoder.security.admin.PrincipalMgrBean.class);;
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

    public UserPrincipal getUser(String username)
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
            conn = Util.getConnection(ctx, DATA_SOURCE);
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

    public UserPrincipal getUser(long id)
            throws GeneralSecurityException, NoSuchUserException {
        logger.debug("getting user: " + id);
        String query = "SELECT user_id FROM security_user WHERE login_id = ?";
        InitialContext ctx = null;
        ResultSet rs = null;
        PreparedStatement ps = null;
        Connection conn = null;
        try {
            ctx = new InitialContext();
            conn = Util.getConnection(ctx, DATA_SOURCE);
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
        logger.debug("PrincipalMgrBean.getUserSubject: " + userId);
        Set pl = new HashSet();
        InitialContext ctx = null;
        ResultSet rs = null;
        PreparedStatement ps = null;
        Connection conn = null;
        try {
            ctx = new InitialContext();
            conn = Util.getConnection(ctx, DATA_SOURCE);
            getUser(userId);
            StringBuffer query = new StringBuffer(200);
            query.append("SELECT security_roles.role_id, description ");
            query.append(" FROM user_role_xref, security_roles ");
            query.append(" WHERE user_role_xref.login_id = ? ");
            query.append(" AND user_role_xref.role_id = security_roles.role_id ");
            query.append(" UNION SELECT security_roles.role_id, description");
            query.append(" FROM security_roles, user_group_xref, group_role_xref");
            query.append(" WHERE user_group_xref.login_id = ?");
            query.append(" AND user_group_xref.group_id = group_role_xref.group_id");
            query.append(" AND group_role_xref.role_id = security_roles.role_id");
            ps = conn.prepareStatement(query.toString());
            ps.setLong(1, userId);
            ps.setLong(2, userId);
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

    public String getPassword(long id)
            throws GeneralSecurityException, NoSuchUserException {
        logger.debug("getting user's password: " + id);
        String query = "SELECT password FROM security_user WHERE login_id = ? ";
        InitialContext ctx = null;
        ResultSet rs = null;
        PreparedStatement ps = null;
        Connection conn = null;
        try {
            ctx = new InitialContext();
            conn = Util.getConnection(ctx, DATA_SOURCE);
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

    public UserPrincipal createUser(String username, String password, TCSubject requestor)
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
            LocalIdGenHome idGenHome = (LocalIdGenHome) ctx.lookup(LocalIdGenHome.EJB_REF_NAME);
            long userId = idGenHome.create().nextId();
            logger.debug("new login_id = " + userId);
            String query = "INSERT INTO security_user (login_id, user_id, password) VALUES (?, ?, ?)";
            conn = Util.getConnection(ctx, DATA_SOURCE);
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
        } catch (CreateException e) {
            throw new GeneralSecurityException(e);
        } catch (IdGenException e) {
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

    public void removeUser(UserPrincipal user, TCSubject requestor)
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
            conn = Util.getConnection(ctx, DATA_SOURCE);
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
            conn = Util.getConnection(ctx, DATA_SOURCE);
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
        Set pl = new HashSet();
        String query = "SELECT group_id, description FROM security_groups";
        InitialContext ctx = null;
        ResultSet rs = null;
        PreparedStatement ps = null;
        Connection conn = null;
        try {
            ctx = new InitialContext();
            conn = Util.getConnection(ctx, DATA_SOURCE);
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
        String query = "SELECT description FROM security_groups WHERE group_id = ?";
        InitialContext ctx = null;
        ResultSet rs = null;
        PreparedStatement ps = null;
        Connection conn = null;
        try {
            ctx = new InitialContext();
            conn = Util.getConnection(ctx, DATA_SOURCE);
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
            LocalIdGenHome idGenHome = (LocalIdGenHome) ctx.lookup(LocalIdGenHome.EJB_REF_NAME);
            long groupId = idGenHome.create().nextId();
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
        } catch (CreateException e) {
            throw new GeneralSecurityException(e);
        } catch (IdGenException e) {
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
        InitialContext ctx = null;
        PreparedStatement ps = null;
        Connection conn = null;
        try {
            ctx = new InitialContext();
            LocalIdGenHome idGenHome = (LocalIdGenHome) ctx.lookup(LocalIdGenHome.EJB_REF_NAME);
            long user_group_xrefid = idGenHome.create().nextId();
            long userId = user.getId();
            long groupId = group.getId();
            String query = "INSERT INTO user_group_xref (user_group_id, login_id, group_id) VALUES ( ?, ?, ? )";
            conn = Util.getConnection(ctx, DATA_SOURCE);
            ps = conn.prepareStatement(query);
            ps.setLong(1, user_group_xrefid);
            ps.setLong(2, userId);
            ps.setLong(3, groupId);
            ps.executeUpdate();
        } catch (SQLException e) {
            throw new GeneralSecurityException(e);
        } catch (CreateException e) {
            throw new GeneralSecurityException(e);
        } catch (IdGenException e) {
            throw new GeneralSecurityException(e);
        } catch (NamingException e) {
            throw new GeneralSecurityException(e);
        } finally {
            close(ps);
            close(conn);
            close(ctx);
        }
    }

    public void removeUserFromGroup(GroupPrincipal group, UserPrincipal user, TCSubject requestor)
            throws GeneralSecurityException {
        long userId = user.getId();
        long groupId = group.getId();
        String query = "DELETE FROM user_group_xref WHERE login_id = ? AND group_id = ?";
        InitialContext ctx = null;
        PreparedStatement ps = null;
        Connection conn = null;
        try {
            ctx = new InitialContext();
            conn = Util.getConnection(ctx, DATA_SOURCE);
            ps = conn.prepareStatement(query);
            ps.setLong(1, userId);
            ps.setLong(2, groupId);
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
            LocalIdGenHome idGenHome = (LocalIdGenHome) ctx.lookup(LocalIdGenHome.EJB_REF_NAME);
            long roleId = idGenHome.create().nextId();
            String query = "INSERT INTO security_roles (role_id, description) VALUES ( ?, ? )";
            ps = conn.prepareStatement(query);
            ps.setLong(1, roleId);
            ps.setString(2, name);
            ps.executeUpdate();
            RolePrincipal rp = new RolePrincipal(name, roleId);
            return rp;
        } catch (SQLException e) {
            throw new GeneralSecurityException(e);
        } catch (CreateException e) {
            throw new GeneralSecurityException(e);
        } catch (IdGenException e) {
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
        String query1 = "DELETE FROM group_role_xref WHERE role_id = ?";
        String query2 = "DELETE FROM user_role_xref WHERE role_id = ?";
        String query3 = "DELETE FROM security_perms WHERE role_id = ?";
        String query4 = "DELETE FROM security_roles WHERE role_id = ?";
        InitialContext ctx = null;
        PreparedStatement ps1 = null;
        PreparedStatement ps2 = null;
        PreparedStatement ps3 = null;
        PreparedStatement ps4 = null;
        Connection conn = null;
        try {
            ctx = new InitialContext();
            conn = Util.getConnection(ctx, DATA_SOURCE);
            ps1 = conn.prepareStatement(query1);
            ps2 = conn.prepareStatement(query2);
            ps3 = conn.prepareStatement(query3);
            ps4 = conn.prepareStatement(query4);
            ps1.setLong(1, roleId);
            ps2.setLong(1, roleId);
            ps3.setLong(1, roleId);
            ps4.setLong(1, roleId);
            ps1.executeUpdate();
            ps2.executeUpdate();
            ps3.executeUpdate();
            ps4.executeUpdate();
        } catch (Exception e) {
            throw new GeneralSecurityException(e);
        } finally {
            close(ps1);
            close(ps2);
            close(ps3);
            close(ps4);
            close(conn);
            close(ctx);
        }
    }

    public void assignRole(UserPrincipal user, RolePrincipal role, TCSubject requestor)
            throws GeneralSecurityException {
        long userId = user.getId();
        long roleId = role.getId();
        String query = "INSERT INTO user_role_xref (user_role_id, login_id, role_id) VALUES ( ?, ?, ?)";
        InitialContext ctx = null;
        PreparedStatement ps = null;
        Connection conn = null;
        try {
            ctx = new InitialContext();
            conn = Util.getConnection(ctx, DATA_SOURCE);

            LocalIdGenHome idGenHome = (LocalIdGenHome) ctx.lookup(LocalIdGenHome.EJB_REF_NAME);
            long user_role_xrefid = idGenHome.create().nextId();
            ps = conn.prepareStatement(query);
            ps.setLong(1, user_role_xrefid);
            ps.setLong(2, userId);
            ps.setLong(3, roleId);
            ps.executeUpdate();
        } catch (SQLException e) {
            throw new GeneralSecurityException(e);
        } catch (CreateException e) {
            throw new GeneralSecurityException(e);
        } catch (IdGenException e) {
            throw new GeneralSecurityException(e);
        } catch (NamingException e) {
            throw new GeneralSecurityException(e);
        } finally {
            close(ps);
            close(conn);
            close(ctx);
        }
    }

    public void unAssignRole(UserPrincipal user, RolePrincipal role, TCSubject requestor)
            throws GeneralSecurityException {
        long userId = user.getId();
        long roleId = role.getId();
        String query = "DELETE FROM user_role_xref WHERE login_id = ? AND role_id = ?";
        InitialContext ctx = null;
        PreparedStatement ps = null;
        Connection conn = null;
        try {
            ctx = new InitialContext();
            conn = Util.getConnection(ctx, DATA_SOURCE);
            ps = conn.prepareStatement(query);
            ps.setLong(1, userId);
            ps.setLong(2, roleId);
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
        String query = "INSERT INTO group_role_xref (group_role_id, group_id, role_id) VALUES ( ?, ?, ? )";
        InitialContext ctx = null;
        PreparedStatement ps = null;
        Connection conn = null;
        try {
            ctx = new InitialContext();
            conn = Util.getConnection(ctx, DATA_SOURCE);

            LocalIdGenHome idGenHome = (LocalIdGenHome) ctx.lookup(LocalIdGenHome.EJB_REF_NAME);
            long group_role_xrefid = idGenHome.create().nextId();
            ps = conn.prepareStatement(query);
            ps.setLong(1, group_role_xrefid);
            ps.setLong(2, groupId);
            ps.setLong(3, roleId);
            ps.executeUpdate();
        } catch (SQLException e) {
            throw new GeneralSecurityException(e);
        } catch (CreateException e) {
            throw new GeneralSecurityException(e);
        } catch (IdGenException e) {
            throw new GeneralSecurityException(e);
        } catch (NamingException e) {
            throw new GeneralSecurityException(e);
        } finally {
            close(ps);
            close(conn);
            close(ctx);
        }
    }

    public void unAssignRole(GroupPrincipal group, RolePrincipal role, TCSubject requestor)
            throws GeneralSecurityException {
        long groupId = group.getId();
        long roleId = role.getId();
        String query = "DELETE FROM group_role_xref WHERE group_id = ? AND role_id = ?";
        InitialContext ctx = null;
        PreparedStatement ps = null;
        Connection conn = null;
        try {
            ctx = new InitialContext();
            conn = Util.getConnection(ctx, DATA_SOURCE);
            ps = conn.prepareStatement(query);
            ps.setLong(1, groupId);
            ps.setLong(2, roleId);
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
