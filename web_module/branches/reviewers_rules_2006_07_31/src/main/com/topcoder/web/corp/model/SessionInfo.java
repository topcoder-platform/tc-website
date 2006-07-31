package com.topcoder.web.corp.model;

import com.topcoder.shared.security.User;
import com.topcoder.shared.util.logging.Logger;

import java.io.Serializable;
import java.util.Set;

/**
 * Holds some details about the current user for the benefit of curious JSPs.
 */
public class SessionInfo implements Serializable {

    private static Logger log = Logger.getLogger(SessionInfo.class);

    private String handle = null;
    private int userid = -1;  //@@@ should be long
    /** group may be:
     * 'G' guest
     * 'A' admin
     */
    private char group = 'G';

    public SessionInfo() {
    }

    public String getHandle() {
        return handle;
    }

    public void setHandle(String handle) {
        this.handle = handle;
    }

    public int getUserId() {
        return userid;
    }

    public void setUserId(int userid) {
        this.userid = userid;
    }

    public char getGroup() {
        return group;
    }

    public void setGroup(char group) {
        if (0 > "GAU".indexOf(group))
            throw new IllegalArgumentException("no group class '" + group + "'");
        this.group = group;
    }

    public boolean isLoggedIn() {
        return group != 'G';
    }

    public boolean isGuest() {
        return group == 'G';
    }

    public boolean isAdmin() {
        return group == 'A';
    }

    /**
     * This method has all the smarts.  It takes a User object and a
     * Set of Strings listing groups to which the user belongs, and
     * populates all the properties of this bean sensibly from them.
     * For coaches and students, it also uses a database query to get
     * rating and school id.
     */
    public void setAll(User user, Set groups) {

        setUserId((int) user.getId());
        setHandle(user.getUserName());

        if (groups.contains("Admin"))
            setGroup('A');
        else if (groups.contains("Corp User"))
            setGroup('U');
        else {
            setGroup('G');
            setHandle("");  // anonymous looks nameless to the jsps
        }

    }
}
