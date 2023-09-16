SELECT ci.city_name, pr.product_name, ROUND(SUM(ii.line_total_price), 2) AS tot
FROM city ci
JOIN customer cu ON ci.id = cu.city_id
JOIN invoice i ON cu.id = i.customer_id
JOIN invoice_item ii ON i.id = ii.invoice_id
JOIN product pr ON ii.product_id = pr.id
GROUP BY ci.city_name, pr.product_name
ORDER BY tot DESC, ci.city_name, pr.product_name;
