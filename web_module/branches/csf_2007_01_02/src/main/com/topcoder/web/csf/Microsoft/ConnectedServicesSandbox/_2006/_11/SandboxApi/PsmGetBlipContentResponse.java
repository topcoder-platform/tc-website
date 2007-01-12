/**
 * PsmGetBlipContentResponse.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis 1.4 Apr 22, 2006 (06:55:48 PDT) WSDL2Java emitter.
 */

package com.topcoder.web.csf.Microsoft.ConnectedServicesSandbox._2006._11.SandboxApi;

public class PsmGetBlipContentResponse  implements java.io.Serializable {
    private java.lang.String psmGetBlipContentResult;

    public PsmGetBlipContentResponse() {
    }

    public PsmGetBlipContentResponse(
           java.lang.String psmGetBlipContentResult) {
           this.psmGetBlipContentResult = psmGetBlipContentResult;
    }


    /**
     * Gets the psmGetBlipContentResult value for this PsmGetBlipContentResponse.
     * 
     * @return psmGetBlipContentResult
     */
    public java.lang.String getPsmGetBlipContentResult() {
        return psmGetBlipContentResult;
    }


    /**
     * Sets the psmGetBlipContentResult value for this PsmGetBlipContentResponse.
     * 
     * @param psmGetBlipContentResult
     */
    public void setPsmGetBlipContentResult(java.lang.String psmGetBlipContentResult) {
        this.psmGetBlipContentResult = psmGetBlipContentResult;
    }

    private java.lang.Object __equalsCalc = null;
    public synchronized boolean equals(java.lang.Object obj) {
        if (!(obj instanceof PsmGetBlipContentResponse)) return false;
        PsmGetBlipContentResponse other = (PsmGetBlipContentResponse) obj;
        if (obj == null) return false;
        if (this == obj) return true;
        if (__equalsCalc != null) {
            return (__equalsCalc == obj);
        }
        __equalsCalc = obj;
        boolean _equals;
        _equals = true && 
            ((this.psmGetBlipContentResult==null && other.getPsmGetBlipContentResult()==null) || 
             (this.psmGetBlipContentResult!=null &&
              this.psmGetBlipContentResult.equals(other.getPsmGetBlipContentResult())));
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
        if (getPsmGetBlipContentResult() != null) {
            _hashCode += getPsmGetBlipContentResult().hashCode();
        }
        __hashCodeCalc = false;
        return _hashCode;
    }

    // Type metadata
    private static org.apache.axis.description.TypeDesc typeDesc =
        new org.apache.axis.description.TypeDesc(PsmGetBlipContentResponse.class, true);

    static {
        typeDesc.setXmlType(new javax.xml.namespace.QName("http://Microsoft/ConnectedServicesSandbox/2006/11/SandboxApi/", ">PsmGetBlipContentResponse"));
        org.apache.axis.description.ElementDesc elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("psmGetBlipContentResult");
        elemField.setXmlName(new javax.xml.namespace.QName("http://Microsoft/ConnectedServicesSandbox/2006/11/SandboxApi/", "PsmGetBlipContentResult"));
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
