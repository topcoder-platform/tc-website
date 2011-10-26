package com.topcoder.security;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Set;

/**
 * TCSubject represents all of the principals that can be used to resolve
 * permissions.  For the purposes of this application, only roles will be used to
 * resolve permissions. When the user logs into the application, the TCSubject
 * should be populated with all roles that the user is associated with. That will
 * include role assignments to the user and to any user groups that the user is a
 * member.
 *
 * <p>
 * Version 0.2 (Impersonation Login Assembly 1.0) Change notes:
 *   <ol>
 *     <li>Added {@link #impersonatedByUserId} and {@link #impersonatedByUsername} instance fields with respective
 *     accessor/mutator methods.</li>
 *   </ol>
 * </p>
 *
 * @author Heather Van Aelst, isv
 * @version 0.2
 */
public class TCSubject implements Serializable {

    private Set principals;
    private long userid;

    /**
     * <p>A <code>long</code> providing the ID of actual user who have logged on behalf of user mapped to this
     * TCSubject.</p>
     *
     * @since 0.2
     */
    private long impersonatedByUserId;

    /**
     * <p>A <code>String</code> providing the username of actual user who have logged on behalf of user mapped to this
     * TCSubject.</p>
     *
     * @since 0.2
     */
    private String impersonatedByUsername;

    /**
     * Construct a TCSubject.  This represents a user's set of roles.
     *
     * @param principals The list of principals that represent this user's roles.
     *                   principals can be null, but it can not contain null as an
     *                   element.  It can only contain TCPrincipal.
     * @param userid The user's login_id
     */
    public TCSubject(Set principals, long userid) {
        this.principals = new HashSet();
        if (principals != null) {
            Iterator iterator = principals.iterator();
            while (iterator.hasNext()) {
                Object o = iterator.next();
                if (o == null || !(o instanceof TCPrincipal)) {
                    throw new ClassCastException("principals can not contain non TCPrincipal objects or nulls");
                }
                this.principals.add((TCPrincipal) o);
            }
        }
        this.userid = userid;
    }

    /**
     * Construct a TCSubject. This is for user's who have no roles
     *
     * @param userid The user's login_id
     */
    public TCSubject(long userid) {
        this.principals = new HashSet();
        this.userid = userid;
    }

    /**
     * @return Returns a Set of the principals (RolePrincipals) that represent
     *         this user's roles.
     */
    public synchronized Set getPrincipals() {
        Set copy = new HashSet();
        Iterator iterator = principals.iterator();
        while (iterator.hasNext()) {
            copy.add(iterator.next());
        }
        return copy;
    }

    /*
      When a principal is added or removed here should this affect the db?
      If so, why not just call admin.assignRole?  Should this call admin.assignRole?
    */
    /**
     * Add a principal.
     *
     * @param principal TCPrincipal to add to this TCSubject's principals.  Can not
     *                  be null.
     */
    public synchronized void addPrincipal(TCPrincipal principal) {
        if (principal == null) {
            throw new IllegalArgumentException("can not add a null principal");
        }
        principals.add(principal);
    }

    /**
     * Remove a principal.
     *
     * @param principal TCPrincipal to remove from this TCSubject's principals.  Can
     *                  not be null.
     */
    public synchronized void removePrincipal(TCPrincipal principal) {
        if (principal == null) {
            throw new IllegalArgumentException("can not remove a null principal");
        }
        principals.remove(principal);
    }

    /**
     * Return the userid
     *
     * @return Return's this user's id (login_id)
     */
    public long getUserId() {
        return userid;
    }

    /**
     * Set the userid
     *
     * @param userid the user's new id
     */
    public void setUserId(long userid) {
        this.userid = userid;
    }

    /*
     * @return a String representation of this object
     */
    public synchronized String toString() {
        String s = userid + ":";
        Iterator iterator = principals.iterator();
        while (iterator.hasNext()) {
            s += "<" + (TCPrincipal) iterator.next() + ">";
        }
        return s;
    }

    /**
     * Determine if this TCSubject is equal to another Object.  Returns false
     * immediately if that Object is not an instance of TCSubject.  Two
     * TCSubjects are equal if their user ids and principal lists are equal.
     *
     * @param o
     * @return True if this is equal to o, false otherwise.
     */
    public synchronized boolean equals(Object o) {
        if (o instanceof TCSubject) {
            TCSubject t = (TCSubject) o;
            return (t.getUserId() == userid && t.getPrincipals().equals(principals));
        } else {
            return false;
        }
    }

    /**
     * <p>Gets the username of actual user who have logged on behalf of user mapped to this TCSubject.</p>
     *
     * @return a <code>String</code> providing the username of actual user who have logged on behalf of user mapped to
     *         this TCSubject.
     * @since 0.2
     */
    public String getImpersonatedByUsername() {
        return this.impersonatedByUsername;
    }

    /**
     * <p>Sets the username of actual user who have logged on behalf of user mapped to this TCSubject.</p>
     *
     * @param impersonatedByUsername a <code>String</code> providing the username of actual user who have logged on
     *        behalf of user mapped to this TCSubject.
     * @since 0.2
     */
    public void setImpersonatedByUsername(String impersonatedByUsername) {
        this.impersonatedByUsername = impersonatedByUsername;
    }

    /**
     * <p>Gets the ID of actual user who have logged on behalf of user mapped to this TCSubject.</p>
     *
     * @return a <code>long</code> providing the ID of actual user who have logged on behalf of user mapped to this
     *         TCSubject.
     * @since 0.2
     */
    public long getImpersonatedByUserId() {
        return this.impersonatedByUserId;
    }

    /**
     * <p>Sets the ID of actual user who have logged on behalf of user mapped to this TCSubject.</p>
     *
     * @param impersonatedByUserId a <code>long</code> providing the ID of actual user who have logged on behalf of user
     *        mapped to this TCSubject.
     * @since 0.2
     */
    public void setImpersonatedByUserId(long impersonatedByUserId) {
        this.impersonatedByUserId = impersonatedByUserId;
    }
}
