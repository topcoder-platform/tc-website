/**
 * Sandbox10Locator.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis 1.4 Apr 22, 2006 (06:55:48 PDT) WSDL2Java emitter.
 */

package com.topcoder.web.csf.Microsoft.ConnectedServicesSandbox._2006._11.SandboxApi;

public class Sandbox10Locator extends org.apache.axis.client.Service implements Sandbox10 {

    public Sandbox10Locator() {
    }


    public Sandbox10Locator(org.apache.axis.EngineConfiguration config) {
        super(config);
    }

    public Sandbox10Locator(java.lang.String wsdlLoc, javax.xml.namespace.QName sName) throws javax.xml.rpc.ServiceException {
        super(wsdlLoc, sName);
    }

    // Use to get a proxy class for Sandbox10Soap12
    //private java.lang.String Sandbox10Soap12_address = "http://127.0.0.1/SandboxApiInterface/Sandbox10.asmx";
    private java.lang.String Sandbox10Soap12_address = "http://sandboxapp.networkmashups.com/SandboxApiInterface/Sandbox10.asmx";

    public java.lang.String getSandbox10Soap12Address() {
        return Sandbox10Soap12_address;
    }

    // The WSDD service name defaults to the port name.
    private java.lang.String Sandbox10Soap12WSDDServiceName = "Sandbox10Soap12";

    public java.lang.String getSandbox10Soap12WSDDServiceName() {
        return Sandbox10Soap12WSDDServiceName;
    }

    public void setSandbox10Soap12WSDDServiceName(java.lang.String name) {
        Sandbox10Soap12WSDDServiceName = name;
    }

    public Sandbox10Soap getSandbox10Soap12() throws javax.xml.rpc.ServiceException {
       java.net.URL endpoint;
        try {
            endpoint = new java.net.URL(Sandbox10Soap12_address);
        }
        catch (java.net.MalformedURLException e) {
            throw new javax.xml.rpc.ServiceException(e);
        }
        return getSandbox10Soap12(endpoint);
    }

    public Sandbox10Soap getSandbox10Soap12(java.net.URL portAddress) throws javax.xml.rpc.ServiceException {
        try {
            Sandbox10Soap12Stub _stub = new Sandbox10Soap12Stub(portAddress, this);
            _stub.setPortName(getSandbox10Soap12WSDDServiceName());
            return _stub;
        }
        catch (org.apache.axis.AxisFault e) {
            return null;
        }
    }

    public void setSandbox10Soap12EndpointAddress(java.lang.String address) {
        Sandbox10Soap12_address = address;
    }


    // Use to get a proxy class for Sandbox10Soap
    //private java.lang.String Sandbox10Soap_address = "http://127.0.0.1/SandboxApiInterface/Sandbox10.asmx";
    private java.lang.String Sandbox10Soap_address = "http://sandboxapp.networkmashups.com/SandboxApiInterface/Sandbox10.asmx";

    public java.lang.String getSandbox10SoapAddress() {
        return Sandbox10Soap_address;
    }

    // The WSDD service name defaults to the port name.
    private java.lang.String Sandbox10SoapWSDDServiceName = "Sandbox10Soap";

    public java.lang.String getSandbox10SoapWSDDServiceName() {
        return Sandbox10SoapWSDDServiceName;
    }

    public void setSandbox10SoapWSDDServiceName(java.lang.String name) {
        Sandbox10SoapWSDDServiceName = name;
    }

    public Sandbox10Soap getSandbox10Soap() throws javax.xml.rpc.ServiceException {
       java.net.URL endpoint;
        try {
            endpoint = new java.net.URL(Sandbox10Soap_address);
        }
        catch (java.net.MalformedURLException e) {
            throw new javax.xml.rpc.ServiceException(e);
        }
        return getSandbox10Soap(endpoint);
    }

    public Sandbox10Soap getSandbox10Soap(java.net.URL portAddress) throws javax.xml.rpc.ServiceException {
        try {
            Sandbox10SoapStub _stub = new Sandbox10SoapStub(portAddress, this);
            _stub.setPortName(getSandbox10SoapWSDDServiceName());
            return _stub;
        }
        catch (org.apache.axis.AxisFault e) {
            return null;
        }
    }

