/**
 * ListAllProjectsResponse.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis 1.4 Apr 22, 2006 (06:55:48 PDT) WSDL2Java emitter.
 */

package com.topcoder.web.csf.Microsoft.ConnectedServicesSandbox._2006._11.SandboxApi;

import com.topcoder.web.csf.Microsoft.ConnectedServicesSandbox._2006._11.TeamFoundationServer.ProjectInfo;

public class ListAllProjectsResponse  implements java.io.Serializable {
    private ProjectInfo[] listAllProjectsResponse;

    public ListAllProjectsResponse() {
    }

    public ListAllProjectsResponse(
           ProjectInfo[] listAllProjectsResponse) {
           this.listAllProjectsResponse = listAllProjectsResponse;
    }


    /**
     * Gets the listAllProjectsResponse value for this ListAllProjectsResponse.
     * 
     * @return listAllProjectsResponse
     */
    public ProjectInfo[] getListAllProjectsResponse() {
        return listAllProjectsResponse;
    }


    /**
     * Sets the listAllProjectsResponse value for this ListAllProjectsResponse.
     * 
     * @param listAllProjectsResponse
     */
    public void setListAllProjectsResponse(ProjectInfo[] listAllProjectsResponse) {
        this.listAllProjectsResponse = listAllProjectsResponse;
    }

    private java.lang.Object __equalsCalc = null;
    public synchronized boolean equals(java.lang.Object obj) {
        if (!(obj instanceof ListAllProjectsResponse)) return false;
        ListAllProjectsResponse other = (ListAllProjectsResponse) obj;
        if (obj == null) return false;
        if (this == obj) return true;
        if (__equalsCalc != null) {
            return (__equalsCalc == obj);
        }
        __equalsCalc = obj;
        boolean _equals;
        _equals = true && 
            ((this.listAllProjectsResponse==null && other.getListAllProjectsResponse()==null) || 
             (this.listAllProjectsResponse!=null &&
              java.util.Arrays.equals(this.listAllProjectsResponse, other.getListAllProjectsResponse())));
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
        if (getListAllProjectsResponse() != null) {
            for (int i=0;
                 i<java.lang.reflect.Array.getLength(getListAllProjectsResponse());
                 i++) {
                java.lang.Object obj = java.lang.reflect.Array.get(getListAllProjectsResponse(), i);
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
        new org.apache.axis.description.TypeDesc(ListAllProjectsResponse.class, true);

    static {
        typeDesc.setXmlType(new javax.xml.namespace.QName("http://Microsoft/ConnectedServicesSandbox/2006/11/SandboxApi/", ">ListAllProjectsResponse"));
        org.apache.axis.description.ElementDesc elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("listAllProjectsResponse");
        elemField.setXmlName(new javax.xml.namespace.QName("http://Microsoft/ConnectedServicesSandbox/2006/11/TeamFoundationServer/", "ListAllProjectsResponse"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://Microsoft/ConnectedServicesSandbox/2006/11/TeamFoundationServer/", "ListAllProjectsResult"));
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
