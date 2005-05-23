package com.topcoder.common.web.data;

import com.topcoder.shared.docGen.xml.RecordTag;
import com.topcoder.shared.docGen.xml.TagRenderer;
import com.topcoder.shared.docGen.xml.ValueTag;

import java.io.Serializable;
import java.util.ArrayList;


public class Contact
        implements Serializable, TagRenderer, QueryCriteria {

    private int ContactId;
    private int CompanyId;
    private String FirstName;
    private String LastName;
    private String MiddleName;
    private String Address1;
    private String Address2;
    private String City;
    private State State;
    private Country Country;
    private String Zip;
    private String Phone;
    private String Fax;
    private String Email;
    private String Modified;


    public Contact() {
        ContactId = 0;
        CompanyId = 0;
        FirstName = "";
        LastName = "";
        MiddleName = "";
        Address1 = "";
        Address2 = "";
        City = "";
        State = new State();
        Country = new Country();
        Zip = "";
        Phone = "";
        Fax = "";
        Email = "";
        Modified = "";
    }

    public boolean equals(Object obj) {
        boolean result = false;
        Contact other = (Contact) obj;
        if (
                this.getContactId() == other.getContactId()
                && this.getCompanyId() == other.getCompanyId()
                && this.getFirstName().equals(other.getFirstName())
                && this.getLastName().equals(other.getLastName())
                && this.getMiddleName().equals(other.getMiddleName())
                && this.getAddress1().equals(other.getAddress1())
                && this.getAddress2().equals(other.getAddress2())
                && this.getState().equals(other.getState())
                && this.getCountry().equals(other.getCountry())
                && this.getZip().equals(other.getZip())
                && this.getPhone().equals(other.getPhone())
                && this.getFax().equals(other.getFax())
                && this.getEmail().equals(other.getEmail())
        // && this.getModified().equals ( other.getModified() )
        ) {
            result = true;
        }
        return result;
    }

    public ArrayList getCriteria(Object obj) {
        ArrayList result = new ArrayList(23);
        Contact other = (Contact) obj;
        if (this.getContactId() != other.getContactId()) {
            String[] criteria = {"int", "contact", "contact_id", Integer.toString(this.getContactId())};
            result.add(criteria);
        }
        if (this.getCompanyId() != other.getCompanyId()) {
            String[] criteria = {"int", "contact", "company_id", Integer.toString(this.getCompanyId())};
            result.add(criteria);
        }
        if (!this.getFirstName().equals(other.getFirstName())) {
            String[] criteria = {"String", "contact", "first_name", this.getFirstName()};
            result.add(criteria);
        }
        if (!this.getLastName().equals(other.getLastName())) {
            String[] criteria = {"String", "contact", "last_name", this.getLastName()};
            result.add(criteria);
        }
        if (!this.getMiddleName().equals(other.getMiddleName())) {
            String[] criteria = {"String", "contact", "middle_name", this.getMiddleName()};
            result.add(criteria);
        }
        if (!this.getAddress1().equals(other.getAddress1())) {
            String[] criteria = {"String", "contact", "address1", this.getAddress1()};
            result.add(criteria);
        }
        if (!this.getAddress2().equals(other.getAddress2())) {
            String[] criteria = {"String", "contact", "address2", this.getAddress2()};
            result.add(criteria);
        }
        result.addAll(this.getState().getCriteria(other.getState()));
        result.addAll(this.getCountry().getCriteria(other.getCountry()));
        if (!this.getZip().equals(other.getZip())) {
            String[] criteria = {"String", "contact", "zip", this.getZip()};
            result.add(criteria);
        }
        if (!this.getPhone().equals(other.getPhone())) {
            String[] criteria = {"String", "contact", "phone", this.getPhone()};
            result.add(criteria);
        }
        if (!this.getFax().equals(other.getFax())) {
            String[] criteria = {"String", "contact", "fax", this.getFax()};
            result.add(criteria);
        }
        if (!this.getEmail().equals(other.getEmail())) {
            String[] criteria = {"String", "contact", "email", this.getEmail()};
            result.add(criteria);
        }
        result.trimToSize();
        return result;
    }


/*
  public Object clone()
    throws CloneNotSupportedException, OutOfMemoryError {
    Contact result = null;
    try {
      result = new Contact();
      result.setContactId( getContactId() );
      result.setCompanyId( getCompanyId() );
      result.setFirstName( getFirstName() );
      result.setMiddleName( getMiddleName() );
      result.setLastName( getLastName() );
      result.setAddress1( getAddress1() );
      result.setAddress2( getAddress2() );
      result.setCity( getCity() );
      result.setState( (State) getState().clone() );
      result.setCountry( (Country) getCountry().clone() );
      result.setZip( getZip() );
      result.setPhone( getPhone() );
      result.setFax( getFax() );
      result.setEmail( getEmail() );
      result.setModified( getModified() );
    } catch (Exception e) {
      e.printStackTrace();
    }
    return result;
  }
*/


    //Set

    public void setContactId(int ContactId) {
        this.ContactId = ContactId;
    }

    public void setCompanyId(int CompanyId) {
        this.CompanyId = CompanyId;
    }

    public void setFirstName(String FirstName) {
        this.FirstName = FirstName;
    }

    public void setLastName(String LastName) {
        this.LastName = LastName;
    }

    public void setMiddleName(String MiddleName) {
        this.MiddleName = MiddleName;
    }

    public void setAddress1(String Address1) {
        this.Address1 = Address1;
    }

    public void setAddress2(String Address2) {
        this.Address2 = Address2;
    }

    public void setCity(String City) {
        this.City = City;
    }

    public void setState(State State) {
        this.State = State;
    }

    public void setCountry(Country Country) {
        this.Country = Country;
    }

    public void setZip(String Zip) {
        this.Zip = Zip;
    }

    public void setPhone(String Phone) {
        this.Phone = Phone;
    }

    public void setFax(String Fax) {
        this.Fax = Fax;
    }

    public void setEmail(String Email) {
        this.Email = Email;
    }

    public void setModified(String Modified) {
        this.Modified = Modified;
    }


    // Get
    public int getContactId() {
        return ContactId;
    }

    public int getCompanyId() {
        return CompanyId;
    }

    public String getFirstName() {
        return FirstName;
    }

    public String getLastName() {
        return LastName;
    }

    public String getMiddleName() {
        return MiddleName;
    }

    public String getAddress1() {
        return Address1;
    }

    public String getAddress2() {
        return Address2;
    }

    public String getCity() {
        return City;
    }

    public State getState() {
        return State;
    }

    public Country getCountry() {
        return Country;
    }

    public String getZip() {
        return Zip;
    }

    public String getPhone() {
        return Phone;
    }

    public String getFax() {
        return Fax;
    }

    public String getEmail() {
        return Email;
    }

    public String getModified() {
        return Modified;
    }


    public RecordTag getXML() throws Exception {
        RecordTag result = null;
        try {
            result = getXML("Contact");
        } catch (Exception e) {
            throw new Exception("common.Contact:getXML:ERROR:" + e);
        }
        return result;
    }


    public RecordTag getXML(String name) throws Exception {
        RecordTag result = null;
        try {
            result = new RecordTag(name);
            result.addTag(new ValueTag("ContactId", ContactId));
            result.addTag(new ValueTag("CompanyId", CompanyId));
            result.addTag(new ValueTag("FirstName", FirstName));
            result.addTag(new ValueTag("LastName", LastName));
            result.addTag(new ValueTag("MiddleName", MiddleName));
            result.addTag(new ValueTag("Address1", Address1));
            result.addTag(new ValueTag("Address2", Address2));
            result.addTag(new ValueTag("City", City));
            result.addTag(State.getXML());
            result.addTag(Country.getXML());
            result.addTag(new ValueTag("Zip", Zip));
            result.addTag(new ValueTag("Phone", Phone));
            result.addTag(new ValueTag("Fax", Fax));
            result.addTag(new ValueTag("Email", Email));
            result.addTag(new ValueTag("Modified", Modified));
        } catch (Exception e) {
            throw new Exception("common.web.data.Contact:getXML(String):ERROR:" + e);
        }
        return result;
    }

}

