/**
 * Product.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis 1.4 Apr 22, 2006 (06:55:48 PDT) WSDL2Java emitter.
 */

package com.topcoder.web.csf.Microsoft.ConnectedServicesSandbox._2006._11.SandboxApi;

import com.topcoder.web.csf.Microsoft.ConnectedServices._2006._10.ProductServiceMapping.PsmService;

public class Product  implements java.io.Serializable {
    private java.lang.String username;

    private java.lang.String productname;

    private java.lang.String requestUuid;

    private java.lang.String productOfferingId;

    private java.lang.String description;

    private java.lang.String[] category;

    private java.lang.String[] tag;

    private ProductSpecification productSpecification;

    private java.lang.String action;

    private Accessibility accessibilityLevel;

    private java.lang.String companyUrl;

    private java.lang.String serviceUrl;

    private java.lang.String userGuide;

    private java.lang.String requiredDownloads;

    private java.lang.String subscriptionUrl;

    private java.util.Calendar createDate;

    private java.util.Calendar updateDate;

    private PsmService[] involvesServices;

    public Product() {
    }

    public Product(
           java.lang.String username,
           java.lang.String productname,
           java.lang.String requestUuid,
           java.lang.String productOfferingId,
           java.lang.String description,
           java.lang.String[] category,
           java.lang.String[] tag,
           ProductSpecification productSpecification,
           java.lang.String action,
           Accessibility accessibilityLevel,
           java.lang.String companyUrl,
           java.lang.String serviceUrl,
           java.lang.String userGuide,
           java.lang.String requiredDownloads,
           java.lang.String subscriptionUrl,
           java.util.Calendar createDate,
           java.util.Calendar updateDate,
           PsmService[] involvesServices) {
           this.username = username;
           this.productname = productname;
           this.requestUuid = requestUuid;
           this.productOfferingId = productOfferingId;
           this.description = description;
           this.category = category;
           this.tag = tag;
           this.productSpecification = productSpecification;
           this.action = action;
           this.accessibilityLevel = accessibilityLevel;
           this.companyUrl = companyUrl;
           this.serviceUrl = serviceUrl;
           this.userGuide = userGuide;
           this.requiredDownloads = requiredDownloads;
           this.subscriptionUrl = subscriptionUrl;
           this.createDate = createDate;
           this.updateDate = updateDate;
           this.involvesServices = involvesServices;
    }


    /**
     * Gets the username value for this Product.
     * 
     * @return username
     */
    public java.lang.String getUsername() {
        return username;
    }


    /**
     * Sets the username value for this Product.
     * 
     * @param username
     */
    public void setUsername(java.lang.String username) {
        this.username = username;
    }


    /**
     * Gets the productname value for this Product.
     * 
     * @return productname
     */
    public java.lang.String getProductname() {
        return productname;
    }


    /**
     * Sets the productname value for this Product.
     * 
     * @param productname
     */
    public void setProductname(java.lang.String productname) {
        this.productname = productname;
    }


    /**
     * Gets the requestUuid value for this Product.
     * 
     * @return requestUuid
     */
    public java.lang.String getRequestUuid() {
        return requestUuid;
    }


    /**
     * Sets the requestUuid value for this Product.
     * 
     * @param requestUuid
     */
    public void setRequestUuid(java.lang.String requestUuid) {
        this.requestUuid = requestUuid;
    }


    /**
     * Gets the productOfferingId value for this Product.
     * 
     * @return productOfferingId
     */
    public java.lang.String getProductOfferingId() {
        return productOfferingId;
    }


    /**
     * Sets the productOfferingId value for this Product.
     * 
     * @param productOfferingId
     */
    public void setProductOfferingId(java.lang.String productOfferingId) {
        this.productOfferingId = productOfferingId;
    }


    /**
     * Gets the description value for this Product.
     * 
     * @return description
     */
    public java.lang.String getDescription() {
        return description;
    }


    /**
     * Sets the description value for this Product.
     * 
     * @param description
     */
    public void setDescription(java.lang.String description) {
        this.description = description;
    }


    /**
     * Gets the category value for this Product.
     * 
     * @return category
     */
    public java.lang.String[] getCategory() {
        return category;
    }


    /**
     * Sets the category value for this Product.
     * 
     * @param category
     */
    public void setCategory(java.lang.String[] category) {
        this.category = category;
    }


    /**
     * Gets the tag value for this Product.
     * 
     * @return tag
     */
    public java.lang.String[] getTag() {
        return tag;
    }


