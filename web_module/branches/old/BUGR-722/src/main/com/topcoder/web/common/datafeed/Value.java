package com.topcoder.web.common.datafeed;

import javax.xml.transform.sax.TransformerHandler;

import org.xml.sax.helpers.AttributesImpl;

/**
 * Represents a constant value inside a tag
 * 
 * @author Cucu
 *
 */
public class Value implements DataFeed {

    private String tagName;
    private String value;
    
    public Value(String tagName, String value) {
        this.tagName = tagName;
        this.value = value;
    }

    public void writeXML(TransformerHandler hd) throws Exception {
        AttributesImpl emptyAtts = new AttributesImpl();

        hd.startElement("", "", tagName, emptyAtts);
        hd.characters(value.toCharArray(), 0, value.length());
        hd.endElement("", "", tagName);
    }

}
