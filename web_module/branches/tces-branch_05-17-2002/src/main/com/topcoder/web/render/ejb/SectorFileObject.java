package	com.topcoder.web.render.ejb;

import	java.sql.Date;
import	java.io.Serializable;

public class SectorFileObject 
  implements Serializable {
	public Integer	sector_id;
	public String	file;
	public String	system;
	public String	status;
	public String	language_cd;
	public String	path;
	public String	link;
	public String	country_code;
	public Integer	modify_by;
	public Date	modify_date;
}
