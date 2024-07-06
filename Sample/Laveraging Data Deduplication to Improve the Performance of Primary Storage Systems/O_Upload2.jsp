<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.util.*"%>
<%@ include file="connect.jsp"%>
<%@page
	import="java.util.*,java.security.Key,java.util.Random,javax.crypto.Cipher,javax.crypto.spec.SecretKeySpec,org.bouncycastle.util.encoders.Base64"%>
<%@ page
	import="java.sql.*,java.util.Random,java.io.PrintStream,java.io.FileOutputStream,java.io.FileInputStream,java.security.DigestInputStream,java.math.BigInteger,java.security.MessageDigest,java.io.BufferedInputStream"%>
<%@ page
	import="java.security.Key,java.security.KeyPair,java.security.KeyPairGenerator,javax.crypto.Cipher"%>
<%@page
	import="java.util.*,java.text.SimpleDateFormat,java.util.Date,java.io.FileInputStream,java.io.FileOutputStream,java.io.PrintStream,java.math.*"%>
	<%@ page import="java.lang.management.ThreadMXBean,java.lang.management.ManagementFactory"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Owner </title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="css/style.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="css/coin-slider.css" />
<script type="text/javascript" src="js/cufon-yui.js"></script>
<script type="text/javascript" src="js/cufon-georgia.js"></script>
<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="js/script.js"></script>
<script type="text/javascript" src="js/coin-slider.min.js"></script>
<style type="text/css">
<!--
.style1 {font-size: 24}
.style2 {padding:0; margin:0; width:100%; line-height:0; clear: both;}
.style3 {font-size: 36px; }
.style24 {color: #FF0000}
-->
</style>
<script language="javascript" type='text/javascript'>
function loadFileAsText()
{
	var fileToLoad = document.getElementById("file").files[0];

	var fileReader = new FileReader();
	fileReader.onload = function(fileLoadedEvent) 
	{
		var textFromFileLoaded = fileLoadedEvent.target.result;
		document.getElementById("textarea").value = textFromFileLoaded;
	};
	fileReader.readAsText(fileToLoad, "UTF-8");
}
</script>
</head>
<body>
<div class="main">
  <div class="header">
    <div class="header_resize">
      <div class="menu_nav">
        <ul>
          <li class="active"><a href="O_Main.jsp">Hi <%=application.getAttribute("doname")%> !!</a></li>
          <li><a href="O_Login.jsp">Logout</a></li>
        </ul>
      </div>
      <div class="logo">
        <h1 class="style3">Leveraging Data Deduplication to Improve the Performance of Primary Storage Systems in the Cloud</h1>
      </div>
      <div class="clr style1"></div>
      <div class="slider style1">
        <div id="coin-slider"> <a href="#"><img src="images/slide1.jpg" width="960" height="360" alt="" /> </a> <a href="#"><img src="images/slide2.jpg" width="960" height="360" alt="" /> </a> <a href="#"><img src="images/slide3.jpg" width="960" height="360" alt="" /> </a> </div>
        <div class="style2"></div>
      </div>
      <div class="clr style1"></div>
    </div>
  </div>
  <div class="content style1">
    <div class="content_resize">
      <div class="mainbar">
        <div class="article">
          <h2>Upload File</h2>
          <p>&nbsp;</p>
          <div class="clr">
            <div align="right"><%=new java.util.Date()%></div>
          </div>
          <div >
            <p align="left">
              <%
	String owner = (String) application.getAttribute("doname");
	//String ocl=(String)application.getAttribute("uploadC");
%>
	<% try 
	{
		String s1 = "", s2 = "", s3 = "", s4 = "", s5 = "", s6 = "", s7 = "", s8, s9 = "", s10, s11, s12, s13;
		int i = 0, j = 0, k;
		String file = request.getParameter("t42");
		String cont1 = request.getParameter("text1");
		String cont2 = request.getParameter("text2");
		String cont3 = request.getParameter("text3");
		String cont4 = request.getParameter("text4");
		String fsize =request.getParameter("fsize");
      	
		String mac1 = request.getParameter("t1");
		String mac2 = request.getParameter("t2");
		String mac3 = request.getParameter("t3");
		String mac4 = request.getParameter("t4");
		
		String cloud = "cloud";
		
		String query2="Select *from cloudpurchase where downer='"+owner+"' and cloud='cloud' "; 
		Statement st2=connection.createStatement();
		ResultSet rs2=st2.executeQuery(query2);
		if (rs2.next()==true)
		{
			int freemem=Integer.parseInt(rs2.getString(12));
			int fsize1=Integer.parseInt(fsize);
			
			String query3="Select *from cloudserver where ((mac1='"+mac1+"')||(mac2='"+mac2+"')||(mac3='"+mac3+"')||(mac4='"+mac4+"')) and cname='cloud'  "; 
			Statement st3=connection.createStatement();
			ResultSet rs3=st3.executeQuery(query3);
			if (!(rs3.next()==true))
			{
			
				if(fsize1<=freemem) 
				{
					SimpleDateFormat sdfDate = new SimpleDateFormat("dd/MM/yyyy");
					SimpleDateFormat sdfTime = new SimpleDateFormat("HH:mm:ss");
					
					Date now = new Date();
					String strDate = sdfDate.format(now);
					String strTime = sdfTime.format(now);
					String dt = strDate + "   " + strTime;
					
					KeyPairGenerator kg = KeyPairGenerator.getInstance("RSA");
					Cipher encoder = Cipher.getInstance("RSA");
					KeyPair kp = kg.generateKeyPair();
					
					Key pubKey = kp.getPublic();
					
					byte[] pub = pubKey.getEncoded();
					//				System.out.println("PUBLIC KEY" + pub);
					
					String pk = String.valueOf(pub);
					String rank = "0";
					Statement st = connection.createStatement();
					
					String user = "Data Owner";
					String task = "Upload";
					Statement st21 = connection.createStatement();
					st21.executeUpdate("insert into cloudserver(fname,ownername,cname,ct1,mac1,ct2,mac2,ct3,mac3,ct4,mac4,sk,dt,fsize,status) values ('"+ file+ "','"+ owner+ "','"+ cloud+ "','"+ cont1+ "','"+ mac1+ "','"+ cont2+ "','"+ mac2+ "','"+ cont3+ "','"+ mac3+ "','"+ cont4+ "','"+ mac4+ "','"+ pk+ "','" + dt + "','"+fsize+"','No')");
					
					
					
					long start=Long.parseLong(request.getParameter("start"));
					ThreadMXBean threadBean= ManagementFactory.getThreadMXBean();
					long end=threadBean.getCurrentThreadCpuTime();
					String total=Long.toString(end-start);
					
					
					Statement st55 = connection.createStatement();
			st55.executeUpdate("insert into cpu_speed(owner,fname,dt,task,cpuspeed) values('"+owner+"','"+file+"','"+dt+"','Upload','"+total+"')");
					
					String newmemory=String.valueOf(freemem-fsize1);	
					
					String strQuer2 = "update cloudpurchase set freemem='"+newmemory+"' where downer='"+owner+"' and cloud='cloud'";
					st.executeUpdate(strQuer2);
					
					
					
					Statement st211 = connection.createStatement();
					st211.executeUpdate("insert into  backupcloudserver(fname,ownername,cname,ct1,mac1,ct2,mac2,ct3,mac3,ct4,mac4,sk,dt,fsize) values ('"+ file+ "','"+ owner+ "','"+ cloud+ "','"+ cont1+ "','"+ mac1+ "','"+ cont2+ "','"+ mac2+ "','"+ cont3+ "','"+ mac3+ "','"+ cont4+ "','"+ mac4+ "','"+ pk+ "','" + dt + "','"+fsize+"')");
					
					
					String strQuery2 = "insert into transaction(user,fname,task,dt,fsize) values('"+ owner+ "','"+ file+ "','"+ task+ "','" + dt + "','"+fsize+"')";
					connection.createStatement().executeUpdate(strQuery2);
					
					%>
			</p>
					<p> </p>
					<h2>Data Uploaded Successfully !!!</h2>
					</p>
					<br />
					<div class="clr"></div>
					<%
				}
				else
				{	
					
					%>
					<h3 class="style29">You Dont Have Free Memory To UpLoad Files <a href="O_MemRequest.jsp">Click Here To Request (Memory)..</a> !!</h3>
					<%
				}
			}
			else
			{	
				String fil = rs3.getString(2);
				connection.createStatement().executeUpdate("insert into deduplication_upload(name,ofname,dfname) values('"+owner+"','"+fil+"','"+file+"')");
				
				SimpleDateFormat sdfDate = new SimpleDateFormat("dd/MM/yyyy");
						SimpleDateFormat sdfTime = new SimpleDateFormat("HH:mm:ss");
						
						Date now = new Date();
						String strDate = sdfDate.format(now);
						String strTime = sdfTime.format(now);
						String dt = strDate + "   " + strTime;
						
						KeyPairGenerator kg = KeyPairGenerator.getInstance("RSA");
						Cipher encoder = Cipher.getInstance("RSA");
						KeyPair kp = kg.generateKeyPair();
						
						Key pubKey = kp.getPublic();
						
						byte[] pub = pubKey.getEncoded();
						//				System.out.println("PUBLIC KEY" + pub);
						
						String pk = String.valueOf(pub);
						String rank = "0";
						Statement st = connection.createStatement();
						
						String user = "Data Owner";
						String task = "Upload";
						Statement st21 = connection.createStatement();
						st21.executeUpdate("insert into cloudserver(fname,ownername,cname,ct1,mac1,ct2,mac2,ct3,mac3,ct4,mac4,sk,dt,fsize,status) values ('"+ file+ "','"+ owner+ "','"+ cloud+ "','"+ cont1+ "','"+ mac1+ "','"+ cont2+ "','"+ mac2+ "','"+ cont3+ "','"+ mac3+ "','"+ cont4+ "','"+ mac4+ "','"+ pk+ "','" + dt + "','"+fsize+"','Duplicate')");
						
						
						String newmemory=String.valueOf(freemem-fsize1);	
						
						String strQuer2 = "update cloudpurchase set freemem='"+newmemory+"' where downer='"+owner+"' and cloud='cloud'";
						st.executeUpdate(strQuer2);
						
						
						
						Statement st211 = connection.createStatement();
						st211.executeUpdate("insert into  backupcloudserver(fname,ownername,cname,ct1,mac1,ct2,mac2,ct3,mac3,ct4,mac4,sk,dt,fsize) values ('"+ file+ "','"+ owner+ "','"+ cloud+ "','"+ cont1+ "','"+ mac1+ "','"+ cont2+ "','"+ mac2+ "','"+ cont3+ "','"+ mac3+ "','"+ cont4+ "','"+ mac4+ "','"+ pk+ "','" + dt + "','"+fsize+"')");
						
						
						String strQuery2 = "insert into transaction(user,fname,task,dt,fsize) values('"+ owner+ "','"+ file+ "','"+ task+ "','" + dt + "','"+fsize+"')";
						connection.createStatement().executeUpdate(strQuery2);
				
				%>
				<h3 class="style29">File Your Trying To Upload Seems To Be Duplicate..<span class="style24">(Original File : <%=fil%>)</span> Details Forwarded To Deduplicator</a> !!</h3>
				<%
			}
		}
		else
		{	
		
			%>
			<h3 class="style29">You Have Not Purchased Cloud (Memory)..</a> !!</h3>
			<%
		}	
		connection.close();
	}
         
  catch(Exception e)
  {
	out.println(e.getMessage());
  }
%>
<p><a href="O_Upload.jsp">Back</a></p>
          </div>
<p class="infopost">&nbsp;</p>
          <div class="style2"></div>
          <div class="img">
            <div align="justify"></div>
          </div>
          <div class="style2"></div>
        </div>
      </div>
      <div class="sidebar">
        <div class="searchform">
          <form id="formsearch" name="formsearch" method="post" action="#">
            
            <input name="editbox_search" class="editbox_search" id="editbox_search" maxlength="80" value="Search our ste:" type="text" />
            
            <input name="button_search" src="images/search.gif" class="button_search" type="image" />
          </form>
        </div>
        <div class="gadget">
          <h2 class="star"> Menu</h2>
          <div class="style2"></div>
          <ul class="sb_menu">
            <li><a href="O_Main.jsp">Home</a></li>
            <li><a href="O_Login.jsp">Logout</a></li>
          </ul>
        </div>
      </div>
      <div class="style2"></div>
    </div>
  </div>
  <div class="fbg style1">
    <div class="fbg_resize">
      <div class="col c1">
        <h2>Storage Capacity</h2>
        <a href="#"><img src="images/gal1.jpg" width="75" height="75" alt="" class="gal" /></a> <a href="#"><img src="images/gal2.jpg" width="75" height="75" alt="" class="gal" /></a> <a href="#"><img src="images/gal3.jpg" width="75" height="75" alt="" class="gal" /></a> <a href="#"><img src="images/gal4.jpg" width="75" height="75" alt="" class="gal" /></a> <a href="#"><img src="images/gal5.jpg" width="75" height="75" alt="" class="gal" /></a> <a href="#"><img src="images/gal6.jpg" width="75" height="75" alt="" class="gal" /></a> </div>
      <div class="col c2">
        <h2>Data Redundancy</h2>
        <p align="justify">Experimental studies reveal that data redundancy exhibits a much higher level of intensity on the I/O path than that on disks due to relatively high temporal access locality associated with small I/O requests to redundant data. Moreover, directly applying data deduplication to primary storage systems in the Cloud will likely cause space contention in memory and data fragmentation<br />
        on disks.</p>
      </div>
      <div class="col c3">
        <h2>Primary Storage</h2>
        <p align="justify">Recent studies have shown that moderate to high data redundancy clearly exists in primary storage systems in the Cloud. Our experimental studies reveal that data redundancy exhibits a much higher level of intensity on the I/O path than that on<br />
        disks due to relatively high temporal access locality associated with small I/O requests to redundant data.</p>
      </div>
      <div class="style2"></div>
    </div>
  </div>
  <div class="footer style1">
    <div class="footer_resize">
      <div style="clear:both;"></div>
    </div>
  </div>
</div>
<div align=center class="style1"></div>
</body>
</html>
