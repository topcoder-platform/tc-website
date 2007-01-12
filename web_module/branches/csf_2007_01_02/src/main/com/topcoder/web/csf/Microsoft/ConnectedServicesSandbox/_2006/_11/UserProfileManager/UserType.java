/**
 * UserType.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis 1.4 Apr 22, 2006 (06:55:48 PDT) WSDL2Java emitter.
 */

package com.topcoder.web.csf.Microsoft.ConnectedServicesSandbox._2006._11.UserProfileManager;

public class UserType implements java.io.Serializable {
    private java.lang.String _value_;
    private static java.util.HashMap _table_ = new java.util.HashMap();

    // Constructor
    protected UserType(java.lang.String value) {
        _value_ = value;
        _table_.put(_value_,this);
    }

    public static final java.lang.String _SiAdmin = "SiAdmin";
    public static final java.lang.String _IsvAdmin = "IsvAdmin";
    public static final java.lang.String _SoAdmin = "SoAdmin";
    public static final java.lang.String _FreelanceDeveloper = "FreelanceDeveloper";
    public static final java.lang.String _PartnerDeveloper = "PartnerDeveloper";
    public static final java.lang.String _TrialGuy = "TrialGuy";
    public static final java.lang.String _SiteAdmin = "SiteAdmin";
    public static final UserType SiAdmin = new UserType(_SiAdmin);
    public static final UserType IsvAdmin = new UserType(_IsvAdmin);
    public static final UserType SoAdmin = new UserType(_SoAdmin);
    public static final UserType FreelanceDeveloper = new UserType(_FreelanceDeveloper);
    public static final UserType PartnerDeveloper = new UserType(_PartnerDeveloper);
    public static final UserType TrialGuy = new UserType(_TrialGuy);
    public static final UserType SiteAdmin = new UserType(_SiteAdmin);
    public java.lang.String getValue() { return _value_;}
    public static UserType fromValue(java.lang.String value)
          throws java.lang.IllegalArgumentException {
        UserType enumeration = (UserType)
            _table_.get(value);
        if (enumeration==null) throw new java.lang.IllegalArgumentException();
        return enumeration;
    }
    public static UserType fromString(java.lang.String value)
          throws java.lang.IllegalArgumentException {
        return fromValue(value);
    }
    public boolean equals(java.lang.Object obj) {return (obj == this);}
    public int hashCode() { return toString().hashCode();}
    public java.lang.String toString() { return _value_;}
    public java.lang.Object readResolve() throws java.io.ObjectStreamException { return fromValue(_value_);}
    public static org.apache.axis.encoding.Serializer getSerializer(
           java.lang.String mechType, 
           java.lang.Class _javaType,  
           javax.xml.namespace.QName _xmlType) {
        return 
          new org.apache.axis.encoding.ser.EnumSerializer(
            _javaType, _xmlType);
    }
    public static org.apache.axis.encoding.Deserializer getDeserializer(
           java.lang.String mechType, 
           java.lang.Class _javaType,  
           javax.xml.namespace.QName _xmlType) {
        return 
          new org.apache.axis.encoding.ser.EnumDeserializer(
            _javaType, _xmlType);
    }
    // Type metadata
    private static org.apache.axis.description.TypeDesc typeDesc =
        new org.apache.axis.description.TypeDesc(UserType.class);

    static {
        typeDesc.setXmlType(new javax.xml.namespace.QName("http://Microsoft/ConnectedServicesSandbox/2006/11/UserProfileManager/", "UserType"));
    }
    /**
     * Return type metadata object
     */
    public static org.apache.axis.description.TypeDesc getTypeDesc() {
        return typeDesc;
    }

}
