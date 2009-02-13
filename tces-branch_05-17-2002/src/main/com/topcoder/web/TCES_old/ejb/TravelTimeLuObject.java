package	com.topcoder.web.TCES.ejb;

import	java.sql.Date;
import	java.io.Serializable;

/**
 * This class serves as a convenient wrapper for database
 * fields from the travel_time_lu table.
 * @see com.topcoder.web.TCES.ejb.TravelTimeLu
 * @author Phil Selby, May 22nd, 2002
 */

public class TravelTimeLuObject 
  implements Serializable {
	public Integer	travel_time_id;
	public String	travel_time_desc;
}
