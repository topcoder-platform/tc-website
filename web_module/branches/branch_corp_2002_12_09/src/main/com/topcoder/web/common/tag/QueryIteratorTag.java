package com.topcoder.web.common.tag;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.jsp.JspException;
import javax.sql.DataSource;

import com.topcoder.shared.dataAccess.DataAccess;
import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.web.corp.Constants;
import com.topcoder.web.corp.Util;

import java.sql.SQLException;
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
            ic = new InitialContext(Constants.NDS_CONTEXT_ENVIRONMENT);
            DataAccessInt dai = new DataAccess( (DataSource)
                new InitialContext().lookup(Constants.NDS_DATA_SOURCE)
            );
            Request dataRequest = new Request();
            dataRequest.setContentHandle(command);
            Map result = dai.getData(dataRequest);
            // for now will take first of queries results
            Iterator i = result.keySet().iterator();
            if(i.hasNext()) {
                rsc = (ResultSetContainer)result.get(i.next());
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
