
@paintIt = (element, backgroundColor, textColor) ->
  element.style.backgroundColor = backgroundColor
  if textColor?
    element.style.color = textColor

@additem = ()-> 
  item = document.getElementById("item");
  quantity = document.getElementById("quan").value;
  order = document.getElementById("items");
  #value = item.options[item.selectedIndex].value;
  name = item.options[item.selectedIndex].text;
  if(order.value)
   order.value += ",{product: \""+name+"\", quantity: "+quantity+"}";
  else
   order.value += "{product: "+name+", quantity: "+quantity+"}";



	# address: string, items: hash
	# items = [
	# 	{product: Product, quantity: integer},
	# 	{product: Product, quantity: integer}
	# ]