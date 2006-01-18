package com.topcoder.web.tc.controller.legacy.stat.common;

import com.topcoder.web.tc.controller.legacy.stat.bean.CoderRatingStyleBean;
import com.topcoder.web.tc.controller.legacy.stat.bean.QuickStatBean;
import com.topcoder.web.tc.controller.legacy.stat.bean.QuickStatListBean;
import org.apache.xerces.parsers.DOMParser;
import org.w3c.dom.Document;
import org.w3c.dom.NamedNodeMap;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.InputSource;
import org.xml.sax.SAXException;

import java.io.IOException;
import java.io.InputStream;
import java.util.Hashtable;
import java.util.Map;

public class StatXMLParser {

    public static Document getXMLDocument(InputStream in) throws IOException {
        Document doc;
        InputSource is = new InputSource(in);
        try {
            DOMParser parser = new org.apache.xerces.parsers.DOMParser();
            parser.setFeature("http://xml.org/sax/features/validation", true);
            parser.parse(is);
            doc = parser.getDocument();
        } catch (SAXException e) {
            e.printStackTrace();
            throw new IOException("ERROR GETTING XML DOCUMENT: " + e);
        } catch (Exception ex) {
            ex.printStackTrace();
            throw new IOException("ERROR GETTING XML DOCUMENT: " + ex);
        }
        return doc;
    }

    public static Document getXMLDocument(String sFileName) throws IOException {
        InputStream in = StatXMLParser.class.getClassLoader().getResource(sFileName).openStream();
        return getXMLDocument(in);
    }

    /**
     * retrieves the global error page from the XML file
     * @param doc the XML document
     * @return String the error page to forward to
     */
    public static String getGlobalErrorFwd(Document doc) {
        Node root = doc.getLastChild();
        Node errNode = findEnclosingNode(root, "GlobalError");
        return errNode.getAttributes().getNamedItem("nextPage").getNodeValue();
    }

    /**
     *Creates a QuickStatListBean using an XML document
     *@param doc the XML document
     *@return QuickStatListBean
     */
    public static QuickStatListBean buildQuickStatListBean(Document doc) {
        QuickStatListBean qsList = new QuickStatListBean();
        Node root = doc.getLastChild();
        Node listNode = findEnclosingNode(root, "QuickStatList");
        NodeList children = listNode.getChildNodes();
        Node childNode;
        String sUrl = "";
        String sQuickStatDisplayName = "";
        for (int i = 0; i < children.getLength(); i++) {
            childNode = children.item(i);
            if (childNode.getNodeType() == Node.ELEMENT_NODE) {
                sUrl = childNode.getAttributes().getNamedItem("url").getNodeValue();
                sQuickStatDisplayName = childNode.getLastChild().getNodeValue();
                qsList.add(new QuickStatBean(sQuickStatDisplayName, sUrl));
            }
        }
        return qsList;
    }

    /**
     *Creates a CoderRatingStyleBean using an XML document
     *@param doc the XML document
     *@return CoderRatingStyleBean
     */
    public static CoderRatingStyleBean buildCoderRatingStyleBean(Document doc) {
        CoderRatingStyleBean coderStyles = new CoderRatingStyleBean();
        Node root = doc.getLastChild();
        Node listNode = findEnclosingNode(root, "RankList");
        NodeList children = listNode.getChildNodes();
        Node childNode;
        int iMin = 0;
        int iMax = 0;
        String sStyle = "";
        NamedNodeMap nMap = null;
        for (int i = 0; i < children.getLength(); i++) {
            childNode = children.item(i);
            if (childNode.getNodeType() == Node.ELEMENT_NODE) {
                nMap = childNode.getAttributes();
                iMin = Integer.parseInt(nMap.getNamedItem("minVal").getNodeValue());
                if (nMap.getNamedItem("maxVal") != null) {
                    iMax = Integer.parseInt(nMap.getNamedItem("maxVal").getNodeValue());
                } else
                    iMax = Integer.MAX_VALUE;
                sStyle = childNode.getLastChild().getNodeValue();
                coderStyles.addStyle(sStyle, iMin, iMax);
            }
        }
        return coderStyles;
    }

    /**
     *Creates a content map using an XML document
     *@param doc the XML document
     *@return Map
     */
    public static Map buildContentMap(Document doc) {
        Map m = new Hashtable();
        NamedNodeMap nMap = null;
        Node root = doc.getLastChild();
        Node listNode = findEnclosingNode(root, "ContentList");
        NodeList children = listNode.getChildNodes();
        Node childNode;
        String sContentHandle = "";
        String sNextPage = "";
        for (int i = 0; i < children.getLength(); i++) {
            childNode = children.item(i);
            if (childNode.getNodeType() == Node.ELEMENT_NODE) {
                nMap = childNode.getAttributes();
                sContentHandle = nMap.getNamedItem("contentHandle").getNodeValue();
                sNextPage = nMap.getNamedItem("nextPage").getNodeValue();
                m.put(sContentHandle, sNextPage);
            }
        }
        return m;
    }

    /**
     *Creates the access/security map using an XML document
     *@param doc the XML document
     *@return Map
     */
    public static Map buildAccessMap(Document doc) {
        Map m = new Hashtable();
        NamedNodeMap nMap = null;
        Node root = doc.getLastChild();
        Node listNode = findEnclosingNode(root, "ContentList");
        NodeList children = listNode.getChildNodes();
        Node childNode;
        String sContentHandle = "";
        String sAccess = "";
        for (int i = 0; i < children.getLength(); i++) {
            childNode = children.item(i);
            if (childNode.getNodeType() == Node.ELEMENT_NODE) {
                nMap = childNode.getAttributes();
                sContentHandle = nMap.getNamedItem("contentHandle").getNodeValue();
                sAccess = nMap.getNamedItem("access").getNodeValue();
                m.put(sContentHandle, sAccess);
            }
        }
        return m;
    }

    public static Node findEnclosingNode(Node root, String sNodeName) {
        NodeList children = root.getChildNodes();
        Node childNode;
        for (int i = 0; i < children.getLength(); i++) {
            childNode = children.item(i);
            if (childNode.getNodeName().equalsIgnoreCase(sNodeName)) {
                return childNode;
            }
        }
        return null;
    }
}

