package	com.topcoder.web.TCES.ejb;

import	java.sql.Date;
import	java.io.Serializable;

/**
 * This class serves as a convenient wrapper for database
 * fields from the country table.
 * @see com.topcoder.web.TCES.ejb.Country
 * @author Phil Selby, May 22nd, 2002
 */

public class CountryObject 
  implements Serializable {
	public String	country_code;
	public String	country_name;
	public Integer	participating;
	public Long	default_taxform_id;
}
