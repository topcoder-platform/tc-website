/**
 * QueryServiceInformationRequest.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis 1.4 Apr 22, 2006 (06:55:48 PDT) WSDL2Java emitter.
 */

package com.topcoder.web.csf.Microsoft.ConnectedServicesSandbox._2006._11.SandboxApi;

public class QueryServiceInformationRequest  implements java.io.Serializable {
    private ServiceQueryParams[] serviceQueryInfoParams;

    public QueryServiceInformationRequest() {
    }

    public QueryServiceInformationRequest(
           ServiceQueryParams[] serviceQueryInfoParams) {
           this.serviceQueryInfoParams = serviceQueryInfoParams;
    }


    /**
     * Gets the serviceQueryInfoParams value for this QueryServiceInformationRequest.
     * 
     * @return serviceQueryInfoParams
     */
    public ServiceQueryParams[] getServiceQueryInfoParams() {
        return serviceQueryInfoParams;
    }


    /**
     * Sets the serviceQueryInfoParams value for this QueryServiceInformationRequest.
     * 
     * @param serviceQueryInfoParams
     */
    public void setServiceQueryInfoParams(ServiceQueryParams[] serviceQueryInfoParams) {
        this.serviceQueryInfoParams = serviceQueryInfoParams;
    }

    private java.lang.Object __equalsCalc = null;
    public synchronized boolean equals(java.lang.Object obj) {
        if (!(obj instanceof QueryServiceInformationRequest)) return false;
        QueryServiceInformationRequest other = (QueryServiceInformationRequest) obj;
        if (obj == null) return false;
        if (this == obj) return true;
        if (__equalsCalc != null) {
            return (__equalsCalc == obj);
        }
        __equalsCalc = obj;
        boolean _equals;
        _equals = true && 
            ((this.serviceQueryInfoParams==null && other.getServiceQueryInfoParams()==null) || 
             (this.serviceQueryInfoParams!=null &&
              java.util.Arrays.equals(this.serviceQueryInfoParams, other.getServiceQueryInfoParams())));
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
        if (getServiceQueryInfoParams() != null) {
            for (int i=0;
                 i<java.lang.reflect.Array.getLength(getServiceQueryInfoParams());
                 i++) {
                java.lang.Object obj = java.lang.reflect.Array.get(getServiceQueryInfoParams(), i);
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
        new org.apache.axis.description.TypeDesc(QueryServiceInformationRequest.class, true);

    static {
        typeDesc.setXmlType(new javax.xml.namespace.QName("http://Microsoft/ConnectedServicesSandbox/2006/11/SandboxApi/", "QueryServiceInformationRequest"));
        org.apache.axis.description.ElementDesc elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("serviceQueryInfoParams");
        elemField.setXmlName(new javax.xml.namespace.QName("http://Microsoft/ConnectedServicesSandbox/2006/11/SandboxApi/", "ServiceQueryInfoParams"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://Microsoft/ConnectedServicesSandbox/2006/11/SandboxApi/", "ServiceQueryParams"));
        elemField.setMinOccurs(0);
        elemField.setNillable(false);
        elemField.setItemQName(new javax.xml.namespace.QName("http://Microsoft/ConnectedServicesSandbox/2006/11/SandboxApi/", "ServiceQueryInfoParam"));
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
