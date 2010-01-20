/*
 * Copyright (c) 2006-2010 TopCoder, Inc. All rights reserved.
 */
package com.topcoder.web.tc.controller.request.data;

import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.TCResourceBundle;
import com.topcoder.web.common.CachedDataAccess;
import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.common.SecurityHelper;
import com.topcoder.web.common.cache.MaxAge;
import com.topcoder.web.common.security.DataResource;
import com.topcoder.web.common.security.TCSAuthorization;
import com.topcoder.web.tc.Constants;
import com.topcoder.web.tc.controller.request.Base;
import org.xml.sax.Attributes;
import org.xml.sax.SAXException;
import org.xml.sax.helpers.AttributesImpl;

import javax.xml.transform.OutputKeys;
import javax.xml.transform.Transformer;
import javax.xml.transform.sax.SAXTransformerFactory;
import javax.xml.transform.sax.TransformerHandler;
import javax.xml.transform.stream.StreamResult;
import java.io.ByteArrayOutputStream;
import java.io.OutputStream;
import java.security.MessageDigest;
import java.util.Map;

/**
 * <p>
 * Get information for all public catalog components, and publish
 * them as xml based feeds.
 * </p>
 * 
 * @author Vitta
 * @version 1.0
 */
public class ComponentXMLFeed extends Base {
    /**
     * The CDATA prefix
     */
    private static final String CDATA_PREFIX = "<![CDATA[";

    /**
     * The CDATA suffix
     */
    private static final String CDATA_SUFFIX = "]]>";
    /**
     * Resource bundle. Represent the ComponentXMLFeed bundle.
     */
    private static final TCResourceBundle componentXMLFeedBundle = new TCResourceBundle("ComponentXMLFeed");
    /**
     * Resource bundle. Represent the ApplicationServer bundle.
     */
    private static final TCResourceBundle tcBundle = new TCResourceBundle("ApplicationServer");   

