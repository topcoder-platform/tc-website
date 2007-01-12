/**
 * PsmSearchProductsResponse.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis 1.4 Apr 22, 2006 (06:55:48 PDT) WSDL2Java emitter.
 */

package com.topcoder.web.csf.Microsoft.ConnectedServicesSandbox._2006._11.SandboxApi;

public class PsmSearchProductsResponse  implements java.io.Serializable {
    private SearchProductsResponse psmSearchProductsResult;

    public PsmSearchProductsResponse() {
    }

    public PsmSearchProductsResponse(
           SearchProductsResponse psmSearchProductsResult) {
           this.psmSearchProductsResult = psmSearchProductsResult;
    }


    /**
     * Gets the psmSearchProductsResult value for this PsmSearchProductsResponse.
     * 
     * @return psmSearchProductsResult
     */
    public SearchProductsResponse getPsmSearchProductsResult() {
        return psmSearchProductsResult;
    }


    /**
     * Sets the psmSearchProductsResult value for this PsmSearchProductsResponse.
     * 
     * @param psmSearchProductsResult
     */
    public void setPsmSearchProductsResult(SearchProductsResponse psmSearchProductsResult) {
        this.psmSearchProductsResult = psmSearchProductsResult;
    }

    private java.lang.Object __equalsCalc = null;
    public synchronized boolean equals(java.lang.Object obj) {
        if (!(obj instanceof PsmSearchProductsResponse)) return false;
        PsmSearchProductsResponse other = (PsmSearchProductsResponse) obj;
        if (obj == null) return false;
        if (this == obj) return true;
        if (__equalsCalc != null) {
            return (__equalsCalc == obj);
        }
        __equalsCalc = obj;
        boolean _equals;
        _equals = true && 
            ((this.psmSearchProductsResult==null && other.getPsmSearchProductsResult()==null) || 
             (this.psmSearchProductsResult!=null &&
              this.psmSearchProductsResult.equals(other.getPsmSearchProductsResult())));
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
        if (getPsmSearchProductsResult() != null) {
            _hashCode += getPsmSearchProductsResult().hashCode();
        }
        __hashCodeCalc = false;
        return _hashCode;
    }

    // Type metadata
    private static org.apache.axis.description.TypeDesc typeDesc =
        new org.apache.axis.description.TypeDesc(PsmSearchProductsResponse.class, true);

    static {
        typeDesc.setXmlType(new javax.xml.namespace.QName("http://Microsoft/ConnectedServicesSandbox/2006/11/SandboxApi/", ">PsmSearchProductsResponse"));
        org.apache.axis.description.ElementDesc elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("psmSearchProductsResult");
        elemField.setXmlName(new javax.xml.namespace.QName("http://Microsoft/ConnectedServicesSandbox/2006/11/SandboxApi/", "PsmSearchProductsResult"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://Microsoft/ConnectedServicesSandbox/2006/11/SandboxApi/", "SearchProductsResponse"));
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
