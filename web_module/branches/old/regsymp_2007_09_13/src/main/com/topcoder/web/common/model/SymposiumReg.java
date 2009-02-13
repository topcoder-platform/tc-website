package com.topcoder.web.common.model;

/**
 * Represents a registration for a Software Symposium.
 * 
 * VERY IMPORTANT: remember to update serialVersionUID if needed
 * 
 * @author Cucu
 */
public class SymposiumReg extends Base {

    /**
     * Please change that number if you affect the fields in a way that will affect the
     * serialization for this object, i.e. when data members are changed.
     * @see http://java.sun.com/j2se/1.3/docs/guide/serialization/spec/version.doc7.html
     */
    private static final long serialVersionUID = 1L;

    public final static Integer REG_TYPE_COLLEGIATE_TC = 1;
    public final static Integer REG_TYPE_PROFESSIONAL = 2;
    public final static Integer REG_TYPE_PROFESSIONAL_EARLY = 3;
    
    private Long id;
    private String firstName;
    private String lastName;
    private User user;
    private Boolean professional;
    private String collegeName;
    private String companyName;
    private String phoneNumber;
    private String emailAddress;
    private String address1;
    private String address2;
    private String city;
    private String zip;
    private Country country;
    private Integer registrationType;
    
    public Long getId() {
        return id;
    }
    public void setId(Long id) {
        this.id = id;
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
    public User getUser() {
        return user;
    }
    public void setUser(User user) {
        this.user = user;
    }
    public Boolean getProfessional() {
        return professional;
    }
    public void setProfessional(Boolean professional) {
        this.professional = professional;
    }
    public String getCollegeName() {
        return collegeName;
    }
    public void setCollegeName(String collegeName) {
        this.collegeName = collegeName;
    }
    public String getCompanyName() {
        return companyName;
    }
    public void setCompanyName(String companyName) {
        this.companyName = companyName;
    }
    public String getPhoneNumber() {
        return phoneNumber;
    }
    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }
    public String getEmailAddress() {
        return emailAddress;
    }
    public void setEmailAddress(String emailAddress) {
        this.emailAddress = emailAddress;
    }
    public String getAddress1() {
        return address1;
    }
    public void setAddress1(String address1) {
        this.address1 = address1;
    }
    public String getAddress2() {
        return address2;
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
    public String getZip() {
        return zip;
    }
    public void setZip(String zip) {
        this.zip = zip;
    }
    public Country getCountry() {
        return country;
    }
    public void setCountry(Country country) {
        this.country = country;
    }
    public Integer getRegistrationType() {
        return registrationType;
    }
    public void setRegistrationType(Integer registrationType) {
        this.registrationType = registrationType;
    }    
}
