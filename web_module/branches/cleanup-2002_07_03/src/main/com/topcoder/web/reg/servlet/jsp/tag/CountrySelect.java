package com.topcoder.web.reg.servlet.jsp.tag;

import java.util.*;
import javax.naming.*;
import javax.servlet.jsp.*;
import javax.servlet.jsp.tagext.*;

import com.topcoder.common.*;
import com.topcoder.common.web.data.*;
import com.topcoder.ejb.DataCache.*;

public class CountrySelect
    extends Select  
{
    public Country US;
    public Country AUSTRALIA;
    public Country CANADA;
    public Country SEPARATOR;
    
    public CountrySelect()
    {
        super();
        init();
    }
    
    void init()
    {
        US = getCountry("840","United States");
        AUSTRALIA = getCountry("036","Australia");
        CANADA = getCountry("124","Canada");
        SEPARATOR = getCountry(" ","-----------------------");
    }
    
    Country getCountry(String code, String name)
    {
        Country c = new Country();
        c.setCountryCode(code);
        c.setCountryName(name);
        return c;
    }
    
    String getOptionValue(Object o)
    {
        return ((Country)o).getCountryCode();
    } 

    String getOptionText(Object o)
    {
        return ((Country)o).getCountryName();
    }
    
    ArrayList getSelectOptions()
        throws JspException
    {
        ArrayList countries = new ArrayList();
        countries.add(US);
        countries.add(AUSTRALIA);
        countries.add(CANADA);
        countries.add(SEPARATOR);
        Context context = null;
        try
        {
            context = TCContext.getInitial();
            DataCacheHome dataCacheHome = (DataCacheHome) context.lookup(ApplicationServer.DATA_CACHE);
            DataCache dataCache = dataCacheHome.create();
            ArrayList cacheCountries = dataCache.getCountries();
            ArrayList temp = new ArrayList ( cacheCountries );
            for ( int i = 0; i < temp.size(); i++ ) {
              Country country = (Country) temp.get(i);
              if ( 
                country.equals(US)
                || country.equals(AUSTRALIA)
                || country.equals(CANADA)
              ) {
                temp.remove(i);
              }
            }
            countries.addAll ( temp );
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
        if (countries != null)
        {
        }
        return countries;
    }
}
