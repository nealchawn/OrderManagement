
@paintIt = (element, backgroundColor, textColor) ->
  element.style.backgroundColor = backgroundColor
  if textColor?
    element.style.color = textColor

@addItem = ()-> 
  item = document.getElementById("item");
  quantity = document.getElementById("quan").value;
  order_pseudo = document.getElementById("items");
  order = document.getElementById("items0");
  item_id = item.options[item.selectedIndex].value;
  name = item.options[item.selectedIndex].text;
  if(order.value)
   order_pseudo.value += ",{product: \""+name+"\", quantity: "+quantity+"}";
   order.value += ",{product: "+item_id+", quantity: "+quantity+"}";
  else
   order_pseudo.value = "{product: \""+name+"\", quantity: "+quantity+"}";
   order.value = "{product: "+item_id+", quantity: "+quantity+"}";

@addItem_yiannis = ->
  item_id = item.options[item.selectedIndex].value;
  quantity = document.getElementById("quan").value;
  $('#order_form').append "<input type='hidden' name='order[item][product]' value='#{item_id}'/>"
  $('#order_form').append "<input type='hidden' name='order[item][quantity]' value='#{quantity}'/>"


	# address: string, items: hash
	# items = [
	# 	{product: Product, quantity: integer},
	# 	{product: Product, quantity: integer}
	# ]