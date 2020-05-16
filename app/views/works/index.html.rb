<div class="spotlight">
    <h1>Media Spotlight: why wont @work.spotlight.title work :(</h1>   
    <h3> insert votes - @work.spotlight.genre <h3>
</div>
<div class="col-sm">Top Movies
    <ul>
        <% work_group = @work.where("category = ?", "movie")%>
        <% work_group.each do |movie| %>
        <li><%= movie.title %></li>
        <% end %>
    </ul>
</div>

<div class="col-sm">Top Books
    <ul>
        <% work_group = @work.where("category = ?", "book")%>
        <% work_group.each do |movie| %>
        <li><%= movie.title %></li>
        <% end %>
    </ul>
</div> 

<div class="col-sm">Top Albums
    <ul>
        <% work_group = @work.where("category = ?", "album")%>
        <% work_group.each do |movie| %>
        <li><%= movie.title %></li>
        <% end %>
    </ul>
</div>

