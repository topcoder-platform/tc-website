package com.topcoder.web.reg.servlet.jsp.tag;

import java.util.*;
import javax.naming.*;
import javax.servlet.jsp.*;
import javax.servlet.jsp.tagext.*;

import com.topcoder.shared.util.*;
import com.topcoder.common.web.data.*;
import com.topcoder.ejb.DataCache.*;

public class CountrySelect
    extends Select  
{
    private ArrayList eligibleCountries;
    
    public CountrySelect()
    {
        super();
        init();
    }
    
    void init()
    {
        eligibleCountries = new ArrayList();
        eligibleCountries.add(getCountry("840","United States"));
        eligibleCountries.add(getCountry("036","Australia"));
        eligibleCountries.add(getCountry("124","Canada"));
        eligibleCountries.add(getCountry("156","China"));
        eligibleCountries.add(getCountry("554","New Zealand"));
        eligibleCountries.add(getCountry("826","United Kingdom"));
        eligibleCountries.add(getCountry("372","Ireland"));
        eligibleCountries.add(getCountry(" ","-----------------------"));
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
        countries.addAll(eligibleCountries);
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
              if (eligibleCountries.contains(country)) {
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
