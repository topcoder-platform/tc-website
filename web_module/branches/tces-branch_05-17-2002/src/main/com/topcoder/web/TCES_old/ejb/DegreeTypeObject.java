package	com.topcoder.web.TCES.ejb;

import	java.sql.Date;
import	java.io.Serializable;

/**
 * This class serves as a convenient wrapper for database
 * fields from the degree_type table.
 * @see com.topcoder.web.TCES.ejb.DegreeType
 * @author Phil Selby, May 22nd, 2002
 */

public class DegreeTypeObject 
  implements Serializable {
	public Integer	degree_type_id;
	public String	description;
}