    public void setSandbox10SoapEndpointAddress(java.lang.String address) {
        Sandbox10Soap_address = address;
    }

    /**
     * For the given interface, get the stub implementation.
     * If this service has no port for the given interface,
     * then ServiceException is thrown.
     * This service has multiple ports for a given interface;
     * the proxy implementation returned may be indeterminate.
     */
    public java.rmi.Remote getPort(Class serviceEndpointInterface) throws javax.xml.rpc.ServiceException {
        try {
            if (Sandbox10Soap.class.isAssignableFrom(serviceEndpointInterface)) {
                Sandbox10Soap12Stub _stub = new Sandbox10Soap12Stub(new java.net.URL(Sandbox10Soap12_address), this);
                _stub.setPortName(getSandbox10Soap12WSDDServiceName());
                return _stub;
            }
            if (Sandbox10Soap.class.isAssignableFrom(serviceEndpointInterface)) {
                Sandbox10SoapStub _stub = new Sandbox10SoapStub(new java.net.URL(Sandbox10Soap_address), this);
                _stub.setPortName(getSandbox10SoapWSDDServiceName());
                return _stub;
            }
        }
        catch (java.lang.Throwable t) {
            throw new javax.xml.rpc.ServiceException(t);
        }
        throw new javax.xml.rpc.ServiceException("There is no stub implementation for the interface:  " + (serviceEndpointInterface == null ? "null" : serviceEndpointInterface.getName()));
    }

    /**
     * For the given interface, get the stub implementation.
     * If this service has no port for the given interface,
     * then ServiceException is thrown.
     */
    public java.rmi.Remote getPort(javax.xml.namespace.QName portName, Class serviceEndpointInterface) throws javax.xml.rpc.ServiceException {
        if (portName == null) {
            return getPort(serviceEndpointInterface);
        }
        java.lang.String inputPortName = portName.getLocalPart();
        if ("Sandbox10Soap12".equals(inputPortName)) {
            return getSandbox10Soap12();
        }
        else if ("Sandbox10Soap".equals(inputPortName)) {
            return getSandbox10Soap();
        }
        else  {
            java.rmi.Remote _stub = getPort(serviceEndpointInterface);
            ((org.apache.axis.client.Stub) _stub).setPortName(portName);
            return _stub;
        }
    }

    public javax.xml.namespace.QName getServiceName() {
        return new javax.xml.namespace.QName("http://Microsoft/ConnectedServicesSandbox/2006/11/SandboxApi/", "Sandbox10");
    }

    private java.util.HashSet ports = null;

    public java.util.Iterator getPorts() {
        if (ports == null) {
            ports = new java.util.HashSet();
            ports.add(new javax.xml.namespace.QName("http://Microsoft/ConnectedServicesSandbox/2006/11/SandboxApi/", "Sandbox10Soap12"));
            ports.add(new javax.xml.namespace.QName("http://Microsoft/ConnectedServicesSandbox/2006/11/SandboxApi/", "Sandbox10Soap"));
        }
        return ports.iterator();
    }

    /**
    * Set the endpoint address for the specified port name.
    */
    public void setEndpointAddress(java.lang.String portName, java.lang.String address) throws javax.xml.rpc.ServiceException {
        
if ("Sandbox10Soap12".equals(portName)) {
            setSandbox10Soap12EndpointAddress(address);
        }
        else 
if ("Sandbox10Soap".equals(portName)) {
            setSandbox10SoapEndpointAddress(address);
        }
        else 
{ // Unknown Port Name
            throw new javax.xml.rpc.ServiceException(" Cannot set Endpoint Address for Unknown Port" + portName);
        }
    }

    /**
    * Set the endpoint address for the specified port name.
    */
    public void setEndpointAddress(javax.xml.namespace.QName portName, java.lang.String address) throws javax.xml.rpc.ServiceException {
        setEndpointAddress(portName.getLocalPart(), address);
    }

}
