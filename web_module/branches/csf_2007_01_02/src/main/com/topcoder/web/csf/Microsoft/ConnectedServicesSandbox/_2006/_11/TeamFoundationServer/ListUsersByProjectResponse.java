/**
 * ListUsersByProjectResponse.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis 1.4 Apr 22, 2006 (06:55:48 PDT) WSDL2Java emitter.
 */

package com.topcoder.web.csf.Microsoft.ConnectedServicesSandbox._2006._11.TeamFoundationServer;

public class ListUsersByProjectResponse  extends TfsBaseRequest  implements java.io.Serializable {
    private UsersByProject[] usersList;

    public ListUsersByProjectResponse() {
    }

    public ListUsersByProjectResponse(
           java.lang.String userId,
           java.lang.String coRelationId,
           java.lang.String serverName,
           java.lang.String coUserName,
           java.lang.String password,
           java.lang.String coDomain,
           UsersByProject[] usersList) {
        super(
            userId,
            coRelationId,
            serverName,
            coUserName,
            password,
            coDomain);
        this.usersList = usersList;
    }


    /**
     * Gets the usersList value for this ListUsersByProjectResponse.
     * 
     * @return usersList
     */
    public UsersByProject[] getUsersList() {
        return usersList;
    }


    /**
     * Sets the usersList value for this ListUsersByProjectResponse.
     * 
     * @param usersList
     */
    public void setUsersList(UsersByProject[] usersList) {
        this.usersList = usersList;
    }

    private java.lang.Object __equalsCalc = null;
    public synchronized boolean equals(java.lang.Object obj) {
        if (!(obj instanceof ListUsersByProjectResponse)) return false;
        ListUsersByProjectResponse other = (ListUsersByProjectResponse) obj;
        if (obj == null) return false;
        if (this == obj) return true;
        if (__equalsCalc != null) {
            return (__equalsCalc == obj);
        }
        __equalsCalc = obj;
        boolean _equals;
        _equals = super.equals(obj) && 
            ((this.usersList==null && other.getUsersList()==null) || 
             (this.usersList!=null &&
              java.util.Arrays.equals(this.usersList, other.getUsersList())));
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
        if (getUsersList() != null) {
            for (int i=0;
                 i<java.lang.reflect.Array.getLength(getUsersList());
                 i++) {
                java.lang.Object obj = java.lang.reflect.Array.get(getUsersList(), i);
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
        new org.apache.axis.description.TypeDesc(ListUsersByProjectResponse.class, true);

    static {
        typeDesc.setXmlType(new javax.xml.namespace.QName("http://Microsoft/ConnectedServicesSandbox/2006/11/TeamFoundationServer/", "ListUsersByProjectResponse"));
        org.apache.axis.description.ElementDesc elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("usersList");
        elemField.setXmlName(new javax.xml.namespace.QName("http://Microsoft/ConnectedServicesSandbox/2006/11/TeamFoundationServer/", "UsersList"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://Microsoft/ConnectedServicesSandbox/2006/11/TeamFoundationServer/", "UsersByProject"));
        elemField.setMinOccurs(0);
        elemField.setNillable(false);
        elemField.setItemQName(new javax.xml.namespace.QName("http://Microsoft/ConnectedServicesSandbox/2006/11/TeamFoundationServer/", "UsersByProject"));
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
