package com.topcoder.dde.persistencelayer.interfaces;

import javax.ejb.CreateException;
import javax.ejb.EJBLocalHome;
import javax.ejb.FinderException;


public interface LocalDDESampleDownloadHome extends EJBLocalHome {

    /**
     * The EJB reference name.
     */
    public static final String EJB_REF_NAME = "java:comp/env/ejb/DDESampleDownloadEJB";

    /**
     * Creates an entity object.
     *
     * @param key                   the primary key.
     * @param description           description.
     * @return the local interface of the created entity object.
     * @throws CreateException      an application level error occurred during the create operation.
     */
    LocalDDESampleDownload create(String catalog, String firstName, String lastName, String emailAddress, int countryId, int contactMe) throws CreateException;


    LocalDDECompVersionDates findByPrimaryKey(Long key) throws FinderException;


}