    /**
     * Implement the major business.
     */
    protected void businessProcessing() throws Exception {
        //Key of the request.
        String key = "component_xml_feed";
        Request r = new Request();
        r.setProperties(getRequest().getParameterMap());
        r.setProperty("c", key);

        // Set datasource name to th default value/
        int ds = Constants.TCS_OLTP_DATASOURCE_ID;

        DataResource resource = new DataResource(r.getContentHandle(), ds);
        if (new TCSAuthorization(SecurityHelper.getUserSubject(getUser().getId())).hasPermission(resource)) {
            //Get results from the cache.
            MaxAge maxAge = MaxAge.THREE_HOUR;
            Map<String, ResultSetContainer> m = new CachedDataAccess(maxAge, getDataSource(ds)).getData(r);

            ResultSetContainer rsc = m.get(key);

            getResponse().setContentType("text/xml");
            OutputStream os = getResponse().getOutputStream();
            ByteArrayOutputStream baos = new ByteArrayOutputStream();
            
            StreamResult streamResult = new StreamResult(baos);
            SAXTransformerFactory tf = (SAXTransformerFactory) SAXTransformerFactory.newInstance();
            TransformerHandler hd = tf.newTransformerHandler();
            Transformer serializer = hd.getTransformer();
            serializer.setOutputProperty(OutputKeys.ENCODING, "ISO-8859-1");
            serializer.setOutputProperty(OutputKeys.INDENT, "no");
            hd.setResult(streamResult);
            hd.startDocument();
            //Set the prefix.
            AttributesImpl prefixAttr = new AttributesImpl();
            prefixAttr.addAttribute("", "", "xmlns:xsi", "", "http://www.w3.org/2001/XMLSchema-instance");
            prefixAttr.addAttribute("", "", "xsi:schemaLocation", "",
                    "http://www.w3.org/1999/02/22-rdf-syntax-ns# ../xsd/bds-rdf-doap-docschema.xsd");
            prefixAttr.addAttribute("", "", "xmlns:bds", "", "http://www.blackducksoftware.com/doapext#");
            prefixAttr.addAttribute("", "", "xmlns:dc", "", "http://purl.org/dc/elements/1.1/");
            prefixAttr.addAttribute("", "", "xmlns:foaf", "", "http://xmlns.com/foaf/0.1/");
            prefixAttr.addAttribute("", "", "xmlns:rdf", "", "http://www.w3.org/1999/02/22-rdf-syntax-ns#");
            prefixAttr.addAttribute("", "", "xmlns:doap", "", "http://usefulinc.com/ns/doap#");
            prefixAttr.addAttribute("", "", "xmlns", "", "http://usefulinc.com/ns/doap#");
            hd.startElement("", "", "rdf:RDF", prefixAttr);

            AttributesImpl emptyAtts = new AttributesImpl();
            //Get information from bundle.
            String SVNHOST = componentXMLFeedBundle.getProperty("SVNHOST");
            String LICENSE_INFORMATION = componentXMLFeedBundle.getProperty("LICENSE_INFORMATION");
            String MAINTAINER_INFORMATION = componentXMLFeedBundle.getProperty("MAINTAINER_INFORMATION");
            String TCHOST = tcBundle.getProperty("SERVER_NAME");

            for (ResultSetContainer.ResultSetRow row : rsc) {
                boolean isJava = row.getStringItem("category_list").indexOf("Java") != -1;
                String component_name = row.getStringItem("name").trim();
                String component_name_lower = component_name.toLowerCase().replace(' ', '_');
                String component_version = row.getStringItem("version_text").trim();
                AttributesImpl rdfResourceAttr = new AttributesImpl();
            
                hd.startElement("", "", "Project", emptyAtts);
                addElement(hd, "name", component_name, emptyAtts);
                addElement(hd, "created", row.getTimestampItem("created").toString(), emptyAtts);
                addElement(hd, "shortdesc", row.getStringItem("shortdesc"), emptyAtts);
                addElement(hd, "description", row.getStringItem("description"), emptyAtts);
                addElement(hd, "download-page", row.getStringItem("downloadpage").trim(), emptyAtts);
                addElement(hd, "homepage", row.getStringItem("homepage").trim(), emptyAtts);
                
                rdfResourceAttr.addAttribute("", "", "rdf:resource", "", row.getStringItem("mailinglist").trim());
                addElement(hd, "mailing-list", null, rdfResourceAttr);
                hd.startElement("", "", "repository", emptyAtts);
                hd.startElement("", "", "ArchRepository", emptyAtts);
                String browse = row.getStringItem("browse");
                //Build the browse string.
                if (isEmpty(browse)) {
                    browse = "https://" + SVNHOST + "/tcs/internal/tcs/trunk/" + (isJava ? "lib" : "bin")  + "/tcs/"
                            + component_name_lower + "/" + component_version + "/";
                }
                rdfResourceAttr.setValue(0, browse);
                addElement(hd, "browse", "", rdfResourceAttr);
                String location = row.getStringItem("location");
                //Build the location string.
                if (isEmpty(location)) {
                    location = "https://" + SVNHOST + "/tcs/internal/tcs/trunk/" + (isJava ? "lib" : "bin")  + "/tcs/"
                            + component_name_lower + "/" + component_version + "/dist/" + component_name_lower + "-"
                            + component_version + (isJava ? ".jar" : ".zip");
                }
                rdfResourceAttr.setValue(0, location);
                addElement(hd, "location", "", rdfResourceAttr);
                addElement(hd, "module", row.getStringItem("revision"), emptyAtts);
                hd.endElement("", "", "ArchRepository");
                hd.endElement("", "", "repository");
                getResponse().flushBuffer();
                addElement(hd, "LICENSE_INFORMATION", "", emptyAtts);
                addElement(hd, "MAINTAINER_INFORMATION", "", emptyAtts);
    
                //Process the develop section
                for (String developer : row.getStringItem("developer").split(",")) {
                    hd.startElement("", "", "developer", emptyAtts);
                    String[] information = developer.split("\\|");
                    hd.startElement("", "", "foaf:Person", emptyAtts);
                    addElement(hd, "foaf:name", information[0].trim(), emptyAtts);
                    rdfResourceAttr.setValue(0, "http://www.topcoder.com/tc?module=MemberProfile&amp;cr="
                            + information[1].trim() + "&amp;tab=dev");    
                    addElement(hd, "foaf:homepage", "", rdfResourceAttr);
                    addElement(hd, "foaf:mbox_sha1sum", SHA1Sum(information[2].trim()), emptyAtts);
                    hd.endElement("", "", "foaf:Person");
                    hd.endElement("", "", "developer");
                }

                //Process the version section
                for (String release : row.getStringItem("versions").split(",")) {
                    hd.startElement("", "", "release", emptyAtts);
                    String[] information = release.split("\\|");
                    addElement(hd, "name", information[0].trim(), emptyAtts);
                    addElement(hd, "created", information[1].trim(), emptyAtts);
                    addElement(hd, "revision", information[2].trim(), emptyAtts);
                    rdfResourceAttr.setValue(0, location);
                    addElement(hd, "file-release", "", rdfResourceAttr);
                    addElement(hd, "bds:siteLocalPermId", information[2].trim(), emptyAtts);
                    hd.endElement("", "", "release");
                }
                
                //Process the category list section
                rdfResourceAttr.addAttribute("", "", "bds:name", "", " ");
                for (String category : row.getStringItem("category_list").split(",")) {
                    String[] information = category.split("\\|");
                    rdfResourceAttr.setValue(0, "http://software.topcoder.com/catalog/c_showroom.jsp?cat="
                            + information[1].trim());
                    rdfResourceAttr.setValue(1, information[0].trim());
                    addElement(hd, "category", "", rdfResourceAttr);
                }
                rdfResourceAttr.removeAttribute(1);
                
                String issueTrackPath = row.getStringItem("issue_tracker_path");
                String componentId = row.getStringItem("component_id").trim();
                if (isEmpty(issueTrackPath)) {
                    issueTrackPath =  "https://" + TCHOST + "/bugs/browse/" + componentId;
                }
                addElement(hd, "bds:siteLocalPermId", componentId, emptyAtts);
                hd.startElement("", "", "bds:hasIssueMgmt", emptyAtts);
                hd.startElement("", "", "bds:tracker", emptyAtts);
                rdfResourceAttr.setValue(0, issueTrackPath.trim());
                addElement(hd, "bds:location", "", rdfResourceAttr);
                hd.endElement("", "", "bds:tracker");
                hd.endElement("", "", "bds:hasIssueMgmt");

                
                hd.endElement("", "", "Project");
            }
            hd.endElement("", "", "rdf:RDF");
            hd.endDocument();
            //Replace the predefined text.
            os.write(baos.toString().replaceAll("<LICENSE_INFORMATION/>",
                LICENSE_INFORMATION).replaceAll("<MAINTAINER_INFORMATION/>", MAINTAINER_INFORMATION).getBytes());
            getResponse().flushBuffer();
        } else {
            throw new PermissionException(getUser(), resource);
        }
    }
    
