package com.topcoder.dde.persistencelayer.bean;

import com.topcoder.dde.persistencelayer.interfaces.LocalDDEUserMaster;

import javax.ejb.CreateException;

/**
 * The bean implementation class representing the CMP bean for the user_member table.
 *
 * @version     1.0
 * @author      Timur Zambalayev
 */
public abstract class DDEUserMemberBean extends DDEBaseEntityBean {

    /**
     * Creates a new instance.
     */
    public DDEUserMemberBean() {
    }

    /**
     * Gets the userMaster (CMR).
     *
     * @return userMaster.
     */
    public abstract LocalDDEUserMaster getUserMaster();

    /**
     * Sets the userMaster (CMR).
     *
     * @param userMaster    userMaster.
     */
    public abstract void setUserMaster(LocalDDEUserMaster userMaster);

    /**
     * Gets the TC rating.
     *
     * @return TC rating.
     */
    public abstract int getTcRating();

    /**
     * Sets the TC rating.
     *
     * @param tcRating  TC rating.
     */
    public abstract void setTcRating(int tcRating);

    /**
     * Gets the TCS rating.
     *
     * @return TCS rating.
     */
    public abstract int getTcsRating();

    /**
     * Sets the TCS rating.
     *
     * @param tcsRating     TCS rating.
     */
    public abstract void setTcsRating(int tcsRating);

    /**
     * Creates an entity object.
     *
     * @param tcRating              TC rating.
     * @param tcsRating             TCS rating.
     * @param userMaster            userMaster.
     * @return the entity bean's primary key (should be null for CMP bean implementations).
     * @throws CreateException      an application level error occurred during the create operation.
     */
    public Long ejbCreate(int tcRating, int tcsRating, LocalDDEUserMaster userMaster) throws CreateException {
        setPrimaryKey();
        setTcRating(tcRating);
        setTcsRating(tcsRating);
        return null;
    }

    /**
     * Creates an entity object.
     *
     * @param tcRating              TC rating.
     * @param tcsRating             TCS rating.
     * @param userMaster            userMaster.
     */
    public void ejbPostCreate(int tcRating, int tcsRating, LocalDDEUserMaster userMaster) {
        setUserMaster(userMaster);
    }

}
