package com.topcoder.shared.problem;

import com.topcoder.shared.netCommon.CSReader;
import com.topcoder.shared.netCommon.CSWriter;

import java.io.IOException;

/**
 * An element to hold information about a Web Service.
 *
 * @author mitalub
 */
public class WebService extends BaseElement implements Element {
    private String name = "";
    private String javaDocAddress = "";
    private int webServiceId = -1;
    private int componentId = -1;


    public WebService() {
    }

    /**
     * The name of the web service.
     */
    public void setName(String name) {
        this.name = name;
    }

    /**
     * The name of the web service.
     */
    public String getName() {
        return name;
    }

    public void setJavaDocAddress(String javaDocAddress) {
        this.javaDocAddress = javaDocAddress;
    }

    public String getJavaDocAddress() {
        return javaDocAddress;
    }

    public void setWebServiceId(int webServiceId) {
        this.webServiceId = webServiceId;
    }

    public int getWebServiceId() {
        return webServiceId;
    }

    public void setComponentId(int componentId) {
        this.componentId = componentId;
    }

    public int getComponentId() {
        return componentId;
    }

    public void customWriteObject(CSWriter writer) throws IOException {
        writer.writeString(name);
        writer.writeString(javaDocAddress);
        writer.writeInt(webServiceId);
        writer.writeInt(componentId);
    }

    public void customReadObject(CSReader reader) throws IOException {
        name = reader.readString();
        javaDocAddress = reader.readString();
        webServiceId = reader.readInt();
        componentId = reader.readInt();
    }


    public String toXML() {
        StringBuffer xml = new StringBuffer();
        xml.append("<web-service>");
        xml.append("<name>");
        xml.append(name);
        xml.append("</name>");
        xml.append("</web-service>");
        return xml.toString();
    }
}
