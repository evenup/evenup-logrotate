# File maintained by puppet, do not modify

<%= scope.lookupvar('log') %> {
<% scope.lookupvar('options').each do |opt| -%> <%= opt %>
<% end -%>
<% if scope.lookupvar('postrotate') != "NONE" -%> postrotate
<%   if scope.lookupvar('postrotate').is_a?(Array) -%>
<%     scope.lookupvar('postrotate').each do |post| -%>
  <%= post %>
<%     end -%>
<%   else -%>
  <%=  scope.lookupvar('postrotate') %>
<%   end -%>
endscript
<% end -%>
}