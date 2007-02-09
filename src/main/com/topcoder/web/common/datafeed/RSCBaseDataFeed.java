package com.topcoder.web.common.datafeed;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.xml.transform.sax.TransformerHandler;

import org.xml.sax.helpers.AttributesImpl;

import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;


public abstract class RSCBaseDataFeed implements DataFeed {

    private String rootTag;
    private String rowTag;
    private List children;
    private List elements;
    
    public RSCBaseDataFeed(String rootTag, String rowTag) {
        this.rootTag = rootTag;
        this.rowTag = rowTag;
        this.children = new ArrayList();
        this.elements = new ArrayList();
    }
    
    protected abstract ResultSetContainer getRSC(ResultSetContainer.ResultSetRow parentRow) throws Exception;
    
    public void addChild(RSCBaseDataFeed df) {
        children.add(df);
    }
    
    public void add(String columnName) {
        elements.add(new Column(columnName, columnName));
    }

    public void add(String tagName, String columnName) {
        elements.add(new Column(tagName, columnName));
    }

    public void add(RSCElement element) {
        elements.add(element);
    }
    
    public void writeXML(TransformerHandler hd) throws Exception {
        writeXML(hd, null);
    }
    
    protected void writeXML(TransformerHandler hd, ResultSetContainer.ResultSetRow parentRow) throws Exception {
        ResultSetContainer rsc =  getRSC(parentRow);

        AttributesImpl emptyAtts = new AttributesImpl();

        if (rootTag != null) {
            hd.startElement("", "", rootTag, emptyAtts);
        }

        ResultSetContainer.ResultSetRow row = null;
        for (Iterator it= rsc.iterator(); it.hasNext();) {
            row = (ResultSetContainer.ResultSetRow)it.next();

            if (rowTag != null) {
                hd.startElement("", "", rowTag, emptyAtts);
            }

            for (int i = 0; i < elements.size(); i++) {
                RSCElement e = (RSCElement) elements.get(i);
                e.writeXML(hd, rsc, row);
            }

            for (Iterator chIt = children.iterator(); chIt.hasNext(); ) {
                RSCBaseDataFeed child = (RSCBaseDataFeed) chIt.next();
                child.writeXML(hd, row);
            }
            
            if (rowTag != null) {
                hd.endElement("", "", rowTag);
            }
        }
        
        
        if (rootTag != null) {
            hd.endElement("", "", rootTag);
        }

    }
/*
    private void addElement(TransformerHandler hd, String name, String value, Attributes atts) throws SAXException {
        String temp = value == null ? "" : value;
        hd.startElement("", "", name, atts);
        hd.characters(temp.toCharArray(), 0, temp.length());
        hd.endElement("", "", name);
    }
*/
}
