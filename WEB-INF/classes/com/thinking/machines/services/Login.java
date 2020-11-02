package com.thinking.machines.services;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.util.*;
import com.thinking.machines.beans.*;
import com.thinking.machines.pojo.*;
import java.net.*;
public class Login extends HttpServlet
{
public void doPost(HttpServletRequest rq,HttpServletResponse rs)
{ 
try
{
System.out.println("Login Service Chali");
System.out.println(rq.getParameter("username")+"\n"+rq.getParameter("password"));
String username=rq.getParameter("username").trim();
String password=rq.getParameter("password").trim();
String path=rq.getServletContext().getRealPath("")+"files/users.txt";
File file=new File(path);
if(!file.exists() || file.length()==0)
{
System.out.println("File Doesnot Exists!");
ErrorBean errorBean=new ErrorBean();
errorBean.addError("User Doesnot Exists!");
rq.setAttribute("errorBean",errorBean);
RequestDispatcher requestDispatcher;
requestDispatcher=rq.getRequestDispatcher("login.jsp");
requestDispatcher.forward(rq,rs);
}
RandomAccessFile randomAccessFile=new RandomAccessFile(file,"rw");
while(randomAccessFile.getFilePointer()<randomAccessFile.length())
{
String fUsername=randomAccessFile.readLine();
String fPassword=randomAccessFile.readLine();
String fName=randomAccessFile.readLine();
String fDOB=randomAccessFile.readLine();
System.out.println(fUsername+"\n"+fPassword+"\n"+fName+"\n"+fDOB);
if(username.equalsIgnoreCase(fUsername))
{
if(password.equalsIgnoreCase(fPassword))
{
//username and password is matched
HttpSession session=rq.getSession();
User user=new User();
user.name=fName;
user.password=fPassword;
user.username=fUsername;
user.dob=fDOB;
session.setAttribute("user",user);
System.out.println("---------------------------User matched----------------------------------\n");
RequestDispatcher requestDispatcher=rq.getRequestDispatcher("mainPage.jsp");
requestDispatcher.forward(rq,rs);  
}
else
{
System.out.println("User Exists but password Doesnot matches");
randomAccessFile.close();
ErrorBean errorBean=new ErrorBean();
errorBean.addError("Invalid Username or Password");
rq.setAttribute("errorBean",errorBean);
RequestDispatcher requestDispatcher;
requestDispatcher=rq.getRequestDispatcher("login.jsp");
requestDispatcher.forward(rq,rs);
}
}//if ends
}//while ends
System.out.println("User doesnot Exists!");
randomAccessFile.close();
ErrorBean errorBean=new ErrorBean();
errorBean.addError("User doesnot Exists!");
rq.setAttribute("errorBean",errorBean);
RequestDispatcher requestDispatcher;
requestDispatcher=rq.getRequestDispatcher("login.jsp");
requestDispatcher.forward(rq,rs);
}catch(Exception e)
{
System.out.println(e);
}
}
}
