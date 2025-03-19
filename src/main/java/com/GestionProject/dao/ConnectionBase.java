package com.GestionProject.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionBase {

    private static final String URL = "jdbc:mysql://localhost:3306/GestionConst";
    private static final String USER="root";
    private static final String PASSWORD="0000";

    public static Connection getConnection(){
        Connection connection;

        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(URL , USER , PASSWORD);

        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            return null;
        }
        return connection;
    }
}
