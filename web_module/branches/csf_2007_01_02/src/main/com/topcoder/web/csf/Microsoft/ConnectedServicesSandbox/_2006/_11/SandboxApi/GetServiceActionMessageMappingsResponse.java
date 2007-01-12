/**
 * GetServiceActionMessageMappingsResponse.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis 1.4 Apr 22, 2006 (06:55:48 PDT) WSDL2Java emitter.
 */

package com.topcoder.web.csf.Microsoft.ConnectedServicesSandbox._2006._11.SandboxApi;

public class GetServiceActionMessageMappingsResponse  implements java.io.Serializable {
    private java.lang.String[] getServiceActionMessageMappingsResult;

    public GetServiceActionMessageMappingsResponse() {
    }

    public GetServiceActionMessageMappingsResponse(
           java.lang.String[] getServiceActionMessageMappingsResult) {
           this.getServiceActionMessageMappingsResult = getServiceActionMessageMappingsResult;
    }


    /**
     * Gets the getServiceActionMessageMappingsResult value for this GetServiceActionMessageMappingsResponse.
     * 
     * @return getServiceActionMessageMappingsResult
     */
    public java.lang.String[] getGetServiceActionMessageMappingsResult() {
        return getServiceActionMessageMappingsResult;
    }


    /**
     * Sets the getServiceActionMessageMappingsResult value for this GetServiceActionMessageMappingsResponse.
     * 
     * @param getServiceActionMessageMappingsResult
     */
    public void setGetServiceActionMessageMappingsResult(java.lang.String[] getServiceActionMessageMappingsResult) {
        this.getServiceActionMessageMappingsResult = getServiceActionMessageMappingsResult;
    }

    private java.lang.Object __equalsCalc = null;
    public synchronized boolean equals(java.lang.Object obj) {
        if (!(obj instanceof GetServiceActionMessageMappingsResponse)) return false;
        GetServiceActionMessageMappingsResponse other = (GetServiceActionMessageMappingsResponse) obj;
        if (obj == null) return false;
        if (this == obj) return true;
        if (__equalsCalc != null) {
            return (__equalsCalc == obj);
        }
        __equalsCalc = obj;
        boolean _equals;
        _equals = true && 
            ((this.getServiceActionMessageMappingsResult==null && other.getGetServiceActionMessageMappingsResult()==null) || 
             (this.getServiceActionMessageMappingsResult!=null &&
              java.util.Arrays.equals(this.getServiceActionMessageMappingsResult, other.getGetServiceActionMessageMappingsResult())));
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
        if (getGetServiceActionMessageMappingsResult() != null) {
            for (int i=0;
                 i<java.lang.reflect.Array.getLength(getGetServiceActionMessageMappingsResult());
                 i++) {
                java.lang.Object obj = java.lang.reflect.Array.get(getGetServiceActionMessageMappingsResult(), i);
                if (obj != null &&
                    !obj.getClass().isArray()) {
                    _hashCode += obj.hashCode();
                }
            }
        }
        __hashCodeCalc = false;
        return _hashCode;
    }

    // Type metadata
    private static org.apache.axis.description.TypeDesc typeDesc =
        new org.apache.axis.description.TypeDesc(GetServiceActionMessageMappingsResponse.class, true);

    static {
        typeDesc.setXmlType(new javax.xml.namespace.QName("http://Microsoft/ConnectedServicesSandbox/2006/11/SandboxApi/", ">GetServiceActionMessageMappingsResponse"));
        org.apache.axis.description.ElementDesc elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("getServiceActionMessageMappingsResult");
        elemField.setXmlName(new javax.xml.namespace.QName("http://Microsoft/ConnectedServicesSandbox/2006/11/SandboxApi/", "GetServiceActionMessageMappingsResult"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://www.w3.org/2001/XMLSchema", "string"));
        elemField.setMinOccurs(0);
        elemField.setNillable(false);
        elemField.setItemQName(new javax.xml.namespace.QName("http://Microsoft/ConnectedServicesSandbox/2006/11/SandboxApi/", "string"));
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
