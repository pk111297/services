package com.thinking.machines.services;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.util.*;
import java.net.*;
import java.lang.*;
import java.sql.*;

@MultipartConfig(maxFileSize = 1024 * 1024 * 20) //20 MB
public class MysqlToExcel extends HttpServlet
{
public void doPost(HttpServletRequest rq,HttpServletResponse rs)
{
try
{ 
System.out.println("MysqlToExcel Service Chali");
System.out.println("---------------"+rq.getPart("file")+"-------------------------------");
//Getting the file data
Part part=rq.getPart("file");
String path=rq.getServletContext().getRealPath("");
File fileDirPath=new File(path+"WEB-INF/classes/com/thinking/machines/services/mysqlToExcel");
if(!fileDirPath.exists()) fileDirPath.mkdirs();
//Get the filename
String fileName = part.getSubmittedFileName();
fileName=path+"WEB-INF/classes/com/thinking/machines/services/mysqlToExcel/"+fileName;
part.write(fileName);
String dbname=fileName.substring(fileName.lastIndexOf("/")+1,fileName.lastIndexOf("."));
System.out.println("MysqlToExcel Service Khatam: "+dbname);

Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/?user=sbadmin2&password=sbadmin229@&allowMultiQueries=true");



}catch(Exception exception)
{
System.out.println(exception.getMessage());
}
}
}
