package	com.topcoder.web.TCES.ejb;

import	java.sql.Date;
import	java.io.Serializable;

/**
 * This class serves as a convenient wrapper for database
 * fields from the degree_type_lu table.
 * @see com.topcoder.web.TCES.ejb.DegreeTypeLu
 * @author Phil Selby, May 22nd, 2002
 */

public class DegreeTypeLuObject 
  implements Serializable {
	public Integer	degree_type_id;
	public String	degree_type_desc;
}