    /**
     * Sets the tag value for this Product.
     * 
     * @param tag
     */
    public void setTag(java.lang.String[] tag) {
        this.tag = tag;
    }


    /**
     * Gets the productSpecification value for this Product.
     * 
     * @return productSpecification
     */
    public ProductSpecification getProductSpecification() {
        return productSpecification;
    }


    /**
     * Sets the productSpecification value for this Product.
     * 
     * @param productSpecification
     */
    public void setProductSpecification(ProductSpecification productSpecification) {
        this.productSpecification = productSpecification;
    }


    /**
     * Gets the action value for this Product.
     * 
     * @return action
     */
    public java.lang.String getAction() {
        return action;
    }


    /**
     * Sets the action value for this Product.
     * 
     * @param action
     */
    public void setAction(java.lang.String action) {
        this.action = action;
    }


    /**
     * Gets the accessibilityLevel value for this Product.
     * 
     * @return accessibilityLevel
     */
    public Accessibility getAccessibilityLevel() {
        return accessibilityLevel;
    }


    /**
     * Sets the accessibilityLevel value for this Product.
     * 
     * @param accessibilityLevel
     */
    public void setAccessibilityLevel(Accessibility accessibilityLevel) {
        this.accessibilityLevel = accessibilityLevel;
    }


    /**
     * Gets the companyUrl value for this Product.
     * 
     * @return companyUrl
     */
    public java.lang.String getCompanyUrl() {
        return companyUrl;
    }


    /**
     * Sets the companyUrl value for this Product.
     * 
     * @param companyUrl
     */
    public void setCompanyUrl(java.lang.String companyUrl) {
        this.companyUrl = companyUrl;
    }


    /**
     * Gets the serviceUrl value for this Product.
     * 
     * @return serviceUrl
     */
    public java.lang.String getServiceUrl() {
        return serviceUrl;
    }


    /**
     * Sets the serviceUrl value for this Product.
     * 
     * @param serviceUrl
     */
    public void setServiceUrl(java.lang.String serviceUrl) {
        this.serviceUrl = serviceUrl;
    }


    /**
     * Gets the userGuide value for this Product.
     * 
     * @return userGuide
     */
    public java.lang.String getUserGuide() {
        return userGuide;
    }


    /**
     * Sets the userGuide value for this Product.
     * 
     * @param userGuide
     */
    public void setUserGuide(java.lang.String userGuide) {
        this.userGuide = userGuide;
    }


    /**
     * Gets the requiredDownloads value for this Product.
     * 
     * @return requiredDownloads
     */
    public java.lang.String getRequiredDownloads() {
        return requiredDownloads;
    }


    /**
     * Sets the requiredDownloads value for this Product.
     * 
     * @param requiredDownloads
     */
    public void setRequiredDownloads(java.lang.String requiredDownloads) {
        this.requiredDownloads = requiredDownloads;
    }


    /**
     * Gets the subscriptionUrl value for this Product.
     * 
     * @return subscriptionUrl
     */
    public java.lang.String getSubscriptionUrl() {
        return subscriptionUrl;
    }


    /**
     * Sets the subscriptionUrl value for this Product.
     * 
     * @param subscriptionUrl
     */
    public void setSubscriptionUrl(java.lang.String subscriptionUrl) {
        this.subscriptionUrl = subscriptionUrl;
    }


    /**
     * Gets the createDate value for this Product.
     * 
     * @return createDate
     */
    public java.util.Calendar getCreateDate() {
        return createDate;
    }


    /**
     * Sets the createDate value for this Product.
     * 
     * @param createDate
     */
    public void setCreateDate(java.util.Calendar createDate) {
        this.createDate = createDate;
    }


    /**
     * Gets the updateDate value for this Product.
     * 
     * @return updateDate
     */
    public java.util.Calendar getUpdateDate() {
        return updateDate;
    }


    /**
     * Sets the updateDate value for this Product.
     * 
     * @param updateDate
     */
    public void setUpdateDate(java.util.Calendar updateDate) {
        this.updateDate = updateDate;
    }


    /**
     * Gets the involvesServices value for this Product.
     * 
     * @return involvesServices
     */
    public PsmService[] getInvolvesServices() {
        return involvesServices;
    }


    /**
     * Sets the involvesServices value for this Product.
     * 
     * @param involvesServices
     */
    public void setInvolvesServices(PsmService[] involvesServices) {
        this.involvesServices = involvesServices;
    }

