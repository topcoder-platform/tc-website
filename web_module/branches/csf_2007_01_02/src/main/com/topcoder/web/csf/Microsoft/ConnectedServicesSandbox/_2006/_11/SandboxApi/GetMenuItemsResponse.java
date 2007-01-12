/**
 * GetMenuItemsResponse.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis 1.4 Apr 22, 2006 (06:55:48 PDT) WSDL2Java emitter.
 */

package com.topcoder.web.csf.Microsoft.ConnectedServicesSandbox._2006._11.SandboxApi;

public class GetMenuItemsResponse  implements java.io.Serializable {
    private Menu[] getMenuItemsResult;

    public GetMenuItemsResponse() {
    }

    public GetMenuItemsResponse(
           Menu[] getMenuItemsResult) {
           this.getMenuItemsResult = getMenuItemsResult;
    }


    /**
     * Gets the getMenuItemsResult value for this GetMenuItemsResponse.
     * 
     * @return getMenuItemsResult
     */
    public Menu[] getGetMenuItemsResult() {
        return getMenuItemsResult;
    }


    /**
     * Sets the getMenuItemsResult value for this GetMenuItemsResponse.
     * 
     * @param getMenuItemsResult
     */
    public void setGetMenuItemsResult(Menu[] getMenuItemsResult) {
        this.getMenuItemsResult = getMenuItemsResult;
    }

    private java.lang.Object __equalsCalc = null;
    public synchronized boolean equals(java.lang.Object obj) {
        if (!(obj instanceof GetMenuItemsResponse)) return false;
        GetMenuItemsResponse other = (GetMenuItemsResponse) obj;
        if (obj == null) return false;
        if (this == obj) return true;
        if (__equalsCalc != null) {
            return (__equalsCalc == obj);
        }
        __equalsCalc = obj;
        boolean _equals;
        _equals = true && 
            ((this.getMenuItemsResult==null && other.getGetMenuItemsResult()==null) || 
             (this.getMenuItemsResult!=null &&
              java.util.Arrays.equals(this.getMenuItemsResult, other.getGetMenuItemsResult())));
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
        if (getGetMenuItemsResult() != null) {
            for (int i=0;
                 i<java.lang.reflect.Array.getLength(getGetMenuItemsResult());
                 i++) {
                java.lang.Object obj = java.lang.reflect.Array.get(getGetMenuItemsResult(), i);
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
        new org.apache.axis.description.TypeDesc(GetMenuItemsResponse.class, true);

    static {
        typeDesc.setXmlType(new javax.xml.namespace.QName("http://Microsoft/ConnectedServicesSandbox/2006/11/SandboxApi/", ">GetMenuItemsResponse"));
        org.apache.axis.description.ElementDesc elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("getMenuItemsResult");
        elemField.setXmlName(new javax.xml.namespace.QName("http://Microsoft/ConnectedServicesSandbox/2006/11/SandboxApi/", "GetMenuItemsResult"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://Microsoft/ConnectedServicesSandbox/2006/11/SandboxApi/", "Menu"));
        elemField.setMinOccurs(0);
        elemField.setNillable(false);
        elemField.setItemQName(new javax.xml.namespace.QName("http://Microsoft/ConnectedServicesSandbox/2006/11/SandboxApi/", "Menu"));
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
