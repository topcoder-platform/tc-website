package com.topcoder.web.common.datafeed;
import javax.xml.transform.sax.TransformerHandler;

import org.xml.sax.helpers.AttributesImpl;

import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;


public class Column implements RSCElement {

    private String tagName;
    private String field;
    private String attrName;
    private String idField;
    
    public String getField() {
        return field;
    }

    public String getIdField() {
        return idField;
    }

    public Column(String tagName, String field, String attrName, String idField) {
        this.field = field;
        this.tagName = tagName;
        this.attrName = attrName;
        this.idField = idField;
    }

    public Column(String tagName, String field) {
        this(tagName, field, null, null);
    }

    public void writeXML(TransformerHandler hd, ResultSetContainer rsc, ResultSetContainer.ResultSetRow row) throws Exception {
        String value = row.getStringItem(field);
        
        AttributesImpl attr = new AttributesImpl();
        
        if (idField != null) {
            String id = row.getStringItem(idField);
            attr.addAttribute("", "", attrName, "CDATA", id == null? "" : id);            
        }
        
        hd.startElement("", "", tagName, attr);
        
        if (value != null) {
            hd.characters(value.toCharArray(), 0, value.length());
        }
        
        hd.endElement("", "", tagName);        
    }


}
