/**
 * GetProductTagCloudResponse.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis 1.4 Apr 22, 2006 (06:55:48 PDT) WSDL2Java emitter.
 */

package com.topcoder.web.csf.Microsoft.ConnectedServicesSandbox._2006._11.SandboxApi;

import com.topcoder.web.csf.Microsoft.ConnectedServices._2006._10.ProductServiceMapping.PsmTagCloudResponse;

public class GetProductTagCloudResponse  implements java.io.Serializable {
    private PsmTagCloudResponse getProductTagCloudResult;

    public GetProductTagCloudResponse() {
    }

    public GetProductTagCloudResponse(
           PsmTagCloudResponse getProductTagCloudResult) {
           this.getProductTagCloudResult = getProductTagCloudResult;
    }


    /**
     * Gets the getProductTagCloudResult value for this GetProductTagCloudResponse.
     * 
     * @return getProductTagCloudResult
     */
    public PsmTagCloudResponse getGetProductTagCloudResult() {
        return getProductTagCloudResult;
    }


    /**
     * Sets the getProductTagCloudResult value for this GetProductTagCloudResponse.
     * 
     * @param getProductTagCloudResult
     */
    public void setGetProductTagCloudResult(PsmTagCloudResponse getProductTagCloudResult) {
        this.getProductTagCloudResult = getProductTagCloudResult;
    }

    private java.lang.Object __equalsCalc = null;
    public synchronized boolean equals(java.lang.Object obj) {
        if (!(obj instanceof GetProductTagCloudResponse)) return false;
        GetProductTagCloudResponse other = (GetProductTagCloudResponse) obj;
        if (obj == null) return false;
        if (this == obj) return true;
        if (__equalsCalc != null) {
            return (__equalsCalc == obj);
        }
        __equalsCalc = obj;
        boolean _equals;
        _equals = true && 
            ((this.getProductTagCloudResult==null && other.getGetProductTagCloudResult()==null) || 
             (this.getProductTagCloudResult!=null &&
              this.getProductTagCloudResult.equals(other.getGetProductTagCloudResult())));
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
        if (getGetProductTagCloudResult() != null) {
            _hashCode += getGetProductTagCloudResult().hashCode();
        }
        __hashCodeCalc = false;
        return _hashCode;
    }

    // Type metadata
    private static org.apache.axis.description.TypeDesc typeDesc =
        new org.apache.axis.description.TypeDesc(GetProductTagCloudResponse.class, true);

    static {
        typeDesc.setXmlType(new javax.xml.namespace.QName("http://Microsoft/ConnectedServicesSandbox/2006/11/SandboxApi/", ">GetProductTagCloudResponse"));
        org.apache.axis.description.ElementDesc elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("getProductTagCloudResult");
        elemField.setXmlName(new javax.xml.namespace.QName("http://Microsoft/ConnectedServices/2006/10/ProductServiceMapping/", "GetProductTagCloudResult"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://Microsoft/ConnectedServices/2006/10/ProductServiceMapping/", "PsmTagCloudResponse"));
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
