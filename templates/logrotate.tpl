# File maintained by puppet, do not modify

<%= scope.lookupvar('log') %> {
<% scope.lookupvar('options').each do |opt| -%> <%= opt %>
<% end -%>
<% if scope.lookupvar('postrotate') != "NONE" -%> postrotate
<% scope.lookupvar('postrotate').each do |post| -%>   <%= post %>
<% end -%>
 endscript
<% end -%>
}