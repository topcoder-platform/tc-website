package com.topcoder.web.forums.model;

import com.jivesoftware.base.Log;
import com.jivesoftware.base.UserNotFoundException;
import com.jivesoftware.base.ext.SimpleUserAdapter;

import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;

/**
 * User: dok
 * Date: Nov 23, 2004
 * Time: 12:04:35 PM
 */
public class TCUser extends SimpleUserAdapter {

	/**
	 * TC-specific fields
	 */
	private String imagePath;
	public String getImagePath() {
		return imagePath;
	}

    /**
     * Load a user by id.
     *
     * @param id the user id.
     * @param dataSource data source connected to the database that contains the
     *      user information.
     * @throws UserNotFoundException if the user could not be loaded.
     */
    public TCUser(long id, DataSource dataSource) throws UserNotFoundException {
        if (id < 1 && id != -1) {// if they're our anonymous user then, they're ok
            throw new UserNotFoundException();
        }
        this.ID = id;
        loadFromDb(dataSource);
    }

    /**
     * Load a user by username.
     *
     * @param username the username.
     * @param dataSource data source connected to the database that contains the
     *      user information.
     * @throws UserNotFoundException if the user could not be loaded.
     */
    public TCUser(String username, DataSource dataSource) throws UserNotFoundException {
        if (username == null) {
            throw new UserNotFoundException("Username is null");
        }
        this.username = username;
        loadFromDb(dataSource);
    }

    /**
     * Loads the user_id, handle and email address for the user
     *
     * @param dataSource data source connected to the database that contains the
     *      user information.
     * @throws UserNotFoundException if the user could not be loaded.
     */
    private void loadFromDb(DataSource dataSource) throws UserNotFoundException {

    	final String QUERY =
        	" select u.email " +
	        	" , u.user_id " +
				" , u.handle " +
				" , c.member_since " +
				" , p.path || i.file_name as image_path " +
			" from user u, coder c, outer(coder_image_xref x, image i, path p) " +
			" where u.user_id = c.coder_id " +
				" and u.user_id = x.coder_id " +
				" and x.image_id = i.image_id " +
				" and i.path_id = p.path_id " +
				" and i.image_type_id = 1 ";

        final String FIND_BY_ID =
                QUERY +
                " and u.user_id = ? ";

        final String FIND_BY_HANDLE =
                QUERY +
                   " and u.handle_lower = ? ";

        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            con = dataSource.getConnection();
            if (ID > 0) {
                pstmt = con.prepareStatement(FIND_BY_ID);
                pstmt.setLong(1, ID);
                //System.out.println("query: " + FIND_BY_ID);
            } else {
                pstmt = con.prepareStatement(FIND_BY_HANDLE);
                pstmt.setString(1, username.toLowerCase());
                //System.out.println("query: " + FIND_BY_HANDLE);
            }
            rs = pstmt.executeQuery();

            if (!rs.next()) {
                throw new UserNotFoundException();
            }
            this.ID = rs.getLong("user_id");
            this.username = rs.getString("handle");
            //we're not releasing anyone's name, so we'll just let the field go unset.
            //this.name = rs.getString("firstName") + " " + rs.getString("lastName");
            this.email = rs.getString("email");
            this.creationDate = rs.getDate("member_since");
            this.imagePath = rs.getString("image_path");
            //System.out.println("ID: " + this.ID + " | username: " + this.username +
            //		" | email: " + this.email + " | creationDate: " + this.creationDate +
			//		" | imagePath: " + this.imagePath);
        } catch (SQLException sqle) {
        	sqle.printStackTrace();
            Log.error(sqle);
        } finally {
            Common.close(rs);
            Common.close(pstmt);
            Common.close(con);
        }
    }


    /**
     * Our implementation of this method will simply return <code>true</code>.
     * This means that none of the setter methods on a <code>com.jivesoftware.base.User</code>
     * are available.  We don't want jive modifying any of the user attributes anyway.
     * @return
     */
    public boolean isReadOnly() {
        return true;
    }

    /**
     * Our implementation of this method will simply return <code>true</code>.
     * I suspect properties at the user level may be of some value as we're
     * building the front end.
     * @return
     */
    public boolean isPropertyEditSupported() {
        return true;
    }

    /**
     * Nope, nobody can see modification date.  Doesn't
     * really make sense for us right now anyway.
     * @return
     */
    public Date getModificationDate() {
        throw new UnsupportedOperationException();
    }

    /**
     * We don't let anyone see email addresses.
     * @return <code>false</code> always
     */
    public boolean isEmailVisible() {
        return false;
    }

    /**
     * We don't let anyone see names.
     * @return <code>false</code> always
     */
    public boolean isNameVisible() {
        return false;
    }

    public String getProperty(String name) {
    	if (name.equals("imagePath")) {
    		return getImagePath();
    	}
    	return super.getProperty(name);
    }
}
