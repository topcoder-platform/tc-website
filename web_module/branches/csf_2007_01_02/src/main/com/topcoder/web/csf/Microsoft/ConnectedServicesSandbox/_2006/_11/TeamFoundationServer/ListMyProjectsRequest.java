/**
 * ListMyProjectsRequest.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis 1.4 Apr 22, 2006 (06:55:48 PDT) WSDL2Java emitter.
 */

package com.topcoder.web.csf.Microsoft.ConnectedServicesSandbox._2006._11.TeamFoundationServer;

public class ListMyProjectsRequest  extends TfsBaseRequest  implements java.io.Serializable {
    private java.lang.String projUserName;

    public ListMyProjectsRequest() {
    }

    public ListMyProjectsRequest(
           java.lang.String userId,
           java.lang.String coRelationId,
           java.lang.String serverName,
           java.lang.String coUserName,
           java.lang.String password,
           java.lang.String coDomain,
           java.lang.String projUserName) {
        super(
            userId,
            coRelationId,
            serverName,
            coUserName,
            password,
            coDomain);
        this.projUserName = projUserName;
    }


    /**
     * Gets the projUserName value for this ListMyProjectsRequest.
     * 
     * @return projUserName
     */
    public java.lang.String getProjUserName() {
        return projUserName;
    }


    /**
     * Sets the projUserName value for this ListMyProjectsRequest.
     * 
     * @param projUserName
     */
    public void setProjUserName(java.lang.String projUserName) {
        this.projUserName = projUserName;
    }

    private java.lang.Object __equalsCalc = null;
    public synchronized boolean equals(java.lang.Object obj) {
        if (!(obj instanceof ListMyProjectsRequest)) return false;
        ListMyProjectsRequest other = (ListMyProjectsRequest) obj;
        if (obj == null) return false;
        if (this == obj) return true;
        if (__equalsCalc != null) {
            return (__equalsCalc == obj);
        }
        __equalsCalc = obj;
        boolean _equals;
        _equals = super.equals(obj) && 
            ((this.projUserName==null && other.getProjUserName()==null) || 
             (this.projUserName!=null &&
              this.projUserName.equals(other.getProjUserName())));
        __equalsCalc = null;
        return _equals;
    }

    private boolean __hashCodeCalc = false;
    public synchronized int hashCode() {
        if (__hashCodeCalc) {
            return 0;
        }
        __hashCodeCalc = true;
        int _hashCode = super.hashCode();
        if (getProjUserName() != null) {
            _hashCode += getProjUserName().hashCode();
        }
        __hashCodeCalc = false;
        return _hashCode;
    }

    // Type metadata
    private static org.apache.axis.description.TypeDesc typeDesc =
        new org.apache.axis.description.TypeDesc(ListMyProjectsRequest.class, true);

    static {
        typeDesc.setXmlType(new javax.xml.namespace.QName("http://Microsoft/ConnectedServicesSandbox/2006/11/TeamFoundationServer/", "ListMyProjectsRequest"));
        org.apache.axis.description.ElementDesc elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("projUserName");
        elemField.setXmlName(new javax.xml.namespace.QName("http://Microsoft/ConnectedServicesSandbox/2006/11/TeamFoundationServer/", "ProjUserName"));
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
