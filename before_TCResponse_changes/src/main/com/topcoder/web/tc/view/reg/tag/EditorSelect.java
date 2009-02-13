package com.topcoder.web.tc.view.reg.tag;

import com.topcoder.common.web.data.Editor;
import com.topcoder.common.web.util.Cache;
import com.topcoder.ejb.DataCache.DataCache;
import com.topcoder.ejb.DataCache.DataCacheHome;
import com.topcoder.shared.util.ApplicationServer;
import com.topcoder.shared.util.TCContext;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.servlet.jsp.JspException;
import java.util.ArrayList;

public class EditorSelect
        extends Select {
    String getOptionValue(Object o) {
        return "" + ((Editor) o).getEditorId();
    }

    String getOptionText(Object o) {
        return ((Editor) o).getEditorDesc();
    }

    ArrayList getSelectOptions()
            throws JspException {
        ArrayList editors = new ArrayList();
        InitialContext context = null;
        try {
            context = TCContext.getInitial();
            DataCache dataCache = Cache.get(context);
            editors = dataCache.getEditors();
        } catch (Exception e) {
            throw new JspException(e.toString());
        } finally {
            if (context != null) {
                try {
                    context.close();
                } catch (Exception e) {
                }
            }
        }
        return editors;
    }
}
