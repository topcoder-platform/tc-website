/**
 * AccountState.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis 1.4 Apr 22, 2006 (06:55:48 PDT) WSDL2Java emitter.
 */

package com.topcoder.web.csf.Microsoft.ConnectedServicesSandbox._2006._11.UserProfileManager;

public class AccountState implements java.io.Serializable {
    private java.lang.String _value_;
    private static java.util.HashMap _table_ = new java.util.HashMap();

    // Constructor
    protected AccountState(java.lang.String value) {
        _value_ = value;
        _table_.put(_value_,this);
    }

    public static final java.lang.String _Created = "Created";
    public static final java.lang.String _WaitingForApproval = "WaitingForApproval";
    public static final java.lang.String _Disapproved = "Disapproved";
    public static final java.lang.String _ProvisioningInProgress = "ProvisioningInProgress";
    public static final java.lang.String _ProvisioningCompleted = "ProvisioningCompleted";
    public static final java.lang.String _Disabled = "Disabled";
    public static final AccountState Created = new AccountState(_Created);
    public static final AccountState WaitingForApproval = new AccountState(_WaitingForApproval);
    public static final AccountState Disapproved = new AccountState(_Disapproved);
    public static final AccountState ProvisioningInProgress = new AccountState(_ProvisioningInProgress);
    public static final AccountState ProvisioningCompleted = new AccountState(_ProvisioningCompleted);
    public static final AccountState Disabled = new AccountState(_Disabled);
    public java.lang.String getValue() { return _value_;}
    public static AccountState fromValue(java.lang.String value)
          throws java.lang.IllegalArgumentException {
        AccountState enumeration = (AccountState)
            _table_.get(value);
        if (enumeration==null) throw new java.lang.IllegalArgumentException();
        return enumeration;
    }
    public static AccountState fromString(java.lang.String value)
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
        new org.apache.axis.description.TypeDesc(AccountState.class);

    static {
        typeDesc.setXmlType(new javax.xml.namespace.QName("http://Microsoft/ConnectedServicesSandbox/2006/11/UserProfileManager/", "AccountState"));
    }
    /**
     * Return type metadata object
     */
    public static org.apache.axis.description.TypeDesc getTypeDesc() {
        return typeDesc;
    }

}
