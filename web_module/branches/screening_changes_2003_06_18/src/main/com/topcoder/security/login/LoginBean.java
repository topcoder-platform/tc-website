package com.topcoder.security.login;

import java.rmi.RemoteException;
import javax.ejb.EJBException;
import java.sql.*;
import java.util.*;
import com.topcoder.security.*;
import com.topcoder.util.idgenerator.sql.SimpleDataSource;
import javax.naming.Context;
import javax.naming.NamingException;
import javax.naming.InitialContext;
import javax.sql.DataSource;
import org.apache.log4j.Logger;

/**
 * Use for logging users into a system. 
 *
 * @author Heather Van Aelst
 * @version 0.1
 */
public class LoginBean implements javax.ejb.SessionBean {

    private static Logger logger = Logger.getLogger(LoginBean.class);
    private DataSource dataSource;

    public void ejbCreate() throws EJBException {
        try {
            logger.debug("LoginBean.ejbCreate");
            Context context=new InitialContext();
            dataSource = (DataSource) context.lookup("java:comp/env/jdbc/DefaultDS");
        } catch (NamingException e) {
            throw new EJBException("" + e);
        }
    }

    public void ejbRemove() {}
    public void ejbActivate(){}
    public void ejbPassivate(){}
    public void setSessionContext(javax.ejb.SessionContext cntx){}

    /**
     * Logs users into a system.  Checks username and password, returns a 
     * TCSubject representation of the user that includes the user's roles.
     * Encrypts password, compares to stored, encrypted password.
     *
     * @param username 
     * @param password Plain text password
     * @return TCSubject
     * @throws AuthenticationException Thrown when username/password 
     *                                 combination does not exist in the db.
     * @throws GeneralSecurityException Thrown when SLQExcpetion occurs.
     */
    public TCSubject login(String username, String password) 
        throws AuthenticationException, GeneralSecurityException {

        logger.debug("LoginBean.login: " + username);
        
        checkLength(username, SecurityDB.maxUsernameLength);
        checkLength(password, SecurityDB.maxPasswordLength);

        long userId;
        Set pl =  new HashSet();
        
        //encode password
        String encPassword = Util.encodePassword(password, "users");
        
        String query = 
	    "SELECT login_id FROM security_user " +
	    "WHERE user_id = ? AND password = ?";
        
        try {
            
            Connection con =dataSource.getConnection();
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setString(1, username);
            pstmt.setString(2, encPassword);
            ResultSet rs = pstmt.executeQuery();
            
            
            //if this returns a result there was an exact username and password match
            //ResultSet rs = Util.getResults(con, query);
            logger.debug("LoginBean.login got ResultSet");
            
            if (rs.next()) { //was a match
                userId = rs.getLong(1);
                logger.debug("Logging in login_id: " + userId);
            } else { //username and password didn't match or weren't in db
                throw new AuthenticationException("Username and/or password are incorrect");
            }
            rs.close();
            //get user's id and roles
            
            query = 
            "SELECT security_roles.role_id, description " +
            "FROM user_role_xref, security_roles " +
            "WHERE user_role_xref.login_id = ? " +
            "AND user_role_xref.role_id = security_roles.role_id";
            pstmt = con.prepareStatement(query);
            pstmt.setLong(1, userId);
            rs = pstmt.executeQuery();
            
            String query2 = 
            "SELECT security_roles.role_id, description " +
            "FROM security_roles, user_group_xref, group_role_xref " +
            "WHERE user_group_xref.login_id = ? " +
            "AND user_group_xref.group_id = group_role_xref.group_id " +
            "AND group_role_xref.role_id = security_roles.role_id";
            PreparedStatement pstmt2 = con.prepareStatement(query2);
            pstmt2.setLong(1, userId);
            ResultSet rs2 = pstmt2.executeQuery();
 
             //build list of RolePrincipals
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
        } catch (SQLException e) {
            throw new GeneralSecurityException("SQLException in com.topcoder.security.login.LoginBean.login: " + e.getMessage());
        }
        //create TCSubject
        TCSubject sub = new TCSubject(pl, userId);
        return sub;
    }
    
    /**
     * Use this to check the length of a parameter against a defined maximum.
     * For example, compare a submitted username to the length of the username
     * column in the db.  Throws GeneralSecurityException if param is too long.
     *
     * @param param
     * @param maxLength
     */
    private void checkLength(String param, int maxLength) 
        throws GeneralSecurityException {
        
        if (param.length() > maxLength) {
            throw new GeneralSecurityException("Parameter <" + param + "> is too long.  Should be <= " + maxLength);
        }
    }
}
