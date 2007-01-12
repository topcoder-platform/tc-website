/**
 * UpdateBlipContent.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis 1.4 Apr 22, 2006 (06:55:48 PDT) WSDL2Java emitter.
 */

package com.topcoder.web.csf.Microsoft.ConnectedServicesSandbox._2006._11.SandboxApi;

public class UpdateBlipContent  implements java.io.Serializable {
    private int id;

    private java.lang.String blip_id;

    private java.lang.String page_name;

    private java.lang.String blip_content;

    public UpdateBlipContent() {
    }

    public UpdateBlipContent(
           int id,
           java.lang.String blip_id,
           java.lang.String page_name,
           java.lang.String blip_content) {
           this.id = id;
           this.blip_id = blip_id;
           this.page_name = page_name;
           this.blip_content = blip_content;
    }


    /**
     * Gets the id value for this UpdateBlipContent.
     * 
     * @return id
     */
    public int getId() {
        return id;
    }


    /**
     * Sets the id value for this UpdateBlipContent.
     * 
     * @param id
     */
    public void setId(int id) {
        this.id = id;
    }


    /**
     * Gets the blip_id value for this UpdateBlipContent.
     * 
     * @return blip_id
     */
    public java.lang.String getBlip_id() {
        return blip_id;
    }


    /**
     * Sets the blip_id value for this UpdateBlipContent.
     * 
     * @param blip_id
     */
    public void setBlip_id(java.lang.String blip_id) {
        this.blip_id = blip_id;
    }


    /**
     * Gets the page_name value for this UpdateBlipContent.
     * 
     * @return page_name
     */
    public java.lang.String getPage_name() {
        return page_name;
    }


    /**
     * Sets the page_name value for this UpdateBlipContent.
     * 
     * @param page_name
     */
    public void setPage_name(java.lang.String page_name) {
        this.page_name = page_name;
    }


    /**
     * Gets the blip_content value for this UpdateBlipContent.
     * 
     * @return blip_content
     */
    public java.lang.String getBlip_content() {
        return blip_content;
    }


    /**
     * Sets the blip_content value for this UpdateBlipContent.
     * 
     * @param blip_content
     */
    public void setBlip_content(java.lang.String blip_content) {
        this.blip_content = blip_content;
    }

    private java.lang.Object __equalsCalc = null;
    public synchronized boolean equals(java.lang.Object obj) {
        if (!(obj instanceof UpdateBlipContent)) return false;
        UpdateBlipContent other = (UpdateBlipContent) obj;
        if (obj == null) return false;
        if (this == obj) return true;
        if (__equalsCalc != null) {
            return (__equalsCalc == obj);
        }
        __equalsCalc = obj;
        boolean _equals;
        _equals = true && 
            this.id == other.getId() &&
            ((this.blip_id==null && other.getBlip_id()==null) || 
             (this.blip_id!=null &&
              this.blip_id.equals(other.getBlip_id()))) &&
            ((this.page_name==null && other.getPage_name()==null) || 
             (this.page_name!=null &&
              this.page_name.equals(other.getPage_name()))) &&
            ((this.blip_content==null && other.getBlip_content()==null) || 
             (this.blip_content!=null &&
              this.blip_content.equals(other.getBlip_content())));
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
        _hashCode += getId();
        if (getBlip_id() != null) {
            _hashCode += getBlip_id().hashCode();
        }
        if (getPage_name() != null) {
            _hashCode += getPage_name().hashCode();
        }
        if (getBlip_content() != null) {
            _hashCode += getBlip_content().hashCode();
        }
        __hashCodeCalc = false;
        return _hashCode;
    }

    // Type metadata
    private static org.apache.axis.description.TypeDesc typeDesc =
        new org.apache.axis.description.TypeDesc(UpdateBlipContent.class, true);

    static {
        typeDesc.setXmlType(new javax.xml.namespace.QName("http://Microsoft/ConnectedServicesSandbox/2006/11/SandboxApi/", ">UpdateBlipContent"));
        org.apache.axis.description.ElementDesc elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("id");
        elemField.setXmlName(new javax.xml.namespace.QName("http://Microsoft/ConnectedServicesSandbox/2006/11/SandboxApi/", "id"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://www.w3.org/2001/XMLSchema", "int"));
        elemField.setNillable(false);
        typeDesc.addFieldDesc(elemField);
        elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("blip_id");
        elemField.setXmlName(new javax.xml.namespace.QName("http://Microsoft/ConnectedServicesSandbox/2006/11/SandboxApi/", "blip_id"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://www.w3.org/2001/XMLSchema", "string"));
        elemField.setMinOccurs(0);
        elemField.setNillable(false);
        typeDesc.addFieldDesc(elemField);
        elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("page_name");
        elemField.setXmlName(new javax.xml.namespace.QName("http://Microsoft/ConnectedServicesSandbox/2006/11/SandboxApi/", "page_name"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://www.w3.org/2001/XMLSchema", "string"));
        elemField.setMinOccurs(0);
        elemField.setNillable(false);
        typeDesc.addFieldDesc(elemField);
        elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("blip_content");
        elemField.setXmlName(new javax.xml.namespace.QName("http://Microsoft/ConnectedServicesSandbox/2006/11/SandboxApi/", "blip_content"));
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
