package com.topcoder.web.common.datafeed;
import java.util.ArrayList;
import java.util.List;

import javax.xml.transform.sax.TransformerHandler;

import org.xml.sax.helpers.AttributesImpl;

import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;

/**
 * Element capable of holding some other elements.
 * This is useful for example to create a new tag and put fields inside.
 * 
 * 
 * @author Cucu
 *
 */
public class ElementContainer implements RSCElement {

    private String tagName;
    private List<RSCElement> elements;
    
    /**
     * Create an element container.
     * 
     * @param tagName name of the XML tag.
     */
    public ElementContainer(String tagName) {
        this.tagName = tagName;
        elements = new ArrayList<RSCElement>();
    }
    
    /**
     * Add a ResultSetContainer field to the element container; the tag name will be the same as the field.
     * 
     * @param field field name.
     */
    public void add(String field) {
        elements.add(new Column(field, field));
    }

    /**
     * Add a ResultSetContainer field to the element container.
     * 
     * @param tagName name of the XML tag.
     * @param field ResultSetContainer field.
     */
    public void add(String tagName, String field) {
        elements.add(new Column(tagName, field));
    }

    /**
     * Add an element inside this container.
     * 
     * @param element element to add.
     */
    public void add(RSCElement element) {
        elements.add(element);
    }


    /**
     * Write this container's xml.
     * It will write the tag specified in the constructor, and inside it, all the elements of the container.
     */
    public void writeXML(TransformerHandler hd, ResultSetContainer rsc, ResultSetContainer.ResultSetRow row) throws Exception {
        if (tagName != null) {
            hd.startElement("", "", tagName, new AttributesImpl());
        }
        
        
        for (RSCElement e : elements) {
            e.writeXML(hd, rsc, row);
        }

        if (tagName != null) {
            hd.endElement("", "", tagName);
        }
    }


}
