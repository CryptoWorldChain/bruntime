ALTER TABLE `cwv_sys_setting`
MODIFY COLUMN `value`  varchar(1800) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL AFTER `name`;


update cwv_sys_setting set value='加密世界公告
尊敬的用户大家好，关于加密世界游戏目前发生的充值、提现、游戏BUG等问题，我们已经注意到，并正在应对出现的问题，我们希望优先说明的是，所有用户在加密世界内的资产都将得到妥善的保护，您的一切数字资产都将是安全的，以下是我们对于目前加密世界中出现的主要问题的解答。

1.关于充值延迟到账问题：
由于目前CWV充值是经过ETH网络映射进入CWV主网，充提操作需要经过ETH网络二次确认到账才进入CWV主网安全屋映射，由于ETH网路拥堵，存在一定时间差，我们正加紧优化重提流程，请大家耐心等待，如长时间未到账，可联系官方微信客服反馈。

2.关于正式上线前使用100,000 CWV抽取房产的用户补偿说明：
在之前使用了100,000 CWV抽取房产的用户，我们将在一周内进行补偿，退还差额到您的游戏内账户余额。

3.关于加密世界目前存在的bug问题：
我们已经定位BUG源头与成因，正在加紧修复中，请大家耐心等待。

4.关于目前游戏其他问题的说明：
目前加密世界正在遭到黑客攻击，致使服务器负载大量增加，攻击者堵塞合约，导致了游戏功能无法正常运行的问题，我们正在积极应对，优化流程与逻辑避免攻击影响，尽快解决该问题。

5.关于提现问题：
目前加密世界游戏正在遭受黑客攻击，为了保障链上资产安全，我们暂停提现通道，待系统进一步稳定后开放提现。

加密世界客服微信：CryptoWorldVIP_

加密世界团队
2018年11月21日
' where name='sys_notice'