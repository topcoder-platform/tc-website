package com.topcoder.dde.persistencelayer.bean;

import com.topcoder.dde.persistencelayer.interfaces.LocalDDETechnologyTypes;
import com.topcoder.dde.persistencelayer.interfaces.LocalDDEUserMaster;

import javax.ejb.CreateException;

/**
 * The bean implementation class representing the CMP bean for the user_technologies table.
 *
 * @version     1.0
 * @author      Timur Zambalayev
 */
public abstract class DDEUserTechnologiesBean extends DDEBaseEntityBean {

    /**
     * Creates a new instance.
     */
    public DDEUserTechnologiesBean() {
    }

    /**
     * Gets the rating.
     *
     * @return rating.
     */
    public abstract int getRating();

    /**
     * Sets the rating.
     *
     * @param rating    rating.
     */
    public abstract void setRating(int rating);

    /**
     * Gets the months.
     *
     * @return months.
     */
    public abstract int getMonths();

    /**
     * Sets the months.
     *
     * @param months    months.
     */
    public abstract void setMonths(int months);

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
     * Gets the technologyTypes (CMR).
     *
     * @return technologyTypes.
     */
    public abstract LocalDDETechnologyTypes getTechnologyTypes();

    /**
     * Sets the technologyTypes (CMR).
     *
     * @param technologyTypes   technologyTypes.
     */
    public abstract void setTechnologyTypes(LocalDDETechnologyTypes technologyTypes);

    /**
     * Creates an entity object.
     *
     * @param rating                rating.
     * @param months                months.
     * @param userMaster            userMaster.
     * @param technologyTypes       technologyTypes.
     * @return the entity bean's primary key (should be null for CMP bean implementations).
     * @throws CreateException      an application level error occurred during the create operation.
     */
    public Long ejbCreate(int rating, int months, LocalDDEUserMaster userMaster, LocalDDETechnologyTypes technologyTypes)
            throws CreateException {
        setPrimaryKey();
        setRating(rating);
        setMonths(months);
        return null;
    }

    /**
     * Creates an entity object.
     *
     * @param rating                rating.
     * @param months                months.
     * @param userMaster            userMaster.
     * @param technologyTypes       technologyTypes.
     */
    public void ejbPostCreate(int rating, int months, LocalDDEUserMaster userMaster, LocalDDETechnologyTypes technologyTypes) {
        setUserMaster(userMaster);
        setTechnologyTypes(technologyTypes);
    }

}
