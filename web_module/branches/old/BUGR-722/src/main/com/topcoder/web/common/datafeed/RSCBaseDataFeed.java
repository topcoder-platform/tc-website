package com.topcoder.web.common.datafeed;
import java.util.ArrayList;
import java.util.List;

import javax.xml.transform.sax.TransformerHandler;

import org.xml.sax.helpers.AttributesImpl;

import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;


/**
 * Base class for data feeds based on ResultSet Containers.
 * 
 * @author Cucu
 */
public abstract class RSCBaseDataFeed implements DataFeed {

    /**
     * Root tag that wraps all the rsc rows.
     */
    private String rootTag;
    
    /**
     * Tag for each row of the rsc.
     */
    private String rowTag;
    
    /**
     * List of RSCBaseDataFeed that will be executed for each row. 
     */
    private List<RSCBaseDataFeed> children;
    
    /**
     * List of elements to be rendered in each row.
     */
    private List<RSCElement> elements;
    
    /**
     * Create a Data feed.
     * 
     * @param rootTag tag that wraps all the rsc rows.
     * @param rowTag tag for each row of the rsc.
     */
    public RSCBaseDataFeed(String rootTag, String rowTag) {
        this.rootTag = rootTag;
        this.rowTag = rowTag;
        this.children = new ArrayList<RSCBaseDataFeed>();
        this.elements = new ArrayList<RSCElement>();
    }
    
    /**
     * Implementing classes must return a ResultSetContainer. The parentRow is provided to give the opportuinity of using some fields as parameters.
     * 
     * @param parentRow 
     * @return a ResultSetContainer to render to XML.
     * @throws Exception
     */
    protected abstract ResultSetContainer getRSC(ResultSetContainer.ResultSetRow parentRow) throws Exception;
    
    public void addChild(RSCBaseDataFeed df) {
        children.add(df);
    }
    
    /**
     * Add a ResultSetContainer field to render in the xml; the tag name will be the same as the field.
     * 
     * @param field field name.
     */    
    public void add(String field) {
        elements.add(new Column(field, field));
    }

    /**
     * Add a ResultSetContainer field to render in the xml.
     * 
     * @param tagName name of the XML tag.
     * @param field field name.
     */    
    public void add(String tagName, String field) {
        elements.add(new Column(tagName, field));
    }

    /**
     * Add an element to render in the xml.
     * 
     * @param element element to add.
     */
    public void add(RSCElement element) {
        elements.add(element);
    }
    
    /**
     * Write the data feed's xml to hd.
     * 
     * @param hd xml is written here.
     */
    public void writeXML(TransformerHandler hd) throws Exception {
        writeXML(hd, null);
    }
    
    /**
     * Writes the XML, by writing each element and child of this data feed.
     * 
     * @param hd
     * @param parentRow
     * @throws Exception
     */
    protected void writeXML(TransformerHandler hd, ResultSetContainer.ResultSetRow parentRow) throws Exception {
        ResultSetContainer rsc =  getRSC(parentRow);

        AttributesImpl emptyAtts = new AttributesImpl();

        if (rootTag != null) {
            hd.startElement("", "", rootTag, emptyAtts);
        }

        for (ResultSetContainer.ResultSetRow row : rsc) {

            if (rowTag != null) {
                hd.startElement("", "", rowTag, emptyAtts);
            }

            for (int i = 0; i < elements.size(); i++) {
                RSCElement e = (RSCElement) elements.get(i);
                e.writeXML(hd, rsc, row);
            }

            for (RSCBaseDataFeed child : children) {
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
}
