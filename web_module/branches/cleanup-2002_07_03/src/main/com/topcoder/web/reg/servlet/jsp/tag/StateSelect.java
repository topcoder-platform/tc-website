package com.topcoder.web.reg.servlet.jsp.tag;

import java.util.*;
import javax.naming.*;
import javax.servlet.jsp.*;
import javax.servlet.jsp.tagext.*;

import com.topcoder.shared.util.*;
import com.topcoder.common.web.data.*;
import com.topcoder.ejb.DataCache.*;

public class StateSelect
    extends Select  
{
    public State NOT_IN_US;
    public State SEPARATOR;

    public StateSelect()
    {
        super();
        init();
    }

    void init()
    {
        NOT_IN_US = getState("ZZ","Not In US");
        SEPARATOR = getState("","-----------------------");
    }

    State getState ( String code, String name )
    {
        State s = new State();
        s.setStateCode(code);
        s.setStateName(name);
        return s;
    }


    String getOptionValue(Object o)
    {
        return ((State)o).getStateCode();
    } 

    String getOptionText(Object o)
    {
        return ((State)o).getStateName();
    }
    
    ArrayList getSelectOptions()
        throws JspException
    {
        ArrayList states = new ArrayList(100);
        Context context = null;
        states.add ( NOT_IN_US );
        //states.add ( SEPARATOR );
        try
        {
            context = TCContext.getInitial();
            DataCacheHome dataCacheHome = (DataCacheHome) context.lookup(ApplicationServer.DATA_CACHE);
            DataCache dataCache = dataCacheHome.create();
            ArrayList temp = new ArrayList ( dataCache.getStates() );
            for ( int i=0; i < temp.size(); i++ )
            {
                State state = (State) temp.get(i);
                if ( state.equals(NOT_IN_US) )
                {
                    temp.remove(i);
                }
            }
            states.addAll ( temp );
        }
        catch (Exception e)
        {
            throw new JspException(e.toString());
        }
        finally
        {
            if (context != null)
            {
                try
                {
                    context.close();
                }
                catch (Exception e)
                {
                }
            }
        }
        return states;
    }
}
