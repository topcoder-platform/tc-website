package com.topcoder.dde.persistencelayer.bean;

import com.topcoder.dde.persistencelayer.interfaces.LocalDDECompanySize;
import com.topcoder.dde.persistencelayer.interfaces.LocalDDECountryCodes;
import com.topcoder.dde.persistencelayer.interfaces.LocalDDEPriceTiers;
import com.topcoder.dde.persistencelayer.interfaces.LocalDDEUserMaster;

import javax.ejb.CreateException;

/**
 * The bean implementation class representing the CMP bean for the user_customer table.
 *
 * @version     1.0
 * @author      Timur Zambalayev
 */
public abstract class DDEUserCustomerBean extends DDEBaseEntityBean {

    /**
     * Creates a new instance.
     */
    public DDEUserCustomerBean() {
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
     * Gets the first name.
     *
     * @return first name.
     */
    public abstract String getFirstName();

    /**
     * Sets the first name.
     *
     * @param firstName     first name.
     */
    public abstract void setFirstName(String firstName);

    /**
     * Gets the last name.
     *
     * @return last name.
     */
    public abstract String getLastName();

    /**
     * Sets the last name.
     *
     * @param lastName  last name.
     */
    public abstract void setLastName(String lastName);

    /**
     * Gets the company.
     *
     * @return company.
     */
    public abstract String getCompany();

    /**
     * Sets the company.
     *
     * @param company   company.
     */
    public abstract void setCompany(String company);

    /**
     * Gets the address.
     *
     * @return address.
     */
    public abstract String getAddress();

    /**
     * Sets the address.
     *
     * @param address   address.
     */
    public abstract void setAddress(String address);

    /**
     * Gets the city.
     *
     * @return city.
     */
    public abstract String getCity();

    /**
     * Sets the city.
     *
     * @param city  city.
     */
    public abstract void setCity(String city);

    /**
     * Gets the postal code.
     *
     * @return postal code.
     */
    public abstract String getPostalCode();

    /**
     * Sets the postal code.
     *
     * @param postalCode    postal code.
     */
    public abstract void setPostalCode(String postalCode);

    /**
     * Gets the telephone country.
     *
     * @return telephone country.
     */
    public abstract String getTelephoneCountry();

    /**
     * Sets the telephone country.
     *
     * @param telephoneCountry  telophone country.
     */
    public abstract void setTelephoneCountry(String telephoneCountry);

    /**
     * Gets the telephone area.
     *
     * @return telephone area.
     */
    public abstract String getTelephoneArea();

    /**
     * Sets the telephone area.
     *
     * @param telephoneArea     telephone area.
     */
    public abstract void setTelephoneArea(String telephoneArea);

    /**
     * Gets the telephone number.
     *
     * @return telephone number.
     */
    public abstract String getTelephoneNbr();

    /**
     * Sets the telephone number.
     *
     * @param telephoneNbr  telephone number.
     */
    public abstract void setTelephoneNbr(String telephoneNbr);

    /**
     * Gets useComponents.
     *
     * @return useComponents.
     */
    public abstract boolean getUseComponents();

    /**
     * Sets useComponents.
     *
     * @param useComponents useComponents.
     */
    public abstract void setUseComponents(boolean useComponents);

    /**
     * Gets the useConsultants.
     *
     * @return useConsultants.
     */
    public abstract boolean getUseConsultants();

    /**
     * Sets the useConsultants.
     *
     * @param useConsultants    useConsultants.
     */
    public abstract void setUseConsultants(boolean useConsultants);

    /**
     * Gets whether wants to receive TCS news.
     *
     * @return receive TCS news.
     */
    public abstract boolean getReceiveTcsnews();

    /**
     * Sets whether wants to receive TCS news.
     *
     * @param receiveTcsnews    receive TCS news.
     */
    public abstract void setReceiveTcsnews(boolean receiveTcsnews);

    /**
     * Gets whether wants to receive the news HTML.
     *
     * @return whether wants to receive the news HTML.
     */
    public abstract boolean getReceiveNewshtml();

    /**
     * Sets whether wants to receive the news HTML.
     *
     * @param receiveNewshtml   whether wants to receive the news HTML.
     */
    public abstract void setReceiveNewshtml(boolean receiveNewshtml);

    /**
     * Gets the activation code.
     *
     * @return activation code.
     */
    public abstract String getActivationCode();

    /**
     * Sets the activation code.
     *
     * @param activationCode    activation code.
     */
    public abstract void setActivationCode(String activationCode);

    /**
     * Gets the email address.
     *
     * @return email address.
     */
    public abstract String getEmailAddress();

    /**
     * Sets the email address.
     *
     * @param emailAddress  email address.
     */
    public abstract void setEmailAddress(String emailAddress);

    /**
     * Gets the countryCodes (CMR).
     *
     * @return countryCodes.
     */
    public abstract LocalDDECountryCodes getCountryCodes();

    /**
     * Sets the countryCodes (CMR).
     *
     * @param countryCodes  countryCodes.
     */
    public abstract void setCountryCodes(LocalDDECountryCodes countryCodes);

    /**
     * Gets the companySize (CMR).
     *
     * @return companySize
     */
    public abstract LocalDDECompanySize getCompanySize();

    /**
     * Sets the companySize (CMR).
     *
     * @param companySize   companySize.
     */
    public abstract void setCompanySize(LocalDDECompanySize companySize);

    /**
     * Gets the priceTiers (CMR).
     *
     * @return priceTiers.
     */
    public abstract LocalDDEPriceTiers getPriceTiers();

    /**
     * Sets the priceTiers (CMR).
     *
     * @param priceTiers    priceTiers.
     */
    public abstract void setPriceTiers(LocalDDEPriceTiers priceTiers);

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
     * @return the entity bean's primary key (should be null for CMP bean implementations).
     * @throws CreateException      an application level error occurred during the create operation.
     */
    public Long ejbCreate(String firstName, String lastName, String company, String address, String city, String postalCode,
                          String telephoneCountry, String telephoneArea, String telephoneNbr, boolean useComponents, boolean useConsultants,
                          boolean receiveTcsnews, boolean receiveNewshtml, String activationCode, String emailAddress,
                          LocalDDEUserMaster userMaster, LocalDDECountryCodes countryCodes, LocalDDECompanySize companySize,
                          LocalDDEPriceTiers priceTiers) throws CreateException {
        setPrimaryKey();
        setFirstName(firstName);
        setLastName(lastName);
        setCompany(company);
        setAddress(address);
        setCity(city);
        setPostalCode(postalCode);
        setTelephoneCountry(telephoneCountry);
        setTelephoneArea(telephoneArea);
        setTelephoneNbr(telephoneNbr);
        setUseComponents(useComponents);
        setUseConsultants(useConsultants);
        setReceiveTcsnews(receiveTcsnews);
        setReceiveNewshtml(receiveNewshtml);
        setActivationCode(activationCode);
        setEmailAddress(emailAddress);
        return null;
    }

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
     */
    public void ejbPostCreate(String firstName, String lastName, String company, String address, String city, String postalCode,
                              String telephoneCountry, String telephoneArea, String telephoneNbr, boolean useComponents, boolean useConsultants,
                              boolean receiveTcsnews, boolean receiveNewshtml, String activationCode, String emailAddress,
                              LocalDDEUserMaster userMaster, LocalDDECountryCodes countryCodes, LocalDDECompanySize companySize,
                              LocalDDEPriceTiers priceTiers) {
        setUserMaster(userMaster);
        setCountryCodes(countryCodes);
        setCompanySize(companySize);
        setPriceTiers(priceTiers);
    }

}
