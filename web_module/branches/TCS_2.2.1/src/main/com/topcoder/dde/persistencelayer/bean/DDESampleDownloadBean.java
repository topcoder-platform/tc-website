package com.topcoder.dde.persistencelayer.bean;

import javax.ejb.CreateException;

/**
 * The bean implementation class representing the CMP bean for the sample download
 *
 * @version     1.0
 * @author      David Messinger
 */
public abstract class DDESampleDownloadBean extends DDEBaseEntityBean {

    /**
     * Creates a new instance.
     */
    public DDESampleDownloadBean() {
    }

    public abstract String getCatalog();


    public abstract void setCatalog(String catalog);

    public abstract int getContactMe();

    public abstract void setContactMe(int contactMe);

    public abstract int getCountryId();

    public abstract void setCountryId(int contactMe);

    public abstract String getFirstName();

    public abstract void setFirstName(String firstName);


    public abstract String getLastName();

    public abstract void setLastName(String lastName);

    public abstract String getEmailAddress();

    public abstract void setEmailAddress(String emailAddress);

    public Long ejbCreate(String catalog, String firstName, String lastName, String emailAddress, int countryId, int contactMe) throws CreateException {
        setPrimaryKey();
        setCatalog(catalog);
        setFirstName(firstName);
        setLastName(lastName);
        setEmailAddress(emailAddress);
        setCountryId(countryId);
        setContactMe(contactMe);
        return null;
    }


    public void ejbPostCreate(String catalog, String firstName, String lastName, String emailAddress, int countryId, int contactMe) throws CreateException {
    }
}
