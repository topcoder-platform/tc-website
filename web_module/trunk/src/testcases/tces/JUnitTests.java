
import junit.framework.*;

/**
 * TestSuite that runs all the  tests
 *
 */
public class JUnitTests {

	/*public static void main (String[] args) {
		junit.textui.TestRunner.run (suite());
	}*/
	public static Test suite ( ) {
		TestSuite suite= new TestSuite("PageNumTestCase Tests");
	
		//addAll(suite);
		addEndAndMultNode(suite);
		//addSelected(suite);

		return suite;
	}

	public static void addAll(TestSuite suite){
		suite.addTest(new TestSuite(PageNumTestCase.class));
	}
	public static void addEndAndMultNode(TestSuite suite){
		suite.addTest(new PageNumTestCase("testNode6thru4"));
		suite.addTest(new PageNumTestCase("testNode6thru5"));
		suite.addTest(new PageNumTestCase("testNode7thru4"));
		suite.addTest(new PageNumTestCase("testNode7thru5"));
		suite.addTest(new PageNumTestCase("testNode8"));
		suite.addTest(new PageNumTestCase("testNode11"));
		suite.addTest(new PageNumTestCase("testNode12"));
		suite.addTest(new PageNumTestCase("testNode14thru10"));
		suite.addTest(new PageNumTestCase("testNode14thru13"));
		suite.addTest(new PageNumTestCase("testNode15"));
	}
	public static void addSelected(TestSuite suite){
		suite.addTest(new PageNumTestCase("testNode3"));
		suite.addTest(new PageNumTestCase("testNode4"));
		suite.addTest(new PageNumTestCase("testNode5"));
		suite.addTest(new PageNumTestCase("testNode6thru4"));
		suite.addTest(new PageNumTestCase("testNode6thru5"));
		suite.addTest(new PageNumTestCase("testNode7thru4"));
		suite.addTest(new PageNumTestCase("testNode7thru5"));
		suite.addTest(new PageNumTestCase("testNode8"));
		suite.addTest(new PageNumTestCase("testNode9"));
		suite.addTest(new PageNumTestCase("testNode10"));
		suite.addTest(new PageNumTestCase("testNode11"));
		suite.addTest(new PageNumTestCase("testNode12"));
		suite.addTest(new PageNumTestCase("testNode13"));
		suite.addTest(new PageNumTestCase("testNode14thru10"));
		suite.addTest(new PageNumTestCase("testNode14thru13"));
		suite.addTest(new PageNumTestCase("testNode15"));
	}

}