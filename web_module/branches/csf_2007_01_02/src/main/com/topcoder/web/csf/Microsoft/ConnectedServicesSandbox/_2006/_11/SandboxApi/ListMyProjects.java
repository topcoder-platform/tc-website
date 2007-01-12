/**
 * ListMyProjects.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis 1.4 Apr 22, 2006 (06:55:48 PDT) WSDL2Java emitter.
 */

package com.topcoder.web.csf.Microsoft.ConnectedServicesSandbox._2006._11.SandboxApi;

import com.topcoder.web.csf.Microsoft.ConnectedServicesSandbox._2006._11.TeamFoundationServer.ListMyProjectsRequest;

public class ListMyProjects  implements java.io.Serializable {
    private ListMyProjectsRequest listMyProjectsRequest;

    public ListMyProjects() {
    }

    public ListMyProjects(
           ListMyProjectsRequest listMyProjectsRequest) {
           this.listMyProjectsRequest = listMyProjectsRequest;
    }


    /**
     * Gets the listMyProjectsRequest value for this ListMyProjects.
     * 
     * @return listMyProjectsRequest
     */
    public ListMyProjectsRequest getListMyProjectsRequest() {
        return listMyProjectsRequest;
    }


    /**
     * Sets the listMyProjectsRequest value for this ListMyProjects.
     * 
     * @param listMyProjectsRequest
     */
    public void setListMyProjectsRequest(ListMyProjectsRequest listMyProjectsRequest) {
        this.listMyProjectsRequest = listMyProjectsRequest;
    }

    private java.lang.Object __equalsCalc = null;
    public synchronized boolean equals(java.lang.Object obj) {
        if (!(obj instanceof ListMyProjects)) return false;
        ListMyProjects other = (ListMyProjects) obj;
        if (obj == null) return false;
        if (this == obj) return true;
        if (__equalsCalc != null) {
            return (__equalsCalc == obj);
        }
        __equalsCalc = obj;
        boolean _equals;
        _equals = true && 
            ((this.listMyProjectsRequest==null && other.getListMyProjectsRequest()==null) || 
             (this.listMyProjectsRequest!=null &&
              this.listMyProjectsRequest.equals(other.getListMyProjectsRequest())));
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
        if (getListMyProjectsRequest() != null) {
            _hashCode += getListMyProjectsRequest().hashCode();
        }
        __hashCodeCalc = false;
        return _hashCode;
    }

    // Type metadata
    private static org.apache.axis.description.TypeDesc typeDesc =
        new org.apache.axis.description.TypeDesc(ListMyProjects.class, true);

    static {
        typeDesc.setXmlType(new javax.xml.namespace.QName("http://Microsoft/ConnectedServicesSandbox/2006/11/SandboxApi/", ">ListMyProjects"));
        org.apache.axis.description.ElementDesc elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("listMyProjectsRequest");
        elemField.setXmlName(new javax.xml.namespace.QName("http://Microsoft/ConnectedServicesSandbox/2006/11/TeamFoundationServer/", "ListMyProjectsRequest"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://Microsoft/ConnectedServicesSandbox/2006/11/TeamFoundationServer/", "ListMyProjectsRequest"));
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
