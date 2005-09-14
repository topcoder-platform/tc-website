package com.topcoder.dde.persistencelayer.interfaces;

import javax.ejb.CreateException;
import javax.ejb.EJBLocalHome;
import javax.ejb.FinderException;

/**
 * The local home interface representing the CMP bean for the user_customer table.
 *
 * @version     1.0
 * @author      Timur Zambalayev
 */
public interface LocalDDEUserCustomerHome extends EJBLocalHome {

    /**
     * The EJB reference name.
     */
    public static final String EJB_REF_NAME = "java:comp/env/ejb/DDEUserCustomerEJB";

    /**
     * Locates an entity object using a primary key.
     *
     * @param key                   the primary key value to find.
     * @return the local interface that represents an entity object.
     * @throws FinderException      an application level error occurred during the find operation.
     */
    LocalDDEUserCustomer findByPrimaryKey(Long key) throws FinderException;

    /**
     * Creates an entity object.
     *
     * @param firstName             first name.
     * @param lastName              last name.
     * @param company               company.
     * @param address               address.
     * @param city                  city.
     * @param postalCode            postal code.
     * @param telephoneCountry      telephone country.
     * @param telephoneArea         telephone area.
     * @param telephoneNbr          telephone number.
     * @param useComponents         whether use components.
     * @param useConsultants        whether use consultants.
     * @param receiveTcsnews        whether receive TC news.
     * @param receiveNewshtml       whether receive news HTML.
     * @param activationCode        activation code.
     * @param emailAddress          email address.
     * @param userMaster            userMaster.
     * @param countryCodes          countryCodes.
     * @param companySize           companySize.
     * @param priceTiers            priceTiers.
     * @return the local interface of the created entity object.
     * @throws CreateException      an application level error occurred during the create operation.
     */
    LocalDDEUserCustomer create(String firstName, String lastName, String company, String address, String city, String postalCode,
                                String telephoneCountry, String telephoneArea, String telephoneNbr, boolean useComponents, boolean useConsultants,
                                boolean receiveTcsnews, boolean receiveNewshtml, String activationCode, String emailAddress,
                                LocalDDEUserMaster userMaster, LocalDDECountryCodes countryCodes, LocalDDECompanySize companySize,
                                LocalDDEPriceTiers priceTiers) throws CreateException;

    /**
     * Returns a instance of LocalDDEUserCustomer with the given login id.
     *
     * @param loginId               login id.
     * @return a local interface (LocalDDEUserCustomer).
     * @throws FinderException      an application level error occurred during the find operation.
     */
    LocalDDEUserCustomer findByLoginId(long loginId) throws FinderException;

    /**
     * Returns a instance of LocalDDEUserCustomer with the given activation code.
     *
     * @param activationCode        activation code.
     * @return a local interface (LocalDDEUserCustomer).
     * @throws FinderException      an application level error occurred during the find operation.
     */
    LocalDDEUserCustomer findByActivationCode(String activationCode) throws FinderException;

}
