/**
 * DeleteProject.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis 1.4 Apr 22, 2006 (06:55:48 PDT) WSDL2Java emitter.
 */

package com.topcoder.web.csf.Microsoft.ConnectedServicesSandbox._2006._11.SandboxApi;

import com.topcoder.web.csf.Microsoft.ConnectedServicesSandbox._2006._11.TeamFoundationServer.DeleteProjectRequest;

public class DeleteProject  implements java.io.Serializable {
    private DeleteProjectRequest deleteProjectRequest;

    public DeleteProject() {
    }

    public DeleteProject(
           DeleteProjectRequest deleteProjectRequest) {
           this.deleteProjectRequest = deleteProjectRequest;
    }


    /**
     * Gets the deleteProjectRequest value for this DeleteProject.
     * 
     * @return deleteProjectRequest
     */
    public DeleteProjectRequest getDeleteProjectRequest() {
        return deleteProjectRequest;
    }


    /**
     * Sets the deleteProjectRequest value for this DeleteProject.
     * 
     * @param deleteProjectRequest
     */
    public void setDeleteProjectRequest(DeleteProjectRequest deleteProjectRequest) {
        this.deleteProjectRequest = deleteProjectRequest;
    }

    private java.lang.Object __equalsCalc = null;
    public synchronized boolean equals(java.lang.Object obj) {
        if (!(obj instanceof DeleteProject)) return false;
        DeleteProject other = (DeleteProject) obj;
        if (obj == null) return false;
        if (this == obj) return true;
        if (__equalsCalc != null) {
            return (__equalsCalc == obj);
        }
        __equalsCalc = obj;
        boolean _equals;
        _equals = true && 
            ((this.deleteProjectRequest==null && other.getDeleteProjectRequest()==null) || 
             (this.deleteProjectRequest!=null &&
              this.deleteProjectRequest.equals(other.getDeleteProjectRequest())));
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
        if (getDeleteProjectRequest() != null) {
            _hashCode += getDeleteProjectRequest().hashCode();
        }
        __hashCodeCalc = false;
        return _hashCode;
    }

    // Type metadata
    private static org.apache.axis.description.TypeDesc typeDesc =
        new org.apache.axis.description.TypeDesc(DeleteProject.class, true);

    static {
        typeDesc.setXmlType(new javax.xml.namespace.QName("http://Microsoft/ConnectedServicesSandbox/2006/11/SandboxApi/", ">DeleteProject"));
        org.apache.axis.description.ElementDesc elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("deleteProjectRequest");
        elemField.setXmlName(new javax.xml.namespace.QName("http://Microsoft/ConnectedServicesSandbox/2006/11/TeamFoundationServer/", "DeleteProjectRequest"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://Microsoft/ConnectedServicesSandbox/2006/11/TeamFoundationServer/", "DeleteProjectRequest"));
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
