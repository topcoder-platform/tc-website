/**
 * Accessibility.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis 1.4 Apr 22, 2006 (06:55:48 PDT) WSDL2Java emitter.
 */

package com.topcoder.web.csf.Microsoft.ConnectedServicesSandbox._2006._11.SandboxApi;

public class Accessibility implements java.io.Serializable {
    private java.lang.String _value_;
    private static java.util.HashMap _table_ = new java.util.HashMap();

    // Constructor
    protected Accessibility(java.lang.String value) {
        _value_ = value;
        _table_.put(_value_,this);
    }

    public static final java.lang.String _Public = "Public";
    public static final java.lang.String _Private = "Private";
    public static final java.lang.String _Internal = "Internal";
    public static final Accessibility Public = new Accessibility(_Public);
    public static final Accessibility Private = new Accessibility(_Private);
    public static final Accessibility Internal = new Accessibility(_Internal);
    public java.lang.String getValue() { return _value_;}
    public static Accessibility fromValue(java.lang.String value)
          throws java.lang.IllegalArgumentException {
        Accessibility enumeration = (Accessibility)
            _table_.get(value);
        if (enumeration==null) throw new java.lang.IllegalArgumentException();
        return enumeration;
    }
    public static Accessibility fromString(java.lang.String value)
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
        new org.apache.axis.description.TypeDesc(Accessibility.class);

    static {
        typeDesc.setXmlType(new javax.xml.namespace.QName("http://Microsoft/ConnectedServicesSandbox/2006/11/SandboxApi/", "Accessibility"));
    }
    /**
     * Return type metadata object
     */
    public static org.apache.axis.description.TypeDesc getTypeDesc() {
        return typeDesc;
    }

}
