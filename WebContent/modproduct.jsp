
<!doctype html>
<html lang="en">
<head>
	<meta charset="utf-8" />
	<link rel="apple-touch-icon" sizes="76x76" href="assets/img/apple-icon.png">
	<link rel="icon" type="image/png" sizes="96x96" href="assets/img/favicon.png">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

	<title>Add product</title>

	<meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />
    <meta name="viewport" content="width=device-width" />


    <!-- Bootstrap core CSS     -->
    <link href="assets/css/bootstrap.min.css" rel="stylesheet" />

    <!-- Animation library for notifications   -->
    <link href="assets/css/animate.min.css" rel="stylesheet"/>

    <!--  Paper Dashboard core CSS    -->
    <link href="assets/css/paper-dashboard.css" rel="stylesheet"/>


    <!--  CSS for Demo Purpose, don't include it in your project     -->
    <link href="assets/css/demo.css" rel="stylesheet" />


    <!--  Fonts and icons     -->
    <link href="http://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" rel="stylesheet">
    <link href='https://fonts.googleapis.com/css?family=Muli:400,300' rel='stylesheet' type='text/css'>
    <link href="assets/css/themify-icons.css" rel="stylesheet">
<script src="js/jquery-3.2.1.min.js"></script>
</head>
<body>

<div class="wrapper">
    <div class="sidebar" data-background-color="white" data-active-color="danger">

    <!--
		Tip 1: you can change the color of the sidebar's background using: data-background-color="white | black"
		Tip 2: you can change the color of the active button using the data-active-color="primary | info | success | warning | danger"
	-->

    	<div class="sidebar-wrapper">
            <div class="logo">
                <a href="#" class="simple-text">
                    INFOTECH
                </a>
            </div>

            <ul class="nav">
                <li>
                    <a href="dashboard.jsp">
                        <i class="ti-panel"></i>
                        <p>Stats</p>
                    </a>
                </li>
                <li>
                    <a href="productslist.jsp">
                        <i class="ti-list"></i>
                        <p>Products list</p>
                    </a>
                </li>
                
                <li>
                    <a href="addproduct.jsp">
                        <i class="ti-plus"></i>
                        <p>Add Product</p>
                    </a>
                </li>
                <li  class="active">
                    <a href="modifyproduct.jsp">
                        <i class="ti-pencil"></i>
                        <p>Modify Product </p>
                    </a>
                </li>
             
                <li>
                    <a href="deleteproduct.jsp">
                        <i class="ti-trash"></i>
                        <p>Delete Product</p>
                    </a>
               </li>
                 <li>
                    <a href="message.jsp">
                        <i class="ti-comments-smiley"></i>
                        <p>Messages List</p>
                    </a>
               </li>
            </ul>
    	</div>
    </div>

    <div class="main-panel">
        <nav class="navbar navbar-default">
            <div class="container-fluid">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar bar1"></span>
                        <span class="icon-bar bar2"></span>
                        <span class="icon-bar bar3"></span>
                    </button>
                    <a class="navbar-brand" href="#">Stats</a>
                </div>
                <div class="collapse navbar-collapse">
                    <ul class="nav navbar-nav navbar-right">
                        <li>
                           
                        </li>
                        <li class="dropdown">
                          
                        </li>
						<li>
                           <a href="alogin.jsp">
                        <i class="ti-export"></i>
                        <p>Log out</p>
                    </a>
                        </li>
                    </ul>

                </div>
            </div>
        </nav>

<br>
<br>

<center><h5 id="success" style="display: none;"> Product MODIFIED Successfully</h5></center>
       <div class="container">
  
  <section class="panel panel-default">
<div class="panel-heading"> 
<h3 class="panel-title">MODIFY PRODUCT</h3> 
</div> 
<div class="panel-body">
                                          
 <%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>

<%

String driverName = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String dbName = "infotech";
String userId = "root";
String password = "";

try {
Class.forName(driverName);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}

Connection connection = null;
Statement statement = null;
ResultSet rs = null;

%>

<%
try{ 
connection = DriverManager.getConnection(connectionUrl+dbName, userId, password);
statement=connection.createStatement();
String ch= request.getParameter("b1");
int id= Integer.parseInt(ch) ; 
String sql ="SELECT * FROM produit where id="+id;

rs = statement.executeQuery(sql);    
while(rs.next()){
	%>                                                               
<form action="modproduct.jsp" method="get" class="form-horizontal" role="form">

<div class="form-group">
	

   <input type="hidden" name="b1" value="<%=rs.getString("id") %>">
   <div class="form-group">
    <label for="name" class="col-sm-3 control-label">Name:</label>
    <div class="col-sm-9">
      <input type="text" class="form-control" name="name"  value="<%=rs.getString("nom") %>">
    </div>
  </div> <!-- form-group // -->
  <div class="form-group">
    <label for="name" class="col-sm-3 control-label">Category:</label>
    <div class="col-sm-9">
      <input type="text" class="form-control" name="category" value="<%=rs.getString("categorie") %>">
    </div>
  </div> <!-- form-group // -->
  <div class="form-group">
    <label for="about" class="col-sm-3 control-label">Description:</label>
    <div class="col-sm-9">
      <textarea class="form-control" name="description"><%=rs.getString("description") %></textarea>
    </div>
  </div> <!-- form-group // -->
  <div class="form-group">
    <label for="qty" class="col-sm-3 control-label">Price:</label>
    <div class="col-sm-3">
   <input type="text" class="form-control" name="price" value="<%=rs.getString("prix") %>">
    </div>
  </div> <!-- form-group // -->
  
	
  <div class="form-group">
    <label for="name" class="col-sm-3 control-label">Image path:</label>
    <div class="col-sm-3">
         <input type="file" class="form-control" name="image" value="C:\usbfix-debug.txt">
    </div>
    
	
  
  </div> <!-- form-group // -->
   <div class="form-group">
    <label for="qty" class="col-sm-3 control-label">Quantity:</label>
    <div class="col-sm-3">
   <input type="text" class="form-control" name="quantity" id="quantity" value="<%=rs.getString("qte") %>">
    </div>
  </div> <!-- form-group // -->
  <hr>
  <%} %>
  <div class="form-group">
    <div class="col-sm-offset-3 col-sm-9">
      <button type="submit" class="btn btn-primary">MODIFY</button>
    </div>
  </div> <!-- form-group // -->

  
</div><!-- panel-body // -->
</section><!-- panel// -->

  
</div> <!-- container// -->
</div>
</div>


  
</form>
<%


String a=request.getParameter("name");
String b=request.getParameter("category");
String c=request.getParameter("description");
String d=request.getParameter("price");
String e=request.getParameter("image");
String f=request.getParameter("quantity");
String g=request.getParameter("b1");
int idp=Integer.parseInt(g) ; 
float prix=Float.parseFloat(d) ; 
int qte=Integer.parseInt(f) ; 
PreparedStatement ps=null;

int updateQuery = 0;

if(a!=null && b!=null && c!=null && d!=null && e!=null && f!=null){

		String query="update produit set nom=?,categorie=?,description=?,prix=?,image=?  where id='"+idp+"'";
		PreparedStatement prs=connection.prepareStatement(query);
		prs.setString(1,a);
	    prs.setString(2,b) ;
	    prs.setString(3,c) ;
	    prs.setString(4,d) ;
	    prs.setString(5,e)  ;
		updateQuery=prs.executeUpdate();
		if(updateQuery!=0){
			response.sendRedirect("modifyproduct.jsp");
		}
}

}catch(Exception ex){
	out.println("Your Connection: "+ex);
}finally{
	
	connection.close();
}


%>

</body>
</html>
