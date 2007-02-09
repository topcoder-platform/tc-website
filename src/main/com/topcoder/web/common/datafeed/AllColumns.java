package com.topcoder.web.common.datafeed;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

import javax.xml.transform.sax.TransformerHandler;

import org.xml.sax.helpers.AttributesImpl;

import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;


public class AllColumns implements RSCElement {

    private Set skip;
    private Map replace;
    
    public AllColumns() {
        skip = new HashSet();
        replace = new HashMap();
    }
    
    public void replace(Column col) {
        replace.put(col.getField(), col);
        if (col.getIdField() != null) {
            skip.add(col.getIdField());
        }        
    }
    
    public void replace(String field, RSCElement element) {
        replace.put(field, element);
    }
    
    public void skip(String field) {
        skip.add(field);
    }

    
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
            
            AttributesImpl attr = new AttributesImpl();
/*            if (nameId.get(name) != null) {
                String idColumn = ((String[]) nameId.get(name))[2];
                String attrName = ((String[]) nameId.get(name))[1];
                String id = row.getStringItem(idColumn);
                
                attr.addAttribute("", "", attrName, "CDATA", id == null? "" : id);
                name = ((String[]) nameId.get(name))[0];
            }*/
            hd.startElement("", "", name, attr);
            
            if (value != null) {
                hd.characters(value.toCharArray(), 0, value.length());
            }
            
            hd.endElement("", "", name);            
        }
    }


}
