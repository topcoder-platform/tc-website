/*
 * Copyright (C) 2001 - 2009 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.common;

import com.topcoder.json.object.JSONArray;
import com.topcoder.json.object.JSONObject;
import com.topcoder.json.object.io.StandardJSONEncoder;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.dataAccess.resultSet.TCResultItem;
import com.topcoder.shared.util.logging.Logger;
import org.xml.sax.Attributes;
import org.xml.sax.SAXException;
import org.xml.sax.helpers.AttributesImpl;

import javax.xml.transform.OutputKeys;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerConfigurationException;
import javax.xml.transform.sax.SAXTransformerFactory;
import javax.xml.transform.sax.TransformerHandler;
import javax.xml.transform.stream.StreamResult;
import java.io.ByteArrayOutputStream;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.List;

/**
 * XML / JSON convertef for ResultSetContainer
 * 
 * Version 1.1 (BUGR-2949) changes:
 * - Added support for CDATA.
 * 
 * @author dok, pulky
 * @version 1.1
 */
public class ResultSetContainerConverter {
    /**
     * The CDATA prefix
     * 
     * @since 1.1
     */
    private static final String CDATA_PREFIX = "<![CDATA[";

    /**
     * The CDATA suffix
     * 
     * @since 1.1
     */
    private static final String CDATA_SUFFIX = "]]>";
    
    private static Logger log = Logger.getLogger(ResultSetContainerConverter.class);
    public static void writeXML(ResultSetContainer rsc, String name, OutputStream os) throws TransformerConfigurationException, SAXException {

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

        for (ResultSetContainer.ResultSetRow row : rsc) {
            hd.startElement("", "", "row", emptyAtts);
            for (int i = 0; i < rsc.getColumnCount(); i++) {
                addElement(hd, rsc.getColumnName(i), row.getStringItem(i), emptyAtts);
            }
            hd.endElement("", "", "row");
        }

        hd.endElement("", "", name);
        hd.endDocument();
    }

    public static void writeXMLhidingPayments(ResultSetContainer rsc, String name, String paymentCol, String keyColName, List<Long> hideKeyList, OutputStream os) throws TransformerConfigurationException, SAXException {

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
        boolean hidePaymentColumn;
        for (ResultSetContainer.ResultSetRow row: rsc) {
            hd.startElement("", "", "row", emptyAtts);
            Long keyCol = row.getLongItem(keyColName);
            hidePaymentColumn = hideKeyList.contains(keyCol);
            for (int i = 0; i < rsc.getColumnCount(); i++) {
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


    public static void writeJSONhidingPayments(ResultSetContainer rsc, String name,
                                               String paymentCol, String keyColName,
                                               List<Long> hideKeyList, OutputStream os) throws IOException {
        JSONObject ret = new JSONObject();
        JSONArray jsonArray = new JSONArray();
        ret.setArray("data", jsonArray);
        ret.setString("feedname", name);
        TCResultItem item;
        JSONArray jrow;
        JSONObject obj;
        boolean hidePaymentColumn;
        for (ResultSetContainer.ResultSetRow row : rsc) {
            jrow = new JSONArray();
            jsonArray.addArray(jrow);
            Long keyCol = row.getLongItem(keyColName);
            for (int i=0; i<rsc.getColumnCount(); i++) {
                item = row.getItem(i);
                obj = new JSONObject();
                jrow.addJSONObject(obj);
                if (item.getResultData()==null) {
                    obj.setNull(rsc.getColumnName(i));
                } else {
                    hidePaymentColumn = hideKeyList.contains(keyCol);
                    if (!hidePaymentColumn || !rsc.getColumnName(i).equals(paymentCol)) {
                        obj.setString(rsc.getColumnName(i), row.getStringItem(i));
                    } else {
                        obj.setString(rsc.getColumnName(i), "*hidden*");
                    }

                    //we wont' deal with types right now.  not sure that it matters...we'll see as this evolves
                    //probably the first thing we do is add a formatter for dates, times and datetimes
/*
                    switch (item.getType()) {
                        case TCResultItem.INT: obj.setInt(rsc.getColumnName(i), row.getIntItem(i)); break;
                        case TCResultItem.LONG: obj.setLong(rsc.getColumnName(i), row.getLongItem(i)); break;
                        case TCResultItem.BIGINTEGER: obj.setBigInteger(rsc.getColumnName(i), (BigInteger)row.getItem(i).getResultData()); break;
                        case TCResultItem.FLOAT: obj.setFloat(rsc.getColumnName(i), row.getFloatItem(i)); break;
                        case TCResultItem.DOUBLE: obj.setDouble(rsc.getColumnName(i), row.getDoubleItem(i)); break;
                        case TCResultItem.BIGDECIMAL: obj.setBigDecimal(rsc.getColumnName(i), (BigDecimal)row.getItem(i).getResultData()); break;
                        case TCResultItem.BOOLEAN: obj.setBoolean(rsc.getColumnName(i), row.getBooleanItem(i)); break;
                        case TCResultItem.STRING: obj.setString(rsc.getColumnName(i), row.getStringItem(i)); break;
                        case TCResultItem.DATE: obj.setDate(rsc.getColumnName(i), row.getIntItem(i)); break;
                        case TCResultItem.TIME: obj.setTime(rsc.getColumnName(i), row.getIntItem(i)); break;
                        case TCResultItem.DATETIME: obj.setDateTime(rsc.getColumnName(i), row.getIntItem(i)); break;
                    }
*/
                }
            }
        }
        String res = new StandardJSONEncoder().encode(ret);
        DataOutputStream dos = new DataOutputStream(os);
        dos.writeBytes(res);


    }

    
    public static void writeJSON(ResultSetContainer rsc, String name, OutputStream os) throws IOException {
        long start = System.currentTimeMillis();
        JSONObject ret = new JSONObject();
        JSONArray jsonArray = new JSONArray();
        TCResultItem item;
        JSONObject jrow;
/*
        JSONArray colNames = new JSONArray();
        JSONObject obj;
*/
        ret.setArray("data", jsonArray);
        ret.setString("feedname", name);
/*
        ret.setArray("columnNames", colNames);

        for (ResultColumn c : rsc.getColumns()) {
            colNames.addString(c.getName());
        }
*/

        for (ResultSetContainer.ResultSetRow row : rsc) {
            jrow = new JSONObject();
            jsonArray.addJSONObject(jrow);
            for (int i=0; i<rsc.getColumnCount(); i++) {
                item = row.getItem(i);
                if (item.getResultData()==null) {
                    jrow.setNull(rsc.getColumnName(i));
                } else {
                    //we wont' deal with types right now.  not sure that it matters...we'll see as this evolves
                    jrow.setString(rsc.getColumnName(i), row.getStringItem(i));
                }
            }
        }

        String res = new StandardJSONEncoder().encode(ret);
        DataOutputStream dos = new DataOutputStream(os);
        dos.writeBytes(res);
        if (log.isDebugEnabled()) {
            log.debug("took " + (System.currentTimeMillis()-start) + " ms");
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


    public static String getXML(ResultSetContainer rsc, String name) throws TransformerConfigurationException, SAXException {
        ByteArrayOutputStream baos = new ByteArrayOutputStream();
        writeXML(rsc, name, baos);
        return baos.toString();
    }





}
