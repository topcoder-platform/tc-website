/**
 * SandboxUser.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis 1.4 Apr 22, 2006 (06:55:48 PDT) WSDL2Java emitter.
 */

package com.topcoder.web.csf.Microsoft.ConnectedServicesSandbox._2006._11.UserProfileManager;

public class SandboxUser  implements java.io.Serializable {
    private java.lang.String userId;

    private java.lang.String companyName;

    private UserType type;

    private java.lang.String partnerCode;

    private AccountState accountState;

    private java.lang.String stateMessage;

    private boolean canCreateAccount;

    private java.lang.String passportToken;

    private int domainId;

    private int clientId;

    private java.lang.String domainName;

    private java.lang.String webHostUrl;

    private java.lang.String IPAddress;

    public SandboxUser() {
    }

    public SandboxUser(
           java.lang.String userId,
           java.lang.String companyName,
           UserType type,
           java.lang.String partnerCode,
           AccountState accountState,
           java.lang.String stateMessage,
           boolean canCreateAccount,
           java.lang.String passportToken,
           int domainId,
           int clientId,
           java.lang.String domainName,
           java.lang.String webHostUrl,
           java.lang.String IPAddress) {
           this.userId = userId;
           this.companyName = companyName;
           this.type = type;
           this.partnerCode = partnerCode;
           this.accountState = accountState;
           this.stateMessage = stateMessage;
           this.canCreateAccount = canCreateAccount;
           this.passportToken = passportToken;
           this.domainId = domainId;
           this.clientId = clientId;
           this.domainName = domainName;
           this.webHostUrl = webHostUrl;
           this.IPAddress = IPAddress;
    }


    /**
     * Gets the userId value for this SandboxUser.
     * 
     * @return userId
     */
    public java.lang.String getUserId() {
        return userId;
    }


    /**
     * Sets the userId value for this SandboxUser.
     * 
     * @param userId
     */
    public void setUserId(java.lang.String userId) {
        this.userId = userId;
    }


    /**
     * Gets the companyName value for this SandboxUser.
     * 
     * @return companyName
     */
    public java.lang.String getCompanyName() {
        return companyName;
    }


    /**
     * Sets the companyName value for this SandboxUser.
     * 
     * @param companyName
     */
    public void setCompanyName(java.lang.String companyName) {
        this.companyName = companyName;
    }


    /**
     * Gets the type value for this SandboxUser.
     * 
     * @return type
     */
    public UserType getType() {
        return type;
    }


    /**
     * Sets the type value for this SandboxUser.
     * 
     * @param type
     */
    public void setType(UserType type) {
        this.type = type;
    }


    /**
     * Gets the partnerCode value for this SandboxUser.
     * 
     * @return partnerCode
     */
    public java.lang.String getPartnerCode() {
        return partnerCode;
    }


    /**
     * Sets the partnerCode value for this SandboxUser.
     * 
     * @param partnerCode
     */
    public void setPartnerCode(java.lang.String partnerCode) {
        this.partnerCode = partnerCode;
    }


    /**
     * Gets the accountState value for this SandboxUser.
     * 
     * @return accountState
     */
    public AccountState getAccountState() {
        return accountState;
    }


    /**
     * Sets the accountState value for this SandboxUser.
     * 
     * @param accountState
     */
    public void setAccountState(AccountState accountState) {
        this.accountState = accountState;
    }


    /**
     * Gets the stateMessage value for this SandboxUser.
     * 
     * @return stateMessage
     */
    public java.lang.String getStateMessage() {
        return stateMessage;
    }


    /**
     * Sets the stateMessage value for this SandboxUser.
     * 
     * @param stateMessage
     */
    public void setStateMessage(java.lang.String stateMessage) {
        this.stateMessage = stateMessage;
    }


    /**
     * Gets the canCreateAccount value for this SandboxUser.
     * 
     * @return canCreateAccount
     */
    public boolean isCanCreateAccount() {
        return canCreateAccount;
    }


    /**
     * Sets the canCreateAccount value for this SandboxUser.
     * 
     * @param canCreateAccount
     */
    public void setCanCreateAccount(boolean canCreateAccount) {
        this.canCreateAccount = canCreateAccount;
    }


    /**
     * Gets the passportToken value for this SandboxUser.
     * 
     * @return passportToken
     */
    public java.lang.String getPassportToken() {
        return passportToken;
    }


    /**
     * Sets the passportToken value for this SandboxUser.
     * 
     * @param passportToken
     */
    public void setPassportToken(java.lang.String passportToken) {
        this.passportToken = passportToken;
    }


    /**
     * Gets the domainId value for this SandboxUser.
     * 
     * @return domainId
     */
    public int getDomainId() {
        return domainId;
    }


    /**
     * Sets the domainId value for this SandboxUser.
     * 
     * @param domainId
     */
    public void setDomainId(int domainId) {
        this.domainId = domainId;
    }


