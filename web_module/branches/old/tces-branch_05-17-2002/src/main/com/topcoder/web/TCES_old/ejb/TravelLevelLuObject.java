package	com.topcoder.web.TCES.ejb;

import	java.sql.Date;
import	java.io.Serializable;

/**
 * This class serves as a convenient wrapper for database
 * fields from the travel_level_lu table.
 * @see com.topcoder.web.TCES.ejb.TravelLevelLu
 * @author Phil Selby, May 22nd, 2002
 */

public class TravelLevelLuObject 
  implements Serializable {
	public Integer	travel_level_id;
	public String	travel_level_desc;
}
