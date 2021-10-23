use bookstore;

/* 4 простые команды */
select title from books where category = 'Фентези';

select delivery_date from orders where order_cost > 1000.0 order by delivery_date desc;

select discount_status, count(full_name) as num from clients group by discount_status order by discount_status desc;

select type, count(id) as num from spaces group by type order by num desc;

/* 3 команды с join двух таблиц */
select clients_id, full_name, sum(total_count) as total from orders join clients on orders.clients_id = clients.id group by clients_id order by clients_id;

select category, sum(book_count) as b_count from books join books_has_orders on books.ISBN = books_has_orders.books_ISBN group by category order by b_count desc;

select employees_id, full_name, sum(total_count) as t_count from employees join orders on employees.id = orders.employees_id group by employees_id order by t_count desc;

/* 2 команды с join двух и более таблиц */
select clients_id, full_name, sum(book_count) as num from books join books_has_orders on books.ISBN = books_has_orders.books_ISBN join orders on orders.id = books_has_orders.orders_id join clients on orders.clients_id = clients.id where (publish_year >= 2010 and category != 'Фентези') group by clients_id order by num desc;

select employees_id, full_name, sum(book_count) as num from books join books_has_orders on books.ISBN = books_has_orders.books_ISBN join orders on orders.id = books_has_orders.orders_id join employees on employees.id = orders.employees_id where (publish_year >= 2010 and delivery_status = 'delivered') group by employees_id order by num desc;

/* 2 команды с вложенными запросами */
select delivery_status, count(delivery_status) as num from (select * from orders where delivery_cost >= 300.0) as t_table group by delivery_status order by num;

select orders_id, sum(book_count) as num from (select orders_id, book_count from books_has_orders where position_cost >= 500.0) as t_table group by orders_id order by orders_id;


