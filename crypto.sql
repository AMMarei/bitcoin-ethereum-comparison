-- Query to select daily closing prices of Bitcoin and Ethereum
SELECT bitcoin.day, COALESCE(bitcoin.closing_price, 0) AS bitcoin_closing, COALESCE(ethereum.closing_price, 0) AS ethereum_closing
FROM bitcoin
INNER JOIN ethereum
ON bitcoin.day = ethereum.day
ORDER BY 1 ASC


-- Query to calculate ratio of daily closing prices of Bitcoin and Ethereum
SELECT day, ROUND(bitcoin_closing/ethereum_closing, 2) AS bitcoin_ethereum_ratio
FROM(
	SELECT bitcoin.day, COALESCE(bitcoin.closing_price, 0) AS bitcoin_closing, COALESCE(ethereum.closing_price, 0) AS ethereum_closing
	FROM bitcoin
	INNER JOIN ethereum
	ON bitcoin.day = ethereum.day
	ORDER BY 1 ASC
	) AS sub_1
ORDER BY 1 ASC


-- Create a view of the ratio of daily closing prices of Bitcoin to Ethereum
CREATE VIEW bitcoin_ethereum_ratio
AS	(
	SELECT day, ROUND(bitcoin_closing/ethereum_closing, 2) AS bitcoin_ethereum_ratio
	FROM(
		SELECT bitcoin.day, COALESCE(bitcoin.closing_price, 0) AS bitcoin_closing, COALESCE(ethereum.closing_price, 0) AS ethereum_closing
		FROM bitcoin
		INNER JOIN ethereum
		ON bitcoin.day = ethereum.day
		ORDER BY 1 ASC
		) AS sub_1
	ORDER BY 1 ASC
	)


-- Query to retrieve daily trading volume of Bitcoin and Ethereum in USD
SELECT bitcoin.day, bitcoin.volume AS bitcoin_volume_USD, ethereum.volume AS ethereum_volume_USD
FROM bitcoin
JOIN ethereum
ON bitcoin.day = ethereum.day
ORDER BY 1 ASC


-- Create a view with the daily volumes of Bitcoin and Ethereum in USD
CREATE VIEW daily_volume_USD
AS	(
	SELECT bitcoin.day, bitcoin.volume AS bitcoin_volume_USD, ethereum.volume AS ethereum_volume_USD
	FROM bitcoin
	JOIN ethereum
	ON bitcoin.day = ethereum.day
	ORDER BY 1 ASC
	)


-- Query to retrieve daily closing price of Bitcoin
SELECT day, ROUND(closing_price, 2) AS closing_price
FROM bitcoin
ORDER BY 1 ASC


-- Create a view with daily closing price of Bitcoin
CREATE VIEW bitcoin_price_change
AS	(
	SELECT day, ROUND(closing_price, 2) AS closing_price
	FROM bitcoin
	ORDER BY 1 ASC
	)


-- Query to retrieve daily closing price of Ethereum
SELECT day, ROUND(closing_price, 2) AS closing_price
FROM ethereum
ORDER BY 1 ASC


-- Create a view with daily closing price of Ethereum
CREATE VIEW ethereum_price_change
AS	(
	SELECT day, ROUND(closing_price, 2) AS closing_price
	FROM ethereum
	ORDER BY 1 ASC
	)

