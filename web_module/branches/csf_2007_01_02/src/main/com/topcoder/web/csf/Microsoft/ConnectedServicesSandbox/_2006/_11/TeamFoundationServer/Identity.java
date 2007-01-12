/**
 * Identity.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis 1.4 Apr 22, 2006 (06:55:48 PDT) WSDL2Java emitter.
 */

package com.topcoder.web.csf.Microsoft.ConnectedServicesSandbox._2006._11.TeamFoundationServer;

public class Identity  implements java.io.Serializable {
    private java.lang.String accountName;

    private boolean deleted;

    private java.lang.String description;

    private java.lang.String displayName;

    private java.lang.String distinguishedName;

    private java.lang.String domain;

    private java.lang.String[] memberOf;

    private java.lang.String[] members;

    private boolean securityGroup;

    private java.lang.String sid;

    private SpecialTypes specialType;

    private Types type;

    private java.lang.String[] membersUserName;

    public Identity() {
    }

    public Identity(
           java.lang.String accountName,
           boolean deleted,
           java.lang.String description,
           java.lang.String displayName,
           java.lang.String distinguishedName,
           java.lang.String domain,
           java.lang.String[] memberOf,
           java.lang.String[] members,
           boolean securityGroup,
           java.lang.String sid,
           SpecialTypes specialType,
           Types type,
           java.lang.String[] membersUserName) {
           this.accountName = accountName;
           this.deleted = deleted;
           this.description = description;
           this.displayName = displayName;
           this.distinguishedName = distinguishedName;
           this.domain = domain;
           this.memberOf = memberOf;
           this.members = members;
           this.securityGroup = securityGroup;
           this.sid = sid;
           this.specialType = specialType;
           this.type = type;
           this.membersUserName = membersUserName;
    }


    /**
     * Gets the accountName value for this Identity.
     * 
     * @return accountName
     */
    public java.lang.String getAccountName() {
        return accountName;
    }


    /**
     * Sets the accountName value for this Identity.
     * 
     * @param accountName
     */
    public void setAccountName(java.lang.String accountName) {
        this.accountName = accountName;
    }


    /**
     * Gets the deleted value for this Identity.
     * 
     * @return deleted
     */
    public boolean isDeleted() {
        return deleted;
    }


    /**
     * Sets the deleted value for this Identity.
     * 
     * @param deleted
     */
    public void setDeleted(boolean deleted) {
        this.deleted = deleted;
    }


    /**
     * Gets the description value for this Identity.
     * 
     * @return description
     */
    public java.lang.String getDescription() {
        return description;
    }


    /**
     * Sets the description value for this Identity.
     * 
     * @param description
     */
    public void setDescription(java.lang.String description) {
        this.description = description;
    }


    /**
     * Gets the displayName value for this Identity.
     * 
     * @return displayName
     */
    public java.lang.String getDisplayName() {
        return displayName;
    }


    /**
     * Sets the displayName value for this Identity.
     * 
     * @param displayName
     */
    public void setDisplayName(java.lang.String displayName) {
        this.displayName = displayName;
    }


    /**
     * Gets the distinguishedName value for this Identity.
     * 
     * @return distinguishedName
     */
    public java.lang.String getDistinguishedName() {
        return distinguishedName;
    }


    /**
     * Sets the distinguishedName value for this Identity.
     * 
     * @param distinguishedName
     */
    public void setDistinguishedName(java.lang.String distinguishedName) {
        this.distinguishedName = distinguishedName;
    }


    /**
     * Gets the domain value for this Identity.
     * 
     * @return domain
     */
    public java.lang.String getDomain() {
        return domain;
    }


    /**
     * Sets the domain value for this Identity.
     * 
     * @param domain
     */
    public void setDomain(java.lang.String domain) {
        this.domain = domain;
    }


    /**
     * Gets the memberOf value for this Identity.
     * 
     * @return memberOf
     */
    public java.lang.String[] getMemberOf() {
        return memberOf;
    }


