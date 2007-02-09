package com.topcoder.web.common.datafeed;
import java.io.ByteArrayOutputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.xml.transform.OutputKeys;
import javax.xml.transform.Transformer;
import javax.xml.transform.sax.SAXTransformerFactory;
import javax.xml.transform.sax.TransformerHandler;
import javax.xml.transform.stream.StreamResult;

import org.xml.sax.helpers.AttributesImpl;


public class DataFeeder {

    private String root;
    private List dataFeeds = null;
    
    public DataFeeder(String root) {
        this.root = root;
        dataFeeds = new ArrayList();
    }
    
    public void add(DataFeed df) {
        dataFeeds.add(df);
    }
    
    public void writeXML(OutputStream os) throws Exception {
        StreamResult streamResult = new StreamResult(os);
        SAXTransformerFactory tf = (SAXTransformerFactory) SAXTransformerFactory.newInstance();

        TransformerHandler hd = tf.newTransformerHandler();
        Transformer serializer = hd.getTransformer();
        serializer.setOutputProperty(OutputKeys.ENCODING, "ISO-8859-1");
        serializer.setOutputProperty(OutputKeys.INDENT, "no");
        hd.setResult(streamResult);
        hd.startDocument();

        hd.startElement("", "", root, new AttributesImpl());

        for (Iterator it = dataFeeds.iterator(); it.hasNext(); ) {
            DataFeed df = (DataFeed) it.next();
            df.writeXML(hd);
        }
        hd.endElement("", "", root);

        
        hd.endDocument();
    }
    
    public String getXML() throws Exception {
        ByteArrayOutputStream baos = new ByteArrayOutputStream();
        writeXML(baos);
        return baos.toString();        
    }
}