    /**
     * Gets the clientId value for this SandboxUser.
     * 
     * @return clientId
     */
    public int getClientId() {
        return clientId;
    }


    /**
     * Sets the clientId value for this SandboxUser.
     * 
     * @param clientId
     */
    public void setClientId(int clientId) {
        this.clientId = clientId;
    }


    /**
     * Gets the domainName value for this SandboxUser.
     * 
     * @return domainName
     */
    public java.lang.String getDomainName() {
        return domainName;
    }


    /**
     * Sets the domainName value for this SandboxUser.
     * 
     * @param domainName
     */
    public void setDomainName(java.lang.String domainName) {
        this.domainName = domainName;
    }


    /**
     * Gets the webHostUrl value for this SandboxUser.
     * 
     * @return webHostUrl
     */
    public java.lang.String getWebHostUrl() {
        return webHostUrl;
    }


    /**
     * Sets the webHostUrl value for this SandboxUser.
     * 
     * @param webHostUrl
     */
    public void setWebHostUrl(java.lang.String webHostUrl) {
        this.webHostUrl = webHostUrl;
    }


    /**
     * Gets the IPAddress value for this SandboxUser.
     * 
     * @return IPAddress
     */
    public java.lang.String getIPAddress() {
        return IPAddress;
    }


    /**
     * Sets the IPAddress value for this SandboxUser.
     * 
     * @param IPAddress
     */
    public void setIPAddress(java.lang.String IPAddress) {
        this.IPAddress = IPAddress;
    }

    private java.lang.Object __equalsCalc = null;
    public synchronized boolean equals(java.lang.Object obj) {
        if (!(obj instanceof SandboxUser)) return false;
        SandboxUser other = (SandboxUser) obj;
        if (obj == null) return false;
        if (this == obj) return true;
        if (__equalsCalc != null) {
            return (__equalsCalc == obj);
        }
        __equalsCalc = obj;
        boolean _equals;
        _equals = true && 
            ((this.userId==null && other.getUserId()==null) || 
             (this.userId!=null &&
              this.userId.equals(other.getUserId()))) &&
            ((this.companyName==null && other.getCompanyName()==null) || 
             (this.companyName!=null &&
              this.companyName.equals(other.getCompanyName()))) &&
            ((this.type==null && other.getType()==null) || 
             (this.type!=null &&
              this.type.equals(other.getType()))) &&
            ((this.partnerCode==null && other.getPartnerCode()==null) || 
             (this.partnerCode!=null &&
              this.partnerCode.equals(other.getPartnerCode()))) &&
            ((this.accountState==null && other.getAccountState()==null) || 
             (this.accountState!=null &&
              this.accountState.equals(other.getAccountState()))) &&
            ((this.stateMessage==null && other.getStateMessage()==null) || 
             (this.stateMessage!=null &&
              this.stateMessage.equals(other.getStateMessage()))) &&
            this.canCreateAccount == other.isCanCreateAccount() &&
            ((this.passportToken==null && other.getPassportToken()==null) || 
             (this.passportToken!=null &&
              this.passportToken.equals(other.getPassportToken()))) &&
            this.domainId == other.getDomainId() &&
            this.clientId == other.getClientId() &&
            ((this.domainName==null && other.getDomainName()==null) || 
             (this.domainName!=null &&
              this.domainName.equals(other.getDomainName()))) &&
            ((this.webHostUrl==null && other.getWebHostUrl()==null) || 
             (this.webHostUrl!=null &&
              this.webHostUrl.equals(other.getWebHostUrl()))) &&
            ((this.IPAddress==null && other.getIPAddress()==null) || 
             (this.IPAddress!=null &&
              this.IPAddress.equals(other.getIPAddress())));
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
        if (getUserId() != null) {
            _hashCode += getUserId().hashCode();
        }
        if (getCompanyName() != null) {
            _hashCode += getCompanyName().hashCode();
        }
        if (getType() != null) {
            _hashCode += getType().hashCode();
        }
        if (getPartnerCode() != null) {
            _hashCode += getPartnerCode().hashCode();
        }
        if (getAccountState() != null) {
            _hashCode += getAccountState().hashCode();
        }
        if (getStateMessage() != null) {
            _hashCode += getStateMessage().hashCode();
        }
        _hashCode += (isCanCreateAccount() ? Boolean.TRUE : Boolean.FALSE).hashCode();
        if (getPassportToken() != null) {
            _hashCode += getPassportToken().hashCode();
        }
        _hashCode += getDomainId();
        _hashCode += getClientId();
        if (getDomainName() != null) {
            _hashCode += getDomainName().hashCode();
        }
        if (getWebHostUrl() != null) {
            _hashCode += getWebHostUrl().hashCode();
        }
        if (getIPAddress() != null) {
            _hashCode += getIPAddress().hashCode();
        }
        __hashCodeCalc = false;
        return _hashCode;
    }

