/**
 * PsmTagCloudResponse.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis 1.4 Apr 22, 2006 (06:55:48 PDT) WSDL2Java emitter.
 */

package com.topcoder.web.csf.Microsoft.ConnectedServices._2006._10.ProductServiceMapping;

public class PsmTagCloudResponse  implements java.io.Serializable {
    private TagClouds[] tagCloud;

    public PsmTagCloudResponse() {
    }

    public PsmTagCloudResponse(
           TagClouds[] tagCloud) {
           this.tagCloud = tagCloud;
    }


    /**
     * Gets the tagCloud value for this PsmTagCloudResponse.
     * 
     * @return tagCloud
     */
    public TagClouds[] getTagCloud() {
        return tagCloud;
    }


    /**
     * Sets the tagCloud value for this PsmTagCloudResponse.
     * 
     * @param tagCloud
     */
    public void setTagCloud(TagClouds[] tagCloud) {
        this.tagCloud = tagCloud;
    }

    private java.lang.Object __equalsCalc = null;
    public synchronized boolean equals(java.lang.Object obj) {
        if (!(obj instanceof PsmTagCloudResponse)) return false;
        PsmTagCloudResponse other = (PsmTagCloudResponse) obj;
        if (obj == null) return false;
        if (this == obj) return true;
        if (__equalsCalc != null) {
            return (__equalsCalc == obj);
        }
        __equalsCalc = obj;
        boolean _equals;
        _equals = true && 
            ((this.tagCloud==null && other.getTagCloud()==null) || 
             (this.tagCloud!=null &&
              java.util.Arrays.equals(this.tagCloud, other.getTagCloud())));
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
        if (getTagCloud() != null) {
            for (int i=0;
                 i<java.lang.reflect.Array.getLength(getTagCloud());
                 i++) {
                java.lang.Object obj = java.lang.reflect.Array.get(getTagCloud(), i);
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
        new org.apache.axis.description.TypeDesc(PsmTagCloudResponse.class, true);

    static {
        typeDesc.setXmlType(new javax.xml.namespace.QName("http://Microsoft/ConnectedServices/2006/10/ProductServiceMapping/", "PsmTagCloudResponse"));
        org.apache.axis.description.ElementDesc elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("tagCloud");
        elemField.setXmlName(new javax.xml.namespace.QName("http://Microsoft/ConnectedServices/2006/10/ProductServiceMapping/", "TagCloud"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://Microsoft/ConnectedServices/2006/10/ProductServiceMapping/", "TagClouds"));
        elemField.setMinOccurs(0);
        elemField.setNillable(false);
        elemField.setItemQName(new javax.xml.namespace.QName("http://Microsoft/ConnectedServices/2006/10/ProductServiceMapping/", "TagClouds"));
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
