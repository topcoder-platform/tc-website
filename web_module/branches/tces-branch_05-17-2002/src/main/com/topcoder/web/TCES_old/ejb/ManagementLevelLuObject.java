package	com.topcoder.web.TCES.ejb;

import	java.sql.Date;
import	java.io.Serializable;

/**
 * This class serves as a convenient wrapper for database
 * fields from the management_level_lu table.
 * @see com.topcoder.web.TCES.ejb.ManagementLevelLu
 * @author Phil Selby, May 22nd, 2002
 */

public class ManagementLevelLuObject 
  implements Serializable {
	public Integer	management_level_id;
	public String	management_level_desc;
}
