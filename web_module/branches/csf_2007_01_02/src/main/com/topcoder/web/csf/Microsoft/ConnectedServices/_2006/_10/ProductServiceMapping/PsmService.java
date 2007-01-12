/**
 * PsmService.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis 1.4 Apr 22, 2006 (06:55:48 PDT) WSDL2Java emitter.
 */

package com.topcoder.web.csf.Microsoft.ConnectedServices._2006._10.ProductServiceMapping;

public class PsmService  implements java.io.Serializable {
    private java.lang.String serviceId;

    private java.lang.String serviceUuid;

    private java.lang.String serviceAction;

    private java.lang.String description;

    private PsmNameValuePair[] characterizedBy;

    private PsmBillingSummery[] billingDetails;

    public PsmService() {
    }

    public PsmService(
           java.lang.String serviceId,
           java.lang.String serviceUuid,
           java.lang.String serviceAction,
           java.lang.String description,
           PsmNameValuePair[] characterizedBy,
           PsmBillingSummery[] billingDetails) {
           this.serviceId = serviceId;
           this.serviceUuid = serviceUuid;
           this.serviceAction = serviceAction;
           this.description = description;
           this.characterizedBy = characterizedBy;
           this.billingDetails = billingDetails;
    }


    /**
     * Gets the serviceId value for this PsmService.
     * 
     * @return serviceId
     */
    public java.lang.String getServiceId() {
        return serviceId;
    }


    /**
     * Sets the serviceId value for this PsmService.
     * 
     * @param serviceId
     */
    public void setServiceId(java.lang.String serviceId) {
        this.serviceId = serviceId;
    }


    /**
     * Gets the serviceUuid value for this PsmService.
     * 
     * @return serviceUuid
     */
    public java.lang.String getServiceUuid() {
        return serviceUuid;
    }


    /**
     * Sets the serviceUuid value for this PsmService.
     * 
     * @param serviceUuid
     */
    public void setServiceUuid(java.lang.String serviceUuid) {
        this.serviceUuid = serviceUuid;
    }


    /**
     * Gets the serviceAction value for this PsmService.
     * 
     * @return serviceAction
     */
    public java.lang.String getServiceAction() {
        return serviceAction;
    }


    /**
     * Sets the serviceAction value for this PsmService.
     * 
     * @param serviceAction
     */
    public void setServiceAction(java.lang.String serviceAction) {
        this.serviceAction = serviceAction;
    }


    /**
     * Gets the description value for this PsmService.
     * 
     * @return description
     */
    public java.lang.String getDescription() {
        return description;
    }


    /**
     * Sets the description value for this PsmService.
     * 
     * @param description
     */
    public void setDescription(java.lang.String description) {
        this.description = description;
    }


    /**
     * Gets the characterizedBy value for this PsmService.
     * 
     * @return characterizedBy
     */
    public PsmNameValuePair[] getCharacterizedBy() {
        return characterizedBy;
    }


    /**
     * Sets the characterizedBy value for this PsmService.
     * 
     * @param characterizedBy
     */
    public void setCharacterizedBy(PsmNameValuePair[] characterizedBy) {
        this.characterizedBy = characterizedBy;
    }


    /**
     * Gets the billingDetails value for this PsmService.
     * 
     * @return billingDetails
     */
    public PsmBillingSummery[] getBillingDetails() {
        return billingDetails;
    }


    /**
     * Sets the billingDetails value for this PsmService.
     * 
     * @param billingDetails
     */
    public void setBillingDetails(PsmBillingSummery[] billingDetails) {
        this.billingDetails = billingDetails;
    }

