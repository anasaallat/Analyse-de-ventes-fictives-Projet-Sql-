-- =====================================================
-- 1. Voir les données
-- =====================================================

SELECT * FROM sales;


-- =====================================================
-- 2. Chiffre d'affaires total
-- =====================================================

SELECT SUM(Sales) AS total_revenue
FROM sales;


-- =====================================================
-- 3. Panier moyen
-- =====================================================

SELECT AVG(Sales) AS average_order
FROM sales;


-- =====================================================
-- 4. Top produits
-- =====================================================

SELECT Product,
       SUM(Sales) AS total_sales
FROM sales
GROUP BY Product
ORDER BY total_sales DESC;


-- =====================================================
-- 5. Ventes par catégorie
-- =====================================================

SELECT Category,
       SUM(Sales) AS total_sales
FROM sales
GROUP BY Category
ORDER BY total_sales DESC;


-- =====================================================
-- 6. Ventes par mois
-- =====================================================

SELECT strftime('%m', Order_Date) AS month,
       SUM(Sales) AS total_sales
FROM sales
GROUP BY month
ORDER BY month;


-- =====================================================
-- 7. Top clients
-- =====================================================

SELECT Customer,
       SUM(Sales) AS total_spent
FROM sales
GROUP BY Customer
ORDER BY total_spent DESC;


-- =====================================================
-- 8. Nombre de commandes
-- =====================================================

SELECT COUNT(*) AS total_orders
FROM sales;

SELECT 
    (SELECT SUM(Sales) FROM sales) AS total_revenue,
    (SELECT AVG(Sales) FROM sales) AS average_order,
    (SELECT COUNT(*) FROM sales) AS total_orders,
    (SELECT MAX(Sales) FROM sales) AS max_sale,
    (SELECT MIN(Sales) FROM sales) AS min_sale;