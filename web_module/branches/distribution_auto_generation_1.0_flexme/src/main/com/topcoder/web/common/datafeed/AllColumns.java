package com.topcoder.web.common.datafeed;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

import javax.xml.transform.sax.TransformerHandler;

import org.xml.sax.helpers.AttributesImpl;

import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;

/**
 * This element will add all the columns found in the ResultSetContainer in the DataFeed.
 * It is possible to skip some columns and to replace them by some other elements.
 * 
 * @author Cucu
 */
public class AllColumns implements RSCElement {

    private Set skip;
    private Map replace;
    private String nullString = null;
    
    public AllColumns() {
        this(null);
    }

    public AllColumns(String nullString) { 
        skip = new HashSet();
        replace = new HashMap();
        this.nullString = nullString;
    }

    /**
     * Replace the column with the field name of the column with the specified column.
     * If it contains an id field, it is added to the skip list.
     * 
     * @param col column to replace.
     */
    public void replace(Column col) {
        replace.put(col.getField(), col);
        if (col.getIdField() != null) {
            skip.add(col.getIdField());
        }        
    }
    
    /**
     * Replace a field with an element.
     * 
     * @param field field to replace.
     * @param element element to put instead of the field.
     */
    public void replace(String field, RSCElement element) {
        replace.put(field, element);
    }
    
    /**
     * Add a field in the skip list.
     * 
     * @param field field to skip
     */
    public void skip(String field) {
        skip.add(field);
    }

    /**
     * Set the string that will be used in case a field is null.
     * 
     * @param nullString tring that will be used in case a field is null.
     */
    public void setNullString(String nullString) {
        this.nullString = nullString;
    }
    
    /**
     * Write the xml for all columns, doing the replacement and skipping of the specified columns
     */
    public void writeXML(TransformerHandler hd, ResultSetContainer rsc, ResultSetContainer.ResultSetRow row) throws Exception {
        for (int i = 0; i < rsc.getColumnCount(); i++) {
            String value = row.getStringItem(i);
            String name = rsc.getColumnName(i);
            
            if (skip.contains(name)) {
                continue; 
            }
            
            RSCElement e = (RSCElement) replace.get(name);
            if (e != null) {
                e.writeXML(hd, rsc, row);
                continue;
            }
            
            hd.startElement("", "", name, new AttributesImpl());
            
            if (value != null) {
                hd.characters(value.toCharArray(), 0, value.length());
            } else if (nullString != null) {
                hd.characters(nullString.toCharArray(), 0, nullString.length());
            }
            
            hd.endElement("", "", name);            
        }
    }


}