    /**
     * Sets the memberOf value for this Identity.
     * 
     * @param memberOf
     */
    public void setMemberOf(java.lang.String[] memberOf) {
        this.memberOf = memberOf;
    }

    public java.lang.String getMemberOf(int i) {
        return this.memberOf[i];
    }

    public void setMemberOf(int i, java.lang.String _value) {
        this.memberOf[i] = _value;
    }


    /**
     * Gets the members value for this Identity.
     * 
     * @return members
     */
    public java.lang.String[] getMembers() {
        return members;
    }


    /**
     * Sets the members value for this Identity.
     * 
     * @param members
     */
    public void setMembers(java.lang.String[] members) {
        this.members = members;
    }

    public java.lang.String getMembers(int i) {
        return this.members[i];
    }

    public void setMembers(int i, java.lang.String _value) {
        this.members[i] = _value;
    }


    /**
     * Gets the securityGroup value for this Identity.
     * 
     * @return securityGroup
     */
    public boolean isSecurityGroup() {
        return securityGroup;
    }


    /**
     * Sets the securityGroup value for this Identity.
     * 
     * @param securityGroup
     */
    public void setSecurityGroup(boolean securityGroup) {
        this.securityGroup = securityGroup;
    }


    /**
     * Gets the sid value for this Identity.
     * 
     * @return sid
     */
    public java.lang.String getSid() {
        return sid;
    }


    /**
     * Sets the sid value for this Identity.
     * 
     * @param sid
     */
    public void setSid(java.lang.String sid) {
        this.sid = sid;
    }


    /**
     * Gets the specialType value for this Identity.
     * 
     * @return specialType
     */
    public SpecialTypes getSpecialType() {
        return specialType;
    }


    /**
     * Sets the specialType value for this Identity.
     * 
     * @param specialType
     */
    public void setSpecialType(SpecialTypes specialType) {
        this.specialType = specialType;
    }


    /**
     * Gets the type value for this Identity.
     * 
     * @return type
     */
    public Types getType() {
        return type;
    }


    /**
     * Sets the type value for this Identity.
     * 
     * @param type
     */
    public void setType(Types type) {
        this.type = type;
    }


    /**
     * Gets the membersUserName value for this Identity.
     * 
     * @return membersUserName
     */
    public java.lang.String[] getMembersUserName() {
        return membersUserName;
    }


    /**
     * Sets the membersUserName value for this Identity.
     * 
     * @param membersUserName
     */
    public void setMembersUserName(java.lang.String[] membersUserName) {
        this.membersUserName = membersUserName;
    }

    public java.lang.String getMembersUserName(int i) {
        return this.membersUserName[i];
    }

    public void setMembersUserName(int i, java.lang.String _value) {
        this.membersUserName[i] = _value;
    }