    private java.lang.Object __equalsCalc = null;
    public synchronized boolean equals(java.lang.Object obj) {
        if (!(obj instanceof PsmService)) return false;
        PsmService other = (PsmService) obj;
        if (obj == null) return false;
        if (this == obj) return true;
        if (__equalsCalc != null) {
            return (__equalsCalc == obj);
        }
        __equalsCalc = obj;
        boolean _equals;
        _equals = true && 
            ((this.serviceId==null && other.getServiceId()==null) || 
             (this.serviceId!=null &&
              this.serviceId.equals(other.getServiceId()))) &&
            ((this.serviceUuid==null && other.getServiceUuid()==null) || 
             (this.serviceUuid!=null &&
              this.serviceUuid.equals(other.getServiceUuid()))) &&
            ((this.serviceAction==null && other.getServiceAction()==null) || 
             (this.serviceAction!=null &&
              this.serviceAction.equals(other.getServiceAction()))) &&
            ((this.description==null && other.getDescription()==null) || 
             (this.description!=null &&
              this.description.equals(other.getDescription()))) &&
            ((this.characterizedBy==null && other.getCharacterizedBy()==null) || 
             (this.characterizedBy!=null &&
              java.util.Arrays.equals(this.characterizedBy, other.getCharacterizedBy()))) &&
            ((this.billingDetails==null && other.getBillingDetails()==null) || 
             (this.billingDetails!=null &&
              java.util.Arrays.equals(this.billingDetails, other.getBillingDetails())));
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
        if (getServiceId() != null) {
            _hashCode += getServiceId().hashCode();
        }
        if (getServiceUuid() != null) {
            _hashCode += getServiceUuid().hashCode();
        }
        if (getServiceAction() != null) {
            _hashCode += getServiceAction().hashCode();
        }
        if (getDescription() != null) {
            _hashCode += getDescription().hashCode();
        }
        if (getCharacterizedBy() != null) {
            for (int i=0;
                 i<java.lang.reflect.Array.getLength(getCharacterizedBy());
                 i++) {
                java.lang.Object obj = java.lang.reflect.Array.get(getCharacterizedBy(), i);
                if (obj != null &&
                    !obj.getClass().isArray()) {
                    _hashCode += obj.hashCode();
                }
            }
        }
        if (getBillingDetails() != null) {
            for (int i=0;
                 i<java.lang.reflect.Array.getLength(getBillingDetails());
                 i++) {
                java.lang.Object obj = java.lang.reflect.Array.get(getBillingDetails(), i);
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
        new org.apache.axis.description.TypeDesc(PsmService.class, true);

    static {
        typeDesc.setXmlType(new javax.xml.namespace.QName("http://Microsoft/ConnectedServices/2006/10/ProductServiceMapping/", "PsmService"));
        org.apache.axis.description.ElementDesc elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("serviceId");
        elemField.setXmlName(new javax.xml.namespace.QName("http://Microsoft/ConnectedServices/2006/10/ProductServiceMapping/", "ServiceId"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://www.w3.org/2001/XMLSchema", "string"));
        elemField.setMinOccurs(0);
        elemField.setNillable(false);
        typeDesc.addFieldDesc(elemField);
        elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("serviceUuid");
        elemField.setXmlName(new javax.xml.namespace.QName("http://Microsoft/ConnectedServices/2006/10/ProductServiceMapping/", "ServiceUuid"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://www.w3.org/2001/XMLSchema", "string"));
        elemField.setMinOccurs(0);
        elemField.setNillable(false);
        typeDesc.addFieldDesc(elemField);
        elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("serviceAction");
        elemField.setXmlName(new javax.xml.namespace.QName("http://Microsoft/ConnectedServices/2006/10/ProductServiceMapping/", "ServiceAction"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://www.w3.org/2001/XMLSchema", "string"));
        elemField.setMinOccurs(0);
        elemField.setNillable(false);
        typeDesc.addFieldDesc(elemField);
        elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("description");
        elemField.setXmlName(new javax.xml.namespace.QName("http://Microsoft/ConnectedServices/2006/10/ProductServiceMapping/", "Description"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://www.w3.org/2001/XMLSchema", "string"));
        elemField.setMinOccurs(0);
        elemField.setNillable(false);
        typeDesc.addFieldDesc(elemField);
        elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("characterizedBy");
        elemField.setXmlName(new javax.xml.namespace.QName("http://Microsoft/ConnectedServices/2006/10/ProductServiceMapping/", "CharacterizedBy"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://Microsoft/ConnectedServices/2006/10/ProductServiceMapping/", "PsmNameValuePair"));
        elemField.setMinOccurs(0);
        elemField.setNillable(false);
        elemField.setItemQName(new javax.xml.namespace.QName("http://Microsoft/ConnectedServices/2006/10/ProductServiceMapping/", "PsmNameValuePair"));
        typeDesc.addFieldDesc(elemField);
        elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("billingDetails");
        elemField.setXmlName(new javax.xml.namespace.QName("http://Microsoft/ConnectedServices/2006/10/ProductServiceMapping/", "BillingDetails"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://Microsoft/ConnectedServices/2006/10/ProductServiceMapping/", "PsmBillingSummery"));
        elemField.setMinOccurs(0);
        elemField.setNillable(false);
        elemField.setItemQName(new javax.xml.namespace.QName("http://Microsoft/ConnectedServices/2006/10/ProductServiceMapping/", "PsmBillingSummery"));
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
