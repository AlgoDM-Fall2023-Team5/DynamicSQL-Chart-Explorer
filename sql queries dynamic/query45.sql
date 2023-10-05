/*Report the total web sales for customers in specific zip codes, cities, 
counties or states, or specific items for a given year and quarter. .
Qualification Substitution Parameters:
 QOY.01 = 2
 YEAR.01 = 2001 */
select  ca_state, sum(ws_sales_price)
 from web_sales, customer, customer_address, date_dim, item
 where ws_bill_customer_sk = c_customer_sk
 	and c_current_addr_sk = ca_address_sk
 	and ws_item_sk = i_item_sk
 	and ( substr(ca_zip,1,5) in ('85669', '86197','88274','83405','86475', '85392', '85460', '80348', '81792')
 	      or
 	      i_item_id in (select i_item_id
                             from item
                             where i_item_sk in (2, 3, 5, 7, 11, 13, 17, 19, 23, 29)
                             )
 	    )
 	and ws_sold_date_sk = d_date_sk
 	and d_qoy = {0} and d_year = {1}
 group by  ca_state
 order by  ca_state
 limit 100;