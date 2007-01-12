/**
 * TagClouds.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis 1.4 Apr 22, 2006 (06:55:48 PDT) WSDL2Java emitter.
 */

package com.topcoder.web.csf.Microsoft.ConnectedServices._2006._10.ProductServiceMapping;

public class TagClouds  implements java.io.Serializable {
    private java.lang.String tagName;

    private java.lang.String tagCount;

    private java.lang.String tagCloud;

    public TagClouds() {
    }

    public TagClouds(
           java.lang.String tagName,
           java.lang.String tagCount,
           java.lang.String tagCloud) {
           this.tagName = tagName;
           this.tagCount = tagCount;
           this.tagCloud = tagCloud;
    }


    /**
     * Gets the tagName value for this TagClouds.
     * 
     * @return tagName
     */
    public java.lang.String getTagName() {
        return tagName;
    }


    /**
     * Sets the tagName value for this TagClouds.
     * 
     * @param tagName
     */
    public void setTagName(java.lang.String tagName) {
        this.tagName = tagName;
    }


    /**
     * Gets the tagCount value for this TagClouds.
     * 
     * @return tagCount
     */
    public java.lang.String getTagCount() {
        return tagCount;
    }


    /**
     * Sets the tagCount value for this TagClouds.
     * 
     * @param tagCount
     */
    public void setTagCount(java.lang.String tagCount) {
        this.tagCount = tagCount;
    }


    /**
     * Gets the tagCloud value for this TagClouds.
     * 
     * @return tagCloud
     */
    public java.lang.String getTagCloud() {
        return tagCloud;
    }


    /**
     * Sets the tagCloud value for this TagClouds.
     * 
     * @param tagCloud
     */
    public void setTagCloud(java.lang.String tagCloud) {
        this.tagCloud = tagCloud;
    }

    private java.lang.Object __equalsCalc = null;
    public synchronized boolean equals(java.lang.Object obj) {
        if (!(obj instanceof TagClouds)) return false;
        TagClouds other = (TagClouds) obj;
        if (obj == null) return false;
        if (this == obj) return true;
        if (__equalsCalc != null) {
            return (__equalsCalc == obj);
        }
        __equalsCalc = obj;
        boolean _equals;
        _equals = true && 
            ((this.tagName==null && other.getTagName()==null) || 
             (this.tagName!=null &&
              this.tagName.equals(other.getTagName()))) &&
            ((this.tagCount==null && other.getTagCount()==null) || 
             (this.tagCount!=null &&
              this.tagCount.equals(other.getTagCount()))) &&
            ((this.tagCloud==null && other.getTagCloud()==null) || 
             (this.tagCloud!=null &&
              this.tagCloud.equals(other.getTagCloud())));
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
        if (getTagName() != null) {
            _hashCode += getTagName().hashCode();
        }
        if (getTagCount() != null) {
            _hashCode += getTagCount().hashCode();
        }
        if (getTagCloud() != null) {
            _hashCode += getTagCloud().hashCode();
        }
        __hashCodeCalc = false;
        return _hashCode;
    }

    // Type metadata
    private static org.apache.axis.description.TypeDesc typeDesc =
        new org.apache.axis.description.TypeDesc(TagClouds.class, true);

    static {
        typeDesc.setXmlType(new javax.xml.namespace.QName("http://Microsoft/ConnectedServices/2006/10/ProductServiceMapping/", "TagClouds"));
        org.apache.axis.description.ElementDesc elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("tagName");
        elemField.setXmlName(new javax.xml.namespace.QName("http://Microsoft/ConnectedServices/2006/10/ProductServiceMapping/", "TagName"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://www.w3.org/2001/XMLSchema", "string"));
        elemField.setMinOccurs(0);
        elemField.setNillable(false);
        typeDesc.addFieldDesc(elemField);
        elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("tagCount");
        elemField.setXmlName(new javax.xml.namespace.QName("http://Microsoft/ConnectedServices/2006/10/ProductServiceMapping/", "TagCount"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://www.w3.org/2001/XMLSchema", "string"));
        elemField.setMinOccurs(0);
        elemField.setNillable(false);
        typeDesc.addFieldDesc(elemField);
        elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("tagCloud");
        elemField.setXmlName(new javax.xml.namespace.QName("http://Microsoft/ConnectedServices/2006/10/ProductServiceMapping/", "TagCloud"));
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
