/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.infox.dal;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.sql.*;

/**
 *
 * @author ztz
 */

public class ModuloConexao {
    // Método Responsável por estabelecer a conexão com o banco.

    public static Connection conector() {
        java.sql.Connection conexao = null;
        // A linha a baixo chama o driver
        String driver = "com.mysql.jdbc.Driver";
        // Armazenando informações referentes ao banco
        String url = "jdbc:mysql://localhost:3306/dbinfox";
        String user = "root";
        
        File file = new File("password.txt");
        
        String passwd = "";
        
        try {
            FileReader read = new FileReader(file);
            BufferedReader readBuffer = new BufferedReader(read);
            
            String string;
            string = readBuffer.readLine();
            
            while (string != null) {
                passwd += string;
                string = readBuffer.readLine();
            }
        } catch (IOException error) {
            System.out.println(error);
        }
        String password = passwd;
        // Estabelecendo a conexão com o banco.
        try {
            Class.forName(driver);
            conexao = DriverManager.getConnection(url, user, password);
            return conexao;
        } catch (Exception error) {
            // A linha a baixo serve de depuração.
            // System.out.println(error);
            return null;
        }
        
    }
}
