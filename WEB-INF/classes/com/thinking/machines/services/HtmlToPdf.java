package com.thinking.machines.services;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.util.*;
import java.net.*;
import java.lang.*;
public class HtmlToPdf extends HttpServlet
{
public void doPost(HttpServletRequest rq,HttpServletResponse rs)
{
try
{ 
System.out.println("HTMLToPDF Service Chali");
System.out.println(rq.getParameter("data"));
String path=rq.getServletContext().getRealPath("")+"WEB-INF/classes/com/thinking/machines/services/Python/htmlToPdf.py";
ProcessBuilder processBuilder=new ProcessBuilder("python3",path,rq.getParameter("data"));
Process process=processBuilder.start(); 
process.waitFor(); 
BufferedReader bufferedReader=new BufferedReader(new InputStreamReader(process.getInputStream()));
System.out.println(bufferedReader.readLine());
while(true) 
{
String s=bufferedReader.readLine();
if(s==null) break;
System.out.println(s);
}
rs.setContentType("application/pdf");
PrintWriter printWriter=rs.getWriter();
path=rq.getServletContext().getRealPath("")+"WEB-INF/classes/com/thinking/machines/services/Python/htmlToPdf.pdf";
FileInputStream fileInputStream=new FileInputStream(path);
int i;
while(true)
{
i=fileInputStream.read();
if(i==-1) break;
printWriter.write(i);
}
fileInputStream.close();
printWriter.close();
}catch(Exception exception)
{
System.out.println(exception.getMessage());
}
}
}
