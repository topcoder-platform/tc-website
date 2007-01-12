/**
 * PsmGetAllCategoriesResponse.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis 1.4 Apr 22, 2006 (06:55:48 PDT) WSDL2Java emitter.
 */

package com.topcoder.web.csf.Microsoft.ConnectedServicesSandbox._2006._11.SandboxApi;

public class PsmGetAllCategoriesResponse  implements java.io.Serializable {
    private GetAllCategoriesResponse psmGetAllCategoriesResult;

    public PsmGetAllCategoriesResponse() {
    }

    public PsmGetAllCategoriesResponse(
           GetAllCategoriesResponse psmGetAllCategoriesResult) {
           this.psmGetAllCategoriesResult = psmGetAllCategoriesResult;
    }


    /**
     * Gets the psmGetAllCategoriesResult value for this PsmGetAllCategoriesResponse.
     * 
     * @return psmGetAllCategoriesResult
     */
    public GetAllCategoriesResponse getPsmGetAllCategoriesResult() {
        return psmGetAllCategoriesResult;
    }


    /**
     * Sets the psmGetAllCategoriesResult value for this PsmGetAllCategoriesResponse.
     * 
     * @param psmGetAllCategoriesResult
     */
    public void setPsmGetAllCategoriesResult(GetAllCategoriesResponse psmGetAllCategoriesResult) {
        this.psmGetAllCategoriesResult = psmGetAllCategoriesResult;
    }

    private java.lang.Object __equalsCalc = null;
    public synchronized boolean equals(java.lang.Object obj) {
        if (!(obj instanceof PsmGetAllCategoriesResponse)) return false;
        PsmGetAllCategoriesResponse other = (PsmGetAllCategoriesResponse) obj;
        if (obj == null) return false;
        if (this == obj) return true;
        if (__equalsCalc != null) {
            return (__equalsCalc == obj);
        }
        __equalsCalc = obj;
        boolean _equals;
        _equals = true && 
            ((this.psmGetAllCategoriesResult==null && other.getPsmGetAllCategoriesResult()==null) || 
             (this.psmGetAllCategoriesResult!=null &&
              this.psmGetAllCategoriesResult.equals(other.getPsmGetAllCategoriesResult())));
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
        if (getPsmGetAllCategoriesResult() != null) {
            _hashCode += getPsmGetAllCategoriesResult().hashCode();
        }
        __hashCodeCalc = false;
        return _hashCode;
    }

    // Type metadata
    private static org.apache.axis.description.TypeDesc typeDesc =
        new org.apache.axis.description.TypeDesc(PsmGetAllCategoriesResponse.class, true);

    static {
        typeDesc.setXmlType(new javax.xml.namespace.QName("http://Microsoft/ConnectedServicesSandbox/2006/11/SandboxApi/", ">PsmGetAllCategoriesResponse"));
        org.apache.axis.description.ElementDesc elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("psmGetAllCategoriesResult");
        elemField.setXmlName(new javax.xml.namespace.QName("http://Microsoft/ConnectedServicesSandbox/2006/11/SandboxApi/", "PsmGetAllCategoriesResult"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://Microsoft/ConnectedServicesSandbox/2006/11/SandboxApi/", "GetAllCategoriesResponse"));
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