    private java.lang.Object __equalsCalc = null;
    public synchronized boolean equals(java.lang.Object obj) {
        if (!(obj instanceof Identity)) return false;
        Identity other = (Identity) obj;
        if (obj == null) return false;
        if (this == obj) return true;
        if (__equalsCalc != null) {
            return (__equalsCalc == obj);
        }
        __equalsCalc = obj;
        boolean _equals;
        _equals = true && 
            ((this.accountName==null && other.getAccountName()==null) || 
             (this.accountName!=null &&
              this.accountName.equals(other.getAccountName()))) &&
            this.deleted == other.isDeleted() &&
            ((this.description==null && other.getDescription()==null) || 
             (this.description!=null &&
              this.description.equals(other.getDescription()))) &&
            ((this.displayName==null && other.getDisplayName()==null) || 
             (this.displayName!=null &&
              this.displayName.equals(other.getDisplayName()))) &&
            ((this.distinguishedName==null && other.getDistinguishedName()==null) || 
             (this.distinguishedName!=null &&
              this.distinguishedName.equals(other.getDistinguishedName()))) &&
            ((this.domain==null && other.getDomain()==null) || 
             (this.domain!=null &&
              this.domain.equals(other.getDomain()))) &&
            ((this.memberOf==null && other.getMemberOf()==null) || 
             (this.memberOf!=null &&
              java.util.Arrays.equals(this.memberOf, other.getMemberOf()))) &&
            ((this.members==null && other.getMembers()==null) || 
             (this.members!=null &&
              java.util.Arrays.equals(this.members, other.getMembers()))) &&
            this.securityGroup == other.isSecurityGroup() &&
            ((this.sid==null && other.getSid()==null) || 
             (this.sid!=null &&
              this.sid.equals(other.getSid()))) &&
            ((this.specialType==null && other.getSpecialType()==null) || 
             (this.specialType!=null &&
              this.specialType.equals(other.getSpecialType()))) &&
            ((this.type==null && other.getType()==null) || 
             (this.type!=null &&
              this.type.equals(other.getType()))) &&
            ((this.membersUserName==null && other.getMembersUserName()==null) || 
             (this.membersUserName!=null &&
              java.util.Arrays.equals(this.membersUserName, other.getMembersUserName())));
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
        if (getAccountName() != null) {
            _hashCode += getAccountName().hashCode();
        }
        _hashCode += (isDeleted() ? Boolean.TRUE : Boolean.FALSE).hashCode();
        if (getDescription() != null) {
            _hashCode += getDescription().hashCode();
        }
        if (getDisplayName() != null) {
            _hashCode += getDisplayName().hashCode();
        }
        if (getDistinguishedName() != null) {
            _hashCode += getDistinguishedName().hashCode();
        }
        if (getDomain() != null) {
            _hashCode += getDomain().hashCode();
        }
        if (getMemberOf() != null) {
            for (int i=0;
                 i<java.lang.reflect.Array.getLength(getMemberOf());
                 i++) {
                java.lang.Object obj = java.lang.reflect.Array.get(getMemberOf(), i);
                if (obj != null &&
                    !obj.getClass().isArray()) {
                    _hashCode += obj.hashCode();
                }
            }
        }
        if (getMembers() != null) {
            for (int i=0;
                 i<java.lang.reflect.Array.getLength(getMembers());
                 i++) {
                java.lang.Object obj = java.lang.reflect.Array.get(getMembers(), i);
                if (obj != null &&
                    !obj.getClass().isArray()) {
                    _hashCode += obj.hashCode();
                }
            }
        }
        _hashCode += (isSecurityGroup() ? Boolean.TRUE : Boolean.FALSE).hashCode();
        if (getSid() != null) {
            _hashCode += getSid().hashCode();
        }
        if (getSpecialType() != null) {
            _hashCode += getSpecialType().hashCode();
        }
        if (getType() != null) {
            _hashCode += getType().hashCode();
        }
        if (getMembersUserName() != null) {
            for (int i=0;
                 i<java.lang.reflect.Array.getLength(getMembersUserName());
                 i++) {
                java.lang.Object obj = java.lang.reflect.Array.get(getMembersUserName(), i);
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
        new org.apache.axis.description.TypeDesc(Identity.class, true);

    static {
        typeDesc.setXmlType(new javax.xml.namespace.QName("http://Microsoft/ConnectedServicesSandbox/2006/11/TeamFoundationServer/", "Identity"));
        org.apache.axis.description.ElementDesc elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("accountName");
        elemField.setXmlName(new javax.xml.namespace.QName("http://Microsoft/ConnectedServicesSandbox/2006/11/TeamFoundationServer/", "AccountName"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://www.w3.org/2001/XMLSchema", "string"));
        elemField.setMinOccurs(0);
        elemField.setNillable(false);
        typeDesc.addFieldDesc(elemField);
        elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("deleted");
        elemField.setXmlName(new javax.xml.namespace.QName("http://Microsoft/ConnectedServicesSandbox/2006/11/TeamFoundationServer/", "Deleted"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://www.w3.org/2001/XMLSchema", "boolean"));
        elemField.setNillable(false);
        typeDesc.addFieldDesc(elemField);
        elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("description");
        elemField.setXmlName(new javax.xml.namespace.QName("http://Microsoft/ConnectedServicesSandbox/2006/11/TeamFoundationServer/", "Description"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://www.w3.org/2001/XMLSchema", "string"));
        elemField.setMinOccurs(0);
        elemField.setNillable(false);
        typeDesc.addFieldDesc(elemField);
        elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("displayName");
        elemField.setXmlName(new javax.xml.namespace.QName("http://Microsoft/ConnectedServicesSandbox/2006/11/TeamFoundationServer/", "DisplayName"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://www.w3.org/2001/XMLSchema", "string"));
        elemField.setMinOccurs(0);
        elemField.setNillable(false);
        typeDesc.addFieldDesc(elemField);
        elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("distinguishedName");
        elemField.setXmlName(new javax.xml.namespace.QName("http://Microsoft/ConnectedServicesSandbox/2006/11/TeamFoundationServer/", "DistinguishedName"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://www.w3.org/2001/XMLSchema", "string"));
        elemField.setMinOccurs(0);
        elemField.setNillable(false);
        typeDesc.addFieldDesc(elemField);
        elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("domain");
        elemField.setXmlName(new javax.xml.namespace.QName("http://Microsoft/ConnectedServicesSandbox/2006/11/TeamFoundationServer/", "Domain"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://www.w3.org/2001/XMLSchema", "string"));
        elemField.setMinOccurs(0);
        elemField.setNillable(false);
        typeDesc.addFieldDesc(elemField);
        elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("memberOf");
        elemField.setXmlName(new javax.xml.namespace.QName("http://Microsoft/ConnectedServicesSandbox/2006/11/TeamFoundationServer/", "MemberOf"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://www.w3.org/2001/XMLSchema", "string"));
        elemField.setMinOccurs(0);
        elemField.setNillable(false);
        elemField.setMaxOccursUnbounded(true);
        typeDesc.addFieldDesc(elemField);
        elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("members");
        elemField.setXmlName(new javax.xml.namespace.QName("http://Microsoft/ConnectedServicesSandbox/2006/11/TeamFoundationServer/", "Members"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://www.w3.org/2001/XMLSchema", "string"));
        elemField.setMinOccurs(0);
        elemField.setNillable(false);
        elemField.setMaxOccursUnbounded(true);
        typeDesc.addFieldDesc(elemField);
        elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("securityGroup");
        elemField.setXmlName(new javax.xml.namespace.QName("http://Microsoft/ConnectedServicesSandbox/2006/11/TeamFoundationServer/", "SecurityGroup"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://www.w3.org/2001/XMLSchema", "boolean"));
        elemField.setNillable(false);
        typeDesc.addFieldDesc(elemField);
        elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("sid");
        elemField.setXmlName(new javax.xml.namespace.QName("http://Microsoft/ConnectedServicesSandbox/2006/11/TeamFoundationServer/", "Sid"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://www.w3.org/2001/XMLSchema", "string"));
        elemField.setMinOccurs(0);
        elemField.setNillable(false);
        typeDesc.addFieldDesc(elemField);
        elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("specialType");
        elemField.setXmlName(new javax.xml.namespace.QName("http://Microsoft/ConnectedServicesSandbox/2006/11/TeamFoundationServer/", "SpecialType"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://Microsoft/ConnectedServicesSandbox/2006/11/TeamFoundationServer/", "SpecialTypes"));
        elemField.setNillable(false);
        typeDesc.addFieldDesc(elemField);
        elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("type");
        elemField.setXmlName(new javax.xml.namespace.QName("http://Microsoft/ConnectedServicesSandbox/2006/11/TeamFoundationServer/", "Type"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://Microsoft/ConnectedServicesSandbox/2006/11/TeamFoundationServer/", "Types"));
        elemField.setNillable(false);
        typeDesc.addFieldDesc(elemField);
        elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("membersUserName");
        elemField.setXmlName(new javax.xml.namespace.QName("http://Microsoft/ConnectedServicesSandbox/2006/11/TeamFoundationServer/", "MembersUserName"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://www.w3.org/2001/XMLSchema", "string"));
        elemField.setMinOccurs(0);
        elemField.setNillable(false);
        elemField.setMaxOccursUnbounded(true);
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
