<%@page import="com.tech.blog.entities.User"%>
<%@page import="com.tech.blog.dao.LikeDao"%>
<%@page import="com.tech.blog.entities.Post"%>
<%@page import="java.util.List"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="com.tech.blog.dao.PostDao"%>

<%
 User user=(User) session.getAttribute("CurrentUser");
PostDao d=new PostDao(ConnectionProvider.getConnection());
 int cid=Integer.parseInt(request.getParameter("cid"));
  List<Post> posts=null;
  if(cid==0){
	posts=d.getAllPosts();}
  else{
	  posts=d.getPostsByCatid(cid);}
  if(posts.size()==0){
	  out.println("<h2 class='text-center'>No Posts from this Category,if you want to post then your Welcome</h2>");
	  return;
  }

  for(Post p:posts){
%>
  <div class="row"> 
  <div class="col-md-12 mt-3">
  <div class="card bg-light">
   <img class="card-img-top" src="img/<%=p.getPpic() %>" alt="Card image cap">
   <div class="card-body">
   <b><%=p.getPtitle() %></b>
   <p><%=p.getPcontent()%></p>
   <!--  <pre><%=p.getPcode() %></pre>-->
   </div>
    <div class="card-footer text-center primary-background">
    <%LikeDao ld=new LikeDao(ConnectionProvider.getConnection()); %>
     <a href="#!" class=" btn btn-info"> <i class="fa fa-thumbs-o-up"><span class="like-counter"><%=ld.countLikesOnPost(p.getPid()) %></span></i></a>
     <a href="show_full.jsp?post_id=<%=p.getPid() %>" class="btn btn-info btn-sm">Read more...</a>
      <a href="#!" class="btn btn btn-info "> <i class="fa fa-commenting-o"><span></span></i></a>
    </div>
  </div>
  </div>
  </div> 
<%
  }
%>