    /**
     * Adds an element to the xml. If the value starts with CDATA_HEADER, it's considered CDATA.
     * 
     * @param hd the TransformerHandler
     * @param name the name of the element
     * @param value the value of the element
     * @param atts the attributes of the element
     * @throws SAXException if any error occurs
     */
    private static void addElement(TransformerHandler hd,
        String name, String value, Attributes atts) throws SAXException {
        
        String temp = value == null ? "" : value;
        hd.startElement("", "", name, atts);
        if (temp.startsWith(CDATA_PREFIX)) {
            hd.startCDATA();
            hd.characters(temp.substring(CDATA_PREFIX.length(), temp.length() - CDATA_SUFFIX.length()).toCharArray(), 
                0, temp.length() - CDATA_PREFIX.length() - CDATA_SUFFIX.length());
            hd.endCDATA();
        } else {
            hd.characters(temp.toCharArray(), 0, temp.length());
        }
        hd.endElement("", "", name);
    }
    
    
    /**
     * Get the data source from the id.
     * @param id the datasource's id
     * @return the data source name
     * @throws Exception if an error occurs
     */      
    private static String getDataSource(int id) throws Exception {
        Request r = new Request();
        r.setContentHandle("datasource_info");
        r.setProperty(Constants.DATASOURCE_ID, String.valueOf(id));
        ResultSetContainer rsc = new CachedDataAccess(DBMS.OLTP_DATASOURCE_NAME).getData(r).get("datasource_info");
        if (rsc.isEmpty()) {
            throw new NavigationException("Invalid request, unknown datasource");
        } else {
            return rsc.get(0).getStringItem("datasource_name");
        }
    }
    
    /**
     * Convert a 16 bit int to a hex char.
     * @param b the int
     * @return the hex string
     */
    private static String hexChr(int b) {
            return Integer.toHexString(b & 0xF);
    }
    
    /**
     * Calculate the SHA1 sum of the string.
     * @param str the input string
     * @return the SHA1 sum.
     */    
    public static String SHA1Sum(String str) {
        String sha1sum = "";
        
        try {
            MessageDigest digest = MessageDigest.getInstance("SHA1");
            byte[] bytes = str.getBytes() ;
            digest.update(bytes, 0, bytes.length);
            StringBuffer buf = new StringBuffer(bytes.length * 2);
            for(byte b : digest.digest()) {
                buf.append(hexChr((b & 0xF0) >> 4)); // High order nibble.
                buf.append(hexChr(b & 0x0F));        // Low order nibble.
            }
            sha1sum = buf.toString();
        } catch (Exception e) {
            //ignore the exception.
        }

        return sha1sum;
    }    
}
