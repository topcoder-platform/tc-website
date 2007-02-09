package com.topcoder.web.common.datafeed;
import java.util.ArrayList;
import java.util.List;

import javax.xml.transform.sax.TransformerHandler;

import org.xml.sax.helpers.AttributesImpl;

import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;


public class ElementContainer implements RSCElement {

    private String tagName;
    private List elements;
    
    public ElementContainer(String tagName) {
        this.tagName = tagName;
        elements = new ArrayList();
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


    public void writeXML(TransformerHandler hd, ResultSetContainer rsc, ResultSetContainer.ResultSetRow row) throws Exception {

        if (tagName != null) {
            hd.startElement("", "", tagName, new AttributesImpl());
        }
        
        
        for (int i = 0; i < elements.size(); i++) {
            RSCElement e = (RSCElement) elements.get(i);
            e.writeXML(hd, rsc, row);
        }

        if (tagName != null) {
            hd.endElement("", "", tagName);
        }

    }


}
