package com.topcoder.dde.persistencelayer.interfaces;

import javax.ejb.EJBLocalObject;

/**
 * The local interface representing the CMP bean for the user_customer table.
 *
 * @version     1.0
 * @author      Timur Zambalayev
 */
public interface LocalDDEUserCustomer extends EJBLocalObject {

    /**
     * Gets the userMaster (CMR).
     *
     * @return userMaster.
     */
    LocalDDEUserMaster getUserMaster();

    /**
     * Sets the userMaster (CMR).
     *
     * @param userMaster    userMaster.
     */
    void setUserMaster(LocalDDEUserMaster userMaster);

    /**
     * Gets the first name.
     *
     * @return first name.
     */
    String getFirstName();

    /**
     * Sets the first name.
     *
     * @param firstName     first name.
     */
    void setFirstName(String firstName);

    /**
     * Gets the last name.
     *
     * @return last name.
     */
    String getLastName();

    /**
     * Sets the last name.
     *
     * @param lastName  last name.
     */
    void setLastName(String lastName);

    /**
     * Gets the company.
     *
     * @return company.
     */
    String getCompany();

    /**
     * Sets the company.
     *
     * @param company   company.
     */
    void setCompany(String company);

    /**
     * Gets the address.
     *
     * @return address.
     */
    String getAddress();

    /**
     * Sets the address.
     *
     * @param address   address.
     */
    void setAddress(String address);

    /**
     * Gets the city.
     *
     * @return city.
     */
    String getCity();

    /**
     * Sets the city.
     *
     * @param city  city.
     */
    void setCity(String city);

    /**
     * Gets the postal code.
     *
     * @return postal code.
     */
    String getPostalCode();

    /**
     * Sets the postal code.
     *
     * @param postalCode    postal code.
     */
    void setPostalCode(String postalCode);

    /**
     * Gets useComponents.
     *
     * @return useComponents.
     */
    boolean getUseComponents();

    /**
     * Sets useComponents.
     *
     * @param useComponents useComponents.
     */
    void setUseComponents(boolean useComponents);

    /**
     * Gets the useConsultants.
     *
     * @return useConsultants.
     */
    boolean getUseConsultants();

    /**
     * Sets the useConsultants.
     *
     * @param useConsultants    useConsultants.
     */
    void setUseConsultants(boolean useConsultants);

    /**
     * Gets whether wants to receive TCS news.
     *
     * @return receive TCS news.
     */
    boolean getReceiveTcsnews();

    /**
     * Sets whether wants to receive TCS news.
     *
     * @param receiveTcsnews    receive TCS news.
     */
    void setReceiveTcsnews(boolean receiveTcsnews);

    /**
     * Gets whether wants to receive the news HTML.
     *
     * @return whether wants to receive the news HTML.
     */
    boolean getReceiveNewshtml();

    /**
     * Sets whether wants to receive the news HTML.
     *
     * @param receiveNewshtml   whether wants to receive the news HTML.
     */
    void setReceiveNewshtml(boolean receiveNewshtml);

    /**
     * Gets the telephone country.
     *
     * @return telephone country.
     */
    String getTelephoneCountry();

    /**
     * Sets the telephone country.
     *
     * @param telephoneCountry  telophone country.
     */
    void setTelephoneCountry(String telephoneCountry);

    /**
     * Gets the telephone area.
     *
     * @return telephone area.
     */
    String getTelephoneArea();

    /**
     * Sets the telephone area.
     *
     * @param telephoneArea     telephone area.
     */
    void setTelephoneArea(String telephoneArea);

    /**
     * Gets the telephone number.
     *
     * @return telephone number.
     */
    String getTelephoneNbr();

    /**
     * Sets the telephone number.
     *
     * @param telephoneNbr  telephone number.
     */
    void setTelephoneNbr(String telephoneNbr);

    /**
     * Gets the countryCodes (CMR).
     *
     * @return countryCodes.
     */
    LocalDDECountryCodes getCountryCodes();

    /**
     * Sets the countryCodes (CMR).
     *
     * @param countryCodes  countryCodes.
     */
    void setCountryCodes(LocalDDECountryCodes countryCodes);

    /**
     * Gets the companySize (CMR).
     *
     * @return companySize
     */
    LocalDDECompanySize getCompanySize();

    /**
     * Sets the companySize (CMR).
     *
     * @param companySize   companySize.
     */
    void setCompanySize(LocalDDECompanySize companySize);

    /**
     * Gets the priceTiers (CMR).
     *
     * @return priceTiers.
     */
    LocalDDEPriceTiers getPriceTiers();

    /**
     * Sets the priceTiers (CMR).
     *
     * @param priceTiers    priceTiers.
     */
    void setPriceTiers(LocalDDEPriceTiers priceTiers);

    /**
     * Gets the email address.
     *
     * @return email address.
     */
    String getEmailAddress();

    /**
     * Sets the email address.
     *
     * @param emailAddress  email address.
     */
    void setEmailAddress(String emailAddress);

    /**
     * Gets the activation code.
     *
     * @return activation code.
     */
    String getActivationCode();

    /**
     * Sets the activation code.
     *
     * @param activationCode    activation code.
     */
    void setActivationCode(String activationCode);

}
