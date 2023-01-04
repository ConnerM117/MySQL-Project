package projects.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import projects.exception.DbException;

public class DbConnection {

	private static final String HOST = "localhost";
	private static final int PORT = 3306;
	private static final String SCHEMA = "projects";
	private static final String USER = "projects";
	private static final String PASSWORD = "projects";
	
	public static Connection getConnection() {
		String url = String.format("jdbc:mysql://%s:%d/%s?user=%s&password=%s", HOST, PORT, SCHEMA, USER, PASSWORD);
		
		System.out.println("Establishing connection...");
		try {
			Connection conn = DriverManager.getConnection(url);
			System.out.println("Connection successfully established!");
			return conn;
		} catch (SQLException e) {
			System.out.println("Error establishing connection at " + url);
			throw new DbException("Error establishing connection at " + url);
		}
	}

}
