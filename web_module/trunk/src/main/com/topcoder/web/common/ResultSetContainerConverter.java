package com.topcoder.web.common;

import java.io.ByteArrayOutputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.xml.transform.OutputKeys;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerConfigurationException;
import javax.xml.transform.sax.SAXTransformerFactory;
import javax.xml.transform.sax.TransformerHandler;
import javax.xml.transform.stream.StreamResult;

import org.xml.sax.Attributes;
import org.xml.sax.SAXException;
import org.xml.sax.helpers.AttributesImpl;

import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;

/**
 * @author  dok
 * @version  $Revision$ $Date$
 * Create Date: May 13, 2005
 */
public class ResultSetContainerConverter {
    public static final void writeXML(ResultSetContainer rsc, String name, OutputStream os) throws TransformerConfigurationException, SAXException {

        StreamResult streamResult = new StreamResult(os);
        SAXTransformerFactory tf = (SAXTransformerFactory) SAXTransformerFactory.newInstance();

        TransformerHandler hd = tf.newTransformerHandler();
        Transformer serializer = hd.getTransformer();
        serializer.setOutputProperty(OutputKeys.ENCODING, "ISO-8859-1");
        serializer.setOutputProperty(OutputKeys.INDENT, "no");
        hd.setResult(streamResult);
        hd.startDocument();

        AttributesImpl emptyAtts = new AttributesImpl();

        hd.startElement("", "", name, emptyAtts);

        ResultSetContainer.ResultSetRow row = null;
        for (Iterator it= rsc.iterator(); it.hasNext();) {
            row = (ResultSetContainer.ResultSetRow)it.next();
            hd.startElement("", "", "row", emptyAtts);
            for (int i=0; i<rsc.getColumnCount(); i++) {
                addElement(hd, rsc.getColumnName(i), row.getStringItem(i), emptyAtts);
            }
            hd.endElement("", "", "row");
        }

        hd.endElement("", "", name);
        hd.endDocument();
    }

    public static final void writeXMLhidingPayments(ResultSetContainer rsc, String name, String paymentCol, String keyColName, List<Long> hideKeyList, OutputStream os) throws TransformerConfigurationException, SAXException {

        StreamResult streamResult = new StreamResult(os);
        SAXTransformerFactory tf = (SAXTransformerFactory) SAXTransformerFactory.newInstance();

        TransformerHandler hd = tf.newTransformerHandler();
        Transformer serializer = hd.getTransformer();
        serializer.setOutputProperty(OutputKeys.ENCODING, "ISO-8859-1");
        serializer.setOutputProperty(OutputKeys.INDENT, "no");
        hd.setResult(streamResult);
        hd.startDocument();

        AttributesImpl emptyAtts = new AttributesImpl();

        hd.startElement("", "", name, emptyAtts);
        boolean hidePaymentColumn = false;
        ResultSetContainer.ResultSetRow row = null;
        for (Iterator it= rsc.iterator(); it.hasNext();) {
            row = (ResultSetContainer.ResultSetRow)it.next();
            hd.startElement("", "", "row", emptyAtts);
            Long keyCol = row.getLongItem(keyColName);
            hidePaymentColumn = hideKeyList.contains(keyCol);
            for (int i=0; i<rsc.getColumnCount(); i++) {
                if (!hidePaymentColumn || !rsc.getColumnName(i).equals(paymentCol)) {
                    addElement(hd, rsc.getColumnName(i), row.getStringItem(i), emptyAtts);
                } else {
                    addElement(hd, rsc.getColumnName(i), "*hidden*", emptyAtts);
                }
            }
            hd.endElement("", "", "row");
        }

        hd.endElement("", "", name);
        hd.endDocument();
    }


    private static final void addElement(TransformerHandler hd,
                                         String name, String value, Attributes atts) throws SAXException {
        String temp = value == null ? "" : value;
        hd.startElement("", "", name, atts);
        hd.characters(temp.toCharArray(), 0, temp.length());
        hd.endElement("", "", name);

    }


    public static final String getXML(ResultSetContainer rsc, String name) throws TransformerConfigurationException, SAXException {
        ByteArrayOutputStream baos = new ByteArrayOutputStream();
        writeXML(rsc, name, baos);
        return baos.toString();
    }





}
