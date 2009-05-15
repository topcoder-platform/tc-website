package com.topcoder.dde.persistencelayer.bean;

import com.topcoder.dde.persistencelayer.interfaces.LocalDDEContactType;
import com.topcoder.dde.persistencelayer.interfaces.LocalDDEUserMaster;

import javax.ejb.CreateException;

/**
 * The bean implementation class representing the CMP bean for the user_contact table.
 *
 * @version     1.0
 * @author      Timur Zambalayev
 */
public abstract class DDEUserContactBean extends DDEBaseEntityBean {

    /**
     * Creates a new instance.
     */
    public DDEUserContactBean() {
    }

    /**
     * Gets the contact info.
     *
     * @return contact info.
     */
    public abstract String getContactInfo();

    /**
     * Sets the contact info.
     *
     * @param contactInfo   contact info.
     */
    public abstract void setContactInfo(String contactInfo);

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
     * Gets the contact type (CMR).
     *
     * @return contactType.
     */
    public abstract LocalDDEContactType getContactType();

    /**
     * Sets the contact type (CMR).
     *
     * @param contactType   contactType.
     */
    public abstract void setContactType(LocalDDEContactType contactType);

    /**
     * Creates an entity object.
     *
     * @param contactInfo           contact info.
     * @param userMaster            userMaster.
     * @param contactType           contactType.
     * @return the entity bean's primary key (should be null for CMP bean implementations).
     * @throws CreateException      an application level error occurred during the create operation.
     */
    public Long ejbCreate(String contactInfo, LocalDDEUserMaster userMaster, LocalDDEContactType contactType)
            throws CreateException {
        setPrimaryKey();
        setContactInfo(contactInfo);
        return null;
    }

    /**
     * Creates an entity object.
     *
     * @param contactInfo           contact info.
     * @param userMaster            userMaster.
     * @param contactType           contactType.
     */
    public void ejbPostCreate(String contactInfo, LocalDDEUserMaster userMaster, LocalDDEContactType contactType) {
        setUserMaster(userMaster);
        setContactType(contactType);
    }

}
