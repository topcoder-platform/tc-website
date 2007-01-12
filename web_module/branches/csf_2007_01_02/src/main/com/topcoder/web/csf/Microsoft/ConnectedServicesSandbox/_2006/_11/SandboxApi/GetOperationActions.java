/**
 * GetOperationActions.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis 1.4 Apr 22, 2006 (06:55:48 PDT) WSDL2Java emitter.
 */

package com.topcoder.web.csf.Microsoft.ConnectedServicesSandbox._2006._11.SandboxApi;

public class GetOperationActions  implements java.io.Serializable {
    private java.lang.String strServiceURL;

    public GetOperationActions() {
    }

    public GetOperationActions(
           java.lang.String strServiceURL) {
           this.strServiceURL = strServiceURL;
    }


    /**
     * Gets the strServiceURL value for this GetOperationActions.
     * 
     * @return strServiceURL
     */
    public java.lang.String getStrServiceURL() {
        return strServiceURL;
    }


    /**
     * Sets the strServiceURL value for this GetOperationActions.
     * 
     * @param strServiceURL
     */
    public void setStrServiceURL(java.lang.String strServiceURL) {
        this.strServiceURL = strServiceURL;
    }

    private java.lang.Object __equalsCalc = null;
    public synchronized boolean equals(java.lang.Object obj) {
        if (!(obj instanceof GetOperationActions)) return false;
        GetOperationActions other = (GetOperationActions) obj;
        if (obj == null) return false;
        if (this == obj) return true;
        if (__equalsCalc != null) {
            return (__equalsCalc == obj);
        }
        __equalsCalc = obj;
        boolean _equals;
        _equals = true && 
            ((this.strServiceURL==null && other.getStrServiceURL()==null) || 
             (this.strServiceURL!=null &&
              this.strServiceURL.equals(other.getStrServiceURL())));
        __equalsCalc = null;
        return _equals;
    }

    private boolean __hashCodeCalc = false;
    public synchronized int hashCode() {
        if (__hashCodeCalc) {
            return 0;
        }
        __hashCodeCalc = true;
        int _hashCode = 1;
        if (getStrServiceURL() != null) {
            _hashCode += getStrServiceURL().hashCode();
        }
        __hashCodeCalc = false;
        return _hashCode;
    }

    // Type metadata
    private static org.apache.axis.description.TypeDesc typeDesc =
        new org.apache.axis.description.TypeDesc(GetOperationActions.class, true);

    static {
        typeDesc.setXmlType(new javax.xml.namespace.QName("http://Microsoft/ConnectedServicesSandbox/2006/11/SandboxApi/", ">GetOperationActions"));
        org.apache.axis.description.ElementDesc elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("strServiceURL");
        elemField.setXmlName(new javax.xml.namespace.QName("http://Microsoft/ConnectedServicesSandbox/2006/11/SandboxApi/", "strServiceURL"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://www.w3.org/2001/XMLSchema", "string"));
        elemField.setMinOccurs(0);
        elemField.setNillable(false);
        typeDesc.addFieldDesc(elemField);
    }

    /**
     * Return type metadata object
     */
    public static org.apache.axis.description.TypeDesc getTypeDesc() {
        return typeDesc;
    }

    /**
     * Get Custom Serializer
     */
    public static org.apache.axis.encoding.Serializer getSerializer(
           java.lang.String mechType, 
           java.lang.Class _javaType,  
           javax.xml.namespace.QName _xmlType) {
        return 
          new  org.apache.axis.encoding.ser.BeanSerializer(
            _javaType, _xmlType, typeDesc);
    }

    /**
     * Get Custom Deserializer
     */
    public static org.apache.axis.encoding.Deserializer getDeserializer(
           java.lang.String mechType, 
           java.lang.Class _javaType,  
           javax.xml.namespace.QName _xmlType) {
        return 
          new  org.apache.axis.encoding.ser.BeanDeserializer(
            _javaType, _xmlType, typeDesc);
    }

}