    // Type metadata
    private static org.apache.axis.description.TypeDesc typeDesc =
        new org.apache.axis.description.TypeDesc(SandboxUser.class, true);

    static {
        typeDesc.setXmlType(new javax.xml.namespace.QName("http://Microsoft/ConnectedServicesSandbox/2006/11/UserProfileManager/", "SandboxUser"));
        org.apache.axis.description.ElementDesc elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("userId");
        elemField.setXmlName(new javax.xml.namespace.QName("http://Microsoft/ConnectedServicesSandbox/2006/11/UserProfileManager/", "UserId"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://www.w3.org/2001/XMLSchema", "string"));
        elemField.setMinOccurs(0);
        elemField.setNillable(false);
        typeDesc.addFieldDesc(elemField);
        elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("companyName");
        elemField.setXmlName(new javax.xml.namespace.QName("http://Microsoft/ConnectedServicesSandbox/2006/11/UserProfileManager/", "CompanyName"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://www.w3.org/2001/XMLSchema", "string"));
        elemField.setMinOccurs(0);
        elemField.setNillable(false);
        typeDesc.addFieldDesc(elemField);
        elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("type");
        elemField.setXmlName(new javax.xml.namespace.QName("http://Microsoft/ConnectedServicesSandbox/2006/11/UserProfileManager/", "Type"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://Microsoft/ConnectedServicesSandbox/2006/11/UserProfileManager/", "UserType"));
        elemField.setNillable(false);
        typeDesc.addFieldDesc(elemField);
        elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("partnerCode");
        elemField.setXmlName(new javax.xml.namespace.QName("http://Microsoft/ConnectedServicesSandbox/2006/11/UserProfileManager/", "PartnerCode"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://www.w3.org/2001/XMLSchema", "string"));
        elemField.setMinOccurs(0);
        elemField.setNillable(false);
        typeDesc.addFieldDesc(elemField);
        elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("accountState");
        elemField.setXmlName(new javax.xml.namespace.QName("http://Microsoft/ConnectedServicesSandbox/2006/11/UserProfileManager/", "AccountState"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://Microsoft/ConnectedServicesSandbox/2006/11/UserProfileManager/", "AccountState"));
        elemField.setNillable(false);
        typeDesc.addFieldDesc(elemField);
        elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("stateMessage");
        elemField.setXmlName(new javax.xml.namespace.QName("http://Microsoft/ConnectedServicesSandbox/2006/11/UserProfileManager/", "StateMessage"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://www.w3.org/2001/XMLSchema", "string"));
        elemField.setMinOccurs(0);
        elemField.setNillable(false);
        typeDesc.addFieldDesc(elemField);
        elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("canCreateAccount");
        elemField.setXmlName(new javax.xml.namespace.QName("http://Microsoft/ConnectedServicesSandbox/2006/11/UserProfileManager/", "CanCreateAccount"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://www.w3.org/2001/XMLSchema", "boolean"));
        elemField.setNillable(false);
        typeDesc.addFieldDesc(elemField);
        elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("passportToken");
        elemField.setXmlName(new javax.xml.namespace.QName("http://Microsoft/ConnectedServicesSandbox/2006/11/UserProfileManager/", "PassportToken"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://www.w3.org/2001/XMLSchema", "string"));
        elemField.setMinOccurs(0);
        elemField.setNillable(false);
        typeDesc.addFieldDesc(elemField);
        elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("domainId");
        elemField.setXmlName(new javax.xml.namespace.QName("http://Microsoft/ConnectedServicesSandbox/2006/11/UserProfileManager/", "DomainId"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://www.w3.org/2001/XMLSchema", "int"));
        elemField.setNillable(false);
        typeDesc.addFieldDesc(elemField);
        elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("clientId");
        elemField.setXmlName(new javax.xml.namespace.QName("http://Microsoft/ConnectedServicesSandbox/2006/11/UserProfileManager/", "ClientId"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://www.w3.org/2001/XMLSchema", "int"));
        elemField.setNillable(false);
        typeDesc.addFieldDesc(elemField);
        elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("domainName");
        elemField.setXmlName(new javax.xml.namespace.QName("http://Microsoft/ConnectedServicesSandbox/2006/11/UserProfileManager/", "DomainName"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://www.w3.org/2001/XMLSchema", "string"));
        elemField.setMinOccurs(0);
        elemField.setNillable(false);
        typeDesc.addFieldDesc(elemField);
        elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("webHostUrl");
        elemField.setXmlName(new javax.xml.namespace.QName("http://Microsoft/ConnectedServicesSandbox/2006/11/UserProfileManager/", "WebHostUrl"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://www.w3.org/2001/XMLSchema", "string"));
        elemField.setMinOccurs(0);
        elemField.setNillable(false);
        typeDesc.addFieldDesc(elemField);
        elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("IPAddress");
        elemField.setXmlName(new javax.xml.namespace.QName("http://Microsoft/ConnectedServicesSandbox/2006/11/UserProfileManager/", "IPAddress"));
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
