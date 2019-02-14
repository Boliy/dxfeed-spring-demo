TRUNCATE TABLE `ai_coin_count`;
-- update ai_coin_detail set flag = 1 where status = 1;
/*
--                     D H M
GNT/USDT:CXPLNX   -- x 0 2 0
REP/USDT:CXPLNX   -- x 0 1 0
XRP/USDT:CXPLNX   -- x 0 0 1~13
BTC/USDT:CXPLNX   -- x 0 0 1~4
ETH/USDT:CXPLNX   -- x 0 0 1~11
KNC/USDT:CXPLNX   -- x 0 2 0 
BNT/USDT:CXPLNX   -- x 0 2 0
DOGE/USDT:CXPLNX  -- x 0 0 1~30 
ETC/USDT:CXPLNX   -- x 0 0 1~10
LTC/USDT:CXPLNX   -- x 0 0 1~10
QTUM/USDT:CXPLNX  -- x 0 2 0
BAT/USDT:CXPLNX   -- x 0 2 0
LOOM/USDT:CXPLNX  -- x 0 2 0  
SC/USDT:CXPLNX    -- x 0 2 0
ZRX/USDT:CXPLNX   -- x 0 2 0
EOS/USDT:CXPLNX   -- x 0 0 1~30
LSK/USDT:CXPLNX   -- x 0 2 0
SNT/USDT:CXPLNX   -- x 0 2 0
ZEC/USDT:CXPLNX   -- x 0 0 1~30
NXT/USDT:CXPLNX   -- x 0 0 1~60
STR/USDT:CXPLNX   -- x 0 0 1~20   
DASH/USDT:CXPLNX  -- x 0 0 1~30  
XMR/USDT:CXPLNX   -- x 0 0 1~30  
MANA/USDT:CXPLNX  -- x 0 0 1~60
*/
/**-----------------------USDT-----------------------------*/
SELECT symbol FROM ai_coin_detail WHERE STATUS = 1 AND flag = 1 AND refPayCoin = 'USDT' ORDER BY symbol;
SELECT COUNT(1) FROM ai_coin_count;
SELECT id,symbol, price,FROM_UNIXTIME(ctime) FROM ai_coin_count WHERE symbol = 'DOGE/USDT:CXPLNX';
SELECT id,symbol, price,FROM_UNIXTIME(ctime) FROM ai_coin_count 
WHERE 
symbol IN 
	(SELECT symbol FROM ai_coin_detail WHERE STATUS = 1 AND flag = 1 AND refPayCoin = 'USDT' ORDER BY symbol)
GROUP BY symbol,price ORDER BY symbol,price;

SELECT a.symbol, COUNT(1) AS 'count' FROM (SELECT id,symbol, price,FROM_UNIXTIME(ctime) FROM ai_coin_count 
WHERE 
symbol IN 
	(SELECT symbol FROM ai_coin_detail WHERE STATUS = 1 AND flag = 1 AND refPayCoin = 'USDT' ORDER BY symbol)
GROUP BY symbol,price ORDER BY symbol,ctime) a GROUP BY a.symbol;

/**-----------------------ETH-----------------------------*/
SELECT symbol FROM ai_coin_detail WHERE STATUS = 1 AND flag = 1 AND refPayCoin = 'ETH' ORDER BY symbol;
SELECT COUNT(1) FROM ai_coin_count;
SELECT id,symbol, price,FROM_UNIXTIME(ctime) FROM ai_coin_count WHERE symbol = 'MGO/ETH:CXETHF';
SELECT id,symbol, price,FROM_UNIXTIME(ctime) FROM ai_coin_count WHERE symbol IN (SELECT symbol FROM ai_coin_detail WHERE STATUS = 1 AND flag = 1 AND refPayCoin = 'ETH' ORDER BY symbol)
GROUP BY symbol,price ORDER BY symbol,ctime;

SELECT a.symbol, COUNT(1) AS 'count' FROM (SELECT id,symbol, price,FROM_UNIXTIME(ctime) FROM ai_coin_count 
WHERE 
symbol IN 
	(SELECT symbol FROM ai_coin_detail WHERE STATUS = 1 AND flag = 1 AND refPayCoin = 'ETH' ORDER BY symbol)
GROUP BY symbol,price ORDER BY symbol,ctime) a GROUP BY a.symbol;