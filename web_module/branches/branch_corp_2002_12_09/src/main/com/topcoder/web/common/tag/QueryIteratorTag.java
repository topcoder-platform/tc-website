package com.topcoder.web.common.tag;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.jsp.JspException;
import javax.sql.DataSource;

import com.topcoder.shared.dataAccess.DataAccessConstants;
import com.topcoder.shared.dataAccess.DataRetriever;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.web.corp.Constants;
import com.topcoder.web.corp.Util;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

/**
 * My comments/description/notes go here
 *
 * @author djFD molc@mail.ru
 * @version 1.02
 *
 */
public class QueryIteratorTag extends IteratorTag {
    private String command = null;
    private ResultSetContainer rsc = null;

//    private ResultSet rs;

    /**
     * 
     * @see javax.servlet.jsp.tagext.Tag#doStartTag()
     */
    public int doStartTag() throws JspException {
        InitialContext ic = null;
        try {
            ic = new InitialContext(Constants.JTA_CONTEXT_ENVIRONMENT);
            DataSource ds = (DataSource)ic.lookup(Constants.JTA_DATA_SOURCE);
            DataRetriever dr = new DataRetriever(ds.getConnection());
            Map params = new HashMap();
            params.put(DataAccessConstants.COMMAND, command);
            params = dr.executeCommand(params);
            // for now will take first of queries results
            Iterator i = params.keySet().iterator();
            if(i.hasNext()) {
                rsc = (ResultSetContainer)params.get(i.next());
            }
            else {
                rsc = null;
            }
            setCollection(rsc);
        }
        catch(NamingException ne) {
            ne.printStackTrace();
            throw new JspException("NamingException occured: "+ne.getMessage());
        }
        catch(SQLException sqle) {
            sqle.printStackTrace();
            throw new JspException("SQLException occured: "+sqle.getMessage());
        }
        catch(Exception e) {
            e.printStackTrace();
            throw new JspException("Exception occured: "+e.getMessage());
        }
        finally {
            Util.closeIC(ic);
        }
        return super.doStartTag();
    }

    /**
     * Sets the query name.
     *
     * @param query The query to set
     */
    public void setCommand(String cmd) {
        command = cmd;
    }
}
