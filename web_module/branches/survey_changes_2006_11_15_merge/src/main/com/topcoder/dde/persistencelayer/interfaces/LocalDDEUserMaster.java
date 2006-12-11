package com.topcoder.dde.persistencelayer.interfaces;

import javax.ejb.EJBLocalObject;
import java.sql.Timestamp;

/**
 * The local interface representing the CMP bean for the user_master table.
 *
 * @version     1.0
 * @author      Timur Zambalayev
 */
public interface LocalDDEUserMaster extends EJBLocalObject {

    /**
     * Gets the number of logins.
     *
     * @return number of logins.
     */
    int getNumLogins();

    /**
     * Sets the number of logins.
     *
     * @param numLogins     number of logins.
     */
    void setNumLogins(int numLogins);

    /**
     * Gets the last login time.
     *
     * @return last login time.
     */
    Timestamp getLastLoginTime();

    /**
     * Sets the last login time.
     *
     * @param lastLoginTime     last login time.
     */
    void setLastLoginTime(Timestamp lastLoginTime);


}
