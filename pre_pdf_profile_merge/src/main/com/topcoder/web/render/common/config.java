package com.topcoder.web.render.common;

import org.w3c.dom.Document;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import java.io.File;
import java.util.Hashtable;


public class config {


    public static void main(String arg[]) {
        System.out.println("ATTRIBUTE_NODE=" + Node.ATTRIBUTE_NODE);
        System.out.println("CDATA_SECTION_NODE=" + Node.CDATA_SECTION_NODE);
        System.out.println("COMMENT_NODE=" + Node.COMMENT_NODE);
        System.out.println("DOCUMENT_FRAGMENT_NODE=" + Node.DOCUMENT_FRAGMENT_NODE);
        System.out.println("DOCUMENT_NODE=" + Node.DOCUMENT_NODE);
        System.out.println("DOCUMENT_TYPE_NODE=" + Node.DOCUMENT_TYPE_NODE);
        System.out.println("ELEMENT_NODE=" + Node.ELEMENT_NODE);
        System.out.println("ENTITY_NODE=" + Node.ENTITY_NODE);
        System.out.println("ENTITY_REFERENCE_NODE=" + Node.ENTITY_REFERENCE_NODE);
        System.out.println("NOTATION_NODE=" + Node.NOTATION_NODE);
        System.out.println("PROCESSING_INSTRUCTION_NODE=" + Node.PROCESSING_INSTRUCTION_NODE);
        System.out.println("TEXT_NODE=" + Node.TEXT_NODE);
        Hashtable hash = getHash(arg);
        String val = get(arg);
        System.out.println("Hash=" + hash.toString());
        System.out.println("Value=" + val);
    }


    public static String get(String arg[]) {
        String result = null;
        Node resultNode = getNode(arg);
        if (resultNode != null) {
            result = resultNode.getNodeValue();
        }
        return result;
    }


    public static Hashtable getHash(String arg[]) {
        Hashtable result = null;
        Node node = getNode(arg);
        Node parent = node.getParentNode();
        boolean set = false;
        if (parent != null) {
            NodeList children = parent.getChildNodes();
            int len = children.getLength();
            result = new Hashtable(len);
            for (int i = 0; i < len; i++) {
                Node child = children.item(i);
                if (child.getNodeType() == Node.ELEMENT_NODE) {
                    String value = getChild(parent, child.getNodeName()).getNodeValue();
                    if (value == null) value = "";
                    result.put(child.getNodeName(), value);
                    set = true;
                } else if (len == 1 && child.getNodeType() == Node.TEXT_NODE) {
                    result.put(parent.getNodeName(), node.getNodeValue());
                    set = true;
                }
            }
        }
        if (!set) return null;
        return result;
    }


    public static Node getNode(String arg[]) {
        Node result = null;
        Document doc = null;
        if (arg == null || arg.length < 2) return null;
        try {
            DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
            factory.setValidating(true);
            DocumentBuilder builder = factory.newDocumentBuilder();
            doc = builder.parse(new File(arg[0]));
            Node child = null;
            if (arg.length == 2) {
                child = doc.getElementsByTagName(arg[1]).item(0);
            } else {
                for (int i = 2; i < arg.length; i++) {
                    Node parent = doc.getElementsByTagName(arg[i - 1]).item(0);
                    child = getChild(parent, arg[i]);
                    if (child == null) return null;
                }
            }
            result = child;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }


    private static Node getChild(Node parent, String target) {
        Node result = null;
        NodeList children = parent.getChildNodes();
        for (int i = 0; i < children.getLength(); i++) {
            Node child = children.item(i);
            if (
                    child.getNodeType() == Node.ELEMENT_NODE
                    && child.getNodeName().equals(target)
            ) {
                result = child.getChildNodes().item(0);
            }
        }
        return result;
    }


}
