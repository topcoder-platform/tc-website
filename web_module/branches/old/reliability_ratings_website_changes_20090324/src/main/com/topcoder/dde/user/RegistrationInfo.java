package com.topcoder.dde.user;

import java.io.Serializable;
import java.util.Collection;
import java.util.Vector;

/**
 * The initial information collected from every user at registration: a username
 * and an email address.  In the database this information is in user_master
 * and user_contact.  Those in turn require contact_type and status.
 *
 * @author Heather Van Aelst
 * @version 1.0
 */
public class RegistrationInfo implements Serializable {

    private String username;
    private String password;
    private String email;
    private String firstName;
    private String lastName;
    private String company;
    private String address;
    private String address2;
    private String city;
    private String state;
    private String postalcode;
    private String phoneCountry;
    private String phoneArea;
    private String phoneNumber;
    private boolean useComponents;
    private boolean useConsultants;
    private boolean receiveNews;
    private boolean newsInHtml;
    private long companySize;
    private Collection technologies;  //a collection of UserTechnology objects
    private PricingTier pricingTier;
    private long countryCode;

    /*
     * Note on companySize:
     * companySize is represents one of the following ranges:
     * 1: 1-20
     * 2: 21-50
     * 3: 51-100
     * 4: 101-500
     * 5: 501-1000
     * 6: 1001+
     */

    public RegistrationInfo() {
        technologies = new Vector();
    }

    //Simple getter and setter methods

    /**
     * Get username
     *
     * @return a String username
     */
    public String getUsername() {
        return username;
    }

    /**
     * Set username
     *
     * @param username
     */
    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    /**
     * Get email address
     *
     * @return a String email address
     */
    public String getEmail() {
        return email;
    }

    /**
     * Set email address
     *
     * @param email
     */
    public void setEmail(String email) {
        this.email = email;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getCompany() {
        return company;
    }

    public void setCompany(String company) {
        this.company = company;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }


    public String getAddress() {
        return address;
    }

    public String getAddress2() {
        return address2;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public void setAddress2(String address2) {
        this.address2 = address2;
    }


    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getPostalcode() {
        return postalcode;
    }

    public void setPostalcode(String postalcode) {
        this.postalcode = postalcode;
    }

    public String getPhoneCountry() {
        return phoneCountry;
    }

    public void setPhoneCountry(String phoneCountry) {
        this.phoneCountry = phoneCountry;
    }

    public String getPhoneArea() {
        return phoneArea;
    }

    public void setPhoneArea(String phoneArea) {
        this.phoneArea = phoneArea;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public boolean getUseComponents() {
        return useComponents;
    }

    public void setUseComponents(boolean useComponents) {
        this.useComponents = useComponents;
    }

    public boolean getUseConsultants() {
        return useConsultants;
    }

    public void setUseConsultants(boolean useConsultants) {
        this.useConsultants = useConsultants;
    }

    public boolean getReceiveNews() {
        return receiveNews;
    }

    public void setReceiveNews(boolean receiveNews) {
        this.receiveNews = receiveNews;
    }

    public boolean getNewsInHtml() {
        return newsInHtml;
    }

    public void setNewsInHtml(boolean newsInHtml) {
        this.newsInHtml = newsInHtml;
    }

    public long getCompanySize() {
        return companySize;
    }

    public void setCompanySize(long companySize) {
        this.companySize = companySize;
    }

    public Collection getTechnologies() {
        return technologies;
    }

    public void setTechnologies(Collection technologies) {
        this.technologies = technologies;
    }

    /**
     * Get this user's PricingTier
     *
     * @return a PricingTier object
     */
    public PricingTier getPricingTier() {
        return pricingTier;
    }

    /**
     * Set this user's PricingTier
     *
     * @param pricingTier
     */
    public void setPricingTier(PricingTier pricingTier) {
        this.pricingTier = pricingTier;
    }

    public long getCountryCode() {
        return countryCode;
    }

    public void setCountryCode(long countryCode) {
        this.countryCode = countryCode;
    }

    /**
     * Make sure that a RegistrationInfo is valid.  It is valid if all
     * of it's atttributes are not null.
     *
     * @return True if it is valid, false otherwise.
     */
    public boolean isValid() {

        return (username != null &&
                password != null &&
                email != null &&
                firstName != null &&
                lastName != null &&
                company != null &&
                address != null &&
                city != null &&
                postalcode != null &&
                phoneCountry != null &&
                phoneArea != null &&
                phoneNumber != null);
    }

}
