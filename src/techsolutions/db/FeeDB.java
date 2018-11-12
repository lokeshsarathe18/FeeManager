package techsolutions.db;

import java.sql.Connection;
import java.sql.DriverManager;

public class FeeDB implements DBData {
	private static Connection conn = null;

	private FeeDB() {
	}

	static {
		try {
			Class.forName(DRIVER);
			conn = DriverManager.getConnection(URL, USER, PWD);
		} catch (Exception e) {
			System.out.println("+++Exception in getConnection: " + e);
		}
	}

	public static Connection getConnection() {
		return conn;
	}
}
