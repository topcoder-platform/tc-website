package com.topcoder.security.admin;

import com.topcoder.security.*;
import com.topcoder.util.idgenerator.bean.*;
import java.rmi.RemoteException;
import java.sql.*;
import java.util.*;
import javax.ejb.*;
import javax.naming.*;
import javax.sql.DataSource;
import org.apache.log4j.Logger;

public class PrincipalMgrBean
    implements SessionBean
{

    public PrincipalMgrBean()
    {
    }

    public void ejbCreate()
        throws EJBException
    {
        try
        {
            Context context = new InitialContext();
            dataSource = (DataSource)context.lookup("java:comp/env/jdbc/DefaultDS");
            DataSource idGenDS = (DataSource)context.lookup("java:comp/env/jdbc/DefaultDS");
            idGenHome = (LocalIdGenHome)context.lookup("java:comp/env/ejb/IdGenEJB");
        }
        catch(NamingException e)
        {
            throw new EJBException("" + e);
        }
    }

    public void ejbRemove()
        throws RemoteException
    {
    }

    public void ejbActivate()
    {
    }

    public void ejbPassivate()
    {
    }

    public void setSessionContext(SessionContext sessioncontext)
    {
    }

    public Collection getUsers(TCSubject requestor)
        throws GeneralSecurityException
    {
        logger.debug("PrincipalMgrBean - getUsers");
        Set pl = new HashSet();
        String query = "SELECT login_id, user_id FROM security_user";
        try
        {
            Connection con = dataSource.getConnection();
            PreparedStatement pstmt = con.prepareStatement(query);
            ResultSet rs;
            UserPrincipal up;
            for(rs = pstmt.executeQuery(); rs.next(); pl.add(up))
                up = new UserPrincipal(rs.getString(2), rs.getLong(1));

            rs.close();
            pstmt.close();
            con.close();
        }
        catch(SQLException e)
        {
            throw new GeneralSecurityException("SQLException in topcoder.com.security.admin.PrincipalMgrBean.getUsers: " + e.getMessage());
        }
        return pl;
    }

    public UserPrincipal getUser(String username)
        throws GeneralSecurityException, NoSuchUserException
    {
        checkLength(username, 50);
        logger.debug("getting user: " + username);
        String query = "SELECT login_id FROM security_user WHERE user_id = ?";
        try
        {
            Connection con = dataSource.getConnection();
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setString(1, username);
            ResultSet rs = pstmt.executeQuery();
            if(rs.next())
            {
                UserPrincipal up = new UserPrincipal(username, rs.getLong(1));
                rs.close();
                pstmt.close();
                con.close();
                return up;
            } else
            {
                rs.close();
                pstmt.close();
                con.close();
                throw new NoSuchUserException(username);
            }
        }
        catch(SQLException e)
        {
            throw new GeneralSecurityException("" + e);
        }
    }

    public UserPrincipal getUser(long id)
        throws GeneralSecurityException, NoSuchUserException
    {
        logger.debug("getting user: " + id);
        String query = "SELECT user_id FROM security_user WHERE login_id = ?";
        try
        {
            Connection con = dataSource.getConnection();
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setLong(1, id);
            ResultSet rs = pstmt.executeQuery();
            if(rs.next())
            {
                UserPrincipal up = new UserPrincipal(rs.getString(1), id);
                rs.close();
                pstmt.close();
                con.close();
                return up;
            } else
            {
                rs.close();
                pstmt.close();
                con.close();
                throw new NoSuchUserException("" + id);
            }
        }
        catch(SQLException e)
        {
            throw new GeneralSecurityException("" + e);
        }
    }

    public TCSubject getUserSubject(long userId)
        throws GeneralSecurityException, NoSuchUserException
    {
        logger.debug("PrincipalMgrBean.getUserSubject: " + userId);
        Set pl = new HashSet();
        String query = null;
        try
        {
            Connection con = dataSource.getConnection();
            PreparedStatement pstmt = null;
            ResultSet rs = null;
            getUser(userId);
            query = "SELECT security_roles.role_id, description FROM user_role_xref, security_roles WHERE user_role_xref.login_id = ? AND user_role_xref.role_id = security_roles.role_id";
            pstmt = con.prepareStatement(query);
            pstmt.setLong(1, userId);
            rs = pstmt.executeQuery();
            String query2 = "SELECT security_roles.role_id, description FROM security_roles, user_group_xref, group_role_xref WHERE user_group_xref.login_id = ? AND user_group_xref.group_id = group_role_xref.group_id AND group_role_xref.role_id = security_roles.role_id";
            PreparedStatement pstmt2 = con.prepareStatement(query2);
            pstmt2.setLong(1, userId);
            ResultSet rs2 = pstmt2.executeQuery();

            while (rs.next()) {
                logger.debug(rs.getRow() + " adding principal: " + rs.getLong(1));
                RolePrincipal rp = new RolePrincipal(rs.getString(2), rs.getLong(1));
                pl.add(rp);
            }

            rs.close();
            while (rs2.next()) {
                logger.debug(rs2.getRow() + " adding principal: " + rs2.getLong(1));
                RolePrincipal rp = new RolePrincipal(rs2.getString(2), rs2.getLong(1));
                pl.add(rp);
            }

            rs2.close();
            pstmt.close();
            pstmt2.close();
            con.close();
        }
        catch(SQLException e)
        {
            throw new GeneralSecurityException("SQLException in com.topcoder.security.login.LoginBean.login: " + e.getMessage());
        }
        TCSubject sub = new TCSubject(pl, userId);
        return sub;
    }

    public String getPassword(long id)
        throws GeneralSecurityException, NoSuchUserException
    {
        logger.debug("getting user's password: " + id);
        String query = "SELECT password FROM security_user WHERE login_id = ? ";
        try
        {
            Connection con = dataSource.getConnection();
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setEscapeProcessing(true);
            pstmt.setLong(1, id);
            ResultSet rs = pstmt.executeQuery();
            if(rs.next())
            {
                String encPassword = rs.getString(1);
                rs.close();
                pstmt.close();
                con.close();
                logger.debug("*********password from db: " + encPassword);
                String password = Util.decodePassword(encPassword, "users");
                return password;
            } else
            {
                rs.close();
                pstmt.close();
                con.close();
                throw new NoSuchUserException("" + id);
            }
        }
        catch(SQLException e)
        {
            throw new GeneralSecurityException("" + e);
        }
    }

    public UserPrincipal createUser(String username, String password, TCSubject requestor)
        throws GeneralSecurityException
    {
        logger.debug(requestor + " is creating user " + username);
        checkLength(username, 50);
        checkLength(password, 31);
        String encPassword = Util.encodePassword(password, "users");
        logger.debug("*********password into db: " + encPassword);
        try
        {
            long userId = idGenHome.create().nextId();
            logger.debug("new login_id = " + userId);
            String query = "INSERT INTO security_user (login_id, user_id, password) VALUES (?, ?, ?)";
            Connection con = dataSource.getConnection();
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setEscapeProcessing(true);
            pstmt.setLong(1, userId);
            pstmt.setString(2, username);
            pstmt.setString(3, encPassword);
            pstmt.executeUpdate();
            pstmt.close();
            con.close();
            UserPrincipal up = new UserPrincipal(username, userId);
            return up;
        }
        catch(SQLException e)
        {
            throw new GeneralSecurityException("" + e);
        }
        catch(CreateException e)
        {
            throw new GeneralSecurityException("" + e);
        }
        catch(IdGenException e)
        {
            throw new GeneralSecurityException("" + e);
        }
    }

    public void removeUser(UserPrincipal user, TCSubject requestor)
        throws GeneralSecurityException
    {
        logger.debug("PrinicpalMgrBean - removeUser: " + requestor + " is removing " + user);
        long userId = user.getId();
        String query1 = "DELETE from security_user WHERE login_id = ?";
        String query2 = "DELETE from user_group_xref WHERE login_id = ?";
        String query3 = "DELETE from user_role_xref WHERE login_id = ?";
        try
        {
            Connection con = dataSource.getConnection();
            PreparedStatement pstmt1 = con.prepareStatement(query1);
            PreparedStatement pstmt2 = con.prepareStatement(query2);
            PreparedStatement pstmt3 = con.prepareStatement(query3);
            pstmt1.setLong(1, userId);
            pstmt2.setLong(1, userId);
            pstmt3.setLong(1, userId);
            pstmt1.executeUpdate();
            pstmt2.executeUpdate();
            pstmt3.executeUpdate();
            pstmt1.close();
            pstmt2.close();
            pstmt3.close();
            con.close();
        }
        catch(SQLException e)
        {
            throw new GeneralSecurityException("" + e);
        }
    }

    public UserPrincipal editPassword(UserPrincipal user, String password, TCSubject requestor)
        throws GeneralSecurityException
    {
        checkLength(password, 31);
        logger.debug("UserPrincipal.editPassword");
        String encPassword = Util.encodePassword(password, "users");
        long userId = user.getId();
        String query = "UPDATE security_user SET password = ? WHERE login_id = ?";
        try
        {
            Connection con = dataSource.getConnection();
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setString(1, encPassword);
            pstmt.setLong(2, userId);
            pstmt.executeUpdate();
            pstmt.close();
            con.close();
        }
        catch(SQLException e)
        {
            throw new GeneralSecurityException("" + e);
        }
        return user;
    }

    public Collection getGroups(TCSubject requestor)
        throws GeneralSecurityException
    {
        Set pl = new HashSet();
        String query = "SELECT group_id, description FROM security_groups";
        try
        {
            Connection con = dataSource.getConnection();
            PreparedStatement pstmt = con.prepareStatement(query);
            ResultSet rs;
            GroupPrincipal gp;
            for(rs = pstmt.executeQuery(); rs.next(); pl.add(gp))
                gp = new GroupPrincipal(rs.getString(2), rs.getLong(1));

            rs.close();
            pstmt.close();
            con.close();
        }
        catch(SQLException e)
        {
            throw new GeneralSecurityException("SQLException in com.topcoder.security.admin.PrincipalMgrBean.getGroups: " + e.getMessage());
        }
        return pl;
    }

    public GroupPrincipal getGroup(long id)
        throws GeneralSecurityException, NoSuchGroupException
    {
        String query = "SELECT description FROM security_groups WHERE group_id = ?";
        try
        {
            Connection con = dataSource.getConnection();
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setLong(1, id);
            ResultSet rs = pstmt.executeQuery();
            if(rs.next())
            {
                GroupPrincipal gp = new GroupPrincipal(rs.getString(1), id);
                rs.close();
                pstmt.close();
                con.close();
                return gp;
            } else
            {
                rs.close();
                pstmt.close();
                con.close();
                throw new NoSuchGroupException("" + id);
            }
        }
        catch(SQLException e)
        {
            throw new GeneralSecurityException("" + e);
        }
    }

    public GroupPrincipal createGroup(String groupname, TCSubject requestor)
        throws GeneralSecurityException
    {
        checkLength(groupname, 254);
        try
        {
            long groupId = idGenHome.create().nextId();
            logger.debug("createGroup: " + groupId);
            String query = "INSERT INTO security_groups (group_id, description) VALUES ( ?, ? )";
            Connection con = dataSource.getConnection();
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setLong(1, groupId);
            pstmt.setString(2, groupname);
            pstmt.executeUpdate();
            pstmt.close();
            con.close();
            GroupPrincipal gs = new GroupPrincipal(groupname, groupId);
            return gs;
        }
        catch(SQLException e)
        {
            throw new GeneralSecurityException("" + e);
        }
        catch(CreateException e)
        {
            throw new GeneralSecurityException("" + e);
        }
        catch(IdGenException e)
        {
            throw new GeneralSecurityException("" + e);
        }
    }

    public void removeGroup(GroupPrincipal group, TCSubject requestor)
        throws GeneralSecurityException
    {
        String name = group.getName();
        long groupId = group.getId();
        String query1 = "DELETE FROM user_group_xref WHERE group_id = ?";
        String query2 = "DELETE FROM group_role_xref WHERE group_id = ?";
        String query3 = "DELETE FROM security_groups WHERE group_id = ?";
        try
        {
            Connection con = dataSource.getConnection();
            PreparedStatement pstmt1 = con.prepareStatement(query1);
            PreparedStatement pstmt2 = con.prepareStatement(query2);
            PreparedStatement pstmt3 = con.prepareStatement(query3);
            pstmt1.setLong(1, groupId);
            pstmt2.setLong(1, groupId);
            pstmt3.setLong(1, groupId);
            pstmt1.executeUpdate();
            pstmt2.executeUpdate();
            pstmt3.executeUpdate();
            pstmt1.close();
            pstmt2.close();
            pstmt3.close();
            con.close();
        }
        catch(SQLException e)
        {
            throw new GeneralSecurityException("" + e);
        }
    }

    public void addUserToGroup(GroupPrincipal group, UserPrincipal user, TCSubject requestor)
        throws GeneralSecurityException
    {
        try
        {
            long user_group_xrefid = idGenHome.create().nextId();
            long userId = user.getId();
            long groupId = group.getId();
            String query = "INSERT INTO user_group_xref (user_group_id, login_id, group_id) VALUES ( ?, ?, ? )";
            Connection con = dataSource.getConnection();
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setLong(1, user_group_xrefid);
            pstmt.setLong(2, userId);
            pstmt.setLong(3, groupId);
            pstmt.executeUpdate();
            pstmt.close();
            con.close();
        }
        catch(SQLException e)
        {
            throw new GeneralSecurityException("" + e);
        }
        catch(CreateException e)
        {
            throw new GeneralSecurityException("" + e);
        }
        catch(IdGenException e)
        {
            throw new GeneralSecurityException("" + e);
        }
    }

    public void removeUserFromGroup(GroupPrincipal group, UserPrincipal user, TCSubject requestor)
        throws GeneralSecurityException
    {
        long userId = user.getId();
        long groupId = group.getId();
        String query = "DELETE FROM user_group_xref WHERE login_id = ? AND group_id = ?";
        try
        {
            Connection con = dataSource.getConnection();
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setLong(1, userId);
            pstmt.setLong(2, groupId);
            pstmt.executeUpdate();
            pstmt.close();
            con.close();
        }
        catch(SQLException e)
        {
            throw new GeneralSecurityException("" + e);
        }
    }

    public Collection getRoles(TCSubject requestor)
        throws GeneralSecurityException
    {
        Set pl = new HashSet();
        String query = "SELECT role_id, description FROM security_roles";
        try
        {
            Connection con = dataSource.getConnection();
            PreparedStatement pstmt = con.prepareStatement(query);
            ResultSet rs;
            RolePrincipal rp;
            for(rs = pstmt.executeQuery(); rs.next(); pl.add(rp))
                rp = new RolePrincipal(rs.getString(2), rs.getLong(1));

            rs.close();
            pstmt.close();
            con.close();
        }
        catch(SQLException e)
        {
            throw new GeneralSecurityException("SQLException in com.topcoder.security.admin.PrincipalMgrBean.getRoles: " + e.getMessage());
        }
        return pl;
    }

    public RolePrincipal getRole(long id)
        throws GeneralSecurityException, NoSuchRoleException
    {
        String query = "SELECT description FROM security_roles WHERE role_id = ?";
        try
        {
            Connection con = dataSource.getConnection();
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setLong(1, id);
            ResultSet rs = pstmt.executeQuery();
            if(rs.next())
            {
                RolePrincipal rp = new RolePrincipal(rs.getString(1), id);
                rs.close();
                pstmt.close();
                con.close();
                return rp;
            } else
            {
                rs.close();
                pstmt.close();
                con.close();
                throw new NoSuchRoleException("" + id);
            }
        }
        catch(SQLException e)
        {
            throw new GeneralSecurityException("" + e);
        }
    }

    public RolePrincipal createRole(String name, TCSubject requestor)
        throws GeneralSecurityException
    {
        checkLength(name, 254);
        try
        {
            long roleId = idGenHome.create().nextId();
            String query = "INSERT INTO security_roles (role_id, description) VALUES ( ?, ? )";
            Connection con = dataSource.getConnection();
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setLong(1, roleId);
            pstmt.setString(2, name);
            pstmt.executeUpdate();
            pstmt.close();
            con.close();
            RolePrincipal rp = new RolePrincipal(name, roleId);
            return rp;
        }
        catch(SQLException e)
        {
            throw new GeneralSecurityException("" + e);
        }
        catch(CreateException e)
        {
            throw new GeneralSecurityException("" + e);
        }
        catch(IdGenException e)
        {
            throw new GeneralSecurityException("" + e);
        }
    }

    public void removeRole(RolePrincipal role, TCSubject requestor)
        throws GeneralSecurityException
    {
        long roleId = role.getId();
        String query1 = "DELETE FROM group_role_xref WHERE role_id = ?";
        String query2 = "DELETE FROM user_role_xref WHERE role_id = ?";
        String query3 = "DELETE FROM security_perms WHERE role_id = ?";
        String query4 = "DELETE FROM security_roles WHERE role_id = ?";
        try
        {
            Connection con = dataSource.getConnection();
            PreparedStatement pstmt1 = con.prepareStatement(query1);
            PreparedStatement pstmt2 = con.prepareStatement(query2);
            PreparedStatement pstmt3 = con.prepareStatement(query3);
            PreparedStatement pstmt4 = con.prepareStatement(query4);
            pstmt1.setLong(1, roleId);
            pstmt2.setLong(1, roleId);
            pstmt3.setLong(1, roleId);
            pstmt4.setLong(1, roleId);
            pstmt1.executeUpdate();
            pstmt2.executeUpdate();
            pstmt3.executeUpdate();
            pstmt4.executeUpdate();
            pstmt1.close();
            pstmt2.close();
            pstmt3.close();
            pstmt4.close();
            con.close();
        }
        catch(SQLException e)
        {
            throw new GeneralSecurityException("" + e);
        }
    }

    public void assignRole(UserPrincipal user, RolePrincipal role, TCSubject requestor)
        throws GeneralSecurityException
    {
        long userId = user.getId();
        long roleId = role.getId();
        String query = "INSERT INTO user_role_xref (user_role_id, login_id, role_id) VALUES ( ?, ?, ?)";
        try
        {
            long user_role_xrefid = idGenHome.create().nextId();
            Connection con = dataSource.getConnection();
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setLong(1, user_role_xrefid);
            pstmt.setLong(2, userId);
            pstmt.setLong(3, roleId);
            pstmt.executeUpdate();
            pstmt.close();
            con.close();
        }
        catch(SQLException e)
        {
            throw new GeneralSecurityException("" + e);
        }
        catch(CreateException e)
        {
            throw new GeneralSecurityException("" + e);
        }
        catch(IdGenException e)
        {
            throw new GeneralSecurityException("" + e);
        }
    }

    public void unAssignRole(UserPrincipal user, RolePrincipal role, TCSubject requestor)
        throws GeneralSecurityException
    {
        long userId = user.getId();
        long roleId = role.getId();
        String query = "DELETE FROM user_role_xref WHERE login_id = ? AND role_id = ?";
        try
        {
            Connection con = dataSource.getConnection();
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setLong(1, userId);
            pstmt.setLong(2, roleId);
            pstmt.executeUpdate();
            pstmt.close();
            con.close();
        }
        catch(SQLException e)
        {
            throw new GeneralSecurityException("" + e);
        }
    }

    public void assignRole(GroupPrincipal group, RolePrincipal role, TCSubject requestor)
        throws GeneralSecurityException
    {
        long groupId = group.getId();
        long roleId = role.getId();
        String query = "INSERT INTO group_role_xref (group_role_id, group_id, role_id) VALUES ( ?, ?, ? )";
        try
        {
            long group_role_xrefid = idGenHome.create().nextId();
            Connection con = dataSource.getConnection();
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setLong(1, group_role_xrefid);
            pstmt.setLong(2, groupId);
            pstmt.setLong(3, roleId);
            pstmt.executeUpdate();
            pstmt.close();
            con.close();
        }
        catch(SQLException e)
        {
            throw new GeneralSecurityException("" + e);
        }
        catch(CreateException e)
        {
            throw new GeneralSecurityException("" + e);
        }
        catch(IdGenException e)
        {
            throw new GeneralSecurityException("" + e);
        }
    }

    public void unAssignRole(GroupPrincipal group, RolePrincipal role, TCSubject requestor)
        throws GeneralSecurityException
    {
        long groupId = group.getId();
        long roleId = role.getId();
        String query = "DELETE FROM group_role_xref WHERE group_id = ? AND role_id = ?";
        try
        {
            Connection con = dataSource.getConnection();
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setLong(1, groupId);
            pstmt.setLong(2, roleId);
            pstmt.executeUpdate();
            pstmt.close();
            con.close();
        }
        catch(SQLException e)
        {
            throw new GeneralSecurityException("" + e);
        }
    }

    private void checkLength(String param, int maxLength)
        throws GeneralSecurityException
    {
        if(param.length() > maxLength)
            throw new GeneralSecurityException("Parameter <" + param + "> is too long.  Should be <= " + maxLength);
        else
            return;
    }

    static Class _mthclass$(String x0)
    {
        try
        {
            return Class.forName(x0);
        }
        catch(ClassNotFoundException x1)
        {
            throw new NoClassDefFoundError(x1.getMessage());
        }
    }

    private static Logger logger;
    private DataSource dataSource;
    private LocalIdGenHome idGenHome;

    static
    {
        logger = Logger.getLogger(com.topcoder.security.admin.PrincipalMgrBean.class);
    }
}
