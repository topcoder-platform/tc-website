/**
 * SpecialTypes.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis 1.4 Apr 22, 2006 (06:55:48 PDT) WSDL2Java emitter.
 */

package com.topcoder.web.csf.Microsoft.ConnectedServicesSandbox._2006._11.TeamFoundationServer;

public class SpecialTypes implements java.io.Serializable {
    private java.lang.String _value_;
    private static java.util.HashMap _table_ = new java.util.HashMap();

    // Constructor
    protected SpecialTypes(java.lang.String value) {
        _value_ = value;
        _table_.put(_value_,this);
    }

    public static final java.lang.String _AdministrativeApplicationGroup = "AdministrativeApplicationGroup";
    public static final java.lang.String _EveryoneApplicationGroup = "EveryoneApplicationGroup";
    public static final java.lang.String _Generic = "Generic";
    public static final java.lang.String _LicenseesApplicationGroup = "LicenseesApplicationGroup";
    public static final java.lang.String _ServiceApplicationGroup = "ServiceApplicationGroup";
    public static final SpecialTypes AdministrativeApplicationGroup = new SpecialTypes(_AdministrativeApplicationGroup);
    public static final SpecialTypes EveryoneApplicationGroup = new SpecialTypes(_EveryoneApplicationGroup);
    public static final SpecialTypes Generic = new SpecialTypes(_Generic);
    public static final SpecialTypes LicenseesApplicationGroup = new SpecialTypes(_LicenseesApplicationGroup);
    public static final SpecialTypes ServiceApplicationGroup = new SpecialTypes(_ServiceApplicationGroup);
    public java.lang.String getValue() { return _value_;}
    public static SpecialTypes fromValue(java.lang.String value)
          throws java.lang.IllegalArgumentException {
        SpecialTypes enumeration = (SpecialTypes)
            _table_.get(value);
        if (enumeration==null) throw new java.lang.IllegalArgumentException();
        return enumeration;
    }
    public static SpecialTypes fromString(java.lang.String value)
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
        new org.apache.axis.description.TypeDesc(SpecialTypes.class);

    static {
        typeDesc.setXmlType(new javax.xml.namespace.QName("http://Microsoft/ConnectedServicesSandbox/2006/11/TeamFoundationServer/", "SpecialTypes"));
    }
    /**
     * Return type metadata object
     */
    public static org.apache.axis.description.TypeDesc getTypeDesc() {
        return typeDesc;
    }

}