    private java.lang.Object __equalsCalc = null;
    public synchronized boolean equals(java.lang.Object obj) {
        if (!(obj instanceof Product)) return false;
        Product other = (Product) obj;
        if (obj == null) return false;
        if (this == obj) return true;
        if (__equalsCalc != null) {
            return (__equalsCalc == obj);
        }
        __equalsCalc = obj;
        boolean _equals;
        _equals = true && 
            ((this.username==null && other.getUsername()==null) || 
             (this.username!=null &&
              this.username.equals(other.getUsername()))) &&
            ((this.productname==null && other.getProductname()==null) || 
             (this.productname!=null &&
              this.productname.equals(other.getProductname()))) &&
            ((this.requestUuid==null && other.getRequestUuid()==null) || 
             (this.requestUuid!=null &&
              this.requestUuid.equals(other.getRequestUuid()))) &&
            ((this.productOfferingId==null && other.getProductOfferingId()==null) || 
             (this.productOfferingId!=null &&
              this.productOfferingId.equals(other.getProductOfferingId()))) &&
            ((this.description==null && other.getDescription()==null) || 
             (this.description!=null &&
              this.description.equals(other.getDescription()))) &&
            ((this.category==null && other.getCategory()==null) || 
             (this.category!=null &&
              java.util.Arrays.equals(this.category, other.getCategory()))) &&
            ((this.tag==null && other.getTag()==null) || 
             (this.tag!=null &&
              java.util.Arrays.equals(this.tag, other.getTag()))) &&
            ((this.productSpecification==null && other.getProductSpecification()==null) || 
             (this.productSpecification!=null &&
              this.productSpecification.equals(other.getProductSpecification()))) &&
            ((this.action==null && other.getAction()==null) || 
             (this.action!=null &&
              this.action.equals(other.getAction()))) &&
            ((this.accessibilityLevel==null && other.getAccessibilityLevel()==null) || 
             (this.accessibilityLevel!=null &&
              this.accessibilityLevel.equals(other.getAccessibilityLevel()))) &&
            ((this.companyUrl==null && other.getCompanyUrl()==null) || 
             (this.companyUrl!=null &&
              this.companyUrl.equals(other.getCompanyUrl()))) &&
            ((this.serviceUrl==null && other.getServiceUrl()==null) || 
             (this.serviceUrl!=null &&
              this.serviceUrl.equals(other.getServiceUrl()))) &&
            ((this.userGuide==null && other.getUserGuide()==null) || 
             (this.userGuide!=null &&
              this.userGuide.equals(other.getUserGuide()))) &&
            ((this.requiredDownloads==null && other.getRequiredDownloads()==null) || 
             (this.requiredDownloads!=null &&
              this.requiredDownloads.equals(other.getRequiredDownloads()))) &&
            ((this.subscriptionUrl==null && other.getSubscriptionUrl()==null) || 
             (this.subscriptionUrl!=null &&
              this.subscriptionUrl.equals(other.getSubscriptionUrl()))) &&
            ((this.createDate==null && other.getCreateDate()==null) || 
             (this.createDate!=null &&
              this.createDate.equals(other.getCreateDate()))) &&
            ((this.updateDate==null && other.getUpdateDate()==null) || 
             (this.updateDate!=null &&
              this.updateDate.equals(other.getUpdateDate()))) &&
            ((this.involvesServices==null && other.getInvolvesServices()==null) || 
             (this.involvesServices!=null &&
              java.util.Arrays.equals(this.involvesServices, other.getInvolvesServices())));
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
        if (getUsername() != null) {
            _hashCode += getUsername().hashCode();
        }
        if (getProductname() != null) {
            _hashCode += getProductname().hashCode();
        }
        if (getRequestUuid() != null) {
            _hashCode += getRequestUuid().hashCode();
        }
        if (getProductOfferingId() != null) {
            _hashCode += getProductOfferingId().hashCode();
        }
        if (getDescription() != null) {
            _hashCode += getDescription().hashCode();
        }
        if (getCategory() != null) {
            for (int i=0;
                 i<java.lang.reflect.Array.getLength(getCategory());
                 i++) {
                java.lang.Object obj = java.lang.reflect.Array.get(getCategory(), i);
                if (obj != null &&
                    !obj.getClass().isArray()) {
                    _hashCode += obj.hashCode();
                }
            }
        }
        if (getTag() != null) {
            for (int i=0;
                 i<java.lang.reflect.Array.getLength(getTag());
                 i++) {
                java.lang.Object obj = java.lang.reflect.Array.get(getTag(), i);
                if (obj != null &&
                    !obj.getClass().isArray()) {
                    _hashCode += obj.hashCode();
                }
            }
        }
        if (getProductSpecification() != null) {
            _hashCode += getProductSpecification().hashCode();
        }
        if (getAction() != null) {
            _hashCode += getAction().hashCode();
        }
        if (getAccessibilityLevel() != null) {
            _hashCode += getAccessibilityLevel().hashCode();
        }
        if (getCompanyUrl() != null) {
            _hashCode += getCompanyUrl().hashCode();
        }
        if (getServiceUrl() != null) {
            _hashCode += getServiceUrl().hashCode();
        }
        if (getUserGuide() != null) {
            _hashCode += getUserGuide().hashCode();
        }
        if (getRequiredDownloads() != null) {
            _hashCode += getRequiredDownloads().hashCode();
        }
        if (getSubscriptionUrl() != null) {
            _hashCode += getSubscriptionUrl().hashCode();
        }
        if (getCreateDate() != null) {
            _hashCode += getCreateDate().hashCode();
        }
        if (getUpdateDate() != null) {
            _hashCode += getUpdateDate().hashCode();
        }
        if (getInvolvesServices() != null) {
            for (int i=0;
                 i<java.lang.reflect.Array.getLength(getInvolvesServices());
                 i++) {
                java.lang.Object obj = java.lang.reflect.Array.get(getInvolvesServices(), i);
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
        new org.apache.axis.description.TypeDesc(Product.class, true);

    static {
        typeDesc.setXmlType(new javax.xml.namespace.QName("http://Microsoft/ConnectedServicesSandbox/2006/11/SandboxApi/", "Product"));
        org.apache.axis.description.ElementDesc elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("username");
        elemField.setXmlName(new javax.xml.namespace.QName("http://Microsoft/ConnectedServicesSandbox/2006/11/SandboxApi/", "Username"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://www.w3.org/2001/XMLSchema", "string"));
        elemField.setMinOccurs(0);
        elemField.setNillable(false);
        typeDesc.addFieldDesc(elemField);
        elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("productname");
        elemField.setXmlName(new javax.xml.namespace.QName("http://Microsoft/ConnectedServicesSandbox/2006/11/SandboxApi/", "Productname"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://www.w3.org/2001/XMLSchema", "string"));
        elemField.setMinOccurs(0);
        elemField.setNillable(false);
        typeDesc.addFieldDesc(elemField);
        elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("requestUuid");
        elemField.setXmlName(new javax.xml.namespace.QName("http://Microsoft/ConnectedServicesSandbox/2006/11/SandboxApi/", "RequestUuid"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://www.w3.org/2001/XMLSchema", "string"));
        elemField.setMinOccurs(0);
        elemField.setNillable(false);
        typeDesc.addFieldDesc(elemField);
        elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("productOfferingId");
        elemField.setXmlName(new javax.xml.namespace.QName("http://Microsoft/ConnectedServicesSandbox/2006/11/SandboxApi/", "ProductOfferingId"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://www.w3.org/2001/XMLSchema", "string"));
        elemField.setMinOccurs(0);
        elemField.setNillable(false);
        typeDesc.addFieldDesc(elemField);
        elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("description");
        elemField.setXmlName(new javax.xml.namespace.QName("http://Microsoft/ConnectedServicesSandbox/2006/11/SandboxApi/", "Description"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://www.w3.org/2001/XMLSchema", "string"));
        elemField.setMinOccurs(0);
        elemField.setNillable(false);
        typeDesc.addFieldDesc(elemField);
        elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("category");
        elemField.setXmlName(new javax.xml.namespace.QName("http://Microsoft/ConnectedServicesSandbox/2006/11/SandboxApi/", "Category"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://www.w3.org/2001/XMLSchema", "string"));
        elemField.setMinOccurs(0);
        elemField.setNillable(false);
        elemField.setItemQName(new javax.xml.namespace.QName("http://Microsoft/ConnectedServicesSandbox/2006/11/SandboxApi/", "string"));
        typeDesc.addFieldDesc(elemField);
        elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("tag");
        elemField.setXmlName(new javax.xml.namespace.QName("http://Microsoft/ConnectedServicesSandbox/2006/11/SandboxApi/", "Tag"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://www.w3.org/2001/XMLSchema", "string"));
        elemField.setMinOccurs(0);
        elemField.setNillable(false);
        elemField.setItemQName(new javax.xml.namespace.QName("http://Microsoft/ConnectedServicesSandbox/2006/11/SandboxApi/", "string"));
        typeDesc.addFieldDesc(elemField);
        elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("productSpecification");
        elemField.setXmlName(new javax.xml.namespace.QName("http://Microsoft/ConnectedServicesSandbox/2006/11/SandboxApi/", "ProductSpecification"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://Microsoft/ConnectedServicesSandbox/2006/11/SandboxApi/", "ProductSpecification"));
        elemField.setMinOccurs(0);
        elemField.setNillable(false);
        typeDesc.addFieldDesc(elemField);
        elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("action");
        elemField.setXmlName(new javax.xml.namespace.QName("http://Microsoft/ConnectedServicesSandbox/2006/11/SandboxApi/", "Action"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://www.w3.org/2001/XMLSchema", "string"));
        elemField.setMinOccurs(0);
        elemField.setNillable(false);
        typeDesc.addFieldDesc(elemField);
        elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("accessibilityLevel");
        elemField.setXmlName(new javax.xml.namespace.QName("http://Microsoft/ConnectedServicesSandbox/2006/11/SandboxApi/", "AccessibilityLevel"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://Microsoft/ConnectedServicesSandbox/2006/11/SandboxApi/", "Accessibility"));
        elemField.setNillable(false);
        typeDesc.addFieldDesc(elemField);
        elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("companyUrl");
        elemField.setXmlName(new javax.xml.namespace.QName("http://Microsoft/ConnectedServicesSandbox/2006/11/SandboxApi/", "CompanyUrl"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://www.w3.org/2001/XMLSchema", "string"));
        elemField.setMinOccurs(0);
        elemField.setNillable(false);
        typeDesc.addFieldDesc(elemField);
        elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("serviceUrl");
        elemField.setXmlName(new javax.xml.namespace.QName("http://Microsoft/ConnectedServicesSandbox/2006/11/SandboxApi/", "ServiceUrl"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://www.w3.org/2001/XMLSchema", "string"));
        elemField.setMinOccurs(0);
        elemField.setNillable(false);
        typeDesc.addFieldDesc(elemField);
        elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("userGuide");
        elemField.setXmlName(new javax.xml.namespace.QName("http://Microsoft/ConnectedServicesSandbox/2006/11/SandboxApi/", "UserGuide"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://www.w3.org/2001/XMLSchema", "string"));
        elemField.setMinOccurs(0);
        elemField.setNillable(false);
        typeDesc.addFieldDesc(elemField);
        elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("requiredDownloads");
        elemField.setXmlName(new javax.xml.namespace.QName("http://Microsoft/ConnectedServicesSandbox/2006/11/SandboxApi/", "RequiredDownloads"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://www.w3.org/2001/XMLSchema", "string"));
        elemField.setMinOccurs(0);
        elemField.setNillable(false);
        typeDesc.addFieldDesc(elemField);
        elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("subscriptionUrl");
        elemField.setXmlName(new javax.xml.namespace.QName("http://Microsoft/ConnectedServicesSandbox/2006/11/SandboxApi/", "SubscriptionUrl"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://www.w3.org/2001/XMLSchema", "string"));
        elemField.setMinOccurs(0);
        elemField.setNillable(false);
        typeDesc.addFieldDesc(elemField);
        elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("createDate");
        elemField.setXmlName(new javax.xml.namespace.QName("http://Microsoft/ConnectedServicesSandbox/2006/11/SandboxApi/", "CreateDate"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://www.w3.org/2001/XMLSchema", "dateTime"));
        elemField.setNillable(false);
        typeDesc.addFieldDesc(elemField);
        elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("updateDate");
        elemField.setXmlName(new javax.xml.namespace.QName("http://Microsoft/ConnectedServicesSandbox/2006/11/SandboxApi/", "UpdateDate"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://www.w3.org/2001/XMLSchema", "dateTime"));
        elemField.setNillable(false);
        typeDesc.addFieldDesc(elemField);
        elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("involvesServices");
        elemField.setXmlName(new javax.xml.namespace.QName("http://Microsoft/ConnectedServicesSandbox/2006/11/SandboxApi/", "InvolvesServices"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://Microsoft/ConnectedServices/2006/10/ProductServiceMapping/", "PsmService"));
        elemField.setMinOccurs(0);
        elemField.setNillable(false);
        elemField.setItemQName(new javax.xml.namespace.QName("http://Microsoft/ConnectedServicesSandbox/2006/11/SandboxApi/", "PsmService"));
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
