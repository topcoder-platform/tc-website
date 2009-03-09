package com.topcoder.dde.persistencelayer.bean;

import javax.ejb.CreateException;
import java.sql.Timestamp;

/**
 * The bean implementation class representing the CMP bean for the user_master table.
 *
 * @version     1.0
 * @author      Timur Zambalayev
 */
public abstract class DDEUserMasterBean extends DDEBaseEntityBean {

    /**
     * Creates a new instance.
     */
    public DDEUserMasterBean() {
    }

    /**
     * Gets the number of logins.
     *
     * @return number of logins.
     */
    public abstract int getNumLogins();

    /**
     * Sets the number of logins.
     *
     * @param numLogins     number of logins.
     */
    public abstract void setNumLogins(int numLogins);

    /**
     * Gets the last login time.
     *
     * @return last login time.
     */
    public abstract Timestamp getLastLoginTime();

    /**
     * Sets the last login time.
     *
     * @param lastLoginTime     last login time.
     */
    public abstract void setLastLoginTime(Timestamp lastLoginTime);

    /**
     * Creates an entity object.
     *
     * @param loginId               login id.
     * @param lastLoginTime         last login time.
     * @param numLogins             number of logins.
     * @param statusId              status id.
     * @return the entity bean's primary key (should be null for CMP bean implementations).
     * @throws CreateException      an application level error occurred during the create operation.
     */
    public Long ejbCreate(long loginId, Timestamp lastLoginTime, int numLogins) throws CreateException {
        setPrimaryKey(loginId);
        setLastLoginTime(lastLoginTime);
        setNumLogins(numLogins);
        return null;
    }

    /**
     * Creates an entity object.
     *
     * @param loginId               login id.
     * @param lastLoginTime         last login time.
     * @param numLogins             number of logins.
     * @param statusId              status id.
     */
    public void ejbPostCreate(long loginId, Timestamp lastLoginTime, int numLogins) {
    }

}
