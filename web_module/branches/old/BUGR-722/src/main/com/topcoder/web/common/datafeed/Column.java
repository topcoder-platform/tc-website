package com.topcoder.web.common.datafeed;
import javax.xml.transform.sax.TransformerHandler;

import org.xml.sax.helpers.AttributesImpl;

import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;


/**
 * A column of the ResultSetContainer.
 * An additional "id" column could be used as an attribute.
 * 
 * If no additional "id" column is specified, it generates XML like:
 * <![CDATA[ <coder>Cucu</coder> ]]>
 * 
 * With an "id" column, this could be done:
 * <![CDATA[ <coder id="7545675">Cucu</coder> ]]>

 * @author Cucu
 *
 */
public class Column implements RSCElement {

    /**
     * Name of the tag to write in the XML.
     */
    private String tagName;
    
    /**
     * Name of the ResultSetContainer field to write inside the tag.
     */
    private String field;
    
    /**
     * Optional attribute name for the tag (if null, no attribute is written).
     */
    private String attrName;
    
    /**
     * Name of the ResultSetContainer field to write in the tag attribute.
     */
    private String idField;
    
    /**
     * Formatter for the field value
     */
    private ItemFormatter formatter = null;
    
    public String getField() {
        return field;
    }

    public String getIdField() {
        return idField;
    }

    /**
     * Create a column with an id attribute.
     * 
     * @param tagName tag to write in the XML.
     * @param field ResultSetContainer field to write inside the tag.
     * @param attrName attribute name for the tag
     * @param idField ResultSetContainer field to write in the tag attribute.
     * @param formatter object used to format the value
     */
    public Column(String tagName, String field, String attrName, String idField, ItemFormatter formatter) {
        this.field = field;
        this.tagName = tagName;
        this.attrName = attrName;
        this.idField = idField;
        this.formatter = formatter;
    }
    
    /**
     * Create a column with an id attribute.
     * 
     * @param tagName tag to write in the XML.
     * @param field ResultSetContainer field to write inside the tag.
     * @param attrName attribute name for the tag
     * @param idField ResultSetContainer field to write in the tag attribute.
     */
    public Column(String tagName, String field, String attrName, String idField) {
        this(tagName, field, attrName, idField, null);
    }
    
    /**
     * Create a column.
     * 
     * @param tagName tag to write in the XML.
     * @param field ResultSetContainer field to write inside the tag.
     */
    public Column(String tagName, String field) {
        this(tagName, field, null, null);
    }

    /**
     * Write the XML for this column(s).
     */
    public void writeXML(TransformerHandler hd, ResultSetContainer rsc, ResultSetContainer.ResultSetRow row) throws Exception {
        String value = formatter == null? row.getStringItem(field) : formatter.format(row, field);
        
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
