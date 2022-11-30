-- https://datalemur.com/questions/pizzas-topping-cost

SELECT 
a.topping_name||','||b.topping_name||','||c.topping_name as pizza,
a.ingredient_cost+b.ingredient_cost+c.ingredient_cost as total_cost
FROM pizza_toppings a 
join pizza_toppings b
on a.topping_name < b.topping_name
join pizza_toppings c
on b.topping_name < c.topping_name
order by 2 desc , 1 asc
;