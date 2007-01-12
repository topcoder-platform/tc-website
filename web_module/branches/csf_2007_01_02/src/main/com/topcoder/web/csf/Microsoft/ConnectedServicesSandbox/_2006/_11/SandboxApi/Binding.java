/**
 * Binding.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis 1.4 Apr 22, 2006 (06:55:48 PDT) WSDL2Java emitter.
 */

package com.topcoder.web.csf.Microsoft.ConnectedServicesSandbox._2006._11.SandboxApi;

public class Binding  implements java.io.Serializable {
    private java.lang.String bindingKey;

    private org.apache.axis.types.URI accessPoint;

    private NameValuePair[] bindingProperties;

    public Binding() {
    }

    public Binding(
           java.lang.String bindingKey,
           org.apache.axis.types.URI accessPoint,
           NameValuePair[] bindingProperties) {
           this.bindingKey = bindingKey;
           this.accessPoint = accessPoint;
           this.bindingProperties = bindingProperties;
    }


    /**
     * Gets the bindingKey value for this Binding.
     * 
     * @return bindingKey
     */
    public java.lang.String getBindingKey() {
        return bindingKey;
    }


    /**
     * Sets the bindingKey value for this Binding.
     * 
     * @param bindingKey
     */
    public void setBindingKey(java.lang.String bindingKey) {
        this.bindingKey = bindingKey;
    }


    /**
     * Gets the accessPoint value for this Binding.
     * 
     * @return accessPoint
     */
    public org.apache.axis.types.URI getAccessPoint() {
        return accessPoint;
    }


    /**
     * Sets the accessPoint value for this Binding.
     * 
     * @param accessPoint
     */
    public void setAccessPoint(org.apache.axis.types.URI accessPoint) {
        this.accessPoint = accessPoint;
    }


    /**
     * Gets the bindingProperties value for this Binding.
     * 
     * @return bindingProperties
     */
    public NameValuePair[] getBindingProperties() {
        return bindingProperties;
    }


    /**
     * Sets the bindingProperties value for this Binding.
     * 
     * @param bindingProperties
     */
    public void setBindingProperties(NameValuePair[] bindingProperties) {
        this.bindingProperties = bindingProperties;
    }

    private java.lang.Object __equalsCalc = null;
    public synchronized boolean equals(java.lang.Object obj) {
        if (!(obj instanceof Binding)) return false;
        Binding other = (Binding) obj;
        if (obj == null) return false;
        if (this == obj) return true;
        if (__equalsCalc != null) {
            return (__equalsCalc == obj);
        }
        __equalsCalc = obj;
        boolean _equals;
        _equals = true && 
            ((this.bindingKey==null && other.getBindingKey()==null) || 
             (this.bindingKey!=null &&
              this.bindingKey.equals(other.getBindingKey()))) &&
            ((this.accessPoint==null && other.getAccessPoint()==null) || 
             (this.accessPoint!=null &&
              this.accessPoint.equals(other.getAccessPoint()))) &&
            ((this.bindingProperties==null && other.getBindingProperties()==null) || 
             (this.bindingProperties!=null &&
              java.util.Arrays.equals(this.bindingProperties, other.getBindingProperties())));
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
        if (getBindingKey() != null) {
            _hashCode += getBindingKey().hashCode();
        }
        if (getAccessPoint() != null) {
            _hashCode += getAccessPoint().hashCode();
        }
        if (getBindingProperties() != null) {
            for (int i=0;
                 i<java.lang.reflect.Array.getLength(getBindingProperties());
                 i++) {
                java.lang.Object obj = java.lang.reflect.Array.get(getBindingProperties(), i);
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
        new org.apache.axis.description.TypeDesc(Binding.class, true);

    static {
        typeDesc.setXmlType(new javax.xml.namespace.QName("http://Microsoft/ConnectedServicesSandbox/2006/11/SandboxApi/", "Binding"));
        org.apache.axis.description.ElementDesc elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("bindingKey");
        elemField.setXmlName(new javax.xml.namespace.QName("http://Microsoft/ConnectedServicesSandbox/2006/11/SandboxApi/", "BindingKey"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://www.w3.org/2001/XMLSchema", "string"));
        elemField.setNillable(false);
        typeDesc.addFieldDesc(elemField);
        elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("accessPoint");
        elemField.setXmlName(new javax.xml.namespace.QName("http://Microsoft/ConnectedServicesSandbox/2006/11/SandboxApi/", "AccessPoint"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://www.w3.org/2001/XMLSchema", "anyURI"));
        elemField.setMinOccurs(0);
        elemField.setNillable(false);
        typeDesc.addFieldDesc(elemField);
        elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("bindingProperties");
        elemField.setXmlName(new javax.xml.namespace.QName("http://Microsoft/ConnectedServicesSandbox/2006/11/SandboxApi/", "BindingProperties"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://Microsoft/ConnectedServicesSandbox/2006/11/SandboxApi/", "NameValuePair"));
        elemField.setMinOccurs(0);
        elemField.setNillable(false);
        elemField.setItemQName(new javax.xml.namespace.QName("http://Microsoft/ConnectedServicesSandbox/2006/11/SandboxApi/", "BindingProperty"));
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
