package	com.topcoder.web.TCES.ejb;

import	java.sql.Date;
import	java.io.Serializable;

/**
 * This class serves as a convenient wrapper for database
 * fields from the location table.
 * @see com.topcoder.web.TCES.ejb.Location
 * @author Phil Selby, May 22nd, 2002
 */

public class LocationObject 
  implements Serializable {
	public Integer	location_id;
	public String	description;
}
